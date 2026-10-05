#!/usr/bin/env python3
"""effcheck: compare Binaryen's EffectAnalyzer::canReorder with the spec semantics (exwasm tv).

usage: run.py OUTDIR [--jobs 3] [--only NAME,NAME] [--exwasm BIN]

1. writes OUTDIR/base.wat (one function c_NAME per catalog statement) and asks the C++ harness
   which pairs canReorder allows to swap;
2. for every allowed pair (A, B) builds a module whose export f runs `A B` and another that
   runs `B A`, and validates them with `exwasm tv`;
3. a counterexample (the swap changes behaviour although Binaryen allows it) is a candidate gap
   in the effect model.  OUTDIR/results.jsonl has one line per pair.
"""
import argparse, json, os, subprocess, sys
from concurrent.futures import ProcessPoolExecutor, as_completed
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from catalog import CAT, DECLS

IL = "/home/tamaron/work/exwasm/il/wasm-3.0-ext.sexp"
EXW = "/home/tamaron/work/binaryen/binaryen-fuzz/bin/exwasm-1003d"
LOCALS = "(local $x i32) (local $os (ref null $S)) (local $oi (ref null $I)) (local $oa (ref null $A)) (local $oai (ref null $AI)) (local $nl (ref null $S))"
PRELUDE = "(local.set $os (struct.new $S (i32.const 0))) (local.set $oi (struct.new $I (i32.const 0))) (local.set $oa (array.new_default $A (i32.const 4))) (local.set $oai (array.new_default $AI (i32.const 4)))"


def module(funcs):
    return "(module\n%s\n%s)\n" % (DECLS, funcs)


def base(names):
    fs = "\n".join("  (func $c_%s %s (block $out %s))" % (n, LOCALS, CAT[n]) for n in names)
    return module(fs)


def pair_module(order):
    fs = "\n".join("  (func (export \"%s\") %s (block $out %s %s))" % (nm, LOCALS, CAT[a], CAT[b]) for nm, (a, b) in order)
    return module(fs)


def tv(args):
    out, a, bnames, exw = args
    ins = [(f"{a}__{b}", (a, b)) for b in bnames]
    outs = [(f"{a}__{b}", (b, a)) for b in bnames]
    pa, pb = f"{out}/w/{a}.in", f"{out}/w/{a}.out"
    os.makedirs(f"{out}/w", exist_ok=True)
    for p, o in ((pa, ins), (pb, outs)):
        open(p + ".wat", "w").write(pair_module(o))
        r = subprocess.run(["wasm-tools", "parse", p + ".wat", "-o", p + ".wasm"], capture_output=True, text=True)
        if r.returncode:
            return [{"a": a, "b": b, "verdict": "parse-error", "detail": r.stderr[:200]} for b in bnames]
    try:
        r = subprocess.run([exw, "--il", IL, "tv", pa + ".wasm", pb + ".wasm", "--smt-timeout-ms", "10000"],
                           capture_output=True, text=True, timeout=1800)
    except subprocess.TimeoutExpired:
        return [{"a": a, "b": b, "verdict": "timeout", "detail": ""} for b in bnames]
    res = {}
    for ln in r.stdout.splitlines():
        q = ln.split("\t")
        if len(q) >= 3 and q[1] in ("equivalent", "bounded", "counterexample", "unsupported", "unknown"):
            res[q[0]] = (q[1], q[3] if len(q) > 3 else "")
    out_l = []
    for b in bnames:
        v, d = res.get(f"{a}__{b}", ("missing", r.stderr[-200:]))
        out_l.append({"a": a, "b": b, "verdict": v, "detail": d[:300]})
    return out_l


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out")
    ap.add_argument("--jobs", type=int, default=3)
    ap.add_argument("--only")
    ap.add_argument("--exwasm", default=EXW)
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    names = list(CAT)
    open(f"{a.out}/base.wat", "w").write(base(names))
    r = subprocess.run([os.path.join(HERE, "canreorder"), f"{a.out}/base.wat"], capture_output=True, text=True)
    if r.returncode:
        sys.exit("canreorder failed: " + r.stderr[-500:])
    allowed = {}
    nall = 0
    single = {}
    for ln in r.stdout.splitlines():
        q = ln.split()
        if q[0] == "S":
            single[q[1][2:]] = (q[2] == "1", q[3] == "1")
            continue
        x, y, ok = q
        x, y = x[2:], y[2:]
        nall += 1
        if ok == "1":
            allowed.setdefault(x, []).append(y)
    json.dump(single, open(f"{a.out}/single.json", "w"))
    json.dump({"pairs": nall, "allowed": sum(len(v) for v in allowed.values())}, open(f"{a.out}/pairs.json", "w"))
    print("pairs", nall, "allowed", sum(len(v) for v in allowed.values()), flush=True)
    only = set(a.only.split(",")) if a.only else None
    done = set()
    rp = f"{a.out}/results.jsonl"
    if os.path.exists(rp):
        done = {json.loads(l)["a"] for l in open(rp)}
    todo = [(a.out, x, ys, a.exwasm) for x, ys in allowed.items() if x not in done and (not only or x in only)]
    with open(rp, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        for fu in as_completed([ex.submit(tv, t) for t in todo]):
            for rec in fu.result():
                fh.write(json.dumps(rec) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
