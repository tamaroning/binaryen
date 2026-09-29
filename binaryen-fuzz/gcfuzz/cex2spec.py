#!/usr/bin/env python3
"""Turn an exwasm-gc2 tv counterexample line into a cmp.js spec.

usage: cex2spec.py M.wat FNAME DETAIL_TEXT_FILE  -> prints spec JSON
       cex2spec.py M.wat FNAME --ptypes          -> prints param type list
"""
import json
import re
import sys


def params_of(wat, fname):
    m = re.search(r'\(func \$\S+ \(export "%s"\)((?: \(param \$\S+ [^()]*(?:\([^()]*\))?[^()]*\))*)' % re.escape(fname), wat)
    ps = []
    for pm in re.finditer(r'\(param \$\S+ ((?:\(ref null (?:\$(\w+)|i31)\))|i32|i64)\)', m.group(1)):
        t = pm.group(1)
        if t in ("i32", "i64"):
            ps.append(t)
        elif "i31" in t:
            ps.append("i31")
        else:
            ps.append(pm.group(2))
    return ps


def main():
    wat = open(sys.argv[1]).read()
    ps = params_of(wat, sys.argv[2])
    if sys.argv[3] == "--ptypes":
        print(json.dumps(ps))
        return
    det = open(sys.argv[3]).read()
    loc = [int(x) for x in re.search(r"locals: \[([^\]]*)\]", det).group(1).replace(" ", "").split(",") if x]
    kv = dict(re.findall(r"(\S+)=(\S+)", det))
    entries = []
    si = ai = 0
    ent_of_param = {}
    for i, t in enumerate(ps):
        if t in ("i32", "i64", "i31"):
            continue
        if t.startswith("S"):
            vals = [int(kv.get("hs%d.%d" % (si, j), "0")) for j in range(4)]
            si += 1
        else:
            vals = [int(kv.get("ha%d.%d" % (ai, j), "0")) for j in range(2)]
            ai += 1
        # S1's field 1 is a (null) reference; keep positions as cmp.js expects
        if t == "S1":
            vals = [vals[0], 0, vals[2]]
        entries.append({"T": t, "f": vals})
        ent_of_param[i] = len(entries) - 1
    params = []
    k = 0
    for i, t in enumerate(ps):
        if t == "i32":
            v = loc[i] & 0xffffffff
            params.append({"k": "i32", "v": v - (1 << 32) if v >= 1 << 31 else v})
        elif t == "i64":
            params.append({"k": "i64", "v": str(loc[i])})
        else:
            c = int(kv.get("refparam%d" % k, "0"))
            choices = [{"k": "null"}]
            if t == "i31":
                v = int(kv.get("refparam%d.i31" % k, "0"))
                choices.append({"k": "i31", "v": v - (1 << 31) if v >= 1 << 30 else v})
            else:
                for j, tt in enumerate(ps):
                    if tt == t:
                        choices.append({"k": "obj", "i": ent_of_param[j]})
            params.append(choices[c])
            k += 1
    mem = {}
    mm = re.search(r"over: \{([^}]*)\}", det)
    if mm and mm.group(1).strip():
        for a, v in re.findall(r"(\d+): (\d+)", mm.group(1)):
            mem[a] = int(v)
    g = re.search(r"globals: \[([^\]]*)\]", det)
    globs = [int(x) for x in g.group(1).replace(" ", "").split(",") if x] if g else []
    spec = {"params": params, "entries": entries, "mem": mem}
    if len(globs) >= 2:
        spec["globals"] = globs[:2]
    print(json.dumps(spec))


main()
