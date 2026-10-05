#!/usr/bin/env python3
"""Which counterexamples a plain read/write by wasm-opt already gives.

usage: rt_split.py EXWASM RECHECK.jsonl OUT.jsonl [--jobs 2] [--kind cex]

For every function RECHECK.jsonl (from recheck.py) still reports as a
counterexample, writes m.wasm back through wasm-opt with no passes (upstream
main, the module's features) and validates the function between m.wasm and
that copy.  A counterexample there does not come from the configuration's
passes.  Appends one JSON line per function; done ones are skipped.
"""
import argparse
import json
import os
import subprocess
import sys
import tempfile
from concurrent.futures import ProcessPoolExecutor, as_completed

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
from recheck import check  # noqa: E402

MAIN = "/home/tamaron/work/binaryen-main/build/bin/wasm-opt"


def module_text(d):
    if os.path.exists(d + "/m.wat"):
        return open(d + "/m.wat").read()
    return subprocess.run(["wasm-tools", "print", d + "/m.wasm"], capture_output=True, text=True, timeout=120).stdout


def one(exwasm, il, d, f, smt_ms, timeout_s, mem_gb):
    try:
        feats = cfg.features_for(cfg.FEATURES, module_text(d), False)
        with tempfile.TemporaryDirectory() as t:
            p = subprocess.run([MAIN] + feats + [d + "/m.wasm", "-o", t + "/o.wasm"], capture_output=True, text=True, timeout=120)
            if p.returncode != 0:
                return {"dir": d, "func": f, "verdict": "rt-failed", "detail": (p.stdout + p.stderr)[-200:]}
            os.makedirs(t + "/x")
            os.symlink(os.path.abspath(d) + "/m.wasm", t + "/x/m.wasm")
            os.symlink(t + "/o.wasm", t + "/x/o.wasm")
            r = check(exwasm, il, t + "/x", f, smt_ms, timeout_s, mem_gb)
    except Exception as e:  # noqa: BLE001 -- keep writing the other results
        r = {"verdict": "error", "detail": "%s: %s" % (type(e).__name__, e)}
    r.update({"dir": d, "func": f})
    return r


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exwasm")
    ap.add_argument("recheck")
    ap.add_argument("out")
    ap.add_argument("--jobs", type=int, default=2)
    ap.add_argument("--kind", default="cex")
    a = ap.parse_args()
    c = cfg.load()
    todo = []
    for ln in open(a.recheck):
        r = json.loads(ln)
        if r["verdict"] == "counterexample" and r["kind"] == a.kind:
            todo.append((r["dir"], r["func"], r))
    done = set()
    if os.path.exists(a.out):
        done = {(json.loads(ln)["dir"], json.loads(ln)["func"]) for ln in open(a.out)}
    todo = [t for t in todo if (t[0], t[1]) not in done]
    print("%d functions (%d done)" % (len(todo), len(done)), flush=True)
    with open(a.out, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        futs = {ex.submit(one, a.exwasm, c["il"], d, f, c["smt_timeout_ms"], c["tv_timeout_s"], c.get("mem_gb", 3)): r
                for d, f, r in todo}
        for fu in as_completed(futs):
            r = fu.result()
            src = futs[fu]
            r.update({"kind": src["kind"], "cfg": src["cfg"]})
            fh.write(json.dumps(r) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
