#!/usr/bin/env python3
"""Modules shaped for ConstraintAnalysis: integer locals compared against
boundary constants under if / br_if / loops, with increments, copies and tees.
Every comparison result is folded into an accumulator that is returned, so a
wrongly "proven" comparison changes the output.

usage: gen_ca.py SEED OUTPREFIX
"""
import json
import random
import sys

B32 = [0, 1, 2, -1, -2, 10, 100, 0x7fffffff, 0x7ffffffe, -0x80000000,
       -0x7fffffff, 0xff, 0xffff, 0x80000000 - 2, -100, 3, 5]
B64 = [0, 1, 2, -1, -2, 10, 100, 0x7fffffff, 0x80000000, 0xffffffff,
       0x100000000, 0x7fffffffffffffff, 0x7ffffffffffffffe,
       -0x8000000000000000, -0x7fffffffffffffff, -100, 3]
CMP = ["eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s",
       "ge_u"]


def wrap(v, t):
    n = 32 if t == "i32" else 64
    return ((v + (1 << (n - 1))) % (1 << n)) - (1 << (n - 1))


class G:
    def __init__(self, r, tee=False):
        self.r = r
        self.tee = tee

    def c(self, t, near=None):
        r = self.r
        if near is not None and r.random() < 0.4:
            return wrap(near + r.choice([-1, 0, 1, 2, -2]), t)
        pool = B32 if t == "i32" else B64
        if r.random() < 0.85:
            return wrap(r.choice(pool), t)
        return wrap(r.randrange(-50, 50), t)

    def const(self, t, near=None):
        return f"({t}.const {self.c(t, near)})"

    def var(self, t=None):
        vs = [v for v in self.vars if t is None or v[0] == t]
        return self.r.choice(vs)

    def get(self, v):
        return f"(local.get {v[1]})"

    def cond(self, d=0):
        """An i32 condition, mostly of shapes ConstraintAnalysis parses."""
        r = self.r
        k = r.random()
        if d < 2 and k < 0.12:
            return f"(i32.and {self.cond(d+1)} {self.cond(d+1)})"
        if d < 2 and k < 0.20:
            return f"(i32.or {self.cond(d+1)} {self.cond(d+1)})"
        if d < 3 and k < 0.30:
            return f"(i32.eqz {self.cond(d+1)})"
        v = self.var()
        t = v[0]
        if k < 0.36:
            return f"({t}.eqz {self.term(v)})"
        op = r.choice(CMP)
        lhs = self.term(v)
        if r.random() < (0.45 if self.tee else 0.15):
            rhs = self.term(self.var(t)) if self.tee else self.get(self.var(t))
        else:
            rhs = self.const(t, self.last.get(v[1]))
        if r.random() < 0.2:
            lhs, rhs = rhs, lhs
        return f"({t}.{op} {lhs} {rhs})"

    def term(self, v):
        r = self.r
        t = v[0]
        k = r.random()
        if self.tee and r.random() < 0.5:
            # skip the plain local.get case half of the time
            k = 0.70 + k * 0.30
        if k < 0.70:
            return self.get(v)
        if k < 0.85:
            return f"(local.tee {v[1]} ({t}.add {self.get(v)} ({t}.const {r.choice([1, 1, -1, 2])})))"
        if k < 0.93:
            return f"(local.tee {v[1]} {self.val(t)})"
        # value falling through a block
        w = self.var()
        return f"(block (result {t}) (local.set {w[1]} {self.val(w[0])}) {self.get(v)})"

    def val(self, t):
        r = self.r
        k = r.random()
        if not any(v[0] == t for v in self.vars):
            return self.const(t)
        if k < 0.35:
            return self.const(t)
        if k < 0.55:
            return self.get(self.var(t))
        if k < 0.75:
            v = self.var(t)
            return f"({t}.{r.choice(['add', 'sub'])} {self.get(v)} ({t}.const {r.choice([1, 1, 1, 2, -1, 3, 100])}))"
        if k < 0.85:
            return f"({t}.{r.choice(['and', 'or', 'xor', 'mul', 'shl', 'shr_u', 'shr_s', 'rem_u'])} {self.get(self.var(t))} {self.const(t)})"
        if k < 0.92:
            c = self.cond()
            return c if t == "i32" else f"(i64.extend_i32_u {c})"
        if t == "i32":
            return f"(i32.wrap_i64 {self.get(self.var('i64'))})" if any(v[0] == "i64" for v in self.vars) else self.const(t)
        return f"(i64.extend_i32_{r.choice('su')} {self.get(self.var('i32'))})" if any(v[0] == "i32" for v in self.vars) else self.const(t)

    def record(self):
        """Fold something observable into $acc."""
        r = self.r
        k = r.random()
        if k < 0.6:
            x = self.cond()
        else:
            v = self.var()
            x = self.get(v) if v[0] == "i32" else f"(i32.wrap_i64 {self.get(v)})"
            if v[0] == "i64" and r.random() < 0.5:
                x = f"(i32.wrap_i64 (i64.shr_u {self.get(v)} (i64.const 32)))"
        return (f"(local.set $acc (i32.add (i32.mul (local.get $acc) (i32.const 31)) {x}))")

    def assign(self):
        v = self.var()
        val = self.val(v[0])
        if val.startswith(f"({v[0]}.const "):
            self.last[v[1]] = int(val.split()[1].rstrip(")"))
        return f"(local.set {v[1]} {val})"

    def stmt(self, d):
        r = self.r
        k = r.random()
        if k < 0.25:
            return self.assign()
        if k < 0.45:
            return self.record()
        if d >= 4:
            return self.record()
        if k < 0.65:
            els = f" (else {self.stmts(d+1)})" if r.random() < 0.6 else ""
            return f"(if {self.cond()} (then {self.stmts(d+1)}){els})"
        if k < 0.75:
            self.nl += 1
            lab = f"$b{self.nl}"
            return f"(block {lab} {self.stmts(d+1)} (br_if {lab} {self.cond()}) {self.stmts(d+1)})"
        if k < 0.80:
            return f"(if {self.cond()} (then (return (local.get $acc))))"
        if k < 0.83:
            self.nl += 1
            a, b = f"$b{self.nl}", f"$b{self.nl + 1}"
            self.nl += 1
            v = self.var("i32") if any(x[0] == "i32" for x in self.vars) else None
            if v is None:
                return self.record()
            return (f"(block {a} (block {b} (br_table {b} {a} {b} (local.get {v[1]}))) "
                    f"{self.record()}) {self.record()}")
        return self.loop(d)

    def loop(self, d):
        r = self.r
        self.nl += 1
        lab = f"$l{self.nl}"
        v = self.var()
        t = v[0]
        start = self.c(t)
        step = r.choice([1, 1, 1, -1, 2])
        bound = self.const(t, start + r.choice([3, 5, 10, -3, 100]))
        if r.random() < 0.2:
            bound = self.get(self.var(t))
        op = r.choice(["lt_s", "lt_u", "le_s", "le_u", "ne", "gt_s", "gt_u", "ge_s", "ge_u"])
        if r.random() < 0.5:
            inc = f"(local.set {v[1]} ({t}.add {self.get(v)} ({t}.const {step})))"
            test = f"({t}.{op} {self.get(v)} {bound})"
        else:
            inc = ""
            test = f"({t}.{op} (local.tee {v[1]} ({t}.add {self.get(v)} ({t}.const {step}))) {bound})"
        self.last[v[1]] = None
        body = self.stmts(d + 1)
        return (f"(local.set {v[1]} ({t}.const {start})) (loop {lab} "
                f"(if (i32.eqz (local.tee $fuel (i32.sub (local.get $fuel) (i32.const 1)))) (then (return (local.get $acc)))) "
                f"{body} {self.record()} {inc} (br_if {lab} {test}))")

    def stmts(self, d):
        return " ".join(self.stmt(d) for _ in range(self.r.randrange(1, 4)))

    def func(self, i):
        r = self.r
        ps = [r.choice(["i32", "i32", "i64"]) for _ in range(r.randrange(1, 4))]
        ls = [r.choice(["i32", "i32", "i64"]) for _ in range(r.randrange(1, 4))]
        self.vars = [(t, f"$p{j}") for j, t in enumerate(ps)] + \
                    [(t, f"$v{j}") for j, t in enumerate(ls)]
        self.last = {f"$v{j}": 0 for j in range(len(ls))}
        self.nl = 0
        body = " ".join(self.stmt(0) for _ in range(r.randrange(2, 8)))
        params = " ".join(f"(param $p{j} {t})" for j, t in enumerate(ps))
        locs = " ".join(f"(local $v{j} {t})" for j, t in enumerate(ls))
        f = (f'(func $f{i} (export "f{i}") {params} (result i32) {locs} '
             f'(local $acc i32) (local $fuel i32)\n (local.set $fuel (i32.const 200))\n {body}\n (local.get $acc))')
        return f, ps


def main():
    seed = int(sys.argv[1])
    out = sys.argv[2]
    r = random.Random(seed)
    g = G(r, tee=len(sys.argv) > 3 and sys.argv[3] == "tee")
    fs, sigs = [], {}
    for i in range(r.randrange(2, 6)):
        f, ps = g.func(i)
        fs.append(f)
        sigs[f"f{i}"] = ps
    with open(out + ".wat", "w") as fh:
        fh.write("(module\n" + "\n".join(fs) + "\n)\n")
    with open(out + ".sig.json", "w") as fh:
        json.dump(sigs, fh)


if __name__ == "__main__":
    main()
