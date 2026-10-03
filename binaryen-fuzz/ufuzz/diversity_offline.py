#!/usr/bin/env python3
"""Offline diversity metrics of the generator (no exwasm, no wasm-opt):
distinct opcodes, feature pairs / combos, reachability of the known-bug shapes,
and a static estimate of what the exwasm-0930 snapshot rejects per row family.

usage: diversity_offline.py [N per family=100] [seed0]
Estimate rules (from probes of exwasm-0930, see memo 1002):
  module-level error (whole module goes to oracle B): return_call*, extern.convert_any,
    any.convert_extern, array.fill, array.init_data, array.new_elem, array.init_elem (sem probe: unsupported
    instruction; assumed module-level like the other rejected array opcodes), atomics
  function-level unsupported: call_ref, f32 globals, global.get of reference globals,
    array.new_data, multi-value block / call, memory.grow on a 64-bit memory,
    struct.get on a value read from a typed table
"""
import collections
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen  # noqa: E402
import table  # noqa: E402
from wmod import ATOMIC, SIMD, VMEM, family, func_features  # noqa: E402

# exwasm-1002 (memo 1002_support_extension): array.fill / new_data / new_elem / init_data / init_elem,
# extern conversions, return_call* and atomics are supported.  Still rejected: type groups with more
# than one type (module level), multi-value block types and multi-result functions, typed (non-func)
# tables, tail calls in functions with loops.  Set EXWASM=0930 for the older snapshot's rules.
OLD = os.environ.get("EXWASM") == "0930"
MODULE_BAD = {"return_call", "return_call_indirect", "return_call_ref", "extern.convert_any", "any.convert_extern",
              "array.fill", "array.init_data", "array.new_elem", "array.init_elem"} if OLD else set()
FUNC_BAD = {"call_ref", "array.new_data"} if OLD else set()


def walk(f):
    for b in f.body:
        yield from b.walk()


def module_bad(m):
    if not OLD and any(t.rec for t in m.types):
        return True
    return OLD and any(n.op in MODULE_BAD or n.op in ATOMIC or n.op == "atomic.fence" for f in m.funcs for n in walk(f))


def func_bad(m, f):
    reasons = set()
    gl = {g[0]: g for g in m.globals}
    mem64 = {mm[0] for mm in m.memories if mm[1] == "i64"}
    for n in walk(f):
        if n.op in FUNC_BAD:
            reasons.add(n.op)
        if n.op == "block" and any(isinstance(i, list) and i[0] == "result" and len(i) > 2 for i in n.imms):
            reasons.add("multi-value")
        if n.op == "call" and n.imms[0] == "$th4":
            reasons.add("multi-value")
        if n.op.startswith("return_call") and any(x.op == "loop" for x in walk(f)):
            reasons.add("tail call with loop")
        if n.op.startswith("struct.get") and n.kids and any(k.op == "table.get" for k in n.kids[0].walk()) \
                and m.meta.get("ttypes"):
            reasons.add("typed-table struct.get")
        if not OLD:
            continue
        if n.op in ("global.get", "global.set"):
            g = gl.get(n.imms[0])
            if g and (g[1] == "f32" or (isinstance(g[1], tuple) and n.op == "global.get")):
                reasons.add("f32/ref global")
        if n.op == "memory.grow" and (n.imms[0] in mem64 or (not n.imms[0].startswith("$") and m.memories[0][1] == "i64")):
            reasons.add("memory64 grow")
    return reasons


def text(n):
    return n.text(-1)


WRITES = ("memory.grow", "table.grow", "call", "global.set")


def shapes(m):
    out = set()
    for f in m.funcs:
        ns = list(walk(f))
        ops = {n.op for n in ns}
        for n in ns:
            if n.op in ("select", "array.new_fixed", "struct.new", "i32.sub", "i32.xor", "i64.sub", "i64.xor", "i32.eq"):
                ks = n.kids
                for i in range(len(ks)):
                    for j in range(i + 1, len(ks)):
                        if ks[i].size() > 1 and text(ks[i]) == text(ks[j]) and any(
                                x.op in WRITES or ".atomic." in x.op for x in ks[i].walk()):
                            out.add("a")
            if n.op == "loop":
                body = n.kids
                unc = any(k.op == "br" and k.imms and k.imms[0] == n.imms[0] for k in body) or \
                    (len(body) == 1 and body[0].op == "br_if" and "cnt" not in text(body[0]))
                if unc and ops & {"i32.div_u", "i32.div_s", "i32.rem_u", "i32.rem_s", "i32.load", "call", "i32.trunc_f32_s"}:
                    out.add("b")
            if n.op == "loop":
                sub = {x.op for x in n.walk()}
                if sub & {"struct.new", "array.new"} and sub & {"struct.set", "array.set"}:
                    out.add("c")
            if n.op.startswith("struct.get") and n.kids and any(k.op == "table.get" for k in n.kids[0].walk()) \
                    and m.meta.get("ttypes"):
                out.add("d")
            if n.op.endswith(".abs") and n.kids and n.kids[0].op.endswith((".mul", ".div")) and \
                    len(n.kids[0].kids) == 2 and text(n.kids[0].kids[0]) == text(n.kids[0].kids[1]):
                if any(x.op.endswith("reinterpret_f32") or x.op.endswith("reinterpret_f64") for x in ns):
                    out.add("e")
            if n.op in ("i32.store", "i64.store", "f32.store", "f64.store", "i32.load", "i64.load", "f32.load", "f64.load",
                        "memory.fill", "memory.copy") and n.kids:
                a = text(n.kids[0])
                if "65536" in a or any(x in a for x in ("65534", "65535", "65533", "65532", "65528", "65529", "65530")):
                    out.add("f")
            if ".atomic.load" in n.op and any(p.op.endswith(("reinterpret_i32", "reinterpret_i64")) for p in ns):
                out.add("g")
    return out


def main():
    n = int(sys.argv[1]) if len(sys.argv) > 1 else 100
    seed0 = int(sys.argv[2]) if len(sys.argv) > 2 else 424242
    fams = sorted(table.FOCUS_TAGS) + [None]
    ops, pairs, combos = collections.Counter(), collections.Counter(), collections.Counter()
    shape_all, shape_n = collections.Counter(), 0
    shape_focus = collections.defaultdict(collections.Counter)
    fam_stats = collections.defaultdict(lambda: collections.Counter())
    rowcnt = collections.Counter()
    nmod = 0
    for i, fam in enumerate(fams):
        for k in range(n):
            m = gen.gen_module(seed0 + 1000 * i + k, flags=None if fam is None else (k % 5 == 0, k % 9 == 0, fam))
            nmod += 1
            mb = module_bad(m)
            sh = shapes(m)
            for s in sh:
                shape_focus[fam][s] += 1
            if fam is None:
                shape_n += 1
                for s in sh:
                    shape_all[s] += 1
            fam_stats[fam]["modules"] += 1
            fam_stats[fam]["module_err"] += 1 if mb else 0
            for f in m.funcs:
                if not (f.export or "").startswith("f"):
                    continue
                fams_f, feats = func_features(f)
                for op in {x.op for x in walk(f)}:
                    ops[op] += 1
                fl = sorted(feats)
                combos["+".join(fl)] += 1
                for a in range(len(fl)):
                    for b in range(a + 1, len(fl)):
                        pairs[fl[a] + "&" + fl[b]] += 1
                bad = func_bad(m, f)
                fam_stats[fam]["funcs"] += 1
                fam_stats[fam]["func_unsup"] += 1 if bad else 0
                fam_stats[fam]["func_lost"] += 1 if (bad or mb) else 0
                for rw in f.meta.get("rows", {}):
                    rowcnt[rw] += 1
    allsimd = set(SIMD) | set(VMEM)
    print("modules %d, distinct opcodes %d (simd %d/%d, atomic %d/%d), feature pairs %d, feature combos %d" % (
        nmod, len(ops), len(allsimd & set(ops)), len(allsimd), len(set(ATOMIC) & set(ops)), len(ATOMIC), len(pairs), len(combos)))
    print("rows used at least once: %d of %d" % (len(rowcnt), len(table.ROWS)))
    print("never used rows:", sorted(set(r.name for r in table.ROWS) - set(rowcnt))[:60])
    print("\nknown-bug shapes in generic modules (focus none), %% of %d modules:" % shape_n)
    for s in "abcdefg":
        print("  %s: %5.1f%%   (with its focus tag: %s)" % (s, 100 * shape_all[s] / max(1, shape_n),
              {"a": "sh_dup", "b": "sh_noret", "c": "sh_alloc", "d": "sh_tinit", "e": "sh_nan", "f": "sh_edge", "g": "-"}[s]
              + " %.0f%%" % (100 * shape_focus[{"a": "sh_dup", "b": "sh_noret", "c": "sh_alloc", "d": "sh_tinit",
                                                  "e": "sh_nan", "f": "sh_edge"}.get(s)][s] / n) if s != "g" else "-"))
    print("\nstatic exwasm-0930 estimate per focus family (functions lost for oracle A = function-level reject or module-level error):")
    print("%-10s %7s %9s %9s %9s" % ("focus", "funcs", "fn-unsup%", "mod-err%", "lost%"))
    for fam in fams:
        s = fam_stats[fam]
        print("%-10s %7d %8.1f%% %8.1f%% %8.1f%%" % (fam, s["funcs"], 100 * s["func_unsup"] / s["funcs"],
                                                   100 * s["module_err"] / s["modules"], 100 * s["func_lost"] / s["funcs"]))
    tot = collections.Counter()
    for s in fam_stats.values():
        tot.update(s)
    print("%-10s %7d %8.1f%% %8.1f%% %8.1f%%" % ("all", tot["funcs"], 100 * tot["func_unsup"] / tot["funcs"],
                                               100 * tot["module_err"] / tot["modules"], 100 * tot["func_lost"] / tot["funcs"]))
    print("\ntop feature pairs:", pairs.most_common(8))
    print("rarest feature pairs:", sorted(pairs.items(), key=lambda kv: kv[1])[:8])


if __name__ == "__main__":
    main()
