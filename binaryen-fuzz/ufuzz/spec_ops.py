#!/usr/bin/env python3
"""Instruction names of the Wasm 3.0 text grammar versus the generator's opcode set.
usage: spec_ops.py [N modules per run=150]
Spec names: first quoted token of every non-commented production in 6.3-text.instructions.spectec
(lines starting with `;;|` are the ill-formed combinations the spec itself marks)."""
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen  # noqa: E402
import table  # noqa: E402
from wmod import ATOMIC  # noqa: E402

SPEC = "/home/tamaron/work/spectec/specification/wasm-3.0/6.3-text.instructions.spectec"
NOT_INSTR = {"offset", "align", "mut", "ref", "null", "result", "param", "type", "local", "func", "item", "offset=", "align="}


def spec_names():
    out = set()
    for line in open(SPEC):
        m = re.match(r'\s*\|\s*"([a-z0-9_]+(?:\.[a-z0-9_]+)*)"', line)
        if m and m.group(1) not in NOT_INSTR:
            out.add(m.group(1))
    return out


def generated(n):
    ops = set()
    for k in range(n):
        for flags in ((True, False, None), (False, False, None)):
            m = gen.gen_module(777000 + k, flags=(flags[0], flags[1], table.FOCUS_TAGS and sorted(table.FOCUS_TAGS)[k % len(table.FOCUS_TAGS)]))
            for f in m.funcs:
                for b in f.body:
                    ops.update(x.op for x in b.walk())
    return ops


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 150
    os.environ["UFUZZ_FEATURES_ADD"] = "atomic"
    sp = spec_names()
    g = generated(n) | {r.name for r in table.ROWS}
    missing = sorted(sp - g)
    print("spec instruction names %d, generated %d, spec names missing from the generator %d" % (len(sp), len(sp & g), len(missing)))
    for x in missing:
        print("  ", x)
    print("generated but not a spec name (atomics etc.):", sorted(g - sp - set(ATOMIC) - {"then", "else"})[:40])


if __name__ == "__main__":
    main()
