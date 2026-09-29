#!/usr/bin/env python3
"""Modules with indirect calls (call_indirect through a table, call_ref through
a global) whose targets have different effects, for testing
--generate-global-effects / closed-world effect analysis. No imports, so
--closed-world is sound.

usage: gen_ind.py SEED OUTPREFIX
"""
import json
import random
import sys

EFFECTS = [
    "(i32.add (local.get 0) (i32.const {c}))",
    "(block (result i32) (global.set $g (i32.add (global.get $g) (local.get 0))) (i32.const {c}))",
    "(block (result i32) (i32.store (i32.and (local.get 0) (i32.const 0xfc)) (i32.const {c})) (local.get 0))",
    "(block (result i32) (if (i32.and (local.get 0) (i32.const 1)) (then (unreachable))) (i32.const {c}))",
    "(i32.load (i32.and (local.get 0) (i32.const 0xfc)))",
    "(block (result i32) (drop (memory.grow (i32.const 0))) (global.get $g))",
    "(i32.div_u (i32.const {c}) (local.get 0))",
    "(call $t{j} (i32.add (local.get 0) (i32.const 1)))",
    "(call_indirect (type $sig) (local.get 0) (i32.and (local.get 0) (i32.const 3)))",
]


def main():
    seed = int(sys.argv[1])
    out = sys.argv[2]
    r = random.Random(seed)
    nt = r.randrange(3, 8)
    lines = ["(module",
             "(type $sig (sub (func (param i32) (result i32))))",
             "(type $sub (sub $sig (func (param i32) (result i32))))" if r.random() < 0.3 else "",
             '(memory (export "mem") 1 2)',
             '(global $g (export "g") (mut i32) (i32.const 0))',
             "(global $fp (mut (ref null $sig)) (ref.null $sig))",
             f"(table $tab {nt + 2} funcref)"]
    targets = []
    for j in range(nt):
        e = r.choice(EFFECTS)
        if "$t{j}" in e and j == 0:
            e = EFFECTS[0]
        if "call_indirect" in e and r.random() < 0.7:
            e = EFFECTS[1]
        body = e.format(c=r.randrange(-5, 50), j=r.randrange(j) if j else 0)
        ty = "$sig" if r.random() < 0.8 or "$sub" not in lines[2] else "$sub"
        lines.append(f"(func $t{j} (type {ty}) (param i32) (result i32) {body})")
        targets.append(j)
    in_elem = [j for j in targets if r.random() < 0.5]
    if in_elem:
        lines.append(f"(elem (table $tab) (i32.const 0) func {' '.join(f'$t{j}' for j in in_elem)})")
    if r.random() < 0.3:
        lines.append(f"(elem $pe func {' '.join(f'$t{j}' for j in r.sample(targets, min(2, len(targets))))})")
    sigs = {}
    # setup: install more targets at runtime
    rest = [j for j in targets if j not in in_elem]
    setup = []
    for k, j in enumerate(rest):
        setup.append(f"(table.set $tab (i32.const {len(in_elem) + k}) (ref.func $t{j}))")
    if "(elem $pe" in "\n".join(lines):
        setup.append("(table.init $tab $pe (i32.const 5) (i32.const 0) (i32.const 1))")
    setup.append(f"(global.set $fp (ref.func $t{r.choice(targets)}))")
    lines.append(f'(func $setup (export "setup") {" ".join(setup)})')
    sigs["setup"] = []
    for e in range(r.randrange(2, 5)):
        stmts = []
        for _ in range(r.randrange(1, 5)):
            idx = r.choice(["(local.get 1)", f"(i32.const {r.randrange(nt + 2)})",
                            "(i32.and (local.get 0) (i32.const 7))"])
            call = r.choice([f"(call_indirect $tab (type $sig) (local.get 0) {idx})",
                             "(call_ref $sig (local.get 0) (ref.as_non_null (global.get $fp)))",
                             f"(call $t{r.choice(targets)} (local.get 0))"])
            k = r.random()
            if k < 0.4:
                stmts.append(f"(drop {call})")
            elif k < 0.7:
                stmts.append(f"(local.set 2 (i32.add (local.get 2) {call}))")
            else:
                stmts.append(f"(local.set 2 (i32.xor (global.get $g) {call}))")
            if r.random() < 0.3:
                stmts.append("(local.set 2 (i32.add (local.get 2) (global.get $g)))")
            if r.random() < 0.3:
                stmts.append("(local.set 2 (i32.add (local.get 2) (i32.load (i32.const 8))))")
        lines.append(f'(func $e{e} (export "e{e}") (param i32 i32) (result i32) (local i32) '
                     f'{" ".join(stmts)} (local.get 2))')
        sigs[f"e{e}"] = ["i32", "i32"]
    lines.append(")")
    with open(out + ".wat", "w") as f:
        f.write("\n".join(l for l in lines if l))
    with open(out + ".sig.json", "w") as f:
        json.dump(sigs, f)


if __name__ == "__main__":
    main()
