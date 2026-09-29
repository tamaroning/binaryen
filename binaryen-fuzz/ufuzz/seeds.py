#!/usr/bin/env python3
"""Harvest seed functions for ufuzz.

usage: seeds.py OUTDIR [--jobs 8] [--sources lit,old,spec,real,smith,ttf] [--limit-per-source N]

For every module of every source: print it with Binaryen (folded), parse
it, keep functions inside the representable subset (no floats, SIMD,
bulk memory, tables, exceptions; calls to defined functions are turned
into calls to imports with the same integer signature), put them into a
normalized module with every function, memory and global exported, and
keep the functions that exwasm-tv proves equivalent to themselves.

Writes OUTDIR/mods/<source>/<n>.wat (normalized seed modules),
OUTDIR/pool/<source>.jsonl (subtree pool entries) and
OUTDIR/summary.json (counts per source and drop reasons).
"""
import glob
import hashlib
import json
import os
import random
import re
import subprocess
import sys
import tempfile
from multiprocessing import Pool

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
import pool as poolm  # noqa: E402
from wmod import (Module, Typer, TypeCtx, Unsupported, family, is_ref, parse_module, parse_sx,  # noqa: E402
                  sx_str, vt_str)

READ_FEATURES = ["--enable-gc", "--enable-reference-types", "--enable-multimemory", "--enable-memory64",
                 "--enable-bulk-memory", "--enable-sign-ext", "--enable-mutable-globals",
                 "--enable-nontrapping-float-to-int", "--enable-simd", "--enable-exception-handling",
                 "--enable-tail-call", "--enable-extended-const", "--enable-multivalue",
                 "--enable-relaxed-simd", "--enable-bulk-memory-opt", "--enable-call-indirect-overlong"]
BAD_FAMILIES = {"float", "simd", "data", "table", "exn", "other"}
BIN = "/home/tamaron/work/binaryen"
MAX_FUNC_NODES = 250
FUNC_TIMEOUT = 30
CHUNKS = 4


def run(cmd, timeout, inp=None):
    try:
        p = subprocess.run(cmd, input=inp, stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace"), p.stderr.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", "", ""


def split_wast(text):
    """top-level (module ...) forms of a .wast as text"""
    out = []
    try:
        forms = parse_sx(text)
    except ValueError:
        return out
    for f in forms:
        if isinstance(f, list) and f and f[0] == "module":
            rest = f[1:]
            if rest and isinstance(rest[0], str) and rest[0].startswith("$"):
                rest = rest[1:]
            if rest and rest[0] in ("binary", "quote", "definition", "instance"):
                continue
            out.append(sx_str(f))
    return out


def binaryen_print(path_or_text, is_text, wasm_opt):
    with tempfile.NamedTemporaryFile("w", suffix=".wat" if is_text else ".wasm", delete=False,
                                     dir=os.environ.get("TMPDIR")) as tf:
        name = tf.name
    try:
        if is_text:
            open(name, "w").write(path_or_text)
            src = name
        else:
            src = path_or_text
        rc, out, err = run([wasm_opt] + READ_FEATURES + [src, "--print"], 120)
        if rc != 0:
            return None, (err.strip().splitlines() or ["?"])[0][:80]
        return out, None
    finally:
        os.unlink(name)


GC_HEAPS = {"any", "eq", "i31", "struct", "array", "none"}


def field_ok(s, m):
    """storage types exwasm reads: packed, i32/i64, and references into the
    any hierarchy (a struct/array field of another type makes exwasm reject
    the whole module)"""
    if s in ("i8", "i16", "i32", "i64"):
        return True
    if not is_ref(s):
        return False
    h = s[2]
    if h.startswith("$"):
        td = m.tmap().get(h)
        return td is not None and td.kind != "func"
    return h in GC_HEAPS


def drop_key(k):
    """drop reasons without names or numbers, so the summary stays small"""
    return re.sub(r"\$\S+", "$X", re.sub(r"\d+", "N", k))[:60]


def normalize(m, r, maxf=25, skip=()):
    """seed module -> (Module with exported, representable functions, drops)"""
    drops = {}

    def drop(k):
        k = drop_key(k)
        drops[k] = drops.get(k, 0) + 1
    out = Module()
    bad_types = set(m.meta.get("rec_types", set()))
    changed = True
    while changed:
        changed = False
        for td in m.types:
            if td.name in bad_types:
                continue
            deps = ([td.sup] if td.sup else []) + [s[2] for s, _ in td.fields if is_ref(s) and s[2].startswith("$")]
            if any(d in bad_types for d in deps) or td.kind == "func" or not all(
                    field_ok(fs, m) for fs, _ in td.fields):
                bad_types.add(td.name)
                changed = True
    out.types = [td for td in m.types if td.name not in bad_types]
    out.memories = list(m.memories)[:3]
    for n, t, mu, init, _ in m.globals:
        if is_ref(t) or t not in ("i32", "i64"):
            continue
        if init is None or not init.startswith("(%s.const" % t):
            init = "(%s.const 0)" % t
        # immutable globals stay unexported: exwasm reads an exported
        # immutable global as a symbolic value (limits/const_export_global.wat)
        out.globals.append((n, t, mu, init, (n.strip("$").replace('"', "") or "g") if mu else None))
    out.imports = [i for i in m.imports if all(t in ("i32", "i64") for t in i[3] + i[4])]
    ctx = TypeCtx(m)
    ctx.tmap = {td.name: td for td in out.types}
    ctx.globals = {g[0]: g for g in out.globals}
    ctx.imports = {i[0]: (i[3], i[4]) for i in out.imports}
    funcs = list(m.funcs)
    r.shuffle(funcs)
    extra_imps = {}
    for f in funcs:
        if len(out.funcs) >= maxf:
            break
        if f.name in skip:
            continue
        out.meta.setdefault("taken", []).append(f.name)
        if any(is_ref(t) and t[2].startswith("$") and t[2] in bad_types for _, t in f.params + f.locals):
            drop("rec/func type")
            continue
        if not all(field_ok(t, m) for _, t in f.params + f.locals) or \
                not all(field_ok(t, m) for t in f.results) or len(f.results) > 1:
            drop("non-integer param/local/result")
            continue
        if sum(b.size() for b in f.body) > MAX_FUNC_NODES:
            drop("too large")
            continue
        try:
            Typer(ctx, f).run()
        except (Unsupported, KeyError, IndexError, ValueError, TypeError) as e:
            drop("typer: " + str(e)[:40])
            continue
        fams = {family(n.op) for b in f.body for n in b.walk()}
        if fams & BAD_FAMILIES:
            drop("feature: " + ",".join(sorted(fams & BAD_FAMILIES)))
            continue
        ok = True
        for b in f.body:
            for n in b.walk():
                if n.op == "call" and n.imms[0] not in ctx.imports:
                    ps, rs = ctx.fsigs.get(n.imms[0], (None, None))
                    if ps is None or not all(t in ("i32", "i64") for t in ps + rs) or len(rs) > 1:
                        ok = False
                        break
                    key = "c_%s__%s" % ("_".join(ps), "_".join(rs))
                    extra_imps[key] = (ps, rs)
                    n.imms[0] = "$" + key
        if not ok:
            drop("call with non-integer signature")
            continue
        f.export = "s%d" % len(out.funcs)
        f.name = "$s%d" % len(out.funcs) if not f.name.startswith("$") or '"' in f.name else f.name
        out.funcs.append(f)
    for k, (ps, rs) in extra_imps.items():
        out.imports.append(("$" + k, "env", k, ps, rs))
    # function names must be unique and not collide with imports
    names = {i[0] for i in out.imports}
    for k, f in enumerate(out.funcs):
        if f.name in names:
            f.name = "$sfun%d" % k
        names.add(f.name)
    return out, drops


def tv_self(wd, m):
    cf = cfg.load()
    mw, mb = wd + "/s.wat", wd + "/s.wasm"
    open(mw, "w").write(m.text())
    rc, out, err = run(["wasm-tools", "parse", mw, "-o", mb], 60)
    if rc != 0:
        rc, out, err = run([cf["wasm_opt"]] + cfg.FEATURES + [mw, "-o", mb], 60)
        if rc != 0:
            return None, "invalid normalized module: " + (err.strip().splitlines() or ["?"])[0][:60]
    verdicts = {}
    for f in m.funcs:
        rc, out, err = run([cf["exwasm"], "--il", cf["il"], "tv", mb, mb, "--func", f.export, "--smt-timeout-ms",
                            str(cf["smt_timeout_ms"])], FUNC_TIMEOUT)
        if rc == "timeout":
            verdicts[f.export] = ("timeout", "per-function limit")
            continue
        for line in out.splitlines():
            p = line.split("\t")
            if len(p) >= 3 and p[1] in ("equivalent", "bounded", "counterexample", "unsupported", "unknown"):
                verdicts[p[0]] = (p[1], p[3] if len(p) > 3 else "")
        if f.export not in verdicts:
            verdicts[f.export] = ("error", ((out + err).strip().splitlines() or ["?"])[-1][:80])
    return verdicts, None


def func_count(path):
    rc, out, _ = run(["wasm-tools", "print", path], 60)
    return out.count("(func ") - out.count("(import ") if rc == 0 else 0


def harvest_one(job):
    tag, path, kind, seed = job
    r = random.Random(seed)
    cf = cfg.load()
    st = {"tag": tag, "path": path, "modules": 0, "funcs_in": 0, "funcs_kept": 0, "drops": {}, "tv": {}}
    wd = tempfile.mkdtemp(dir=os.environ.get("TMPDIR"))
    texts = []
    try:
        if kind == "wast":
            src = open(path, errors="replace").read()
            for mt in split_wast(src)[:12]:
                texts.append((mt, True))
        elif kind == "wasm":
            texts.append((path, False))
        elif kind == "smith":
            # wasm-smith often spends all its input on types; retry with
            # fresh bytes until the module has functions
            rr = random.Random(seed)
            p = wd + "/sm.wasm"
            for _ in range(30):
                # GC modules put every type into a multi-type rec group,
                # which exwasm rejects; half the jobs generate integer code
                gc = "true" if seed % 2 else "false"
                rc, _, _ = run(["wasm-tools", "smith", "--gc-enabled", gc, "--memory64-enabled", "true",
                                "--max-memories", "2", "--reference-types-enabled", "true", "--allow-floats", "false",
                                "--simd-enabled", "false", "--exceptions-enabled", "false", "--max-tables", "0",
                                "--bulk-memory-enabled", "false", "--export-everything", "true",
                                "--multi-value-enabled", "false", "--tail-call-enabled", "false", "--max-imports", "0",
                                "--max-types", "12", "--max-type-size", "12", "--min-funcs", "3", "--max-funcs", "16", "--threads-enabled", "false",
                                "--max-instructions", "300", "--max-memory32-bytes", "131072",
                                "--max-memory64-bytes", "131072", "-o", p], 60,
                               inp=rr.randbytes(rr.choice([4000, 12000, 30000])))
                if rc == 0 and func_count(p) > 0:
                    texts.append((p, False))
                    break
        elif kind == "ttf":
            rr = random.Random(seed)
            rb = wd + "/rand.bin"
            open(rb, "wb").write(rr.randbytes(rr.choice([4000, 16000, 40000])))
            p = wd + "/ttf.wasm"
            rc, _, _ = run([cf["wasm_opt"], "-ttf", rb] + cfg.FEATURES + ["-o", p], 60)
            if rc == 0:
                texts.append((p, False))
        outs = []
        for k, (t, is_text) in enumerate(texts):
            printed, err = binaryen_print(t, is_text, cf["wasm_opt"])
            if printed is None:
                st["drops"]["binaryen read: " + err[:50]] = st["drops"].get("binaryen read: " + err[:50], 0) + 1
                continue
            taken = set()
            # a large module yields several seed modules of MAXF functions each
            for chunk in range(CHUNKS if tag.startswith("real") else 1):
                try:
                    m = parse_module(printed)
                except (Unsupported, ValueError, IndexError, KeyError, TypeError) as e:
                    key = "module: " + drop_key(str(e))
                    st["drops"][key] = st["drops"].get(key, 0) + 1
                    break
                if chunk == 0:
                    for dk, dv in m.meta.get("dropped", {}).items():
                        key = "parse: " + drop_key(dk)
                        st["drops"][key] = st["drops"].get(key, 0) + dv
                    st["funcs_in"] += len(m.funcs) + sum(m.meta.get("dropped", {}).values())
                nm, drops = normalize(m, r, skip=taken)
                taken |= set(nm.meta.get("taken", []))
                for dk, dv in drops.items():
                    st["drops"][dk] = st["drops"].get(dk, 0) + dv
                if not nm.funcs:
                    break
                verdicts, err = tv_self(wd, nm)
                if verdicts is None:
                    st["drops"][drop_key(err)] = st["drops"].get(drop_key(err), 0) + len(nm.funcs)
                    continue
                keep = []
                for f in nm.funcs:
                    v, det = verdicts.get(f.export, ("missing", ""))
                    key = v if v in ("equivalent", "bounded") else "%s: %s" % (v, drop_key(det))
                    st["tv"][key] = st["tv"].get(key, 0) + 1
                    # bounded: proved on the inputs within exwasm's unrolling bound
                    if v in ("equivalent", "bounded"):
                        keep.append(f)
                if not keep:
                    continue
                nm.funcs = keep
                for i, f in enumerate(nm.funcs):
                    f.export = "s%d" % i
                st["modules"] += 1
                st["funcs_kept"] += len(keep)
                ctx = TypeCtx(nm)
                ents = []
                for f in nm.funcs:
                    try:
                        Typer(ctx, f).run()
                    except Unsupported:
                        continue
                    hid = hashlib.sha1((path + str(k) + f.name).encode()).hexdigest()[:8]
                    ents += poolm.entries_of_func(r, nm, f, tag, "%s_%s_" % (tag.replace("-", ""), hid), maxn=20)
                outs.append((nm.text(), ents))
        return st, outs
    finally:
        subprocess.run(["rm", "-rf", wd])


def jobs_for(sources, limit, r):
    jobs = []
    if "lit" in sources:
        fs = sorted(glob.glob(BIN + "/test/lit/**/*.wast", recursive=True))
        for f in fs:
            tag = "lit-passes" if "/lit/passes/" in f else "lit-other"
            jobs.append((tag, f, "wast", r.getrandbits(32)))
    if "old" in sources:
        fs = sorted(glob.glob(BIN + "/test/passes/*.wast") + glob.glob(BIN + "/test/*.wast"))
        for f in fs:
            jobs.append(("binaryen-old", f, "wast", r.getrandbits(32)))
        for f in sorted(glob.glob(BIN + "/test/*.wasm")):
            jobs.append(("binaryen-old", f, "wasm", r.getrandbits(32)))
    if "spec" in sources:
        fs = sorted(glob.glob(BIN + "/test/spec/**/*.wast", recursive=True))
        for f in fs:
            jobs.append(("spec-binaryen", f, "wast", r.getrandbits(32)))
        fs = sorted(glob.glob("/home/tamaron/work/spectec/test/**/*.wast", recursive=True))
        for f in fs:
            jobs.append(("spec-spectec", f, "wast", r.getrandbits(32)))
    if "real" in sources:
        B = "/home/tamaron/work/superwasm/benchmarks"
        for d in ["rosetta", "wasm-benchmarks", "wasm-score", "wasm-score-o3", "as-benchmarks", "as-bench", "superstack-circom",
                  "kotlin-wasm", "kotlin-wasm-benchmarks"]:
            fs = sorted(glob.glob(B + "/" + d + "/**/*.wasm", recursive=True))
            fs = [f for f in fs if os.path.getsize(f) <= 6 * 1024 * 1024]
            r.shuffle(fs)
            tag = "real-kotlin" if d.startswith("kotlin") else "real-" + d
            for f in fs[:40]:
                jobs.append((tag, f, "wasm", r.getrandbits(32)))
    if "smith" in sources:
        for i in range(limit or 300):
            jobs.append(("smith", "smith#%d" % i, "smith", 1000 + i))
    if "ttf" in sources:
        for i in range(limit or 300):
            jobs.append(("ttf", "ttf#%d" % i, "ttf", 5000 + i))
    return jobs


def main():
    out = sys.argv[1]
    args = sys.argv[2:]
    njobs = 8
    sources = ["lit", "old", "spec", "real", "smith", "ttf"]
    limit = None
    i = 0
    while i < len(args):
        if args[i] == "--jobs":
            njobs = int(args[i + 1])
            i += 2
        elif args[i] == "--sources":
            sources = args[i + 1].split(",")
            i += 2
        elif args[i] == "--limit-per-source":
            limit = int(args[i + 1])
            i += 2
        else:
            raise SystemExit("unknown arg " + args[i])
    r = random.Random(1)
    jobs = jobs_for(sources, limit, r)
    if limit:
        by = {}
        for j in jobs:
            by.setdefault(j[0], []).append(j)
        jobs = [j for v in by.values() for j in v[:limit]]
    os.makedirs(out + "/mods", exist_ok=True)
    os.makedirs(out + "/pool", exist_ok=True)
    summ = {}
    counters = {}
    pools = {}
    with Pool(njobs) as p:
        for n, (st, outs) in enumerate(p.imap_unordered(harvest_one, jobs)):
            tag = st["tag"]
            s = summ.setdefault(tag, {"files": 0, "modules": 0, "funcs_in": 0, "funcs_kept": 0, "entries": 0,
                                      "drops": {}, "tv": {}})
            s["files"] += 1
            s["modules"] += st["modules"]
            s["funcs_in"] += st["funcs_in"]
            s["funcs_kept"] += st["funcs_kept"]
            for k, v in st["drops"].items():
                s["drops"][k] = s["drops"].get(k, 0) + v
            for k, v in st["tv"].items():
                s["tv"][k] = s["tv"].get(k, 0) + v
            for text, ents in outs:
                c = counters.get(tag, 0)
                counters[tag] = c + 1
                os.makedirs(out + "/mods/" + tag, exist_ok=True)
                open("%s/mods/%s/%05d.wat" % (out, tag, c), "w").write(text)
                if tag not in pools:
                    pools[tag] = open("%s/pool/%s.jsonl" % (out, tag), "w")
                for e in ents:
                    pools[tag].write(json.dumps(e) + "\n")
                s["entries"] += len(ents)
            if n % 50 == 0:
                json.dump(summ, open(out + "/summary.json", "w"), indent=1, sort_keys=True)
                print("%d/%d" % (n, len(jobs)), flush=True)
    for f in pools.values():
        f.close()
    json.dump(summ, open(out + "/summary.json", "w"), indent=1, sort_keys=True)


if __name__ == "__main__":
    main()
