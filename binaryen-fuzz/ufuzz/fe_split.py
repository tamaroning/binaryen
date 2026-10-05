#!/usr/bin/env python3
"""Which saved TV counterexamples `wasm-opt --fuzz-exec` also sees.

usage: fe_split.py RECHECK.jsonl OUT.jsonl [--jobs 3]

For every finding RECHECK.jsonl (from recheck.py) still reports as a
counterexample, runs drive.fuzz_exec_check on its module and configuration
(upstream main's wasm-opt from the config) and appends {dir, kind, cfg,
fuzz_exec} to OUT.jsonl: "detects", "misses", "timeout", "unrunnable" or
"error".  Findings already in OUT.jsonl are skipped.
"""
import argparse
import json
import os
import sys
import tempfile
from concurrent.futures import ProcessPoolExecutor, as_completed

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
import drive  # noqa: E402


def one(d, ck):
    try:
        wat = d + "/m.wat"
        text = open(wat).read() if os.path.exists(wat) else ""
        feats = cfg.features_for(cfg.FEATURES, text, False)
        with tempfile.TemporaryDirectory() as wd:
            fe = drive.fuzz_exec_check(cfg.load(), feats, wat, ck.split(), wd)
    except Exception as e:  # noqa: BLE001 -- keep writing the others
        fe = "error: %s" % type(e).__name__
    return fe


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("recheck")
    ap.add_argument("out")
    ap.add_argument("--jobs", type=int, default=3)
    a = ap.parse_args()
    todo = {}
    for ln in open(a.recheck):
        r = json.loads(ln)
        if r["verdict"] == "counterexample":
            todo.setdefault(r["dir"], r)
    done = {json.loads(ln)["dir"] for ln in open(a.out)} if os.path.exists(a.out) else set()
    items = [(d, r) for d, r in todo.items() if d not in done]
    print("%d findings (%d done)" % (len(items), len(done)), flush=True)
    with open(a.out, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        futs = {ex.submit(one, d, r["cfg"]): (d, r) for d, r in items}
        for fu in as_completed(futs):
            d, r = futs[fu]
            fh.write(json.dumps({"dir": d, "kind": r["kind"], "cfg": r["cfg"], "fuzz_exec": fu.result()}) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
