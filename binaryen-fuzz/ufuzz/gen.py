"""Type-directed generator over the instruction table in table.py.

gen_module(seed, weights) -> Module.  Each function records the table rows
it used in `f.meta["rows"]`.
"""
import random

import table
from table import ROWS, B32, B64, wrap
from wmod import N, Module, Func, TypeDef, TypeCtx, is_ref, vt_str

MAXD = 4


def rand_hierarchy(r):
    """A few struct types (a random subtype forest) and arrays, all
    singleton rec groups; reference fields are nullable."""
    types = []
    nstruct = r.randint(2, 5)
    for i in range(nstruct):
        name = "$S%d" % i
        parents = [t for t in types if t.kind == "struct"]
        sup = r.choice(parents) if parents and r.random() < .6 else None
        fields = list(sup.fields) if sup else []
        for _ in range(r.randint(0 if sup else 1, 2)):
            x = r.random()
            if x < .4:
                st = "i32"
            elif x < .55:
                st = "i64"
            elif x < .7:
                st = "i8"
            elif x < .8:
                st = "i16"
            else:
                tgt = r.choice([t.name for t in types] + ["eq"]) if types else "eq"
                st = ("ref", True, tgt)
            fields.append((st, r.random() < .85))
        types.append(TypeDef(name, "struct", fields, sup.name if sup else None, final=False))
    for i in range(r.randint(1, 2)):
        x = r.random()
        st = "i32" if x < .4 else "i8" if x < .6 else "i16" if x < .7 else "i64" if x < .8 else \
            ("ref", True, r.choice([t.name for t in types if t.kind == "struct"]))
        types.append(TypeDef("$A%d" % i, "array", [(st, r.random() < .85)], None, final=True))
    has_child = {t.sup for t in types if t.sup}
    for t in types:
        if t.kind == "struct" and t.name not in has_child:
            t.final = r.random() < .5
    return types


def a2s_types(types):
    """Heap2Local turns constant-length arrays into structs; exwasm maps
    output types to input ones by structure, so declare them up front."""
    out = []
    seen = set()
    for t in types:
        if t.kind != "array":
            continue
        for n in range(0, 5):
            key = (tuple(t.fields) * n)
            if key in seen:
                continue
            seen.add(key)
            out.append(TypeDef("$a2s_%s_%d" % (t.name[1:], n), "struct", [t.fields[0]] * n, None, True))
    return out


IMPORTS = [("$h", "env", "h", ["i32"], ["i32"]), ("$k", "env", "k", ["i64", "i32"], ["i64"]),
           ("$v", "env", "v", ["i32"], [])]


class Gen:
    def __init__(self, r, m, weights=None):
        self.r = r
        self.m = m
        self.weights = weights or {}
        self.ctx = TypeCtx(m)
        self.tmap = self.ctx.tmap
        self.a2s = {t.name for t in m.types if t.name.startswith("$a2s_")}
        self.nlab = 0
        self.used = {}
        self.features_on = table.FEATURES_ON
        self.rows = [rw for rw in ROWS if rw.feat in self.features_on]

    # ------------------------------------------------ type helpers
    def stv(self, s):
        return "i32" if s in ("i8", "i16") else s

    def structs(self):
        return [T for T, td in self.tmap.items() if td.kind == "struct" and T not in self.a2s]

    def arrays(self):
        return [T for T, td in self.tmap.items() if td.kind == "array"]

    def concrete_sub(self, want, kind):
        if want is None or not is_ref(want):
            return []
        return [T for T, td in self.tmap.items() if td.kind == kind and T not in self.a2s
                and self.ctx.heap_sub(T, want[2])]

    def heaps_sub(self, h):
        cands = self.structs() + self.arrays() + ["struct", "array", "i31", "eq"]
        return [x for x in cands if self.ctx.heap_sub(x, h)]

    def up(self, h):
        chain = [h]
        while True:
            s = self.ctx.heap_sup(chain[-1])
            if s is None:
                break
            chain.append(s)
        return self.r.choice(chain[:4])

    def defaultable_st(self, s):
        return not (is_ref(s) and not s[1])

    def defaultable(self, td):
        return all(self.defaultable_st(s) for s, _ in td.fields)

    def any_ref(self):
        return ("ref", True, self.r.choice(self.structs() + self.arrays() + ["eq", "i31", "struct"]))

    def cast_target(self):
        h = self.r.choice(self.structs() + self.arrays() + ["i31", "struct", "array", "eq"])
        return ("ref", self.r.random() < .4, h)

    def value_types(self):
        ts = list(table.VALTYPES_ON)
        if "gc" in self.features_on:
            ts.append(self.any_ref())
        return ts

    # ------------------------------------------------ vars and labels
    def allvars(self):
        return [n for n, _ in self.f.params + self.f.locals]

    def vtype(self, v):
        return self.fvars[v]

    def vars_sub(self, want):
        return [n for n, t in self.f.params + self.f.locals
                if n not in self.counters and self.ctx.sub(t, want)]

    def vars_exact(self, want):
        return [n for n, t in self.f.params + self.f.locals if t == want]

    def newlab(self):
        self.nlab += 1
        return "$L%d" % self.nlab

    def new_counter(self):
        n = "$cnt%d" % len(self.counters)
        self.counters.add(n)
        self.f.locals.append((n, "i32"))
        self.fvars[n] = "i32"
        return n

    def pick_table(self):
        return self.r.choice(self.m.tables)[0]

    def pick_mem(self):
        if not self.m.memories:
            return None
        return self.r.randrange(len(self.m.memories))

    # ------------------------------------------------ leaves
    FLOATS = ["0", "-0", "1", "-1", "0.5", "1.5", "2", "-2.5", "3", "inf", "-inf", "nan", "-nan", "nan:0x200001",
              "nan:0x1", "0x1p-149", "0x1p-1074", "0x1.fffffep+127", "1e10", "4294967296", "2147483648", "-2147483649",
              "9223372036854775808", "0.1"]

    def const(self, t, v=None):
        if t in ("f32", "f64"):
            x = self.r.random()
            if x < .8 or v is not None:
                txt = self.FLOATS[self.r.randrange(len(self.FLOATS))] if v is None else str(v)
            else:
                txt = "%r" % (self.r.uniform(-1e3, 1e3),)
            return N(t + ".const", [txt])
        if v is None:
            if self.r.random() < .85:
                v = self.r.choice(B32 if t == "i32" else B64)
            else:
                v = self.r.randrange(-40, 300)
        return N(t + ".const", [str(wrap(v, t))])

    def addr(self, at, d):
        x = self.r.random()
        if x < .35:
            return self.const(at, self.r.choice([0, 1, 4, 8, 0xfff0, 0xfffc, 0xffff, 0x10000, -1, -4]))
        if x < .65:
            vs = self.vars_sub(at)
            if vs:
                return N("local.get", [self.r.choice(vs)])
        return self.expr(at, d + 1)

    def index(self, d):
        if self.r.random() < .6:
            return N("i32.const", [str(self.r.choice([0, 0, 1, 1, 2, 3, 4, -1]))])
        return self.expr("i32", d + 1)

    def cond(self, d):
        r = self.r
        x = r.random()
        if x < .25:
            t = r.choice(["i32", "i64"])
            return N("%s.%s" % (t, r.choice(["eq", "ne", "lt_s", "lt_u", "gt_u", "ge_s", "le_u"])), [],
                     [self.leafish(t, d), self.const(t) if r.random() < .6 else self.leafish(t, d)])
        if x < .35:
            return N("i32.eqz", [], [self.expr("i32", d + 1)])
        return self.expr("i32", d)

    def leafish(self, t, d):
        vs = self.vars_sub(t)
        if vs and self.r.random() < .6:
            return N("local.get", [self.r.choice(vs)])
        return self.expr(t, d + 1)

    def leaf(self, want):
        r = self.r
        if want is None:
            return N("nop")
        if not is_ref(want):
            vs = self.vars_sub(want)
            if vs and r.random() < .5:
                return N("local.get", [r.choice(vs)])
            return self.const(want)
        vs = self.vars_sub(want)
        if vs and (r.random() < .6 or not want[1]):
            return N("local.get", [r.choice(vs)])
        if want[1] and r.random() < .5:
            h = want[2]
            return N("ref.null", [h if h.startswith("$") else "none"])
        cs = self.concrete_sub(want, "struct")
        if cs:
            T = r.choice(cs)
            td = self.tmap[T]
            if self.defaultable(td):
                return N("struct.new_default", [T])
            return N("struct.new", [T], [self.leaf(self.stv(s)) for s, _ in td.fields])
        cs = self.concrete_sub(want, "array")
        if cs:
            return N("array.new_fixed", [r.choice(cs), "0"])
        if self.ctx.heap_sub("i31", want[2]):
            return N("ref.i31", [], [self.const("i32")])
        if want[1]:
            return N("ref.null", ["none"])
        raise ValueError("no leaf for " + vt_str(want))

    def ref_operand(self, T, d):
        """operand of struct.get/set / array.get/set of type T"""
        r = self.r
        want = ("ref", True, T)
        x = r.random()
        if x < .5:
            vs = self.vars_sub(want)
            if vs:
                return N("local.get", [r.choice(vs)])
        if x < .7 and "cast" in self.features_on:
            src = self.up(T)
            return N("ref.cast", [vt_str(("ref", r.random() < .5, T))], [self.expr(("ref", True, src), d + 1)])
        return self.expr(want, d)

    def use_ref(self, inner, t, want, d):
        """an expression of type `want` (i32/i64) consuming `inner` : t"""
        r = self.r
        h = t[2]
        if h in self.tmap and self.tmap[h].kind == "struct" and self.tmap[h].fields and r.random() < .6:
            opts = [(i, s) for i, (s, _) in enumerate(self.tmap[h].fields) if self.stv(s) == want]
            if opts:
                i, s = r.choice(opts)
                op = "struct.get" if s not in ("i8", "i16") else "struct.get_u"
                return N(op, [h, str(i)], [inner])
        e = N(r.choice(["ref.is_null", "ref.test"]), [], [inner])
        if e.op == "ref.test":
            e.imms = [vt_str(self.cast_target())]
            tt = e.imms[0]
            # ref.test's operand must share the hierarchy: always true here
            del tt
        if want == "i64":
            return N("i64.extend_i32_u", [], [e])
        if want in ("f32", "f64"):
            return N(want + ".convert_i32_s", [], [e])
        return e

    # ------------------------------------------------ expressions
    def pick_row(self, want):
        if want is None:
            kind_ok = ("void", "anyv")
        elif is_ref(want):
            kind_ok = ("ref", "any", "anyv")
        elif want == "i32":
            kind_ok = ("i32", "int", "any", "anyv")
        elif want in ("f32", "f64"):
            # "int" rows make integers; only the loads take the wanted type
            kind_ok = ("any", "anyv")
        else:
            kind_ok = ("int", "any", "anyv")
        cands = [rw for rw in self.rows if rw.out in kind_ok or rw.out == want or
                 (want in ("f32", "f64") and rw.name == "load")]
        ws = [rw.weight * self.weights.get(rw.name, 1.0) for rw in cands]
        return cands, ws

    def expr(self, want, d=0):
        r = self.r
        if want is not None and (d >= MAXD or r.random() < .12 + .08 * d):
            return self.leaf(want)
        if want is None and d >= MAXD:
            return self.leaf(None)
        cands, ws = self.pick_row(want)
        for _ in range(8):
            rw = r.choices(cands, ws)[0]
            if rw.name == "ref.test" and not self.ok_test():
                continue
            n = rw.gen(self, want, d)
            if n is not None:
                self.used[rw.name] = self.used.get(rw.name, 0) + 1
                return n
        return self.leaf(want)

    def ok_test(self):
        return True

    def stmt(self, d=0):
        return self.expr(None, d)

    def body(self, want, d):
        r = self.r
        stmts = [self.stmt(d + 1) for _ in range(r.randint(0, 2 if d < 2 else 1))]
        if want is not None:
            stmts.append(self.expr(want, d + 1))
        return stmts

    # ------------------------------------------------ functions
    def gen_func(self, idx):
        r = self.r
        params = []
        for i in range(r.randint(1, 3)):
            params.append(("$p%d" % i, r.choice(["i32", "i32", "i64"] + (["f32", "f64"] if "float" in self.features_on else []))))
        nref = r.choice([0, 1, 1, 2, 2]) if "gc" in self.features_on else 0
        for i in range(nref):
            params.append(("$r%d" % i, self.any_ref()))
        locals_ = [("$l0", "i32"), ("$l1", "i32"), ("$l2", "i64")]
        if "float" in self.features_on:
            locals_ += [("$l3", "f32"), ("$l4", "f64")]
        if "gc" in self.features_on:
            for i in range(r.randint(1, 3)):
                locals_.append(("$q%d" % i, self.any_ref()))
        res = r.choice(["i32", "i32", "i64", None, "ref"] + (["f32", "f64"] if "float" in self.features_on else []))
        if res == "ref":
            res = self.any_ref() if "gc" in self.features_on else "i32"
        self.f = Func("$f%d" % idx, params, [res] if res else [], locals_, [], "f%d" % idx)
        self.fvars = self.f.vars()
        self.counters = set()
        self.labels = []
        self.used = {}
        body = [self.stmt(0) for _ in range(r.randint(2, 7))]
        if res:
            body.append(self.expr(res, 0))
        self.f.body = body
        self.f.meta["rows"] = dict(self.used)
        return self.f


def base_module(r, gc=True):
    m = Module()
    if gc:
        hier = rand_hierarchy(r)
        m.types = hier + a2s_types(hier)
    x = r.random()
    at0 = "i64" if x < .3 else "i32"
    m.memories.append(("$m0", at0, r.choice([0, 1, 1, 2]), r.choice([None, None, 4, 65536 if at0 == "i32" else 70000])))
    if r.random() < .5:
        at1 = r.choice(["i32", "i64"])
        m.memories.append(("$m1", at1, r.choice([0, 1]), r.choice([None, 3])))
    m.globals = [("$g0", "i32", True, "(i32.const 0)", "g0"), ("$g1", "i64", True, "(i64.const 0)", "g1"),
                 ("$g2", "i32", False, "(i32.const %d)" % r.choice([0, 1, 7, -1, 0xff]), None)]
    if r.random() < .4:
        m.globals.append(("$g3", "i32", True, "(i32.const 5)", None))
    m.imports = list(IMPORTS)
    add_table_parts(r, m)
    return m


def add_table_parts(r, m):
    """function types, helper functions, tables, segments and tags for the
    table / data / exception rows"""
    m.ftypes = [("$ft0", ["i32"], ["i32"]), ("$ft1", ["i64"], ["i64"])]
    m.helpers = ["$th0", "$th1", "$th2"]
    k = r.choice([1, 3, 7, -1])
    m.funcs.append(Func("$th0", [("$p0", "i32")], ["i32"], [], [N("i32.add", [], [N("local.get", ["$p0"]), N("i32.const", [str(k)])])], "th0"))
    m.funcs.append(Func("$th1", [("$p0", "i32")], ["i32"], [], [N("i32.mul", [], [N("local.get", ["$p0"]), N("local.get", ["$p0"])])], "th1"))
    m.funcs.append(Func("$th2", [("$p0", "i64")], ["i64"], [], [N("i64.xor", [], [N("local.get", ["$p0"]), N("i64.const", ["255"])])], "th2"))
    m.tables = [("$t0", 8), ("$t1", 4)]
    m.tags = [("$e0", ["i32"]), ("$e1", [])]
    m.elems = ["(elem (table $t0) (i32.const 0) func $th0 $th1 $th2 $th0)", "(elem $e1 func $th1 $th0 $th0)"]
    m.elem_names = ["$e1"]
    m.datas = ['(data $d0 "\\01\\02\\03\\04\\05\\06\\07\\08")', '(data $d1 "wasm")']
    m.data_names = ["$d0", "$d1"]


def gen_module(seed, weights=None, nfuncs=None):
    r = random.Random(seed)
    m = base_module(r)
    g = Gen(r, m, weights)
    for i in range(nfuncs or r.randint(2, 4)):
        m.funcs.append(g.gen_func(i))
    return m


if __name__ == "__main__":
    import sys
    print(gen_module(int(sys.argv[1])).text())
