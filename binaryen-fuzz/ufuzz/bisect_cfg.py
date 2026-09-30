#!/usr/bin/env python3
"""Find the first pass of a -O pipeline after which exwasm reports a counterexample.

usage: bisect.py FINDING_DIR [FUNC ...]

Expands the recorded configuration into its pass list (BINARYEN_PASS_DEBUG),
runs growing prefixes on m.wasm, and reports the first prefix whose output
has a counterexample, then whether the last pass alone (on the previous
prefix's output) reproduces it.
"""
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402


def sh(x, env=None):
    return subprocess.run(x, capture_output=True, text=True, env=env)


def main():
    d = sys.argv[1]
    meta = json.load(open(d + "/meta.json"))
    funcs = sys.argv[2:] or meta["cex_funcs"]
    c = cfg.load()
    conf = meta["cfg"].split()
    env = dict(os.environ, BINARYEN_PASS_DEBUG="1")
    r = sh([c["wasm_opt"], *cfg.FEATURES, *conf, d + "/m.wasm", "-o", "/tmp/bis_full.wasm"], env)
    passes = re.findall(r"running pass: (\S+?)\.\.\.", r.stdout + r.stderr)
    extra = [x for x in conf if x.startswith("--") and "=" in x or x in ("--closed-world", "--low-memory-unused")]

    def cex(o):
        bad = []
        for f in funcs:
            t = sh([c["exwasm"], "--il", c["il"], "tv", d + "/m.wasm", o, "--func", f])
            if any(l.startswith(f + "\t") and "\tcounterexample\t" in l for l in t.stdout.splitlines()):
                bad.append(f)
        return bad

    out = {"dir": os.path.basename(d), "cfg": meta["cfg"], "npasses": len(passes)}
    prev = "/tmp/bis_prev.wasm"
    sh(["cp", d + "/m.wasm", prev])
    for n in range(1, len(passes) + 1):
        rr = sh([c["wasm_opt"], *cfg.FEATURES, *extra, *["--" + p for p in passes[:n]], d + "/m.wasm", "-o", "/tmp/bis_cur.wasm"])
        if rr.returncode:
            continue
        bad = cex("/tmp/bis_cur.wasm")
        if bad:
            out.update(first_pass=passes[n - 1], index=n, funcs=bad, prefix_tail=passes[max(0, n - 4):n])
            # the last pass alone on the previous prefix's output
            rr = sh([c["wasm_opt"], *cfg.FEATURES, *extra, *["--" + p for p in passes[:n - 1]], d + "/m.wasm", "-o", prev])
            rr = sh([c["wasm_opt"], *cfg.FEATURES, *extra, "--" + passes[n - 1], prev, "-o", "/tmp/bis_step.wasm"])
            t = sh([c["exwasm"], "--il", c["il"], "tv", prev, "/tmp/bis_step.wasm", "--func", bad[0]])
            out["step_alone"] = [l.split("\t")[1] for l in t.stdout.splitlines() if l.startswith(bad[0] + "\t")]
            break
    else:
        out["first_pass"] = None
    print(json.dumps(out), flush=True)


if __name__ == "__main__":
    main()
