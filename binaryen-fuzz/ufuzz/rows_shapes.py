"""Rows that reach the shapes of the Binaryen bugs found so far.  They are a
regression set for the generator (each has a modest weight; a module with the
matching focus tag boosts them), not the main source of variety.

  sh_dup     one expression with a write effect (memory.grow, table.grow, call to an
             import, a global counter, atomic rmw) used twice as the operands of select /
             array.new_fixed / struct.new / a binary operator / ref.eq
  sh_noret   a loop that may not return next to a trapping operation or a call: in operands,
             br_table conditions, br_if values and local.set sinking candidates
  sh_alloc   struct.new / array.new inside a loop, mutated and read back
  sh_tinit   struct.new in a table initializer and in element segment items, read back
             through table.get + struct.get (module part: setup_tinit)
  sh_nan     f32 / f64 chains with abs(x*x), abs(x/x), copysign, neg, min / max with NaN,
             observed through reinterpret
  sh_edge    unaligned loads / stores and bulk memory operations with small constant sizes
             at addresses near the end of memory
"""
from table import ROWS, SETUPS, Row, _loop, row
from wmod import LOADS, STORES, N, is_ref, vt_str


# ---------------------------------------------------------------- sh_dup
def write_expr(g, want, d):
    """an expression of type `want` with a write effect, or None"""
    r = g.r
    opts = []
    for mm in g.m.memories:
        if mm[1] == want:
            opts.append("grow:" + mm[0])
    if want == "i32":
        if getattr(g.m, "tables", None):
            opts.append("tgrow")
        opts += ["call:$h", "gincr:$g0", "tee"]
        if "atomic" in g.features_on and g.m.memories and g.m.memories[0][1] == "i32":
            opts.append("atomic")
    elif want == "i64":
        opts += ["call:$k", "gincr:$g1", "tee"]
        if "atomic" in g.features_on and g.m.memories and g.m.memories[0][1] == "i64":
            opts.append("atomic")
    elif want == "f64" and any(i[0] == "$hf" for i in g.m.imports):
        opts.append("call:$hf")
    elif want == "f32" and any(i[0] == "$hg" for i in g.m.imports):
        opts.append("call:$hg")
    if not opts:
        return None
    o = r.choice(opts)
    if o.startswith("grow:"):
        mm = [x for x in g.m.memories if x[0] == o[5:]][0]
        return N("memory.grow", [mm[0]], [g.const(mm[1], r.choice([0, 1, 1, 2]))])
    if o == "tgrow":
        return N("table.grow", [g.pick_table()], [N("ref.null", ["nofunc"]), N("i32.const", [str(r.choice([0, 1, 2]))])])
    if o.startswith("call:"):
        fn, _, _, ps, rs = [i for i in g.m.imports if i[0] == o[5:]][0]
        return N("call", [fn], [g.leaf(p) for p in ps])
    if o.startswith("gincr:"):
        gl = o[6:]
        t = want
        return N("block", [["result", t]], [
            N("global.set", [gl], [N(t + ".add", [], [N("global.get", [gl]), g.const(t, 1)])]),
            N("global.get", [gl])])
    if o == "tee":
        vs = [v for v in g.vars_exact(want) if v not in g.counters]
        if not vs:
            return None
        v = r.choice(vs)
        return N("local.tee", [v], [N(want + ".add", [], [N("local.get", [v]), g.const(want, 1)])])
    if o == "atomic":
        at = g.m.memories[0][1]
        w = 4 if want == "i32" else 8
        return N(want + ".atomic.rmw.add", [], [N(at + ".const", [str(w * r.choice([0, 1, 2]))]), g.const(want, 1)])
    return None


def _dup_types(g):
    ts = ["i32", "i64"]
    if "float" in g.features_on:
        ts += ["f64", "f32"]
    return ts


@row("dup:select", "sh_dup", .55, "any")
def _dup_select(g, want, d):
    if want is None:
        return None
    w = write_expr(g, want, d)
    if w is None:
        return None
    return N("select", [], [w, w.clone(), g.cond(d + 1)])


@row("dup:binop", "sh_dup", .45, "any")
def _dup_binop(g, want, d):
    if want not in ("i32", "i64"):
        return None
    w = write_expr(g, want, d)
    if w is None:
        return None
    op = g.r.choice(["sub", "xor", "and", "or", "add", "eq", "ne", "lt_u", "ge_s"])
    n = N("%s.%s" % (want, op), [], [w, w.clone()])
    if op in ("eq", "ne", "lt_u", "ge_s"):
        return n if want == "i32" else N("i64.extend_i32_u", [], [n])
    return n


@row("dup:array.new_fixed", "sh_dup", .5, "any")
def _dup_arr(g, want, d):
    if want not in ("i32", "i64"):
        return None
    arrs = [T for T, td in g.tmap.items() if td.kind == "array" and g.stv(td.fields[0][0]) == want]
    if not arrs:
        return None
    w = write_expr(g, want, d)
    if w is None:
        return None
    T = g.r.choice(arrs)
    n = g.r.randint(2, 3)
    s = g.tmap[T].fields[0][0]
    op = "array.get" if s not in ("i8", "i16") else g.r.choice(["array.get_s", "array.get_u"])
    return N(op, [T], [N("array.new_fixed", [T, str(n)], [w.clone() for _ in range(n)]),
                       N("i32.const", [str(g.r.randrange(n))])])


@row("dup:struct.new", "sh_dup", .45, "any")
def _dup_struct(g, want, d):
    if want not in ("i32", "i64"):
        return None
    opts = []
    for T, td in g.tmap.items():
        if td.kind != "struct" or T in g.a2s:
            continue
        idx = [i for i, (s, _) in enumerate(td.fields) if g.stv(s) == want]
        if len(idx) >= 2:
            opts.append((T, td, idx))
    if not opts:
        return None
    w = write_expr(g, want, d)
    if w is None:
        return None
    T, td, idx = g.r.choice(opts)
    kids = [w.clone() if i in idx else g.leaf(g.stv(s)) for i, (s, _) in enumerate(td.fields)]
    i = g.r.choice(idx)
    s = td.fields[i][0]
    op = "struct.get" if s not in ("i8", "i16") else g.r.choice(["struct.get_s", "struct.get_u"])
    return N(op, [T, str(i)], [N("struct.new", [T], kids)])


@row("dup:ref.eq(alloc)", "sh_dup", .3, "i32")
def _dup_refeq(g, want, d):
    cs = [T for T in g.structs() if g.defaultable(g.tmap[T])]
    if not cs:
        return None
    T = g.r.choice(cs)
    td = g.tmap[T]
    kids = [g.leaf(g.stv(s)) for s, _ in td.fields]
    return N("ref.eq", [], [N("struct.new", [T], kids), N("struct.new", [T], [k.clone() for k in kids])])


# ---------------------------------------------------------------- sh_noret
def _hang(g, d):
    """a void statement that may not return"""
    r = g.r
    x = r.random()
    if x < .3:
        n = _loop(g, None, d)
        if n is not None:
            return n
    lab = g.newlab()
    ivs = g.vars_sub("i32")
    rare = N("i32.eq", [], [N("local.get", [r.choice(ivs)]) if ivs else g.expr("i32", d + 1),
                            N("i32.const", [str(r.choice([0, 1, 7, -1, 100, 0x7fffffff]))])])
    if x < .75:
        cond = rare if r.random() < .75 else g.cond(d + 1)
        return N("if", [], [cond, N("then", [], [N("loop", [lab], [N("br", [lab])])])])
    return N("loop", [lab], [N("br_if", [lab], [rare])])


def _trapper(g, d):
    """an i32 expression that may trap or call out"""
    r = g.r
    x = r.random()
    a, b = g.leafish("i32", d + 1), g.leafish("i32", d + 1)
    if x < .35:
        return N("i32." + r.choice(["div_u", "div_s", "rem_u", "rem_s"]), [], [a, b])
    if x < .55:
        return N("i32.load", [] if r.random() < .6 else [g.m.memories[0][0]], [g.addr(g.m.memories[0][1], d)]) \
            if g.m.memories[0][1] == "i32" else N("i32.div_u", [], [a, b])
    if x < .8:
        return N("call", ["$h"], [a])
    if x < .9 and "float" in g.features_on:
        return N("i32.trunc_f32_s", [], [g.leafish("f32", d + 1)])
    return N("call", ["$h"], [b])


def _hang_val(g, d, t="i32"):
    return N("block", [["result", t]], [_hang(g, d), g.leaf(t) if g.r.random() < .6 else g.expr(t, d + 1)])


@row("noret:operands", "sh_noret", .7, "any")
def _noret_operands(g, want, d):
    if want not in ("i32", "i64"):
        return None
    a, b = _trapper(g, d), _hang_val(g, d)
    if g.r.random() < .5:
        a, b = b, a
    op = g.r.choice(["add", "sub", "xor", "or", "and", "mul"])
    n = N("i32." + op, [], [a, b])
    return n if want == "i32" else N("i64.extend_i32_u", [], [n])


@row("noret:br_table", "sh_noret", .45, "void")
def _noret_brtable(g, want, d):
    o, i = g.newlab(), g.newlab()
    cond = N("i32.add", [], [_trapper(g, d), _hang_val(g, d)])
    if g.r.random() < .5:
        cond = N("i32.add", [], [cond.kids[1], cond.kids[0]])
    return N("block", [o], [N("block", [i], [N("br_table", [i, o], [cond])]), g.stmt(d + 1)])


@row("noret:br_if value", "sh_noret", .4, "void")
def _noret_brif(g, want, d):
    b = g.newlab()
    br = N("br_if", [b], [_trapper(g, d), _hang_val(g, d)])
    return N("drop", [], [N("block", [b, ["result", "i32"]], [N("drop", [], [br]), g.expr("i32", d + 1)])])


@row("noret:sink", "sh_noret", .7, "void")
def _noret_sink(g, want, d):
    v = "$sk%d" % len(g.f.locals)
    g.f.locals.append((v, "i32"))
    g.fvars[v] = "i32"
    g.counters.add(v)
    use = g.r.choice([N("drop", [], [N("local.get", [v])]), N("global.set", ["$g0"], [N("local.get", [v])])])
    return N("block", [], [N("local.set", [v], [_trapper(g, d)]), _hang(g, d), use])


@row("noret:select", "sh_noret", .3, "any")
def _noret_select(g, want, d):
    if want != "i32":
        return None
    return N("select", [], [_trapper(g, d), _hang_val(g, d), g.cond(d + 1)])


# ---------------------------------------------------------------- sh_alloc
def _fresh(g, prefix, t):
    v = "$%s%d" % (prefix, len(g.f.locals))
    g.f.locals.append((v, t))
    g.fvars[v] = t
    g.counters.add(v)
    return v


def _loop_frame(g, cnt, lab, body, n):
    step = N("br_if", [lab], [N("i32.lt_u", [], [
        N("local.tee", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])]),
        N("i32.const", [str(n)])])])
    return N("loop", [lab], body + [step])


@row("alloc-loop(struct)", "sh_alloc", .7, "any")
def _alloc_struct(g, want, d):
    if want not in (None, "i32") or d > 2:
        return None
    opts = [(T, i, s) for T, td in g.tmap.items() if td.kind == "struct" and T not in g.a2s
            for i, (s, mut) in enumerate(td.fields) if mut and g.stv(s) == "i32"]
    if not opts:
        return None
    T, i, s = g.r.choice(opts)
    td = g.tmap[T]
    sv = _fresh(g, "al", ("ref", True, T))
    prev = _fresh(g, "pv", ("ref", True, T))
    acc = _fresh(g, "ac", "i32")
    cnt = g.new_counter()
    lab = g.newlab()
    get = "struct.get" if s not in ("i8", "i16") else "struct.get_u"
    cur = lambda: N(get, [T, str(i)], [N("local.get", [sv])])  # noqa: E731
    body = [N("local.set", [sv], [N("struct.new", [T], [g.leaf(g.stv(ss)) for ss, _ in td.fields])]),
            N("struct.set", [T, str(i)], [N("local.get", [sv]), N("i32.add", [], [cur(), N("i32.const", ["1"])])]),
            N("local.set", [acc], [N("i32.add", [], [N("local.get", [acc]), cur()])])]
    if g.r.random() < .5:
        body.append(N("local.set", [acc], [N("i32.add", [], [N("local.get", [acc]),
                                                             N("ref.eq", [], [N("local.get", [prev]), N("local.get", [sv])])])]))
        body.append(N("local.set", [prev], [N("local.get", [sv])]))
    if g.r.random() < .4:
        body.append(g.stmt(d + 1))
    outer = g.newlab()
    return N("block", [outer, ["result", "i32"]], [
        N("local.set", [cnt], [N("i32.const", ["0"])]), N("local.set", [acc], [N("i32.const", ["0"])]),
        _loop_frame(g, cnt, lab, body, g.r.randint(2, 4)), N("local.get", [acc])])


@row("alloc-loop(array)", "sh_alloc", .5, "any")
def _alloc_array(g, want, d):
    if want not in (None, "i32") or d > 2:
        return None
    opts = [(T, td.fields[0][0]) for T, td in g.tmap.items() if td.kind == "array" and td.fields[0][1]
            and g.stv(td.fields[0][0]) == "i32"]
    if not opts:
        return None
    T, s = g.r.choice(opts)
    sv = _fresh(g, "al", ("ref", True, T))
    acc = _fresh(g, "ac", "i32")
    cnt = g.new_counter()
    lab = g.newlab()
    get = "array.get" if s not in ("i8", "i16") else "array.get_u"
    n = g.r.randint(1, 3)
    idx = lambda: N("i32.const", [str(g.r.randrange(n))])  # noqa: E731
    k = g.r.randrange(n)
    cur = lambda: N(get, [T], [N("local.get", [sv]), N("i32.const", [str(k)])])  # noqa: E731
    body = [N("local.set", [sv], [N("array.new", [T], [g.leaf(g.stv(s)), N("i32.const", [str(n)])])]),
            N("array.set", [T], [N("local.get", [sv]), N("i32.const", [str(k)]), N("i32.add", [], [cur(), N("i32.const", ["1"])])]),
            N("local.set", [acc], [N("i32.add", [], [N("local.get", [acc]), cur()])])]
    del idx
    outer = g.newlab()
    return N("block", [outer, ["result", "i32"]], [
        N("local.set", [cnt], [N("i32.const", ["0"])]), N("local.set", [acc], [N("i32.const", ["0"])]),
        _loop_frame(g, cnt, lab, body, g.r.randint(2, 4)), N("local.get", [acc])])


# ---------------------------------------------------------------- sh_tinit
def _const_struct_text(m, T):
    td = m.tmap()[T]
    parts = []
    for k, (s, _) in enumerate(td.fields):
        if s in ("i8", "i16", "i32"):
            parts.append("(i32.const %d)" % (k + 5))
        elif s == "i64":
            parts.append("(i64.const %d)" % (k + 9))
        elif s == "f32":
            parts.append("(f32.const 1.5)")
        elif s == "f64":
            parts.append("(f64.const 2.5)")
        elif is_ref(s):
            parts.append("(ref.null %s)" % s[2] if s[2].startswith("$") else "(ref.null none)")
        else:
            return None
    return "(struct.new %s %s)" % (T, " ".join(parts))


def setup_tinit(r, m):
    """struct.new in a table initializer, in element-segment items and in
    immutable globals (typed tables are declared through m.elems text)"""
    if m.meta.get("focus") != "sh_tinit" and r.random() > .2:
        return
    structs = [t for t in m.types if t.kind == "struct" and not t.name.startswith("$a2s_") and t.fields]
    if not structs:
        return
    T = r.choice(structs).name
    text = _const_struct_text(m, T)
    if text is None:
        return
    T2 = r.choice([t.name for t in structs if t.name == T or t.sup == T] or [T])
    text2 = _const_struct_text(m, T2) or text
    ref = "(ref null %s)" % T
    m.meta["ttypes"] = {"$tg0": ("ref", True, T), "$tg1": ("ref", True, T)}
    m.meta["gtabs"] = [("$tg0", 2), ("$tg1", 3)]
    m.meta["gtab_struct"] = T
    m.elems.append("(table $tg0 2 2 %s %s)" % (ref, text))
    m.elems.append("(table $tg1 3 %s)" % ref)
    m.elems.append("(elem (table $tg1) (i32.const 0) %s (item %s) (item %s))" % (ref, text2, text))
    m.elems.append("(elem $pe %s (item %s))" % (ref, text2))
    m.meta["gelem"] = "$pe"
    m.globals.append(("$gs1", ("ref", False, T), False, text, None))
    m.globals.append(("$gs2", ("ref", False, T2), False, text2, None))


SETUPS.append(setup_tinit)


def _gtab(g):
    gt = g.m.meta.get("gtabs")
    if not gt:
        return None
    name, size = g.r.choice(gt)
    return name, size, g.m.meta["gtab_struct"]


def _gidx(g, size):
    return N("i32.const", [str(g.r.choice(list(range(size)) * 3 + [size, -1]))])


@row("tinit:struct.get", "sh_tinit", 1.2, "any")
def _tinit_get(g, want, d):
    gt = _gtab(g)
    if gt is None or want is None or is_ref(want) and False:
        return None
    name, size, T = gt
    td = g.tmap[T]
    opts = [(i, s) for i, (s, _) in enumerate(td.fields) if g.ctx.sub(g.stv(s), want)]
    if not opts:
        return None
    i, s = g.r.choice(opts)
    op = "struct.get" if s not in ("i8", "i16") else g.r.choice(["struct.get_s", "struct.get_u"])
    return N(op, [T, str(i)], [N("ref.as_non_null", [], [N("table.get", [name], [_gidx(g, size)])])])


@row("tinit:table.get", "sh_tinit", .6, "ref")
def _tinit_tget(g, want, d):
    gt = _gtab(g)
    if gt is None or not g.ctx.heap_sub(gt[2], want[2]):
        return None
    name, size, T = gt
    n = N("table.get", [name], [_gidx(g, size)])
    return n if want[1] else N("ref.as_non_null", [], [n])


@row("tinit:struct.set", "sh_tinit", .7, "void")
def _tinit_set(g, want, d):
    gt = _gtab(g)
    if gt is None:
        return None
    name, size, T = gt
    opts = [(i, s) for i, (s, mut) in enumerate(g.tmap[T].fields) if mut]
    if not opts:
        return None
    i, s = g.r.choice(opts)
    return N("struct.set", [T, str(i)], [N("ref.as_non_null", [], [N("table.get", [name], [_gidx(g, size)])]),
                                         g.expr(g.stv(s), d + 1)])


@row("tinit:table.set/init", "sh_tinit", .5, "void")
def _tinit_tset(g, want, d):
    gt = _gtab(g)
    if gt is None:
        return None
    name, size, T = gt
    if g.r.random() < .5:
        return N("table.set", [name], [_gidx(g, size), g.expr(("ref", True, T), d + 1)])
    return N("table.init", [name, g.m.meta["gelem"]], [_gidx(g, size), N("i32.const", ["0"]),
                                                      N("i32.const", [str(g.r.choice([0, 1, 1, 2]))])])


# ---------------------------------------------------------------- sh_nan
def _fleaf(g, ft, d):
    r = g.r
    x = r.random()
    vs = g.vars_sub(ft)
    if x < .5 and vs:
        return N("local.get", [r.choice(vs)])
    if x < .75:
        it = "i32" if r.random() < .6 else "i64"
        return N("%s.convert_%s_%s" % (ft, it, r.choice(["s", "u"])), [], [g.leafish(it, d + 1)])
    return g.const(ft)


def _fchain(g, ft, d, depth):
    r = g.r
    x = g.r.random()
    leaf = _fleaf(g, ft, d)
    if depth <= 0:
        return leaf
    inner = (lambda: _fchain(g, ft, d, depth - 1))
    if x < .22:
        return N(ft + ".abs", [], [N(ft + ".mul", [], [leaf, leaf.clone()])])
    if x < .44:
        return N(ft + ".abs", [], [N(ft + ".div", [], [leaf, leaf.clone()])])
    if x < .54:
        return N(ft + ".copysign", [], [N(ft + ".mul", [], [leaf, leaf.clone()]), inner()])
    if x < .62:
        return N(ft + ".copysign", [], [inner(), N(ft + ".div", [], [leaf, leaf.clone()])])
    if x < .72:
        return N(ft + ".neg", [], [inner()])
    if x < .84:
        return N(ft + "." + r.choice(["min", "max"]), [], [inner(), N(ft + ".div", [], [leaf, leaf.clone()])
                                                           if r.random() < .5 else g.const(ft)])
    if x < .92:
        return N(ft + "." + r.choice(["sqrt", "ceil", "floor", "trunc", "nearest"]), [], [inner()])
    return N(ft + "." + r.choice(["add", "sub", "mul", "div"]), [], [inner(), inner()])


@row("nan:reinterpret", "sh_nan", 1.0, "any")
def _nan_obs(g, want, d):
    if want not in ("i32", "i64"):
        return None
    ft = "f32" if want == "i32" else "f64"
    return N("%s.reinterpret_%s" % (want, ft), [], [_fchain(g, ft, d, g.r.randint(1, 2))])


@row("nan:cmp", "sh_nan", .3, "i32")
def _nan_cmp(g, want, d):
    ft = g.r.choice(["f32", "f64"])
    return N("%s.%s" % (ft, g.r.choice(["eq", "ne", "lt", "ge"])), [], [_fchain(g, ft, d, 1), _fchain(g, ft, d, 1)])


@row("nan:store/load", "sh_nan", .3, "void")
def _nan_store(g, want, d):
    ft = g.r.choice(["f32", "f64"])
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    return N(ft + ".store", [name] if len(g.m.memories) > 1 else [], [g.addr(at, d), _fchain(g, ft, d, 1)])


# ---------------------------------------------------------------- sh_edge
WIDTH = {"i32.store": 4, "i64.store": 8, "f32.store": 4, "f64.store": 8, "i32.store16": 2, "i64.store16": 2,
         "i64.store32": 4, "i32.store8": 1, "i64.store8": 1}


def _edge_addr(g, at, mem, w):
    r = g.r
    x = r.random()
    if x < .45:
        return N(at + ".const", [str(65536 - r.choice([1, 2, 3, 4, 5, 6, 7, 8, 9, 15, 16, 17]) + r.choice([0, 0, 1]) * 0)])
    if x < .85:
        return N(at + ".sub", [], [N(at + ".mul", [], [N("memory.size", [mem]), N(at + ".const", ["65536"])]),
                                   N(at + ".const", [str(r.choice([1, 2, 3, 4, 5, 8, 9, 16, 17]))])])
    vs = g.vars_sub(at)
    base = N("local.get", [r.choice(vs)]) if vs else g.expr(at, 1)
    return N(at + ".add", [], [N(at + ".and", [], [base, N(at + ".const", ["7"])]), N(at + ".const", [str(65528 + r.choice([0, 1, 3, 5]))])])


@row("edge:store", "sh_edge", 1.0, "void")
def _edge_store(g, want, d):
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    ops = [o for o in STORES if o[0] == "i" or "float" in g.features_on]
    op = g.r.choice(ops)
    w = STORES[op][1]
    imms = [name] if len(g.m.memories) > 1 or g.r.random() < .4 else []
    if w > 1 and g.r.random() < .8:
        imms.append("align=%d" % g.r.choice([1, 1, 2][:max(1, w.bit_length() - 1)]))
    return N(op, imms, [_edge_addr(g, at, name, w), g.expr(STORES[op][0], d + 1)])


@row("edge:load", "sh_edge", 1.0, "any")
def _edge_load(g, want, d):
    k = g.pick_mem()
    if k is None or want not in ("i32", "i64", "f32", "f64"):
        return None
    ops = [o for o, (t, w) in LOADS.items() if t == want]
    if not ops:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    op = g.r.choice(ops)
    w = LOADS[op][1]
    imms = [name] if len(g.m.memories) > 1 or g.r.random() < .4 else []
    if w > 1 and g.r.random() < .8:
        imms.append("align=%d" % g.r.choice([1, 1, 2][:max(1, w.bit_length() - 1)]))
    return N(op, imms, [_edge_addr(g, at, name, w)])


@row("edge:bulk", "sh_edge", 1.0, "void")
def _edge_bulk(g, want, d):
    r = g.r
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    n = r.choice([1, 2, 3, 4, 8, 8, 16, 16, 32])
    x = r.random()
    imms = [name] if len(g.m.memories) > 1 or r.random() < .4 else []
    if x < .45:
        val = N("i32.const", [str(r.choice([171, 0, 255, 1]))]) if r.random() < .8 else g.expr("i32", d + 1)
        return N("memory.fill", imms, [_edge_addr(g, at, name, n), val, N(at + ".const", [str(n)])])
    if x < .8:
        k2 = g.pick_mem()
        n2, a2 = g.m.memories[k2][0], g.m.memories[k2][1]
        imms2 = [name, n2] if len(g.m.memories) > 1 or r.random() < .4 else []
        lt = "i64" if at == "i64" and a2 == "i64" else "i32"
        if r.random() < .5:
            return N("memory.copy", imms2, [_edge_addr(g, at, name, n), g.addr(a2, d), N(lt + ".const", [str(n)])])
        return N("memory.copy", imms2, [g.addr(at, d), _edge_addr(g, a2, n2, n), N(lt + ".const", [str(n)])])
    dn = r.choice(g.m.data_names)
    return N("memory.init", [name, dn], [_edge_addr(g, at, name, n), N("i32.const", [str(r.choice([0, 0, 1, 2]))]),
                                         N("i32.const", [str(min(n, r.choice([1, 2, 4, 8])))])])


# ---------------------------------------------------------------- atomic + reinterpret (needs the "atomic" tag)
@row("atomic:reinterpret", "atomic", .6, "any")
def _atomic_reinterpret(g, want, d):
    if want not in ("f32", "f64") or not g.m.memories:
        return None
    it = "i32" if want == "f32" else "i64"
    k = g.pick_mem()
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    imms = [name] if len(g.m.memories) > 1 else []
    w = 4 if it == "i32" else 8
    addr = N(at + ".const", [str(w * g.r.choice([0, 1, 2, 5]))]) if g.r.random() < .7 else g.addr(at, d)
    return N("%s.reinterpret_%s" % (want, it), [], [N(it + ".atomic.load", imms, [addr])])
