#!/usr/bin/env python3
"""Round-5 translation validation of wasm-opt with exwasm-tv.

usage: tv2.py WORKDIR SEED0 [SECONDS]

Each iteration generates a module with gen_tv2.py, runs every pass config in
CONFIGS, converts the function body before/after to exwasm text, and asks
`exwasm-tv prove` whether the optimized body refines the original.  Identical
candidates within a module are proved once.  Counterexamples go to
WORKDIR/bad/NNNNN/, counters to WORKDIR/stats.json.
"""
import hashlib
import json
import os
import random
import re
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
SCR = "/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad"
WASM_OPT = os.environ.get("WASM_OPT", SCR + "/binaryen-tip/build/bin/wasm-opt")
EXWASM = os.environ.get("EXWASM", SCR + "/bin/exwasm-tv")
IL = os.environ.get("EXWASM_IL", SCR + "/il/wasm-3.0.sexp")
FE = ["--enable-multimemory", "--enable-memory64", "--enable-sign-ext",
      "--enable-bulk-memory", "--enable-mutable-globals"]

CONFIGS = [["--optimize-instructions"], ["--constraint-analysis"], ["--remove-unused-brs"],
           ["--precompute"], ["--precompute-propagate"], ["--code-folding"],
           ["--simplify-locals"], ["--simplify-locals-nostructure"], ["--merge-blocks"],
           ["--vacuum"], ["--dce"], ["--rse"], ["--local-cse"], ["--code-pushing"],
           ["--heap-store-optimization"], ["--pick-load-signs"], ["--merge-locals"],
           ["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"],
           ["--constraint-analysis", "--optimize-instructions"],
           ["--simplify-locals", "--constraint-analysis"],
           ["--flatten", "--constraint-analysis"],
           ["--flatten", "--simplify-locals", "--optimize-instructions"],
           ["--remove-unused-brs", "--optimize-instructions"],
           ["--optimize-instructions", "--remove-unused-brs"],
           ["--code-folding", "--optimize-instructions"],
           ["--precompute-propagate", "--remove-unused-brs", "--vacuum"],
           ["--ssa-nomerge", "--constraint-analysis", "--optimize-instructions"],
           ["--simplify-locals", "--remove-unused-brs", "--code-folding", "--merge-blocks"],
           ["-O3", "--converge"], ["-O2", "-O2"],
           ["--generate-stack-ir", "--optimize-stack-ir"]]


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


TYPE_RE = re.compile(r"^\(type \(;(\d+);\) \(func(.*)\)\)$")


def sig_of(s):
    ps, rs = [], []
    for kind, ts in re.findall(r"\((param|result)((?: [a-z0-9]+)*)\)", s):
        (ps if kind == "param" else rs).extend(ts.split())
    return ps, rs


def parse_module(txt):
    """Parse `wasm-tools print` output of a single-defined-function module."""
    types, fsig, gtypes, mems, fname = {}, [], [], [], []
    lines = txt.splitlines()
    func = None
    i = 0
    while i < len(lines):
        s = lines[i].strip()
        m = TYPE_RE.match(s)
        if m:
            types[int(m.group(1))] = sig_of(m.group(2))
        elif s.startswith("(import ") and "(func " in s:
            fsig.append(types[int(re.search(r"\(type (\d+)\)", s).group(1))])
            fname.append(".".join(re.findall(r'"([^"]*)"', s)[:2]))
        elif s.startswith("(memory "):
            mems.append("i64" if " i64 " in s else "i32")
        elif s.startswith("(global "):
            gtypes.append(re.search(r"(i32|i64|f32|f64)", s.split(";)", 1)[1]).group(1))
        elif s.startswith("(func "):
            ps, rs = sig_of(s)
            if "(type " in s and not ps and not rs:
                ps, rs = types[int(re.search(r"\(type (\d+)\)", s).group(1))]
            fsig.append((ps, rs))
            locs, body = [], []
            i += 1
            while i < len(lines):
                t = lines[i].strip()
                if t == ")":
                    break
                if t.startswith("(local "):
                    locs.extend(t[len("(local "):].rstrip(")").split())
                else:
                    t = re.sub(r"\(;.*?;\)", "", t)
                    t = t.split(";;")[0].strip()
                    t = re.sub(r"\s+", " ", t)
                    if t:
                        body.append(t)
                i += 1
            func = (ps, rs, locs, body)
        i += 1
    return {"types": types, "fsig": fsig, "gtypes": gtypes, "mems": mems, "func": func, "fname": fname}


CANON = ["env.h", "env.v"]


class Unsupported(Exception):
    pass


def to_exwasm(mod, shift_from, off):
    """Convert the function body into exwasm text, wrapped in a block."""
    ps, rs, locs, body = mod["func"]
    if len(rs) > 1:
        raise Unsupported("multi-result")
    out = []
    depth = 0
    for s in body:
        w = s.split()
        op = w[0]
        if op in ("block", "loop", "if"):
            if "(type" in s or "(param" in s:
                raise Unsupported("blocktype")
            depth += 1
        elif op == "end":
            depth -= 1
        elif op == "return":
            s = f"br {depth}"
        elif op in ("global.get", "global.set"):
            s = f"{s} ({mod['gtypes'][int(w[1])]})"
        elif op == "call":
            # name imports by their import name: passes may drop unused ones
            k = int(w[1])
            if k >= len(mod["fname"]) or mod["fname"][k] not in CANON:
                raise Unsupported("call-defined")
            p, r = mod["fsig"][k]
            s = f"call {CANON.index(mod['fname'][k])} (param {' '.join(p)}) (result {' '.join(r)})"
        elif op in ("local.get", "local.set", "local.tee"):
            k = int(w[1])
            if k >= shift_from:
                s = f"{op} {k + off}"
        elif op in ("call_indirect", "return_call", "try", "throw", "try_table"):
            raise Unsupported(op)
        out.append(s)
    res = f" (result {rs[0]})" if rs else ""
    return [f"block{res}", *out, "end"]


def prologue(np, locs, off, gtypes=()):
    # exwasm-tv sizes the global store from top-level instructions only, so
    # read every global once at the top (reads have no effect).
    out = []
    if not os.environ.get("NO_GLOBAL_PROLOGUE"):
        for k, t in enumerate(gtypes):
            out += [f"global.get {k} ({t})", "drop"]
    for j, t in enumerate(locs):
        out += [f"{t}.const 0", f"local.set {np + off + j}"]
    return out


def reason(msg):
    m = re.findall(r"error: (.*)", msg)
    r = m[-1] if m else msg.strip().splitlines()[-1] if msg.strip() else "empty"
    r = re.sub(r"`[^`]*`", "`X`", r)
    r = re.sub(r"\d+", "N", r)
    return r[:80]


def log_case(wd, kind, why, cmd, ck, wat, seed):
    """Append every proof that did not end in 'equivalent' (for re-proving)."""
    with open(os.path.join(wd, "nonproved.jsonl"), "a") as fh:
        fh.write(json.dumps({"kind": kind, "why": why, "cfg": ck, "seed": seed,
                             "cmd": cmd[1:], "wat": wat}) + "\n")


def bump(d, k, n=1):
    d[k] = d.get(k, 0) + n


def main():
    wd, seed0 = sys.argv[1], int(sys.argv[2])
    limit = float(sys.argv[3]) if len(sys.argv) > 3 else 1e18
    os.makedirs(os.path.join(wd, "bad"), exist_ok=True)
    tmp = os.path.join(wd, "tmp")
    os.makedirs(tmp, exist_ok=True)
    st = {"modules": 0, "genfail": 0, "opt_runs": 0, "opt_fail": 0, "opt_crash": {},
          "unchanged": 0, "dup": 0, "proved": 0, "cex": 0, "not_proved": 0,
          "timeout": 0, "unsupported": {}, "conv_unsupported": {}, "per_cfg": {}}
    nbad = 0
    t0 = time.time()
    it = 0
    while time.time() - t0 < limit:
        it += 1
        seed = seed0 * 1000003 + it
        base = os.path.join(tmp, "m")
        if os.environ.get("ONE"):
            # check one given module (sanity checks); stop after it
            if it > 1:
                break
            shutil.copy(os.environ["ONE"], base + ".wat")
            sj = os.environ["ONE"][:-4] + ".json"
            if os.path.exists(sj):
                shutil.copy(sj, base + ".json")
            else:
                with open(base + ".json", "w") as fh:
                    fh.write("{}")
        elif run([sys.executable, os.path.join(HERE, "gen_tv2.py"), str(seed), base], 30)[0] != 0:
            st["genfail"] += 1
            continue
        if run([WASM_OPT, *FE, base + ".wat", "-o", base + ".wasm"], 30)[0] != 0:
            st["genfail"] += 1
            continue
        wat_text = open(base + ".wat").read()
        rc, txt0 = run(["wasm-tools", "print", base + ".wasm"], 30)
        m0 = parse_module(txt0)
        st["modules"] += 1
        np = len(m0["func"][0])
        la = m0["func"][2]
        try:
            tgt = prologue(np, la, 0, m0["gtypes"]) + to_exwasm(m0, np, 0)
        except Unsupported as e:
            bump(st["conv_unsupported"], "target:" + str(e))
            continue
        seen = {"\n".join(m0["func"][3]) + "|" + ",".join(la)}
        for cfg in CONFIGS:
            ck = " ".join(cfg)
            pc = st["per_cfg"].setdefault(ck, {"proved": 0, "cex": 0, "other": 0})
            o = os.path.join(tmp, "o.wasm")
            st["opt_runs"] += 1
            rc, msg = run([WASM_OPT, *FE, base + ".wasm", *cfg, "-o", o], 60)
            if rc != 0:
                if rc == "timeout" or "Assertion" in msg or (isinstance(rc, int) and rc < 0):
                    key = "timeout" if rc == "timeout" else (re.findall(r"Assertion `[^']*'", msg) or ["signal"])[0][:80]
                    bump(st["opt_crash"], key)
                    d = os.path.join(wd, "crash")
                    os.makedirs(d, exist_ok=True)
                    if len(os.listdir(d)) < 50:
                        shutil.copy(base + ".wat", os.path.join(d, f"{seed}_{cfg[0].strip('-')}.wat"))
                else:
                    st["opt_fail"] += 1
                continue
            rc, txt1 = run(["wasm-tools", "print", o], 30)
            m1 = parse_module(txt1)
            if m1["func"] is None or m1["func"][0] != m0["func"][0] or m1["func"][1] != m0["func"][1]:
                bump(st["conv_unsupported"], "signature")
                continue
            lb = m1["func"][2]
            key = "\n".join(m1["func"][3]) + "|" + ",".join(lb)
            if key in seen:
                st["unchanged" if len(seen) == 1 and key == next(iter(seen)) else "dup"] += 1
                continue
            seen.add(key)
            try:
                cand = prologue(np, lb, len(la), m1["gtypes"]) + to_exwasm(m1, np, len(la))
            except Unsupported as e:
                bump(st["conv_unsupported"], "cand:" + str(e))
                pc["other"] += 1
                continue
            sig = m0["func"][0] + la + lb
            dead = ",".join(str(i) for i in range(len(sig)))
            cmd = [EXWASM, "--il", IL, "prove", "--locals", ",".join(sig), "--dead", dead,
                   "--memories", ",".join(m0["mems"]) or "i32", "--smt-timeout-ms", "20000",
                   "; ".join(tgt), "; ".join(cand)]
            rc, msg = run(cmd, 90)
            if rc == "timeout":
                st["timeout"] += 1
                pc["other"] += 1
                log_case(wd, "timeout", "process timeout", cmd, ck, wat_text, seed)
                continue
            if rc == 0 and "equivalent" in msg:
                st["proved"] += 1
                pc["proved"] += 1
                continue
            if "counterexample" in msg:
                log_case(wd, "cex", "", cmd, ck, wat_text, seed)
                st["cex"] += 1
                pc["cex"] += 1
                nbad += 1
                d = os.path.join(wd, "bad", f"{nbad:05d}")
                os.makedirs(d, exist_ok=True)
                shutil.copy(base + ".wat", d)
                shutil.copy(base + ".json", d)
                shutil.copy(base + ".wasm", d)
                shutil.copy(o, os.path.join(d, "o.wasm"))
                with open(os.path.join(d, "info.txt"), "w") as fh:
                    fh.write(f"seed={seed}\nconfig={ck}\n{msg[-3000:]}\n")
                    fh.write("---target\n" + "\n".join(tgt) + "\n---cand\n" + "\n".join(cand) + "\n")
                    fh.write("sig=" + ",".join(sig) + "\nmems=" + ",".join(m0["mems"]) + "\n")
                with open(os.path.join(d, "cmd.json"), "w") as fh:
                    json.dump(cmd, fh)
                continue
            pc["other"] += 1
            if "error: not proved" in msg:
                st["not_proved"] += 1
                why = reason(msg)
                bump(st.setdefault("not_proved_why", {}), why)
                log_case(wd, "not_proved", why, cmd, ck, wat_text, seed)
            else:
                log_case(wd, "unsupported", reason(msg), cmd, ck, wat_text, seed)
                why = reason(msg)
                bump(st["unsupported"], why)
                d = os.path.join(wd, "unsup")
                os.makedirs(d, exist_ok=True)
                if st["unsupported"][why] <= 3:
                    with open(os.path.join(d, f"{abs(hash(why)) % 100000}_{st['unsupported'][why]}.json"), "w") as fh:
                        json.dump({"why": why, "msg": msg[-1500:], "cmd": cmd, "cfg": ck}, fh)
        if it % 3 == 0:
            st["elapsed"] = round(time.time() - t0)
            with open(os.path.join(wd, "stats.json"), "w") as fh:
                json.dump(st, fh, indent=1)
    st["elapsed"] = round(time.time() - t0)
    with open(os.path.join(wd, "stats.json"), "w") as fh:
        json.dump(st, fh, indent=1)


if __name__ == "__main__":
    main()
