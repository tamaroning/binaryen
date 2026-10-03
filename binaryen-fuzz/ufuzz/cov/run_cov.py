#!/usr/bin/env python3
"""Run a coverage wasm-opt over a corpus (jobs.jsonl from corpus.py).

usage: run_cov.py WASM_OPT CORPUS_DIR GCOV_PREFIX_DIR [procs=3]
Output is discarded; GCOV_PREFIX_DIR collects the .gcda files (GCOV_PREFIX_STRIP=0).
"""
import concurrent.futures as cf
import json
import os
import subprocess
import sys


def job(a):
    exe, j, env = a
    try:
        subprocess.run([exe] + j["feats"] + j["cfg"] + [j["wasm"], "-o", "/dev/null"], env=env,
                       capture_output=True, timeout=120)
    except subprocess.TimeoutExpired:
        pass


def main():
    exe, corpus, pre = sys.argv[1:4]
    procs = int(sys.argv[4]) if len(sys.argv) > 4 else 3
    os.makedirs(pre, exist_ok=True)
    env = dict(os.environ, GCOV_PREFIX=os.path.abspath(pre))
    jobs = [json.loads(x) for x in open(corpus + "/jobs.jsonl")]
    with cf.ThreadPoolExecutor(procs) as ex:
        list(ex.map(job, [(exe, j, env) for j in jobs]))
    print("ran", len(jobs), "jobs")


if __name__ == "__main__":
    main()
