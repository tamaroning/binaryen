#!/usr/bin/env python3
"""Print the uncovered source lines of a pass (grouped into ranges).
usage: uncov.py report.json File.cpp [more reports to subtract...]  (a line covered in any report is covered)"""
import json
import sys

SRC = "/home/tamaron/work/binaryen-0903/src/passes/"
reps = [json.load(open(p)) for p in [sys.argv[1]] + sys.argv[3:]]
f = sys.argv[2]
lines = {}
for rep in reps:
    for k, c in rep.get(f, {"lines": {}})["lines"].items():
        lines[int(k)] = max(lines.get(int(k), 0), c)
src = open(SRC + f).read().split("\n")
prev = None
for n in sorted(lines):
    if lines[n]:
        continue
    t = src[n - 1].rstrip()
    if not t.strip() or t.strip() in ("}", "{"):
        continue
    if prev is None or n - prev > 1:
        print("--- %d" % n)
    print("%5d %s" % (n, t))
    prev = n
