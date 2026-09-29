#!/usr/bin/env python3
"""Classify 'candidate: block is ill-typed or outside the supported subset'
verdicts by the construct the optimized function contains.

usage: classify_cand.py SEED0 N GEN(gc|ca)
"""
import collections
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import drive  # noqa: E402
import gen_ca  # noqa: E402
import gen_gc  # noqa: E402

SCR = drive.SCR
wd = SCR + "/classify"
os.makedirs(wd, exist_ok=True)
seed0, n, gen = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]
cnt = collections.Counter()
percfg = collections.Counter()
for seed in range(seed0, seed0 + n):
    wat = gen_ca.gen_module(seed) if gen == "ca" else gen_gc.gen_module(seed, None, 1)
    open(wd + "/m.wat", "w").write(wat)
    if subprocess.run(["wasm-tools", "parse", wd + "/m.wat", "-o", wd + "/m.wasm"]).returncode:
        continue
    for cfg in (drive.CA_CONFIGS if gen == "ca" else drive.CONFIGS):
        if subprocess.run([drive.WASM_OPT, "-all"] + cfg + [wd + "/m.wasm", "-o", wd + "/o.wasm"]).returncode:
            continue
        out = subprocess.run([drive.EXWASM, "tv", wd + "/m.wasm", wd + "/o.wasm"], capture_output=True, text=True).stdout
        bad = [l.split("\t")[0] for l in out.splitlines() if "candidate: block is ill-typed" in l]
        if not bad:
            continue
        txt = subprocess.run([drive.WASM_OPT, "-all", wd + "/o.wasm", "--print"], capture_output=True, text=True).stdout
        funcs = re.split(r"\n (?=\(func )", txt)
        for name in bad:
            body = [f for f in funcs if f.startswith("(func $%s " % name)]
            if not body:
                cnt["(function not found)"] += 1
                continue
            b = body[0]
            tags = []
            if "br_on_null" in b or "br_on_non_null" in b:
                tags.append("br_on_null/br_on_non_null")
            if re.search(r"\((if|block|loop) (\$\S+ )?\(result \(?(ref|eqref|anyref|nullref|structref|arrayref)", b):
                tags.append("ref-typed block/if result")
            if re.search(r"\(select \(result \(?(ref|eqref|nullref|structref|arrayref)", b) or re.search(r"\(select\n(?:.*\n)*?.*\(ref", b) and False:
                tags.append("ref-typed select")
            if "ref.cast" in b or "ref.test" in b:
                tags.append("ref.cast/ref.test")
            if "(ref.null none)" in b or "nullref" in b:
                tags.append("ref.null none / nullref")
            if "(local $" in b and re.search(r"\(local \$\S+ \(ref \$", b):
                tags.append("non-nullable ref local")
            if not tags:
                tags.append("other")
                open(wd + "/other_%s_%d.wat" % (name, seed), "w").write(b)
            for t in tags:
                cnt[t] += 1
            percfg[" ".join(cfg)] += 1
print(cnt.most_common())
print(percfg.most_common())
