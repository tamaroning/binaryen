#!/usr/bin/env python3
"""Re-run saved V8 differences with a longer hang limit and several seeds.

usage: v8recheck.py OUT.jsonl [--hang-ms 20000] [--seeds 6] [--jobs 4] [glob ...]
       (default glob: runs2/w*/bad/v8diff-*)

The driver cuts a call off after 1.5 s and calls it "hang", so a slow but
terminating call can show up as a difference.  This re-runs v8diff.js on
m.wasm / o.wasm with seeds 1..N and the given limit, and appends one JSON
line per finding: the outcome for each seed and whether any seed differs.
Findings already in OUT.jsonl are skipped.
"""
import argparse
import glob
import json
import os
import subprocess
import sys
from concurrent.futures import ProcessPoolExecutor, as_completed

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402


def one(node, d, seed, hang_ms):
    env = dict(os.environ, V8DIFF_HANG_MS=str(hang_ms))
    cmd = [node, "--experimental-wasm-type-reflection", "--experimental-wasm-exnref", os.path.join(HERE, "v8diff.js"),
           d + "/m.wasm", d + "/o.wasm", str(seed)]
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=hang_ms / 1000 * 40 + 60, env=env)
    except subprocess.TimeoutExpired:
        return {"seed": seed, "skip": "timeout"}
    try:
        r = json.loads(p.stdout.strip().splitlines()[-1])
    except (ValueError, IndexError):
        return {"seed": seed, "skip": "v8diff failed: " + (p.stdout + p.stderr)[-200:]}
    r["seed"] = seed
    return r


def finding(node, d, seeds, hang_ms):
    runs = [one(node, d, s, hang_ms) for s in range(1, seeds + 1)]
    differs = [r for r in runs if not r.get("skip") and not r.get("same", True)]
    return {"dir": d, "differs": len(differs), "ran": sum(1 for r in runs if not r.get("skip")),
            "detail": differs[0].get("detail", "") if differs else "", "runs": runs}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out")
    ap.add_argument("--hang-ms", type=int, default=20000)
    ap.add_argument("--seeds", type=int, default=6)
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("globs", nargs="*")
    a = ap.parse_intermixed_args()
    c = cfg.load()
    dirs = sorted({d for g in (a.globs or [os.path.join(HERE, "runs2/w*/bad/v8diff-*")]) for d in glob.glob(g)})
    done = set()
    if os.path.exists(a.out):
        done = {json.loads(ln)["dir"] for ln in open(a.out)}
    todo = [d for d in dirs if d not in done]
    print("%d findings to re-run (%d already done)" % (len(todo), len(done)), flush=True)
    with open(a.out, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        futs = {ex.submit(finding, c["node"], d, a.seeds, a.hang_ms): d for d in todo}
        for fu in as_completed(futs):
            r = fu.result()
            m = json.load(open(r["dir"] + "/meta.json"))
            r.update({"kind": m["kind"], "cfg": m["cfg"], "orig": open(r["dir"] + "/out.txt").read().strip()[:300]})
            fh.write(json.dumps(r) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
