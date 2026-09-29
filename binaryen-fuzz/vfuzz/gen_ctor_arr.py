#!/usr/bin/env python3
"""A ctor that builds numeric GC arrays and stores them in globals, plus
exported readers. Used to check wasm-ctor-eval's serialization of GC arrays:
running "ctor" then the readers must match the evaluated module's readers.

usage: gen_ctor_arr.py SEED OUTPREFIX
"""
import json
import random
import sys

from gen_arr import A, ELEMS, VT


def main():
    seed = int(sys.argv[1])
    out = sys.argv[2]
    r = random.Random(seed)
    g = A(r)
    g.params = {}
    data = "".join("\\%02x" % r.randrange(256) for _ in range(32))
    lines = ["(module"]
    for e in ELEMS:
        lines.append(f"(type $a_{e} (array (mut {e})))")
    lines.append(f'(data $d "{data}")')
    arrs = []
    ctor = []
    for k in range(r.randrange(1, 5)):
        e = r.choice(ELEMS)
        code, n = g.new(e)
        lines.append(f"(global $g{k} (mut (ref null $a_{e})) (ref.null $a_{e}))")
        ctor.append(f"(global.set $g{k} {code})")
        arrs.append((k, e, n))
    for _ in range(r.randrange(0, 8)):
        k, e, n = r.choice(arrs)
        ref = f"(global.get $g{k})"
        t = VT[e]
        c = r.random()
        if c < 0.4:
            ctor.append(f"(array.set $a_{e} {ref} (i32.const {r.randrange(n)}) {g.val(t)})")
        elif c < 0.6:
            off = r.randrange(n + 1)
            ctor.append(f"(array.fill $a_{e} {ref} (i32.const {off}) {g.val(t)} (i32.const {r.randrange(n - off + 1)}))")
        elif c < 0.8:
            same = [a for a in arrs if a[1] == e]
            k2, _, n2 = r.choice(same)
            cnt = r.randrange(min(n, n2) + 1)
            ctor.append(f"(array.copy $a_{e} $a_{e} {ref} (i32.const {r.randrange(n - cnt + 1)}) "
                        f"(global.get $g{k2}) (i32.const {r.randrange(n2 - cnt + 1)}) (i32.const {cnt}))")
        else:
            size = {"i8": 1, "i16": 2, "i32": 4, "i64": 8, "f32": 4, "f64": 8}[e]
            cnt = r.randrange(min(n, 32 // size) + 1)
            ctor.append(f"(array.init_data $a_{e} $d {ref} (i32.const {r.randrange(n - cnt + 1)}) "
                        f"(i32.const {r.randrange(32 - cnt * size + 1)}) (i32.const {cnt}))")
    lines.append(f'(func $ctor (export "ctor") {" ".join(ctor)})')
    sigs = {}
    for k, e, n in arrs:
        body = []
        for j in range(n):
            g.params = {}
            op = f"array.get_{r.choice('su')}" if e in ("i8", "i16") else "array.get"
            body.append(g.fold(VT[e], f"({op} $a_{e} (global.get $g{k}) (i32.const {j}))"))
        body.append(g.fold("i32", f"(array.len (global.get $g{k}))"))
        lines.append(f'(func $r{k} (export "r{k}") (result i64) (local $acc i64) {" ".join(body)} (local.get $acc))')
        sigs[f"r{k}"] = []
    lines.append(")")
    with open(out + ".wat", "w") as fh:
        fh.write("\n".join(lines))
    with open(out + ".sig.json", "w") as fh:
        json.dump(sigs, fh)


if __name__ == "__main__":
    main()
