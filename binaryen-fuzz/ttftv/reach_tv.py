"""TV on the modules where a bug fires (fuzz_tv.py reach mode): does exwasm report it?

For each OUT/cex/<seed> of a reach run, the functions whose bodies differ between b.wasm (the
build under test) and c.wasm (the same options with the fix) are where the bug fired; exwasm
tv is run on (a.wasm, b.wasm) for each of them.  Results are cached in OUT/cex/<seed>/reach_tv.json.

usage: reach_tv.py OUT [--jobs N]   (env: TTFTV_EXWASM, TTFTV_IL, TTFTV_SMT_MS,
                                    TTFTV_WASM_OPT, TTFTV_FIX_WASM_OPT)
"""
import argparse
import collections
import glob
import json
import os
import re
import subprocess
from concurrent.futures import ThreadPoolExecutor

ap = argparse.ArgumentParser()
ap.add_argument("out")
ap.add_argument("--jobs", type=int, default=8)
args = ap.parse_args()
EXWASM, IL, WASM_OPT = os.environ["TTFTV_EXWASM"], os.environ["TTFTV_IL"], os.environ["TTFTV_WASM_OPT"]
FIX_WASM_OPT = os.environ["TTFTV_FIX_WASM_OPT"]  # the build with the fix: c.wasm is redone with it
SMT_MS = os.environ.get("TTFTV_SMT_MS", "20000")


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def bodies(wasm, feats):
    """export name -> printed body"""
    _, text = run([WASM_OPT, wasm, "--print"] + feats, 120)
    funcs = {}
    for part in re.split(r"\n(?= \(func )", text)[1:]:
        m = re.match(r" \(func (\S+)", part)
        funcs[m.group(1)] = part
    out = {}
    for m in re.finditer(r'\(export "([^"]+)" \(func (\S+)\)\)', text):
        out[m.group(1)] = funcs.get(m.group(2))
    return out


def check(d):
    cache = os.path.join(d, "reach_tv.json")
    if os.path.exists(cache):
        return d, json.load(open(cache))
    m = json.load(open(os.path.join(d, "meta.json")))
    feats = m["features"]
    c_wasm = os.path.join(d, "c.wasm")
    run([FIX_WASM_OPT, os.path.join(d, "a.wasm"), "-o", c_wasm] + m["opts"] + m.get("fuzz_opts", []) + feats, 600)
    b, c = bodies(os.path.join(d, "b.wasm"), feats), bodies(c_wasm, feats)
    fired = sorted(fn for fn in b if b[fn] != c.get(fn))
    res = {"fired": fired, "verdicts": {}, "readable": True}
    for fn in fired:
        rc, out = run([EXWASM, "--il", IL, "tv", os.path.join(d, "a.wasm"), os.path.join(d, "b.wasm"),
                       "--func", fn, "--smt-timeout-ms", SMT_MS], 900)
        v = next((ln.split("\t")[1] for ln in out.splitlines() if ln.split("\t")[0] == fn), None)
        if v is None:
            err = next((ln for ln in out.splitlines() if ln.startswith("error")), "timeout" if rc == "timeout" else "?")
            v = "error: " + err[-80:]
            res["readable"] = "singleton" not in err and "Decode" not in err and "Unsupported" not in err
        res["verdicts"][fn] = v
    res["gc"] = "--enable-gc" in feats
    json.dump(res, open(cache, "w"), indent=1)
    return d, res


dirs = sorted(glob.glob(os.path.join(args.out, "cex", "*")))
tally = collections.Counter()
with ThreadPoolExecutor(args.jobs) as ex:
    for d, r in ex.map(check, dirs):
        vs = set(v.split(":")[0] for v in r["verdicts"].values())
        k = ("no exported function changed" if not r["fired"] else
             "counterexample" if "counterexample" in vs else
             "module rejected" if not r["readable"] else "/".join(sorted(vs)))
        tally[k] += 1
        print(os.path.basename(d), "gc" if r["gc"] else "nogc", k, r["verdicts"], flush=True)
print("modules:", dict(tally))
