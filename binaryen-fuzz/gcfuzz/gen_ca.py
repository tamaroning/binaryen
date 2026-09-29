#!/usr/bin/env python3
"""Reference-constraint generator aimed at ConstraintAnalysis (ref.eq / ref.is_null
conditions on reference locals) and the null-propagating passes after it.

usage: gen_ca.py SEED -> prints a .wat module (same types as gen_gc.py)

Functions have a few nullable (ref null $S0) params and locals, branch on
conditions built from ref.eq / ref.is_null / i32.eqz / i32.and / i32.or over
local.get and local.tee, reassign the locals (null, a fresh allocation, another
local, a field read), and return an i32 combining ref.is_null / ref.eq / field
reads of the locals.
"""
import random
import sys

sys.path.insert(0, __import__("os").path.dirname(__import__("os").path.abspath(__file__)))
import gen_gc  # noqa: E402


class G:
    def __init__(self, r):
        self.r = r
        self.refs = []
        self.ints = []
        self.nlab = 0

    def ref(self):
        return "(local.get $%s)" % self.r.choice(self.refs)

    def refterm(self, d):
        r = self.r
        c = r.random()
        if c < 0.55:
            return self.ref()
        if c < 0.7:
            return "(ref.null $S0)" if r.random() < 0.5 else "(ref.null none)"
        if c < 0.85 and d < 2:
            return "(local.tee $%s %s)" % (r.choice(self.refs), self.refterm(d + 1))
        if c < 0.92:
            return "(struct.new $S0 %s (i32.const 0) (i32.const 0) (i64.const 0))" % self.ival(d + 1)
        return "(ref.as_non_null %s)" % self.ref()

    def ival(self, d):
        r = self.r
        if d > 2 or r.random() < 0.4:
            return "(local.get $%s)" % r.choice(self.ints) if r.random() < 0.6 else "(i32.const %d)" % r.choice([0, 1, 2, -1])
        return "(i32.add %s %s)" % (self.ival(d + 1), self.ival(d + 1))

    def cond(self, d=0):
        r = self.r
        c = r.random()
        if d < 2 and c < 0.15:
            return "(i32.and %s %s)" % (self.cond(d + 1), self.cond(d + 1))
        if d < 2 and c < 0.22:
            return "(i32.or %s %s)" % (self.cond(d + 1), self.cond(d + 1))
        if d < 2 and c < 0.35:
            return "(i32.eqz %s)" % self.cond(d + 1)
        if c < 0.6:
            return "(ref.eq %s %s)" % (self.refterm(d + 1), self.refterm(d + 1))
        if c < 0.85:
            return "(ref.is_null %s)" % self.refterm(d + 1)
        if c < 0.93:
            return "(i32.%s (local.get $%s) %s)" % (r.choice(["eq", "ne", "lt_u", "gt_s"]), r.choice(self.ints),
                                                     self.ival(d + 1))
        return "(local.get $%s)" % r.choice(self.ints)

    def obs(self, d=0):
        r = self.r
        c = r.random()
        if d < 2 and c < 0.25:
            return "(i32.add %s (i32.shl %s (i32.const %d)))" % (self.obs(d + 1), self.obs(d + 1), r.randint(1, 4))
        if c < 0.5:
            return "(ref.is_null %s)" % self.ref()
        if c < 0.75:
            return "(ref.eq %s %s)" % (self.ref(), self.refterm(1))
        if c < 0.85:
            v = r.choice(self.refs)
            return "(if (result i32) (ref.is_null (local.get $%s)) (then (i32.const -1)) (else (struct.get $S0 0 (local.get $%s))))" % (v, v)
        return self.cond(1)

    def stmt(self, d):
        r = self.r
        c = r.random()
        if c < 0.3:
            return "(local.set $%s %s)" % (r.choice(self.refs), self.refterm(1))
        if c < 0.38:
            return "(local.set $%s %s)" % (r.choice(self.ints), self.obs(1))
        if d < 3 and c < 0.65:
            return "(if %s (then %s) (else %s))" % (self.cond(), self.stmts(d + 1), self.stmts(d + 1))
        if d < 3 and c < 0.78:
            self.nlab += 1
            lab = "$b%d" % self.nlab
            body = [self.stmt(d + 1) for _ in range(r.randint(1, 3))]
            body.insert(r.randint(0, len(body)), "(br_if %s %s)" % (lab, self.cond()))
            return "(block %s %s)" % (lab, " ".join(body))
        if c < 0.88:
            return "(if %s (then (return %s)))" % (self.cond(), self.obs())
        if c < 0.94:
            v = r.choice(self.refs)
            return "(if (i32.eqz (ref.is_null (local.get $%s))) (then (struct.set $S0 0 (local.get $%s) %s)))" % (
                v, v, self.ival(1))
        return "(global.set $g0 %s)" % self.obs(1)

    def stmts(self, d):
        return " ".join(self.stmt(d) for _ in range(self.r.randint(0, 3)))


def gen_module(seed):
    r = random.Random(seed)
    types = "\n".join(l for l in gen_gc.TYPES.split("\n") if not l.startswith("  (type (struct"))
    out = ["(module", types, "  (memory (export \"mem\") 1 1)",
           "  (global $g0 (export \"g0\") (mut i32) (i32.const 0))",
           "  (global $g1 (export \"g1\") (mut i32) (i32.const 7))"]
    for fi in range(r.randint(2, 5)):
        g = G(r)
        np = r.randint(1, 3)
        ps = ["(param $x%d (ref null $S0))" % i for i in range(np)] + ["(param $n0 i32)"]
        g.refs = ["x%d" % i for i in range(np)] + ["z%d" % i for i in range(r.randint(1, 2))]
        g.ints = ["n0", "t0"]
        ls = ["(local $%s (ref null $S0))" % v for v in g.refs if v.startswith("z")] + ["(local $t0 i32)"]
        body = [g.stmt(0) for _ in range(r.randint(2, 6))]
        out.append("  (func $f%d (export \"f%d\") %s (result i32) %s\n    %s\n    %s)" % (
            fi, fi, " ".join(ps), " ".join(ls), "\n    ".join(body), g.obs()))
    out.append(")")
    return "\n".join(out)


if __name__ == "__main__":
    print(gen_module(int(sys.argv[1])))
