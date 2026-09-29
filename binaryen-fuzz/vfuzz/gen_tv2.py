#!/usr/bin/env python3
"""Single-function modules for exwasm translation validation (round 5).

Covers the region exwasm-tv supports beyond straight-line code: if/else with
results, nested block/br_if/br_table, memory.grow/memory.size, loads/stores
with boundary offsets, memory64, two memories, mutable globals, tees, x++,
calls to imports, and loops with a constant trip count.  After generation the
AST goes through `mutate`, which rewrites random subtrees into shapes that
meet the preconditions of Binaryen rewrites (duplicated arms, equal-looking
effectful operands, redundant comparisons, grow in conditions, ...).

usage: gen_tv2.py SEED OUTPREFIX     writes OUTPREFIX.wat and OUTPREFIX.json
"""
import copy
import json
import os
import random
import sys

B32 = [0, 1, 2, -1, -2, 3, 4, 7, 8, 31, 32, 0x7fffffff, 0x7ffffffe, -0x80000000,
       -0x7fffffff, 0xff, 0x100, 0xffff, 0x10000, 0xfffc, 0xfffd, 0xfffe, 0x1fffc,
       65535, 65536, 65537, -4, -8, 100, -100]
B64 = [0, 1, 2, -1, -2, 3, 4, 8, 63, 64, 0x7fffffff, 0x80000000, 0xffffffff,
       0x100000000, 0xfffc, 0x10000, 0x7fffffffffffffff, -0x8000000000000000,
       -0x7fffffffffffffff, -4, 100]
OFFS = [0, 0, 0, 1, 2, 3, 4, 8, 0xfff0, 0xfffc, 0xfffd, 0xffff, 0x10000, 0x1fffc,
        0x7fffffff, 0xfffffff0, 0xfffffffc, 0xffffffff]
CMP = ["eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u"]
BIN = ["add", "sub", "mul", "and", "or", "xor", "shl", "shr_s", "shr_u", "rotl",
       "rotr", "div_s", "div_u", "rem_s", "rem_u"]
UN = ["clz", "ctz", "popcnt", "extend8_s", "extend16_s"]
LOADS = {"i32": [("i32.load", 4), ("i32.load8_s", 1), ("i32.load8_u", 1),
                 ("i32.load16_s", 2), ("i32.load16_u", 2)],
         "i64": [("i64.load", 8), ("i64.load8_u", 1), ("i64.load16_s", 2),
                 ("i64.load32_u", 4), ("i64.load32_s", 4)]}
STORES = {"i32": [("i32.store", 4), ("i32.store8", 1), ("i32.store16", 2)],
          "i64": [("i64.store", 8), ("i64.store8", 1), ("i64.store16", 2),
                  ("i64.store32", 4)]}


def wrap(v, t):
    n = 32 if t == "i32" else 64
    return ((v + (1 << (n - 1))) % (1 << n)) - (1 << (n - 1))


def emit(n):
    if isinstance(n, str):
        return n
    return "(" + " ".join(emit(c) for c in n) + ")"


class Gen:
    def __init__(self, r):
        self.r = r
        mm = r.choice(["m32", "m32", "m64", "multi", "multi"])
        self.mems = {"m32": ["i32"], "m64": ["i64"], "multi": ["i32", "i64"]}[mm]
        if mm == "multi" and r.random() < 0.3:
            self.mems = ["i64", "i32"]
        self.maxpages = r.choice([None, None, 2, 4])
        self.params = [("p0", "i32"), ("p1", "i32"), ("p2", "i64")]
        if r.random() < 0.5:
            self.params.append(("p3", "i32"))
        self.locals = [("l0", "i32"), ("l1", "i32"), ("l2", "i64")]
        self.globals = [("g0", "i32"), ("g1", "i32"), ("g2", "i64")]
        self.rtype = r.choice(["i32", "i32", "i64"])
        self.labels = []  # (name, type or None)
        self.nlabel = 0
        self.nloop = 0
        self.loopvars = []
        self.calls = r.random() < 0.25

    # ---- leaves
    def cval(self, t, near=None):
        r = self.r
        if near is not None and r.random() < 0.5:
            return wrap(near + r.choice([-1, 0, 1]), t)
        if r.random() < 0.85:
            return wrap(r.choice(B32 if t == "i32" else B64), t)
        return wrap(r.randrange(-40, 40), t)

    def const(self, t, near=None):
        return [f"{t}.const", str(self.cval(t, near))]

    def var(self, t):
        vs = [v for v in self.params + self.locals if v[1] == t]
        return self.r.choice(vs)[0]

    def glob(self, t):
        return self.r.choice([g for g in self.globals if g[1] == t])[0]

    def memidx(self, want=None):
        ks = [k for k, a in enumerate(self.mems) if want is None or a == want]
        return self.r.choice(ks) if ks else None

    def conv(self, e, frm, to):
        if frm == to:
            return e
        if frm == "i64":
            return ["i32.wrap_i64", e]
        return [self.r.choice(["i64.extend_i32_u", "i64.extend_i32_s"]), e]

    # ---- expressions
    def addr(self, k, d):
        at = self.mems[k]
        r = self.r
        x = r.random()
        if x < 0.35:
            return self.const(at) if at == "i64" else ["i32.const", str(r.choice(
                [0, 1, 4, 8, 0xfff0, 0xfffc, 0xfffd, 0xffff, 0x10000, 0x1fffc, -1, -4]))]
        if x < 0.6:
            return ["local.get", "$" + self.var(at)]
        return self.expr(at, d + 1)

    def load(self, t, d):
        k = self.memidx()
        op, w = self.r.choice(LOADS[t])
        m = [op, f"$m{k}"]
        off = self.r.choice(OFFS)
        if off:
            m.append(f"offset={off}")
        if self.r.random() < 0.3 and w > 1:
            m.append("align=1")
        return [" ".join(m), self.addr(k, d)]

    def store(self, d):
        t = self.r.choice(["i32", "i64"])
        k = self.memidx()
        op, w = self.r.choice(STORES[t])
        m = [op, f"$m{k}"]
        off = self.r.choice(OFFS)
        if off:
            m.append(f"offset={off}")
        if self.r.random() < 0.3 and w > 1:
            m.append("align=1")
        return [" ".join(m), self.addr(k, d), self.expr(t, d + 1)]

    def grow(self, d):
        k = self.memidx()
        at = self.mems[k]
        r = self.r
        delta = self.const(at) if r.random() < 0.3 else [f"{at}.const", str(r.choice([0, 1, 1, 2]))]
        if r.random() < 0.2:
            delta = self.expr(at, d + 1)
        return [f"memory.grow $m{k}", delta], at

    def size(self):
        k = self.memidx()
        return [f"memory.size $m{k}"], self.mems[k]

    def cond(self, d):
        """i32 condition, often in shapes ConstraintAnalysis parses."""
        r = self.r
        x = r.random()
        if d < 3 and x < 0.1:
            return ["i32.and", self.cond(d + 1), self.cond(d + 1)]
        if d < 3 and x < 0.15:
            return ["i32.or", self.cond(d + 1), self.cond(d + 1)]
        if d < 3 and x < 0.22:
            return ["i32.eqz", self.cond(d + 1)]
        if x < 0.3:
            return self.expr("i32", d + 1)
        t = r.choice(["i32", "i32", "i64"])
        if x < 0.36:
            return [f"{t}.eqz", self.term(t, d)]
        lhs = self.term(t, d)
        if r.random() < 0.3:
            rhs = self.term(t, d)
        else:
            rhs = self.const(t)
        if r.random() < 0.15:
            lhs, rhs = rhs, lhs
        return [f"{t}.{r.choice(CMP)}", lhs, rhs]

    def term(self, t, d):
        r = self.r
        x = r.random()
        v = self.var(t)
        if t == "i32" and self.loopvars and x < 0.25:
            return ["local.get", "$" + r.choice(self.loopvars)]
        if x < 0.55:
            return ["local.get", "$" + v]
        if x < 0.7:
            return ["local.tee", "$" + v, self.expr(t, d + 2)]
        if x < 0.85:
            return ["local.tee", "$" + v, [f"{t}.add", ["local.get", "$" + v], [f"{t}.const", "1"]]]
        return self.expr(t, d + 2)

    def expr(self, t, d=0):
        r = self.r
        if d > 4 or r.random() < 0.18 + 0.1 * d:
            x = r.random()
            if x < 0.4:
                return self.const(t)
            if x < 0.75:
                return ["local.get", "$" + self.var(t)]
            if x < 0.9:
                return ["global.get", "$" + self.glob(t)]
            e, at = self.size()
            if at == "i64" and t == "i32" and not os.environ.get("GEN_ALLOW_WRAP_SIZE64"):
                # exwasm-tv rejects i32.wrap_i64 of a memory64 memory.size once
                # the memory may have grown ("iN value outside [0, 2^64)")
                return [f"i64.{r.choice(['lt_u', 'gt_u', 'eq', 'ne'])}", e,
                        ["i64.const", str(r.choice([0, 1, 2, 3, 0x10000]))]]
            return self.conv(e, at, t)
        x = r.random()
        if x < 0.2:
            return [f"{t}.{r.choice(BIN)}", self.expr(t, d + 1), self.expr(t, d + 1)]
        if x < 0.26:
            return [f"{t}.{r.choice(UN)}", self.expr(t, d + 1)]
        if x < 0.34:
            if t == "i32":
                return self.cond(d + 1)
            return self.conv(self.cond(d + 1), "i32", "i64")
        if x < 0.38:
            o = "i64" if t == "i32" else "i32"
            return self.conv(self.expr(o, d + 1), o, t)
        if x < 0.46:
            return self.term(t, d)
        if x < 0.52:
            return ["select", self.expr(t, d + 1), self.expr(t, d + 1), self.cond(d + 1)]
        if x < 0.62:
            return [f"if (result {t})", self.cond(d + 1),
                    ["then", *self.stmts(d + 2, r.randrange(0, 2)), self.expr(t, d + 1)],
                    ["else", *self.stmts(d + 2, r.randrange(0, 2)), self.expr(t, d + 1)]]
        if x < 0.69:
            return self.valblock(t, d)
        if x < 0.78:
            return self.load(t, d)
        if x < 0.84:
            e, at = self.grow(d)
            return self.conv(e, at, t)
        if x < 0.87 and self.calls:
            return self.conv(["call $h", self.expr("i32", d + 1)], "i32", t)
        if x < 0.92:
            return ["global.get", "$" + self.glob(t)]
        return ["local.get", "$" + self.var(t)]

    def valblock(self, t, d):
        r = self.r
        name = f"$b{self.nlabel}"
        self.nlabel += 1
        self.labels.append((name, t))
        body = []
        for _ in range(r.randrange(1, 3)):
            if r.random() < 0.6:
                body.append(["drop", ["br_if", name, self.expr(t, d + 1), self.cond(d + 1)]])
            else:
                body.append(self.stmt(d + 1))
        body.append(self.expr(t, d + 1))
        self.labels.pop()
        return [f"block {name} (result {t})", *body]

    # ---- statements
    def stmts(self, d, n):
        return [self.stmt(d) for _ in range(n)]

    def stmt(self, d=0):
        r = self.r
        x = r.random()
        if d > 4:
            x = r.random() * 0.4
        if x < 0.14:
            t = r.choice(["i32", "i32", "i64"])
            v = self.var(t)
            if r.random() < 0.25:
                return ["local.set", "$" + v, [f"{t}.add", ["local.get", "$" + v], [f"{t}.const", "1"]]]
            return ["local.set", "$" + v, self.expr(t, d + 1)]
        if x < 0.22:
            t = r.choice(["i32", "i64"])
            return ["global.set", "$" + self.glob(t), self.expr(t, d + 1)]
        if x < 0.34:
            return self.store(d)
        if x < 0.4:
            return ["drop", self.expr(r.choice(["i32", "i64"]), d + 1)]
        if x < 0.55:
            s = ["if", self.cond(d + 1), ["then", *self.stmts(d + 1, r.randrange(1, 3))]]
            if r.random() < 0.6:
                s.append(["else", *self.stmts(d + 1, r.randrange(1, 3))])
            return s
        if x < 0.63:
            # CA shape: compare a local against a boundary, then use it inside
            t = r.choice(["i32", "i32", "i64"])
            v = self.var(t)
            c = self.cval(t)
            inner = [["drop", [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v], self.const(t, c)]]
                     if r.random() < 0.3 else self.use(v, t, c, d)]
            inner += self.stmts(d + 2, r.randrange(0, 2))
            s = ["if", [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v], [f"{t}.const", str(c)]],
                 ["then", *inner]]
            if r.random() < 0.5:
                s.append(["else", self.use(v, t, c, d)])
            return s
        if x < 0.75:
            name = f"$b{self.nlabel}"
            self.nlabel += 1
            self.labels.append((name, None))
            body = []
            for _ in range(r.randrange(1, 4)):
                y = r.random()
                if y < 0.35:
                    body.append(["br_if", self.vlabel(), self.cond(d + 1)])
                elif y < 0.45:
                    body.append(["if", self.cond(d + 1), ["then", ["br", self.vlabel()]]])
                else:
                    body.append(self.stmt(d + 1))
            self.labels.pop()
            return [f"block {name}", *body]
        if x < 0.8:
            return self.brtable(d)
        if x < 0.85 and d < 2:
            return self.loop(d)
        if x < 0.88 and self.calls:
            return ["call $v"]
        t = r.choice(["i32", "i64"])
        v = self.var(t)
        return ["local.set", "$" + v, self.expr(t, d + 1)]

    def use(self, v, t, c, d):
        """Store something that depends on local v (so wrong facts about v show)."""
        r = self.r
        e = [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v], self.const(t, c)]
        if r.random() < 0.3:
            e = [f"{t}.eqz", ["local.get", "$" + v]]
        if r.random() < 0.3:
            e = self.conv(["local.get", "$" + v], t, "i32")
        return ["global.set", "$" + self.glob("i32"), [r.choice(["i32.add", "i32.xor"]),
                                                     ["global.get", "$" + self.glob("i32")], e]]

    def vlabel(self):
        vs = [l[0] for l in self.labels if l[1] is None]
        return self.r.choice(vs)

    def brtable(self, d):
        r = self.r
        n = r.randrange(2, 4)
        names = [f"$b{self.nlabel + i}" for i in range(n)]
        self.nlabel += n
        outer = self.labels[:]
        for nm in names:
            self.labels.append((nm, None))
        targets = [r.choice(names) for _ in range(r.randrange(1, 4))]
        idx = self.expr("i32", d + 1) if r.random() < 0.5 else ["local.get", "$" + self.var("i32")]
        inner = [f"block {names[-1]}", *self.stmts(d + 2, r.randrange(0, 2)),
                 ["br_table", *targets, r.choice(names), idx]]
        cur = inner
        for k in range(n - 2, -1, -1):
            self.labels = outer + [(nm, None) for nm in names[:k + 1]]
            cur = [f"block {names[k]}", cur, *self.stmts(d + 2, r.randrange(0, 2))]
        self.labels = outer
        return cur

    def loop(self, d):
        r = self.r
        i = f"i{self.nloop}"
        self.nloop += 1
        self.extra_locals.append((i, "i32"))
        k = r.randrange(1, 4)
        name = f"$L{i}"
        self.loopvars.append(i)
        body = self.stmts(d + 2, r.randrange(1, 3))
        self.loopvars.pop()
        # heads ending in a space mark subtrees the mutator must not touch
        return ["block", ["local.set ", "$" + i, ["i32.const", "0"]],
                [f"loop {name}", *body,
                 ["br_if ", name, ["i32.lt_u", ["local.tee", "$" + i,
                                               ["i32.add", ["local.get", "$" + i], ["i32.const", "1"]]],
                                  ["i32.const", str(k)]]]]]

    def func(self):
        self.extra_locals = []
        body = self.stmts(0, self.r.randrange(2, 6)) + [self.expr(self.rtype, 0)]
        return body


# ---------------------------------------------------------------- mutation

def walk(n, path=()):
    """Yield (path, node) for every list node."""
    if isinstance(n, list):
        if n[0].endswith(" "):
            return
        yield path, n
        for i, c in enumerate(n):
            if isinstance(c, list):
                yield from walk(c, path + (i,))


def get_at(n, path):
    for i in path:
        n = n[i]
    return n


def set_at(root, path, v):
    get_at(root, path[:-1])[path[-1]] = v


def typeof(n):
    """Best-effort result type of an expression node (None for statements)."""
    h = n[0].split()[0]
    if h in ("local.get", "local.tee"):
        return TYPES.get(n[1])
    if h == "global.get":
        return TYPES.get(n[1])
    if h.startswith("i32.") or h.startswith("i64."):
        base = h.split(".")[1]
        if "store" in base:
            return None
        if base in CMP or base == "eqz" or h == "i32.wrap_i64":
            return "i32"
        return h[:3]
    if h in ("select",):
        return typeof(n[1])
    if h in ("if", "block") and "(result" in n[0]:
        return n[0].split("(result ")[1].rstrip(")")
    if h in ("memory.grow", "memory.size"):
        k = int(n[0].split("$m")[1])
        return MEMS[k]
    if h == "call" and n[0] == "call $h":
        return "i32"
    if h == "br_if" and len(n) == 4:
        return typeof(n[2])
    return None


TYPES = {}
MEMS = []
EFFECTFUL = ("memory.grow", "call", "local.tee", "global.get", "i32.load", "i64.load")


def effectful(n):
    return any(isinstance(x, list) and x[0].split()[0].split(".")[0] in ("memory", "call") or
               (isinstance(x, list) and x[0].split()[0] in ("local.tee",)) or
               (isinstance(x, list) and ".load" in x[0])
               for _, x in walk(n))


def mutate(g, body, r, nmut):
    # roots are the statements of the body; mutate expression nodes in place
    root = ["func", *body]
    for _ in range(nmut):
        nodes = [(p, n) for p, n in walk(root) if p and typeof(n) is not None
                 and not n[0].startswith("then") and not n[0].startswith("else")]
        stmts = [(p, n) for p, n in walk(root) if p and typeof(n) is None
                 and n[0].split()[0] not in ("then", "else", "func")]
        kind = r.choice(["dupsel", "dupif", "effbin", "growcond", "redcmp", "tailfold",
                         "headfold", "aliasls", "boundary", "teeget", "dupstore", "cmpself"])
        if kind in ("dupsel", "dupif", "effbin", "teeget", "cmpself") and nodes:
            p, n = r.choice(nodes)
            t = typeof(n)
            if kind == "dupsel":
                e = n if effectful(n) or r.random() < 0.3 else g.expr(t, 2)
                if r.random() < 0.5:
                    opts = [n, g.load(t, 3)]
                    ge, gat = g.grow(3)
                    if gat == t:
                        opts += [ge, ge]
                    e = r.choice(opts)
                new = ["select", copy.deepcopy(e), copy.deepcopy(e), g.cond(2)]
            elif kind == "dupif":
                new = [f"if (result {t})", g.cond(2), ["then", copy.deepcopy(n)],
                       ["else", copy.deepcopy(n)]]
            elif kind == "effbin":
                op = r.choice(["sub", "xor", "eq", "ne", "and", "or", "add", "lt_u", "ge_s"])
                new = [f"{t}.{op}", copy.deepcopy(n), copy.deepcopy(n)]
                if op in ("eq", "ne", "lt_u", "ge_s") and t == "i64":
                    new = ["i64.extend_i32_u", new]
            elif kind == "teeget":
                v = g.var(t)
                new = [f"{t}.{r.choice(['sub', 'xor', 'eq', 'add', 'gt_u'])}",
                       ["local.tee", "$" + v, copy.deepcopy(n)], ["local.get", "$" + v]]
                if typeof(new) != t:
                    new = g.conv(new, "i32", t)
            else:
                v = g.var(t)
                new = [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v],
                       ["local.tee", "$" + v, copy.deepcopy(n)]]
                new = g.conv(new, "i32", t)
            set_at(root, p, new)
        elif kind == "growcond" and nodes:
            cands = [(p, n) for p, n in nodes if typeof(n) == "i32"]
            if not cands:
                continue
            p, n = r.choice(cands)
            e, at = g.grow(3)
            c = [r.choice(["i32.eq", "i32.ne", "i32.lt_s", "i32.eqz"]), g.conv(e, at, "i32")]
            if c[0] != "i32.eqz":
                c.append(["i32.const", r.choice(["-1", "0", "1"])])
            set_at(root, p, ["select", copy.deepcopy(n), g.expr("i32", 3), c]
                   if r.random() < 0.5 else [f"if (result i32)", c, ["then", copy.deepcopy(n)],
                                             ["else", g.expr("i32", 3)]])
        elif kind == "redcmp" and stmts:
            p, s = r.choice(stmts)
            t = r.choice(["i32", "i64"])
            v = g.var(t)
            c = g.cval(t)
            c2 = str(wrap(c + r.choice([-1, 0, 0, 1]), t))
            new = ["if", [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v], [f"{t}.const", str(c)]],
                   ["then", ["if", [f"{t}.{r.choice(CMP)}", ["local.get", "$" + v], [f"{t}.const", c2]],
                             ["then", copy.deepcopy(s)], ["else", g.use(v, t, c, 3)]]]]
            set_at(root, p, new)
        elif kind in ("tailfold", "headfold") and stmts:
            ifs = [(p, n) for p, n in stmts if n[0] == "if" and len(n) == 4]
            if not ifs:
                continue
            p, n = r.choice(ifs)
            s = g.stmt(3) if r.random() < 0.5 else copy.deepcopy(r.choice(stmts)[1])
            if kind == "tailfold":
                n[2].append(copy.deepcopy(s))
                n[3].append(copy.deepcopy(s))
            else:
                n[2].insert(1, copy.deepcopy(s))
                n[3].insert(1, copy.deepcopy(s))
        elif kind == "aliasls" and stmts:
            p, s = r.choice(stmts)
            k = g.memidx()
            at = g.mems[k]
            t = r.choice(["i32", "i64"])
            op, w = r.choice(STORES[t])
            a = ["local.get", "$" + g.var(at)]
            o1 = r.choice([0, 4, 0xfffc, 0xffff, 0xfffffffc])
            o2 = o1 + r.choice([-4, -2, -1, 0, 1, 2, 4])
            if o2 < 0 or o2 > 0xffffffff:
                o2 = o1
            lop, lw = r.choice(LOADS[t])
            st = [f"{op} $m{k} offset={o1}", copy.deepcopy(a), g.expr(t, 3)]
            ld = [f"{lop} $m{k} offset={o2}", copy.deepcopy(a)]
            gl = g.glob(t)
            set_at(root, p, ["block", st, copy.deepcopy(s),
                             ["global.set", "$" + gl, ld]])
        elif kind == "dupstore" and stmts:
            st = [(p, n) for p, n in stmts if ".store" in n[0]]
            if not st:
                continue
            p, n = r.choice(st)
            n2 = copy.deepcopy(n)
            if r.random() < 0.5:
                n2[2] = g.expr(n[0].split(".")[0], 3)
            set_at(root, p, ["block", copy.deepcopy(n), g.stmt(4) if r.random() < 0.4 else ["nop"], n2])
        elif kind == "boundary":
            cs = [(p, n) for p, n in nodes if n[0] in ("i32.const", "i64.const")]
            if not cs:
                continue
            p, n = r.choice(cs)
            n[1] = str(g.cval(n[0][:3]))
    return root[1:]


def module(g, body):
    out = ["(module"]
    out.append(' (import "env" "h" (func $h (param i32) (result i32)))')
    out.append(' (import "env" "v" (func $v))')
    for k, at in enumerate(g.mems):
        lim = "0" if g.maxpages is None else f"0 {g.maxpages}"
        out.append(f" (memory $m{k} {'i64 ' if at == 'i64' else ''}{lim})")
        out.append(f' (export "m{k}" (memory $m{k}))')
    for nm, t in g.globals:
        out.append(f" (global ${nm} (mut {t}) ({t}.const 0))")
        out.append(f' (export "{nm}" (global ${nm}))')
    ps = " ".join(f"(param ${n} {t})" for n, t in g.params)
    out.append(f' (func $f (export "f") {ps} (result {g.rtype})')
    for n, t in g.locals + g.extra_locals:
        out.append(f"  (local ${n} {t})")
    for s in body:
        out.append("  " + emit(s))
    out.append(" )")
    out.append(")")
    return "\n".join(out) + "\n"


def main():
    seed, prefix = int(sys.argv[1]), sys.argv[2]
    r = random.Random(seed)
    g = Gen(r)
    TYPES.clear()
    for n, t in g.params + g.locals + g.globals:
        TYPES["$" + n] = t
    MEMS[:] = g.mems
    body = g.func()
    for n, t in g.extra_locals:
        TYPES["$" + n] = t
    if r.random() < 0.85:
        body = mutate(g, body, r, r.randrange(1, 4))
    with open(prefix + ".wat", "w") as fh:
        fh.write(module(g, body))
    with open(prefix + ".json", "w") as fh:
        json.dump({"params": [t for _, t in g.params], "mems": g.mems, "max": g.maxpages,
                   "globals": [t for _, t in g.globals], "result": g.rtype}, fh)


if __name__ == "__main__":
    main()
