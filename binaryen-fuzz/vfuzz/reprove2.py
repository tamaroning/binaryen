#!/usr/bin/env python3
"""Re-prove logged non-proved cases (tv2.py WORKDIR/nonproved.jsonl) with
another exwasm-tv binary.

usage: reprove2.py EXWASM OUTDIR JSONL...
Prints old kind -> new outcome counts and writes OUTDIR/summary.json.  New
counterexamples are written as OUTDIR/bad/NNNNN in the triage2.py layout.
"""
import json
import os
import re
import subprocess
import sys
from collections import Counter
from concurrent.futures import ThreadPoolExecutor

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import tv2  # noqa: E402


def classify(rc, msg):
    if rc == "timeout":
        return "timeout", "process timeout"
    if rc == 0 and "equivalent" in msg:
        return "proved", ""
    if "counterexample" in msg:
        return "cex", ""
    if "error: not proved" in msg:
        return "not_proved", tv2.reason(msg)
    return "unsupported", tv2.reason(msg)


def work(args):
    exw, case = args
    rc, msg = tv2.run([exw, *case["cmd"]], 120)
    k, why = classify(rc, msg)
    return case, k, why, msg


def main():
    exw, out = sys.argv[1], sys.argv[2]
    cases = []
    for f in sys.argv[3:]:
        with open(f) as fh:
            cases += [json.loads(l) for l in fh if l.strip()]
    os.makedirs(os.path.join(out, "bad"), exist_ok=True)
    trans = Counter()
    newwhy = Counter()
    nbad = 0
    with ThreadPoolExecutor(int(os.environ.get("JOBS", "12"))) as ex:
        for case, k, why, msg in ex.map(work, [(exw, c) for c in cases]):
            trans[f"{case['kind']} -> {k}"] += 1
            if k not in ("proved", "cex"):
                newwhy[f"{k}: {why}"] += 1
            if k == "cex":
                nbad += 1
                d = os.path.join(out, "bad", f"{nbad:05d}")
                os.makedirs(d, exist_ok=True)
                with open(os.path.join(d, "m.wat"), "w") as fh:
                    fh.write(case["wat"])
                ps = re.search(r'\(func \$f \(export "f"\)(.*)\(result', case["wat"]).group(1)
                with open(os.path.join(d, "m.json"), "w") as fh:
                    json.dump({"params": re.findall(r"\(param \$\w+ (i32|i64)\)", ps)}, fh)
                subprocess.run([tv2.WASM_OPT, *tv2.FE, os.path.join(d, "m.wat"), "-o", os.path.join(d, "m.wasm")])
                subprocess.run([tv2.WASM_OPT, *tv2.FE, os.path.join(d, "m.wasm"), *case["cfg"].split(),
                                "-o", os.path.join(d, "o.wasm")])
                with open(os.path.join(d, "info.txt"), "w") as fh:
                    fh.write(f"seed={case['seed']}\nconfig={case['cfg']}\nold={case['kind']} {case['why']}\n{msg[-3000:]}\n")
                with open(os.path.join(d, "cmd.json"), "w") as fh:
                    json.dump([exw, *case["cmd"]], fh)
    res = {"cases": len(cases), "transitions": dict(trans), "remaining": dict(newwhy.most_common())}
    with open(os.path.join(out, "summary.json"), "w") as fh:
        json.dump(res, fh, indent=1)
    print(json.dumps(res, indent=1))


if __name__ == "__main__":
    main()
