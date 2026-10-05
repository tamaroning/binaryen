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
          "dfo": ["--flatten"], "rereloop": ["--flatten"], "optimize-stack-ir": ["--generate-stack-ir"],
          "i64-to-i32-lowering": ["--flatten"]}
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


# passes that refuse to run without --closed-world
NEEDS_CLOSED = {"gsi", "cfp", "cfp-reftest", "type-refining", "type-refining-gufa", "gto", "abstract-type-refining",
                "signature-pruning", "signature-refining", "unsubtyping", "type-merging", "remove-unused-types"}


def pass_args(p):
    return PREREQ.get(p, []) + (["--closed-world"] if p in NEEDS_CLOSED else []) + ["--" + p]


# Passes the rule-level campaign (and the bugs found so far) point to; they are sampled
# `fruitful_weight` times as often as the rest, which keeps every other pass in play.
FRUITFUL = {"optimize-instructions", "merge-blocks", "remove-unused-brs", "simplify-locals",
            "simplify-locals-nostructure", "simplify-locals-notee", "simplify-locals-notee-nostructure",
            "simplify-locals-nonesting", "heap-store-optimization", "code-pushing", "code-folding", "gsi",
            "licm", "heap2local", "avoid-reinterprets", "alignment-lowering", "i64-to-i32-lowering",
            "optimize-casts", "local-cse", "precompute", "precompute-propagate", "vacuum"}
# configurations that go with a row family (module focus): sampled with `shape_bias`
# probability when the module was generated with that focus
_O = [["-O1"], ["-O2"], ["-O3"], ["-Os"]]
SHAPE_CFG = {
    "sh_dup": [["--optimize-instructions"], ["--local-cse"], ["--heap-store-optimization"], ["--precompute-propagate"],
               ["--simplify-locals"], ["-O1"], ["-O2"], ["--optimize-instructions", "--vacuum"]],
    "sh_noret": [["--merge-blocks"], ["--remove-unused-brs"], ["--simplify-locals"], ["--heap-store-optimization"],
                 ["--code-pushing"], ["--code-folding"], ["--merge-blocks", "--vacuum"], ["-O1"], ["-O2"], ["-Os"]],
    "sh_alloc": [["--licm"], ["--heap2local"], ["--licm", "--simplify-locals"], ["--heap2local", "--optimize-instructions"],
                 ["-O2"], ["-O3"], ["--local-cse"], ["--optimize-casts"]],
    "sh_tinit": [["--closed-world", "--gsi"], ["--closed-world", "--gsi", "-O2"], ["--closed-world", "-O3"],
                 ["--closed-world", "-O2"], ["--closed-world", "--gufa"], ["--closed-world", "--cfp"],
                 ["--closed-world", "--type-refining"], ["--closed-world", "--gsi", "--gufa", "--optimize-casts"]],
    "sh_nan": [["--optimize-instructions"], ["--precompute"], ["--precompute-propagate"], ["-O1"], ["-O3"],
               ["--avoid-reinterprets"], ["--optimize-instructions", "--precompute-propagate"]],
    "sh_edge": [["--alignment-lowering"], ["--optimize-instructions"], ["--dealign"], ["--i64-to-i32-lowering"],
                ["--pick-load-signs"], ["--memory-packing"], ["-O3"], ["--optimize-added-constants"]],
    "simd": [["--optimize-instructions"], ["--precompute"], ["--simplify-locals"], ["--local-cse"], ["-O3"], ["-O1"]],
    "relaxed": [["--optimize-instructions"], ["--precompute-propagate"], ["--local-cse"], ["-O3"], ["-O2"]],
    "icall": [["--inlining-optimizing"], ["--inlining"], ["--dae-optimizing"], ["--duplicate-function-elimination"],
              ["--merge-similar-functions"], ["--directize"], ["--monomorphize"], ["-O3"], ["-O2"], ["-O4"]],
    "callref": [["--directize"], ["--inlining-optimizing"], ["--optimize-instructions"], ["-O3"], ["--closed-world", "-O3"]],
    "gc2": [["--optimize-casts"], ["--heap2local"], ["--gufa"], ["--heap-store-optimization"], ["-O3"]],
    "ctl2": [["--merge-blocks"], ["--remove-unused-brs"], ["--vacuum"], ["--dce"], ["--simplify-locals"], ["-O2"], ["-O1"],
             ["--rereloop", "--flatten"]],
    "exn": [["--merge-blocks"], ["--remove-unused-brs"], ["--translate-to-exnref"], ["--vacuum"], ["-O3"], ["-O1"]],
    "float": [["--optimize-instructions"], ["--precompute"], ["--precompute-propagate"], ["--local-cse"], ["-O3"]],
    "cast": [["--optimize-casts"], ["--gufa-cast-all"], ["--heap2local"], ["--closed-world", "-O3"], ["-O2"]],
    "bulk": [["--optimize-instructions"], ["--memory-packing"], ["--alignment-lowering"], ["-O3"], ["--vacuum"]],
    "table": [["--directize"], ["--remove-unused-module-elements"], ["--optimize-instructions"], ["-O3"]],
    "loop": [["--licm"], ["--simplify-locals"], ["--remove-unused-brs"], ["--code-pushing"], ["-O2"], ["-O3"]],
    "mem": [["--optimize-instructions"], ["--pick-load-signs"], ["--optimize-added-constants"], ["--dealign"], ["-O3"]],
}
CLOSED_O = [["--closed-world", "-O1"], ["--closed-world", "-O2"], ["--closed-world", "-O3"], ["--closed-world", "-Os"],
            ["--closed-world", "-O4"], ["--closed-world", "-O3", "--converge"], ["--closed-world", "--gsi", "-O3"]]


def wchoice(r, items, wts):
    """weighted choice; `wts` maps item -> weight (default 1)"""
    return r.choices(items, [wts.get(x, 1.0) for x in items])[0]


def pass_weights(stats_pp=None, fruitful=2.5, boost=None):
    """sampling weight of every pass: fruitful ones `fruitful` times, scaled by how often the pass
    changed functions so far (0.6 .. 1.8), so passes that do nothing on the generated modules
    are sampled less but never dropped"""
    w = {}
    for p in set(SINGLE) | set(SEQ_POOL):
        w[p] = fruitful if p in FRUITFUL else 1.0
        e = (stats_pp or {}).get(p)
        if e and e.get("single_funcs", 0) >= 60:
            rate = e.get("single_funcs_changed", 0) / e["single_funcs"]
            w[p] *= min(1.8, 0.6 + 2.4 * rate)
    for p, f in (boost or {}).items():
        if p in w:
            w[p] *= f
    return w


# --fuzz-exec (Binaryen's interpreter) cannot call an unknown import that returns a value, so the
# comparison with it runs on a copy whose "env" imports are fixed functions: a void import logs its
# arguments through the interpreter's logging imports, a value-returning one returns a value
# computed from its first argument of the result type (or a constant).
_FE_IMPORT = re.compile(r'\(import "env" "[^"]*" \(func (\$\S+)((?: \(param [^()]*\))*)((?: \(result [^()]*\))*)\)\)')
_FE_LOGS = {t: "$__fe_log_" + t for t in ("i32", "i64", "f32", "f64")}


def fe_stub_text(text):
    """`text` with its "env" function imports replaced for --fuzz-exec, or None if it has other
    imports that are not "fuzzing-support" ones"""
    stubs = []

    def stub(mo):
        name = mo.group(1)
        params = [t for g in re.findall(r"\(param ([^()]*)\)", mo.group(2)) for t in g.split()]
        results = [t for g in re.findall(r"\(result ([^()]*)\)", mo.group(3)) for t in g.split()]
        if any(t not in _FE_LOGS for t in params + results) or len(results) > 1:
            raise ValueError(name)
        sig = "".join(" (param %s)" % t for t in params) + "".join(" (result %s)" % t for t in results)
        if not results:
            body = " ".join("(call %s (local.get %d))" % (_FE_LOGS[t], i) for i, t in enumerate(params))
        else:
            t = results[0]
            same = [i for i, pt in enumerate(params) if pt == t]
            body = "(%s.add (local.get %d) (%s.const 7))" % (t, same[0], t) if same else "(%s.const 7)" % t
        stubs.append("  (func %s%s %s)" % (name, sig, body))
        return ""

    try:
        out = _FE_IMPORT.sub(stub, text)
    except ValueError:
        return None
    if re.search(r'\(import "(?!fuzzing-support")', out):
        return None
    logs = "".join('  (import "fuzzing-support" "log-%s" (func %s (param %s)))\n' % (t, n, t) for t, n in _FE_LOGS.items())
    # imports come before any definition: right after "(module" (and its name, if any)
    out = re.sub(r"\(module(\s+\$[^\s()]+)?", lambda mo: mo.group(0) + "\n" + logs, out, count=1)
    k = out.rstrip().rfind(")")
    return out[:k] + "\n".join(stubs) + "\n)\n"


def fuzz_exec_check(cf, feats, wat_path, c, wd):
    """does `wasm-opt --fuzz-exec` with configuration `c` see the difference? "detects",
    "misses", "timeout" (the interpreter did not finish: e.g. a loop that no longer ends),
    "oom" (the interpreter ran out of the memory cap, e.g. a 4 GiB memory), "unrunnable"
    (imports it cannot stub) or "error"""
    try:
        text = open(wat_path).read()
    except OSError:
        return "unrunnable"
    st = fe_stub_text(text)
    if st is None:
        return "unrunnable"
    fw, fb = wd + "/fe.wat", wd + "/fe.wasm"
    with open(fw, "w") as fh:
        fh.write(st)
    rc, out = run(["wasm-tools", "parse", fw, "-o", fb], 60)
    if rc != 0:
        return "error"
    # the interpreter allocates a module's whole memory (4 GiB for 65536 pages): cap it
    rc, out = run([cf["wasm_opt"]] + feats + [fb] + c + ["--fuzz-exec", "-o", "/dev/null"], cf.get("fe_timeout_s", 60),
                  mem_gb=cf.get("fe_mem_gb", 3))
    if rc == "timeout":
        return "timeout"
    if "optimization passes changed results" in out:
        return "detects"
    if rc == 0:
        return "misses"
    if "bad_alloc" in out or "out of memory" in out.lower() or "Cannot allocate" in out:
        return "oom"
    return "error"


def cf_save_crashes():
    return bool(cfg.load().get("save_crashes", True))


def extra_args(r, cf, c):
    """`c` plus the options of config "extra_args" ([args, probability, passes or null]) drawn for it:
    each is added with its probability when `c` runs one of its passes (or always, for null)"""
    out = list(c)
    for args, p, needs in cf.get("extra_args", []):
        if r.random() < p and (not needs or any(("--" + x) in out or x in out for x in needs)):
            out += [a for a in args if a not in out]
    return out


def pick_only(r, only, wts):
    """(args, kind) drawing only from the passes in `only`: one pass, or a sequence of two to four"""
    wts = wts if wts is not None else pass_weights()
    n = 1 if r.random() < .4 else r.randint(2, 4)
    seq = [wchoice(r, only, wts) for _ in range(n)]
    out = []
    for p in seq:
        for y in pass_args(p):
            if y in ("--closed-world", "--flatten") and y in out:
                continue
            out.append(y)
    kind = "closed" if "--closed-world" in out else ("single" if n == 1 else "seq")
    return out, kind


def pick_config(r, wts=None, hint=None, shape_bias=0.3, only=None):
    """(args, kind): kind is "single", "seq", "olevel" or "closed".  `wts` are pass weights
    (pass_weights), `hint` the row family the module was generated for"""
    wts = wts if wts is not None else pass_weights()
    if only:
        return pick_only(r, only, wts)
    if hint in SHAPE_CFG and r.random() < shape_bias:
        c = list(r.choice(SHAPE_CFG[hint]))
        return c, ("closed" if "--closed-world" in c else "shape")
    x = r.random()
    pre = []
    if x < .75 and r.random() < .35:
        # levels change what many passes do (e.g. shrink-level in inlining, OI)
        pre = ["--optimize-level=%d" % r.randint(0, 4), "--shrink-level=%d" % r.randint(0, 2)]
    if x < .40:
        p = wchoice(r, SINGLE, wts)
        if p in LOWERING and r.random() < .6:
            p = wchoice(r, SINGLE, wts)
        c = pre + pass_args(p)
        return c, ("closed" if "--closed-world" in c else "single")
    if x < .68:
        seq = [wchoice(r, SEQ_POOL, wts) for _ in range(r.randint(2, 5))]
        out = list(pre)
        if r.random() < .2:
            out.append("--generate-global-effects")
        for p in seq:
            for y in pass_args(p):
                if (y.startswith("--low") or y == "--closed-world") and y in out:
                    continue
                out.append(y)
        return out, ("closed" if "--closed-world" in out else "seq")
    if x < .79:
        if r.random() < .45:
            return list(r.choice(CLOSED_O)), "closed"
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


def cex_class(c, ps):
    """(kind, suspect reason, known reason) of a counterexample under configuration `c` that ran
    the passes `ps` (-O levels expanded; empty when unknown): kind is "cexknown" for the
    documented behaviours (KNOWN_CEX), "cexsus" for flags / passes that use facts the per-function
    comparison cannot see (ASSUME, LOWERING, MODULE_FACTS such as simplify-globals*), else "cex" """
    sus = suspect_reason(c, ps)
    known = KNOWN_CEX.get(frozenset(ps or passes_of(c)))
    kind = "cexknown" if known else "cexsus" if sus else "cex"
    return kind, sus, known


def expanded_passes(cf, c, mb, feats=None):
    """the passes a configuration runs, in order (-O levels expanded)"""
    rc, out = run([cf["wasm_opt"]] + (feats or cfg.FEATURES) + c + [mb, "-o", "/dev/null"], 120,
                  env=dict(os.environ, BINARYEN_PASS_DEBUG="1"))
    return re.findall(r"running pass: (\S+?)\.\.\.", out) if rc == 0 else []


# ---------------------------------------------------------------- helpers
def _limit_as(gb):
    def f():
        import resource
        b = int(gb * (1 << 30))
        resource.setrlimit(resource.RLIMIT_AS, (b, b))
    return f


def run(cmd, timeout, env=None, mem_gb=None):
    """mem_gb: address-space limit of the child (exwasm / Z3); not for node (V8 reserves address space)"""
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout, env=env,
                           preexec_fn=_limit_as(mem_gb) if mem_gb else None)
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
    rc, out = run(cmd, cf["tv_timeout_s"], mem_gb=cf.get("mem_gb", 3))
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
               ("ReReloop does not support EH", "known: ReReloop rejects EH (Fatal)"),
               ("DataFlow does not support EH", "known: DataFlow rejects EH (Fatal)"),
               ("atomic accesses must have natural alignment", "candidate: --dealign gives atomic accesses align=1 (invalid output)"),
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
        self.feats = list(cfg.FEATURES)
        self.raw_feats = list(cfg.RAW_FEATURES)
        self.pass_wts = pass_weights()
        self.nan_mod = False
        self.focus = None
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
        """row weight multipliers: rows in functions exwasm cannot take are sampled less (relative to
        the overall unsupported rate), rows whose functions tend to be changed by the passes slightly more"""
        rows = self.stats["rows"]
        tn = sum(v.get("n", 0) for v in rows.values())
        tb = sum(v.get("unsup", 0) for v in rows.values())
        ttv = sum(v.get("tv", 0) for v in rows.values())
        tch = sum(v.get("changed", 0) for v in rows.values())
        base_bad = tb / tn if tn else 0
        base_ch = tch / ttv if ttv else 0
        w = {}
        for k, v in rows.items():
            n, bad = v.get("n", 0), v.get("unsup", 0)
            if n >= 20:
                w[k] = max(0.3, 1.0 - 1.5 * max(0.0, bad / n - base_bad))
                if v.get("tv", 0) >= 20 and base_ch > 0:
                    w[k] *= min(1.5, 0.7 + 0.3 * (v["changed"] / v["tv"]) / base_ch)
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
            decl = random.Random(self.seed * 11 + 3).random() < cf.get("decl_rate", 0)
            m = gen.gen_module(self.seed, self.row_weights(), flags=gen.pick_flags(random.Random(self.seed * 7 + 1), cf),
                               decl=decl)
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

    def set_feats(self, m, wat):
        """wasm-opt feature flags for this module: SIMD / threads / tail calls / multivalue only when it
        uses them (they change what passes do, e.g. memory.fill lowering), no EH for `noeh` modules"""
        with open(wat) as fh:
            text = fh.read()
        noeh = bool(m.meta.get("noeh"))
        self.feats = cfg.features_for(cfg.FEATURES, text, noeh)
        self.raw_feats = cfg.features_for(cfg.RAW_FEATURES, text, noeh)
        self.focus = m.meta.get("focus")
        self.nan_mod = "reinterpret" in text
        # a 65536-page memory: V8 would have to allocate (and v8diff.js hash) 4 GiB
        self.nov8 = bool(m.meta.get("nov8"))
        st = self.stats.setdefault("module_flags", {})
        for k, on in (("wide", m.meta.get("wide")), ("noeh", noeh), ("simd", "--enable-simd" in self.feats),
                      ("relaxed", "--enable-relaxed-simd" in self.feats), ("atomic", "--enable-threads" in self.feats),
                      ("tail", "--enable-tail-call" in self.feats), ("multivalue", "--enable-multivalue" in self.feats)):
            if on:
                self.cnt(st, k)
        self.cnt(self.stats.setdefault("focus", {}), self.focus or "none")

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
        self.set_feats(m, mw)
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
        # functions exwasm cannot take stay in the module (the others may call them); only `keep` is compared
        self.stats["modules"] += 1
        self.pass_wts = pass_weights(self.stats["per_pass"], cf.get("fruitful_weight", 2.5), cf.get("pass_boost"))
        finfo = {}
        for f in keep:
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
        rc, out = run([cf["wasm_opt"]] + self.feats + [mb, "-o", rtb], 60)
        if rc != 0:
            self.cnt(self.stats["input_rejected"], norm((out.strip().splitlines() or ["?"])[-1]))
            return
        rc, rt = run([cf["wasm_opt"]] + self.feats + [rtb, "--print"], 60)
        rtf = split_printed(rt) if rc == 0 else {}
        seen = {}
        for _ in range(r.randint(*cf["configs_per_module"])):
            c, kind = pick_config(r, self.pass_wts, self.focus, cf.get("shape_bias", .3), only=cf.get("only_passes"))
            c = extra_args(r, cf, c)
            ck = " ".join(c)
            ob = wd + "/o.wasm"
            rc, out = run([cf["wasm_opt"]] + self.feats + c + [mb, "-o", ob], 120)
            self.maybe_cov(cf, c, mb, self.feats)
            pc = self.stats["per_config"].setdefault(ck, {})
            if rc != 0:
                self.opt_failed(mid, src, ck, c, kind, rc, out, mw, mb, "A")
                continue
            if not self.valid_output(mid, src, ck, mw, mb, ob, "A"):
                continue
            with open(ob, "rb") as fh:
                h = hashlib.sha1(fh.read()).hexdigest()
            rc2, pr = run([cf["wasm_opt"]] + self.feats + [ob, "--print"], 60)
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
                if tvres is None and "panicked" in (tvout or ""):
                    # an exwasm bug, not a finding about wasm-opt: keep the pair for the exwasm side
                    sig = norm(next((ln for ln in tvout.splitlines() if "panicked at" in ln), "panic"))
                    if self.stats.setdefault("tv_panics", {}).get(sig, 0) < 3:
                        self.save_bad("tverr", mid, ck, mw, mb, ob, tvout, finfo, {"sig": sig})
                    self.cnt(self.stats["tv_panics"], sig)
                if tvres and any(v[0] == "counterexample" and e in finfo for e, v in tvres.items()):
                    v8 = self.v8(cf, mb, ob) if not set(passes_of(c)) & V8_SKIP else None
                    ps = expanded_passes(cf, c, mb, self.feats)
                    kind_cex, sus, known = cex_class(c, ps)
                    cfuncs = sorted(e for e, v in tvres.items() if v[0] == "counterexample" and e in finfo)
                    extra = {"v8": v8, "suspect": sus, "known": known, "passes": ps, "cex_funcs": cfuncs,
                             "cex_rows": {e: sorted(finfo[e][0].meta.get("rows", {})) for e in cfuncs if e in finfo},
                             "focus": self.focus}
                    if cf.get("fe_check", True):
                        # the counterexamples worth most: those --fuzz-exec does not see
                        fe = fuzz_exec_check(cf, self.feats, mw, c, wd)
                        extra["fuzz_exec"] = fe
                        self.cnt(self.stats.setdefault("cex_fuzz_exec", {}), "%s:%s" % (kind_cex, fe))
                    if kind_cex == "cexknown":
                        self.stats["cex_known"] = self.stats.get("cex_known", 0) + 1
                    elif kind_cex == "cexsus":
                        self.stats["cex_suspect"] += 1
                    else:
                        self.stats["cex"] += 1
                    self.save_bad(kind_cex, mid, ck, mw, mb, ob, tvout, finfo, extra)
                elif any(changed.values()) and r.random() < cf["v8_rate"] and not set(passes_of(c)) & V8_SKIP:
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
            self.bump(st["sources"], src, "tv")
            if v != "unchanged":
                self.bump(st["sources"], src, "changed")
            for rw in f.meta.get("rows", {}):
                self.bump(st["rows"], rw, "tv")
                if v != "unchanged":
                    self.bump(st["rows"], rw, "changed")
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
        self.raw_feats, self.focus, self.nan_mod = list(cfg.RAW_FEATURES), None, False
        self.nov8 = False
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
        feats = self.raw_feats
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
            c, kind = pick_config(r, self.pass_wts, self.focus, cf.get("shape_bias", .3), only=cf.get("only_passes"))
            c = extra_args(r, cf, c)
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
            elif set(passes_of(c)) & V8_SKIP:
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
        if getattr(self, "nov8", False):
            self.cnt(self.stats["oracle_b"], "v8-skip: big memory")
            return "v8-skip", "big memory"
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
        # under --traps-never-happen alone, a call that returned in the input and traps in the
        # output breaks the flag's contract (the input did not trap there)
        if set(ck.split()) & ASSUME == {"--traps-never-happen"} and re.search(r"\): ok:\S* vs trap\b", detail):
            self.cnt(self.stats["oracle_b"], "v8-diff-tnh")
            self.save_bad("v8tnh", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src})
            return "v8-diff-tnh", detail
        # a flag that lets the pass assume something about the program
        if set(ck.split()) & ASSUME:
            self.cnt(self.stats["oracle_b"], "v8-diff-assumed")
            self.save_bad("v8sus", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src, "assume": sorted(set(ck.split()) & ASSUME)})
            return "v8-diff-assumed", detail
        if self.nan_mod:
            # the module observes float bits through reinterpret; V8 and Binaryen's constant folding
            # may disagree on NaN payload / sign (nondeterministic in the spec)
            self.cnt(self.stats["oracle_b"], "v8-diff-nan")
            self.save_bad("v8nan", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src})
            return "v8-diff-nan", detail
        self.stats["v8_diffs"] += 1
        self.save_bad("v8diff", mid, ck, mw, mb, ob, detail, {}, {"oracle": oracle, "src": src})
        return "v8-diff", detail

    def valid_output(self, mid, src, ck, mw, mb, ob, oracle):
        rc, out = run(["wasm-tools", "validate", "--features", "all", ob], 60)
        if rc == 0:
            return True
        # wasm-tools may lag Binaryen on a feature: Binaryen's own validator decides
        rc2, out2 = run([cfg.load()["wasm_opt"]] + self.raw_feats + [ob, "-o", "/dev/null"], 60)
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
        # crashes are counted; saving them is optional (the campaigns look for miscompilations)
        if cf_save_crashes() and n < (3 if cat in ("assert", "signal", "timeout", "other") and not kn else 1):
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
