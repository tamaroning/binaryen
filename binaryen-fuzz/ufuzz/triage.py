#!/usr/bin/env python3
"""Attribute each ufuzz counterexample to single wasm-opt passes.

usage: triage.py [runs-dir-glob ...]   (default: runs/*/bad/cex-*)

For every finding, re-runs the module through each pass alone (and through
the recorded configuration) and validates the counterexample functions
with exwasm tv.  Prints, per finding, the single passes that reproduce a
counterexample; findings with none are reported as "only in combination".
"""
import glob
import json
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402

PASSES = ["optimize-instructions", "precompute", "precompute-propagate", "remove-unused-brs", "simplify-locals",
          "simplify-locals-nostructure", "code-folding", "merge-blocks", "vacuum", "local-cse", "coalesce-locals",
          "rse", "pick-load-signs", "dce", "reorder-locals", "memory-packing", "remove-unused-names", "untee",
          "flatten", "ssa-nomerge", "code-pushing", "heap2local", "alignment-lowering", "inlining-optimizing",
          "dae-optimizing", "optimize-casts", "merge-locals", "simplify-globals-optimizing", "local-subtyping",
          "gufa", "licm", "constraint-analysis", "heap-store-optimization", "dealign", "avoid-reinterprets",
          "optimize-added-constants", "duplicate-function-elimination", "remove-unused-module-elements",
          "reorder-functions", "rereloop"]
PREREQ = {"optimize-added-constants": ["--low-memory-unused"], "rereloop": ["--flatten"]}


def sh(cmd, timeout=300):
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
        return p.returncode, p.stdout
    except subprocess.TimeoutExpired:
        return "timeout", ""


def cex_of(c, m, o, funcs):
    out = []
    for f in funcs:
        rc, txt = sh([c["exwasm"], "--il", c["il"], "tv", m, o, "--func", f, "--smt-timeout-ms", "10000"])
        for ln in txt.splitlines():
            p = ln.split("\t")
            if len(p) > 2 and p[0] == f and p[1] == "counterexample":
                out.append(f)
    return out


def main():
    c = cfg.load()
    dirs = sys.argv[1:] or sorted(glob.glob(os.path.join(HERE, "runs/*/bad/cex-*")))
    tmp = tempfile.mkdtemp()
    o = tmp + "/o.wasm"
    for d in dirs:
        meta = json.load(open(d + "/meta.json"))
        funcs = meta.get("cex_funcs", [])
        m = d + "/m.wasm"
        cfgs = meta["cfg"].split()
        found = []
        for p in PASSES:
            rc, _ = sh([c["wasm_opt"]] + cfg.FEATURES + PREREQ.get(p, []) + ["--" + p, m, "-o", o], 120)
            if rc != 0:
                continue
            bad = cex_of(c, m, o, funcs)
            if bad:
                found.append(p)
        print(json.dumps({"dir": os.path.relpath(d, HERE), "cfg": meta["cfg"], "funcs": funcs,
                          "single_passes": found, "v8": (meta.get("v8") or {}).get("same")}), flush=True)


if __name__ == "__main__":
    main()
