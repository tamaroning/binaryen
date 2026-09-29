#!/usr/bin/env python3
"""GC module generator for exwasm-gc2 translation validation of wasm-opt.

usage: gen_gc.py SEED [NFUNCS]  -> prints a .wat module

Emits only the exwasm-gc2 subset: final singleton struct/array types,
struct/array ops, ref.null/is_null/as_non_null/eq, i31, integer ops, locals,
memory and i32 globals (both exported so that they are observable), blocks,
ifs and br_if with integer values.  Reference-typed function results and
reference-typed block results are avoided (exwasm-gc2 rejects them); heap
effects are observed through entry objects passed as parameters.

Each function body is a list of statements.  A statement is a string; the
mutator (mutate()) edits statement lists in type-preserving ways.
"""
import random
import sys

TYPES = """
  (type $S0 (struct (field (mut i32)) (field (mut i8)) (field i16) (field (mut i64))))
  (type $S1 (struct (field i32) (field (mut (ref null $S0))) (field (mut i32))))
  (type $S2 (struct (field (mut i32))))
  (type $A0 (array (mut i32)))
  (type $A1 (array (mut i8)))
  (type $A2 (array i16))
  (type $A3 (array (mut (ref null $S2))))
"""
# Heap2Local's Array2Struct turns a constant-length array into a struct with
# one field per element; exwasm-gc2 maps output types to input types by
# structure, so declare those structs up front.
for _et in ["(mut i32)", "(mut i8)", "i16", "(mut (ref null $S2))"]:
    for _n in range(0, 5):
        TYPES += "  (type (struct%s))\n" % ("".join(" (field %s)" % _et for _ in range(_n)))

# field layouts: list of (valtype, mutable, packed)
STRUCTS = {
    "S0": [("i32", True, None), ("i32", True, "i8"), ("i32", False, "i16"), ("i64", True, None)],
    "S1": [("i32", False, None), (("ref", "S0"), True, None), ("i32", True, None)],
    "S2": [("i32", True, None)],
}
ARRAYS = {
    "A0": ("i32", True, None),
    "A1": ("i32", True, "i8"),
    "A2": ("i32", False, "i16"),
    "A3": (("ref", "S2"), True, None),
}
REFT = list(STRUCTS) + list(ARRAYS)


def wt(t):
    if isinstance(t, tuple):
        if t[1] == "i31":
            return "(ref null i31)"
        return "(ref null $%s)" % t[1]
    return t


INTERESTING = [0, 1, -1, 2, 3, 0x7f, 0x80, 0xff, 0x100, 0x1ff, 0x7fff, 0x8000, 0xffff,
               0x18000, -129, -32769, 0x7fffffff, -0x80000000]


class Fn:
    def __init__(self, rnd, name, depth_budget=3):
        self.r = rnd
        self.name = name
        self.params = []  # (name, type)
        self.locals = []
        self.nlab = 0
        self.depth_budget = depth_budget

    def vars_of(self, t):
        return [n for (n, tt) in self.params + self.locals if tt == t]

    def const(self, t):
        r = self.r
        v = r.choice(INTERESTING) if r.random() < 0.6 else r.randint(-5, 300)
        if t == "i64":
            if r.random() < 0.3:
                v = r.choice([0x100000000, -0x100000000, 0x7fffffffffffffff, 0x1ff])
            return "(i64.const %d)" % v
        v &= 0xffffffff
        if v >= 1 << 31:
            v -= 1 << 32
        return "(i32.const %d)" % v

    # ---- expressions -------------------------------------------------
    def expr(self, t, d=0):
        r = self.r
        if isinstance(t, tuple):
            return self.ref_expr(t[1], d)
        if t == "i64":
            vs = self.vars_of("i64")
            c = r.random()
            if d >= self.depth_budget or c < 0.2:
                return self.const("i64")
            if c < 0.45 and vs:
                return "(local.get $%s)" % r.choice(vs)
            if c < 0.65:
                return "(struct.get $S0 3 %s)" % self.ref_expr("S0", d + 1)
            if c < 0.8:
                return "(i64.extend_i32_%s %s)" % (r.choice("su"), self.expr("i32", d + 1))
            return "(i64.%s %s %s)" % (r.choice(["add", "sub", "xor", "shr_u", "mul"]),
                                        self.expr("i64", d + 1), self.expr("i64", d + 1))
        # i32
        vs = self.vars_of("i32")
        c = r.random()
        if d >= self.depth_budget or c < 0.12:
            return self.const("i32") if (not vs or r.random() < 0.5) else "(local.get $%s)" % r.choice(vs)
        if c < 0.25 and vs:
            return "(local.get $%s)" % r.choice(vs)
        if c < 0.31 and d < 2:
            return self.twin(d)
        if c < 0.37:
            return self.heap_read(d)
        if c < 0.45:
            ops = ["add", "sub", "mul", "and", "or", "xor", "shl", "shr_u", "shr_s",
                   "eq", "ne", "lt_s", "lt_u", "gt_u", "ge_s"]
            return "(i32.%s %s %s)" % (r.choice(ops), self.expr("i32", d + 1), self.expr("i32", d + 1))
        if c < 0.52:
            a, b = self.eq_pair(d)
            return "(ref.eq %s %s)" % (a, b)
        if c < 0.58:
            return "(ref.is_null %s)" % self.ref_expr(r.choice(REFT), d + 1)
        if c < 0.62:
            return "(i31.get_%s %s)" % (r.choice("su"), self.i31_expr(d + 1))
        if c < 0.66:
            return "(global.get $g%d)" % r.randint(0, 1)
        if c < 0.70:
            return "(i32.load%s offset=%d %s)" % (r.choice(["", "8_s", "8_u", "16_u"]), r.choice([0, 4, 8]),
                                                   self.addr(d + 1))
        if c < 0.74:
            return "(i32.wrap_i64 %s)" % self.expr("i64", d + 1)
        if c < 0.78:
            return "(i32.eqz %s)" % self.expr("i32", d + 1)
        if c < 0.83:
            return "(select %s %s %s)" % (self.expr("i32", d + 1), self.expr("i32", d + 1), self.expr("i32", d + 1))
        if c < 0.88:
            return "(if (result i32) %s (then %s) (else %s))" % (
                self.expr("i32", d + 1), self.block_body("i32", d + 1), self.block_body("i32", d + 1))
        if c < 0.92 and vs:
            return "(local.tee $%s %s)" % (r.choice(vs), self.expr("i32", d + 1))
        if c < 0.96:
            # block with br_if carrying an i32 value
            lab = self.label()
            return "(block %s (result i32) (drop (br_if %s %s %s)) %s)" % (
                lab, lab, self.expr("i32", d + 1), self.expr("i32", d + 1), self.expr("i32", d + 1))
        return self.heap_read(d)

    def wrap_i32(self, e, d):
        """Put an i32 expression under a fallthrough wrapper."""
        r = self.r
        k = r.randrange(6)
        vs = self.vars_of("i32")
        if k == 0:
            return "(block (result i32) %s %s)" % (self.stmt(d + 1), e)
        if k == 1 and vs:
            return "(local.tee $%s %s)" % (r.choice(vs), e)
        if k == 2:
            lab = self.label()
            return "(block %s (result i32) (br_if %s %s %s))" % (lab, lab, e, self.expr("i32", d + 1))
        if k == 3:
            return "(if (result i32) %s (then %s) (else (unreachable)))" % (self.expr("i32", d + 1), e)
        return e

    def twin(self, d):
        """op(W1(E), W2(E)) with E repeated: areConsecutiveInputsEqual."""
        r = self.r
        vs = self.vars_of("i32")
        c = r.random()
        if c < 0.4:
            e = self.heap_read(d + 1)
        elif c < 0.6 and vs:
            e = "(local.get $%s)" % r.choice(vs)
        elif c < 0.75 and vs:
            v = r.choice(vs)
            a = "(local.tee $%s %s)" % (v, self.expr("i32", d + 2))
            b = "(local.get $%s)" % v
            return self.twin_op(self.wrap_i32(a, d), self.wrap_i32(b, d), d)
        else:
            e = self.expr("i32", d + 2)
        return self.twin_op(self.wrap_i32(e, d), self.wrap_i32(e, d), d)

    def twin_op(self, a, b, d):
        r = self.r
        op = r.choice(["sub", "xor", "eq", "ne", "and", "or", "lt_s", "ge_u", "select", "select"])
        if op == "select":
            return "(select %s %s %s)" % (a, b, self.expr("i32", d + 1))
        return "(i32.%s %s %s)" % (op, a, b)

    def block_body(self, t, d):
        # a few statements then a value
        r = self.r
        ss = [self.stmt(d + 1) for _ in range(r.randint(0, 2))]
        return " ".join(ss + [self.expr(t, d)])

    def label(self):
        self.nlab += 1
        return "$l%d" % self.nlab

    def addr(self, d):
        r = self.r
        if r.random() < 0.6:
            return "(i32.and %s (i32.const %d))" % (self.expr("i32", d + 1), r.choice([12, 28, 0xfc, 0xffff]))
        return self.expr("i32", d + 1) if r.random() < 0.5 else self.const("i32")

    def index(self, d):
        r = self.r
        c = r.random()
        if c < 0.35:
            return "(i32.const %d)" % r.choice([0, 0, 1, 1, 1, 2])
        if c < 0.65:
            return "(i32.and %s (i32.const %d))" % (self.expr("i32", d + 1), r.choice([1, 3]))
        return self.expr("i32", d + 1)

    def heap_read(self, d):
        r = self.r
        c = r.random()
        if c < 0.45:
            s = r.choice(["S0", "S0", "S1", "S2"])
            fields = STRUCTS[s]
            i = r.choice([k for k, f in enumerate(fields) if f[0] == "i32"])
            op = "struct.get"
            if fields[i][2]:
                op = r.choice(["struct.get_s", "struct.get_u"])
            return "(%s $%s %d %s)" % (op, s, i, self.ref_expr(s, d + 1))
        if c < 0.85:
            a = r.choice(["A0", "A1", "A2"])
            op = "array.get"
            if ARRAYS[a][2]:
                op = r.choice(["array.get_s", "array.get_u"])
            return "(%s $%s %s %s)" % (op, a, self.ref_expr(a, d + 1), self.index(d))
        if c < 0.93:
            return "(struct.get $S2 0 %s)" % self.ref_expr("S2", d + 1)
        return "(array.len %s)" % self.ref_expr(r.choice(list(ARRAYS)), d + 1)

    def eq_pair(self, d):
        r = self.r
        t1 = r.choice(REFT)
        t2 = t1 if r.random() < 0.75 else r.choice(REFT)
        a = self.ref_expr(t1, d + 1)
        if r.random() < 0.25:
            # same expression twice (areConsecutiveInputsEqual)
            return a, a
        if r.random() < 0.2 and self.vars_of(("ref", t1)):
            v = r.choice(self.vars_of(("ref", t1)))
            return "(local.tee $%s %s)" % (v, a), "(local.get $%s)" % v
        return a, self.ref_expr(t2, d + 1)

    def i31_expr(self, d):
        r = self.r
        vs = self.vars_of(("ref", "i31"))
        if vs and r.random() < 0.5:
            return "(local.get $%s)" % r.choice(vs)
        return "(ref.i31 %s)" % self.expr("i32", d + 1)

    def alloc(self, T, d):
        r = self.r
        if T in STRUCTS:
            if r.random() < 0.25:
                return "(struct.new_default $%s)" % T
            ops = []
            for (ft, _, _) in STRUCTS[T]:
                ops.append(self.expr(ft, d + 1))
            return "(struct.new $%s %s)" % (T, " ".join(ops))
        et = ARRAYS[T][0]
        c = r.random()
        n = r.choice([0, 1, 2, 3]) if T != "A3" else r.choice([0, 1, 2])
        if c < 0.4:
            return "(array.new_fixed $%s %d %s)" % (T, n, " ".join(self.expr(et, d + 1) for _ in range(n)))
        if c < 0.7:
            return "(array.new $%s %s (i32.const %d))" % (T, self.expr(et, d + 1), n)
        return "(array.new_default $%s (i32.const %d))" % (T, n)

    def ref_expr(self, T, d=0):
        r = self.r
        vs = self.vars_of(("ref", T))
        c = r.random()
        if d >= self.depth_budget:
            if vs and c < 0.8:
                return "(local.get $%s)" % r.choice(vs)
            return "(ref.null $%s)" % T if r.random() < 0.3 else self.alloc_shallow(T)
        if c < 0.5 and vs:
            return "(local.get $%s)" % r.choice(vs)
        if c < 0.7:
            return self.alloc(T, d)
        if c < 0.75:
            return "(ref.null $%s)" % T
        if c < 0.83:
            return "(ref.as_non_null %s)" % self.ref_expr(T, d + 1)
        if c < 0.9 and T == "S0":
            return "(struct.get $S1 1 %s)" % self.ref_expr("S1", d + 1)
        if c < 0.9 and T == "S2":
            return "(array.get $A3 %s %s)" % (self.ref_expr("A3", d + 1), self.index(d))
        if c < 0.95 and vs:
            return "(local.tee $%s %s)" % (r.choice(vs), self.ref_expr(T, d + 1))
        if vs:
            return "(local.get $%s)" % r.choice(vs)
        return self.alloc(T, d)

    def alloc_shallow(self, T):
        if T in STRUCTS:
            return "(struct.new_default $%s)" % T
        return "(array.new_default $%s (i32.const 2))" % T

    # ---- statements --------------------------------------------------
    def stmt(self, d=0):
        r = self.r
        c = r.random()
        refvars = [(n, t) for (n, t) in self.params + self.locals if isinstance(t, tuple) and t[1] != "i31"]
        intvars = [(n, t) for (n, t) in self.params + self.locals if t in ("i32", "i64")]
        if c < 0.22 and refvars:
            n, t = r.choice(refvars)
            return "(local.set $%s %s)" % (n, self.ref_expr(t[1], d + 1))
        if c < 0.32 and intvars:
            n, t = r.choice(intvars)
            return "(local.set $%s %s)" % (n, self.expr(t, d + 1))
        if c < 0.47:
            s = r.choice(["S0", "S0", "S1", "S2"])
            muts = [k for k, f in enumerate(STRUCTS[s]) if f[1]]
            i = r.choice(muts)
            return "(struct.set $%s %d %s %s)" % (s, i, self.ref_expr(s, d + 1), self.expr(STRUCTS[s][i][0], d + 1))
        if c < 0.58:
            a = r.choice(["A0", "A1", "A3"])
            return "(array.set $%s %s %s %s)" % (a, self.ref_expr(a, d + 1), self.index(d), self.expr(ARRAYS[a][0], d + 1))
        if c < 0.62:
            return "(global.set $g%d %s)" % (r.randint(0, 1), self.expr("i32", d + 1))
        if c < 0.67:
            return "(i32.store%s offset=%d %s %s)" % (r.choice(["", "8", "16"]), r.choice([0, 4]), self.addr(d + 1),
                                                     self.expr("i32", d + 1))
        if c < 0.72:
            return "(drop %s)" % self.expr(r.choice(["i32", "i32", ("ref", r.choice(REFT))]), d + 1)
        if d < 2 and c < 0.82:
            return "(if %s (then %s) (else %s))" % (self.expr("i32", d + 1), self.stmts(d + 1, 1, 3),
                                                    self.stmts(d + 1, 0, 3))
        if d < 2 and c < 0.88:
            lab = self.label()
            body = [self.stmt(d + 1) for _ in range(r.randint(1, 3))]
            body.insert(r.randint(0, len(body)), "(br_if %s %s)" % (lab, self.expr("i32", d + 1)))
            return "(block %s %s)" % (lab, " ".join(body))
        if c < 0.94 and refvars:
            # null check guarding a heap access
            n, t = r.choice(refvars)
            T = t[1]
            acc = self.access_on(T, "(local.get $%s)" % n, d + 1)
            if r.random() < 0.5:
                return "(if (ref.is_null (local.get $%s)) (then %s) (else %s))" % (n, self.stmts(d + 1, 0, 1), acc)
            return "(if (i32.eqz (ref.is_null (local.get $%s))) (then %s))" % (n, acc)
        if c < 0.97 and refvars:
            n, t = r.choice(refvars)
            return "(local.set $%s (ref.as_non_null (local.get $%s)))" % (n, n)
        return "(drop %s)" % self.heap_read(d + 1)

    def access_on(self, T, ref, d):
        r = self.r
        if T in STRUCTS:
            fs = STRUCTS[T]
            muts = [k for k, f in enumerate(fs) if f[1]]
            if muts and r.random() < 0.5:
                i = r.choice(muts)
                return "(struct.set $%s %d %s %s)" % (T, i, ref, self.expr(fs[i][0], d))
            i = r.randrange(len(fs))
            if isinstance(fs[i][0], tuple):
                return "(drop (ref.is_null (struct.get $%s %d %s)))" % (T, i, ref)
            op = "struct.get" if not fs[i][2] else r.choice(["struct.get_s", "struct.get_u"])
            return "(drop (%s $%s %d %s))" % (op, T, i, ref)
        et, mut, pk = ARRAYS[T]
        if mut and r.random() < 0.5:
            return "(array.set $%s %s %s %s)" % (T, ref, self.index(d), self.expr(et, d))
        if r.random() < 0.3:
            return "(drop (array.len %s))" % ref
        if isinstance(et, tuple):
            return "(drop (ref.is_null (array.get $%s %s %s)))" % (T, ref, self.index(d))
        op = "array.get" if not pk else r.choice(["array.get_s", "array.get_u"])
        return "(drop (%s $%s %s %s))" % (op, T, ref, self.index(d))

    def stmts(self, d, lo, hi):
        return " ".join(self.stmt(d) for _ in range(self.r.randint(lo, hi)))


# ---- templates shaped by pass preconditions ---------------------------
def templates(f):
    """Statement sequences that meet (or nearly meet) rewrite preconditions."""
    r = f.r
    out = []
    loc = lambda T: [n for (n, t) in f.locals if t == ("ref", T)]
    par = lambda T: [n for (n, t) in f.params if t == ("ref", T)]
    k = r.randrange(12)
    s0 = loc("S0")
    s1 = loc("S1")
    a0 = loc("A0")
    a1 = loc("A1")
    if k == 0 and s0:
        # Heap2Local: plain local allocation, set/get chain
        x = r.choice(s0)
        out += ["(local.set $%s %s)" % (x, f.alloc("S0", 1)),
                "(struct.set $S0 %d (local.get $%s) %s)" % (r.choice([0, 1]), x, f.expr("i32", 2)),
                "(struct.set $S0 1 (local.get $%s) %s)" % (x, f.expr("i32", 2)),
                "(local.set $%s (i32.add (local.get $%s) (struct.get_%s $S0 1 (local.get $%s))))" % (
                    f.ivar(), f.ivar(), r.choice("su"), x)]
    elif k == 1 and s0 and s1:
        # escape via store into another object (entry or fresh)
        x = r.choice(s0)
        y = r.choice(s1 + par("S1"))
        out += ["(local.set $%s %s)" % (x, f.alloc("S0", 1)),
                "(struct.set $S1 1 (local.get $%s) (local.get $%s))" % (y, x),
                "(struct.set $S0 0 (local.get $%s) %s)" % (x, f.expr("i32", 2)),
                "(struct.set $S0 0 (struct.get $S1 1 (local.get $%s)) %s)" % (y, f.expr("i32", 2)),
                "(local.set $%s (struct.get $S0 0 (local.get $%s)))" % (f.ivar(), x)]
    elif k == 2 and s0:
        # alias through locals, same field written twice
        x, y = r.choice(s0), r.choice(s0 + par("S0"))
        out += ["(local.set $%s %s)" % (x, f.ref_expr("S0", 1)),
                "(local.set $%s (local.get $%s))" % (y, x) if r.random() < 0.6 else "(nop)",
                "(struct.set $S0 0 (local.get $%s) %s)" % (x, f.expr("i32", 2)),
                "(struct.set $S0 0 (local.get $%s) %s)" % (y, f.expr("i32", 2)),
                "(local.set $%s (struct.get $S0 0 (local.get $%s)))" % (f.ivar(), x)]
    elif k == 3 and (a0 or a1):
        # arrays of constant length with symbolic indices
        T = "A0" if a0 and (not a1 or r.random() < 0.5) else "A1"
        x = r.choice(loc(T))
        out += ["(local.set $%s %s)" % (x, f.alloc(T, 1)),
                "(array.set $%s (local.get $%s) %s %s)" % (T, x, f.index(1), f.expr("i32", 2)),
                "(local.set $%s (i32.add (array.len (local.get $%s)) (array.get%s $%s (local.get $%s) %s)))" % (
                    f.ivar(), x, "" if T == "A0" else "_" + r.choice("su"), T, x, f.index(1))]
    elif k == 4:
        # ref.eq of possibly-aliasing values
        T = r.choice(["S0", "S2", "A0"])
        vs = loc(T) + par(T)
        if len(vs) >= 1:
            a, b = r.choice(vs), r.choice(vs)
            out += ["(local.set $%s (ref.eq (local.get $%s) (local.get $%s)))" % (f.ivar(), a, b),
                    "(local.set $%s (ref.eq (local.get $%s) %s))" % (f.ivar(), a, f.alloc(T, 2))]
    elif k == 5 and s0:
        # allocations in both arms of an if, merged into a local
        x = r.choice(s0)
        out += ["(if %s (then (local.set $%s %s)) (else (local.set $%s %s)))" % (
            f.expr("i32", 1), x, f.alloc("S0", 2), x, f.ref_expr("S0", 2)),
            "(struct.set $S0 1 (local.get $%s) %s)" % (x, f.expr("i32", 2)),
            "(local.set $%s (struct.get_s $S0 1 (local.get $%s)))" % (f.ivar(), x)]
    elif k == 6 and s0:
        # conditional nulling then is_null / as_non_null
        x = r.choice(s0)
        out += ["(local.set $%s %s)" % (x, f.alloc("S0", 1)),
                "(if %s (then (local.set $%s (ref.null $S0))))" % (f.expr("i32", 1), x),
                "(local.set $%s (ref.is_null (local.get $%s)))" % (f.ivar(), x),
                "(local.set $%s (struct.get $S0 0 (ref.as_non_null (local.get $%s))))" % (f.ivar(), x)]
    elif k == 7:
        # immutable field read after construction (Precompute)
        T = r.choice(["S1", "A2"])
        if T == "S1" and s1:
            x = r.choice(s1)
            out += ["(local.set $%s %s)" % (x, f.alloc("S1", 1)),
                    f.stmt(1),
                    "(local.set $%s (struct.get $S1 0 (local.get $%s)))" % (f.ivar(), x)]
        elif T == "A2" and loc("A2"):
            x = r.choice(loc("A2"))
            out += ["(local.set $%s (array.new_fixed $A2 3 %s %s %s))" % (
                x, f.expr("i32", 2), f.const("i32"), f.expr("i32", 2)),
                "(local.set $%s (array.get_%s $A2 (local.get $%s) %s))" % (f.ivar(), r.choice("su"), x, f.index(1))]
    elif k == 8 and s0:
        # tee + get of the same allocation, ref.eq / struct.get on both
        x = r.choice(s0)
        out += ["(local.set $%s (ref.eq (local.tee $%s %s) (local.get $%s)))" % (f.ivar(), x, f.ref_expr("S0", 1), x),
                "(struct.set $S0 0 (local.tee $%s %s) (struct.get $S0 0 (local.get $%s)))" % (x, f.ref_expr("S0", 1), x)]
    elif k == 9 and s0:
        # get after set through param alias
        ps = par("S0")
        if ps:
            p = r.choice(ps)
            q = r.choice(ps)
            out += ["(struct.set $S0 0 (local.get $%s) %s)" % (p, f.expr("i32", 2)),
                    "(struct.set $S0 0 (local.get $%s) %s)" % (q, f.expr("i32", 2)),
                    "(local.set $%s (struct.get $S0 0 (local.get $%s)))" % (f.ivar(), p)]
    elif k == 10:
        # i31 round trip
        out += ["(local.set $%s (i31.get_%s (ref.i31 %s)))" % (f.ivar(), r.choice("su"), f.expr("i32", 1))]
    elif k == 11 and s1 and s0:
        # nested allocation stored into fresh outer, read back through outer
        x, y = r.choice(s1), r.choice(s0)
        out += ["(local.set $%s %s)" % (y, f.alloc("S0", 2)),
                "(local.set $%s (struct.new $S1 %s (local.get $%s) %s))" % (x, f.expr("i32", 2), y, f.expr("i32", 2)),
                "(struct.set $S0 0 (local.get $%s) %s)" % (y, f.expr("i32", 2)),
                "(local.set $%s (struct.get $S0 0 (struct.get $S1 1 (local.get $%s))))" % (f.ivar(), x)]
    return out


def _ivar(self):
    vs = [n for (n, t) in self.params + self.locals if t == "i32"]
    return self.r.choice(vs)


Fn.ivar = _ivar


# ALIAS mode: every reference parameter has the same type, so that sets
# through parameters stay inside exwasm-gc2's subset while the parameters may
# alias each other.
ALIAS = False


def gen_func(rnd, idx):
    f = Fn(rnd, "f%d" % idx, depth_budget=rnd.choice([2, 2, 3]))
    np = rnd.randint(1, 5)
    alias_t = rnd.choice(["S0", "S0", "S2", "A0", "A1"])
    for i in range(np):
        if ALIAS:
            t = ("ref", alias_t) if rnd.random() < 0.6 else rnd.choice(["i32", "i32", "i64"])
            f.params.append(("p%d" % i, t))
            continue
        c = rnd.random()
        if c < 0.4:
            t = "i32"
        elif c < 0.5:
            t = "i64"
        elif c < 0.55:
            t = ("ref", "i31")
        else:
            t = ("ref", rnd.choice(["S0", "S0", "S1", "S2", "A0", "A1", "A2", "A3"]))
        f.params.append(("p%d" % i, t))
    if not any(t == "i32" for _, t in f.params):
        f.params.append(("p%d" % np, "i32"))
    f.locals.append(("i0", "i32"))
    f.locals.append(("i1", "i32"))
    if rnd.random() < 0.4:
        f.locals.append(("j0", "i64"))
    for i, T in enumerate(rnd.sample(["S0", "S0", "S1", "S2", "A0", "A1", "A2", "A3"], rnd.randint(1, 4))):
        f.locals.append(("r%d" % i, ("ref", T)))
    body = []
    # prologue: most reference locals start as a fresh allocation or a param
    for n_, t_ in f.locals:
        if isinstance(t_, tuple) and rnd.random() < 0.75:
            ps_ = [pn for pn, pt in f.params if pt == t_]
            if ps_ and rnd.random() < 0.35:
                body.append("(local.set $%s (local.get $%s))" % (n_, rnd.choice(ps_)))
            else:
                body.append("(local.set $%s %s)" % (n_, f.alloc(t_[1], 2)))
    n = rnd.randint(1, 4)
    for _ in range(n):
        if rnd.random() < 0.45:
            body += templates(f)
        else:
            body.append(f.stmt(0))
    rt = rnd.choice(["i32", "i32", "i32", "i64", None])
    return f, body, rt


def render_func(f, body, rt, name):
    ps = " ".join("(param $%s %s)" % (n, wt(t)) for n, t in f.params)
    ls = " ".join("(local $%s %s)" % (n, wt(t)) for n, t in f.locals)
    res = "(result %s)" % rt if rt else ""
    tail = ""
    if rt:
        tail = f.expr(rt, 1)
    return "  (func $%s (export \"%s\") %s %s %s\n    %s\n    %s)\n" % (
        name, name, ps, res, ls, "\n    ".join(body), tail), tail


def render_module(funcs):
    out = ["(module", TYPES,
           "  (memory (export \"mem\") 1 1)",
           "  (global $g0 (export \"g0\") (mut i32) (i32.const 0))",
           "  (global $g1 (export \"g1\") (mut i32) (i32.const 7))"]
    for text in funcs:
        out.append(text)
    out.append(")")
    return "\n".join(out)


# ---- mutation --------------------------------------------------------
def mutate(rnd, f, body):
    body = list(body)
    if not body:
        return body
    k = rnd.randrange(7)
    i = rnd.randrange(len(body))
    if k == 0:
        body.insert(i, body[i])  # duplicate (same field written twice etc.)
    elif k == 1 and len(body) > 1:
        del body[i]
    elif k == 2 and len(body) > 1:
        j = min(i + 1, len(body) - 1)
        body[i], body[j] = body[j], body[i]
    elif k == 3:
        body[i] = "(if %s (then %s))" % (f.expr("i32", 2), body[i])
    elif k == 4:
        # alias: copy one ref local into another of the same type, then
        # rename uses in a later statement
        import re
        refs = [(n, t) for (n, t) in f.params + f.locals if isinstance(t, tuple) and t[1] != "i31"]
        byt = {}
        for n, t in refs:
            byt.setdefault(t, []).append(n)
        cands = [v for v in byt.values() if len(v) >= 2]
        if cands:
            a, b = rnd.sample(rnd.choice(cands), 2)
            body.insert(i, "(local.set $%s (local.get $%s))" % (b, a))
            for j in range(i + 1, len(body)):
                if rnd.random() < 0.5:
                    body[j] = re.sub(r"\(local.get \$%s\)" % a, "(local.get $%s)" % b, body[j])
    elif k == 5:
        # escape: store a ref local into a heap slot
        s0 = [n for (n, t) in f.params + f.locals if t == ("ref", "S0")]
        s2 = [n for (n, t) in f.params + f.locals if t == ("ref", "S2")]
        if s0 and rnd.random() < 0.6:
            body.insert(i, "(struct.set $S1 1 %s (local.get $%s))" % (f.ref_expr("S1", 1), rnd.choice(s0)))
        elif s2:
            body.insert(i, "(array.set $A3 %s %s (local.get $%s))" % (f.ref_expr("A3", 1), f.index(1), rnd.choice(s2)))
    elif k == 6:
        body.insert(i, f.stmt(0))
    return body


def gen_module(seed, nfuncs=None, nmut=0):
    rnd = random.Random(seed)
    nf = nfuncs or rnd.randint(1, 4)
    texts = []
    k = 0
    for i in range(nf):
        f, body, rt = gen_func(rnd, i)
        t, tail = render_func(f, body, rt, "f%d" % k)
        texts.append(t)
        k += 1
        for m in range(nmut):
            b2 = body
            for _ in range(rnd.randint(1, 3)):
                b2 = mutate(rnd, f, b2)
            t2, _ = render_func(f, b2, rt, "f%d" % k)
            if rt:
                t2 = t2.rsplit("\n", 1)[0]  # fall back below
                t2 = render_func_tail(f, b2, rt, "f%d" % k, tail)
            texts.append(t2)
            k += 1
    return render_module(texts)


def render_func_tail(f, body, rt, name, tail):
    ps = " ".join("(param $%s %s)" % (n, wt(t)) for n, t in f.params)
    ls = " ".join("(local $%s %s)" % (n, wt(t)) for n, t in f.locals)
    res = "(result %s)" % rt if rt else ""
    return "  (func $%s (export \"%s\") %s %s %s\n    %s\n    %s)\n" % (
        name, name, ps, res, ls, "\n    ".join(body), tail)


if __name__ == "__main__":
    seed = int(sys.argv[1])
    nf = int(sys.argv[2]) if len(sys.argv) > 2 else None
    nm = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    print(gen_module(seed, nf, nm))
