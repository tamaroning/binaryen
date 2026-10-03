"""The instruction table of the ufuzz generator.

Every row is `Row(name, feat, weight, out, gen)`:
  name   pattern name (also the key of the adaptive weights and of the
         per-pattern unsupported statistics)
  feat   feature tag; `FEATURES_ON` decides which tags are generated
  weight base weight
  out    what the row produces: "i32", "i64", "ref", "void"
         (or a new value type such as "f32" once it is enabled)
  gen    gen(g, want, d) -> N or None.  `want` is the wanted value type
         (None for "void"); returning None means "not applicable here", and
         the generator picks another row.

Operands are always built with `g.expr(type, d + 1)` (or `g.stmt`), so the
AST is type-correct by construction and mutations can rely on `N.t`.

Adding a feature (floats, bulk memory, tables, exceptions, SIMD):
  1. add its value type to `VALTYPES_ON` if it has one (e.g. "f32"), and
     leaves for it in `Gen.leaf` (constants, locals);
  2. add rows here with a new feat tag (numeric ops can use `num_row`, the
     typer in wmod.py already knows their signatures from `NUM`);
  3. put the tag into `FEATURES_ON` (or `config.json` "features") when the
     exwasm snapshot supports it.
"""
from wmod import N, NUM, is_ref

FEATURES_ON = {"int", "mem", "mem64", "multimem", "memgrow", "global", "ctl", "loop", "call",
               "gc", "cast", "i31", "select", "trap", "bulk", "float", "table", "data", "exn",
               # SIMD / relaxed SIMD, calls between generated functions, call_ref and typed tables,
               # control-flow in value position, more GC, and the bug-shape rows (rows_shapes.py)
               "simd", "relaxed", "icall", "callref", "ctl2", "gc2", "sh_dup", "sh_noret", "sh_alloc",
               "sh_tinit", "sh_nan", "sh_edge", "tail", "ext", "arrfill", "arrelem"}
VALTYPES_ON = ["i32", "i64", "f32", "f64"]
# Rows the exwasm-0930 snapshot rejects for the whole module (return_call*,
# extern.convert_any / any.convert_extern, array.fill / array.init_data; array.new_elem / array.init_elem are assumed to be
# rejected the same way: the snapshot reports them unsupported, tag "arrelem"):
# only modules flagged "wide" contain them, and those go through the
# crash / validity / V8 oracle only.
WIDE_TAGS = {"mv", "rec"}
# atomics: unsupported by exwasm-0930 as well.  Off unless config.json "features"
# lists "atomic" (all modules; for a snapshot that derives them) or "atomic_wide"
# (wide modules only).
OPTIONAL_TAGS = {"atomic"}
# row families that can be boosted for a whole module (Gen.focus)
FOCUS_TAGS = {"simd", "relaxed", "icall", "callref", "ctl2", "gc2", "float", "table", "bulk", "exn", "loop",
              "cast", "mem", "memgrow", "data", "select", "sh_dup", "sh_noret", "sh_alloc", "sh_tinit",
              "sh_nan", "sh_edge"}

_CFG = {"t": 0.0, "v": {}}


def _config():
    import time
    if time.time() - _CFG["t"] > 5:
        _CFG["t"] = time.time()
        try:
            import json
            import os
            with open(os.environ.get("UFUZZ_CONFIG") or os.path.join(os.path.dirname(os.path.abspath(__file__)), "config.json")) as f:
                _CFG["v"] = json.load(f)
        except (OSError, ValueError):
            _CFG["v"] = {}
        import os
        if os.environ.get("UFUZZ_FEATURES_ADD"):  # tests: comma-separated tags
            _CFG["v"] = dict(_CFG["v"], features_add=os.environ["UFUZZ_FEATURES_ADD"].split(","))
    return _CFG["v"]


def features_for(m):
    """row feature tags enabled for module `m`"""
    cf = _config()
    on = set(FEATURES_ON)
    # config "wide_tags" lists the tags kept out of ordinary modules (default: multi-value, rec groups;
    # exwasm-0930: also tail, ext, arrfill, arrelem)
    wide_tags = set(cf.get("wide_tags") or WIDE_TAGS)
    on -= wide_tags
    extra = set(cf.get("features_add") or [])
    on |= (extra & OPTIONAL_TAGS)
    on |= (extra - OPTIONAL_TAGS - {"atomic_wide"})
    if m.meta.get("wide"):
        on |= wide_tags
        if "atomic_wide" in extra:
            on.add("atomic")
    if m.meta.get("noeh"):
        on.discard("exn")
    on -= set(cf.get("features_remove") or [])
    return on


SETUPS = []


def module_setup(r, m):
    """module-level parts some rows need (typed tables, ...), registered by the row modules"""
    for fn in SETUPS:
        fn(r, m)

B32 = [0, 1, 2, -1, -2, 3, 4, 7, 8, 15, 16, 31, 32, 63, 64, 0x7f, 0x80, 0xff, 0x100, 0x7fff, 0x8000,
       0xffff, 0x10000, 0x7fffffff, -0x80000000, -0x7fffffff, 0xfffc, 0xfffd, 0xfffe, 0x3fffffff,
       0x40000000, -129, -32769, 100, -100]
B64 = [0, 1, 2, -1, -2, 3, 8, 63, 64, 0x7f, 0x80, 0xff, 0x7fffffff, 0x80000000, 0xffffffff,
       0x100000000, 0x7fffffffffffffff, -0x8000000000000000, -0x7fffffffffffffff, 0x1ff, -4]


class Row:
    def __init__(self, name, feat, weight, out, gen):
        self.name, self.feat, self.weight, self.out, self.gen = name, feat, weight, out, gen


def wrap(v, t):
    n = 32 if t == "i32" else 64
    return ((v + (1 << (n - 1))) % (1 << n)) - (1 << (n - 1))


def num_row(op, weight, feat="int"):
    ps, r = NUM[op]

    def gen(g, want, d):
        return N(op, [], [g.expr(p, d + 1) for p in ps])
    return Row(op, feat, weight, r, gen)


ROWS = []


def row(name, feat, weight, out):
    def deco(fn):
        ROWS.append(Row(name, feat, weight, out, fn))
        return fn
    return deco


# ---- integer arithmetic (one row per opcode, from the shared signature table)
for _t in ("i32", "i64"):
    for _o, _w in (("add", 3), ("sub", 2), ("mul", 1), ("div_s", .4), ("div_u", .4), ("rem_s", .4),
                   ("rem_u", .4), ("and", 2), ("or", 1.5), ("xor", 1.5), ("shl", 1), ("shr_s", 1),
                   ("shr_u", 1), ("rotl", .3), ("rotr", .3), ("clz", .2), ("ctz", .2), ("popcnt", .2),
                   ("extend8_s", .5), ("extend16_s", .5)):
        ROWS.append(num_row("%s.%s" % (_t, _o), _w))
    for _o in ("eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u"):
        ROWS.append(num_row("%s.%s" % (_t, _o), .6 if _t == "i32" else .3))
    ROWS.append(num_row("%s.eqz" % _t, 1))
ROWS.append(num_row("i64.extend32_s", .3))
ROWS.append(num_row("i32.wrap_i64", 1.5))
ROWS.append(num_row("i64.extend_i32_s", 1))
ROWS.append(num_row("i64.extend_i32_u", 1))

# ---- floating point (one row per opcode from the shared signature table)
for _op, (_ps, _r) in sorted(NUM.items()):
    if _op[0] == "f" or any(x[0] == "f" for x in _ps):
        _w = .5 if "reinterpret" in _op or "trunc_" in _op or "convert" in _op else 1
        ROWS.append(num_row(_op, _w, "float"))


@row("const", "int", 3, "any")
def _const(g, want, d):
    if want not in ("i32", "i64", "f32", "f64"):
        return None
    return g.const(want)


@row("local.get", "int", 5, "any")
def _lget(g, want, d):
    vs = g.vars_sub(want)
    return N("local.get", [g.r.choice(vs)]) if vs else None


@row("local.tee", "int", 1, "any")
def _ltee(g, want, d):
    vs = [v for v in g.vars_exact(want) if v not in g.counters]
    if not vs:
        return None
    v = g.r.choice(vs)
    return N("local.tee", [v], [g.expr(g.vtype(v), d + 1)])


@row("x++", "int", .6, "any")
def _incr(g, want, d):
    if want not in ("i32", "i64"):
        return None
    vs = [v for v in g.vars_exact(want) if v not in g.counters]
    if not vs:
        return None
    v = g.r.choice(vs)
    return N("local.tee", [v], [N(want + ".add", [], [N("local.get", [v]), g.const(want, 1)])])


@row("global.get", "global", 1.2, "any")
def _gget(g, want, d):
    gs = [n for n, t, *_ in g.m.globals if t == want or (is_ref(t) and is_ref(want) and g.ctx.sub(t, want))]
    return N("global.get", [g.r.choice(gs)]) if gs else None


@row("global.set", "global", 1, "void")
def _gset(g, want, d):
    gs = [(n, t) for n, t, mut, *_ in g.m.globals if mut]
    if not gs:
        return None
    n, t = g.r.choice(gs)
    return N("global.set", [n], [g.expr(t, d + 1)])


@row("local.set", "int", 3, "void")
def _lset(g, want, d):
    vs = [v for v in g.allvars() if v not in g.counters]
    v = g.r.choice(vs)
    return N("local.set", [v], [g.expr(g.vtype(v), d + 1)])


# ---- memory
def _memop(g, d, table, want, store):
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    ops = [o for o, (t, w) in table.items() if (want is None or t == want) and (o[0] == "i" or "float" in g.features_on)]
    if not ops:
        return None
    op = g.r.choice(ops)
    imms = [name] if len(g.m.memories) > 1 or g.r.random() < .5 else []
    off = g.r.choice([0, 0, 0, 1, 2, 4, 8, 0xfff0, 0xfffc, 0xffff, 0x10000, 0x7fffffff, 0xfffffffc])
    if off:
        imms.append("offset=%d" % off)
    w = table[op][1]
    if w > 1 and g.r.random() < .3:
        imms.append("align=1")
    kids = [g.addr(at, d)]
    if store:
        kids.append(g.expr(table[op][0], d + 1))
    return N(op, imms, kids)


@row("load", "mem", 2, "int")
def _load(g, want, d):
    from wmod import LOADS
    return _memop(g, d, LOADS, want, False)


@row("store", "mem", 2, "void")
def _store(g, want, d):
    from wmod import STORES
    return _memop(g, d, STORES, None, True)


@row("memory.size", "memgrow", .3, "int")
def _msize(g, want, d):
    ks = [k for k, mm in enumerate(g.m.memories) if mm[1] == want]
    if not ks:
        return None
    k = g.r.choice(ks)
    return N("memory.size", [g.m.memories[k][0]])


@row("memory.grow", "memgrow", .5, "int")
def _mgrow(g, want, d):
    ks = [k for k, mm in enumerate(g.m.memories) if mm[1] == want]
    if not ks:
        return None
    k = g.r.choice(ks)
    at = g.m.memories[k][1]
    delta = g.const(at, g.r.choice([0, 1, 1, 2])) if g.r.random() < .8 else g.expr(at, d + 1)
    return N("memory.grow", [g.m.memories[k][0]], [delta])


# ---- bulk memory (exwasm unrolls a symbolic length up to its bound)
def _len(g, at, d):
    x = g.r.random()
    if x < .45:
        return g.const(at, g.r.choice([0, 1, 2, 3, 4, 7, 8]))
    if x < .85:
        # symbolic but small: proved in full within the unrolling bound
        return N(at + ".and", [], [g.expr(at, d + 1), g.const(at, g.r.choice([3, 7, 15]))])
    return g.expr(at, d + 1)


@row("memory.fill", "bulk", .4, "void")
def _mfill(g, want, d):
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    imms = [name] if len(g.m.memories) > 1 or g.r.random() < .5 else []
    return N("memory.fill", imms, [g.addr(at, d), g.expr("i32", d + 1), _len(g, at, d)])


@row("memory.copy", "bulk", .4, "void")
def _mcopy(g, want, d):
    k1, k2 = g.pick_mem(), g.pick_mem()
    if k1 is None:
        return None
    (n1, a1), (n2, a2) = g.m.memories[k1][:2], g.m.memories[k2][:2]
    imms = [n1, n2] if len(g.m.memories) > 1 or g.r.random() < .5 else []
    lt = "i64" if a1 == "i64" and a2 == "i64" else "i32"
    return N("memory.copy", imms, [g.addr(a1, d), g.addr(a2, d), _len(g, lt, d)])


# ---- calls to imports (integer signatures only)
@row("call", "call", .5, "any")
def _call(g, want, d):
    cs = [i for i in g.m.imports if (i[4] == [want] if want else not i[4])]
    if not cs:
        return None
    fn, _, _, ps, rs = g.r.choice(cs)
    return N("call", [fn], [g.expr(p, d + 1) for p in ps])


# ---- control
@row("select", "select", 1, "any")
def _select(g, want, d):
    if want is None:
        return None
    imms = [["result", _vts(want)]] if is_ref(want) or g.r.random() < .3 else []
    return N("select", imms, [g.expr(want, d + 1), g.expr(want, d + 1), g.cond(d + 1)])


def _vts(t):
    from wmod import vt_str
    return vt_str(t)


@row("if", "ctl", 1.2, "anyv")
def _if(g, want, d):
    res = [["result", _vts(want)]] if want is not None else []
    lab = g.newlab()
    g.labels.append((lab, want))
    th = g.body(want, d + 1)
    el = g.body(want, d + 1) if (want is not None or g.r.random() < .6) else None
    g.labels.pop()
    kids = [g.cond(d + 1), N("then", [], th)]
    if el is not None:
        kids.append(N("else", [], el))
    return N("if", [lab] + res, kids)


@row("block+br_if", "ctl", 1.2, "anyv")
def _block(g, want, d):
    lab = g.newlab()
    res = [["result", _vts(want)]] if want is not None else []
    g.labels.append((lab, want))
    body = g.body(want, d + 1)
    g.labels.pop()
    return N("block", [lab] + res, body)


@row("br_if", "ctl", 1.5, "void")
def _brif(g, want, d):
    ls = [(l, t) for l, t in g.labels if t is None or not is_ref(t) or g.r.random() < .5]
    if not ls:
        return None
    l, t = g.r.choice(ls)
    kids = ([g.expr(t, d + 1)] if t is not None else []) + [g.cond(d + 1)]
    n = N("br_if", [l], kids)
    return n if t is None else N("drop", [], [n])


@row("br", "ctl", .4, "void")
def _br(g, want, d):
    if not g.labels:
        return None
    l, t = g.r.choice(g.labels)
    n = N("br", [l], [g.expr(t, d + 1)] if t is not None else [])
    return N("if", [], [g.cond(d + 1), N("then", [], [n])])


@row("br_table", "ctl", .5, "void")
def _brtable(g, want, d):
    ls = [l for l, t in g.labels if t is None]
    if not ls:
        return None
    targets = [g.r.choice(ls) for _ in range(g.r.randint(1, 4))]
    return N("br_table", targets, [g.expr("i32", d + 1)])


@row("return", "ctl", .4, "void")
def _return(g, want, d):
    rs = g.f.results
    return N("if", [], [g.cond(d + 1), N("then", [], [N("return", [], [g.expr(t, d + 1) for t in rs])])])


@row("loop(const)", "loop", .5, "void")
def _loop(g, want, d):
    if d > 2:
        return None
    cnt = g.new_counter()
    lab = g.newlab()
    n = g.r.randint(1, 3)
    g.labels.append((lab + "_x", None))
    body = [g.stmt(d + 1) for _ in range(g.r.randint(1, 2))]
    g.labels.pop()
    step = N("br_if", [lab], [N("i32.lt_u", [], [
        N("local.tee", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])]),
        N("i32.const", [str(n)])])])
    return N("block", [lab + "_x"], [N("local.set", [cnt], [N("i32.const", ["0"])]),
                                     N("loop", [lab], body + [step])])


@row("loop(sym)", "loop", .35, "void")
def _loop_sym(g, want, d):
    """a counted loop whose trip count is a value of the function (masked
    small most of the time, so that exwasm proves it in full)"""
    if d > 2:
        return None
    cnt = g.new_counter()
    lab = g.newlab()
    lim = g.expr("i32", d + 1)
    if g.r.random() < .8:
        lim = N("i32.and", [], [lim, N("i32.const", [str(g.r.choice([3, 7, 15]))])])
    g.labels.append((lab + "_x", None))
    body = [g.stmt(d + 1) for _ in range(g.r.randint(1, 2))]
    g.labels.pop()
    step = N("br_if", [lab], [N("i32.lt_u", [], [
        N("local.tee", [cnt], [N("i32.add", [], [N("local.get", [cnt]), N("i32.const", ["1"])])]),
        N("local.get", [cnt + "_n"])])])
    g.f.locals.append((cnt + "_n", "i32"))
    g.fvars[cnt + "_n"] = "i32"
    g.counters.add(cnt + "_n")
    return N("block", [lab + "_x"], [N("local.set", [cnt], [N("i32.const", ["0"])]),
                                     N("local.set", [cnt + "_n"], [lim]),
                                     N("loop", [lab], body + [step])])


@row("trap-arm", "trap", .4, "void")
def _traparm(g, want, d):
    return N("if", [], [g.cond(d + 1), N("then", [], [N("unreachable")])])


@row("drop", "int", 1, "void")
def _drop(g, want, d):
    t = g.r.choice(g.value_types())
    return N("drop", [], [g.expr(t, d + 1)])


# ---- GC
@row("struct.new", "gc", 2, "ref")
def _snew(g, want, d):
    cs = g.concrete_sub(want, "struct")
    if not cs:
        return None
    T = g.r.choice(cs)
    td = g.tmap[T]
    if g.r.random() < .15 and g.defaultable(td):
        return N("struct.new_default", [T])
    return N("struct.new", [T], [g.expr(g.stv(s), d + 1) for s, _ in td.fields])


@row("array.new", "gc", 1.2, "ref")
def _anew(g, want, d):
    cs = g.concrete_sub(want, "array")
    if not cs:
        return None
    T = g.r.choice(cs)
    s, _ = g.tmap[T].fields[0]
    x = g.r.random()
    n = g.r.randint(0, 3)
    if x < .4:
        return N("array.new_fixed", [T, str(n)], [g.expr(g.stv(s), d + 1) for _ in range(n)])
    if x < .7 or not g.defaultable_st(s):
        return N("array.new", [T], [g.expr(g.stv(s), d + 1), N("i32.const", [str(n)])])
    return N("array.new_default", [T], [N("i32.const", [str(n)])])


@row("struct.get", "gc", 2.5, "any")
def _sget(g, want, d):
    if want is None:
        return None
    opts = []
    for T, td in g.tmap.items():
        if td.kind != "struct" or T in g.a2s:
            continue
        for i, (s, _) in enumerate(td.fields):
            if g.ctx.sub(g.stv(s), want):
                opts.append((T, i, s))
    if not opts:
        return None
    T, i, s = g.r.choice(opts)
    op = "struct.get" if s not in ("i8", "i16") else g.r.choice(["struct.get_s", "struct.get_u"])
    return N(op, [T, str(i)], [g.ref_operand(T, d + 1)])


@row("struct.set", "gc", 2, "void")
def _sset(g, want, d):
    opts = [(T, i, s) for T, td in g.tmap.items() if td.kind == "struct" and T not in g.a2s
            for i, (s, mut) in enumerate(td.fields) if mut]
    if not opts:
        return None
    T, i, s = g.r.choice(opts)
    return N("struct.set", [T, str(i)], [g.ref_operand(T, d + 1), g.expr(g.stv(s), d + 1)])


@row("array.get", "gc", 1.5, "any")
def _aget(g, want, d):
    if want is None:
        return None
    opts = [(T, td.fields[0][0]) for T, td in g.tmap.items() if td.kind == "array"
            and g.ctx.sub(g.stv(td.fields[0][0]), want)]
    if not opts:
        return None
    T, s = g.r.choice(opts)
    op = "array.get" if s not in ("i8", "i16") else g.r.choice(["array.get_s", "array.get_u"])
    return N(op, [T], [g.ref_operand(T, d + 1), g.index(d + 1)])


@row("array.set", "gc", 1.2, "void")
def _aset(g, want, d):
    opts = [(T, td.fields[0][0]) for T, td in g.tmap.items() if td.kind == "array" and td.fields[0][1]]
    if not opts:
        return None
    T, s = g.r.choice(opts)
    return N("array.set", [T], [g.ref_operand(T, d + 1), g.index(d + 1), g.expr(g.stv(s), d + 1)])


@row("array.copy", "gc", .7, "void")
def _acopy(g, want, d):
    arrs = [(T, td.fields[0]) for T, td in g.tmap.items() if td.kind == "array"]
    pairs = [(D, S) for D, (ds, dm) in arrs if dm for S, (ss, _) in arrs if ss == ds]
    if not pairs:
        return None
    D, S = g.r.choice(pairs)
    n = g.const("i32", g.r.choice([0, 1, 1, 2, 3])) if g.r.random() < .7 else g.expr("i32", d + 1)
    return N("array.copy", [D, S], [g.ref_operand(D, d + 1), g.index(d + 1), g.ref_operand(S, d + 1), g.index(d + 1), n])


@row("array.len", "gc", .6, "i32")
def _alen(g, want, d):
    return N("array.len", [], [g.expr(("ref", True, "array"), d + 1)])


@row("ref.null", "gc", 1, "ref")
def _rnull(g, want, d):
    if not want[1]:
        return None
    return N("ref.null", [g.null_heap(want[2])])


@row("ref.is_null", "gc", .8, "i32")
def _risnull(g, want, d):
    return N("ref.is_null", [], [g.expr(g.any_ref(), d + 1)])


@row("ref.as_non_null", "gc", .6, "ref")
def _rasnn(g, want, d):
    return N("ref.as_non_null", [], [g.expr(("ref", True, want[2]), d + 1)])


@row("ref.eq", "gc", .8, "i32")
def _req(g, want, d):
    t = ("ref", True, g.r.choice(["eq"] + [T for T in g.structs()]))
    return N("ref.eq", [], [g.expr(t, d + 1), g.expr(t if g.r.random() < .5 else ("ref", True, "eq"), d + 1)])


@row("ref.i31", "i31", .6, "ref")
def _ri31(g, want, d):
    if not g.ctx.heap_sub("i31", want[2]):
        return None
    return N("ref.i31", [], [g.expr("i32", d + 1)])


@row("i31.get", "i31", .5, "i32")
def _i31get(g, want, d):
    return N(g.r.choice(["i31.get_s", "i31.get_u"]), [], [g.expr(("ref", True, "i31"), d + 1)])


@row("ref.test", "cast", 1.2, "i32")
def _rtest(g, want, d):
    tgt = g.cast_target()
    src = g.up(tgt[2])
    return N("ref.test", [_vts(tgt)], [g.expr(("ref", True, src), d + 1)])


@row("ref.cast", "cast", 1.2, "ref")
def _rcast(g, want, d):
    subs = g.heaps_sub(want[2])
    if not subs:
        return None
    h = g.r.choice(subs)
    t = ("ref", want[1] and g.r.random() < .5, h)
    return N("ref.cast", [_vts(t)], [g.expr(("ref", True, g.up(h)), d + 1)])


@row("br_on_cast", "cast", .8, "ref")
def _broncast(g, want, d):
    # (block $l (result want) (br_on_cast[_fail] $l T1 T2 e) <fallthrough>)
    subs = [h for h in g.heaps_sub(want[2]) if h.startswith("$")]
    if not subs:
        return None
    h = g.r.choice(subs)
    t1 = ("ref", True, g.up(h))
    if not g.ctx.heap_sub(t1[2], want[2]) and g.r.random() < .5:
        t1 = ("ref", True, want[2])
    t2 = ("ref", g.r.random() < .3, h)
    lab = g.newlab()
    fail = g.r.random() < .4
    if fail and not g.ctx.sub(t1, want):
        return None
    if not fail and not g.ctx.sub(t2, want):
        return None
    g.labels.append((lab, want))
    e = g.expr(t1, d + 1)
    rest = g.expr(want, d + 1)
    g.labels.pop()
    return N("block", [lab, ["result", _vts(want)]],
             [N("drop", [], [N("br_on_cast_fail" if fail else "br_on_cast", [lab, _vts(t1), _vts(t2)], [e])]),
              rest])


@row("br_on_null", "cast", .6, "any")
def _bronnull(g, want, d):
    # (block $l (result want) (use (br_on_null $l0 e)) ...) where $l0 carries nothing
    if want is None or is_ref(want) or want == "v128":
        return None
    lab = g.newlab()
    t = g.any_ref()
    g.labels.append((lab, None))
    inner = N("br_on_null", [lab], [g.expr(t, d + 1)])
    g.labels.pop()
    use = g.use_ref(inner, ("ref", False, t[2]), want, d)
    return N("block", [lab + "_o", ["result", _vts(want)]],
             [N("block", [lab], [N("br", [lab + "_o"], [use])]), g.expr(want, d + 1)])


@row("br_on_non_null", "cast", .6, "ref")
def _bronnn(g, want, d):
    lab = g.newlab()
    g.labels.append((lab, want))
    e = g.expr(("ref", True, want[2]), d + 1)
    rest = g.expr(want, d + 1)
    g.labels.pop()
    return N("block", [lab, ["result", _vts(want)]], [N("br_on_non_null", [lab], [e]), rest])


# ---- tables, passive segments, exceptions (module parts come from base_module)
def _tidx(g, d, n=8):
    if g.r.random() < .75:
        return N("i32.const", [str(g.r.choice(range(n + 2)))])
    return g.expr("i32", d + 1)


def _funcref(g, d):
    x = g.r.random()
    if x < .55:
        return N("ref.func", [g.r.choice(g.m.helpers)])
    if x < .75:
        return N("ref.null", ["nofunc"])
    return N("table.get", [g.pick_table()], [_tidx(g, d + 1)])


@row("table.size", "table", .3, "i32")
def _tsize(g, want, d):
    return N("table.size", [g.pick_table()])


@row("table.get", "table", .4, "ref")
def _tget(g, want, d):
    if want != ("ref", True, "func"):
        return None
    return N("table.get", [g.pick_table()], [_tidx(g, d)])


@row("ref.func", "table", .4, "ref")
def _rfunc(g, want, d):
    if want[2] not in ("func",):
        return None
    return N("ref.func", [g.r.choice(g.m.helpers)])


@row("table.set", "table", .6, "void")
def _tset(g, want, d):
    return N("table.set", [g.pick_table()], [_tidx(g, d), _funcref(g, d)])


@row("table.grow", "table", .25, "i32")
def _tgrow(g, want, d):
    return N("table.grow", [g.pick_table()], [_funcref(g, d), N("i32.const", [str(g.r.choice([0, 1, 2]))])])


@row("table.fill", "table", .3, "void")
def _tfill(g, want, d):
    return N("table.fill", [g.pick_table()], [_tidx(g, d), _funcref(g, d), _len(g, "i32", d)])


@row("table.copy", "table", .3, "void")
def _tcopy(g, want, d):
    return N("table.copy", [g.pick_table(), g.pick_table()], [_tidx(g, d), _tidx(g, d), _len(g, "i32", d)])


@row("table.init", "table", .35, "void")
def _tinit(g, want, d):
    e = g.r.choice(g.m.elem_names)
    return N("table.init", [g.pick_table(), e], [_tidx(g, d), _tidx(g, d, 3), _len(g, "i32", d)])


@row("elem.drop", "table", .15, "void")
def _edrop(g, want, d):
    return N("elem.drop", [g.r.choice(g.m.elem_names)])


@row("call_indirect", "table", .6, "any")
def _callind(g, want, d):
    if want not in ("i32", None):
        return None
    n = N("call_indirect", [g.pick_table(), ["type", "$ft0"]], [g.expr("i32", d + 1), _tidx(g, d)])
    return n if want is not None else N("drop", [], [n])


@row("memory.init", "data", .4, "void")
def _minit(g, want, d):
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    return N("memory.init", [name, g.r.choice(g.m.data_names)],
             [g.addr(at, d), _tidx(g, d, 4), _len(g, "i32", d)])


@row("data.drop", "data", .15, "void")
def _ddrop(g, want, d):
    return N("data.drop", [g.r.choice(g.m.data_names)])


@row("throw", "exn", .5, "void")
def _throw(g, want, d):
    tag, ps = g.r.choice(g.m.tags)
    n = N("throw", [tag], [g.expr(p, d + 1) for p in ps])
    return N("if", [], [g.cond(d + 1), N("then", [], [n])])


def _try_body(g, d):
    body = g.body(None, d + 1)
    x = g.r.random()
    if x < .45:
        body.append(_throw(g, None, d + 1))
    elif x < .7 and "$th3" in getattr(g.m, "helpers", []):
        # an exception thrown by a callee (th3 throws when its argument is 3)
        body.append(N("drop", [], [N("call", ["$th3"], [g.expr("i32", d + 1)])]))
    return body


@row("try_table(catch)", "exn", .6, "any")
def _try_catch(g, want, d):
    if want not in ("i32", "i64") or d > 3:
        return None
    tags = [t for t, ps in g.m.tags if ps == [want]]
    if not tags:
        return None
    lab = g.newlab()
    inner = N("try_table", [["catch", tags[0], lab]], _try_body(g, d))
    return N("block", [lab, ["result", want]], [inner, g.expr(want, d + 1)])


@row("try_table(catch_all)", "exn", .6, "void")
def _try_all(g, want, d):
    if d > 3:
        return None
    lab = g.newlab()
    inner = N("try_table", [["catch_all", lab]], _try_body(g, d))
    return N("block", [lab], [inner])


@row("try_table(catch_all_ref)", "exn", .4, "void")
def _try_ref(g, want, d):
    if d > 3:
        return None
    lab, done = g.newlab(), g.newlab()
    inner = N("try_table", [["catch_all_ref", lab]], _try_body(g, d))
    caught = N("block", [lab, ["result", "exnref"]], [inner, N("br", [done])])
    return N("block", [done], [N("throw_ref", [], [caught])])


# the remaining row families live in their own modules and register into ROWS
import rows_more  # noqa: E402,F401
import rows_simd  # noqa: E402,F401
import rows_shapes  # noqa: E402,F401
import rows_cov  # noqa: E402,F401
import decls  # noqa: E402,F401
