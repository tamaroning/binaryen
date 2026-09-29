#!/usr/bin/env python3
"""Worker: generate -> optimize with several pass configs -> V8 differential.

usage: drive.py WORKDIR MODE SEED0   (MODE: ca | int | float)
Findings go to WORKDIR/bad/<n>/ with the module, the config and the message.
"""
import os
import random
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
WASM_OPT = os.environ.get("WASM_OPT", "wasm-opt")
FE = ["--enable-nontrapping-float-to-int", "--enable-sign-ext",
      "--enable-bulk-memory", "--enable-mutable-globals", "--enable-tail-call"]

LEVELS = [["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"],
          ["--converge", "-O3"], ["-O3", "-O3"]]
CA_POOL = ["--constraint-analysis", "--precompute-propagate", "--ssa",
           "--simplify-locals", "--merge-blocks", "--remove-unused-brs",
           "--optimize-instructions", "--coalesce-locals", "--vacuum",
           "--flatten", "--code-folding", "--licm", "--rse", "--dce",
           "--merge-locals", "--local-cse", "--precompute",
           "--simplify-locals-nostructure", "--reorder-locals",
           "--code-pushing", "--tuple-optimization", "--untee",
           "--remove-unused-names"]
VAL_POOL = ["--optimize-instructions", "--precompute", "--precompute-propagate",
            "--simplify-locals", "--code-folding", "--code-pushing",
            "--remove-unused-brs", "--merge-blocks", "--vacuum", "--dce",
            "--coalesce-locals", "--rse", "--local-cse", "--licm", "--ssa",
            "--pick-load-signs", "--avoid-reinterprets", "--heap-store-optimization",
            "--merge-locals", "--inlining-optimizing", "--dae-optimizing",
            "--simplify-globals-optimizing", "--flatten", "--untee",
            "--constraint-analysis", "--signext-lowering", "--const-hoisting",
            "--generate-stack-ir", "--optimize-stack-ir", "--monomorphize",
            "--once-reduction", "--memory-packing", "--duplicate-function-elimination",
            "--merge-similar-functions", "--tail-call", "--optimize-casts",
           
            "--remove-unused-module-elements", "--reorder-globals",
            "--precompute-propagate", "--simplify-locals-notee-nostructure",
            "--local-subtyping", "--directize", "--dae2", "--inlining",
            "--simplify-globals", "--propagate-globals-globally", "--signature-refining",
            "--global-refining", "--monomorphize-always"]
# optimize-added-constants* assume low memory is unused; exclude from val mode.


I64L = [["--flatten", "--i64-to-i32-lowering"],
        ["--flatten", "--i64-to-i32-lowering", "-O1"],
        ["-O2", "--flatten", "--i64-to-i32-lowering"],
        ["--flatten", "--i64-to-i32-lowering", "-O3"],
        ["-O3", "--flatten", "--i64-to-i32-lowering", "-Oz"]]


IND_POOL = ["--generate-global-effects", "--vacuum", "--simplify-locals", "--local-cse",
            "--code-pushing", "--inlining-optimizing", "--gufa-optimizing", "--directize",
            "--dce", "--remove-unused-module-elements", "--rse", "--licm", "--merge-blocks",
            "--precompute-propagate", "--optimize-instructions", "--dae-optimizing",
            "--signature-pruning", "--signature-refining", "--type-refining", "--gto",
            "--remove-unused-brs", "--heap2local", "--once-reduction", "--monomorphize"]


def configs(r, mode):
    if mode == "i64l":
        return I64L
    if mode == "ind":
        out = [["--generate-global-effects", "-O3"], r.choice(LEVELS)]
        for _ in range(4):
            out.append(["--generate-global-effects"] + r.sample(IND_POOL, r.randrange(1, 5)))
        out.append(["--generate-global-effects", r.choice(["-O1", "-O2", "-O3"]), "--generate-global-effects", r.choice(["-O1", "-O2", "-O3"])])
        return [["--closed-world"] + c for c in out if "-O4" not in c]
    out = []
    lv = r.sample(LEVELS, 2)
    out += lv
    pool = CA_POOL + (["--heap2local", "--optimize-casts", "--gufa", "--heap-store-optimization"] if mode == "car" else []) if mode in ("ca", "catee", "car") else VAL_POOL
    if mode in ("ca", "catee", "car"):
        out.append(["--constraint-analysis"])
    if mode != "ca" and r.random() < 0.5:
        out.append(r.sample(pool, r.randrange(0, 3)) + ["--tail-call"] + r.sample(pool, r.randrange(0, 2)))
    for _ in range(4):
        chain = r.sample(pool, r.randrange(1, 5))
        if mode in ("ca", "catee", "car") and "--constraint-analysis" not in chain:
            chain.insert(r.randrange(len(chain) + 1), "--constraint-analysis")
        if mode == "car":
            chain = [p for p in chain if p != "--flatten"] or ["--constraint-analysis"]
        if "--dfo" in chain and "--flatten" not in chain:
            chain.insert(0, "--flatten")
        out.append(chain)
    if r.random() < 0.3:
        out.append(r.choice(LEVELS) + r.sample(pool, 2) + r.choice(LEVELS))
    if mode == "car":
        # Flatten (also run by -O4) rejects br_on_* by design
        out = [c for c in out if "-O4" not in c and "--flatten" not in c] or [["--constraint-analysis"]]
    return out


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                           timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace") + p.stderr.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def main():
    wd, mode, seed0 = sys.argv[1], sys.argv[2], int(sys.argv[3])
    global FE
    if mode in ("car", "ind"):
        FE = FE + ["--enable-gc", "--enable-reference-types"]
    os.makedirs(os.path.join(wd, "bad"), exist_ok=True)
    tmp = os.path.join(wd, "tmp")
    os.makedirs(tmp, exist_ok=True)
    r = random.Random(seed0)
    it = 0
    nbad = len(os.listdir(os.path.join(wd, "bad")))
    stats = {"iter": 0, "diff": 0, "crash": 0, "hang": 0, "skip": 0}
    t0 = time.time()
    while True:
        it += 1
        seed = seed0 * 1000003 + it
        base = os.path.join(tmp, "m")
        if mode in ("ca", "catee"):
            gen = [sys.executable, os.path.join(HERE, "gen_ca.py"), str(seed), base] + (["tee"] if mode == "catee" else [])
        elif mode == "car":
            gen = [sys.executable, os.path.join(HERE, "gen_car.py"), str(seed), base]
        elif mode == "ind":
            gen = [sys.executable, os.path.join(HERE, "gen_ind.py"), str(seed), base]
        else:
            gen = [sys.executable, os.path.join(HERE, "gen.py"), str(seed),
                   "f" if mode == "float" else "i", base]
            if mode == "i64l":
                gen[3] = "l"
        rc, _ = run(gen, 30)
        if rc != 0:
            stats["skip"] += 1
            continue
        pre = ["--denan"] if mode == "float" else []
        if mode == "i64l":
            pre = ["--legalize-js-interface", "--remove-non-js-ops"]
        rc, msg = run([WASM_OPT, *FE, base + ".wat", *pre, "-o", base + ".wasm"], 30)
        if rc != 0:
            stats["skip"] += 1
            continue
        cfgs = configs(r, mode)
        outs = []
        findings = []
        for k, c in enumerate(cfgs):
            o = os.path.join(tmp, f"o{k}.wasm")
            rc, msg = run([WASM_OPT, *FE, base + ".wasm", *c, "-o", o], 60)
            if rc != 0:
                findings.append(("CRASH" if rc != "timeout" else "OPTHANG", c, msg[-3000:]))
                continue
            outs.append((o, c))
        if outs:
            if mode == "i64l":
                os.environ["VSKIP_I64_GLOBALS"] = "1"
            rc, msg = run(["node", os.path.join(HERE, "cmp.js"), base + ".wasm"] + [o for o, _ in outs], 120)
            if rc == "timeout":
                # figure out whether the base itself hangs
                rc0, _ = run(["node", os.path.join(HERE, "cmp.js"), base + ".wasm"], 60)
                if rc0 == "timeout":
                    stats["skip"] += 1
                else:
                    for o, c in outs:
                        rc1, m1 = run(["node", os.path.join(HERE, "cmp.js"), base + ".wasm", o], 60)
                        if rc1 == "timeout":
                            findings.append(("HANG", c, ""))
                        elif m1.startswith("DIFF"):
                            findings.append(("DIFF", c, m1))
            elif rc != 0:
                findings.append(("NODEERR", [], msg[-3000:]))
            else:
                byname = {o: c for o, c in outs}
                for line in msg.splitlines():
                    if line.startswith("DIFF"):
                        f = line.split()[1]
                        findings.append(("DIFF", byname.get(f, []), line))
        for kind, c, m in findings:
            nbad += 1
            d = os.path.join(wd, "bad", f"{nbad:05d}_{kind}")
            os.makedirs(d, exist_ok=True)
            for ext in (".wat", ".wasm", ".sig.json"):
                shutil.copy(base + ext, d)
            with open(os.path.join(d, "info.txt"), "w") as fh:
                fh.write(f"mode={mode} seed={seed}\nconfig={' '.join(c)}\n{m}\n")
            stats[{"DIFF": "diff", "CRASH": "crash", "HANG": "hang", "OPTHANG": "hang"}.get(kind, "crash")] += 1
        stats["iter"] += 1
        if it % 20 == 0:
            with open(os.path.join(wd, "stats.txt"), "w") as fh:
                fh.write(f"{stats} {time.time() - t0:.0f}s\n")


if __name__ == "__main__":
    main()
