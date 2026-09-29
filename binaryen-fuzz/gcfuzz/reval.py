#!/usr/bin/env python3
"""Re-validate the same wasm-opt outputs with several exwasm snapshots and
count per-function verdict transitions.

usage: reval.py WORKDIR GEN SEED0 N     (GEN: gc | ca | sub | alias)
Writes WORKDIR/reval.json; gc4 counterexamples go to WORKDIR/bad/.
"""
import collections
import hashlib
import json
import os
import shutil
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import drive  # noqa: E402
import gen_ca  # noqa: E402
import gen_gc  # noqa: E402
import gen_sub  # noqa: E402

VERS = ["gc2", "gc3", "gc4"]
wd, gen, seed0, n = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
os.makedirs(wd + "/bad", exist_ok=True)
gen_gc.ALIAS = gen == "alias"
configs = drive.CA_CONFIGS if gen == "ca" else drive.SUB_CONFIGS if gen == "sub" else drive.CONFIGS
trans = collections.Counter()
final = collections.Counter()
nbad = 0
nmod = 0


def tv(ver, a, b):
    rc, out = drive.run([drive.SCR + "/bin/exwasm-" + ver, "tv", a, b, "--smt-timeout-ms", "10000"], 300)
    res = {}
    for line in out.splitlines():
        p = line.split("\t")
        if len(p) >= 3 and p[1] in ("equivalent", "counterexample", "unsupported", "unknown"):
            res[p[0]] = (p[1], drive.norm(p[3] if len(p) > 3 else ""))
    if not res:
        msg = [l for l in out.splitlines() if l.startswith("error")] or ["timeout" if rc == "timeout" else out[-100:]]
        res["*"] = ("error", drive.norm(msg[0]))
    return res, out


for seed in range(seed0, seed0 + n):
    wat = {"ca": lambda s: gen_ca.gen_module(s), "sub": lambda s: gen_sub.gen_module(s)}.get(
        gen, lambda s: gen_gc.gen_module(s, None, 1))(seed)
    mw, mb, ob = wd + "/m.wat", wd + "/m.wasm", wd + "/o.wasm"
    open(mw, "w").write(wat)
    if drive.run(["wasm-tools", "parse", mw, "-o", mb], 30)[0] != 0:
        continue
    nmod += 1
    seen = set()
    for cfg in configs:
        if drive.run([drive.WASM_OPT, "-all"] + cfg + [mb, "-o", ob], 60)[0] != 0:
            continue
        h = hashlib.sha1(open(ob, "rb").read()).hexdigest()
        if h in seen:
            continue
        seen.add(h)
        rs = {}
        for v in VERS:
            rs[v], out = tv(v, mb, ob)
            if v == "gc4" and any(x[0] == "counterexample" for x in rs[v].values()):
                nbad += 1
                d = "%s/bad/%05d" % (wd, nbad)
                os.makedirs(d)
                shutil.copy(mw, d + "/m.wat")
                shutil.copy(mb, d + "/m.wasm")
                shutil.copy(ob, d + "/o.wasm")
                open(d + "/info.txt", "w").write("cex seed=%d cfg=%s\n%s" % (seed, " ".join(cfg), out))
        names = set().union(*[set(r) for r in rs.values()])
        for fn in names:
            g = [rs[v].get(fn, rs[v].get("*", ("error", "missing"))) for v in VERS]
            final[g[2][0]] += 1
            if g[0][0] != "equivalent" or g[2][0] != "equivalent":
                trans["%s: %s | gc3 %s | gc4 %s: %s" % (g[0][0], g[0][1], g[1][0], g[2][0], g[2][1])] += 1
    json.dump({"modules": nmod, "last_seed": seed, "gc4_final": final, "transitions": trans, "gc4_cex_runs": nbad},
              open(wd + "/reval.json", "w"), indent=1)
