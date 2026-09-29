#!/usr/bin/env python3
"""Directed sweep for round 5: self-changing / state-dependent expressions E
placed twice into consumer shapes that Binaryen folds when the two operands
look equal.  Writes OUTDIR/sNNN.wat + .json for `ONE=... tv2.py`.

usage: sweep_tv2.py OUTDIR
"""
import json
import os
import sys

E = {
    "grow1": "(memory.grow (i32.const 1))",
    "grow0": "(memory.grow (i32.const 0))",
    "growp": "(memory.grow (local.get $p0))",
    "size_after_grow": "(block (result i32) (drop (memory.grow (i32.const 1))) (memory.size))",
    "load": "(i32.load (local.get $p1))",
    "load_after_store": "(block (result i32) (i32.store (local.get $p1) (i32.add (i32.load (local.get $p1)) (i32.const 1))) (i32.load (local.get $p1)))",
    "gblock": "(block (result i32) (global.set $g0 (i32.add (global.get $g0) (i32.const 1))) (global.get $g0))",
    "teeinc": "(local.tee $l0 (i32.add (local.get $l0) (i32.const 1)))",
    "call": "(call $h (local.get $p0))",
    "brif_tee": "(block $x (result i32) (br_if $x (local.get $l0) (local.tee $l0 (i32.add (local.get $l0) (i32.const 1)))))",
    "div": "(i32.div_s (local.get $p0) (local.get $p1))",
    "load_oob": "(i32.load offset=65535 (local.get $p1))",
}
C = {
    "sub": "(i32.sub {a} {b})",
    "xor": "(i32.xor {a} {b})",
    "eq": "(i32.eq {a} {b})",
    "ne": "(i32.ne {a} {b})",
    "ltu": "(i32.lt_u {a} {b})",
    "les": "(i32.le_s {a} {b})",
    "and": "(i32.and {a} {b})",
    "or": "(i32.or {a} {b})",
    "divu": "(i32.div_u {a} {b})",
    "remu": "(i32.rem_u {a} {b})",
    "select": "(select {a} {b} (local.get $p0))",
    "if": "(if (result i32) (local.get $p0) (then {a}) (else {b}))",
    "eqzsub": "(i32.eqz (i32.sub {a} {b}))",
    "mulsame": "(i32.mul {a} {b})",
    "store2": "(block (result i32) (i32.store (i32.const 16) {a}) (i32.store (i32.const 16) {b}) (i32.load (i32.const 16)))",
    "ifstore": "(block (result i32) (if (local.get $p0) (then (i32.store (i32.const 16) {a})) (else (i32.store (i32.const 16) {b}))) (i32.load (i32.const 16)))",
    "gset2": "(block (result i32) (global.set $g1 {a}) (global.set $g1 {b}) (global.get $g1))",
    "ca": "(block (result i32) (local.set $l1 {a}) (if (result i32) (i32.lt_u (local.get $l1) (i32.const 5)) (then (i32.lt_u {b} (i32.const 5))) (else (i32.const 7))))",
}


def main():
    out = sys.argv[1]
    os.makedirs(out, exist_ok=True)
    n = 0
    for en, e in E.items():
        for cn, c in C.items():
            body = c.format(a=e, b=e)
            for mem in ("(memory $m0 1 4)", "(memory $m0 i64 1 4)"):
                b = body
                if "i64" in mem:
                    b = (b.replace("(memory.grow (i32.const", "(memory.grow (i64.const")
                         .replace("(memory.grow (local.get $p0))", "(memory.grow (i64.extend_i32_u (local.get $p0)))")
                         .replace("(memory.size)", "(i32.wrap_i64 (memory.size))")
                         .replace("(memory.grow (i64.const 1))", "(i32.wrap_i64 (memory.grow (i64.const 1)))")
                         .replace("(memory.grow (i64.const 0))", "(i32.wrap_i64 (memory.grow (i64.const 0)))")
                         .replace("(memory.grow (i64.extend_i32_u (local.get $p0)))", "(i32.wrap_i64 (memory.grow (i64.extend_i32_u (local.get $p0))))")
                         .replace("(local.get $p1))", "(i64.extend_i32_u (local.get $p1)))")
                         .replace("(i32.const 16)", "(i64.const 16)"))
                n += 1
                wat = f"""(module
 (import "env" "h" (func $h (param i32) (result i32)))
 (import "env" "v" (func $v))
 {mem}
 (export "m0" (memory $m0))
 (global $g0 (mut i32) (i32.const 0))
 (export "g0" (global $g0))
 (global $g1 (mut i32) (i32.const 0))
 (export "g1" (global $g1))
 (func $f (export "f") (param $p0 i32) (param $p1 i32) (result i32)
  (local $l0 i32) (local $l1 i32)
  {b}))
"""
                name = os.path.join(out, f"s{n:03d}_{en}_{cn}_{'m64' if 'i64' in mem else 'm32'}")
                with open(name + ".wat", "w") as fh:
                    fh.write(wat)
                with open(name + ".json", "w") as fh:
                    json.dump({"params": ["i32", "i32"]}, fh)
    print(n)


if __name__ == "__main__":
    main()
