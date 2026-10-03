#!/usr/bin/env python3
"""Rank the passes of the default -O pipelines / FRUITFUL by uncovered lines.
usage: rank.py report.json [pass2file.json pipeline_passes.txt] [N]"""
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import drive  # noqa: E402

rep = json.load(open(sys.argv[1]))
p2f = json.load(open(sys.argv[2]))
pipe = set(open(sys.argv[3]).read().split())
names = pipe | set(drive.FRUITFUL)
files = {}
for n in names:
    for f in p2f.get(n, []):
        files.setdefault(f, set()).add(n)
rows = []
for f, ps in files.items():
    e = rep.get(f)
    if not e:
        continue
    tot = len(e["lines"])
    cov = sum(1 for c in e["lines"].values() if c)
    rows.append((tot - cov, f, cov, tot, sorted(ps)))
rows.sort(reverse=True)
for miss, f, cov, tot, ps in rows[:int(sys.argv[4]) if len(sys.argv) > 4 else 25]:
    print("%-34s uncovered %4d  (%d/%d)  %s" % (f, miss, cov, tot, ",".join(ps)))
