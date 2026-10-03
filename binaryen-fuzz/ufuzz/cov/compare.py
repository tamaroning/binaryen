#!/usr/bin/env python3
"""Table of per-pass coverage from report.py JSON files.

usage: compare.py A.json [B.json] [--top N] [--only a.cpp,b.cpp]
"""
import json
import sys


def stat(e):
    L = e["lines"]
    return (sum(1 for c in L.values() if c), len(L), sum(1 for c in e["funcs"].values() if c), len(e["funcs"]),
            sum(e["br"].values()), len(e["br"]))


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    top = int(sys.argv[sys.argv.index("--top") + 1]) if "--top" in sys.argv else 40
    if "--top" in sys.argv:
        args.remove(sys.argv[sys.argv.index("--top") + 1])
    A = json.load(open(args[0]))
    B = json.load(open(args[1])) if len(args) > 1 else None
    rows = []
    for f, e in A.items():
        a = stat(e)
        b = stat(B[f]) if B and f in B else None
        rows.append((a[1] - a[0], f, a, b))
    rows.sort(reverse=True)
    print("%-34s %15s %9s %9s" % ("pass", "lines cov/tot", "funcs", "branches") + ("   -> after (lines, funcs, br)" if B else ""))
    for miss, f, a, b in rows[:top]:
        s = "%-34s %5d/%-5d %3.0f%% %4d/%-4d %4d/%-5d" % (f, a[0], a[1], 100.0 * a[0] / max(1, a[1]), a[2], a[3], a[4], a[5])
        if b:
            s += "   -> %5d (+%d) %4d (+%d) %5d (+%d)" % (b[0], b[0] - a[0], b[2], b[2] - a[2], b[4], b[4] - a[4])
        print(s)
    ta = [sum(x) for x in zip(*[stat(e) for e in A.values()])]
    print("TOTAL lines %d/%d funcs %d/%d branches %d/%d" % tuple(ta))
    if B:
        tb = [sum(x) for x in zip(*[stat(e) for e in B.values()])]
        print("AFTER lines %d/%d funcs %d/%d branches %d/%d" % tuple(tb))


if __name__ == "__main__":
    main()
