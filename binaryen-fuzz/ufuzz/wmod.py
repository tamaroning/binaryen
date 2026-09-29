"""Module model for ufuzz: s-expression reader, wat parser (Binaryen's
`--print` style and our own emitter's), a typer for the subset exwasm-tv
handles, and the emitter.

An instruction is an `N(op, imms, kids)`: `imms` are atoms or raw
non-instruction lists (`(result i32)`, `(ref null $T)`), `kids` are folded
operand instructions (for `if`: cond, `then`, `else`; for blocks: the body).
"""
import copy
import re

# ---------------------------------------------------------------- s-exprs


def tokenize(s):
    toks = []
    i, n = 0, len(s)
    while i < n:
        c = s[i]
        if c in " \t\r\n":
            i += 1
        elif c == ";" and s.startswith(";;", i):
            j = s.find("\n", i)
            i = n if j < 0 else j
        elif c == "(" and s.startswith("(;", i):
            depth, j = 1, i + 2
            while j < n and depth:
                if s.startswith("(;", j):
                    depth += 1
                    j += 2
                elif s.startswith(";)", j):
                    depth -= 1
                    j += 2
                else:
                    j += 1
            i = j
        elif c in "()":
            toks.append(c)
            i += 1
        elif c == '"':
            j = i + 1
            while j < n and s[j] != '"':
                j += 2 if s[j] == "\\" else 1
            toks.append(s[i:j + 1])
            i = j + 1
        else:
            j = i
            while j < n and s[j] not in " \t\r\n()":
                if s[j] == '"':
                    k = j + 1
                    while k < n and s[k] != '"':
                        k += 2 if s[k] == "\\" else 1
                    j = k + 1
                else:
                    j += 1
            toks.append(s[i:j])
            i = j
    return toks


def parse_sx(s):
    """All top-level forms of `s` as nested lists of atoms."""
    toks = tokenize(s)
    out, stack = [], []
    for t in toks:
        if t == "(":
            stack.append([])
        elif t == ")":
            if not stack:
                raise ValueError("unbalanced )")
            x = stack.pop()
            (stack[-1] if stack else out).append(x)
        else:
            (stack[-1] if stack else out).append(t)
    if stack:
        raise ValueError("unbalanced (")
    return out


def sx_str(x):
    if isinstance(x, str):
        return x
    return "(" + " ".join(sx_str(y) for y in x) + ")"


class Unsupported(Exception):
    pass


# ---------------------------------------------------------------- types
# val type: "i32" "i64" "f32" "f64" "v128" | ("ref", nullable, heap)
# heap: "$Name" or abstract; typer extras: None (no value), "unr".

ABSTRACT = {"any", "eq", "struct", "array", "i31", "none", "func", "nofunc",
            "extern", "noextern", "exn", "noexn"}
SHORTREF = {"anyref": "any", "eqref": "eq", "structref": "struct", "arrayref": "array",
            "i31ref": "i31", "nullref": "none", "funcref": "func", "nullfuncref": "nofunc",
            "externref": "extern", "nullexternref": "noextern", "exnref": "exn", "nullexnref": "noexn"}
NUMT = {"i32", "i64", "f32", "f64", "v128"}


def parse_vt(x):
    if isinstance(x, str) and x.startswith("("):
        x = parse_sx(x)[0]
    if isinstance(x, str):
        if x in NUMT:
            return x
        if x in SHORTREF:
            return ("ref", True, SHORTREF[x])
        raise Unsupported("valtype " + x)
    if x and x[0] == "ref":
        rest = x[1:]
        nullable = False
        if rest and rest[0] == "null":
            nullable = True
            rest = rest[1:]
        if len(rest) != 1 or not isinstance(rest[0], str):
            raise Unsupported("reftype " + sx_str(x))
        h = rest[0]
        if not (h.startswith("$") or h in ABSTRACT):
            raise Unsupported("heaptype " + h)
        return ("ref", nullable, h)
    raise Unsupported("valtype " + sx_str(x))


def vt_str(t):
    if isinstance(t, str):
        return t
    _, nl, h = t
    return "(ref %s%s)" % ("null " if nl else "", h)


def is_ref(t):
    return isinstance(t, tuple)


def is_int(t):
    return t in ("i32", "i64")


class TypeDef:
    """A struct/array/func type in a singleton rec group."""

    def __init__(self, name, kind, fields=None, sup=None, final=True, params=None, results=None):
        self.name = name
        self.kind = kind  # "struct" | "array" | "func"
        self.fields = fields or []  # [(storage, mutable)] storage: "i8" "i16" or valtype
        self.sup = sup
        self.final = final
        self.params = params or []
        self.results = results or []

    def text(self, ren=lambda n: n):
        def st(s):
            return s if s in ("i8", "i16") else vt_str(rt_ren(s, ren))

        if self.kind == "func":
            body = "(func%s%s)" % ("".join(" (param %s)" % vt_str(rt_ren(p, ren)) for p in self.params),
                                   "".join(" (result %s)" % vt_str(rt_ren(p, ren)) for p in self.results))
        elif self.kind == "struct":
            body = "(struct%s)" % "".join(
                " (field %s)" % ("(mut %s)" % st(s) if m else st(s)) for s, m in self.fields)
        else:
            s, m = self.fields[0]
            body = "(array %s)" % ("(mut %s)" % st(s) if m else st(s))
        if self.sup is not None or not self.final:
            body = "(sub %s%s%s)" % ("final " if self.final else "", ren(self.sup) + " " if self.sup else "", body)
        return "(type %s %s)" % (ren(self.name), body)


def rt_ren(t, ren):
    if is_ref(t) and t[2].startswith("$"):
        return ("ref", t[1], ren(t[2]))
    return t


def storage_vt(s):
    return "i32" if s in ("i8", "i16") else s


# ---------------------------------------------------------------- instructions


class N:
    __slots__ = ("op", "imms", "kids", "t")

    def __init__(self, op, imms=None, kids=None):
        self.op = op
        self.imms = imms or []
        self.kids = kids or []
        self.t = None

    def text(self, ind=0):
        head = self.op + "".join(" " + (i if isinstance(i, str) else sx_str(i)) for i in self.imms)
        if not self.kids:
            return "(" + head + ")"
        if ind < 0:
            return "(" + head + " " + " ".join(k.text(-1) for k in self.kids) + ")"
        pad = "\n" + " " * (ind + 1)
        return "(" + head + "".join(pad + k.text(ind + 1) for k in self.kids) + ")"

    def walk(self):
        yield self
        for k in self.kids:
            yield from k.walk()

    def size(self):
        return sum(1 for _ in self.walk())

    def clone(self):
        return copy.deepcopy(self)


IMM_HEADS = {"result", "ref", "type", "param", "mut", "exact"}
CTRL = {"block", "loop", "if"}


def is_imm_list(x):
    return isinstance(x, list) and x and isinstance(x[0], str) and (x[0] in IMM_HEADS)


def to_node(x):
    if isinstance(x, str):
        return N(x)
    if not x or not isinstance(x[0], str):
        raise Unsupported("malformed instr")
    op = x[0]
    imms, kids = [], []
    if op in ("then", "else"):
        return N(op, [], [to_node(y) for y in x[1:]])
    for y in x[1:]:
        if isinstance(y, str) or is_imm_list(y):
            if kids and op not in CTRL:
                # atoms after operands: Binaryen never prints these
                raise Unsupported("imm after operand in " + op)
            imms.append(y)
        else:
            kids.append(to_node(y))
    return N(op, imms, kids)


def flat_to_folded(items):
    """Folded instructions only; flat (unfolded) code is rejected."""
    out = []
    for y in items:
        if isinstance(y, str):
            # a bare atom like `nop`/`unreachable`/`return` is fine; anything
            # with immediates written flat is not
            if y in ("nop", "unreachable", "return", "drop", "select"):
                out.append(N(y))
                continue
            raise Unsupported("flat instruction " + y)
        out.append(to_node(y))
    return out


# ---------------------------------------------------------------- module


class Func:
    def __init__(self, name, params, results, locals_, body, export=None):
        self.name = name
        self.params = params  # [(name, vt)]
        self.results = results  # [vt]
        self.locals = locals_  # [(name, vt)]
        self.body = body  # [N]
        self.export = export
        self.meta = {}

    def text(self):
        s = "  (func %s" % self.name
        if self.export:
            s += ' (export "%s")' % self.export
        for n, t in self.params:
            s += " (param %s %s)" % (n, vt_str(t))
        for t in self.results:
            s += " (result %s)" % vt_str(t)
        for n, t in self.locals:
            s += "\n   (local %s %s)" % (n, vt_str(t))
        for b in self.body:
            s += "\n   " + b.text(3)
        return s + ")"

    def vars(self):
        return dict(self.params + self.locals)


class Module:
    def __init__(self):
        self.types = []  # [TypeDef]
        self.imports = []  # [(fname, module, field, params, results)]
        self.memories = []  # [(name, addrtype, min, max)]
        self.globals = []  # [(name, vt, mut, init_text, export)]
        self.funcs = []
        self.meta = {}

    def tmap(self):
        return {t.name: t for t in self.types}

    def text(self):
        out = ["(module"]
        for t in self.types:
            out.append("  " + t.text())
        for fn, mod, fld, ps, rs in self.imports:
            out.append('  (import "%s" "%s" (func %s%s%s))' % (
                mod, fld, fn, "".join(" (param %s)" % vt_str(p) for p in ps),
                "".join(" (result %s)" % vt_str(r) for r in rs)))
        for k, (n, at, mn, mx) in enumerate(self.memories):
            out.append('  (memory %s (export "m%d") %s%d%s)' % (n, k, "i64 " if at == "i64" else "", mn,
                                                               "" if mx is None else " %d" % mx))
        for n, t, mut, init, exp in self.globals:
            ty = "(mut %s)" % vt_str(t) if mut else vt_str(t)
            # immutable globals are never exported: exwasm reads an exported
            # immutable global as a symbolic value (limits/const_export_global.wat)
            exp = exp if mut else None
            out.append("  (global %s%s %s %s)" % (n, ' (export "%s")' % exp if exp else "", ty, init))
        for f in self.funcs:
            out.append(f.text())
        out.append(")")
        return "\n".join(out) + "\n"


def parse_fields(x):
    """(struct (field ...)*) field list -> [(storage, mut)]"""
    fs = []
    for f in x[1:]:
        if not (isinstance(f, list) and f[0] == "field"):
            raise Unsupported("struct item")
        items = f[1:]
        if items and isinstance(items[0], str) and items[0].startswith("$"):
            items = items[1:]  # named field (one per field clause)
        for it in items:
            fs.append(parse_storage(it))
    return fs


def parse_storage(it):
    if isinstance(it, list) and it[0] == "mut":
        s, _ = parse_storage(it[1])
        return s, True
    if it in ("i8", "i16"):
        return it, False
    return parse_vt(it), False


def parse_typedef(x):
    # x = ["type", name, body]
    if len(x) != 3 or not isinstance(x[1], str):
        raise Unsupported("anonymous type")
    name, body = x[1], x[2]
    sup, final = None, True
    if body[0] == "sub":
        final = False
        rest = body[1:]
        if rest[0] == "final":
            final = True
            rest = rest[1:]
        if isinstance(rest[0], str):
            sup = rest[0]
            rest = rest[1:]
        body = rest[0]
    fnames = []
    if body[0] == "struct":
        for f in body[1:]:
            if isinstance(f, list) and len(f) >= 2 and isinstance(f[1], str) and f[1].startswith("$"):
                fnames.append(f[1])
            else:
                fnames.append(None)
        td = TypeDef(name, "struct", parse_fields(body), sup, final)
        td.fnames = fnames
        return td
    if body[0] == "array":
        it = body[1]
        if isinstance(it, list) and it[0] == "field":
            it = it[1]
        td = TypeDef(name, "array", [parse_storage(it)], sup, final)
        td.fnames = []
        return td
    if body[0] == "func":
        ps, rs = [], []
        for y in body[1:]:
            if y[0] == "param":
                ps += [parse_vt(z) for z in y[1:] if not (isinstance(z, str) and z.startswith("$"))]
            elif y[0] == "result":
                rs += [parse_vt(z) for z in y[1:]]
        td = TypeDef(name, "func", [], sup, final, ps, rs)
        td.fnames = []
        return td
    raise Unsupported("comptype " + str(body[0]))


def parse_module(text, keep_bad_funcs=False):
    """Parse one `(module ...)` in folded text (Binaryen `--print` or ours).
    Functions outside what we can represent are dropped and counted in
    `m.meta['dropped']`."""
    forms = parse_sx(text)
    mods = [f for f in forms if isinstance(f, list) and f and f[0] == "module"]
    if not mods:
        raise Unsupported("no module")
    mx = mods[0]
    m = Module()
    m.meta["dropped"] = {}
    m.meta["rec_types"] = set()
    fexp, gexp, mexp = {}, {}, {}
    items = mx[1:]
    if items and isinstance(items[0], str) and items[0].startswith("$"):
        items = items[1:]
    raw_funcs = []
    ftypes = {}
    for it in items:
        if not isinstance(it, list) or not it:
            continue
        h = it[0]
        if h == "type":
            td = parse_typedef(it)
            m.types.append(td)
        elif h == "rec":
            for y in it[1:]:
                td = parse_typedef(y)
                if len(it) > 2:
                    m.meta["rec_types"].add(td.name)
                m.types.append(td)
        elif h == "import":
            mod, fld, desc = it[1].strip('"'), it[2].strip('"'), it[3]
            if desc[0] == "func":
                fn = desc[1] if len(desc) > 1 and isinstance(desc[1], str) else "$imp%d" % len(m.imports)
                ps, rs = sig_of(desc[2:], ftypes, m)
                m.imports.append((fn, mod, fld, ps, rs))
            elif desc[0] == "memory":
                # imported memory -> defined memory with the same limits
                name = desc[1] if len(desc) > 1 and isinstance(desc[1], str) and desc[1].startswith("$") \
                    else "$mem%d" % len(m.memories)
                at = "i64" if "i64" in desc else "i32"
                nums = [int(y) for y in desc[1:] if isinstance(y, str) and re.fullmatch(r"\d+", y)]
                if any(isinstance(y, list) and y[0] == "shared" for y in desc):
                    raise Unsupported("shared memory")
                m.memories.append((name, at, nums[0] if nums else 0, nums[1] if len(nums) > 1 else None))
            elif desc[0] == "global":
                # imported global -> defined, exported global
                name = desc[1]
                ty = desc[2]
                mut = isinstance(ty, list) and ty[0] == "mut"
                vt = parse_vt(ty[1] if mut else ty)
                m.globals.append((name, vt, mut, None, None))
            else:
                m.meta.setdefault("other_imports", []).append(desc[0])
        elif h == "memory":
            name = it[1] if isinstance(it[1], str) and it[1].startswith("$") else "$mem%d" % len(m.memories)
            rest = [y for y in it[1:] if y is not name]
            at = "i32"
            nums = []
            for y in rest:
                if y == "i64":
                    at = "i64"
                elif isinstance(y, str) and re.fullmatch(r"\d+", y):
                    nums.append(int(y))
                elif isinstance(y, list) and y[0] == "export":
                    mexp[name] = y[1].strip('"')
                elif isinstance(y, list) and y[0] == "shared":
                    raise Unsupported("shared memory")
                elif isinstance(y, list) and y[0] == "import":
                    m.meta["imported_memory"] = True
                    raise Unsupported("imported memory")
                elif isinstance(y, list) and y[0] == "data":
                    raise Unsupported("inline data")
            m.memories.append((name, at, nums[0] if nums else 0, nums[1] if len(nums) > 1 else None))
        elif h == "global":
            name = it[1]
            rest = it[2:]
            exp = None
            while rest and isinstance(rest[0], list) and rest[0][0] == "export":
                exp = rest[0][1].strip('"')
                rest = rest[1:]
            ty = rest[0]
            mut = isinstance(ty, list) and ty[0] == "mut"
            vt = parse_vt(ty[1] if mut else ty)
            init = sx_str(rest[1]) if len(rest) > 1 else None
            m.globals.append((name, vt, mut, init, exp))
        elif h == "export":
            nm = it[1].strip('"')
            k, ref = it[2][0], it[2][1]
            if k == "func":
                fexp.setdefault(ref, nm)
            elif k == "global":
                gexp.setdefault(ref, nm)
            elif k == "memory":
                mexp.setdefault(ref, nm)
        elif h == "func":
            raw_funcs.append(it)
        elif h in ("data", "elem", "table", "tag", "start"):
            m.meta.setdefault("other", set()).add(h)
    tmap = m.tmap()
    for td in m.types:
        if td.kind == "func":
            ftypes[td.name] = td
    for rf in raw_funcs:
        try:
            f = parse_func(rf, ftypes, m)
        except (Unsupported, ValueError, IndexError, KeyError, TypeError) as e:
            key = str(e)[:60]
            m.meta["dropped"][key] = m.meta["dropped"].get(key, 0) + 1
            continue
        if f.export is None:
            f.export = fexp.get(f.name)
        m.funcs.append(f)
    m.globals = [(n, t, mu, i, e or gexp.get(n)) for n, t, mu, i, e in m.globals]
    m.meta["mexp"] = mexp
    del tmap
    return m


def sig_of(items, ftypes, m):
    ps, rs = [], []
    tref = None
    for y in items:
        if not isinstance(y, list):
            continue
        if y[0] == "type":
            tref = y[1]
        elif y[0] == "param":
            ps += [parse_vt(z) for z in y[1:] if not (isinstance(z, str) and z.startswith("$"))]
        elif y[0] == "result":
            rs += [parse_vt(z) for z in y[1:]]
    if tref and not ps and not rs and tref in ftypes:
        return list(ftypes[tref].params), list(ftypes[tref].results)
    return ps, rs


def parse_func(x, ftypes, m):
    name = x[1] if isinstance(x[1], str) and x[1].startswith("$") else "$anon"
    rest = x[2:] if name != "$anon" else x[1:]
    params, results, locals_ = [], [], []
    export = None
    tref = None
    body = []
    i = 0
    while i < len(rest):
        y = rest[i]
        if isinstance(y, list) and y and y[0] == "export":
            export = y[1].strip('"')
        elif isinstance(y, list) and y and y[0] == "import":
            raise Unsupported("imported func")
        elif isinstance(y, list) and y and y[0] == "type":
            tref = y[1]
        elif isinstance(y, list) and y and y[0] == "param":
            if len(y) == 3 and y[1].startswith("$"):
                params.append((y[1], parse_vt(y[2])))
            else:
                for z in y[1:]:
                    params.append(("$p%d" % len(params), parse_vt(z)))
        elif isinstance(y, list) and y and y[0] == "result":
            results += [parse_vt(z) for z in y[1:]]
        elif isinstance(y, list) and y and y[0] == "local":
            if len(y) == 3 and isinstance(y[1], str) and y[1].startswith("$"):
                locals_.append((y[1], parse_vt(y[2])))
            else:
                for z in y[1:]:
                    locals_.append(("$l%d" % len(locals_), parse_vt(z)))
        else:
            break
        i += 1
    if tref and not params and not results and tref in ftypes:
        ft = ftypes[tref]
        params = [("$p%d" % k, t) for k, t in enumerate(ft.params)]
        results = list(ft.results)
    body = flat_to_folded(rest[i:])
    return Func(name, params, results, locals_, body, export)


# ---------------------------------------------------------------- typing

NUM = {}


def _num():
    for t in ("i32", "i64"):
        for o in ("add", "sub", "mul", "div_s", "div_u", "rem_s", "rem_u", "and", "or", "xor",
                  "shl", "shr_s", "shr_u", "rotl", "rotr"):
            NUM["%s.%s" % (t, o)] = ([t, t], t)
        for o in ("eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u"):
            NUM["%s.%s" % (t, o)] = ([t, t], "i32")
        for o in ("clz", "ctz", "popcnt", "extend8_s", "extend16_s"):
            NUM["%s.%s" % (t, o)] = ([t], t)
        NUM["%s.eqz" % t] = ([t], "i32")
    NUM["i64.extend32_s"] = (["i64"], "i64")
    NUM["i32.wrap_i64"] = (["i64"], "i32")
    NUM["i64.extend_i32_s"] = (["i32"], "i64")
    NUM["i64.extend_i32_u"] = (["i32"], "i64")
    # float rows are typed so that seeds containing them get "unsupported
    # feature" instead of a parse failure; the generator leaves them out
    for t in ("f32", "f64"):
        for o in ("add", "sub", "mul", "div", "min", "max", "copysign"):
            NUM["%s.%s" % (t, o)] = ([t, t], t)
        for o in ("eq", "ne", "lt", "gt", "le", "ge"):
            NUM["%s.%s" % (t, o)] = ([t, t], "i32")
        for o in ("abs", "neg", "sqrt", "ceil", "floor", "trunc", "nearest"):
            NUM["%s.%s" % (t, o)] = ([t], t)
    for it in ("i32", "i64"):
        for ft in ("f32", "f64"):
            for s in ("s", "u"):
                NUM["%s.trunc_%s_%s" % (it, ft, s)] = ([ft], it)
                NUM["%s.trunc_sat_%s_%s" % (it, ft, s)] = ([ft], it)
                NUM["%s.convert_%s_%s" % (ft, it, s)] = ([it], ft)
    NUM["f32.demote_f64"] = (["f64"], "f32")
    NUM["f64.promote_f32"] = (["f32"], "f64")
    NUM["i32.reinterpret_f32"] = (["f32"], "i32")
    NUM["i64.reinterpret_f64"] = (["f64"], "i64")
    NUM["f32.reinterpret_i32"] = (["i32"], "f32")
    NUM["f64.reinterpret_i64"] = (["i64"], "f64")


_num()

LOADS = {"i32.load": ("i32", 4), "i32.load8_s": ("i32", 1), "i32.load8_u": ("i32", 1),
         "i32.load16_s": ("i32", 2), "i32.load16_u": ("i32", 2), "i64.load": ("i64", 8),
         "i64.load8_s": ("i64", 1), "i64.load8_u": ("i64", 1), "i64.load16_s": ("i64", 2),
         "i64.load16_u": ("i64", 2), "i64.load32_s": ("i64", 4), "i64.load32_u": ("i64", 4),
         "f32.load": ("f32", 4), "f64.load": ("f64", 8)}
STORES = {"i32.store": ("i32", 4), "i32.store8": ("i32", 1), "i32.store16": ("i32", 2),
          "i64.store": ("i64", 8), "i64.store8": ("i64", 1), "i64.store16": ("i64", 2),
          "i64.store32": ("i64", 4), "f32.store": ("f32", 4), "f64.store": ("f64", 8)}

# opcode family, used by the diversity histograms
FAMILY_FIXED = {
    "local.get": "local", "local.set": "local", "local.tee": "local",
    "global.get": "global", "global.set": "global",
    "memory.size": "mem.size", "memory.grow": "mem.grow",
    "block": "ctl.block", "loop": "ctl.loop", "if": "ctl.if", "br": "ctl.br", "br_if": "ctl.br",
    "br_table": "ctl.br_table", "return": "ctl.return", "unreachable": "ctl.unreachable",
    "nop": "misc", "drop": "misc", "select": "select", "call": "call",
    "then": "arm", "else": "arm",
    "ref.null": "gc.null", "ref.is_null": "gc.null", "ref.as_non_null": "gc.null",
    "br_on_null": "gc.br_on", "br_on_non_null": "gc.br_on", "br_on_cast": "gc.br_on",
    "br_on_cast_fail": "gc.br_on", "ref.test": "gc.cast", "ref.cast": "gc.cast",
    "ref.eq": "gc.eq", "ref.i31": "gc.i31", "i31.get_s": "gc.i31", "i31.get_u": "gc.i31",
    "array.len": "gc.array",
    "memory.fill": "bulk", "memory.copy": "bulk", "memory.init": "data", "data.drop": "data",
    "call_indirect": "table", "call_ref": "table", "ref.func": "table", "table.get": "table",
    "table.set": "table", "table.size": "table", "table.grow": "table",
    "try": "exn", "try_table": "exn", "throw": "exn", "throw_ref": "exn", "rethrow": "exn",
}


def family(op):
    if op in FAMILY_FIXED:
        return FAMILY_FIXED[op]
    if op.startswith("struct."):
        return "gc.struct"
    if op.startswith("array."):
        return "gc.array"
    if op in LOADS:
        return "float" if op[0] == "f" else "mem.load"
    if op in STORES:
        return "float" if op[0] == "f" else "mem.store"
    if op in NUM:
        ps, r = NUM[op]
        if any(t[0] == "f" for t in ps + [r]):
            return "float"
        if "_i32" in op or "_i64" in op or "extend" in op:
            return "int.conv"
        if r == "i32" and ps and len(ps) == 2 and op.split(".")[1] in (
                "eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s", "ge_u"):
            return "int.cmp"
        return "int.arith"
    if op.endswith(".const"):
        return "float" if op[0] == "f" else ("simd" if op[0] == "v" else "int.const")
    if op.startswith("v128") or op.startswith("i8x16") or op.startswith("i16x8") or \
            op.startswith("i32x4") or op.startswith("i64x2") or op.startswith("f32x4") or op.startswith("f64x2"):
        return "simd"
    return "other"


# feature tags of one function (for the feature-combination histogram)
FEAT_OF_FAMILY = {
    "int.arith": "int", "int.cmp": "int", "int.conv": "int", "int.const": None,
    "mem.load": "mem", "mem.store": "mem", "mem.size": "memgrow", "mem.grow": "memgrow",
    "global": "global", "ctl.block": "ctl", "ctl.if": "ctl", "ctl.br": "ctl",
    "ctl.br_table": "ctl", "ctl.return": "ctl", "ctl.loop": "loop", "ctl.unreachable": "trap",
    "select": "select", "call": "call", "gc.struct": "gc", "gc.array": "gc",
    "gc.null": "gcnull", "gc.cast": "cast", "gc.br_on": "cast", "gc.eq": "gc", "gc.i31": "i31",
    "float": "float", "simd": "simd", "bulk": "bulk", "data": "data", "table": "table", "exn": "exn",
}


class TypeCtx:
    def __init__(self, m):
        self.m = m
        self.tmap = m.tmap()
        self.imports = {i[0]: (i[3], i[4]) for i in m.imports}
        self.fsigs = {f.name: ([t for _, t in f.params], f.results) for f in m.funcs}
        self.globals = {g[0]: g for g in m.globals}
        self.mems = {mm[0]: mm for mm in m.memories}
        self.memlist = [mm[0] for mm in m.memories]

    # heap subtyping
    def heap_sup(self, h):
        if h.startswith("$"):
            td = self.tmap.get(h)
            if td is None:
                raise Unsupported("unknown type " + h)
            if td.sup:
                return td.sup
            return {"struct": "struct", "array": "array", "func": "func"}[td.kind]
        return {"struct": "eq", "array": "eq", "i31": "eq", "eq": "any", "any": None,
                "func": None, "extern": None, "exn": None}.get(h)

    def top(self, h):
        while True:
            s = self.heap_sup(h) if h not in ("none", "nofunc", "noextern", "noexn") else None
            if h == "none":
                return "any"
            if h == "nofunc":
                return "func"
            if h == "noextern":
                return "extern"
            if h == "noexn":
                return "exn"
            if s is None:
                return h
            h = s

    def heap_sub(self, a, b):
        if a == b:
            return True
        bottoms = {"none": "any", "nofunc": "func", "noextern": "extern", "noexn": "exn"}
        if a in bottoms:
            return self.top(b) == bottoms[a]
        while a is not None:
            if a == b:
                return True
            a = self.heap_sup(a)
        return False

    def sub(self, a, b):
        """value type a <: b; "unr" is a subtype of everything"""
        if a == "unr":
            return True
        if a == b:
            return True
        if is_ref(a) and is_ref(b):
            if a[1] and not b[1]:
                return False
            return self.heap_sub(a[2], b[2])
        return False

    def field(self, tname, fidx):
        td = self.tmap.get(tname)
        if td is None:
            raise Unsupported("unknown type " + tname)
        if td.kind == "array":
            return td.fields[0]
        if isinstance(fidx, str) and not re.fullmatch(r"-?\d+", fidx):
            names = getattr(td, "fnames", [])
            if fidx not in names:
                raise Unsupported("unknown field " + fidx)
            fidx = names.index(fidx)
        return td.fields[int(fidx)]

    def mem_at(self, name):
        if name is None:
            if not self.memlist:
                raise Unsupported("no memory")
            name = self.memlist[0]
        if name not in self.mems:
            if re.fullmatch(r"\d+", name) and int(name) < len(self.memlist):
                name = self.memlist[int(name)]
            else:
                raise Unsupported("unknown memory")
        return self.mems[name][1]


def mem_imm(node):
    """memory name immediate of a load/store/size/grow, or None"""
    for i in node.imms:
        if isinstance(i, str) and not i.startswith("offset=") and not i.startswith("align="):
            return i
    return None


class Typer:
    """Types every node of a function (sets `n.t`); raises Unsupported for
    constructs outside the representable subset.  Also records the
    features used and free labels."""

    def __init__(self, ctx, func):
        self.c = ctx
        self.f = func
        self.vars = func.vars()
        self.labels = []  # [(name, [types] branch carries)]
        self.ops = []

    def run(self):
        self.labels = [("$__func", list(self.f.results))]
        for b in self.f.body:
            self.ty(b)
        return self

    def blocktype(self, n):
        res = []
        label = None
        for i in n.imms:
            if isinstance(i, str) and i.startswith("$"):
                label = i
            elif isinstance(i, list) and i[0] == "result":
                res += [parse_vt(z) for z in i[1:]]
            elif isinstance(i, list) and i[0] in ("type", "param"):
                raise Unsupported("block type index / params")
        if len(res) > 1:
            raise Unsupported("multi-value block")
        return label, res

    def seq(self, stmts):
        t = None
        for s in stmts:
            t = self.ty(s)
        return t

    def lab(self, name):
        if name.startswith("$"):
            for nm, ts in reversed(self.labels):
                if nm == name:
                    return ts
            raise Unsupported("unknown label " + name)
        k = int(name)
        return self.labels[-1 - k][1]

    def ty(self, n):
        self.ops.append(n.op)
        t = self._ty(n)
        n.t = t
        return t

    def kids(self, n):
        return [self.ty(k) for k in n.kids]

    def _ty(self, n):
        op = n.op
        c = self.c
        if op in NUM:
            ps, r = NUM[op]
            self.kids(n)
            return r
        if op.endswith(".const") and op[:3] in ("i32", "i64", "f32", "f64"):
            return op[:3]
        if op == "local.get":
            return self.var(n.imms[0])
        if op == "local.set":
            self.kids(n)
            self.var(n.imms[0])
            return None
        if op == "local.tee":
            self.kids(n)
            return self.var(n.imms[0])
        if op == "global.get":
            return self.glob(n.imms[0])[1]
        if op == "global.set":
            self.kids(n)
            self.glob(n.imms[0])
            return None
        if op in LOADS:
            c.mem_at(mem_imm(n))
            self.kids(n)
            return LOADS[op][0]
        if op in STORES:
            c.mem_at(mem_imm(n))
            self.kids(n)
            return None
        if op == "memory.size":
            return c.mem_at(mem_imm(n))
        if op == "memory.grow":
            self.kids(n)
            return c.mem_at(mem_imm(n))
        if op == "memory.fill":
            c.mem_at(mem_imm(n))
            self.kids(n)
            return None
        if op == "memory.copy":
            ms = [i for i in n.imms if isinstance(i, str)]
            for x in (ms or [None]):
                c.mem_at(x)
            self.kids(n)
            return None
        if op == "nop":
            return None
        if op == "unreachable":
            return "unr"
        if op == "drop":
            self.kids(n)
            return None
        if op == "select":
            ks = self.kids(n)
            for i in n.imms:
                if isinstance(i, list) and i[0] == "result":
                    return parse_vt(i[1])
            if len(ks) != 3:
                raise Unsupported("select arity")
            a, b = ks[0], ks[1]
            if a == "unr":
                return b
            return a
        if op in ("block", "loop"):
            label, res = self.blocktype(n)
            self.labels.append((label, res if op == "block" else []))
            self.seq(n.kids)
            self.labels.pop()
            return res[0] if res else None
        if op == "if":
            label, res = self.blocktype(n)
            if not n.kids:
                raise Unsupported("if without cond")
            self.ty(n.kids[0])
            self.labels.append((label, res))
            for k in n.kids[1:]:
                if k.op not in ("then", "else"):
                    raise Unsupported("if arm")
                k.t = self.seq(k.kids)
            self.labels.pop()
            return res[0] if res else None
        if op == "br":
            self.kids(n)
            self.lab(n.imms[0])
            return "unr"
        if op == "br_if":
            self.kids(n)
            ts = self.lab(n.imms[0])
            return ts[0] if ts else None
        if op == "br_table":
            self.kids(n)
            for i in n.imms:
                self.lab(i)
            return "unr"
        if op == "return":
            self.kids(n)
            return "unr"
        if op == "call":
            self.kids(n)
            f = n.imms[0]
            if f in c.imports:
                ps, rs = c.imports[f]
            elif f in c.fsigs:
                ps, rs = c.fsigs[f]
            else:
                raise Unsupported("unknown callee")
            if len(rs) > 1:
                raise Unsupported("multi-value call")
            return rs[0] if rs else None
        if op == "ref.null":
            h = n.imms[0]
            h = SHORTREF.get(h, h)
            if not h.startswith("$") and h not in ABSTRACT:
                raise Unsupported("ref.null " + h)
            return ("ref", True, self.bottom(h))
        if op == "ref.is_null":
            self.kids(n)
            return "i32"
        if op == "ref.as_non_null":
            (a,) = self.kids(n)
            return ("ref", False, a[2]) if is_ref(a) else a
        if op == "ref.eq":
            self.kids(n)
            return "i32"
        if op == "ref.i31":
            self.kids(n)
            return ("ref", False, "i31")
        if op in ("i31.get_s", "i31.get_u"):
            self.kids(n)
            return "i32"
        if op == "ref.test":
            parse_vt(n.imms[0])
            self.kids(n)
            return "i32"
        if op == "ref.cast":
            t = parse_vt(n.imms[0])
            self.kids(n)
            return t
        if op in ("br_on_null", "br_on_non_null"):
            (a,) = self.kids(n)
            self.lab(n.imms[0])
            if op == "br_on_null":
                return ("ref", False, a[2]) if is_ref(a) else a
            return None
        if op in ("br_on_cast", "br_on_cast_fail"):
            t1, t2 = parse_vt(n.imms[1]), parse_vt(n.imms[2])
            self.kids(n)
            self.lab(n.imms[0])
            if op == "br_on_cast":
                # fallthrough: t1 minus t2
                return ("ref", t1[1] and not t2[1], t1[2])
            return t2
        if op in ("struct.new", "struct.new_default"):
            self.kids(n)
            self.ctype(n.imms[0], "struct")
            return ("ref", False, n.imms[0])
        if op in ("struct.get", "struct.get_s", "struct.get_u"):
            self.kids(n)
            s, _ = c.field(n.imms[0], n.imms[1])
            return storage_vt(s)
        if op == "struct.set":
            self.kids(n)
            c.field(n.imms[0], n.imms[1])
            return None
        if op in ("array.new", "array.new_default", "array.new_fixed"):
            self.kids(n)
            self.ctype(n.imms[0], "array")
            return ("ref", False, n.imms[0])
        if op in ("array.get", "array.get_s", "array.get_u"):
            self.kids(n)
            s, _ = c.field(n.imms[0], 0)
            return storage_vt(s)
        if op == "array.set":
            self.kids(n)
            self.ctype(n.imms[0], "array")
            return None
        if op == "array.len":
            self.kids(n)
            return "i32"
        raise Unsupported("op " + op)

    def bottom(self, h):
        if h.startswith("$"):
            return h  # keep the annotation: Binaryen prints ref.null of a concrete type
        return {"any": "none", "eq": "none", "struct": "none", "array": "none", "i31": "none",
                "none": "none", "func": "nofunc", "nofunc": "nofunc", "extern": "noextern",
                "noextern": "noextern", "exn": "noexn", "noexn": "noexn"}[h]

    def ctype(self, name, kind):
        td = self.c.tmap.get(name)
        if td is None or td.kind != kind:
            raise Unsupported("bad type " + name)

    def var(self, name):
        if name in self.vars:
            return self.vars[name]
        if re.fullmatch(r"\d+", name):
            allv = self.f.params + self.f.locals
            return allv[int(name)][1]
        raise Unsupported("unknown local " + name)

    def glob(self, name):
        g = self.c.globals.get(name)
        if g is None:
            raise Unsupported("unknown global " + name)
        return g


def free_labels(n, bound=None):
    """labels used by `n` that `n` does not bind"""
    bound = bound or []
    out = set()
    if n.op in ("block", "loop", "if"):
        lab = next((i for i in n.imms if isinstance(i, str) and i.startswith("$")), None)
        bound = bound + [lab]
    for k in n.kids:
        out |= free_labels(k, bound)
    if n.op in ("br", "br_if", "br_on_null", "br_on_non_null", "br_on_cast", "br_on_cast_fail"):
        if n.imms[0] not in bound:
            out.add(n.imms[0])
    if n.op == "br_table":
        for i in n.imms:
            if i not in bound:
                out.add(i)
    if n.op == "return":
        out.add("return")
    return out


def func_features(func):
    fams = {}
    for b in func.body:
        for n in b.walk():
            fa = family(n.op)
            if fa != "arm":
                fams[fa] = fams.get(fa, 0) + 1
    feats = set()
    for fa in fams:
        ft = FEAT_OF_FAMILY.get(fa)
        if ft:
            feats.add(ft)
    return fams, feats
