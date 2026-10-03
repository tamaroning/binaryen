"""Rows and module parts that reach optimizer code the other rows leave unexecuted.

They were chosen from line coverage of Binaryen's src/passes/*.cpp over generated modules (cov/):
instruction idioms the peephole passes match, control-flow layouts the branch / local passes
rewrite, allocation flows Heap2Local follows, and module-level shapes whole passes look for.
Every row is type-correct by construction like the rest of the table; none of them is tied to a
particular optimizer rewrite.  A module with focus "cov" boosts the family.

Feature tag
  cov   everything in this file (module parts check it as well)

Module parts (setup_cov)
  many globals (>= 128), "once" functions, internal callees of several shapes (early return,
  loops, multiple returns, br_table, recursion with a bounded depth, reference parameters),
  families of functions that differ only in constants, data segments with zero runs and
  overlaps plus constant memory.init / data.drop.
"""
import random

import table
from table import ROWS, SETUPS, Row, _memop, row
from wmod import LOADS, NUM, STORES, Func, N, TypeDef, Unsupported, is_ref, parse_sx, to_node, vt_str

table.FEATURES_ON.add("cov")
table.FOCUS_TAGS.add("cov")

I = ("i32", "i64")
CMPS = ["eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u"]
EDGE = {"i32": [0, 1, -1, 2, -0x80000000, 0x7fffffff, 0xff, 0x80000000, 0xffff, 0x7f, 0x80],
        "i64": [0, 1, -1, 2, -0x8000000000000000, 0x7fffffffffffffff, 0xffffffff, 0xff, 0x80000000, 0x7f]}


def crow(name, out, weight):
    """register a row of this family"""
    def deco(fn):
        ROWS.append(Row("cov:" + name, "cov", weight, out, fn))
        return fn
    return deco


def B(t, op, a, b):
    return N("%s.%s" % (t, op), [], [a, b])


def U(t, op, a):
    return N("%s.%s" % (t, op), [], [a])


def dup(x):
    """an independent copy for a second use of an operand"""
    return x.clone()


def edge(g, t):
    return g.const(t, g.r.choice(EDGE[t]))


def operand(g, t, d):
    """a local, a constant or a small expression of type t"""
    r = g.r.random()
    vs = g.vars_sub(t)
    if r < .55 and vs:
        return N("local.get", [g.r.choice(vs)])
    if r < .7:
        return g.const(t)
    return g.expr(t, d + 1)


def local_of(g, t, key):
    """a function-level local of type t (created on first use)"""
    name = "$cv_" + key
    if name not in g.fvars:
        g.f.locals.append((name, t))
        g.fvars[name] = t
    return name


def ref_local(g, T):
    return local_of(g, ("ref", True, T), "r_" + T.lstrip("$"))


# ======================================================================== integer idioms
@crow("sext", "int", 2.0)
def _sext(g, want, d):
    """sign / zero extension spelled with shifts, alone or inside a comparison / mask"""
    r = g.r
    t = want if want in I else None
    if t is None:
        return None
    form = r.random()
    if form < .2 and want == "i32":
        form = .3
        t = r.choice(I)  # an i64 extension inside an i32 comparison
    bits = 32 if t == "i32" else 64
    w = r.choice([8, 16] + ([32] if t == "i64" else []))
    k = bits - w

    def ext(x=None):
        x = x if x is not None else operand(g, t, d)
        c2 = k if r.random() < .75 else max(1, k - r.choice([1, 2, 8]))
        return B(t, r.choice(["shr_s", "shr_s", "shr_u"]), B(t, "shl", x, g.const(t, k)), g.const(t, c2))
    if want == "i32" and form < .5:
        c = g.const(t, r.choice([0, 1, -1, 0x7f, 0x80, 0xff, -128, 0x7fff, 0x8000, 0xffff]))
        e2 = ext() if r.random() < .25 else c
        return N("%s.%s" % (t, r.choice(["eq", "ne", "lt_s", "lt_u"])), [], [ext(), e2])
    if form < .65:
        return B(t, "and", ext(), g.const(t, r.choice([0xff, 0xffff, 0x7f, 0xffffffff])))
    if form < .85:
        # sign-extended loads
        ops = [o for o, (lt, wd) in LOADS.items() if lt == t and wd < bits // 8 and ("_s" in o or "_u" in o)]
        ld = _memop(g, d, {op: LOADS[op] for op in ops}, t, False) if ops else None
        if ld is not None:
            if t == "i32" and r.random() < .5:
                return U("i32", r.choice(["extend8_s", "extend16_s"]), ld)
            return ext(ld)
    return B(t, r.choice(["add", "or", "xor", "sub"]), ext(), ext())


@crow("cmp-edge", "i32", 2.0)
def _cmp_edge(g, want, d):
    """comparison of a value with 0 / -1 / min / max, and pairs of them combined"""
    r = g.r
    t = r.choice(I)
    x = operand(g, t, d)

    def cmp(a):
        return N("%s.%s" % (t, r.choice(CMPS)), [], [a, edge(g, t) if r.random() < .8 else operand(g, t, d)])
    form = r.random()
    if form < .3:
        return cmp(x)
    if form < .75:
        # same operand compared twice, combined with and / or / xor
        y = dup(x) if r.random() < .75 else operand(g, t, d)
        return B("i32", r.choice(["and", "or", "xor", "and", "or"]), cmp(x), cmp(y))
    if form < .9:
        return N("i32.eqz", [], [cmp(x)])
    return N("i32.%s" % r.choice(["eq", "ne"]), [], [cmp(x), g.const("i32", r.choice([0, 1]))])


@crow("identity", "int", 2.0)
def _identity(g, want, d):
    """operation with an identity / absorbing constant, with itself or with its own negation"""
    if want not in I:
        return None
    r = g.r
    x = operand(g, want, d)
    op = r.choice(["add", "sub", "mul", "and", "or", "xor", "shl", "shr_s", "shr_u", "rotl", "rotr", "div_s", "div_u",
                   "rem_s", "rem_u"])
    form = r.random()
    k = g.const(want, r.choice([0, 1, -1, 2, 4, 8, 16, 3, 5, 6, -2, 255, 65536, 1 << 20]
                               + ([1 << 40, -(1 << 40)] if want == "i64" else [])))
    if form < .5:
        return B(want, op, x, k) if r.random() < .75 else B(want, op, k, x)
    if form < .65:
        return B(want, op, x, dup(x))
    if form < .8:
        return B(want, op, x, B(want, "sub", g.const(want, 0), dup(x)))
    if form < .9:
        return B(want, op, B(want, r.choice(["add", "mul", "shl", "and", "or"]), x, g.const(want, r.choice([1, 2, 3, 8, -1]))),
                 g.const(want, r.choice([1, 2, 3, 8, -1, 255])))
    return B(want, op, U(want, r.choice(["clz", "ctz", "popcnt"]), x), k)


SHIFTS = ["shl", "shr_s", "shr_u", "rotl", "rotr"]


@crow("const-chain", "int", 2.5)
def _const_chain(g, want, d):
    """(x op C1) op C2 for the associative / shift / rotate operators, and comparisons of x + C1 with C2"""
    if want not in I and want != "i32":
        return None
    r = g.r
    t = want if want in I else "i32"
    x = operand(g, t, d)
    bits = 32 if t == "i32" else 64
    form = r.random()
    if form < .75:
        op = r.choice(["and", "or", "xor", "mul", "add", "sub"] + SHIFTS * 2)
        if op in SHIFTS:
            c1 = g.const(t, r.choice([1, 3, 8, 15, 16, bits - 1, bits, bits + 1, 31, 33, -1]))
            c2 = g.const(t, r.choice([1, 2, 8, 16, bits - 1, bits, 31, 33, -2]))
            inner_op = op
            if op in ("rotl", "rotr") and r.random() < .5:
                inner_op = "rotr" if op == "rotl" else "rotl"
            if op in ("shr_s", "shr_u", "shl") and r.random() < .15:
                inner_op = r.choice(["shl", "shr_u", "shr_s"])
        else:
            c1 = g.const(t, r.choice([0xff, 0xf0, 3, -1, 7, 0x7fffffff, 1 << 20, -256, 5]))
            c2 = g.const(t, r.choice([0xf, 0xff00, 6, 1, -2, 0x80, 12, 255]))
            inner_op = op
        res = B(t, op, B(t, inner_op, x, c1), c2)
        return res if t == want else None
    if want != "i32":
        return None
    cmp_op = r.choice(CMPS)
    c1 = g.const(t, r.choice([1, 5, 100, -1, -5, 0x7fffffff, -0x80000000, 0x40000000, 10, 255]))
    c2 = g.const(t, r.choice([0, 3, 10, 100, -1, 0x7fffffff, -0x80000000, 1 << 20, -50]))
    return N("%s.%s" % (t, cmp_op), [], [B(t, r.choice(["add", "add", "sub"]), x, c1), c2])


POW2 = [2, 4, 8, 16, 64, 256, 1 << 16]


@crow("peephole", "int", 2.5)
def _peephole(g, want, d):
    """algebraic templates: de Morgan on eqz, negation folding, strength reduction by powers of two, eqz of
    remainders / masks, boolean tests, power-of-two float division"""
    r = g.r
    t = "i64" if want == "i64" else r.choice(I)
    x, y = operand(g, t, d), operand(g, t, d)

    def zero(a):
        return B(t, "sub", g.const(t, 0), a)
    forms = []
    if want == "i32":
        forms += [
            lambda: B("i32", "and", U(t, "eqz", x), U(t, "eqz", y)),
            lambda: B("i32", "or", U(t, "eqz", x), U(t, "eqz", y)),
            lambda: U(t, "eqz", B(t, r.choice(["rem_s", "rem_u"]), x, g.const(t, r.choice(POW2 + [-0x80000000 if t == "i32" else -(1 << 63)])))),
            lambda: U(t, "eqz", B(t, r.choice(["and", "shl", "shr_u", "mul"]), x, g.const(t, r.choice([1, 3, 7, 8, 255, 31, 0x80])))),
            lambda: N("i32.eqz", [], [N("i32.eqz", [], [x if t == "i32" else N("i32.wrap_i64", [], [x])])]),
            lambda: N("i32.ne", [], [x if t == "i32" else N("i32.wrap_i64", [], [x]), g.const("i32", 0)]),
            lambda: N("%s.%s" % (t, r.choice(["eq", "ne"])), [], [B(t, r.choice(["and", "or"]), x, g.const(t, 0xf0)), g.const(t, r.choice([0xf0, 0, 0x10]))]),
            lambda: N("i32.eqz", [], [N("%s.%s" % (t, r.choice(CMPS)), [], [x, y])]),
            lambda: B("i32", "or", N("%s.lt_s" % t, [], [x, g.const(t, 0)]), N("%s.lt_s" % t, [], [y, g.const(t, 0)])),
            lambda: N("%s.%s" % (t, r.choice(["eq", "ne", "gt_u", "lt_u"])), [], [B(t, "shr_u", x, g.const(t, 31 if t == "i32" else 63)), g.const(t, r.choice([0, 1]))]),
            lambda: N("i32.eq", [], [N("i32.and", [], [g.leafish("i32", d), g.const("i32", 1)]), g.const("i32", r.choice([0, 1]))]),
        ]
    forms += [
        lambda: B(t, r.choice(["add", "sub"]), x, zero(y)) if want == t else None,
        lambda: B(t, "mul", zero(x), zero(y)) if want == t else None,
        lambda: B(t, r.choice(["div_s", "div_u", "rem_s", "rem_u", "mul"]), x, g.const(t, r.choice(POW2))) if want == t else None,
        lambda: B(t, r.choice(["mul", "div_u"]), x, g.const(t, r.choice([3, 5, 6, 10, 12, 24]))) if want == t else None,
        lambda: B(t, "xor", x, g.const(t, -1)) if want == t else None,
        lambda: B(t, r.choice(["add", "sub", "or"]), B(t, "shl", x, g.const(t, r.randint(1, 5))), dup(x)) if want == t else None,
        lambda: B(t, r.choice(["and", "or"]), B(t, r.choice(["and", "or"]), x, g.const(t, r.choice([1, 3, 0xff]))),
                  B(t, r.choice(["and", "or"]), y, g.const(t, r.choice([1, 3, 0xff00])))) if want == t else None,
        lambda: B(t, "and", B(t, "or", x, y), B(t, "or", dup(x), operand(g, t, d))) if want == t else None,
        lambda: N("select", [], [x, y, N("i32.eqz", [], [g.cond(d + 1)])]) if want == t else None,
    ]
    for _ in range(4):
        n = r.choice(forms)()
        if n is not None:
            return n
    return None


@crow("float-peephole", "any", 1.2)
def _float_peephole(g, want, d):
    """float templates: division by powers of two, comparisons of negated values, min / max of equal operands"""
    if want not in ("f32", "f64"):
        return None
    r = g.r
    t = want
    x = operand(g, t, d)
    form = r.random()
    if form < .3:
        return B(t, "div", x, N(t + ".const", [r.choice(["2", "4", "0.5", "8", "0.25", "1024", "3", "-2"])]))
    if form < .5:
        return B(t, r.choice(["mul", "add", "sub", "div"]), x, N(t + ".const", [r.choice(["1", "-1", "0", "-0", "2"])]))
    if form < .65:
        return U(t, "neg", B(t, r.choice(["sub", "add", "mul"]), U(t, "neg", x), operand(g, t, d)))
    if form < .8:
        return B(t, r.choice(["min", "max"]), x, dup(x))
    if form < .9:
        return U(t, r.choice(["floor", "ceil", "trunc", "nearest"]), U(t, r.choice(["floor", "ceil", "trunc", "nearest"]), x))
    return B(t, "copysign", U(t, "abs", x), dup(x))


@crow("convert-chain", "int", .9)
def _convert_chain(g, want, d):
    """wrap / extend / mask chains between i32 and i64"""
    r = g.r
    x32 = lambda: operand(g, "i32", d)  # noqa: E731
    x64 = lambda: operand(g, "i64", d)  # noqa: E731
    if want == "i32":
        form = r.random()
        if form < .3:
            return U("i32", "wrap_i64", U("i64", r.choice(["extend_i32_s", "extend_i32_u"]), x32()))
        if form < .5:
            return U("i32", "wrap_i64", B("i64", r.choice(["and", "shr_u", "shr_s", "or", "shl"]), x64(),
                                          g.const("i64", r.choice([0xffffffff, 32, 31, 0xff, 16, 1]))))
        if form < .75:
            return U("i32", r.choice(["extend8_s", "extend16_s"]),
                     B("i32", r.choice(["and", "or"]), x32(), g.const("i32", r.choice([0x7f, 0xff, 0x7fff, 0xffff, 0x80]))))
        return U("i32", r.choice(["extend8_s", "extend16_s"]), U("i32", r.choice(["extend8_s", "extend16_s"]), x32()))
    if want == "i64":
        form = r.random()
        if form < .3:
            return U("i64", r.choice(["extend_i32_s", "extend_i32_u"]), U("i32", "wrap_i64", x64()))
        if form < .55:
            return B("i64", "and", U("i64", "extend_i32_u", x32()), g.const("i64", r.choice([0xffffffff, 0xff, 0x7fffffff])))
        if form < .75:
            return U("i64", r.choice(["extend8_s", "extend16_s", "extend32_s"]),
                     B("i64", "and", x64(), g.const("i64", r.choice([0x7f, 0xff, 0x7fffffff, 0xffffffff, 0xffff]))))
        return U("i64", r.choice(["extend_i32_s", "extend_i32_u"]),
                 B("i32", r.choice(["and", "shr_u", "or"]), x32(),
                   g.const("i32", r.choice([0xff, 0x7fffffff, 24, 0xffff, 1]))))
    return None


@crow("select-idiom", "int", 1.0)
def _select_idiom(g, want, d):
    """select / if choosing between constants, a value and zero, equal arms, flipped or constant conditions"""
    if want not in I:
        return None
    r = g.r
    x = operand(g, want, d)
    c = g.cond(d + 1)
    form = r.random()
    if form < .25:
        a, b = g.const(want, 1), g.const(want, 0)
        if r.random() < .5:
            a, b = b, a
        return N("select", [], [a, b, c])
    if form < .45:
        return N("select", [], [x, g.const(want, r.choice([0, 1, -1])), c if r.random() < .6 else N("i32.eqz", [], [c])])
    if form < .6:
        y = dup(x) if r.random() < .6 else operand(g, want, d)
        return N("select", [], [x, y, N("i32.const", [str(r.choice([0, 1, 5]))]) if r.random() < .3 else c])
    if form < .8:
        # x < 0 ? K : x   and friends
        t = want
        return N("select", [], [g.const(t, r.choice([0, 1, -1])), x, N("%s.%s" % (t, r.choice(["lt_s", "gt_s", "eq", "ne"])), [],
                                                                      [dup(x), g.const(t, 0)])])
    th = [g.const(want, r.choice([1, 0, -1, 2]))]
    el = [g.const(want, r.choice([0, 1, -1, 2]))]
    return N("if", [["result", want]], [c, N("then", [], th), N("else", [], el)])


@crow("load-store-ext", "void", .7)
def _load_store_ext(g, want, d):
    """stores of an extended / masked value (the extension is redundant), load then mask"""
    r = g.r
    t = r.choice(I)
    ops = [o for o in STORES if STORES[o][0] == t and STORES[o][1] < (4 if t == "i32" else 8)]
    if not ops:
        return None
    op = r.choice(ops)
    w = STORES[op][1]
    x = operand(g, t, d)
    form = r.random()
    if form < .35:
        v = U(t, {1: "extend8_s", 2: "extend16_s", 4: "extend32_s"}[w], x) if not (t == "i32" and w == 4) else x
    elif form < .7:
        v = B(t, "and", x, g.const(t, (1 << (8 * w)) - 1))
    elif t == "i64" and w == 4 and form < .85:
        v = U("i64", "extend_i32_u", U("i32", "wrap_i64", x))
    else:
        v = B(t, "shr_u" if r.random() < .5 else "shr_s", B(t, "shl", x, g.const(t, 8 * (4 if t == "i32" else 8) - 8 * w)),
              g.const(t, 8 * (4 if t == "i32" else 8) - 8 * w))
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    imms = [name] if len(g.m.memories) > 1 or r.random() < .5 else []
    off = r.choice([0, 0, 1, 2, 4, 8])
    if off:
        imms.append("offset=%d" % off)
    return N(op, imms, [g.addr(at, d), v])


# ======================================================================== floats
FOPS = ["add", "sub", "mul", "div", "min", "max", "copysign"]


@crow("float-idiom", "any", 1.0)
def _float_idiom(g, want, d):
    if want not in ("f32", "f64"):
        return None
    r = g.r
    t = want
    x = operand(g, t, d)
    form = r.random()
    op = r.choice(FOPS)
    if form < .3:
        return B(t, op, U(t, "abs", x), U(t, "abs", operand(g, t, d) if r.random() < .6 else dup(x)))
    if form < .45:
        return B(t, op, U(t, "neg", x), U(t, "neg", operand(g, t, d)))
    if form < .6:
        return B(t, op, x, N(t + ".const", [r.choice(["0", "-0", "1", "-1", "2", "0.5", "4", "nan", "inf"])]))
    if form < .7:
        return B(t, op, x, dup(x))
    if form < .8:
        return U(t, r.choice(["neg", "abs", "sqrt", "floor", "ceil", "trunc", "nearest"]),
                 U(t, r.choice(["neg", "abs", "floor", "ceil", "trunc", "nearest"]), x))
    if form < .9:
        return U(t, "abs", B(t, "mul", x, dup(x) if r.random() < .6 else operand(g, t, d)))
    return B(t, "copysign", x, U(t, r.choice(["abs", "neg"]), operand(g, t, d)))


@crow("float-cmp", "i32", .5)
def _float_cmp(g, want, d):
    if "float" not in g.features_on:
        return None
    r = g.r
    t = r.choice(["f32", "f64"])
    x = operand(g, t, d)
    return N("%s.%s" % (t, r.choice(["eq", "ne", "lt", "gt", "le", "ge"])), [],
             [x, dup(x) if r.random() < .4 else N(t + ".const", [r.choice(["0", "nan", "inf", "-inf", "1"])])])


# ======================================================================== control flow
def _stmts(g, d, lo=1, hi=2):
    return [g.stmt(d + 1) for _ in range(g.r.randint(lo, hi))]


@crow("if-exit-tail", "void", 1.2)
def _if_exit_tail(g, want, d):
    """block { ...; if (c) { ...; br / return / unreachable }; rest } and the loop forms"""
    if d > 3:
        return None
    r = g.r
    lab = g.newlab()
    g.labels.append((lab, None))
    pre = _stmts(g, d, 0, 1)
    ex = r.choice(["br", "br", "return", "unreachable"])
    if ex == "return" and g.f.results:
        ex = "br"
    exit_ = {"br": N("br", [lab]), "return": N("return"), "unreachable": N("unreachable")}[ex]
    arm = _stmts(g, d, 0, 1) + [exit_]
    form = r.random()
    if form < .5:
        iff = N("if", [], [g.cond(d + 1), N("then", [], arm)])
    elif form < .8:
        iff = N("if", [], [g.cond(d + 1), N("then", [], arm), N("else", [], _stmts(g, d, 1, 2))])
    else:
        iff = N("if", [], [g.cond(d + 1), N("then", [], _stmts(g, d, 1, 2)), N("else", [], arm)])
    rest = _stmts(g, d, 1, 3)
    g.labels.pop()
    return N("block", [lab], pre + [iff] + rest)


@crow("br_if-chain", "void", .9)
def _br_if_chain(g, want, d):
    """consecutive br_if / br to one label, br_if before a trailing br, conditions with and without effects"""
    if d > 3:
        return None
    r = g.r
    lab = g.newlab()
    g.labels.append((lab, None))
    body = _stmts(g, d, 0, 1)
    for _ in range(r.randint(2, 3)):
        c = g.cond(d + 1) if r.random() < .6 else N("local.get", [r.choice(g.vars_sub("i32"))]) if g.vars_sub("i32") else g.cond(d + 1)
        body.append(N("br_if", [lab], [c]))
        if r.random() < .3:
            body.append(g.stmt(d + 1))
    if r.random() < .4:
        body.append(N("br", [lab]))
    body += _stmts(g, d, 0, 1)
    g.labels.pop()
    return N("block", [lab], body)


@crow("loop-shapes", "void", 1.0)
def _loop_shapes(g, want, d):
    """loops with the back edge as a trailing if / br_if, an exit test at the top, br_if flipping at the end"""
    if d > 2:
        return None
    r = g.r
    cnt = g.new_counter()
    out, lp = g.newlab(), g.newlab()
    g.labels.append((out, None))
    body = _stmts(g, d, 1, 2)
    g.labels.pop()
    inc = N("local.set", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])])
    lim = N("i32.const", [str(r.randint(1, 3))])
    test = N("i32.lt_u", [], [N("local.get", [cnt]), lim])
    form = r.random()
    if form < .25:
        inner = [inc] + body + [N("if", [], [test, N("then", [], [N("br", [lp])])])]
    elif form < .5:
        inner = [N("br_if", [out], [N("i32.ge_u", [], [N("local.get", [cnt]), lim])]), inc] + body + [N("br", [lp])]
    elif form < .65:
        inner = [inc] + body + [N("br_if", [out], [N("i32.eqz", [], [test])]), N("br", [lp])]
    elif form < .9:
        # a conditional exit or a two-way if in the middle, the back edge last
        g.labels.append((out, None))
        more = _stmts(g, d, 1, 2)
        arm = _stmts(g, d, 0, 1)
        g.labels.pop()
        if r.random() < .5:
            mid = N("if", [], [g.cond(d + 1), N("then", [], arm + [N("br", [out])])])
        else:
            mid = N("if", [], [g.cond(d + 1), N("then", [], arm + [N("br", [out]) if r.random() < .6 else N("unreachable")]),
                               N("else", [], _stmts(g, d, 1, 2))])
        inner = [N("br_if", [out], [N("i32.ge_u", [], [N("local.get", [cnt]), dup(lim)])]), inc] + body + [mid] + more + \
            [N("br", [lp])]
    else:
        inner = body + [inc, N("br_if", [lp], [test]), N("br", [out]) if r.random() < .5 else N("nop")]
    return N("block", [out], [N("local.set", [cnt], [N("i32.const", ["0"])]), N("loop", [lp], inner)])


@crow("br_if-ladder", "void", .9)
def _br_if_ladder(g, want, d):
    """a run of br_ifs comparing one local with distinct constants (a switch spelled with conditions)"""
    if d > 3:
        return None
    r = g.r
    n = r.randint(3, 6)
    labs = [g.newlab() for _ in range(n)]
    x = local_of(g, "i32", "sel")
    base = r.choice([0, 0, 1, 5, 100])
    ks = [base + i for i in range(n)]
    if r.random() < .3:
        ks = [base + 2 * i for i in range(n)]
    if r.random() < .5:
        ks.reverse()
    extra = {}
    for i in range(n - 1, 0, -1):
        g.labels.append((labs[i], None))
        extra[i] = _stmts(g, d, 0, 1)
    g.labels.append((labs[0], None))
    ladder = [N("local.set", [x], [g.expr("i32", d + 1)])]
    for lab, k in zip(labs, ks):
        cond = N("i32.eqz", [], [N("local.get", [x])]) if k == 0 and r.random() < .5 else \
            N("i32.eq", [], [N("local.get", [x]), N("i32.const", [str(k)])])
        ladder.append(N("br_if", [lab], [cond]))
    del g.labels[-n:]
    node = N("block", [labs[0]], ladder)
    for i in range(1, n):
        node = N("block", [labs[i]], [node] + extra[i])
    return node


@crow("switch", "void", .9)
def _switch(g, want, d):
    """nested blocks closed by a br_table over all of them (a switch), also with many equal targets"""
    if d > 3:
        return None
    r = g.r
    n = r.randint(2, 4) if r.random() < .8 else r.randint(13, 18)
    labs = [g.newlab() for _ in range(n)]
    sel = g.expr("i32", d + 1)
    if n > 12:
        # a table whose entries all name one label
        k = r.randrange(n)
        targets = [labs[k]] * (n + r.randint(0, 2))
        if r.random() < .3:
            targets[0] = labs[(k + 1) % n]
    else:
        targets = [r.choice(labs) for _ in range(r.randint(n, n + 2))]
    # block i holds block i - 1 and may branch to labs[i:]
    extra = {}
    for i in range(n - 1, 0, -1):
        g.labels.append((labs[i], None))
        extra[i] = _stmts(g, d, 0, 1)
    g.labels.append((labs[0], None))
    inner = N("block", [labs[0]], [N("br_table", targets, [sel])])
    del g.labels[-n:]
    node = inner
    for i in range(1, n):
        node = N("block", [labs[i]], [node] + extra[i])
    return N("block", [], [node] + _stmts(g, d, 0, 1)) if r.random() < .3 else node


@crow("fold-tails", "void", 1.0)
def _fold_tails(g, want, d):
    """if arms / sibling blocks that end in the same statements or the same branch"""
    if d > 3:
        return None
    r = g.r
    lab = g.newlab()
    g.labels.append((lab, None))
    tail = _stmts(g, d, 1, 2)
    form = r.random()
    if form < .5:
        a = _stmts(g, d, 0, 2) + [t.clone() for t in tail]
        b = _stmts(g, d, 0, 2) + [t.clone() for t in tail]
        node = N("if", [], [g.cond(d + 1), N("then", [], a), N("else", [], b)])
    elif form < .8:
        # two arms both leaving the block with the same branch
        br = N("br", [lab])
        a = _stmts(g, d, 0, 2) + [br.clone()]
        b = _stmts(g, d, 0, 2) + [br.clone()]
        node = N("if", [], [g.cond(d + 1), N("then", [], a), N("else", [], b)])
    else:
        # identical unreachable / return ends
        end = N("unreachable") if r.random() < .6 or g.f.results else N("return")
        a = _stmts(g, d, 0, 2) + [end.clone()]
        b = _stmts(g, d, 0, 2) + [end.clone()]
        node = N("if", [], [g.cond(d + 1), N("then", [], a), N("else", [], b)])
    g.labels.pop()
    return N("block", [lab], [node] + (_stmts(g, d, 0, 1) if r.random() < .4 else []))


@crow("set-if", "void", 1.0)
def _set_if(g, want, d):
    """local.set / tee of an if or select with constant arms, set chains, set in both arms"""
    r = g.r
    t = r.choice(I)
    vs = [v for v in g.vars_exact(t) if v not in g.counters]
    if not vs:
        return None
    v = r.choice(vs)
    form = r.random()
    if form < .3:
        return N("local.set", [v], [N("if", [["result", t]], [g.cond(d + 1), N("then", [], [g.const(t)]),
                                                              N("else", [], [g.const(t)])])])
    if form < .5:
        return N("local.set", [v], [N("select", [], [g.const(t), g.const(t), g.cond(d + 1)])])
    if form < .7:
        # set in both arms, then a use
        c = g.cond(d + 1)
        return N("block", [], [N("if", [], [c, N("then", [], [N("local.set", [v], [operand(g, t, d)])]),
                                            N("else", [], [N("local.set", [v], [operand(g, t, d)])])]),
                               N("drop", [], [B(t, "add", N("local.get", [v]), operand(g, t, d))])])
    if form < .85:
        vs2 = [x for x in vs if x != v]
        if vs2:
            w = r.choice(vs2)
            return N("local.set", [v], [N("local.tee", [w], [operand(g, t, d)])])
    # swap through a temp
    vs2 = [x for x in vs if x != v]
    if not vs2:
        return None
    w = r.choice(vs2)
    tmp = local_of(g, t, "tmp_" + t)
    return N("block", [], [N("local.set", [tmp], [N("local.get", [v])]), N("local.set", [v], [N("local.get", [w])]),
                           N("local.set", [w], [N("local.get", [tmp])])])


@crow("set-merge", "void", 1.0)
def _set_merge(g, want, d):
    """a block that leaves with the same local set on several paths and the local is read after the block"""
    if d > 3:
        return None
    r = g.r
    t = r.choice(I)
    vs = [v for v in g.vars_exact(t) if v not in g.counters]
    if not vs:
        return None
    v = r.choice(vs)
    lab = g.newlab()
    g.labels.append((lab, None))
    arms = []
    for _ in range(r.randint(1, 2)):
        arms.append(N("if", [], [g.cond(d + 1), N("then", [], _stmts(g, d, 0, 1) + [
            N("local.set", [v], [operand(g, t, d)]), N("br", [lab])])]))
    body = arms + _stmts(g, d, 0, 1) + [N("local.set", [v], [operand(g, t, d)])]
    g.labels.pop()
    use = N("drop", [], [B(t, r.choice(["add", "xor", "sub"]), N("local.get", [v]), operand(g, t, d))]) if r.random() < .6 else \
        N("local.set", [r.choice(vs)], [N("local.get", [v])])
    return N("block", [], [N("block", [lab], body), use])


@crow("call-noret", "void", .6)
def _call_noret(g, want, d):
    """a guarded call to a function that never returns, followed by more code"""
    fs = [f for f in g.m.funcs if f.meta.get("cov") == "noret"]
    if not fs:
        return None
    f = g.r.choice(fs)
    call = N("call", [f.name], [g.expr(t, d + 1) for _, t in f.params])
    if f.results:
        call = N("drop", [], [call])
    guard = N("i32.and", [], [g.cond(d + 1), N("i32.const", ["1"])])
    return N("if", [], [guard, N("then", [], [call] + (_stmts(g, d, 0, 1) if g.r.random() < .5 else []))])


@crow("local-shuffle", "void", .8)
def _local_shuffle(g, want, d):
    """overlapping live ranges over several locals inside a loop (coalescing / simplification)"""
    if d > 2:
        return None
    r = g.r
    t = "i32"
    names = [local_of(g, t, "w%d" % i) for i in range(r.randint(3, 5))]
    cnt = g.new_counter()
    lp, out = g.newlab(), g.newlab()
    body = []
    for _ in range(r.randint(3, 6)):
        a, b = r.choice(names), r.choice(names)
        form = r.random()
        if form < .35:
            body.append(N("local.set", [a], [N("local.get", [b])]))
        elif form < .7:
            body.append(N("local.set", [a], [B(t, r.choice(["add", "xor", "mul", "sub"]), N("local.get", [a]), N("local.get", [b]))]))
        else:
            body.append(N("local.set", [a], [N("local.tee", [b], [operand(g, t, d)])]))
    step = N("br_if", [lp], [N("i32.lt_u", [], [N("local.tee", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])]),
                                              N("i32.const", [str(r.randint(1, 3))])])])
    res = N("global.set", ["$g0"], [N("i32.add", [], [N("global.get", ["$g0"]), N("local.get", [r.choice(names)])])])
    return N("block", [out], [N("local.set", [cnt], [N("i32.const", ["0"])]), N("loop", [lp], body + [step]), res])


# ======================================================================== GC allocation flows
def _alloc(g, T, d, small=True):
    """struct.new / array.new* of type T with simple operands, or None"""
    td = g.tmap[T]
    if td.kind == "struct":
        return N("struct.new", [T], [operand(g, g.stv(s), d) if not is_ref(s) else g.leaf(s) for s, _ in td.fields])
    s, _ = td.fields[0]
    n = g.r.randint(1, 3)
    return N("array.new_fixed", [T, str(n)], [operand(g, g.stv(s), d) if not is_ref(s) else g.leaf(s) for _ in range(n)])


def _flow(g, node, T, d):
    """wrap an allocation in something that passes the reference through"""
    r = g.r
    rt = ("ref", False, T)
    form = r.random()
    if form < .2:
        return node
    if form < .4:
        lab = g.newlab()
        return N("block", [lab, ["result", vt_str(rt)]], [node])
    if form < .55:
        return N("ref.as_non_null", [], [N("ref.cast", [vt_str(("ref", True, T))], [node])]) if r.random() < .5 else \
            N("ref.cast", [vt_str(rt)], [node])
    if form < .7:
        loc = ref_local(g, T)
        return N("ref.as_non_null", [], [N("local.tee", [loc], [node])])
    if form < .85:
        lab = g.newlab()
        return N("block", [lab, ["result", vt_str(rt)]], [N("br", [lab], [node])])
    lab = g.newlab()
    return N("block", [lab, ["result", vt_str(rt)]], [N("drop", [], [N("br_if", [lab], [node, g.cond(d + 1)])]), _alloc(g, T, d)])


@crow("alloc-flow", "int", 1.3)
def _alloc_flow(g, want, d):
    """a field / element / length read from an allocation that flows through blocks, casts, tees and branches"""
    if want not in I or d > 3:
        return None
    r = g.r
    cands = []
    for T, td in g.tmap.items():
        if T in g.a2s:
            continue
        if td.kind == "struct":
            for i, (s, _) in enumerate(td.fields):
                if g.stv(s) == want:
                    cands.append((T, i, s))
        elif td.kind == "array" and g.stv(td.fields[0][0]) == want:
            cands.append((T, None, td.fields[0][0]))
    if not cands:
        return None
    T, i, s = r.choice(cands)
    td = g.tmap[T]
    al = _flow(g, _alloc(g, T, d), T, d)
    if td.kind == "struct":
        op = "struct.get" if s not in ("i8", "i16") else r.choice(["struct.get_s", "struct.get_u"])
        form = r.random()
        if form < .25 and td.fields[i][1]:
            # write then read
            loc = ref_local(g, T)
            return N("block", [["result", want]], [N("local.set", [loc], [al]),
                                                   N("struct.set", [T, str(i)], [N("local.get", [loc]), operand(g, g.stv(s), d)]),
                                                   N(op, [T, str(i)], [N("local.get", [loc])])])
        return N(op, [T, str(i)], [al])
    form = r.random()
    if form < .45:
        idx = N("i32.const", [str(r.choice([0, 0, 1, 2]))])
        op = "array.get" if s not in ("i8", "i16") else r.choice(["array.get_s", "array.get_u"])
        return N(op, [T], [al, idx])
    if form < .7 and want == "i32":
        return N("array.len", [], [al])
    if td.fields[0][1]:
        loc = ref_local(g, T)
        op = "array.get" if s not in ("i8", "i16") else "array.get_u"
        return N("block", [["result", want]], [N("local.set", [loc], [al]),
                                               N("array.set", [T], [N("local.get", [loc]), N("i32.const", ["0"]),
                                                                   operand(g, g.stv(s), d)]),
                                               N(op, [T], [N("local.get", [loc]), N("i32.const", ["0"])])])
    return N("array.len", [], [al]) if want == "i32" else None


@crow("alloc-test", "i32", .8)
def _alloc_test(g, want, d):
    """ref.test / ref.eq / ref.is_null / br_on_cast over a fresh allocation"""
    if d > 3:
        return None
    r = g.r
    ss = [T for T in g.structs()]
    if not ss:
        return None
    T = r.choice(ss)
    al = _alloc(g, T, d)
    form = r.random()
    if form < .35:
        U_ = r.choice(g.structs() + ["struct", "eq", "any"])
        tt = ("ref", r.random() < .4, U_)
        return N("ref.test", [vt_str(tt)], [al])
    if form < .55:
        return N("ref.is_null", [], [al])
    if form < .75:
        loc = ref_local(g, T)
        return N("ref.eq", [], [N("local.tee", [loc], [al]), N("local.get", [loc])])
    return N("ref.eq", [], [al, _alloc(g, T, d)])


@crow("nullable-arms", "int", .8)
def _nullable_arms(g, want, d):
    """struct.get / array.len through an if or select with a null arm"""
    if want not in I or d > 3:
        return None
    r = g.r
    cands = [(T, i) for T in g.structs() for i, (s, _) in enumerate(g.tmap[T].fields) if g.stv(s) == want and s not in ("i8", "i16")]
    if not cands:
        return None
    T, i = r.choice(cands)
    rt = vt_str(("ref", True, T))
    arm = g.expr(("ref", True, T), d + 1)
    nul = N("ref.null", [T if r.random() < .5 else "none"])
    if r.random() < .5:
        a, b = nul, arm
    else:
        a, b = arm, nul
    if r.random() < .5:
        node = N("if", [["result", rt]], [g.cond(d + 1), N("then", [], [a]), N("else", [], [b])])
    else:
        node = N("select", [["result", rt]], [a, b, g.cond(d + 1)])
    return N("struct.get", [T, str(i)], [node])


# ======================================================================== globals / calls / data
def _cov_globals(m):
    return m.meta.get("cov_globals") or []


@crow("global-use", "any", 2.0)
def _global_use(g, want, d):
    gs = _cov_globals(g.m)
    if not gs or want not in ("i32", None):
        return None
    k = int(len(gs) * g.r.random() ** 3)  # a few are used a lot
    name = gs[min(k, len(gs) - 1)]
    if want is None:
        return N("global.set", [name], [N("i32.add", [], [N("global.get", [name]), g.const("i32", g.r.choice([1, 2, 3]))])])
    return N("global.get", [name])


@crow("call-once", "void", 1.0)
def _call_once(g, want, d):
    fs = g.m.meta.get("cov_once")
    if not fs:
        return None
    return N("call", [g.r.choice(fs)])


@crow("call-gtouch", "void", 3.0)
def _call_gtouch(g, want, d):
    if not _cov_globals(g.m):
        return None
    return N("call", ["$cv_gtouch"])


@crow("call-internal", "anyv", 1.6)
def _call_internal(g, want, d):
    fs = [f for f in g.m.funcs if f.meta.get("cov") and f.meta["cov"] not in ("once", "noret", "gtouch")]
    cs = []
    for c in fs:
        if len(c.results) > 1:
            continue
        if want is None or (c.results and g.ctx.sub(c.results[0], want)):
            cs.append(c)
    if not cs:
        return None
    c = g.r.choice(cs)
    kids = []
    for _, t in c.params:
        if not is_ref(t) and g.r.random() < .45:
            kids.append(g.const(t, g.r.choice([0, 1, 3, 7])))  # often the same constant at every call site
        else:
            kids.append(g.expr(t, d + 1))
    n = N("call", [c.name], kids)
    return N("drop", [], [n]) if want is None and c.results else n


@crow("call-ref-direct", "anyv", .6)
def _call_ref_direct(g, want, d):
    """call_ref of a typed ref.func (a direct call in disguise), call_indirect with a constant index"""
    if want not in (None, "i32", "i64") or not getattr(g.m, "helpers", None):
        return None
    r = g.r
    if want == "i64" or (want is None and r.random() < .3):
        ft, t, fn = "$ft1", "i64", "$th2"
    else:
        ft, t, fn = "$ft0", "i32", r.choice(["$th0", "$th1"])
    if r.random() < .6:
        # the block keeps the operand typed (ref $ft) for the mutators; passes drop it and see the bare ref.func
        rt = vt_str(("ref", False, ft))
        n = N("call_ref", [ft], [g.expr(t, d + 1), N("block", [g.newlab(), ["result", rt]],
                                                      [N("ref.cast", [rt], [N("ref.func", [fn])])])])
    else:
        n = N("call_indirect", [g.pick_table(), ["type", ft]], [g.expr(t, d + 1), N("i32.const", [str(r.choice([0, 1, 2, 3]))])])
    return N("drop", [], [n]) if want is None else n


@crow("memory.init-const", "void", .9)
def _meminit_const(g, want, d):
    segs = g.m.meta.get("cov_segs")
    if not segs or not g.m.memories:
        return None
    r = g.r
    name, n = r.choice(segs)
    k = r.randrange(len(g.m.memories))
    mname, at = g.m.memories[k][0], g.m.memories[k][1]
    if r.random() < .15:
        return N("data.drop", [name])
    ln = r.choice([0, 1, 4, 8, 16, n // 2, n])
    off = r.randint(0, max(0, n - ln))
    imms = [mname, name] if len(g.m.memories) > 1 or r.random() < .5 else [name]
    return N("memory.init", imms, [g.const(at, r.choice([0, 8, 16, 32, 64])), g.const("i32", off), g.const("i32", ln)])


# ======================================================================== module parts
def _fn(r, m, name, params, results, build, export=None):
    """a function whose body `build(g, f)` returns; uses a Gen over the module for random statements"""
    import gen
    g = gen.Gen(r, m)
    f = Func(name, params, results, [("$l0", "i32"), ("$l1", "i32"), ("$l2", "i64")], [], export)
    g.f = f
    g.fvars = f.vars()
    g.counters = set()
    g.labels = []
    g.used = {}
    f.body = build(g, f)
    f.meta["rows"] = {}  # internal functions are not part of the per-row statistics
    return f


def _text(s):
    return to_node(parse_sx(s)[0])


def _rand_stmts(g, n, d=1):
    return [g.stmt(d) for _ in range(n)]


def _ret_expr(g, t, d=1):
    return g.expr(t, d)


def setup_globals(r, m):
    n = r.randint(150, 170)
    names = []
    for i in range(n):
        name = "$cg%d" % i
        if i > 4 and r.random() < .06:
            src = r.choice([x for x in names if x[1] is False] or [None]) if names else None
            if src is not None:
                m.globals.append((name, "i32", False, "(global.get %s)" % src[0], None))
                names.append((name, False))
                continue
        mut = r.random() < .95
        m.globals.append((name, "i32", mut, "(i32.const %d)" % r.choice([0, 1, 7, -1, 100]), None))
        names.append((name, mut))
    m.meta["cov_globals"] = [n for n, mut in names if mut]
    # a function that uses every global (so that they survive remove-unused-module-elements); a module
    # that skips the exwasm snapshot anyway also runs it as its start function
    body = []
    for nm, mut in names:
        if mut:
            # a read-modify-write chain through the exported $g0, so that none of them is write-only
            body.append(_text("(global.set %s (i32.add (global.get %s) (global.get $g0)))" % (nm, nm)))
            body.append(_text("(global.set $g0 (i32.add (global.get $g0) (global.get %s)))" % nm))
        else:
            body.append(_text("(global.set $g0 (i32.add (global.get $g0) (global.get %s)))" % nm))
    f = Func("$cv_gtouch", [], [], [], body, None)
    f.meta["cov"] = "gtouch"
    m.funcs.append(f)
    if m.meta.get("wide") and r.random() < .5:
        m.elems.append("(start $cv_gtouch)")


def setup_once(r, m):
    k = r.randint(1, 3)
    names = ["$once%d" % i for i in range(k)]
    for i, nm in enumerate(names):
        flag = "$oncef%d" % i
        m.globals.append((flag, "i32", True, "(i32.const 0)", None))
        body = [_text("(if (global.get %s) (then (return)))" % flag),
                _text("(global.set %s (i32.const %d))" % (flag, r.choice([1, 1, 2, 5]))),
                _text("(global.set $g0 (i32.add (global.get $g0) (i32.const %d)))" % r.randint(1, 9))]
        if i + 1 < k and r.random() < .6:
            body.append(N("call", [names[i + 1]]))
        f = Func(nm, [], [], [], body, None)
        f.meta["cov"] = "once"
        m.funcs.append(f)
    m.meta["cov_once"] = names


def _callee_shapes(r, m):
    """(name, params, results, builder) for the internal callees"""
    shapes = []

    def early_return(g, f):  # if (c) return; rest
        p0 = f.params[0][0]
        body = [_text("(if (i32.lt_s (local.get %s) (i32.const %d)) (then (return)))" % (p0, r.choice([0, 1, 4])))]
        return body + _rand_stmts(g, r.randint(1, 3)) + [_text("(global.set $g0 (i32.add (global.get $g0) (local.get %s)))" % p0)]
    shapes.append(("early", [("$p0", "i32")], [], early_return))

    def early_if_else(g, f):  # if (c) {a} else {b} ; pattern B
        p0 = f.params[0][0]
        return [N("if", [], [N("i32.eqz", [], [N("local.get", [p0])]),
                             N("then", [], _rand_stmts(g, 2)), N("else", [], _rand_stmts(g, 2))]),
                N("if", [], [N("i32.gt_u", [], [N("local.get", [p0]), N("i32.const", ["5"])]),
                             N("then", [], _rand_stmts(g, 1))])] + _rand_stmts(g, r.randint(0, 2))
    shapes.append(("ifs", [("$p0", "i32"), ("$p1", "i64")], [], early_if_else))

    def ret_val(g, f):  # several returns with values
        p0 = f.params[0][0]
        return [_text("(if (i32.eq (local.get %s) (i32.const %d)) (then (return (i32.const %d))))" % (
                    p0, r.choice([0, 1, 2]), r.choice([0, 1, 7]))),
                _text("(if (i32.gt_s (local.get %s) (i32.const 100)) (then (return (i32.sub (local.get %s) (i32.const 1)))))" % (p0, p0))] + \
            _rand_stmts(g, r.randint(0, 2)) + [g.expr("i32", 1)]
    shapes.append(("retval", [("$p0", "i32"), ("$p1", "i32")], ["i32"], ret_val))

    def loop_body(g, f):  # counted loop with a result
        p0 = f.params[0][0]
        return [_text("(local.set $l1 (i32.and (local.get %s) (i32.const 7)))" % p0),
                _text("(block $cvb (loop $cvl (local.set $l0 (i32.add (local.get $l0) (local.get $l1))) "
                      "(br_if $cvl (local.tee $l1 (i32.sub (local.get $l1) (i32.const 1))))))"),
                _text("(i32.add (local.get $l0) (i32.const %d))" % r.choice([1, 2, 3]))]
    shapes.append(("loop", [("$p0", "i32")], ["i32"], loop_body))

    def recur(g, f):  # bounded recursion
        p0 = f.params[0][0]
        return [_text("(local.set $l1 (i32.and (local.get %s) (i32.const 3)))" % p0),
                _text("(if (i32.eqz (local.get $l1)) (then (return (i32.const 1))))"),
                _text("(i32.add (local.get $l1) (call %s (i32.sub (local.get $l1) (i32.const 1))))" % f.name)]
    shapes.append(("recur", [("$p0", "i32")], ["i32"], recur))

    def switch_body(g, f):
        p0 = f.params[0][0]
        return [_text("(block $c (block $b (block $a (br_table $a $b $c $a (i32.and (local.get %s) (i32.const 3)))) "
                      "(global.set $g0 (i32.add (global.get $g0) (i32.const 1))) (return (i32.const 10))) "
                      "(return (i32.const 20)))" % p0), g.expr("i32", 1)]
    shapes.append(("switch", [("$p0", "i32")], ["i32"], switch_body))

    def unused_param(g, f):  # parameters that are unused / always the same
        return _rand_stmts(g, 1) + [_text("(i32.add (local.get $p0) (i32.const %d))" % r.choice([1, 2]))]
    shapes.append(("unusedp", [("$p0", "i32"), ("$p1", "i64"), ("$p2", "i32")], ["i32"], unused_param))

    def tiny(g, f):
        return [_text("(i32.add (local.get $p0) (i32.const %d))" % r.choice([1, 2, 5]))]
    shapes.append(("tiny", [("$p0", "i32")], ["i32"], tiny))

    def noret(g, f):
        return [_text("(global.set $g0 (i32.add (global.get $g0) (local.get $p0)))")] + _rand_stmts(g, r.randint(0, 1)) + \
            [N("unreachable")]
    if m.meta.get("focus") == "cov" or m.meta.get("wide"):
        # other rows may call it without a guard (the function then traps at once), so only some modules get one
        shapes.append(("noret", [("$p0", "i32")], r.choice([[], ["i32"]]), noret))

    structs = [t for t in m.types if t.kind == "struct" and not t.name.startswith("$a2s_")]
    if structs:
        sup = r.choice(structs)
        ip = [i for i, (s, _) in enumerate(sup.fields) if s == "i32"]

        def ref_param(g, f):
            if ip:
                return [N("if", [], [N("ref.is_null", [], [N("local.get", [f.params[0][0]])]),
                                     N("then", [], [N("return", [], [N("i32.const", ["0"])])])]),
                        N("struct.get", [sup.name, str(r.choice(ip))], [N("local.get", [f.params[0][0]])])]
            return [N("drop", [], [N("local.get", [f.params[0][0]])]), N("i32.const", ["3"])]
        shapes.append(("refp", [("$p0", ("ref", True, sup.name))], ["i32"], ref_param))
    return shapes


def setup_callees(r, m):
    shapes = _callee_shapes(r, m)
    for name, ps, rs, build in r.sample(shapes, r.randint(2, min(5, len(shapes)))):
        for k in range(r.choice([1, 1, 2])):
            fname = "$cv_%s%d" % (name, k)
            f = _fn(r, m, fname, ps, rs, lambda g, f_, b=build: b(g, f_))
            f.meta["cov"] = name
            m.funcs.append(f)
    # a callee that tail calls another one (inlining of return_call) in modules that allow it
    if "tail" in table.features_for(m) and any(f.meta.get("cov") == "tiny" for f in m.funcs):
        tgt = [f for f in m.funcs if f.meta.get("cov") == "tiny"][0]
        f = Func("$cv_tc", [("$p0", "i32")], ["i32"], [], [
            N("if", [], [N("i32.eqz", [], [N("local.get", ["$p0"])]), N("then", [], [N("return", [], [N("i32.const", ["1"])])])]),
            N("return_call", [tgt.name], [N("i32.add", [], [N("local.get", ["$p0"]), N("i32.const", ["1"])])])], None)
        f.meta["cov"] = "tc"
        m.funcs.append(f)


def setup_similar(r, m):
    k = r.randint(2, 4)

    def build(g, f):
        return _rand_stmts(g, r.randint(2, 4)) + [g.expr("i32", 1)]
    base = _fn(r, m, "$cv_sim0", [("$p0", "i32"), ("$p1", "i64")], ["i32"], build)
    base.meta["cov"] = "sim"
    m.funcs.append(base)
    sigs = {f.name: ([t for _, t in f.params], f.results) for f in m.funcs}
    callees = [f.name for f in m.funcs if not f.export and f.name != base.name]
    for i in range(1, k):
        c = Func("$cv_sim%d" % i, list(base.params), list(base.results), list(base.locals), [b.clone() for b in base.body], None)
        for b in c.body:
            for x in b.walk():
                if x.op in ("i32.const", "i64.const") and r.random() < .4:
                    t = x.op[:3]
                    x.imms = [str(table.wrap(int(x.imms[0]) + r.choice([1, 2, -1, 16]), t))]
                elif x.op == "call" and r.random() < .5 and x.imms[0] in sigs:
                    same = [n for n in callees if sigs[n] == sigs[x.imms[0]]]
                    if same:
                        x.imms = [r.choice(same)]
        c.meta["cov"] = "sim"
        m.funcs.append(c)


def setup_data(r, m):
    if not m.memories:
        return
    segs = []

    def esc(bs):
        return "".join("\\%02x" % b for b in bs)
    shapes = [[0] * r.randint(8, 40) + [1, 2, 3, 4],
              [5, 6, 7, 8] + [0] * r.randint(6, 30),
              [9, 9] + [0] * r.randint(8, 30) + [7, 7, 7],
              [0] * r.randint(10, 40),
              [1, 2, 3] + [0] * r.randint(3, 12) + [4, 5] + [0] * r.randint(3, 12) + [6]]
    for i in range(r.randint(2, 4)):
        bs = list(r.choice(shapes))
        name = "$cd%d" % i
        m.datas.append('(data %s "%s")' % (name, esc(bs)))
        m.data_names.append(name)
        segs.append((name, len(bs)))
    m.meta["cov_segs"] = segs
    mem0 = m.memories[0]
    if mem0[2] >= 1 and r.random() < .6:
        at = mem0[1]
        off = r.choice([0, 16, 32])
        m.datas.append('(data (memory %s) (%s.const %d) "%s")' % (mem0[0], at, off, esc(r.choice(shapes))))
        if r.random() < .6:
            # an overlapping segment
            m.datas.append('(data (memory %s) (%s.const %d) "%s")' % (mem0[0], at, off + r.choice([4, 8, 12]), esc(r.choice(shapes))))


# ---------------------------------------------------------------- a small typed world
# Types named $a2s_* are skipped by the other rows (they are the pre-declared array-to-struct types), so
# the rows below own these: a supertype with two subtypes, an allocated subtype of a never-allocated
# supertype, immutable globals initialised with struct.new of constants, one mutable global, and
# internal functions that take / return the supertype but only see subtypes.
TA, TB, TC, TD, TX = "$a2s_cvA", "$a2s_cvB", "$a2s_cvC", "$a2s_cvD", "$a2s_cvX"


def _tfields(T):
    a = [("i32", False), ("i32", True), ("i64", False), (("ref", True, TA), True)]
    return {TA: a, TB: a + [("i32", False)], TC: a + [("i64", True)], TX: [("i32", False)],
            TD: [("i32", False), ("i32", True)]}[T]


def _tconst(g, T, i, d):
    """constant for field i of T: mostly one of two module-wide values, so all allocations agree"""
    kc = g.m.meta["cov_k"]
    s = _tfields(T)[i][0]
    if s == "i32" or s == "i64":
        if g.r.random() < .8:
            return N(s + ".const", [str(g.r.choice(kc[(s, i)]))])
        return operand(g, s, d)
    return None


def _talloc(g, T, d, ref_arg=None):
    kids = []
    for i, (s, _) in enumerate(_tfields(T)):
        c = _tconst(g, T, i, d)
        if c is None:
            c = ref_arg if ref_arg is not None else N("ref.null", [TA])
        kids.append(c)
    return N("struct.new", [T], kids)


def setup_typed(r, m):
    if "gc" not in table.features_for(m):
        return
    m.types += [TypeDef(TA, "struct", _tfields(TA), None, False), TypeDef(TB, "struct", _tfields(TB), TA, False),
                TypeDef(TC, "struct", _tfields(TC), TA, r.random() < .5), TypeDef(TX, "struct", _tfields(TX), None, False),
                TypeDef(TD, "struct", _tfields(TD), TX, r.random() < .5)]
    m.meta["cov_k"] = {(s, i): [r.choice([0, 1, 7, 100, -1]) for _ in range(r.randint(1, 2))]
                       for s in ("i32", "i64") for i in range(6)}
    m.meta["cov_typed"] = True

    class _G:  # a minimal stand-in so the allocators can be reused at module level
        pass
    gg = _G()
    gg.m, gg.r = m, r
    gg.vars_sub = lambda t: []
    gg.expr = lambda t, d=0: N(t + ".const", ["1"])
    gg.const = lambda t, v=None: N(t + ".const", [str(v if v is not None else r.choice([0, 1, 5]))])
    names = []
    for k, T in enumerate([TA, TB, TC, TD, TB]):
        src = _talloc(gg, T, 0)
        if T == TA:
            src.kids[3] = N("ref.null", [TA])
        nm = "$cvg%d" % k
        m.globals.append((nm, ("ref", False, T), False, "(%s)" % src.text(-1)[1:-1], None))
        names.append((nm, T))
    m.globals.append(("$cvm", ("ref", True, TA), True, "(ref.null %s)" % TA, None))
    m.meta["cov_tglobals"] = names
    # an immutable global whose initializer refers to another global (read back through field 3)
    nested = _talloc(gg, TB, 0, ref_arg=N("global.get", ["$cvg0"]))
    m.globals.append(("$cvgn", ("ref", False, TB), False, "(%s)" % nested.text(-1)[1:-1], None))

    def mk(g, f):
        return [N("struct.new", [TB], [_tconst(g, TB, i, 0) or N("ref.null", [TA]) for i in range(5)])]
    f = _fn(r, m, "$cv_mkB", [], [("ref", True, TA)], mk)
    f.meta["cov"] = "typed"
    m.funcs.append(f)

    def use(g, f):
        return [N("struct.get", [TA, "0"], [N("local.get", ["$p0"])])]
    f = _fn(r, m, "$cv_useA", [("$p0", ("ref", True, TA))], ["i32"], use)
    f.meta["cov"] = "typed"
    m.funcs.append(f)

    def setf(g, f):
        return [N("struct.set", [TA, "1"], [N("local.get", ["$p0"]), N("local.get", ["$p1"])]),
                N("global.set", ["$cvm"], [N("local.get", ["$p0"])])]
    f = _fn(r, m, "$cv_setA", [("$p0", ("ref", True, TA)), ("$p1", "i32")], [], setf)
    f.meta["cov"] = "typed"
    m.funcs.append(f)


def _tsrc(g, d, want_T=None):
    """(expression of a reference to a cov type, its static type name)"""
    r = g.r
    gl = g.m.meta["cov_tglobals"]
    x = r.random()
    if x < .4:
        nm, T = r.choice(gl)
        return N("global.get", [nm]), T
    if x < .65:
        T = r.choice([TA, TB, TC, TD, TX][1:4] + [TD])
        return _talloc(g, T, d, ref_arg=N("global.get", ["$cvg0"]) if r.random() < .4 else None), T
    if x < .8:
        return N("call", ["$cv_mkB"]), TA
    if x < .85:
        return N("ref.as_non_null", [], [N("global.get", ["$cvm"])]), TA
    if x < .92:
        # the reference stored in field 3 of a global (a nested global initializer)
        return N("struct.get", [TB, "3"], [N("global.get", ["$cvgn"])]), TA
    nm, T = r.choice(gl)
    return N("select", [["result", vt_str(("ref", False, TA))]],
             [N("global.get", [r.choice(gl)[0]]), N("global.get", [nm]), g.cond(d + 1)]) if False else \
        N("ref.cast", [vt_str(("ref", False, T))], [N("global.get", [nm])]), T


def _typed(fn):
    def wrapper(g, want, d):
        if not g.m.meta.get("cov_typed"):
            return None
        return fn(g, want, d)
    return wrapper


@crow("typed-get", "int", 1.6)
@_typed
def _typed_get(g, want, d):
    r = g.r
    src, T = _tsrc(g, d)
    ops = [(i, s) for i, (s, _) in enumerate(_tfields(T)) if s == want]
    if not ops:
        return None
    i, s = r.choice(ops)
    form = r.random()
    if form < .2:
        # two candidate values of the same type: a select / if between globals
        gl = [nm for nm, t in g.m.meta["cov_tglobals"] if t == T or (T == TA and t in (TB, TC))]
        if len(gl) >= 2:
            a, b = r.sample(gl, 2)
            node = N("select", [["result", vt_str(("ref", False, T))]], [N("global.get", [a]), N("global.get", [b]), g.cond(d + 1)]) \
                if r.random() < .5 else N("if", [["result", vt_str(("ref", False, T))]], [
                    g.cond(d + 1), N("then", [], [N("global.get", [a])]), N("else", [], [N("global.get", [b])])])
            return N("struct.get", [T, str(i)], [node])
    if form < .35 and T in (TB, TC):
        # read through the supertype
        return N("struct.get", [TA, str(i)], [src]) if i < 4 else N("struct.get", [T, str(i)], [src])
    return N("struct.get", [T, str(i)], [src])


@crow("typed-set", "void", 1.0)
@_typed
def _typed_set(g, want, d):
    r = g.r
    src, T = _tsrc(g, d)
    ops = [(i, s) for i, (s, mut) in enumerate(_tfields(T)) if mut and s in I]
    form = r.random()
    if form < .3:
        return N("global.set", ["$cvm"], [src if T in (TA, TB, TC) else N("ref.null", [TA])])
    if not ops:
        return None
    i, s = r.choice(ops)
    return N("struct.set", [T, str(i)], [src, operand(g, s, d) if r.random() < .5 else N(s + ".const", [str(r.choice(g.m.meta["cov_k"][(s, i)]))])])


@crow("typed-call", "anyv", 1.0)
@_typed
def _typed_call(g, want, d):
    if want not in (None, "i32"):
        return None
    r = g.r
    if want == "i32":
        # only ever called with the subtype B: the parameter type can be refined
        gl = [nm for nm, t in g.m.meta["cov_tglobals"] if t == TB]
        src = N("global.get", [r.choice(gl)]) if gl and r.random() < .5 else _talloc(g, TB, d)
        return N("call", ["$cv_useA"], [src])
    src, T = _tsrc(g, d)
    if T not in (TA, TB, TC):
        return None
    return N("call", ["$cv_setA"], [src, operand(g, "i32", d)])


@crow("typed-test", "i32", .9)
@_typed
def _typed_test(g, want, d):
    r = g.r
    src, T = _tsrc(g, d)
    form = r.random()
    tgt = r.choice([TA, TB, TC, TD, TX, "struct", "eq"])
    if form < .5:
        return N("ref.test", [vt_str(("ref", r.random() < .5, tgt))], [src])
    if form < .75:
        return N("ref.eq", [], [src, _tsrc(g, d)[0]])
    lab = g.newlab()
    return N("block", [lab, ["result", "i32"]], [
        N("drop", [], [N("br_on_cast", [lab, vt_str(("ref", True, TA)), vt_str(("ref", True, TB))], [src])]) if False else
        N("drop", [], [src]), g.const("i32", r.choice([0, 1]))])


def setup_callref(r, m):
    """function types without parameters / with two, helpers of those types, and a typed function table"""
    if not getattr(m, "helpers", None):
        return
    m.ftypes += [("$cft2", [], ["i32"]), ("$cft3", ["i32", "i32"], ["i32"])]
    m.funcs.append(Func("$cvh0", [], ["i32"], [], [N("global.get", ["$g0"])], None))
    m.funcs.append(Func("$cvh1", [("$p0", "i32"), ("$p1", "i32")], ["i32"], [], [
        N("i32.add", [], [N("local.get", ["$p0"]), N("local.get", ["$p1"])])], None))
    m.funcs.append(Func("$cvh2", [("$p0", "i32"), ("$p1", "i32")], ["i32"], [], [
        N("i32.sub", [], [N("local.get", ["$p0"]), N("local.get", ["$p1"])])], None))
    for f in m.funcs[-3:]:
        f.meta["cov"] = "once"  # callable only through the references below
    m.elems.append("(elem declare func $cvh0 $cvh1 $cvh2)")
    m.elems.append("(table $cvt 4 4 (ref null $cft3) (ref.func $cvh1))")
    m.elems.append("(elem (table $cvt) (i32.const 1) (ref null $cft3) (item (ref.func $cvh2)) (item (ref.func $cvh1)))")
    m.meta.setdefault("ttypes", {})["$cvt"] = ("ref", True, "$cft3")
    m.meta["cov_callref"] = True


@crow("call-ref-fall", "anyv", 1.4)
def _call_ref_fall(g, want, d):
    """call_ref whose target is a ref.func seen through a block / cast / select / if, or a typed table.get"""
    if not g.m.meta.get("cov_callref") or want not in (None, "i32"):
        return None
    r = g.r
    if r.random() < .3:
        ft, args, fns = "$cft2", [], ["$cvh0"]
    else:
        ft, args, fns = "$cft3", [g.expr("i32", d + 1), g.expr("i32", d + 1)], ["$cvh1", "$cvh2"]
    rt = vt_str(("ref", False, ft))
    f1 = N("ref.func", [r.choice(fns)])
    # a cast to the exact type keeps the operand typed for the mutators; passes remove it and see the bare ref.func
    form = r.random()
    if form < .4:
        tgt = N("block", [g.newlab(), ["result", rt]], [N("ref.cast", [rt], [f1])])
    elif form < .5:
        tgt = N("ref.cast", [rt], [f1])
    elif form < .6:
        tgt = N("ref.as_non_null", [], [N("ref.cast", [vt_str(("ref", True, ft))], [f1])])
    elif form < .8 and ft == "$cft3":
        tgt = N("select", [["result", rt]], [N("ref.cast", [rt], [N("ref.func", [fns[0]])]),
                                             N("ref.cast", [rt], [N("ref.func", [fns[1]])]), g.cond(d + 1)])
    elif form < .9 and ft == "$cft3":
        tgt = N("if", [["result", rt]], [g.cond(d + 1), N("then", [], [N("ref.cast", [rt], [N("ref.func", [fns[0]])])]),
                                         N("else", [], [N("ref.cast", [rt], [N("ref.func", [fns[1]])])])])
    elif ft == "$cft3":
        tgt = N("ref.as_non_null", [], [N("table.get", ["$cvt"], [N("i32.const", [str(r.choice([0, 1, 2, 3]))])])])
        if r.random() < .5:
            tgt = N("table.get", ["$cvt"], [N("i32.const", [str(r.choice([0, 1, 2, 3]))])])
    else:
        tgt = N("block", [g.newlab(), ["result", rt]], [N("ref.cast", [rt], [f1])])
    n = N("call_ref", [ft], args + [tgt])
    return N("drop", [], [n]) if want is None else n


@crow("ref-tee", "void", .6)
def _ref_tee(g, want, d):
    """local.tee / local.set of a ref.as_non_null value (the null check can move past the tee)"""
    structs = g.structs()
    if not structs:
        return None
    T = g.r.choice(structs)
    loc = ref_local(g, T)
    v = N("ref.as_non_null", [], [g.expr(("ref", True, T), d + 1)])
    if g.r.random() < .6:
        return N("drop", [], [N("local.tee", [loc], [v])])
    return N("local.set", [loc], [v])


PARTS = [("globals", setup_globals, .08), ("once", setup_once, .2), ("callees", setup_callees, .35),
         ("similar", setup_similar, .15), ("data", setup_data, .25), ("typed", setup_typed, .3), ("callref", setup_callref, .25)]


def setup_cov(r, m):
    """module parts of the cov family; `r` is the module's generator"""
    if "cov" not in table.features_for(m):
        return
    focus = m.meta.get("focus") == "cov"
    # a separate generator keeps the module's other random choices independent of these parts
    r2 = random.Random(r.random())
    for name, fn, p in PARTS:
        if r2.random() < (min(1.0, p * 3) if focus else p):
            try:
                fn(r2, m)
            except Unsupported:
                pass


SETUPS.append(setup_cov)
