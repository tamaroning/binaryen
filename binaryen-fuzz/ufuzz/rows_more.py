"""Rows for instruction families and combinations beyond the first table:
calls between generated functions, call_ref / tail calls, control flow in
value position (br / br_table / return / unreachable as operands), loops with
results, multi-value blocks and calls, more GC (array.new_data, array.fill,
array.init_data, extern.convert_any / any.convert_extern) and atomics.

Feature tags
  icall    call to an earlier function of the module
  callref  call_ref / call_indirect through $ft1
  ctl2     control flow in value position, loop with result, multi-value
  gc2      array.new_data and friends the snapshot handles per function
  tail     return_call*  (module-level unsupported in exwasm-0930: wide modules only)
  ext      extern.convert_any / any.convert_extern (wide modules only)
  arrfill  array.fill / array.init_data (wide modules only)
  arrelem  array.new_elem / array.init_elem (wide modules only; exwasm-0930: unsupported instruction)
  atomic   threads proposal loads / stores / rmw / cmpxchg (off by default)
"""
from table import ROWS, Row, _funcref, _tidx, row
from wmod import ATOMIC, N, is_ref


# ---------------------------------------------------------------- calls
def _earlier(g):
    fs = g.m.funcs
    try:
        lim = fs.index(g.f)
    except (ValueError, AttributeError):
        lim = len(fs)
    return fs[:lim]


@row("call(func)", "icall", 1.4, "anyv")
def _call_func(g, want, d):
    cs = []
    for c in _earlier(g):
        if len(c.results) > 1:
            continue
        if want is None or (c.results and g.ctx.sub(c.results[0], want)):
            cs.append(c)
    if not cs:
        return None
    c = g.r.choice(cs)
    n = N("call", [c.name], [g.expr(t, d + 1) for _, t in c.params])
    return N("drop", [], [n]) if want is None and c.results else n


@row("call_ref", "callref", .3, "anyv")
def _call_ref(g, want, d):
    if want not in (None, "i32", "i64") or not getattr(g.m, "helpers", None):
        return None
    ft, t = ("$ft1", "i64") if want == "i64" or (want is None and g.r.random() < .3) else ("$ft0", "i32")
    fr = N("ref.cast", ["(ref null %s)" % ft], [_funcref(g, d)])
    n = N("call_ref", [ft], [g.expr(t, d + 1), fr])
    return N("drop", [], [n]) if want is None else n


@row("call_indirect(i64)", "callref", .4, "any")
def _call_ind64(g, want, d):
    if want != "i64" or not getattr(g.m, "tables", None):
        return None
    return N("call_indirect", [g.pick_table(), ["type", "$ft1"]], [g.expr("i64", d + 1), _tidx(g, d)])


@row("return_call", "tail", .6, "void")
def _return_call(g, want, d):
    res = g.f.results
    cs = [c for c in _earlier(g) if c.results == res]
    if not cs:
        return None
    x = g.r.random()
    if x < .6 or res not in (["i32"], ["i64"]):
        c = g.r.choice(cs)
        n = N("return_call", [c.name], [g.expr(t, d + 1) for _, t in c.params])
    else:
        ft, t = ("$ft0", "i32") if res == ["i32"] else ("$ft1", "i64")
        if x < .8:
            n = N("return_call_indirect", [g.pick_table(), ["type", ft]], [g.expr(t, d + 1), _tidx(g, d)])
        else:
            n = N("return_call_ref", [ft], [g.expr(t, d + 1), N("ref.cast", ["(ref null %s)" % ft], [_funcref(g, d)])])
    return N("if", [], [g.cond(d + 1), N("then", [], [n])])


# ---------------------------------------------------------------- control flow in value position
@row("br(value)", "ctl2", .35, "any")
def _br_value(g, want, d):
    if not g.labels:
        return None
    l, t = g.r.choice(g.labels)
    return N("br", [l], [g.expr(t, d + 1)] if t is not None else [])


@row("br_table(value)", "ctl2", .3, "any")
def _brtable_value(g, want, d):
    if not g.labels:
        return None
    l0, t = g.r.choice(g.labels)
    same = [l for l, tt in g.labels if tt == t]
    targets = [g.r.choice(same) for _ in range(g.r.randint(1, 3))] + [l0]
    return N("br_table", targets, ([g.expr(t, d + 1)] if t is not None else []) + [g.expr("i32", d + 1)])


@row("return(value)", "ctl2", .25, "any")
def _return_value(g, want, d):
    return N("return", [], [g.expr(t, d + 1) for t in g.f.results])


@row("unreachable(value)", "ctl2", .2, "any")
def _unreachable_value(g, want, d):
    return N("unreachable")


@row("loop(result)", "ctl2", .45, "any")
def _loop_result(g, want, d):
    if want is None or d > 2:
        return None
    from wmod import vt_str
    cnt = g.new_counter()
    lab, outer = g.newlab(), g.newlab()
    n = g.r.randint(1, 3)
    body = [g.stmt(d + 1) for _ in range(g.r.randint(0, 2))]
    step = N("br_if", [lab], [N("i32.lt_u", [], [
        N("local.tee", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])]),
        N("i32.const", [str(n)])])])
    vt = vt_str(want)
    return N("block", [outer, ["result", vt]], [
        N("local.set", [cnt], [N("i32.const", ["0"])]),
        N("loop", [lab, ["result", vt]], body + [step, g.expr(want, d + 1)])])


def _fresh_pair(g):
    a = [v for v in g.vars_exact("i32") if v not in g.counters]
    b = [v for v in g.vars_exact("i64") if v not in g.counters]
    return (g.r.choice(a), g.r.choice(b)) if a and b else (None, None)


@row("multi-value block", "mv", .07, "void")
def _mv_block(g, want, d):
    a, b = _fresh_pair(g)
    if a is None:
        return None
    lab = g.newlab()
    return N("block", [], [N("block", [lab, ["result", "i32", "i64"]], [g.expr("i32", d + 1), g.expr("i64", d + 1)]),
                           N("local.set", [b]), N("local.set", [a])])


@row("multi-value call", "mv", .07, "void")
def _mv_call(g, want, d):
    a, b = _fresh_pair(g)
    if a is None or not any(c.name == "$th4" for c in g.m.funcs):
        return None
    return N("block", [], [N("call", ["$th4"], [g.expr("i32", d + 1)]), N("local.set", [b]), N("local.set", [a])])


# ---------------------------------------------------------------- GC
def _numeric_arrays(g, mut=False):
    return [(T, td.fields[0][0]) for T, td in g.tmap.items() if td.kind == "array"
            and td.fields[0][0] in ("i8", "i16", "i32", "i64", "f32", "f64") and (td.fields[0][1] or not mut)]


@row("array.new_data", "gc2", .3, "ref")
def _anew_data(g, want, d):
    cs = [T for T, _ in _numeric_arrays(g) if T in g.concrete_sub(want, "array")]
    if not cs or not getattr(g.m, "data_names", None):
        return None
    return N("array.new_data", [g.r.choice(cs), g.r.choice(g.m.data_names)],
             [N("i32.const", [str(g.r.choice([0, 0, 1, 2, 4]))]), N("i32.const", [str(g.r.choice([0, 1, 2, 3]))])])


@row("array.fill", "arrfill", .6, "void")
def _afill(g, want, d):
    opts = [(T, td.fields[0][0]) for T, td in g.tmap.items() if td.kind == "array" and td.fields[0][1]]
    if not opts:
        return None
    T, s = g.r.choice(opts)
    ln = g.const("i32", g.r.choice([0, 1, 2, 3])) if g.r.random() < .7 else g.expr("i32", d + 1)
    return N("array.fill", [T], [g.ref_operand(T, d + 1), g.index(d + 1), g.expr(g.stv(s), d + 1), ln])


@row("array.init_data", "arrfill", .5, "void")
def _ainit_data(g, want, d):
    opts = _numeric_arrays(g, mut=True)
    if not opts or not getattr(g.m, "data_names", None):
        return None
    T, _ = g.r.choice(opts)
    return N("array.init_data", [T, g.r.choice(g.m.data_names)],
             [g.ref_operand(T, d + 1), g.index(d + 1), N("i32.const", [str(g.r.choice([0, 0, 1, 3]))]),
              g.const("i32", g.r.choice([0, 1, 2, 3]))])


def _elem_arrays(g):
    return [T for T, td in g.tmap.items() if td.kind == "array" and td.fields[0][0] == ("ref", True, "func")]


@row("array.new_elem", "arrelem", .25, "ref")
def _anew_elem(g, want, d):
    cs = [T for T in _elem_arrays(g) if T in g.concrete_sub(want, "array")]
    names = getattr(g.m, "elem_ref_names", None)
    if not cs or not names:
        return None
    off = N("i32.const", [str(g.r.choice([0, 0, 1, 2, 3, 5]))]) if g.r.random() < .8 else g.index(d + 1)
    ln = N("i32.const", [str(g.r.choice([0, 1, 2, 2, 3, 4]))]) if g.r.random() < .8 else g.expr("i32", d + 1)
    return N("array.new_elem", [g.r.choice(cs), g.r.choice(names)], [off, ln])


@row("array.init_elem", "arrelem", .25, "void")
def _ainit_elem(g, want, d):
    cs = [T for T in _elem_arrays(g) if g.tmap[T].fields[0][1]]
    names = getattr(g.m, "elem_ref_names", None)
    if not cs or not names:
        return None
    T = g.r.choice(cs)
    ln = N("i32.const", [str(g.r.choice([0, 1, 2, 3]))]) if g.r.random() < .8 else g.expr("i32", d + 1)
    return N("array.init_elem", [T, g.r.choice(names)],
             [g.ref_operand(T, d + 1), g.index(d + 1), N("i32.const", [str(g.r.choice([0, 0, 1, 2, 4]))]), ln])


@row("extern.roundtrip", "ext", .6, "ref")
def _ext_roundtrip(g, want, d):
    h = want[2]
    anyref = ("ref", True, "any")
    if not g.ctx.heap_sub(h, "any"):
        return None
    e = N("any.convert_extern", [], [N("extern.convert_any", [], [g.expr(anyref, d + 1)])])
    if h == "any":
        return e if want[1] else N("ref.as_non_null", [], [e])
    from wmod import vt_str
    return N("ref.cast", [vt_str(want)], [e])


@row("extern.is_null", "ext", .4, "i32")
def _ext_isnull(g, want, d):
    return N("ref.is_null", [], [N("extern.convert_any", [], [g.expr(("ref", True, "any"), d + 1)])])


# ---------------------------------------------------------------- atomics (feature tag "atomic", off by default)
def _atomic_gen(op, ps, r, w):
    def gen(g, want, d):
        k = g.pick_mem()
        if k is None:
            return None
        name, at = g.m.memories[k][0], g.m.memories[k][1]
        imms = [name] if len(g.m.memories) > 1 or g.r.random() < .4 else []
        off = g.r.choice([0, 0, w, 2 * w, 8, 0xfff8, 0xfffc])
        if off:
            imms.append("offset=%d" % off)
        if op.startswith("memory."):
            addr = g.addr(at, d)
        elif g.r.random() < .7:
            addr = N(at + ".const", [str(w * g.r.choice([0, 1, 2, 3, 8, 100, 8190]))])
        else:
            addr = g.addr(at, d)
        return N(op, imms, [addr] + [g.expr(p, d + 1) for p in ps])
    return gen


for _op, (_ps, _r, _w) in sorted(ATOMIC.items()):
    ROWS.append(Row(_op, "atomic", .25, _r if _r else "void", _atomic_gen(_op, _ps, _r, _w)))


@row("atomic.fence", "atomic", .3, "void")
def _fence(g, want, d):
    return N("atomic.fence")


# ---------------------------------------------------------------- patterns the passes look for
# (added after the first smoke run: heap-store-optimization, optimize-casts, pick-load-signs and
# rse never changed a function)
def _fresh_local(g, t):
    v = "$px%d" % len(g.f.locals)
    g.f.locals.append((v, t))
    g.fvars[v] = t
    g.counters.add(v)
    return v


@row("alloc then store", "gc2", .5, "void")
def _alloc_store(g, want, d):
    opts = [(T, i, s) for T, td in g.tmap.items() if td.kind == "struct" and T not in g.a2s
            for i, (s, mut) in enumerate(td.fields) if mut]
    if not opts:
        return None
    T, i, s = g.r.choice(opts)
    v = _fresh_local(g, ("ref", True, T))
    td = g.tmap[T]
    mid = [g.stmt(d + 1)] if g.r.random() < .3 else []
    return N("block", [], [N("local.set", [v], [N("struct.new", [T], [g.leaf(g.stv(ss)) for ss, _ in td.fields])])]
             + mid + [N("struct.set", [T, str(i)], [N("local.get", [v]), g.expr(g.stv(s), d + 1)])])


@row("cast then use", "gc2", .5, "void")
def _cast_use(g, want, d):
    vs = [(v, t) for v, t in g.f.params + g.f.locals if is_ref(t) and t[2].startswith("$") and v not in g.counters]
    if not vs:
        return None
    v, t = g.r.choice(vs)
    tgt = ("ref", False, t[2])
    td = g.tmap.get(t[2])
    use = N("drop", [], [N("local.get", [v])])
    if td is not None and td.kind == "struct" and td.fields:
        s = td.fields[0][0]
        op = "struct.get" if s not in ("i8", "i16") else "struct.get_u"
        use = N("drop", [], [N(op, [t[2], "0"], [N("local.get", [v])])])
    from wmod import vt_str
    return N("block", [], [N("drop", [], [N("ref.cast", [vt_str(tgt)], [N("local.get", [v])])]), use])


@row("load with extension", "mem", .6, "i32")
def _load_ext(g, want, d):
    k = g.pick_mem()
    if k is None or g.m.memories[k][1] != "i32":
        return None
    name = g.m.memories[k][0]
    imms = [name] if len(g.m.memories) > 1 else []
    a = g.addr("i32", d)
    x = g.r.random()
    if x < .35:
        return N("i32.extend8_s", [], [N("i32.load8_u", imms, [a])])
    if x < .6:
        return N("i32.and", [], [N("i32.load8_s", imms, [a]), N("i32.const", ["255"])])
    if x < .8:
        return N("i32.shr_s", [], [N("i32.shl", [], [N("i32.load16_u", imms, [a]), N("i32.const", ["16"])]), N("i32.const", ["16"])])
    return N("i32.and", [], [N("i32.load16_s", imms, [a]), N("i32.const", ["65535"])])


@row("set same twice", "ctl2", .4, "void")
def _set_twice(g, want, d):
    vs = [v for v in g.vars_exact("i32") if v not in g.counters]
    if not vs:
        return None
    v = g.r.choice(vs)
    c = g.const("i32")
    mid = [g.stmt(d + 1)] if g.r.random() < .4 else []
    return N("block", [], [N("local.set", [v], [c])] + mid + [N("local.set", [v], [c.clone()])])
