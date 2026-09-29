#!/usr/bin/env python3
"""Merge the stats of every ufuzz worker and print the campaign summary.

usage: aggregate.py [--brief] [--runs DIR] [--json OUT]

Reads DIR/*/stats.json (default: runs/), sums every numeric leaf, lists
the findings in DIR/*/bad/, and prints totals, verdicts, findings, crash
signatures, reasons for unsupported functions, and the diversity tables
(sources, opcode families, feature combinations, per-pass change rates,
mutators).  --json writes the merged stats.
"""
import glob
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
# per-worker values that are not summed
SCALAR = {"worker", "started", "updated", "exwasm", "last_seed"}


def merge(a, b):
    for k, v in b.items():
        if k in SCALAR:
            continue
        if isinstance(v, dict):
            merge(a.setdefault(k, {}), v)
        elif isinstance(v, (int, float)) and not isinstance(v, bool):
            a[k] = a.get(k, 0) + v
    return a


def top(d, n, key=None):
    items = sorted(d.items(), key=key or (lambda kv: -kv[1]))
    return items[:n]


def table(rows, head):
    w = [max(len(str(r[i])) for r in rows + [head]) for i in range(len(head))]
    fmt = "  " + "  ".join("%%-%ds" % x if i == 0 else "%%%ds" % x for i, x in enumerate(w))
    print(fmt % tuple(head))
    for r in rows:
        print(fmt % tuple(r))


def pct(a, b):
    return "%.1f%%" % (100.0 * a / b) if b else "-"


def findings(runs):
    out = {}
    for d in sorted(glob.glob(runs + "/*/bad/*")):
        kind = os.path.basename(d).split("-")[0]
        meta = {}
        try:
            with open(d + "/meta.json") as fh:
                meta = json.load(fh)
        except (OSError, ValueError):
            pass
        out.setdefault(kind, []).append((d, meta))
    return out


def main():
    args = sys.argv[1:]
    brief = "--brief" in args
    runs = os.path.join(HERE, "runs")
    jout = None
    if "--runs" in args:
        runs = args[args.index("--runs") + 1]
    if "--json" in args:
        jout = args[args.index("--json") + 1]
    stats, workers = {}, []
    for p in sorted(glob.glob(runs + "/*/stats.json")):
        try:
            with open(p) as fh:
                s = json.load(fh)
        except (OSError, ValueError):
            continue
        workers.append(s)
        merge(stats, s)
    if not workers:
        print("no stats under", runs)
        return
    g = stats.get
    snaps = sorted({w.get("exwasm", "?") for w in workers})
    print("workers %d, worker-hours %.1f, exwasm %s" % (len(workers), g("elapsed", 0) / 3600,
                                                          ", ".join(os.path.basename(s) for s in snaps)))
    fin, fdrop = g("funcs_in", 0), g("funcs_dropped", 0)
    print("oracle A: modules %d, functions %d (%d kept, %s dropped by the self-check), tv runs %d"
          % (g("modules", 0), fin, fin - fdrop, pct(fdrop, fin), g("tv_runs", 0)))
    print("oracle B: modules %d" % g("modules_b", 0))
    v = g("verdicts", {})
    print("verdicts:", ", ".join("%s %d" % kv for kv in top(v, 20)))
    ob = {k: n for k, n in g("oracle_b", {}).items() if not k.startswith("modules:")}
    print("oracle B results:", ", ".join("%s %d" % kv for kv in top(ob, 12)))
    fs = findings(runs)
    print("findings: cex %d, cex-suspect %d, v8 diffs %d, invalid outputs %d, crashes saved %d, fatal saved %d"
          % (len(fs.get("cex", [])), len(fs.get("cexsus", [])), len(fs.get("v8diff", [])),
             len(fs.get("invalid", [])), len(fs.get("crash", [])), len(fs.get("fatal", []))))
    for kind in ("cex", "v8diff", "invalid"):
        for d, meta in fs.get(kind, [])[:20]:
            print("  %-8s %s  cfg=%s %s" % (kind, os.path.relpath(d, HERE), meta.get("cfg", "?"),
                                           ",".join(meta.get("cex_funcs", [])) or meta.get("sig", "")))
    print("crash signatures:")
    for k, n in top(g("crash_sigs", {}), 8 if brief else 25):
        print("  %6d  %s" % (n, k))
    if brief:
        return
    for name, key in (("unsupported (output)", "unsupported"), ("unknown", "unknown"), ("error", "error"),
                      ("dropped by the self-check", "input_unsupported"), ("invalid inputs", "invalid"),
                      ("rejected inputs", "input_rejected")):
        d = g(key, {})
        if d:
            print("%s (%d):" % (name, sum(d.values())))
            for k, n in top(d, 10):
                print("  %6d  %s" % (n, k))
    src = g("sources", {})
    print("sources:")
    table([[k, e.get("modules", 0), e.get("funcs", 0), e.get("invalid", 0), e.get("input_unsup", 0)]
           for k, e in sorted(src.items())], ["source", "modules", "funcs kept", "invalid", "funcs dropped"])
    fam = g("families", {})
    tot = sum(fam.values())
    print("opcode families in validated functions (%d nodes, %d distinct opcodes):" % (tot, len(g("ops", {}))))
    for k, n in top(fam, 30):
        print("  %-16s %8d  %s" % (k, n, pct(n, tot)))
    famb = g("families_b", {})
    if famb:
        totb = sum(famb.values())
        print("opcode families in oracle-B-only (raw) modules:")
        for k, n in top(famb, 20):
            print("  %-16s %8d  %s" % (k, n, pct(n, totb)))
    nf = g("nfeats", {})
    print("features per function:", ", ".join("%s: %d" % (k, nf[k]) for k in sorted(nf, key=int)))
    pairs = g("feat_pairs", {})
    print("feature pairs co-occurring in one function: %d distinct; most common:" % len(pairs))
    for k, n in top(pairs, 12):
        print("  %6d  %s" % (n, k))
    combos = g("feature_combos", {})
    print("feature combinations: %d distinct; most common:" % len(combos))
    for k, n in top(combos, 10):
        print("  %6d  %s" % (n, k or "(none)"))
    pp = g("per_pass", {})
    rows = []
    for p, e in pp.items():
        runs_n = e.get("runs", 0)
        rows.append([p, runs_n, e.get("single_runs", 0), pct(e.get("mod_changed", 0), runs_n),
                     pct(e.get("funcs_changed", 0), e.get("funcs", 0)),
                     pct(e.get("single_funcs_changed", 0), e.get("single_funcs", 0))])
    rows.sort(key=lambda r: -r[1])
    print("per pass (%d passes): runs, runs alone, modules changed, functions changed, functions changed alone" % len(rows))
    table(rows, ["pass", "runs", "alone", "mod chg", "fn chg", "fn chg alone"])
    mu = g("mutators", {})
    print("mutators:")
    table([[k, e.get("applied", 0), pct(e.get("invalid", 0), e.get("applied", 0)),
            pct(e.get("input_unsup", 0), e.get("applied", 0)), e.get("tv", 0), pct(e.get("changed", 0), e.get("tv", 0))]
           for k, e in sorted(mu.items(), key=lambda kv: -kv[1].get("applied", 0))[:30]],
          ["mutator", "applied", "invalid", "dropped", "tv", "changed"])
    if jout:
        with open(jout, "w") as fh:
            json.dump(stats, fh, indent=1, sort_keys=True)


if __name__ == "__main__":
    main()
