#!/usr/bin/env python3
"""Re-validate saved counterexamples with another exwasm build.

usage: recheck.py EXWASM OUT.jsonl [--jobs 4] [--only PREV.jsonl] [glob ...]
       (default glob: runs2/w*/bad/cex*)

For every finding, runs `exwasm tv m.wasm o.wasm --func F` on each function
in meta["cex_funcs"] and appends one JSON line per function to OUT.jsonl.
Findings already in OUT.jsonl are skipped, so the run can be resumed.
With --only, just the functions an earlier run (PREV.jsonl) left as
counterexamples are checked.
"""
import argparse
import glob
import json
import os
import resource
import subprocess
import sys
import time
from concurrent.futures import ProcessPoolExecutor, as_completed

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402

VERDICTS = ("equivalent", "bounded", "counterexample", "unsupported", "unknown")


def limit(gb):
    def f():
        b = int(gb * (1 << 30))
        resource.setrlimit(resource.RLIMIT_AS, (b, b))
    return f


def check(exwasm, il, d, f, smt_ms, timeout_s, mem_gb):
    cmd = [exwasm, "--il", il, "tv", d + "/m.wasm", d + "/o.wasm", "--func", f, "--smt-timeout-ms", str(smt_ms)]
    t0 = time.time()
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout_s, preexec_fn=limit(mem_gb))
        out, rc = p.stdout + p.stderr, p.returncode
    except subprocess.TimeoutExpired:
        return {"verdict": "timeout", "detail": "", "secs": round(time.time() - t0, 1)}
    for ln in out.splitlines():
        q = ln.split("\t")
        if len(q) >= 3 and q[0] == f and q[1] in VERDICTS:
            return {"verdict": q[1], "detail": q[3] if len(q) > 3 else "", "secs": round(time.time() - t0, 1)}
    err = [ln for ln in out.splitlines() if ln.startswith("error")] or [out.strip()[-200:]]
    return {"verdict": "error", "detail": "rc=%s %s" % (rc, err[0][:200]), "secs": round(time.time() - t0, 1)}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("exwasm")
    ap.add_argument("out")
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--only")
    ap.add_argument("globs", nargs="*")
    a = ap.parse_intermixed_args()
    c = cfg.load()
    dirs = sorted({d for g in (a.globs or [os.path.join(HERE, "runs2/w*/bad/cex*")]) for d in glob.glob(g)})
    done = set()
    if os.path.exists(a.out):
        for ln in open(a.out):
            done.add((json.loads(ln)["dir"], json.loads(ln)["func"]))
    keep = None
    if a.only:
        keep = {(json.loads(ln)["dir"], json.loads(ln)["func"]) for ln in open(a.only) if json.loads(ln)["verdict"] == "counterexample"}
    jobs = []
    for d in dirs:
        meta = json.load(open(d + "/meta.json"))
        for f in meta.get("cex_funcs", []):
            if (d, f) not in done and (keep is None or (d, f) in keep):
                jobs.append((d, f, meta))
    print("%d functions to check (%d already done)" % (len(jobs), len(done)), flush=True)
    with open(a.out, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        futs = {ex.submit(check, a.exwasm, c["il"], d, f, c["smt_timeout_ms"], c["tv_timeout_s"], c.get("mem_gb", 3)):
                (d, f, meta) for d, f, meta in jobs}
        for i, fu in enumerate(as_completed(futs)):
            d, f, meta = futs[fu]
            r = fu.result()
            r.update({"dir": d, "func": f, "kind": meta["kind"], "cfg": meta["cfg"], "focus": meta.get("focus")})
            fh.write(json.dumps(r) + "\n")
            fh.flush()
            if i % 200 == 0:
                print(i, time.strftime("%H:%M:%S"), flush=True)


if __name__ == "__main__":
    main()
