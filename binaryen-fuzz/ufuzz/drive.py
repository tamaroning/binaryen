#!/usr/bin/env python3
"""ufuzz worker.

Each iteration builds one module from one of four sources
  gen   the typed generator (gen.py) + type-preserving mutations (mut.py)
  mix   generator module with subtrees spliced in from the seed pool, then mutated
  seed  a harvested seed module (seeds.py), mutated with pool/module splices
  raw   wasm-opt -ttf / wasm-smith / real compiler output with every feature
        V8 runs (floats, SIMD, tables, exceptions, ...)
and runs 2-3 random wasm-opt configurations on it.

Oracles
  A  exwasm tv: every function that exwasm proves equivalent to itself
     (self-validation filter) and that a configuration changed is validated
     against the optimized module.  counterexample = bug candidate;
     unsupported / unknown / error are counted separately.
  B  wasm-opt crash (assertion, signal, timeout), invalid output
     (wasm-tools validate), and V8 differential (v8diff.js).  Applied to raw
     modules, to the full module whenever the self-validation filter dropped
     functions, and (rate `v8_rate`) to the exwasm-covered module as a
     cross-check.

usage: drive.py WORKDIR WORKER_ID SEED0 [SECONDS]

Runs until SECONDS elapse (default: forever), WORKDIR/STOP or ufuzz/STOP
exists, or SIGTERM.  Output (append-only, flushed per line):
  WORKDIR/results.jsonl   one line per (function, config) for oracle A and
                          per (module, config) for oracle B
  WORKDIR/bad/<id>/       findings, copied as soon as they are found
  WORKDIR/stats.json      snapshot (tmp + rename) at least every 4 minutes
"""
import glob
import hashlib
import json
import os
import random
import re
import shutil
import signal
import subprocess
import sys
import time
import traceback

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
import gen  # noqa: E402
import mut  # noqa: E402
import pool as poolm  # noqa: E402
from wmod import (LOADS, STORES, TypeCtx, Typer, Unsupported, family, func_features, is_ref,  # noqa: E402
                  mem_imm, parse_module)

# ---------------------------------------------------------------- configs
# single passes, including ones no -O level runs
SINGLE = [
    "optimize-instructions", "precompute", "precompute-propagate", "remove-unused-brs", "heap2local",
    "simplify-locals", "simplify-locals-nostructure", "simplify-locals-notee", "simplify-locals-notee-nostructure",
    "simplify-locals-nonesting", "local-cse", "code-folding", "code-pushing", "vacuum", "merge-blocks", "dce",
    "rse", "coalesce-locals", "coalesce-locals-learning", "merge-locals", "heap-store-optimization",
    "pick-load-signs", "constraint-analysis", "optimize-casts", "licm", "untee", "flatten", "ssa", "ssa-nomerge",
    "reorder-locals", "local-subtyping", "gufa", "gufa-optimizing", "gufa-cast-all", "avoid-reinterprets",
    "dealign", "alignment-lowering", "signext-lowering", "remove-unused-names", "tuple-optimization",
    "once-reduction", "simplify-globals", "simplify-globals-optimizing", "const-hoisting", "dae-optimizing", "dae2",
    "duplicate-function-elimination", "optimize-stack-ir", "cfp", "cfp-reftest", "gsi", "type-refining",
    "type-refining-gufa", "type-ssa", "memory64-lowering", "multi-memory-lowering", "i64-to-i32-lowering",
    "merge-similar-functions", "monomorphize", "monomorphize-always", "outlining", "rereloop", "dfo",
    "optimize-added-constants", "optimize-added-constants-propagate", "inlining", "inlining-optimizing",
    "directize", "remove-unused-module-elements", "remove-unused-nonfunction-module-elements",
    "propagate-globals-globally", "global-refining", "minimize-rec-groups", "reorder-globals", "reorder-functions",
    "poppify", "memory-packing", "translate-to-exnref", "generate-global-effects",
]
# passes that need a flag or a preceding pass
PREREQ = {"optimize-added-constants": ["--low-memory-unused"],
          "optimize-added-constants-propagate": ["--low-memory-unused"],
          "dfo": ["--flatten"], "rereloop": ["--flatten"], "optimize-stack-ir": ["--generate-stack-ir"]}
# flags that let a pass assume something about the program: a
# counterexample under them is "suspect", not a bug candidate
ASSUME = {"--low-memory-unused", "--closed-world", "--traps-never-happen", "--ignore-implicit-traps",
          "--zero-filled-memory", "--fast-math"}
# lowering / module-level passes that change what tv compares (types,
# memories, signatures): counterexamples are suspect
LOWERING = {"memory64-lowering", "multi-memory-lowering", "i64-to-i32-lowering", "type-ssa",
            "merge-similar-functions", "monomorphize", "monomorphize-always", "outlining", "type-refining",
            "type-refining-gufa", "cfp", "cfp-reftest", "gsi", "global-refining", "minimize-rec-groups",
            "poppify"}
# change the JS-visible interface: no V8 differential, crash/validity only
V8_SKIP = {"i64-to-i32-lowering", "multi-memory-lowering"}
# closed-world passes: only under --closed-world, which changes what an
# export may assume, so crash/validity oracle only
CLOSED = ["abstract-type-refining", "remove-unused-types", "signature-pruning", "signature-refining",
          "unsubtyping", "type-merging", "gto", "gufa", "type-refining", "cfp", "gsi"]
SEQ_POOL = ["optimize-instructions", "precompute-propagate", "remove-unused-brs", "heap2local", "simplify-locals",
            "simplify-locals-nostructure", "local-cse", "code-folding", "code-pushing", "vacuum", "merge-blocks",
            "dce", "rse", "coalesce-locals", "merge-locals", "heap-store-optimization", "pick-load-signs",
            "constraint-analysis", "optimize-casts", "licm", "untee", "flatten", "ssa-nomerge", "local-subtyping",
            "gufa", "precompute", "dealign", "optimize-added-constants", "inlining-optimizing", "dae-optimizing",
            "simplify-globals-optimizing", "once-reduction", "directize", "tuple-optimization", "avoid-reinterprets",
            "rereloop", "merge-similar-functions", "duplicate-function-elimination"]
OLEVELS = [["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"], ["-O3", "--converge"], ["-O2", "-O2"],
           ["-O3", "--generate-stack-ir", "--optimize-stack-ir"], ["-O1", "--flatten", "-O1"],
           ["--generate-global-effects", "-O3"], ["-O4", "--inlining-optimizing", "-O4"]]


def pass_args(p):
    return PREREQ.get(p, []) + ["--" + p]


def pick_config(r):
    """(args, kind): kind is "single", "seq", "olevel" or "closed" """
    x = r.random()
    pre = []
    if x < .75 and r.random() < .35:
        # levels change what many passes do (e.g. shrink-level in inlining, OI)
        pre = ["--optimize-level=%d" % r.randint(0, 4), "--shrink-level=%d" % r.randint(0, 2)]
    if x < .42:
        p = r.choice(SINGLE)
        if p in LOWERING and r.random() < .6:
            p = r.choice(SINGLE)
        return pre + pass_args(p), "single"
    if x < .72:
        seq = [r.choice(SEQ_POOL) for _ in range(r.randint(2, 5))]
        out = list(pre)
        if r.random() < .2:
            out.append("--generate-global-effects")
        for p in seq:
            for y in pass_args(p):
                if y.startswith("--low") and y in out:
                    continue
                out.append(y)
        return out, "seq"
    if x < .78:
        return ["--closed-world"] + [("--" + p) for p in r.sample(CLOSED, r.randint(1, 3))] + \
            (["-O2"] if r.random() < .5 else []), "closed"
    return list(r.choice(OLEVELS)), "olevel"


def passes_of(c):
    out = [x[2:] for x in c if x.startswith("--") and not x.startswith("--low") and "=" not in x
           and x not in ("--closed-world", "--converge")]
    out += [x for x in c if re.fullmatch(r"-O[0-4sz]", x)]
    return out


def suspect_reason(c, passes=None):
    a = sorted(set(c) & ASSUME)
    lw = sorted((set(passes_of(c)) | set(passes or ())) & (LOWERING | MODULE_FACTS))
    return ",".join(a + lw)


# Passes that use facts about the whole module (a global no reachable code
# writes is constant), which the per-function comparison cannot know.
MODULE_FACTS = {"simplify-globals", "simplify-globals-optimizing", "propagate-globals-globally"}
# A counterexample that is the documented behaviour of the pass: an unaligned
# store is split into byte stores, so a store that traps out of bounds has
# already written the bytes before the boundary (confirmed with V8).
KNOWN_CEX = {frozenset(["alignment-lowering"]): "known: alignment-lowering writes part of a trapping store"}


def expanded_passes(cf, c, mb):
    """the passes a configuration runs, in order (-O levels expanded)"""
    rc, out = run([cf["wasm_opt"]] + cfg.FEATURES + c + [mb, "-o", "/dev/null"], 120,
                  env=dict(os.environ, BINARYEN_PASS_DEBUG="1"))
    return re.findall(r"running pass: (\S+?)\.\.\.", out) if rc == 0 else []


# ---------------------------------------------------------------- helpers
def run(cmd, timeout, env=None):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout, env=env)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def norm(detail):
    d = re.sub(r"\d+", "N", (detail or "").strip())
    return d[:90]


def split_printed(text):
    """Binaryen --print text of a nameless binary -> {export name: body
    text without type annotations}"""
    bodies = {}
    for part in re.split(r"\n(?= \(func )", text)[1:]:
        m = re.match(r" \(func (\S+)", part)
        body = re.sub(r"\(type \$[^)\s]*\) ?", "", part)
        bodies[m.group(1)] = body.rstrip().rstrip(")")
    out = {}
    for m in re.finditer(r'\(export "([^"]+)" \(func (\S+)\)\)', text):
        if m.group(2) in bodies:
            out[m.group(1)] = bodies[m.group(2)]
    return out


def tv(cf, a, b, func=None):
    cmd = [cf["exwasm"], "--il", cf["il"], "tv", a, b, "--smt-timeout-ms", str(cf["smt_timeout_ms"])]
    if func:
        cmd += ["--func", func]
    t0 = time.time()
    rc, out = run(cmd, cf["tv_timeout_s"])
    res = {}
    if rc == "timeout":
        return None, "tv process timeout", time.time() - t0, out
    for line in out.splitlines():
        p = line.split("\t")
        if len(p) >= 3 and p[1] in ("equivalent", "bounded", "counterexample", "unsupported", "unknown"):
            ms = float(p[2].split()[0]) if p[2].split() else 0
            res[p[0]] = (p[1], p[3] if len(p) > 3 else "", ms)
    if not res:
        msg = [ln for ln in out.splitlines() if ln.startswith("error")] or [out.strip()[-200:]]
        return None, "tv module error: " + msg[0][:150], time.time() - t0, out
    return res, None, time.time() - t0, out


def crash_sig(out, rc):
    """(category, signature) of a failed wasm-opt run"""
    if rc == "timeout":
        return "timeout", "timeout"
    lines = [ln for ln in out.splitlines() if ln.strip()]
    for ln in lines:
        if "Assertion" in ln or "UNREACHABLE" in ln or "terminate called" in ln:
            s = ln.split("/src/")[-1]
            return "assert", re.sub(r"0x[0-9a-f]+", "X", s)[:160]
    if isinstance(rc, int) and rc < 0:
        return "signal", "signal %d: %s" % (-rc, norm(lines[-1] if lines else "")[:100])
    for ln in lines:
        if ln.startswith("Fatal") or "wasm-validator error" in ln:
            return "fatal", norm(ln.split("/src/")[-1])[:140]
    return "other", norm(lines[-1] if lines else str(rc))[:140]


KNOWN_CRASH = [("Unsupported instruction for Flatten: BrOn", "known: Flatten on br_on_*"),
               ("ConstraintAnalysis", "known?: ConstraintAnalysis assertion (#9109)")]


def known_crash(out):
    for pat, name in KNOWN_CRASH:
        if pat in out:
            return name
    return None


def func_feats(m, f):
    fams, feats = func_features(f)
    mem_at = {mm[0]: mm[1] for mm in m.memories}
    first = m.memories[0][0] if m.memories else None
    used = set()
    ops = {}
    for b in f.body:
        for n in b.walk():
            if n.op in ("then", "else"):
                continue
            ops[n.op] = ops.get(n.op, 0) + 1
            if n.op in LOADS or n.op in STORES or n.op in ("memory.size", "memory.grow", "memory.fill", "memory.copy"):
                used.add(mem_imm(n) or first)
    if any(mem_at.get(u) == "i64" for u in used):
        feats.add("mem64")
    if len(used) > 1 or (used and first not in used):
        feats.add("multimem")
    if any(is_ref(t) for _, t in f.params):
        feats.add("refparam")
    return fams, sorted(feats), ops


class Worker:
    def __init__(self, wd, wid, seed0):
        self.wd, self.wid = wd, wid
        self.r = random.Random(seed0)
        self.seed = seed0
        os.makedirs(wd + "/bad", exist_ok=True)
        self.res = open(wd + "/results.jsonl", "a", buffering=1)
        self.stats = {"worker": wid, "modules": 0, "modules_b": 0, "invalid": {}, "input_rejected": {},
                      "funcs_in": 0, "funcs_dropped": 0, "tv_runs": 0, "verdicts": {}, "unsupported": {},
                      "unknown": {}, "error": {}, "input_unsupported": {}, "cex": 0, "cex_suspect": 0,
                      "per_config": {}, "per_pass": {}, "per_kind": {}, "rows": {}, "mutators": {}, "sources": {},
                      "families": {}, "ops": {}, "feature_combos": {}, "feat_pairs": {}, "nfeats": {},
                      "families_b": {}, "oracle_b": {}, "crash_sigs": {}, "v8_diffs": 0, "invalid_output": 0,
                      "started": time.time()}
        self.last_snap = 0
        self.nbad = len(glob.glob(wd + "/bad/*"))
        self.rolling = []
        self.seed_pool = []
        self.seed_mods = {}
        self.raw_files = []
        self.load_seeds(cfg.load()["seeds"])
        self.stop = False
        signal.signal(signal.SIGTERM, self.on_term)
        signal.signal(signal.SIGINT, self.on_term)

    def on_term(self, *a):
        self.stop = True

    def load_seeds(self, sd):
        for p in glob.glob(sd + "/pool/*.jsonl"):
            with open(p) as f:
                ents = [json.loads(line) for line in f]
            self.r.shuffle(ents)
            self.seed_pool += ents[:4000]
        for d in glob.glob(sd + "/mods/*"):
            fs = sorted(glob.glob(d + "/*.wat"))
            if fs:
                self.seed_mods[os.path.basename(d)] = fs
        B = "/home/tamaron/work/superwasm/benchmarks"
        self.raw_files = [f for f in glob.glob(B + "/**/*.wasm", recursive=True)
                          if os.path.getsize(f) <= 1500 * 1024 and "known-bugs" not in f]
        self.raw_files += glob.glob("/home/tamaron/work/binaryen/test/*.wasm")

    # ------------------------------------------------ feedback
    def row_weights(self):
        w = {}
        for k, v in self.stats["rows"].items():
            n, bad = v.get("n", 0), v.get("unsup", 0)
            if n >= 20:
                w[k] = max(0.15, 1.0 - 1.5 * bad / n)
        return w

    def mut_weights(self):
        w = {}
        for k, v in self.stats["mutators"].items():
            k0 = k.split(":")[0]
            n = v.get("tv", 0)
            if n >= 20:
                ch = v.get("changed", 0) / n
                inv = v.get("invalid", 0) / max(1, v.get("applied", 1))
                w[k0] = max(0.2, (0.5 + ch) * (1 - inv))
        return w

    def bump(self, d, k, field, n=1):
        e = d.setdefault(k, {})
        e[field] = e.get(field, 0) + n

    def cnt(self, d, k, n=1):
        d[k] = d.get(k, 0) + n

    # ------------------------------------------------ modules
    def build(self, cf, src):
        r = self.r
        nmut = r.randint(*cf["mutations"])
        pool = self.rolling + self.seed_pool
        if src == "seed":
            tag = r.choice(sorted(self.seed_mods))
            path = r.choice(self.seed_mods[tag])
            m = parse_module(open(path).read())
            src_tag = "seed:" + tag
            done = mut.mutate(r, m, pool, nmut, self.mut_weights())
            for f in m.funcs:
                f.meta["rows"] = {}
        else:
            m = gen.gen_module(self.seed, self.row_weights())
            src_tag = src
            done = []
            if src == "mix":
                mu = mut.Mut(r, m, self.seed_pool)
                for _ in range(r.randint(1, 3)):
                    f = r.choice(m.funcs)
                    try:
                        mut.type_func(m, f)
                        if mu.m_splice(f, pool_only=True):
                            done.append(("splice_pool:" + getattr(mu, "last_src", "?"), f.name))
                    except (Unsupported, ValueError, KeyError, IndexError, TypeError, AttributeError):
                        pass
            done += mut.mutate(r, m, pool, nmut, self.mut_weights())
        for f in m.funcs:
            f.meta["muts"] = [d for d, fn in done if fn == f.name]
            f.meta["src"] = src_tag
            srcs_in = {d.split(":", 1)[1] for d in f.meta["muts"] if d.startswith("splice") and ":" in d}
            f.meta["splice_srcs"] = sorted(srcs_in)
        return m, src_tag, done

    def emit(self, m, path_wat, path_wasm):
        with open(path_wat, "w") as fh:
            fh.write(m.text())
        rc, out = run(["wasm-tools", "parse", path_wat, "-o", path_wasm], 60)
        if rc != 0:
            return False, out
        rc, out = run(["wasm-tools", "validate", "--features", "all", path_wasm], 60)
        return rc == 0, out

    def module_once(self):
        cf = cfg.load()
        r = self.r
        self.seed += 1
        sw = dict(cf["source_weights"])
        if not self.seed_mods:
            sw.pop("seed", None)
        srcs = sorted(sw)
        src = r.choices(srcs, [sw[s] for s in srcs])[0]
        if src == "raw":
            return self.raw_once(cf)
        wd = self.wd
        mid = "%s-%d" % (self.wid, self.seed)
        m, src, done = self.build(cf, src)
        self.bump(self.stats["sources"], src, "modules")
        mw, mb = wd + "/m.wat", wd + "/m.wasm"
        ok, err = self.emit(m, mw, mb)
        for d, _ in done:
            self.bump(self.stats["mutators"], d, "applied")
        if not ok:
            k = norm(err.splitlines()[0] if err else "?")
            self.cnt(self.stats["invalid"], k)
            for d, _ in done:
                self.bump(self.stats["mutators"], d, "invalid")
            self.bump(self.stats["sources"], src, "invalid")
            return
        # self-validation filter: the input against itself
        res, err, _, _ = tv(cf, mb, mb)
        if res is None:
            self.cnt(self.stats["invalid"], "prefilter: " + norm(err))
            self.oracle_b(cf, mid, src, mw, mb, "full", fams=None)
            return
        keep = []
        for f in m.funcs:
            v, det, _ = res.get(f.export, ("missing", "", 0))
            rows = f.meta.get("rows", {})
            for rw in rows:
                self.bump(self.stats["rows"], rw, "n")
            self.stats["funcs_in"] += 1
            # bounded: proved on the inputs within exwasm's unrolling bound
            if v in ("equivalent", "bounded"):
                keep.append(f)
            else:
                self.cnt(self.stats["input_unsupported"], "%s: %s" % (v, norm(det)))
                self.stats["funcs_dropped"] += 1
                for rw in rows:
                    self.bump(self.stats["rows"], rw, "unsup")
                for d in f.meta.get("muts", []):
                    self.bump(self.stats["mutators"], d, "input_unsup")
                self.bump(self.stats["sources"], src, "input_unsup")
        if len(keep) < len(m.funcs):
            # functions exwasm cannot cover go through oracle B in their module
            fw, fb = wd + "/full.wat", wd + "/full.wasm"
            shutil.copy(mw, fw)
            shutil.copy(mb, fb)
            self.oracle_b(cf, mid + "f", src, fw, fb, "full", fams=None)
        if not keep:
            return
        if len(keep) < len(m.funcs):
            m.funcs = keep
            ok, err = self.emit(m, mw, mb)
            if not ok:
                self.cnt(self.stats["invalid"], "after drop: " + norm(err.splitlines()[0] if err else "?"))
                return
        self.stats["modules"] += 1
        finfo = {}
        for f in m.funcs:
            fams, feats, ops = func_feats(m, f)
            finfo[f.export] = (f, feats)
            for fa, c in fams.items():
                self.cnt(self.stats["families"], fa, c)
            for op, c in ops.items():
                self.cnt(self.stats["ops"], op, c)
            self.cnt(self.stats["feature_combos"], "+".join(feats))
            self.cnt(self.stats["nfeats"], str(len(feats)))
            for i, a in enumerate(feats):
                for b in feats[i + 1:]:
                    self.cnt(self.stats["feat_pairs"], a + "&" + b)
            self.bump(self.stats["sources"], src, "funcs")
        self.oracle_a(cf, mid, src, m, mw, mb, finfo)
        self.pool_add(m)

    # ------------------------------------------------ oracle A
    def oracle_a(self, cf, mid, src, m, mw, mb, finfo):
        r = self.r
        wd = self.wd
        rtb = wd + "/rt.wasm"
        rc, out = run([cf["wasm_opt"]] + cfg.FEATURES + [mb, "-o", rtb], 60)
        if rc != 0:
            self.cnt(self.stats["input_rejected"], norm((out.strip().splitlines() or ["?"])[-1]))
            return
        rc, rt = run([cf["wasm_opt"]] + cfg.FEATURES + [rtb, "--print"], 60)
        rtf = split_printed(rt) if rc == 0 else {}
        seen = {}
        for _ in range(r.randint(*cf["configs_per_module"])):
            c, kind = pick_config(r)
            ck = " ".join(c)
            ob = wd + "/o.wasm"
            rc, out = run([cf["wasm_opt"]] + cfg.FEATURES + c + [mb, "-o", ob], 120)
            self.maybe_cov(cf, c, mb, cfg.FEATURES)
            pc = self.stats["per_config"].setdefault(ck, {})
            if rc != 0:
                self.opt_failed(mid, src, ck, c, kind, rc, out, mw, mb, "A")
                continue
            if not self.valid_output(mid, src, ck, mw, mb, ob, "A"):
                continue
            with open(ob, "rb") as fh:
                h = hashlib.sha1(fh.read()).hexdigest()
            rc2, pr = run([cf["wasm_opt"]] + cfg.FEATURES + [ob, "--print"], 60)
            of = split_printed(pr) if rc2 == 0 else {}
            changed = {exp: (rtf.get(exp) != of.get(exp) or exp not in rtf) for exp in finfo}
            self.pass_stats(c, kind, len(changed), sum(changed.values()))
            sus = suspect_reason(c)
            known = None
            if h in seen:
                tvres, terr, secs, tvout = seen[h]
                dup = True
            else:
                dup = False
                if any(changed.values()):
                    tvres, terr, secs, tvout = tv(cf, mb, ob)
                    self.stats["tv_runs"] += 1
                else:
                    tvres, terr, secs, tvout = {}, None, 0, ""
                seen[h] = (tvres, terr, secs, tvout)
                if tvres and any(v[0] == "counterexample" for v in tvres.values()):
                    v8 = self.v8(cf, mb, ob) if not set(passes_of(c)) & V8_SKIP else None
                    ps = expanded_passes(cf, c, mb)
                    sus = suspect_reason(c, ps)
                    known = KNOWN_CEX.get(frozenset(ps or passes_of(c)))
                    extra = {"v8": v8, "suspect": sus, "known": known, "passes": ps,
                             "cex_funcs": sorted(e for e, v in tvres.items() if v[0] == "counterexample")}
                    if known:
                        self.stats["cex_known"] = self.stats.get("cex_known", 0) + 1
                        self.save_bad("cexknown", mid, ck, mw, mb, ob, tvout, finfo, extra)
                    elif sus:
                        self.stats["cex_suspect"] += 1
                        self.save_bad("cexsus", mid, ck, mw, mb, ob, tvout, finfo, extra)
                    else:
                        self.stats["cex"] += 1
                        self.save_bad("cex", mid, ck, mw, mb, ob, tvout, finfo, extra)
                elif any(changed.values()) and r.random() < cf["v8_rate"] and kind != "closed" \
                        and not set(passes_of(c)) & V8_SKIP:
                    # cross-check exwasm with V8 on the same pair
                    self.v8_check(cf, mid, src, ck, mw, mb, ob, "A")
            for exp, (f, feats) in finfo.items():
                if not changed[exp]:
                    v, det, ms = "unchanged", "", 0
                elif tvres is None:
                    v, det, ms = "error", terr, secs * 1000
                else:
                    v, det, ms = tvres.get(exp, ("missing", "", 0))
                if v == "counterexample" and known:
                    v = "counterexample-known"
                elif v == "counterexample" and sus:
                    v = "counterexample-suspect"
                self.record(mid, src, f, feats, ck, kind, v, det, ms, dup, pc)
            self.snapshot()

    def record(self, mid, src, f, feats, ck, kind, v, det, ms, dup, pc):
        st = self.stats
        if not dup:
            self.cnt(st["verdicts"], v)
            self.cnt(pc, v)
            if v in ("unsupported", "unknown", "error"):
                self.cnt(st[v], norm(det))
            for d in f.meta.get("muts", []):
                self.bump(st["mutators"], d, "tv")
                if v != "unchanged":
                    self.bump(st["mutators"], d, "changed")
                if v == "unsupported" or v == "unknown":
                    self.bump(st["mutators"], d, "out_unsup")
        line = {"oracle": "tv", "mid": mid, "fn": f.export, "src": src, "muts": f.meta.get("muts", []),
                "splice_srcs": f.meta.get("splice_srcs", []), "rows": sorted(f.meta.get("rows", {})),
                "feats": feats, "cfg": ck, "kind": kind, "verdict": v,
                "reason": (det or "")[:200] if not v.startswith("counterexample") else (det or "")[:60],
                "ms": round(ms, 1), "dup": dup, "t": round(time.time(), 1)}
        self.res.write(json.dumps(line) + "\n")

    def pass_stats(self, c, kind, nfun, nchanged):
        pp = self.stats["per_pass"]
        for p in passes_of(c) or ["(none)"]:
            e = pp.setdefault(p, {})
            pre = "single_" if kind == "single" else ""
            for k, n in (("runs", 1), ("mod_changed", 1 if nchanged else 0), ("funcs", nfun),
                         ("funcs_changed", nchanged)):
                e[pre + k] = e.get(pre + k, 0) + n
                if pre:
                    e[k] = e.get(k, 0) + n
        self.bump(self.stats["per_kind"], kind, "runs")
        self.bump(self.stats["per_kind"], kind, "funcs", nfun)
        self.bump(self.stats["per_kind"], kind, "funcs_changed", nchanged)

    # ------------------------------------------------ oracle B
    def raw_once(self, cf):
        """a module with every V8-runnable feature, for the crash / validity /
        V8 oracle"""
        r = self.r
        wd = self.wd
        mid = "%s-%d" % (self.wid, self.seed)
        x = r.random()
        rb, raw = wd + "/raw.bin", wd + "/raw0.wasm"
        mb = wd + "/rawin.wasm"
        if x < .5:
            tag = "raw:ttf"
            with open(rb, "wb") as fh:
                fh.write(r.randbytes(r.choice([2000, 8000, 30000, 60000])))
            rc, out = run([cf["wasm_opt"], "-ttf", rb] + cfg.RAW_FEATURES + ["-o", raw], 60)
        elif x < .8:
            tag = "raw:smith"
            with open(rb, "wb") as fh:
                fh.write(r.randbytes(r.choice([4000, 12000, 30000])))
            rc, out = run(["wasm-tools", "smith", "--export-everything", "true", "--max-imports", "0",
                           "--ensure-termination", "--canonicalize-nans", "true", "--allow-start-export", "false",
                           "--min-funcs", "2", "--max-funcs", "12", "--max-instructions", "500",
                           "--max-memory32-bytes", "131072", "--max-memory64-bytes", "131072",
                           "--max-table-elements", "64", "--gc-enabled", r.choice(["true", "false"]),
                           "--exceptions-enabled", "true", "--tail-call-enabled", "true", "--simd-enabled", "true",
                           "--relaxed-simd-enabled", "false", "--threads-enabled", "false",
                           "--shared-everything-threads-enabled", "false", "--wide-arithmetic-enabled", "false",
                           "--custom-page-sizes-enabled", "false", "--memory64-enabled", "true",
                           "--max-memories", "3", "--max-tables", "3", "--extended-const-enabled", "true",
                           "--multi-value-enabled", "true", "--bulk-memory-enabled", "true",
                           "--reference-types-enabled", "true", rb, "-o", raw], 60)
        else:
            tag = "raw:real"
            if not self.raw_files:
                return
            shutil.copy(r.choice(self.raw_files), raw)
            rc = 0
        self.bump(self.stats["sources"], tag, "modules")
        if rc != 0:
            self.bump(self.stats["sources"], tag, "gen_fail")
            return
        # NaN payloads are nondeterministic: denan the input so the V8
        # comparison does not report NaN-bit differences (real modules keep
        # their NaNs; V8 only compares them as "NaN")
        pre = ["--denan"] if tag == "raw:ttf" else []
        rc, out = run([cf["wasm_opt"]] + cfg.RAW_FEATURES + pre + [raw, "-o", mb], 60)
        if rc != 0:
            self.cnt(self.stats["input_rejected"], tag + ": " + norm((out.strip().splitlines() or ["?"])[-1]))
            return
        fams = {}
        rc, pr = run([cf["wasm_opt"]] + cfg.RAW_FEATURES + [mb, "--print"], 60)
        if rc == 0 and len(pr) < 4_000_000:
            for op in re.findall(r"^\s*\(([a-z0-9_]+(?:\.[a-z0-9_]+)?)", pr, re.M):
                fa = family(op)
                if fa not in ("other", "arm"):
                    fams[fa] = fams.get(fa, 0) + 1
        self.oracle_b(cf, mid, tag, None, mb, "raw", fams=fams)

    def oracle_b(self, cf, mid, src, mw, mb, why, fams=None):
        r = self.r
        wd = self.wd
        feats = cfg.RAW_FEATURES
        self.stats["modules_b"] += 1
        self.cnt(self.stats["oracle_b"], "modules:" + why)
        for fa, c in (fams or {}).items():
            self.cnt(self.stats["families_b"], fa, c)
        rtb = wd + "/rtb.wasm"
        rc, out = run([cf["wasm_opt"]] + feats + [mb, "-o", rtb], 60)
        if rc != 0:
            self.cnt(self.stats["input_rejected"], "B: " + norm((out.strip().splitlines() or ["?"])[-1]))
            return
        with open(rtb, "rb") as fh:
            rth = hashlib.sha1(fh.read()).hexdigest()
        for _ in range(r.randint(*cf["configs_per_module"])):
            c, kind = pick_config(r)
            ck = " ".join(c)
            ob = wd + "/ob.wasm"
            rc, out = run([cf["wasm_opt"]] + feats + c + [mb, "-o", ob], 120)
            self.maybe_cov(cf, c, mb, feats)
            if rc != 0:
                v = self.opt_failed(mid, src, ck, c, kind, rc, out, mw, mb, "B")
                self.res.write(json.dumps({"oracle": "b", "mid": mid, "src": src, "why": why, "cfg": ck,
                                           "kind": kind, "verdict": v, "t": round(time.time(), 1)}) + "\n")
                continue
            with open(ob, "rb") as fh:
                oh = hashlib.sha1(fh.read()).hexdigest()
            self.bump(self.stats["per_kind"], "B:" + kind, "runs")
            if oh == rth:
                v, det = "unchanged", ""
            elif not self.valid_output(mid, src, ck, mw, mb, ob, "B"):
                v, det = "invalid", ""
            elif kind == "closed" or set(passes_of(c)) & V8_SKIP:
                v, det = "valid", ""
            else:
                self.bump(self.stats["per_kind"], "B:" + kind, "changed")
                v, det = self.v8_check(cf, mid, src, ck, mw, mb, ob, "B")
            self.cnt(self.stats["oracle_b"], v)
            self.res.write(json.dumps({"oracle": "b", "mid": mid, "src": src, "why": why, "cfg": ck, "kind": kind,
                                       "verdict": v, "reason": det[:200], "t": round(time.time(), 1)}) + "\n")
            self.snapshot()

    def v8(self, cf, a, b):
        rc, out = run([cf["node"], "--experimental-wasm-type-reflection", "--experimental-wasm-exnref",
                       os.path.join(HERE, "v8diff.js"), a, b, str(self.r.randrange(1 << 30))], 60)
        if rc == "timeout":
            return {"same": True, "skip": "timeout"}
        try:
            return json.loads(out.strip().splitlines()[-1])
        except (ValueError, IndexError):
            return {"same": True, "skip": "v8diff failed: " + norm(out[-200:])}

    def v8_check(self, cf, mid, src, ck, mw, mb, ob, oracle):
        res = self.v8(cf, mb, ob)
        if res.get("skip"):
            self.cnt(self.stats["oracle_b"], "v8-skip: " + norm(res["skip"])[:60])
            return "v8-skip", res["skip"]
        if res.get("same"):
            self.cnt(self.stats["oracle_b"], "v8-same" + ("" if oracle == "B" else "(A)"))
            return "v8-same", ""
        detail = res.get("detail", "")
        # engine limits, not semantics: a huge allocation may fail (the
        # optimizer may drop an unused one)
        if "too large" in detail or "out of memory" in detail.lower():
            self.cnt(self.stats["oracle_b"], "v8-limit")
            return "v8-limit", detail
        # a flag that lets the pass assume something about the program
        if set(ck.split()) & ASSUME:
            self.cnt(self.stats["oracle_b"], "v8-diff-assumed")
            self.save_bad("v8sus", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src, "assume": sorted(set(ck.split()) & ASSUME)})
            return "v8-diff-assumed", detail
        self.stats["v8_diffs"] += 1
        self.save_bad("v8diff", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src})
        return "v8-diff", detail

    def valid_output(self, mid, src, ck, mw, mb, ob, oracle):
        rc, out = run(["wasm-tools", "validate", "--features", "all", ob], 60)
        if rc == 0:
            return True
        # wasm-tools may lag Binaryen on a feature: Binaryen's own validator decides
        rc2, out2 = run([cfg.load()["wasm_opt"]] + cfg.RAW_FEATURES + [ob, "-o", "/dev/null"], 60)
        self.stats["invalid_output"] += 1
        sig = "invalid output (%s): %s" % ("both" if rc2 != 0 else "wasm-tools only", norm(out.splitlines()[0] if out else ""))
        n = self.stats["crash_sigs"].get(sig, 0)
        self.cnt(self.stats["crash_sigs"], sig)
        if n < 3:
            self.save_bad("invalid", mid, ck, mw, mb, ob, out, {}, {"oracle": oracle, "src": src, "sig": sig})
        return False

    def opt_failed(self, mid, src, ck, c, kind, rc, out, mw, mb, oracle):
        cat, sig = crash_sig(out, rc)
        kn = known_crash(out)
        key = "%s: %s" % (cat, kn or sig)
        n = self.stats["crash_sigs"].get(key, 0)
        self.cnt(self.stats["crash_sigs"], key)
        pc = self.stats["per_config"].setdefault(ck, {})
        self.cnt(pc, "optfail")
        # Fatal() is Binaryen rejecting a configuration / input on purpose
        if n < (3 if cat in ("assert", "signal", "timeout", "other") and not kn else 1):
            self.save_bad("crash" if cat != "fatal" else "fatal", mid, ck, mw, mb, None, out[-4000:], {},
                          {"oracle": oracle, "src": src, "sig": key, "kind": kind})
        return "crash-" + cat

    def maybe_cov(self, cf, c, mb, feats):
        cov = cf.get("cov_wasm_opt")
        if not cov or self.r.random() >= cf.get("cov_rate", 0.1):
            return
        env = dict(os.environ, GCOV_PREFIX=self.wd + "/cov", GCOV_PREFIX_STRIP="0",
                   LLVM_PROFILE_FILE=self.wd + "/cov/%p-%m.profraw")
        os.makedirs(self.wd + "/cov", exist_ok=True)
        run([cov] + feats + c + [mb, "-o", "/dev/null"], 120, env=env)

    def save_bad(self, kind, mid, ck, mw, mb, ob, out, finfo, extra=None):
        self.nbad += 1
        d = "%s/bad/%s-%s-%04d" % (self.wd, kind, self.wid, self.nbad)
        os.makedirs(d, exist_ok=True)
        if mw and os.path.exists(mw):
            shutil.copy(mw, d + "/m.wat")
        shutil.copy(mb, d + "/m.wasm")
        if ob:
            shutil.copy(ob, d + "/o.wasm")
        with open(d + "/out.txt", "w") as fh:
            fh.write(out if isinstance(out, str) else json.dumps(out))
        meta = {"kind": kind, "mid": mid, "cfg": ck, "time": time.time(),
                "funcs": {e: {"src": f.meta.get("src"), "muts": f.meta.get("muts", []), "feats": ft}
                          for e, (f, ft) in finfo.items()}}
        meta.update(extra or {})
        with open(d + "/meta.json.tmp", "w") as fh:
            json.dump(meta, fh, indent=1)
        os.replace(d + "/meta.json.tmp", d + "/meta.json")

    def pool_add(self, m):
        ctx = TypeCtx(m)
        for f in m.funcs:
            try:
                Typer(ctx, f).run()
            except Unsupported:
                continue
            self.rolling += poolm.entries_of_func(self.r, m, f, "gen", "r%s_%d_%s_" % (self.wid, self.seed, f.name[1:]),
                                                  maxn=6)
        if len(self.rolling) > 3000:
            self.rolling = self.rolling[-3000:]

    def snapshot(self, force=False):
        if not force and time.time() - self.last_snap < 240:
            return
        self.last_snap = time.time()
        self.stats["elapsed"] = time.time() - self.stats["started"]
        self.stats["last_seed"] = self.seed
        self.stats["exwasm"] = cfg.load()["exwasm"]
        self.stats["updated"] = time.time()
        tmp = self.wd + "/stats.json.tmp"
        with open(tmp, "w") as fh:
            json.dump(self.stats, fh, indent=1, sort_keys=True)
        os.replace(tmp, self.wd + "/stats.json")

    def stopping(self):
        return self.stop or os.path.exists(self.wd + "/STOP") or os.path.exists(os.path.join(HERE, "STOP"))

    def loop(self, secs):
        t0 = time.time()
        self.snapshot(force=True)
        while not self.stopping() and (secs is None or time.time() - t0 < secs):
            try:
                self.module_once()
            except Exception as e:  # keep the campaign running; the failure is counted and logged
                self.cnt(self.stats["invalid"], "driver exception: %s" % norm(repr(e)))
                with open(self.wd + "/driver_errors.log", "a") as fh:
                    fh.write("seed %d\n%s\n" % (self.seed, traceback.format_exc()))
            self.snapshot()
        self.snapshot(force=True)


def main():
    wd, wid, seed0 = sys.argv[1], sys.argv[2], int(sys.argv[3])
    secs = float(sys.argv[4]) if len(sys.argv) > 4 else None
    os.makedirs(wd, exist_ok=True)
    with open(wd + "/pid", "w") as fh:
        fh.write(str(os.getpid()))
    Worker(wd, wid, seed0).loop(secs)


if __name__ == "__main__":
    main()
