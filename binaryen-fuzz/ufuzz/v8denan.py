#!/usr/bin/env python3
"""Split saved V8 differences into NaN-only ones and the rest.

usage: v8denan.py OUT.jsonl [--wasm-opt W] [--seeds 3] [--hang-ms 3000] [--jobs 4] [glob ...]
       (default glob: runs2/w*/bad/v8diff-*)

A float operation on a NaN may return any NaN of the right kind, and a store
makes its bits visible in memory, so V8 and Binaryen's constant folding can
leave different memory without a bug.  For every finding this runs
`wasm-opt --denan` on m.wasm, optimizes the result with the finding's
configuration and W (default: upstream main), and re-runs v8diff.js.  It also
re-runs the plain module through W, so the line says whether the difference
reproduces on W at all ("plain") and without NaNs ("denan").
"""
import argparse
import glob
import json
import os
import subprocess
import sys
import tempfile
from concurrent.futures import ProcessPoolExecutor, as_completed

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402

MAIN = "/home/tamaron/work/binaryen-main/build/bin/wasm-opt"


def v8(node, a, b, seed, hang_ms):
    env = dict(os.environ, V8DIFF_HANG_MS=str(hang_ms))
    try:
        p = subprocess.run([node, "--experimental-wasm-type-reflection", "--experimental-wasm-exnref",
                            os.path.join(HERE, "v8diff.js"), a, b, str(seed)],
                           capture_output=True, text=True, timeout=900, env=env)
        return json.loads(p.stdout.strip().splitlines()[-1])
    except (subprocess.TimeoutExpired, ValueError, IndexError):
        return {"skip": "v8diff failed"}


def differs(node, a, b, seeds, hang_ms):
    """(number of seeds that differ, first detail)"""
    n, det = 0, ""
    for s in range(1, seeds + 1):
        r = v8(node, a, b, s, hang_ms)
        if not r.get("skip") and not r.get("same", True):
            n += 1
            det = det or r.get("detail", "")
    return n, det


def opt(w, feats, src, conf, out):
    p = subprocess.run([w] + feats + [src] + conf + ["-o", out], capture_output=True, text=True, timeout=300)
    return p.returncode == 0, (p.stdout + p.stderr)[-300:]


def finding(node, w, d, seeds, hang_ms):
    try:
        return finding1(node, w, d, seeds, hang_ms)
    except Exception as e:  # noqa: BLE001 -- one bad finding must not stop the others from being written
        return {"dir": d, "error": "%s: %s" % (type(e).__name__, e)}


def module_text(d):
    """m.wat, or the text of m.wasm for findings saved without it (raw inputs)"""
    if os.path.exists(d + "/m.wat"):
        return open(d + "/m.wat").read()
    return subprocess.run(["wasm-tools", "print", d + "/m.wasm"], capture_output=True, text=True, timeout=120).stdout


def finding1(node, w, d, seeds, hang_ms):
    meta = json.load(open(d + "/meta.json"))
    conf = meta["cfg"].split()
    feats = cfg.features_for(cfg.FEATURES, module_text(d), False)
    r = {"dir": d, "kind": meta["kind"], "cfg": meta["cfg"], "orig": open(d + "/out.txt").read().strip()[:300],
         "hang_ms": hang_ms}
    with tempfile.TemporaryDirectory() as t:
        ok, err = opt(w, feats, d + "/m.wasm", conf, t + "/o.wasm")
        r["plain"] = differs(node, d + "/m.wasm", t + "/o.wasm", seeds, hang_ms) if ok else (-1, "opt failed: " + err)
        ok, err = opt(w, feats, d + "/m.wasm", ["--denan"], t + "/dn.wasm")
        if not ok:
            r["denan"] = (-1, "denan failed: " + err)
            return r
        ok, err = opt(w, feats, t + "/dn.wasm", conf, t + "/dno.wasm")
        r["denan"] = differs(node, t + "/dn.wasm", t + "/dno.wasm", seeds, hang_ms) if ok else (-1, "opt failed: " + err)
    return r


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("out")
    ap.add_argument("--wasm-opt", default=MAIN)
    ap.add_argument("--seeds", type=int, default=3)
    ap.add_argument("--hang-ms", type=int, default=3000)
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("globs", nargs="*")
    a = ap.parse_intermixed_args()
    c = cfg.load()
    dirs = sorted({d for g in (a.globs or [os.path.join(HERE, "runs2/w*/bad/v8diff-*")]) for d in glob.glob(g)})
    done = {json.loads(ln)["dir"] for ln in open(a.out)} if os.path.exists(a.out) else set()
    todo = [d for d in dirs if d not in done]
    print("%d findings (%d already done)" % (len(todo), len(done)), flush=True)
    with open(a.out, "a") as fh, ProcessPoolExecutor(a.jobs) as ex:
        futs = [ex.submit(finding, c["node"], a.wasm_opt, d, a.seeds, a.hang_ms) for d in todo]
        for fu in as_completed(futs):
            fh.write(json.dumps(fu.result()) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
