"""Type-preserving mutators over the ufuzz AST.

mutate(r, m, pool, n, weights) applies n mutators to random functions of
module m and returns the names of the mutators that applied.  Every
mutator works on typed nodes (`Typer` sets `N.t`) and only replaces an
expression by one of the same type, or inserts statements where the
enclosing list allows it.
"""
import re

from gen import Gen
from table import B32, B64, wrap
from wmod import (N, TypeCtx, Typer, Unsupported, free_labels, is_int, is_ref, parse_sx,
                  to_node, vt_str, TypeDef, parse_vt, LOADS, STORES)


def slots(func):
    """(container, index, node, parent) for every instruction"""
    out = []

    def go(lst, parent):
        for i, n in enumerate(lst):
            out.append((lst, i, n, parent))
            go(n.kids, n)
    go(func.body, None)
    return out


def stmt_lists(func):
    """statement lists and the positions where a void statement may be
    inserted (before the value if the list produces one)"""
    out = [(func.body, bool(func.results))]

    def go(n):
        if n.op in ("block", "loop"):
            has_res = any(isinstance(i, list) and i[0] == "result" for i in n.imms)
            out.append((n.kids, has_res))
        elif n.op in ("then", "else"):
            out.append((n.kids, None))  # decided by the parent `if`
        for k in n.kids:
            go(k)
    for b in func.body:
        go(b)
    fixed = []
    for lst, hr in out:
        if hr is None:
            hr = bool(lst) and lst[-1].t is not None and lst[-1].t != "unr"
        fixed.append((lst, hr))
    return fixed


def type_func(m, f):
    ctx = TypeCtx(m)
    Typer(ctx, f).run()
    return ctx


class Mut:
    def __init__(self, r, m, pool, weights=None):
        self.r = r
        self.m = m
        self.pool = pool or []
        self.weights = weights or {}
        self.nsplice = 0

    def gen_for(self, f):
        g = Gen(self.r, self.m)
        g.f = f
        g.fvars = f.vars()
        g.counters = {n for n, _ in f.locals if n.startswith("$cnt")}
        g.labels = []
        g.used = {}
        return g

    # ------------------------------------------------ helpers
    def value_slots(self, f, pred=None, closed=False):
        out = []
        for lst, i, n, parent in slots(f):
            t = n.t
            if t is None or t == "unr" or n.op in ("then", "else"):
                continue
            if parent is not None and parent.op in ("block", "loop") and i != len(lst) - 1:
                continue
            if parent is None and i != len(lst) - 1:
                continue
            if parent is not None and parent.op in ("then", "else") and i != len(lst) - 1:
                continue
            if pred and not pred(n):
                continue
            if closed and free_labels(n):
                continue
            out.append((lst, i, n))
        return out

    def insert_stmt(self, f, s):
        lists = stmt_lists(f)
        lst, has_res = self.r.choice(lists)
        hi = len(lst) - 1 if has_res else len(lst)
        lst.insert(self.r.randint(0, max(0, hi)), s)

    def cond(self, f):
        return self.gen_for(f).cond(2)

    # ------------------------------------------------ mutators
    def m_dup_arms(self, f):
        vs = self.value_slots(f, lambda n: n.size() <= 40)
        if not vs:
            return False
        lst, i, n = self.r.choice(vs)
        e2 = n.clone()
        if self.r.random() < .4:
            consts = [x for x in e2.walk() if x.op in ("i32.const", "i64.const")]
            if consts:
                c = self.r.choice(consts)
                c.imms = [str(wrap(int(c.imms[0]) + self.r.choice([-1, 1]), c.op[:3]))]
        t = n.t
        x = self.r.random()
        if is_int(t) and x < .35:
            op = self.r.choice(["sub", "xor", "and", "or", "eq", "ne", "add", "lt_u", "ge_s"])
            e = N("%s.%s" % (t, op), [], [n, e2])
            if op in ("eq", "ne", "lt_u", "ge_s") and t == "i64":
                e = N("i64.extend_i32_u", [], [e])
        elif x < .7:
            e = N("select", [["result", vt_str(t)]], [n, e2, self.cond(f)])
        else:
            e = N("if", [["result", vt_str(t)]], [self.cond(f), N("then", [], [n]), N("else", [], [e2])])
        lst[i] = e
        return True

    def m_boundary(self, f):
        cs = [n for _, _, n, _ in slots(f) if n.op in ("i32.const", "i64.const")]
        if not cs:
            return False
        for c in self.r.sample(cs, min(len(cs), self.r.randint(1, 3))):
            t = c.op[:3]
            c.imms = [str(wrap(self.r.choice(B32 if t == "i32" else B64), t))]
        return True

    def m_tee_other(self, f):
        gets = [(lst, i, n) for lst, i, n, _ in slots(f) if n.op == "local.get"]
        self.r.shuffle(gets)
        allv = f.params + f.locals
        for lst, i, n in gets:
            t = f.vars().get(n.imms[0])
            others = [v for v, tt in allv if tt == t and v != n.imms[0] and not v.startswith("$cnt")]
            if others:
                lst[i] = N("local.tee", [self.r.choice(others)], [n])
                return True
        return False

    def m_alias(self, f):
        refs = [(v, t) for v, t in f.params + f.locals if is_ref(t)]
        ctx = TypeCtx(self.m)
        pairs = [(a, b) for a, ta in refs for b, tb in refs if a != b and ctx.sub(ta, tb)]
        if not pairs:
            return False
        a, b = self.r.choice(pairs)
        s = N("local.set", [b], [N("local.get", [a])])
        if self.r.random() < .5:
            f.body.insert(0, s)
        else:
            self.insert_stmt(f, s)
        return True

    def m_wrap_cast(self, f):
        vs = self.value_slots(f, lambda n: is_ref(n.t) and n.t[2] not in ("none", "nofunc", "noextern"))
        if not vs:
            return False
        lst, i, n = self.r.choice(vs)
        t = n.t
        x = self.r.random()
        g = self.gen_for(f)
        if x < .3:
            e = N("ref.cast", [vt_str(t)], [n])
        elif x < .5:
            e = N("ref.as_non_null", [], [n])
            if t[1]:
                # keep the type: (ref null h) slot accepts (ref h)
                pass
        elif x < .75:
            lab = "$W%d" % self.r.randrange(1 << 20)
            e = N("block", [lab, ["result", vt_str(t)]],
                  [N("br_on_non_null", [lab], [n]), g.leaf(t) if not t[1] else N("ref.null", [t[2] if t[2].startswith("$") else "none"])])
            if not t[1]:
                # non-null slot: the fallthrough after br_on_non_null is only reached on null
                e = N("block", [lab, ["result", vt_str(t)]], [N("br_on_non_null", [lab], [n]), N("unreachable")])
        else:
            lab = "$W%d" % self.r.randrange(1 << 20)
            t1 = ("ref", True, t[2])
            e = N("block", [lab, ["result", vt_str(t1)]],
                  [N("br_on_cast", [lab, vt_str(t1), vt_str(("ref", False, t[2]))], [n])])
            if not t[1]:
                e = N("ref.as_non_null", [], [e])
        lst[i] = e
        return True

    def m_trap_arm(self, f):
        x = self.r.random()
        if x < .4:
            vs = self.value_slots(f)
            if vs:
                lst, i, n = self.r.choice(vs)
                arms = [N("then", [], [n]), N("else", [], [N("unreachable")])]
                if self.r.random() < .5:
                    arms = [N("then", [], [N("unreachable")]), N("else", [], [n])]
                lst[i] = N("if", [["result", vt_str(n.t)]], [self.cond(f)] + arms)
                return True
        g = self.gen_for(f)
        y = self.r.random()
        if y < .4:
            s = N("if", [], [self.cond(f), N("then", [], [N("unreachable")])])
        elif y < .7:
            t = self.r.choice(["i32", "i64"])
            s = N("drop", [], [N("%s.%s" % (t, self.r.choice(["div_s", "div_u", "rem_s"])), [],
                                 [g.expr(t, 2), g.leafish(t, 3)])])
        else:
            refs = [v for v, tt in f.params + f.locals if is_ref(tt)]
            if not refs:
                return False
            s = N("drop", [], [N("ref.as_non_null", [], [N("local.get", [self.r.choice(refs)])])])
        self.insert_stmt(f, s)
        return True

    def m_interleave(self, f):
        g = self.gen_for(f)
        sts = [(T, j, s) for T, td in g.tmap.items() if td.kind == "struct" and T not in g.a2s
               for j, (s, mut) in enumerate(td.fields) if s in ("i32", "i8", "i16", "i64")]
        if not sts or not self.m.memories:
            return False
        T, j, s = self.r.choice(sts)
        k = self.r.randrange(len(self.m.memories))
        mname, at = self.m.memories[k][0], self.m.memories[k][1]
        addr = g.addr(at, 3)
        vt = g.stv(s)
        ref = g.ref_operand(T, 3)
        st = N("%s.store" % vt, [mname], [addr, N("struct.get" if s not in ("i8", "i16") else "struct.get_s",
                                                    [T, str(j)], [ref])])
        muts = [(jj, ss) for jj, (ss, mut) in enumerate(g.tmap[T].fields) if mut and g.stv(ss) == vt]
        stmts = [st]
        if muts:
            jj, _ = self.r.choice(muts)
            stmts.append(N("struct.set", [T, str(jj)], [ref.clone(), N("%s.load" % vt, [mname], [addr.clone()])]))
        if self.r.random() < .5:
            stmts.reverse()
        lists = stmt_lists(f)
        lst, has_res = self.r.choice(lists)
        pos = self.r.randint(0, max(0, len(lst) - 1 if has_res else len(lst)))
        for s2 in reversed(stmts):
            lst.insert(pos, s2)
        return True

    def m_alloc_branch(self, f):
        sets = [(lst, i, n) for lst, i, n, _ in slots(f)
                if n.op == "local.set" and n.kids and is_ref(n.kids[0].t) and not free_labels(n)]
        g = self.gen_for(f)
        if not sets:
            # create one: set a ref local to a fresh allocation inside an if
            refs = [(v, t) for v, t in f.locals if is_ref(t)]
            if not refs:
                return False
            v, t = self.r.choice(refs)
            s = N("if", [], [self.cond(f), N("then", [], [N("local.set", [v], [g.expr(t, 2)])]),
                             N("else", [], [N("local.set", [v], [g.expr(t, 2)])])])
            self.insert_stmt(f, s)
            return True
        lst, i, n = self.r.choice(sets)
        v = n.imms[0]
        t = f.vars()[v]
        other = N("local.set", [v], [g.expr(t, 2)]) if self.r.random() < .7 else N("nop")
        lst[i] = N("if", [], [self.cond(f), N("then", [], [n]), N("else", [], [other])])
        return True

    def m_dead_code(self, f):
        g = self.gen_for(f)
        x = self.r.random()
        body = [g.stmt(2) for _ in range(self.r.randint(1, 2))]
        if x < .4:
            s = N("if", [], [N("i32.const", ["0"]), N("then", [], body)])
        elif x < .7:
            lab = "$D%d" % self.r.randrange(1 << 20)
            s = N("block", [lab], [N("br", [lab])] + body)
        else:
            s = N("block", [], [N("drop", [], [g.expr("i32", 2)]), N("return", [], [g.leaf(t) for t in f.results])] + body)
            s = N("if", [], [self.cond(f), N("then", [], [s])])
        self.insert_stmt(f, s)
        return True

    def m_move_stmt(self, f):
        lists = [(lst, hr) for lst, hr in stmt_lists(f) if len(lst) - (1 if hr else 0) >= 2]
        if not lists:
            return False
        lst, hr = self.r.choice(lists)
        hi = len(lst) - (1 if hr else 0)
        i = self.r.randrange(hi - 1)
        lst[i], lst[i + 1] = lst[i + 1], lst[i]
        return True

    def m_gen_stmt(self, f):
        g = self.gen_for(f)
        self.insert_stmt(f, g.stmt(1))
        return True

    def m_splice(self, f, pool_only=False):
        """replace a closed subtree by a same-typed one from another function
        of this module or from the seed pool"""
        cands = []
        if not pool_only:
            for f2 in self.m.funcs:
                if f2 is f:
                    continue
                for lst, i, n in self.value_slots(f2, lambda n: 2 <= n.size() <= 30, closed=True):
                    cands.append(("local", f2, n))
        vs = self.value_slots(f, lambda n: n.size() <= 30)
        stm = None
        if not vs:
            return False
        lst, i, n = self.r.choice(vs)
        want = n.t
        x = self.r.random()
        if self.pool and (pool_only or x < .6):
            ents = [e for e in self.pool_by_type(want)]
            if not ents and self.r.random() < .5:
                # insert a void statement from the pool instead
                ents = self.pool_by_type(None)
                stm = True
            if ents:
                e = self.r.choice(ents)
                node = self.import_entry(f, e)
                if node is None:
                    return False
                if stm:
                    self.insert_stmt(f, node)
                else:
                    lst[i] = node
                self.nsplice += 1
                self.last_src = e.get("src", "pool")
                return True
            if pool_only:
                return False
        same = [(f2, n2) for _, f2, n2 in cands if n2.t == want]
        if not same:
            return False
        f2, n2 = self.r.choice(same)
        node = n2.clone()
        if not self.remap_locals(f, f2.vars(), node):
            return False
        lst[i] = node
        self.last_src = "module"
        return True

    # ------------------------------------------------ pool import
    def pool_by_type(self, want):
        key = "void" if want is None else vt_str(want)
        idx = getattr(self, "_pidx", None)
        if idx is None:
            idx = {}
            for e in self.pool:
                idx.setdefault(e["t"], []).append(e)
            self._pidx = idx
        # reference entries use the donor's type names, only abstract heap
        # types match across modules
        return idx.get(key, [])

    def remap_locals(self, f, donor_vars, node):
        mine = f.vars()
        mapping = {}
        for x in node.walk():
            if x.op in ("local.get", "local.set", "local.tee"):
                v = x.imms[0]
                if v in mapping:
                    x.imms = [mapping[v]] + x.imms[1:]
                    continue
                t = donor_vars.get(v)
                if t is None:
                    return False
                opts = [n for n, tt in f.params + f.locals if tt == t and not n.startswith("$cnt")]
                if opts and self.r.random() < .8:
                    nv = self.r.choice(opts)
                else:
                    if is_ref(t) and not t[1]:
                        if not opts:
                            return False
                        nv = self.r.choice(opts)
                    else:
                        nv = "$sp%d" % len(f.locals)
                        while nv in mine:
                            nv += "_"
                        f.locals.append((nv, t))
                        mine[nv] = t
                mapping[v] = nv
                x.imms = [nv] + x.imms[1:]
        return True

    def import_entry(self, f, e):
        node = to_node(parse_sx(e["code"])[0])
        m = self.m
        pre = "$x%s_" % e["id"]
        # types: copy definitions under a fresh prefix
        tren = {}
        for td in e.get("types", []):
            tren[td["name"]] = pre + td["name"][1:]
        for td in e.get("types", []):
            nm = tren[td["name"]]
            if nm in {t.name for t in m.types}:
                continue
            x = parse_typedef_text(td["text"])
            ren = lambda n: tren.get(n, n)
            x.name = ren(x.name)
            x.sup = ren(x.sup) if x.sup else None
            x.fields = [(rt_ren2(s, ren), mu) for s, mu in x.fields]
            m.types.append(x)
        gren = {}
        for gname, (gt, gmut) in e.get("globals", {}).items():
            gt = parse_vt(gt) if not isinstance(gt, str) or gt not in ("i32", "i64") else gt
            opts = [n for n, t, mu, _, _ in m.globals if t == gt and (mu or not gmut)]
            if opts:
                gren[gname] = self.r.choice(opts)
            else:
                nn = pre + "g" + str(len(m.globals))
                m.globals.append((nn, gt, True, "(%s.const 0)" % gt, nn[1:]))
                gren[gname] = nn
        mren = {}
        for mname, at in e.get("mems", {}).items():
            opts = [mm[0] for mm in m.memories if mm[1] == at]
            if opts:
                mren[mname] = self.r.choice(opts)
            elif len(m.memories) < 3:
                nn = "$m%d" % len(m.memories)
                m.memories.append((nn, at, 1, None))
                mren[mname] = nn
            else:
                return None
        fren = {}
        for fname, (ps, rs) in e.get("calls", {}).items():
            ps = [p for p in ps]
            opts = [i[0] for i in m.imports if i[3] == ps and i[4] == rs]
            if opts:
                fren[fname] = opts[0]
            else:
                nn = "$c%d" % len(m.imports)
                m.imports.append((nn, "env", nn[1:], ps, rs))
                fren[fname] = nn
        default_mem = e.get("default_mem")
        for x in node.walk():
            op = x.op
            if op in ("global.get", "global.set"):
                x.imms[0] = gren[x.imms[0]]
            elif op == "memory.copy":
                ms = [i for i in x.imms if isinstance(i, str) and i.startswith("$")]
                if ms:
                    x.imms = [mren.get(i, i) if isinstance(i, str) and i.startswith("$") else i for i in x.imms]
                elif default_mem:
                    x.imms = [mren[default_mem], mren[default_mem]] + x.imms
            elif op in LOADS or op in STORES or op in ("memory.size", "memory.grow", "memory.fill"):
                if x.imms and isinstance(x.imms[0], str) and x.imms[0].startswith("$"):
                    x.imms[0] = mren[x.imms[0]]
                elif default_mem:
                    x.imms.insert(0, mren[default_mem])
            elif op == "call":
                x.imms[0] = fren[x.imms[0]]
            x.imms = [rename_types(i, tren) for i in x.imms]
        ren = lambda n: tren.get(n, n)
        if not self.remap_locals(f, {k: rt_ren2(parse_vt_s(v), ren) for k, v in e.get("locals", {}).items()}, node):
            return None
        return node


def parse_vt_s(s):
    if s in ("i32", "i64", "f32", "f64"):
        return s
    return parse_vt(parse_sx(s)[0])


def rt_ren2(s, ren):
    if isinstance(s, tuple) and s[2].startswith("$"):
        return ("ref", s[1], ren(s[2]))
    return s


def rename_types(imm, tren):
    if isinstance(imm, str):
        return tren.get(imm, imm)
    return [rename_types(i, tren) for i in imm]


def parse_typedef_text(text):
    from wmod import parse_typedef
    return parse_typedef(parse_sx(text)[0])


MUTATORS = ["dup_arms", "boundary", "tee_other", "alias", "wrap_cast", "trap_arm", "interleave",
            "alloc_branch", "dead_code", "move_stmt", "gen_stmt", "splice", "splice_pool"]


def mutate(r, m, pool, n, weights=None, gc=True):
    """apply n mutators; returns [(mutator, func name)] that applied"""
    mu = Mut(r, m, pool, weights)
    done = []
    names = [x for x in MUTATORS if gc or x not in ("alias", "wrap_cast", "alloc_branch", "interleave")]
    ws = [(weights or {}).get(x, 1.0) for x in names]
    for _ in range(n):
        if not m.funcs:
            break
        f = r.choice(m.funcs)
        try:
            type_func(m, f)
        except Unsupported:
            continue
        for _try in range(4):
            name = r.choices(names, ws)[0]
            snap = f.text(), list(m.types), list(m.globals), list(m.memories), list(m.imports)
            saved = [b.clone() for b in f.body], list(f.locals)
            try:
                if name == "splice_pool":
                    ok = mu.m_splice(f, pool_only=True)
                else:
                    ok = getattr(mu, "m_" + name)(f)
                if ok:
                    type_func(m, f)
            except (Unsupported, ValueError, KeyError, IndexError, TypeError, AttributeError):
                ok = False
            if ok:
                tag = name
                if name.startswith("splice"):
                    tag = name + ":" + getattr(mu, "last_src", "?")
                done.append((tag, f.name))
                break
            f.body, f.locals = saved
            m.types, m.globals, m.memories, m.imports = snap[1], snap[2], snap[3], snap[4]
    return done
