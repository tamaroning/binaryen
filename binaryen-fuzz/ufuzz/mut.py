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
from wmod import (ATOMIC, N, NUM, SIMD, VMEM, TypeCtx, Typer, Unsupported, free_labels, is_int, is_ref, parse_sx,
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
                  [N("br_on_non_null", [lab], [n]), g.leaf(t) if not t[1] else N("ref.null", [g.null_heap(t[2])])])
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

    # ------------------------------------------------ structural / op-level mutators
    def void_stmts(self, f):
        """(list, index) of void statements whose position is not a value position"""
        out = []
        for lst, hr in stmt_lists(f):
            hi = len(lst) - 1 if hr else len(lst)
            for i in range(hi):
                if lst[i].t is None and lst[i].op not in ("then", "else"):
                    out.append((lst, i))
        return out

    def m_op_swap(self, f):
        """replace an operator by another one with the same signature"""
        groups = op_groups()
        cands = [n for _, _, n, _ in slots(f) if n.op in groups[0] and len(groups[1][groups[0][n.op]]) > 1]
        if not cands:
            return False
        n = self.r.choice(cands)
        alts = [o for o in groups[1][groups[0][n.op]] if o != n.op]
        n.op = self.r.choice(alts)
        return True

    def m_swap_operands(self, f):
        cands = [n for _, _, n, _ in slots(f) if len(n.kids) >= 2 and n.kids[0].t is not None
                 and n.kids[0].t == n.kids[1].t and n.kids[0].t != "unr"
                 and (n.op in NUM or n.op in SIMD or n.op in ("select", "ref.eq", "array.set", "struct.set"))]
        if not cands:
            return False
        n = self.r.choice(cands)
        n.kids[0], n.kids[1] = n.kids[1], n.kids[0]
        return True

    def m_wrap_block(self, f):
        """wrap a value or a statement in a block / loop / if / br_if frame"""
        r = self.r
        g = self.gen_for(f)
        lab = "$WB%d" % r.randrange(1 << 20)
        if r.random() < .5:
            vs = self.value_slots(f, lambda n: n.size() <= 60)
            if not vs:
                return False
            lst, i, n = r.choice(vs)
            vt = vt_str(n.t)
            x = r.random()
            if x < .3:
                e = N("block", [lab, ["result", vt]], [n])
            elif x < .5:
                e = N("loop", [lab, ["result", vt]], [n])
            elif x < .75:
                e = N("block", [lab, ["result", vt]], [N("drop", [], [N("br_if", [lab], [g.leaf(n.t), g.cond(2)])]), n])
            else:
                e = N("if", [["result", vt]], [N("i32.const", [str(r.choice([0, 1, 1]))]),
                                             N("then", [], [n]), N("else", [], [g.leaf(n.t)])])
            lst[i] = e
            return True
        sts = self.void_stmts(f)
        if not sts:
            return False
        lst, i = r.choice(sts)
        n = lst[i]
        x = r.random()
        if x < .35:
            lst[i] = N("block", [lab], [n])
        elif x < .55:
            lst[i] = N("loop", [lab], [n])
        elif x < .8:
            lst[i] = N("block", [lab], [N("br_if", [lab], [g.cond(2)]), n])
        else:
            lst[i] = N("if", [], [g.cond(2), N("then", [], [n])])
        return True

    def m_dup_stmt(self, f):
        sts = [(lst, i) for lst, i in self.void_stmts(f) if lst[i].size() <= 40 and not free_labels(lst[i])]
        if not sts:
            return False
        lst, i = self.r.choice(sts)
        lst.insert(i + self.r.randint(0, 1), lst[i].clone())
        return True

    def m_lift_local(self, f):
        vs = self.value_slots(f, lambda n: 2 <= n.size() <= 25 and (not is_ref(n.t) or n.t[1]), closed=True)
        if not vs:
            return False
        lst, i, n = self.r.choice(vs)
        v = "$lf%d" % len(f.locals)
        f.locals.append((v, n.t))
        lst[i] = N("block", [["result", vt_str(n.t)]], [N("local.set", [v], [n]), N("local.get", [v])])
        return True

    def m_memarg(self, f):
        cands = [n for _, _, n, _ in slots(f) if (n.op in LOADS or n.op in STORES or n.op in VMEM) and n.kids]
        if not cands:
            return False
        n = self.r.choice(cands)
        nat = (LOADS.get(n.op) or STORES.get(n.op) or (None, VMEM.get(n.op, (0, 1))[1]))[1]
        mem = [y for y in n.imms if isinstance(y, str) and y.startswith("$")]
        lane = [y for y in n.imms if isinstance(y, str) and y.isdigit()]
        off = [y for y in n.imms if isinstance(y, str) and y.startswith("offset=")]
        al = [y for y in n.imms if isinstance(y, str) and y.startswith("align=")]
        if self.r.random() < .5:
            o = self.r.choice([0, 1, 2, 4, 8, 15, 16, 0xfff0, 0xfffc, 0xffff, 0x10000, 0x7fffffff, 0xfffffffc])
            off = ["offset=%d" % o] if o else []
        elif al:
            al = []
        elif nat > 1:
            a = self.r.choice([1, 2, 4, 8])
            if a <= nat:
                al = ["align=%d" % a]
        n.imms = mem + off + al + lane
        return True

    def m_sign_variant(self, f):
        pairs = sign_pairs()
        cands = [n for _, _, n, _ in slots(f) if n.op in pairs]
        if not cands:
            return False
        for n in self.r.sample(cands, min(len(cands), self.r.randint(1, 2))):
            n.op = pairs[n.op]
        return True

    def m_float_const(self, f):
        cs = [n for _, _, n, _ in slots(f) if n.op in ("f32.const", "f64.const", "v128.const")]
        if not cs:
            return False
        g = self.gen_for(f)
        for c in self.r.sample(cs, min(len(cs), 2)):
            if c.op == "v128.const":
                v = g.vconst()
            else:
                v = g.const(c.op[:3])
            c.imms = v.imms
        return True

    def m_br_insert(self, f):
        blocks = [n for _, _, n, _ in slots(f) if n.op == "block" and n.imms and isinstance(n.imms[0], str)
                  and n.imms[0].startswith("$") and len(n.kids) >= 1]
        if not blocks:
            return False
        n = self.r.choice(blocks)
        g = self.gen_for(f)
        res = [i for i in n.imms if isinstance(i, list) and i[0] == "result"]
        if len(res) > 1 or (res and len(res[0]) > 2):
            return False
        pos = self.r.randint(0, len(n.kids) - 1 if res else len(n.kids))
        if res:
            t = parse_vt(res[0][1])
            if t == "unr":
                return False
            s = N("drop", [], [N("br_if", [n.imms[0]], [g.leaf(t), g.cond(2)])])
        else:
            s = N("br_if", [n.imms[0]], [g.cond(2)])
        n.kids.insert(pos, s)
        return True

    def m_cond_flip(self, f):
        ifs = [n for _, _, n, _ in slots(f) if n.op == "if" and len(n.kids) == 3]
        if not ifs:
            return False
        n = self.r.choice(ifs)
        th, el = n.kids[1], n.kids[2]
        th.op, el.op = "else", "then"
        n.kids = [N("i32.eqz", [], [n.kids[0]]), el, th]
        return True

    def m_select_if(self, f):
        r = self.r
        sel = [(lst, i, n) for lst, i, n, _ in slots(f) if n.op == "select" and n.t is not None and n.t != "unr"]
        ifs = [(lst, i, n) for lst, i, n, _ in slots(f) if n.op == "if" and len(n.kids) == 3 and n.t not in (None, "unr")
               and len(n.kids[1].kids) == 1 and len(n.kids[2].kids) == 1
               and not free_labels(n.kids[1]) and not free_labels(n.kids[2])]
        if sel and (not ifs or r.random() < .5):
            lst, i, n = r.choice(sel)
            lst[i] = N("if", [["result", vt_str(n.t)]], [n.kids[2], N("then", [], [n.kids[0]]), N("else", [], [n.kids[1]])])
            return True
        if ifs:
            lst, i, n = r.choice(ifs)
            imms = [["result", vt_str(n.t)]] if is_ref(n.t) else []
            lst[i] = N("select", imms, [n.kids[1].kids[0], n.kids[2].kids[0], n.kids[0]])
            return True
        return False

    def m_shrink(self, f):
        r = self.r
        if r.random() < .5:
            vs = self.value_slots(f, lambda n: n.size() >= 4, closed=True)
            if vs:
                lst, i, n = r.choice(vs)
                try:
                    lst[i] = self.gen_for(f).leaf(n.t)
                except ValueError:
                    return False
                return True
        sts = [(lst, i) for lst, i in self.void_stmts(f) if not free_labels(lst[i])]
        if not sts:
            return False
        lst, i = r.choice(sts)
        del lst[i]
        return True

    def m_roundtrip(self, f):
        vs = self.value_slots(f, lambda n: n.t in ("i32", "i64", "f32", "f64", "v128") and n.size() <= 40)
        if not vs:
            return False
        lst, i, n = self.r.choice(vs)
        t, r = n.t, self.r
        if t == "i32":
            opts = [lambda: N("i32.wrap_i64", [], [N("i64.extend_i32_%s" % r.choice("su"), [], [n])]),
                    lambda: N("i32.reinterpret_f32", [], [N("f32.reinterpret_i32", [], [n])]),
                    lambda: N("i32.and", [], [n, N("i32.const", ["-1"])]),
                    lambda: N("i32.add", [], [n, N("i32.const", ["0"])]),
                    lambda: N("i32.shr_s", [], [N("i32.shl", [], [n, N("i32.const", ["0"])]), N("i32.const", ["0"])])]
        elif t == "i64":
            opts = [lambda: N("i64.reinterpret_f64", [], [N("f64.reinterpret_i64", [], [n])]),
                    lambda: N("i64.or", [], [n, N("i64.const", ["0"])]),
                    lambda: N("i64.xor", [], [N("i64.xor", [], [n, N("i64.const", ["-1"])]), N("i64.const", ["-1"])])]
        elif t in ("f32", "f64"):
            it = "i32" if t == "f32" else "i64"
            opts = [lambda: N("%s.reinterpret_%s" % (t, it), [], [N("%s.reinterpret_%s" % (it, t), [], [n])]),
                    lambda: N(t + ".neg", [], [N(t + ".neg", [], [n])]),
                    lambda: N(t + ".mul", [], [n, N(t + ".const", ["1"])]),
                    lambda: N(t + ".copysign", [], [n, n.clone()])]
            if t == "f32":
                opts.append(lambda: N("f32.demote_f64", [], [N("f64.promote_f32", [], [n])]))
        else:
            opts = [lambda: N("v128.not", [], [N("v128.not", [], [n])]),
                    lambda: N("v128.and", [], [n, n.clone()]),
                    lambda: N("v128.xor", [], [N("v128.xor", [], [n, self.gen_for(f).vconst()]), self.gen_for(f).vconst()])]
        lst[i] = r.choice(opts)()
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
            elif op in LOADS or op in STORES or op in VMEM or op in ATOMIC or op in ("memory.size", "memory.grow", "memory.fill"):
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
            "alloc_branch", "dead_code", "move_stmt", "gen_stmt", "splice", "splice_pool",
            "op_swap", "swap_operands", "wrap_block", "dup_stmt", "lift_local", "memarg", "sign_variant",
            "float_const", "br_insert", "cond_flip", "select_if", "shrink", "roundtrip"]

_GROUPS = []
_SIGN = {}


def op_groups():
    """({op: signature}, {signature: [ops]}) over the numeric and SIMD operators"""
    if not _GROUPS:
        sig, by = {}, {}
        for op, (ps, r) in NUM.items():
            sig[op] = ("num", tuple(ps), r)
        for op, (ni, ps, r) in SIMD.items():
            # lane immediates are only valid within one shape
            sig[op] = ("simd", ni, tuple(ps), r, op.split(".")[0] if ni else None)
        for op, k in sig.items():
            by.setdefault(k, []).append(op)
        _GROUPS.append((sig, by))
    return _GROUPS[0]


def sign_pairs():
    """op -> its signed / unsigned counterpart"""
    if not _SIGN:
        known = set(NUM) | set(SIMD) | set(LOADS) | {"struct.get_s", "struct.get_u", "array.get_s", "array.get_u",
                                                     "i31.get_s", "i31.get_u"}
        for op in sorted(known):
            for a, b in (("_s", "_u"),):
                for x, y in ((a, b), (b, a)):
                    if op.endswith(x) and op[:-len(x)] + y in known:
                        _SIGN[op] = op[:-len(x)] + y
                    elif x + "_" in op and op.replace(x + "_", y + "_", 1) in known:
                        _SIGN[op] = op.replace(x + "_", y + "_", 1)
    return _SIGN


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


# ---------------------------------------------------------------- cov_* mutators
# Rewrite a program towards the idioms and layouts the optimizer passes look for: sign extensions
# spelled with shifts, chains of constant operations, comparisons against 0 / -1 / min / max combined
# with each other, allocations that flow through blocks and casts, statements shared by both arms of
# an if, ifs with a dead-end arm, runs of br_if to one label.
_COV_CMP = ("eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u")
_COV_EDGE = {"i32": [0, 1, -1, 2, -0x80000000, 0x7fffffff, 0xff, 0x80000000, 0xffff],
             "i64": [0, 1, -1, 2, -0x8000000000000000, 0x7fffffffffffffff, 0xffffffff, 0xff]}
_COV_CHAIN = ("and", "or", "xor", "mul", "add", "sub", "shl", "shr_s", "shr_u", "rotl", "rotr")


def _m_cov_sext(self, f):
    """an integer value -> its sign / zero extension spelled with shifts, or masked"""
    r = self.r
    vs = self.value_slots(f, lambda n: n.t in ("i32", "i64") and n.size() <= 40)
    if not vs:
        return False
    lst, i, n = r.choice(vs)
    t = n.t
    bits = 32 if t == "i32" else 64
    w = r.choice([8, 16] + ([32] if t == "i64" else []))
    g = self.gen_for(f)
    x = r.random()
    if x < .6:
        lst[i] = N(t + ".shr_s" if r.random() < .8 else t + ".shr_u", [],
                   [N(t + ".shl", [], [n, g.const(t, bits - w)]), g.const(t, bits - w if r.random() < .8 else bits - w - 1)])
    elif x < .8:
        lst[i] = N(t + ".and", [], [n, g.const(t, (1 << w) - 1)])
    else:
        lst[i] = N(t + (".extend%d_s" % w), [], [n])
    return True


def _m_cov_const_chain(self, f):
    """x op C  ->  (x op C) op C'  for the operators with a combining rule, or compare x + C with C'"""
    r = self.r
    g = self.gen_for(f)
    cands = [(lst, i, n) for lst, i, n in self.value_slots(f, lambda n: n.t in ("i32", "i64") and n.size() <= 40)
             if n.op[4:] in _COV_CHAIN and len(n.kids) == 2 and n.kids[1].op.endswith(".const")]
    if cands and r.random() < .8:
        lst, i, n = r.choice(cands)
        t = n.t
        c2 = g.const(t, r.choice([1, 2, 3, 8, 15, 16, 31, 32, 63, 64, 255, -1, 0xff00]))
        lst[i] = N(n.op, [], [n, c2])
        return True
    vs = self.value_slots(f, lambda n: n.t == "i32" and n.size() <= 40 and n.op[4:] in _COV_CMP and len(n.kids) == 2)
    if not vs:
        return False
    lst, i, n = r.choice(vs)
    t = n.kids[0].t
    if t not in ("i32", "i64"):
        return False
    n.kids[0] = N(t + r.choice([".add", ".sub"]), [], [n.kids[0], g.const(t, r.choice([1, 5, 100, -1, 0x40000000]))])
    return True


def _m_cov_cmp_edge(self, f):
    """a comparison -> a combination of comparisons of the same operand with 0 / -1 / min / max"""
    r = self.r
    g = self.gen_for(f)
    vs = self.value_slots(f, lambda n: n.t == "i32" and n.op[:4] in ("i32.", "i64.") and n.op[4:] in _COV_CMP
                          and len(n.kids) == 2 and n.size() <= 40)
    if not vs:
        return False
    lst, i, n = r.choice(vs)
    t = n.op[:3]
    x = n.kids[0].clone()
    c = N(t + "." + r.choice(_COV_CMP), [], [x, g.const(t, r.choice(_COV_EDGE[t]))])
    x = r.random()
    if x < .5:
        lst[i] = N("i32." + r.choice(["and", "or", "xor"]), [], [n, c])
    elif x < .75:
        n.kids[1] = g.const(t, r.choice(_COV_EDGE[t]))
    else:
        lst[i] = N("i32.eqz", [], [n])
    return True


def _m_cov_alloc_flow(self, f):
    """a reference value -> the same value passed through a block, a cast, a tee or a branch"""
    r = self.r
    vs = self.value_slots(f, lambda n: is_ref(n.t) and n.size() <= 40 and n.op in (
        "struct.new", "struct.new_default", "array.new", "array.new_fixed", "array.new_default", "local.get", "ref.cast",
        "global.get"))
    if not vs:
        return False
    lst, i, n = r.choice(vs)
    t = n.t
    vt = vt_str(t)
    lab = "$AF%d" % r.randrange(1 << 20)
    x = r.random()
    if x < .3:
        lst[i] = N("block", [lab, ["result", vt]], [n])
    elif x < .55:
        lst[i] = N("ref.cast", [vt], [n])
    elif x < .8:
        loc = "$cvl%d" % r.randrange(1 << 20)
        f.locals.append((loc, ("ref", True, t[2])))
        e = N("local.tee", [loc], [n])
        lst[i] = e if t[1] else N("ref.as_non_null", [], [e])
    else:
        lst[i] = N("block", [lab, ["result", vt]], [N("br", [lab], [n])])
    return True


def _m_cov_fold(self, f):
    """append one statement to both arms of an if (a shared tail), or a dead end to one arm"""
    r = self.r
    g = self.gen_for(f)
    ifs = [n for _, _, n, _ in slots(f) if n.op == "if" and n.t is None and len(n.kids) == 3
           and n.kids[1].kids and n.kids[2].kids]
    if not ifs:
        ifs = [n for _, _, n, _ in slots(f) if n.op == "if" and n.t is None and len(n.kids) == 2]
        if not ifs:
            return False
        n = r.choice(ifs)
        end = N("unreachable") if r.random() < .6 or f.results else N("return")
        n.kids[1].kids.append(end)
        return True
    n = r.choice(ifs)
    if r.random() < .6:
        s = g.stmt(2)
        if free_labels(s):
            return False
        n.kids[1].kids.append(s)
        n.kids[2].kids.append(s.clone())
        return True
    end = N("unreachable") if r.random() < .6 or f.results else N("return")
    r.choice([n.kids[1], n.kids[2]]).kids.append(end)
    return True


def _m_cov_br_run(self, f):
    """insert a run of br_ifs to the label of a block, comparing one local with distinct constants"""
    r = self.r
    blocks = [n for _, _, n, _ in slots(f) if n.op == "block" and n.imms and isinstance(n.imms[0], str)
              and n.imms[0].startswith("$") and len(n.kids) >= 1 and n.t is None]
    if not blocks:
        return False
    n = r.choice(blocks)
    ivars = [v for v, t in f.params + f.locals if t == "i32" and not v.startswith("$cnt")]
    if not ivars:
        return False
    v = r.choice(ivars)
    base = r.choice([0, 0, 1, 7])
    pos = r.randint(0, len(n.kids))
    run = [N("br_if", [n.imms[0]], [N("i32.eq", [], [N("local.get", [v]), N("i32.const", [str(base + k)])])])
           for k in range(r.randint(3, 5))]
    n.kids[pos:pos] = run
    return True


def _m_cov_set_chain(self, f):
    """local.set v e -> local.set v (local.tee w e), or e wrapped in an if / select of constants"""
    r = self.r
    sets = [(lst, i, n) for lst, i, n, _ in slots(f) if n.op == "local.set" and n.kids and n.kids[0].t in ("i32", "i64")]
    if not sets:
        return False
    lst, i, n = r.choice(sets)
    t = n.kids[0].t
    g = self.gen_for(f)
    x = r.random()
    if x < .4:
        ws = [w for w, wt in f.params + f.locals if wt == t and w != n.imms[0] and not w.startswith("$cnt")]
        if not ws:
            return False
        n.kids[0] = N("local.tee", [r.choice(ws)], [n.kids[0]])
    elif x < .7:
        n.kids[0] = N("if", [["result", t]], [g.cond(2), N("then", [], [g.const(t)]), N("else", [], [g.const(t)])])
    else:
        n.kids[0] = N("select", [], [g.const(t), g.const(t), g.cond(2)])
    return True


COV_MUTATORS = ["cov_sext", "cov_const_chain", "cov_cmp_edge", "cov_alloc_flow", "cov_fold", "cov_br_run", "cov_set_chain"]
for _name in COV_MUTATORS:
    setattr(Mut, "m_" + _name, globals()["_m_" + _name])
MUTATORS.extend(COV_MUTATORS)
