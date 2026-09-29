#!/usr/bin/env python3
"""Modules that build and read GC arrays of numeric element types (packed i8 /
i16 and i32, i64, f32, f64), mostly from constants so Precompute can fold
them with binaryen's interpreter, sometimes from parameters.

usage: gen_arr.py SEED OUTPREFIX
"""
import json
import random
import sys

ELEMS = ["i8", "i16", "i32", "i64", "f32", "f64"]
VT = {"i8": "i32", "i16": "i32", "i32": "i32", "i64": "i64", "f32": "f32", "f64": "f64"}
IC = [0, 1, -1, 2, 0x7f, 0x80, 0xff, 0x100, 0x1ff, 0x7fff, 0x8000, 0xffff, 0x10000,
      0x12345678, -0x80000000, 0x7fffffff, 0xfffe, -2, 3, 0x80ff]
LC = [0, 1, -1, 0x7fffffffffffffff, -0x8000000000000000, 0x123456789abcdef0,
      0xff, 0x8000, 0x80000000, 0xffffffff, -0x100000000]
FC = ["0", "-0", "1.5", "-2.25", "inf", "-inf", "3.4028234663852886e38",
      "1e-45", "5e-324", "0.1", "-1e300", "16777217", "9007199254740993"]


class A:
    def __init__(self, r):
        self.r = r

    def const(self, t):
        r = self.r
        if t == "i32":
            v = r.choice(IC) if r.random() < 0.85 else r.randrange(-(1 << 31), 1 << 31)
            v = ((v + (1 << 31)) % (1 << 32)) - (1 << 31)
            return f"(i32.const {v})"
        if t == "i64":
            v = r.choice(LC) if r.random() < 0.85 else r.randrange(-(1 << 63), 1 << 63)
            v = ((v + (1 << 63)) % (1 << 64)) - (1 << 63)
            return f"(i64.const {v})"
        return f"({t}.const {r.choice(FC)})"

    def val(self, t):
        r = self.r
        k = r.random()
        if k < 0.6 or not self.params.get(t):
            return self.const(t)
        return f"(local.get {r.choice(self.params[t])})"

    def idx(self, n):
        r = self.r
        k = r.random()
        if k < 0.8:
            return f"(i32.const {r.randrange(max(n, 1) + (1 if r.random() < 0.05 else 0))})"
        if self.params.get("i32"):
            return f"(i32.and (local.get {r.choice(self.params['i32'])}) (i32.const {max(n - 1, 0)}))"
        return "(i32.const 0)"

    def new(self, e):
        r = self.r
        t = VT[e]
        n = r.randrange(1, 9)
        k = r.random()
        if k < 0.25:
            return f"(array.new $a_{e} {self.val(t)} (i32.const {n}))", n
        if k < 0.4:
            return f"(array.new_default $a_{e} (i32.const {n}))", n
        if k < 0.75:
            return f"(array.new_fixed $a_{e} {n} {' '.join(self.val(t) for _ in range(n))})", n
        # data segment is 32 bytes; element size up to 8
        size = {"i8": 1, "i16": 2, "i32": 4, "i64": 8, "f32": 4, "f64": 8}[e]
        n = r.randrange(1, 32 // size + 1)
        off = r.randrange(0, 32 - n * size + 1)
        return f"(array.new_data $a_{e} $d (i32.const {off}) (i32.const {n}))", n

    def get(self, e, ref, n):
        r = self.r
        if e in ("i8", "i16"):
            op = f"array.get_{r.choice('su')}"
        else:
            op = "array.get"
        return f"({op} $a_{e} {ref} {self.idx(n)})"

    def fold(self, t, x):
        """Fold a value of type t into the i64 accumulator."""
        if t == "i32":
            x = f"(i64.extend_i32_u {x})"
        elif t == "f32":
            x = f"(i64.extend_i32_u (i32.reinterpret_f32 {x}))"
        elif t == "f64":
            x = f"(i64.reinterpret_f64 {x})"
        return f"(local.set $acc (i64.add (i64.mul (local.get $acc) (i64.const 1000003)) {x}))"

    def func(self, i):
        r = self.r
        ps = [r.choice(["i32", "i32", "i64", "f64"]) for _ in range(r.randrange(0, 3))]
        self.params = {}
        for j, t in enumerate(ps):
            self.params.setdefault(t, []).append(j)
        nloc = len(ps)
        arrs = []  # (local index, elem, len)
        body = []
        for _ in range(r.randrange(1, 4)):
            e = r.choice(ELEMS)
            code, n = self.new(e)
            li = nloc + len(arrs)
            body.append(f"(local.set {li} {code})")
            arrs.append((li, e, n))
        for _ in range(r.randrange(3, 12)):
            li, e, n = r.choice(arrs)
            ref = f"(local.get {li})"
            t = VT[e]
            k = r.random()
            if k < 0.35:
                body.append(self.fold(t, self.get(e, ref, n)))
            elif k < 0.55:
                body.append(f"(array.set $a_{e} {ref} {self.idx(n)} {self.val(t)})")
            elif k < 0.65:
                off = r.randrange(n + 1)
                cnt = r.randrange(n - off + 1 + (1 if r.random() < 0.05 else 0))
                body.append(f"(array.fill $a_{e} {ref} (i32.const {off}) {self.val(t)} (i32.const {cnt}))")
            elif k < 0.80:
                same = [a for a in arrs if a[1] == e]
                li2, _, n2 = r.choice(same)
                cnt = r.randrange(min(n, n2) + 1)
                d = r.randrange(n - cnt + 1)
                s = r.randrange(n2 - cnt + 1)
                body.append(f"(array.copy $a_{e} $a_{e} {ref} (i32.const {d}) (local.get {li2}) (i32.const {s}) (i32.const {cnt}))")
            elif k < 0.88:
                size = {"i8": 1, "i16": 2, "i32": 4, "i64": 8, "f32": 4, "f64": 8}[e]
                cnt = r.randrange(min(n, 32 // size) + 1)
                d = r.randrange(n - cnt + 1)
                s = r.randrange(32 - cnt * size + 1)
                body.append(f"(array.init_data $a_{e} $d {ref} (i32.const {d}) (i32.const {s}) (i32.const {cnt}))")
            elif k < 0.93:
                body.append(self.fold("i32", f"(array.len {ref})"))
            else:
                # re-create
                code, n2 = self.new(e)
                body.append(f"(local.set {li} {code})")
                arrs[arrs.index((li, e, n))] = (li, e, n2)
        for li, e, n in arrs:
            body.append(self.fold(VT[e], self.get(e, f"(local.get {li})", n)))
        # nested forms that Precompute can evaluate with the interpreter
        for _ in range(r.randrange(0, 5)):
            e = r.choice(ELEMS)
            code, n = self.new(e)
            if r.random() < 0.8:
                body.append(self.fold(VT[e], self.get(e, code, n)))
            else:
                body.append(self.fold("i32", f"(array.len {code})"))
        params = " ".join(f"(param {t})" for t in ps)
        locs = " ".join(f"(local (ref null $a_{e}))" for _, e, _ in arrs)
        f = (f'(func $f{i} (export "f{i}") {params} (result i64) {locs} (local $acc i64)\n '
             + "\n ".join(body) + "\n (local.get $acc))")
        return f, ps


def main():
    seed = int(sys.argv[1])
    out = sys.argv[2]
    r = random.Random(seed)
    g = A(r)
    data = "".join("\\%02x" % r.randrange(256) for _ in range(32))
    lines = ["(module"]
    for e in ELEMS:
        lines.append(f"(type $a_{e} (array (mut {e})))")
    lines.append(f'(data $d "{data}")')
    sigs = {}
    for i in range(r.randrange(2, 6)):
        f, ps = g.func(i)
        lines.append(f)
        sigs[f"f{i}"] = ps
    lines.append(")")
    with open(out + ".wat", "w") as fh:
        fh.write("\n".join(lines))
    with open(out + ".sig.json", "w") as fh:
        json.dump(sigs, fh)


if __name__ == "__main__":
    main()
