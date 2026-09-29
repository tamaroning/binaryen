#!/usr/bin/env python3
"""Sum stats.json of round-5 workers: sum2.py DIR (containing w*/stats.json)."""
import glob
import json
import sys


def add(a, b):
    for k, v in b.items():
        if isinstance(v, dict):
            add(a.setdefault(k, {}), v)
        elif isinstance(v, (int, float)):
            a[k] = a.get(k, 0) + v


tot = {}
for f in glob.glob(sys.argv[1] + "/w*/stats.json"):
    add(tot, json.load(open(f)))
pc = tot.pop("per_cfg", {})
print(json.dumps(tot, indent=1))
for k, v in sorted(pc.items(), key=lambda x: -x[1]["proved"]):
    print(f"{v['proved']:7d} {v['cex']:5d} {v['other']:6d}  {k}")
