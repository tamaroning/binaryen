#!/usr/bin/env python3
"""How often each cov row / module part shows up in N generated modules.
usage: rowstats.py [N=300] [focus|none]"""
import collections
import os
import random
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import cfg  # noqa: E402
import gen  # noqa: E402
import mut  # noqa: E402
from wmod import Unsupported  # noqa: E402

n = int(sys.argv[1]) if len(sys.argv) > 1 else 300
mode = sys.argv[2] if len(sys.argv) > 2 else "none"
rows = collections.Counter()
parts = collections.Counter()
unt = 0
for s in range(n):
    if mode == "focus":
        m = gen.gen_module(900000 + s, flags=(False, False, "cov"))
    else:
        cf = cfg.load()
        m = gen.gen_module(900000 + s, flags=gen.pick_flags(random.Random((900000 + s) * 7 + 1), cf))
    for f in m.funcs:
        for k, v in f.meta.get("rows", {}).items():
            if k.startswith("cov:"):
                rows[k] += v
        if f.meta.get("cov"):
            parts["callee:" + f.meta["cov"]] += 1
    if any(g[0].startswith("$cg") for g in m.globals):
        parts["globals"] += 1
    if m.meta.get("cov_segs"):
        parts["data"] += 1
for k, v in sorted(rows.items()):
    print("%-28s %6d" % (k, v))
for k, v in sorted(parts.items()):
    print("%-28s %6d" % (k, v))
