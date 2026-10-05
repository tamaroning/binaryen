#!/usr/bin/env python3
"""effcheck on V8: for every pair canReorder allows (with --generate-global-effects when MODE=ge),
run `A B` and `B A` as the export f of two modules and compare them with v8diff.js.

usage: run_v8.py OUTDIR [--jobs 3] [--mode ge|plain] [--hang-ms 1000] [--filter SUBSTR]
"""
import argparse, json, os, subprocess, sys
from concurrent.futures import ProcessPoolExecutor, as_completed
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from catalog import CAT
import run as R

V8 = os.path.join(HERE, "..", "ufuzz", "v8diff.js")


def one(args):
    out, a, b, hang_ms = args
    d = f"{out}/v8/{a}__{b}"
    os.makedirs(d, exist_ok=True)
    for tag, order in (("in", (a, b)), ("out", (b, a))):
        open(f"{d}/{tag}.wat", "w").write(R.pair_module([("f", order)]))
        r = subprocess.run(["wasm-tools", "parse", f"{d}/{tag}.wat", "-o", f"{d}/{tag}.wasm"], capture_output=True, text=True)
        if r.returncode:
            return {"a": a, "b": b, "same": None, "detail": "parse: " + r.stderr[:150]}
    env = dict(os.environ, V8DIFF_HANG_MS=str(hang_ms))
    try:
        p = subprocess.run(["node", "--experimental-wasm-type-reflection", "--experimental-wasm-exnref", V8,
                            f"{d}/in.wasm", f"{d}/out.wasm", "1"], capture_output=True, text=True, timeout=120, env=env)
        j = json.loads(p.stdout.strip().splitlines()[-1])
    except Exception as e:  # noqa: BLE001
        return {"a": a, "b": b, "same": None, "detail": f"v8: {type(e).__name__} {e}"[:150]}
    return {"a": a, "b": b, "same": j.get("same"), "detail": (j.get("detail") or "")[:200], "stop": j.get("stop", ""),
            "skip": j.get("skip", "")}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out")
    ap.add_argument("--jobs", type=int, default=3)
    ap.add_argument("--mode", default="ge")
    ap.add_argument("--hang-ms", type=int, default=1000)
    ap.add_argument("--filter")
    a = ap.parse_args()
    os.makedirs(a.out, exist_ok=True)
    open(f"{a.out}/base.wat", "w").write(R.base(list(CAT)))
    r = subprocess.run([os.path.join(HERE, "canreorder"), f"{a.out}/base.wat"] + (["ge"] if a.mode == "ge" else []),
                       capture_output=True, text=True)
    pairs = []
    for ln in r.stdout.splitlines():
        q = ln.split()
        if q[0] != "S" and q[2] == "1":
            x, y = q[0][2:], q[1][2:]
            if not a.filter or a.filter in x or a.filter in y:
                pairs.append((a.out, x, y, a.hang_ms))
    print("allowed pairs", len(pairs), flush=True)
    rp = f"{a.out}/v8results.jsonl"
    done = set()
    if os.path.exists(rp):
        done = {(json.loads(l)["a"], json.loads(l)["b"]) for l in open(rp)}
    todo = [p for p in pairs if (p[1], p[2]) not in done]
    with open(rp, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        for fu in as_completed([ex.submit(one, t) for t in todo]):
            fh.write(json.dumps(fu.result()) + "\n"); fh.flush()


if __name__ == "__main__":
    main()
