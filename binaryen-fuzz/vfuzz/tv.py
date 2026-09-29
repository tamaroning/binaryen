#!/usr/bin/env python3
"""Translation validation of wasm-opt on straight-line integer functions,
using exwasm (semantics derived from the SpecTec spec) as the oracle.

usage: tv.py WORKDIR SEED0
For every function whose optimized body is still straight-line, asks
`exwasm prove` whether original and optimized bodies are equivalent for all
parameter values and all memory contents. Counterexamples go to WORKDIR/bad.
"""
import os
import random
import re
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
WASM_OPT = os.environ.get("WASM_OPT", "wasm-opt")
EXWASM = os.environ.get("EXWASM", "/home/tamaron/work/exwasm/target/release/exwasm")
FE = ["--enable-sign-ext", "--enable-bulk-memory", "--enable-mutable-globals"]

CONFIGS = [["--optimize-instructions"], ["--precompute"], ["--precompute-propagate"],
           ["-O1"], ["-O2"], ["-O3"], ["-Os"], ["-Oz"], ["--simplify-locals"],
           ["--pick-load-signs"], ["--code-pushing"], ["--rse"], ["--local-cse"],
           ["--optimize-instructions", "--precompute-propagate", "--optimize-instructions"],
           ["--simplify-locals", "--optimize-instructions"], ["--ssa", "--optimize-instructions"],
           ["--flatten", "--simplify-locals", "--optimize-instructions"],
           ["--local-cse", "--optimize-instructions"], ["--merge-locals", "--optimize-instructions"],
           ["--coalesce-locals", "--optimize-instructions"], ["--vacuum"],
           ["--avoid-reinterprets"], ["--heap-store-optimization"], ["--const-hoisting"],
           ["--generate-stack-ir", "--optimize-stack-ir"], ["-O4"],
           ["--optimize-instructions", "--optimize-instructions"], ["--untee"],
           ["--constraint-analysis"], ["--dce"], ["--simplify-locals-nostructure"],
           ["--tuple-optimization"], ["--code-folding"], ["--merge-blocks"]]

BAD = re.compile(r"^(if|else|end|block|loop|br|br_if|br_table|call|call_indirect|return|"
                 r"unreachable|global\.|memory\.|table\.|ref\.|f32|f64|i32\.trunc|i64\.trunc|"
                 r"i32\.reinterpret|i64\.reinterpret|try|throw)")


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def funcs(wat):
    """Parse `wasm2wat --no-debug-names` output into (params, results, locals, instrs)."""
    out = []
    lines = wat.splitlines()
    i = 0
    while i < len(lines):
        ln = lines[i].strip()
        if ln.startswith("(func "):
            params = []
            results = []
            for grp in re.findall(r"\((param|result)((?: [a-z0-9]+)*)\)", ln):
                (params if grp[0] == "param" else results).extend(grp[1].split())
            locs = []
            body = []
            one_line = ln.endswith(")") and ln.count("(") == ln.count(")")
            i += 1
            while not one_line and i < len(lines):
                s = lines[i].strip()
                if s.startswith("(local "):
                    locs.extend(s[len("(local "):].rstrip(")").split())
                    i += 1
                    continue
                last = False
                if s.endswith(")") and s.count(")") > s.count("("):
                    s = s[: len(s) - (s.count(")") - s.count("("))]
                    last = True
                if s:
                    body.append(s)
                i += 1
                if last:
                    break
            out.append((params, results, locs, body))
            continue
        i += 1
    return out


def shift(body, np, off):
    res = []
    for s in body:
        m = re.match(r"^(local\.(?:get|set|tee)) (\d+)$", s)
        if m and int(m.group(2)) >= np:
            s = f"{m.group(1)} {int(m.group(2)) + off}"
        res.append(s)
    return res


def prologue(np, locs, off):
    return [f"{t}.const 0\nlocal.set {np + off + j}" for j, t in enumerate(locs)]


def main():
    wd, seed0 = sys.argv[1], int(sys.argv[2])
    os.makedirs(os.path.join(wd, "bad"), exist_ok=True)
    tmp = os.path.join(wd, "tmp")
    os.makedirs(tmp, exist_ok=True)
    r = random.Random(seed0)
    stats = {"iter": 0, "proved": 0, "cex": 0, "same": 0, "skip": 0, "err": 0, "timeout": 0}
    nbad = 0
    t0 = time.time()
    it = 0
    while True:
        it += 1
        seed = seed0 * 1000003 + it
        base = os.path.join(tmp, "m")
        if run([sys.executable, os.path.join(HERE, "gen.py"), str(seed), "s", base], 30)[0] != 0:
            continue
        if run([WASM_OPT, *FE, base + ".wat", "-o", base + ".wasm"], 30)[0] != 0:
            continue
        rc, wat0 = run(["wasm2wat", "--no-debug-names", base + ".wasm"], 30)
        f0 = funcs(wat0)
        for cfg in r.sample(CONFIGS, 6):
            o = os.path.join(tmp, "o.wasm")
            if run([WASM_OPT, *FE, base + ".wasm", *cfg, "-o", o], 60)[0] != 0:
                continue
            rc, wat1 = run(["wasm2wat", "--no-debug-names", o], 30)
            f1 = funcs(wat1)
            if len(f1) != len(f0):
                continue
            for k, (a, b) in enumerate(zip(f0, f1)):
                pa, ra, la, ba = a
                pb, rb, lb, bb = b
                if pa != pb or ra != rb:
                    stats["skip"] += 1
                    continue
                if ba == bb and la == lb:
                    stats["same"] += 1
                    continue
                if any(BAD.match(s) for s in ba + bb) or any(t.startswith("f") for t in pa + la + lb + ra):
                    stats["skip"] += 1
                    continue
                np = len(pa)
                sig = pa + la + lb
                tgt = prologue(np, la, 0) + ba
                cand = prologue(np, lb, len(la)) + shift(bb, np, len(la))
                dead = ",".join(str(i) for i in range(len(sig)))
                cmd = [EXWASM, "prove", "--locals", ",".join(sig), "--dead", dead,
                       "--smt-timeout-ms", "10000", "\n".join(tgt), "\n".join(cand)]
                rc, msg = run(cmd, 60)
                if rc == "timeout" or "not proved" in msg or "unknown" in msg.lower() or "timeout" in msg.lower():
                    stats["timeout"] += 1
                    continue
                if "equivalent" in msg:
                    stats["proved"] += 1
                    continue
                kind = "CEX" if "counterexample" in msg else "ERR"
                stats["cex" if kind == "CEX" else "err"] += 1
                if kind == "ERR" and "unsupported" in msg:
                    continue
                nbad += 1
                d = os.path.join(wd, "bad", f"{nbad:05d}_{kind}")
                os.makedirs(d, exist_ok=True)
                shutil.copy(base + ".wat", d)
                shutil.copy(base + ".wasm", d)
                shutil.copy(o, os.path.join(d, "o.wasm"))
                with open(os.path.join(d, "info.txt"), "w") as fh:
                    fh.write(f"seed={seed}\nconfig={' '.join(cfg)}\nfunc={k}\n{msg[-2000:]}\n")
                    fh.write("---target\n" + "\n".join(tgt) + "\n---cand\n" + "\n".join(cand) + "\n")
                    fh.write("sig=" + ",".join(sig) + "\n")
        stats["iter"] += 1
        if it % 5 == 0:
            with open(os.path.join(wd, "stats.txt"), "w") as fh:
                fh.write(f"{stats} {time.time() - t0:.0f}s\n")


if __name__ == "__main__":
    main()
