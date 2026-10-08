"""Attribute the counterexamples of a fuzz_tv.py run to the bugs of Table tab:bugs.

For each saved module OUT/cex/<seed>, a.wasm is optimized again with the same options by
wasm-opt builds of upstream 82439ad01 with one fix each (FIXBIN/<name>/bin/wasm-opt; `base` has
none), and every counterexample function is rechecked with exwasm.  A function whose
counterexample remains under `base` and disappears under exactly the fix of bug N is labelled N;
one that remains under every fix is labelled `other` (a false alarm or another bug, triaged by
hand).  Results are cached in OUT/cex/<seed>/triage.json.

usage: triage.py OUT [--jobs N]   (env as fuzz_tv.py: TTFTV_EXWASM, TTFTV_IL, TTFTV_SMT_MS;
                                   TTFTV_FIXBIN, default ~/work/fuzzenv/ttftv/fixbin)
"""
import argparse
import collections
import glob
import json
import os
import subprocess
from concurrent.futures import ThreadPoolExecutor

ap = argparse.ArgumentParser()
ap.add_argument("out")
ap.add_argument("--jobs", type=int, default=8)
args = ap.parse_args()

FIXBIN = os.environ.get("TTFTV_FIXBIN", os.path.expanduser("~/work/fuzzenv/ttftv/fixbin"))
EXWASM, IL = os.environ["TTFTV_EXWASM"], os.environ["TTFTV_IL"]
SMT_MS = os.environ.get("TTFTV_SMT_MS", "20000")
FIXES = [n for n in ("9179", "9181", "9182", "9184", "9186", "9207") if os.path.isdir(os.path.join(FIXBIN, n))]
PREMISES = {"--traps-never-happen": "traps-never-happen", "-tnh": "traps-never-happen",
            "--fast-math": "fast-math", "-ffm": "fast-math"}


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def verdict(a, b, fn, opts):
    cmd = [EXWASM, "--il", IL, "tv", a, b, "--func", fn, "--smt-timeout-ms", SMT_MS]
    assume = sorted({PREMISES[f] for f in opts if f in PREMISES})
    if assume:
        cmd += ["--assume", ",".join(assume)]
    rc, out = run(cmd, 900)
    for line in out.splitlines():
        p = line.split("\t")
        if len(p) >= 2 and p[0] == fn:
            return p[1]
    return "timeout" if rc == "timeout" else "error"


def triage(d):
    cache = os.path.join(d, "triage.json")
    if os.path.exists(cache):
        return d, json.load(open(cache))
    m = json.load(open(os.path.join(d, "meta.json")))
    opts = m["opts"] + m.get("fuzz_opts", []) + m["features"]
    a = os.path.join(d, "a.wasm")
    res = {fn: {} for fn in m["cex"]}
    for n in ["base"] + FIXES:
        b = os.path.join(d, "b-%s.wasm" % n)
        rc, out = run([os.path.join(FIXBIN, n, "bin", "wasm-opt"), a, "-o", b] + opts, 600)
        for fn in res:
            res[fn][n] = verdict(a, b, fn, m["opts"]) if rc == 0 else "opt-fail"
    for fn, v in res.items():
        gone = [n for n in FIXES if v[n] in ("equivalent", "bounded")]
        if v["base"] != "counterexample":
            v["label"] = "not-reproduced"
        elif len(gone) == 1:
            v["label"] = gone[0]
        elif gone:
            v["label"] = "+".join(gone)
        else:
            v["label"] = "other"
    json.dump(res, open(cache, "w"), indent=1)
    return d, res


dirs = sorted(glob.glob(os.path.join(args.out, "cex", "*")))
by = collections.defaultdict(set)
with ThreadPoolExecutor(args.jobs) as ex:
    for d, res in ex.map(triage, dirs):
        labels = sorted({v["label"] for v in res.values()})
        for lb in labels:
            by[lb].add(os.path.basename(d))
        print(os.path.basename(d), " ".join("%s:%s" % (fn, v["label"]) for fn, v in res.items()), flush=True)
print("modules per label:", {k: len(v) for k, v in sorted(by.items())})
