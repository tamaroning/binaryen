"""Variation of what a module declares, as opposed to what its functions do.

`vary(r, m)` runs on a module before its functions are generated, so the
ordinary rows (memory.init, data.drop, call_indirect, ...) pick up the new
parts.  It adds, each with some probability:

  * table initializers (a function or null) on the funcref tables, and active
    element segments over them that mix functions and nulls;
  * data segments, passive and active, whose bytes mix runs of zeros of
    various lengths with other bytes; all of them are named, so memory.init
    and data.drop may use active segments too;
  * a larger first memory (rarely 65536 pages; such a module skips the V8
    oracle, which would have to allocate 4 GiB);
  * guard-shaped helper functions (a run of `if`s without `else`, optionally
    followed by one statement), called from several places.

Two rows use what `vary` recorded in `m.meta`: memory.init of a whole (or a
large part of a) declared segment, and calls of the guard helpers.
"""
from table import row
from wmod import N, Func

HELPERS_FT0 = ["$th0", "$th1"]  # helpers of type $ft0 (i32 -> i32)


def _bytes(r):
    """segment contents: chunks of zeros and of other bytes"""
    out = []
    for _ in range(r.randint(1, 4)):
        if r.random() < .5:
            out.append(b"\0" * r.choice([1, 4, 16, 64, 100, 300]))
        else:
            out.append(bytes(r.randrange(1, 256) for _ in range(r.randint(1, 8))))
    return b"".join(out)


def _esc(bs):
    return "".join("\\%02x" % b for b in bs)


def _tables(r, m):
    inits = {}
    for name, size in m.tables:
        if r.random() < .5:
            inits[name] = r.choice(["(ref.func %s)" % h for h in HELPERS_FT0] + ["(ref.func $th2)", "(ref.null func)"])
    m.table_inits = inits
    for _ in range(r.randint(0, 3)):
        name, size = r.choice(m.tables)
        n = r.randint(1, min(3, size))
        off = r.randint(0, size - n)
        items = " ".join("(item %s)" % (r.choice(["(ref.func %s)" % h for h in HELPERS_FT0 + ["$th2"]] + ["(ref.null func)"] * 2))
                         for _ in range(n))
        m.elems.append("(elem (table %s) (i32.const %d) funcref %s)" % (name, off, items))


def _memory(r, m):
    name, at, mn, mx = m.memories[0]
    x = r.random()
    if at == "i32" and x < .04:
        m.memories[0] = (name, at, 65536, None)
        m.meta["nov8"] = True
    elif x < .4:
        mn2 = r.choice([1, 2, 16])
        if mx is None or mx >= mn2:
            m.memories[0] = (name, at, max(mn, mn2), mx)


def _datas(r, m):
    name, at, mn, _ = m.memories[0]
    lens = m.meta.setdefault("data_lens", {})
    for k in range(r.randint(1, 3)):
        bs = _bytes(r)
        if r.random() < .5 or mn == 0:
            dn = "$dv%d" % k
            m.datas.append('(data %s "%s")' % (dn, _esc(bs)))
        else:
            dn = "$dva%d" % k
            cap = mn * 65536 - len(bs)
            if cap < 0:
                continue
            off = r.choice([0, 64, cap // 2, cap])
            m.datas.append('(data %s (memory %s) (%s.const %d) "%s")' % (dn, name, at, off, _esc(bs)))
        m.data_names.append(dn)
        lens[dn] = len(bs)


def _guards(r, m):
    """functions that are a run of ifs without else (the shape partial inlining looks for)"""
    mem_ok = m.memories[0][1] == "i32" and m.memories[0][2] >= 1
    stmts = [
        lambda: N("local.set", ["$t"], [N("i32.const", [str(r.choice([0, 1, 5, -1, 100]))])]),
        lambda: N("local.set", ["$t"], [N("i32.add", [], [N("local.get", ["$t"]), N("local.get", [r.choice(["$a", "$b"])])])]),
        lambda: N("call", ["$v"], [N("local.get", [r.choice(["$t", "$a", "$b"])])]),
        lambda: N("global.set", ["$g0"], [N("i32.add", [], [N("global.get", ["$g0"]), N("local.get", ["$t"])])]),
        lambda: N("drop", [], [N("call", ["$h"], [N("local.get", [r.choice(["$t", "$b"])])])]),
    ]
    if mem_ok:
        stmts.append(lambda: N("i32.store", [], [N("i32.const", [str(r.choice([0, 64, 128]))]), N("local.get", ["$t"])]))
    names = []
    for k in range(r.randint(1, 2)):
        body = []
        for _ in range(r.randint(1, 3)):
            cond = N("local.get", [r.choice(["$a", "$b"])])
            if r.random() < .25:
                cond = N("i32.eqz", [], [cond])
            arm = [r.choice(stmts)() for _ in range(r.randint(2, 14))]
            body.append(N("if", [], [cond, N("then", [], arm)]))
        if r.random() < .5:
            body.append(r.choice(stmts)())
        fn = "$pg%d" % k
        m.funcs.append(Func(fn, [("$a", "i32"), ("$b", "i32")], [], [("$t", "i32")], body))
        names.append(fn)
    m.meta["guards"] = names


def vary(r, m):
    if r.random() < .6:
        _tables(r, m)
    if r.random() < .5:
        _memory(r, m)
    if r.random() < .7:
        _datas(r, m)
    if r.random() < .5:
        _guards(r, m)


@row("memory.init(segment)", "data", .5, "void")
def _minit_seg(g, want, d):
    lens = g.m.meta.get("data_lens")
    if not lens:
        return None
    name, at, mn, _ = g.m.memories[0]
    dn = g.r.choice(sorted(lens))
    ln = lens[dn]
    off = g.r.choice([0, 0, ln // 2])
    n = g.r.choice([ln - off, max(0, ln - off - 1), (ln - off) // 2])
    end = mn * 65536
    dest = g.r.choice([g.addr(at, d), g.const(at, 0), g.const(at, max(0, end - n)), g.const(at, max(0, end - n + 1))])
    return N("memory.init", [name, dn], [dest, N("i32.const", [str(off)]), N("i32.const", [str(n)])])


@row("call guard helper", "call", 2.5, "void")
def _call_guard(g, want, d):
    gs = g.m.meta.get("guards")
    if not gs:
        return None
    return N("call", [g.r.choice(gs)], [g.expr("i32", d + 1), g.expr("i32", d + 1)])
