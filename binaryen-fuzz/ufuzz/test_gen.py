#!/usr/bin/env python3
"""Generator smoke test: N modules per focus family, each checked with
`wasm-tools parse` + `validate --features all`.  Also prints the opcode
coverage of the generated modules.

usage: test_gen.py [N=300] [WORKDIR] [family ...]
exit status 1 if any module is invalid.
"""
import collections
import concurrent.futures as cf
import os
import random
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen  # noqa: E402
import table  # noqa: E402
from wmod import ATOMIC, SIMD, VMEM  # noqa: E402


def one(args):
    fam, seed, wd = args
    r = random.Random(seed ^ 0x5bd1)
    wide = r.random() < .3
    noeh = r.random() < .15
    m = gen.gen_module(seed, flags=(wide, noeh, fam))
    wat = "%s/%s-%d.wat" % (wd, fam or "none", seed)
    with open(wat, "w") as fh:
        fh.write(m.text())
    p = subprocess.run(["wasm-tools", "parse", wat, "-o", wat[:-4] + ".wasm"], capture_output=True, text=True)
    if p.returncode:
        return fam, seed, "parse: " + p.stderr.strip().splitlines()[0][:150], m
    p = subprocess.run(["wasm-tools", "validate", "--features", "all", wat[:-4] + ".wasm"], capture_output=True, text=True)
    if p.returncode:
        return fam, seed, "validate: " + " ".join(p.stderr.split())[:200], m
    os.remove(wat)
    os.remove(wat[:-4] + ".wasm")
    return fam, seed, None, m


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 300
    wd = sys.argv[2] if len(sys.argv) > 2 else "/tmp/ufuzz-test-gen"
    fams = sys.argv[3:] or sorted(table.FOCUS_TAGS) + [None]
    os.makedirs(wd, exist_ok=True)
    jobs = [(f, 1000 * (i + 1) + k, wd) for i, f in enumerate(fams) for k in range(n)]
    bad = collections.defaultdict(list)
    ops = collections.Counter()
    ok = collections.Counter()
    with cf.ThreadPoolExecutor(1) as ex:
        for fam, seed, err, m in ex.map(one, jobs):
            ok[fam] += 1
            if err:
                bad[fam].append((seed, err))
            for f in m.funcs:
                for b in f.body:
                    for x in b.walk():
                        ops[x.op] += 1
    nbad = 0
    for fam in fams:
        b = bad.get(fam, [])
        nbad += len(b)
        print("%-10s modules %4d invalid %3d" % (fam, ok[fam], len(b)))
        for seed, err in b[:3]:
            print("    seed %d: %s" % (seed, err))
    allsimd = set(SIMD) | set(VMEM)
    print("distinct opcodes: %d; simd %d/%d; atomic %d/%d" % (
        len(ops), len(allsimd & set(ops)), len(allsimd), len(set(ATOMIC) & set(ops)), len(ATOMIC)))
    print("never produced simd:", sorted(allsimd - set(ops))[:40])
    sys.exit(1 if nbad else 0)


if __name__ == "__main__":
    main()
