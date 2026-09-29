"""Subtree pool entries: closed, typed subtrees with the locals, globals,
memories, callees and types they need, so that mut.Mut.import_entry can
rename them into another module."""
import re

from wmod import LOADS, STORES, free_labels, is_ref, mem_imm, vt_str

POOL_OPS_BAD = ("return",)


def type_closure(m, names):
    tm = m.tmap()
    out, todo = [], list(names)
    seen = set()
    while todo:
        n = todo.pop()
        if n in seen or n not in tm:
            continue
        seen.add(n)
        td = tm[n]
        if td.sup:
            todo.append(td.sup)
        for s, _ in td.fields:
            if is_ref(s) and s[2].startswith("$"):
                todo.append(s[2])
    # keep declaration order (supertypes first)
    for td in m.types:
        if td.name in seen:
            out.append({"name": td.name, "text": td.text()})
    return out


def type_names_in(imm, acc):
    if isinstance(imm, str):
        if imm.startswith("$"):
            acc.add(imm)
    else:
        for i in imm:
            type_names_in(i, acc)


def entry_of(m, f, n, eid, src):
    if free_labels(n):
        return None
    if any(x.op in POOL_OPS_BAD for x in n.walk()):
        return None
    fv = f.vars()
    locs, globs, mems, calls, tys = {}, {}, {}, {}, set()
    gmap = {g[0]: g for g in m.globals}
    imps = {i[0]: i for i in m.imports}
    memnames = [mm[0] for mm in m.memories]
    mem_at = {mm[0]: mm[1] for mm in m.memories}
    tnames = {t.name for t in m.types}
    default_mem = None
    for x in n.walk():
        op = x.op
        if op in ("local.get", "local.set", "local.tee"):
            t = fv.get(x.imms[0])
            if t is None:
                return None
            locs[x.imms[0]] = vt_str(t)
        elif op in ("global.get", "global.set"):
            g = gmap.get(x.imms[0])
            if g is None or is_ref(g[1]):
                return None
            globs[x.imms[0]] = [g[1], bool(g[2] or op == "global.set")]
        elif op in LOADS or op in STORES or op in ("memory.size", "memory.grow"):
            mi = mem_imm(x)
            if mi is None:
                if not memnames:
                    return None
                default_mem = memnames[0]
                mems[memnames[0]] = mem_at[memnames[0]]
            else:
                if mi not in mem_at:
                    return None
                mems[mi] = mem_at[mi]
        elif op == "call":
            i = imps.get(x.imms[0])
            if i is None:
                return None
            calls[x.imms[0]] = [i[3], i[4]]
        for i in x.imms:
            acc = set()
            type_names_in(i, acc)
            tys |= acc & tnames
    t = "void" if n.t is None else vt_str(n.t)
    if "$" in t:
        t = "concrete"
    return {"id": eid, "src": src, "code": n.text(-1), "t": t, "locals": locs, "globals": globs,
            "mems": mems, "default_mem": default_mem, "calls": calls,
            "types": type_closure(m, tys), "size": n.size()}


def entries_of_func(r, m, f, src, idbase, maxn=30, lo=3, hi=25):
    cands = []

    def go(lst, parent):
        for i, n in enumerate(lst):
            if n.op not in ("then", "else") and n.t != "unr":
                sz = n.size()
                if lo <= sz <= hi:
                    valpos = parent is None or parent.op not in ("block", "loop", "then", "else") or i == len(lst) - 1
                    if n.t is None or valpos:
                        cands.append(n)
            go(n.kids, n)
    go(f.body, None)
    r.shuffle(cands)
    out = []
    for n in cands[:maxn * 2]:
        e = entry_of(m, f, n, "%s%d" % (idbase, len(out)), src)
        if e is not None:
            out.append(e)
        if len(out) >= maxn:
            break
    return out
