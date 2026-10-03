#!/usr/bin/env python3
"""Mutator smoke test: apply each mutator alone to freshly generated modules
and validate the result with wasm-tools.

usage: test_mut.py [N=60] [WORKDIR] [mutator ...]
exit status 1 if a mutator produced an invalid module.
"""
import collections
import os
import random
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen  # noqa: E402
import mut  # noqa: E402
from wmod import Unsupported  # noqa: E402


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 60
    wd = sys.argv[2] if len(sys.argv) > 2 else "/tmp/ufuzz-test-mut"
    names = sys.argv[3:] or [x for x in mut.MUTATORS if x not in ("splice", "splice_pool")]
    os.makedirs(wd, exist_ok=True)
    stat = collections.defaultdict(lambda: [0, 0, 0])  # tried, applied, invalid
    errs = collections.defaultdict(list)
    for name in names:
        for k in range(n):
            r = random.Random(hash((name, k)) & 0xffffff)
            m = gen.gen_module(5000 + k)
            f = r.choice([x for x in m.funcs if x.export and x.export.startswith("f")])
            stat[name][0] += 1
            try:
                mut.type_func(m, f)
            except Unsupported:
                continue
            mu = mut.Mut(r, m, [])
            try:
                ok = getattr(mu, "m_" + name)(f)
                if ok:
                    mut.type_func(m, f)
            except (Unsupported, ValueError, KeyError, IndexError, TypeError, AttributeError):
                continue
            if not ok:
                continue
            stat[name][1] += 1
            wat = "%s/%s-%d.wat" % (wd, name, k)
            with open(wat, "w") as fh:
                fh.write(m.text())
            p = subprocess.run(["wasm-tools", "parse", wat, "-o", wat[:-4] + ".wasm"], capture_output=True, text=True)
            if p.returncode == 0:
                p = subprocess.run(["wasm-tools", "validate", "--features", "all", wat[:-4] + ".wasm"],
                                   capture_output=True, text=True)
            if p.returncode:
                stat[name][2] += 1
                errs[name].append((k, " ".join(p.stderr.split())[:160]))
            else:
                os.remove(wat)
                os.remove(wat[:-4] + ".wasm")
    bad = 0
    for name in names:
        t, a, i = stat[name]
        bad += i
        print("%-14s tried %4d applied %4d invalid %3d" % (name, t, a, i))
        for k, e in errs[name][:2]:
            print("    seed %d: %s" % (k, e))
    sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
