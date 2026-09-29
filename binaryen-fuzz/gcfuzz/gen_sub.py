#!/usr/bin/env python3
"""Cast / br_on_* generator over a small struct hierarchy (for exwasm-gc3).

usage: gen_sub.py SEED -> prints a .wat module

Types (each a singleton rec group):
  $B (sub (struct (mut i32)))                     open
  $C (sub $B (struct (mut i32) (mut i32)))        open
  $D (sub final $C (struct (mut i32) (mut i32) (mut i8)))
  $E (sub final $B (struct (mut i32) i64))
  $X (sub (struct (mut i32)))                     open, no subtypes, unrelated
Functions mix ref.test / ref.cast / br_on_cast / br_on_cast_fail /
br_on_null / br_on_non_null, allocations of subtypes held in supertype
locals, reference-typed if/select/block results and reference results.
"""
import random
import sys

TYPES = """
  (type $B (sub (struct (field (mut i32)))))
  (type $C (sub $B (struct (field (mut i32)) (field (mut i32)))))
  (type $D (sub final $C (struct (field (mut i32)) (field (mut i32)) (field (mut i8)))))
  (type $E (sub final $B (struct (field (mut i32)) (field i64))))
  (type $X (sub (struct (field (mut i32)))))
"""
CONC = ["B", "C", "D", "E", "X"]
PARENT = {"B": "struct", "C": "B", "D": "C", "E": "B", "X": "struct", "struct": "eq", "eq": "any", "any": None}
FIELDS = {"B": ["i32"], "C": ["i32", "i32"], "D": ["i32", "i32", "i8"], "E": ["i32", "i64"], "X": ["i32"]}
MUT = {"B": [True], "C": [True, True], "D": [True, True, True], "E": [True, False], "X": [True]}


def sub(a, b):
    while a is not None:
        if a == b:
            return True
        a = PARENT[a]
    return False


def hname(h):
    return "$" + h if h in CONC else h


def rt(h, null=True):
    return "(ref %s%s)" % ("null " if null else "", hname(h))


class F:
    def __init__(self, r):
        self.r = r
        self.vars = []  # (name, kind) kind: "i32" | ("ref", heap)
        self.nlab = 0

    def lab(self):
        self.nlab += 1
        return "$l%d" % self.nlab

    def vs(self, pred):
        return [n for n, k in self.vars if pred(k)]

    def ic(self):
        return "(i32.const %d)" % self.r.choice([0, 1, 2, -1, 0x80, 0xff, 0x1ff, 7])

    # an i32 expression
    def i32(self, d=0):
        r = self.r
        iv = self.vs(lambda k: k == "i32")
        c = r.random()
        if d > 2 or c < 0.15:
            return "(local.get $%s)" % r.choice(iv) if iv and r.random() < 0.6 else self.ic()
        if c < 0.3:
            h = r.choice(["B", "C", "D", "E", "X", "struct", "eq"])
            return "(ref.test %s %s)" % (rt(h, r.random() < 0.3), self.ref(r.choice(["B", "eq", "B", "C"]), d + 1))
        if c < 0.5:
            return self.field_get(d)
        if c < 0.58:
            return "(ref.eq %s %s)" % (self.ref("eq", d + 1), self.ref("eq", d + 1))
        if c < 0.65:
            return "(ref.is_null %s)" % self.ref(r.choice(["B", "eq", "C"]), d + 1)
        if c < 0.75:
            return "(i32.%s %s %s)" % (r.choice(["add", "sub", "xor", "and", "eq", "lt_s"]), self.i32(d + 1), self.i32(d + 1))
        if c < 0.82:
            return "(if (result i32) %s (then %s) (else %s))" % (self.i32(d + 1), self.i32(d + 1), self.i32(d + 1))
        if c < 0.87:
            return "(select %s %s %s)" % (self.i32(d + 1), self.i32(d + 1), self.i32(d + 1))
        if c < 0.94:
            # br_on_cast carrying an i32 via a helper block: test-like
            l = self.lab()
            h = r.choice(["C", "D", "E"])
            return "(block %s (result i32) (drop (block %s_r (result %s) (drop (br_on_cast %s_r %s %s %s)) (br %s %s))) %s)" % (
                l, l, rt(h, False), l, rt("B"), rt(h, False), self.ref("B", d + 1), l, self.i32(d + 1),
                self.i32(d + 1))
        return "(global.get $g0)"

    def field_get(self, d):
        r = self.r
        h = r.choice(["B", "C", "D", "E", "X", "B"])
        i = r.randrange(len(FIELDS[h]))
        ft = FIELDS[h][i]
        if r.random() < 0.5 and h in ("C", "D", "E"):
            src = "(ref.cast %s %s)" % (rt(h, r.random() < 0.4), self.ref(r.choice(["B", "eq"]), d + 1))
        else:
            src = self.ref(h, d + 1)
        if ft == "i8":
            return "(struct.get_%s $%s %d %s)" % (r.choice("su"), h, i, src)
        if ft == "i64":
            return "(i32.wrap_i64 (struct.get $%s %d %s))" % (h, i, src)
        return "(struct.get $%s %d %s)" % (h, i, src)

    def new(self, h, d):
        vals = []
        for ft in FIELDS[h]:
            vals.append("(i64.extend_i32_s %s)" % self.i32(d + 1) if ft == "i64" else self.i32(d + 1))
        if self.r.random() < 0.2:
            return "(struct.new_default $%s)" % h
        return "(struct.new $%s %s)" % (h, " ".join(vals))

    # a reference expression whose type is a subtype of (ref null want)
    def ref(self, want, d=0, null_ok=True):
        r = self.r
        cands = self.vs(lambda k: k != "i32" and sub(k[1], want))
        c = r.random()
        concs = [h for h in CONC if sub(h, want)]
        if d > 2:
            if cands and c < 0.7:
                return "(local.get $%s)" % r.choice(cands)
            return self.new(r.choice(concs), d) if concs else "(ref.null none)"
        if c < 0.35 and cands:
            return "(local.get $%s)" % r.choice(cands)
        if c < 0.5 and concs:
            return self.new(r.choice(concs), d)
        if c < 0.55 and null_ok:
            return "(ref.null %s)" % (hname(want) if want in CONC or want in ("eq", "struct", "any") else "none")
        if c < 0.68:
            tgt = r.choice([h for h in CONC + ["struct"] if sub(h, want)] or [want])
            srcw = r.choice(["eq", "B", "struct"] + ([PARENT[tgt]] if PARENT.get(tgt) else []))
            return "(ref.cast %s %s)" % (rt(tgt, r.random() < 0.5), self.ref(srcw, d + 1))
        if c < 0.73:
            return "(ref.as_non_null %s)" % self.ref(want, d + 1)
        if c < 0.8:
            return "(if (result %s) %s (then %s) (else %s))" % (rt(want), self.i32(d + 1), self.ref(want, d + 1),
                                                               self.ref(want, d + 1))
        if c < 0.85:
            return "(select (result %s) %s %s %s)" % (rt(want), self.ref(want, d + 1), self.ref(want, d + 1),
                                                     self.i32(d + 1))
        if c < 0.92 and sub("B", want) or (c < 0.92 and want == "B"):
            # br_on_cast / br_on_cast_fail to a block of type want
            l = self.lab()
            tgt = r.choice(["C", "D", "E"])
            if r.random() < 0.5:
                return "(block %s (result %s) (drop (br_on_cast %s %s %s %s)) %s)" % (
                    l, rt(want), l, rt("B"), rt(tgt, r.random() < 0.3), self.ref("B", d + 1), self.ref(want, d + 1))
            return "(block %s (result %s) (drop (br_on_cast_fail %s %s %s %s)) %s)" % (
                l, rt(want), l, rt("B"), rt(tgt, r.random() < 0.3), self.ref("B", d + 1), self.ref(want, d + 1))
        if c < 0.97:
            l = self.lab()
            return "(block %s (result %s) (br_on_non_null %s %s) %s)" % (l, rt(want), l, self.ref(want, d + 1),
                                                                      self.ref(want, d + 1))
        if cands:
            v = r.choice(cands)
            k = dict(self.vars)[v]
            return "(local.tee $%s %s)" % (v, self.ref(k[1], d + 1))
        return self.new(r.choice(concs), d) if concs else "(ref.null none)"

    def stmt(self, d=0):
        r = self.r
        c = r.random()
        refv = [(n, k) for n, k in self.vars if k != "i32"]
        if c < 0.25 and refv:
            n, k = r.choice(refv)
            return "(local.set $%s %s)" % (n, self.ref(k[1], 1))
        if c < 0.35:
            n = r.choice(self.vs(lambda k: k == "i32"))
            return "(local.set $%s %s)" % (n, self.i32(1))
        if c < 0.5:
            h = r.choice(["B", "C", "D", "X"])
            i = r.randrange(len(FIELDS[h]))
            src = self.ref(h, 1) if r.random() < 0.6 else "(ref.cast %s %s)" % (rt(h), self.ref("B", 2))
            return "(struct.set $%s %d %s %s)" % (h, i, src, self.i32(2))
        if c < 0.55:
            return "(global.set $g0 %s)" % self.i32(1)
        if d < 2 and c < 0.68:
            return "(if %s (then %s) (else %s))" % (self.i32(1), self.stmts(d + 1), self.stmts(d + 1))
        if d < 2 and c < 0.76:
            l = self.lab()
            body = [self.stmt(d + 1) for _ in range(r.randint(1, 2))]
            body.insert(r.randint(0, len(body)), "(br_if %s %s)" % (l, self.i32(1)))
            return "(block %s %s)" % (l, " ".join(body))
        if d < 2 and c < 0.86 and refv:
            # br_on_null out of a block, then use the non-null value
            n, k = r.choice(refv)
            l = self.lab()
            h = k[1]
            use = "(drop (br_on_null %s (local.get $%s)))" % (l, n)
            tail = self.stmts(d + 1)
            if h in CONC and r.random() < 0.6:
                tail += " (global.set $g0 (struct.get $%s 0 (local.get $%s)))" % (h, n)
            return "(block %s %s %s)" % (l, use, tail)
        if c < 0.93:
            return "(drop %s)" % self.ref(r.choice(["B", "eq", "C"]), 1)
        return "(if %s (then (return %s)))" % (self.i32(1), self.result_expr())

    def stmts(self, d):
        return " ".join(self.stmt(d) for _ in range(self.r.randint(0, 2)))

    def result_expr(self):
        if self.res == "i32":
            return self.i32(1)
        return self.ref(self.res[1], 1)


def gen_module(seed):
    r = random.Random(seed)
    out = ["(module", TYPES, "  (global $g0 (export \"g0\") (mut i32) (i32.const 0))"]
    for fi in range(r.randint(2, 4)):
        f = F(r)
        params = []
        for i in range(r.randint(1, 3)):
            h = r.choice(["B", "B", "C", "D", "E", "X", "eq"])
            params.append(("p%d" % i, ("ref", h)))
        params.append(("n0", "i32"))
        locs = [("n1", "i32")]
        for i, h in enumerate(r.sample(["B", "C", "D", "E", "X", "eq"], r.randint(1, 3))):
            locs.append(("r%d" % i, ("ref", h)))
        f.vars = params + locs
        f.res = r.choice(["i32", "i32", ("ref", "B"), ("ref", "C"), ("ref", "eq")])
        body = [f.stmt(0) for _ in range(r.randint(1, 5))]
        ty = lambda k: "i32" if k == "i32" else rt(k[1])
        ps = " ".join("(param $%s %s)" % (n, ty(k)) for n, k in params)
        ls = " ".join("(local $%s %s)" % (n, ty(k)) for n, k in locs)
        out.append("  (func $f%d (export \"f%d\") %s (result %s) %s\n    %s\n    %s)" % (
            fi, fi, ps, ty(f.res), ls, "\n    ".join(body), f.result_expr()))
    out.append(")")
    return "\n".join(out)


if __name__ == "__main__":
    print(gen_module(int(sys.argv[1])))
