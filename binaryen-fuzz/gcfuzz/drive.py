#!/usr/bin/env python3
"""GC translation-validation driver: gen_gc.py -> wasm-opt CONFIG -> exwasm-gc2 tv.

usage: drive.py WORKDIR SEED0 SECONDS

Counters go to WORKDIR/stats.json (rewritten after every module);
counterexamples and wasm-opt failures go to WORKDIR/bad/NNNNN/.
"""
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import gen_gc  # noqa: E402
import gen_ca  # noqa: E402
import gen_sub  # noqa: E402

SCR = "/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad"
WASM_OPT = SCR + "/binaryen-tip/build/bin/wasm-opt"
EXWASM = os.environ.get("EXWASM", SCR + "/bin/exwasm-gc2")

CONFIGS = [["--heap2local"], ["--precompute"], ["--precompute-propagate"], ["--optimize-instructions"],
           ["--remove-unused-brs"], ["--simplify-locals"], ["--local-cse"], ["--code-folding"],
           ["--vacuum"], ["--merge-blocks"], ["--dce"], ["--coalesce-locals"], ["--rse"],
           ["--heap-store-optimization"], ["--code-pushing"], ["--constraint-analysis"],
           ["--heap2local", "--optimize-instructions"],
           ["--heap2local", "--precompute-propagate"],
           ["--simplify-locals", "--heap2local"],
           ["--local-cse", "--optimize-instructions"],
           ["--precompute-propagate", "--optimize-instructions", "--vacuum"],
           ["--simplify-locals-notee-nostructure", "--optimize-instructions"],
           ["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"]]


SUB_CONFIGS = [["--optimize-instructions"], ["--remove-unused-brs"], ["--heap2local"], ["--precompute"],
               ["--precompute-propagate"], ["--simplify-locals"], ["--code-folding"], ["--vacuum"],
               ["--merge-blocks"], ["--dce"], ["--local-cse"], ["--constraint-analysis"], ["--gufa"],
               ["--local-subtyping"], ["--coalesce-locals"],
               ["--heap2local", "--optimize-instructions"], ["--remove-unused-brs", "--optimize-instructions"],
               ["--optimize-instructions", "--remove-unused-brs"], ["--simplify-locals", "--remove-unused-brs"],
               ["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"]]

PREFILTER = os.environ.get("PREFILTER", "1") == "1"

CA_CONFIGS = [["--constraint-analysis"], ["--constraint-analysis", "--optimize-instructions"],
              ["--simplify-locals", "--constraint-analysis"], ["--flatten", "--constraint-analysis"],
              ["--ssa-nomerge", "--constraint-analysis"], ["--optimize-instructions"], ["--remove-unused-brs"],
              ["--simplify-locals"], ["--precompute-propagate"], ["--local-cse"], ["--code-folding"],
              ["--heap2local"], ["-O1"], ["-O2"], ["-O3"], ["-Os"]]


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def split_funcs(wat):
    """Module text -> (header, [function texts]); the generators start every
    function on a line of its own with '  (func $f'."""
    parts = re.split(r"\n(?=  \(func \$f)", wat)
    head, funcs = parts[0], parts[1:]
    if funcs:
        last = funcs[-1].rstrip()
        assert last.endswith(")")
        funcs[-1] = last[:-1]
    return head, funcs


def prefilter(wd, wat):
    """Drop the functions exwasm-gc2 cannot validate against themselves."""
    head, funcs = split_funcs(wat)
    mw, mb = wd + "/pre.wat", wd + "/pre.wasm"
    open(mw, "w").write(wat)
    if run(["wasm-tools", "parse", mw, "-o", mb], 30)[0] != 0:
        return None, {}
    rc, out = run([EXWASM, "tv", mb, mb, "--smt-timeout-ms", "10000"], 300)
    bad = {}
    for line in out.splitlines():
        parts = line.split("\t")
        if len(parts) >= 3 and parts[1] != "equivalent":
            bad[parts[0]] = norm(parts[3] if len(parts) > 3 else "")
    keep = [f for f in funcs if re.match(r'\s*\(func \$(\w+)', f).group(1) not in bad]
    if not keep:
        return None, bad
    return head + "\n" + "\n".join(keep) + "\n)\n", bad


def norm(detail):
    d = re.sub(r"\d+", "N", detail.strip())
    return d[:90]


def main():
    wd, seed0, secs = sys.argv[1], int(sys.argv[2]), float(sys.argv[3])
    gen = sys.argv[4] if len(sys.argv) > 4 else "gc"
    configs = CA_CONFIGS if gen == "ca" else SUB_CONFIGS if gen == "sub" else CONFIGS
    gen_gc.ALIAS = gen == "alias"
    os.makedirs(wd + "/bad", exist_ok=True)
    stats = {"modules": 0, "invalid": 0, "funcs_validated": 0, "tv_runs": 0, "verdicts": {},
             "per_config": {}, "unsupported": {}, "unknown": {}, "error": {}, "optfail": 0, "cex": 0,
             "input_unsupported": {}, "input_funcs_dropped": 0}
    t0 = time.time()
    seed = seed0
    nbad = 0
    while time.time() - t0 < secs:
        seed += 1
        if gen == "ca":
            wat = gen_ca.gen_module(seed)
        elif gen == "sub":
            wat = gen_sub.gen_module(seed)
        else:
            wat = gen_gc.gen_module(seed, None, 1)
        if PREFILTER:
            wat, dropped = prefilter(wd, wat)
            for k in dropped.values():
                stats["input_unsupported"][k] = stats["input_unsupported"].get(k, 0) + 1
            stats["input_funcs_dropped"] += len(dropped)
            if wat is None:
                stats["invalid"] += 1
                continue
        mw = wd + "/m.wat"
        mb = wd + "/m.wasm"
        open(mw, "w").write(wat)
        rc, out = run(["wasm-tools", "parse", mw, "-o", mb], 30)
        if rc != 0:
            stats["invalid"] += 1
            continue
        rc, out = run([WASM_OPT, "-all", mb, "-o", wd + "/rt.wasm"], 30)
        if rc != 0:
            stats["invalid"] += 1
            continue
        stats["modules"] += 1
        seen = {}
        for cfg in configs:
            ck = " ".join(cfg)
            pc = stats["per_config"].setdefault(ck, {})
            ob = wd + "/o.wasm"
            rc, out = run([WASM_OPT, "-all"] + cfg + [mb, "-o", ob], 60)
            if rc != 0:
                stats["optfail"] += 1
                nbad += 1
                d = "%s/bad/%05d" % (wd, nbad)
                os.makedirs(d, exist_ok=True)
                shutil.copy(mw, d + "/m.wat")
                open(d + "/info.txt", "w").write("optfail seed=%d cfg=%s rc=%s\n%s" % (seed, ck, rc, out[-3000:]))
                continue
            h = hashlib.sha1(open(ob, "rb").read()).hexdigest()
            if h in seen:
                res = seen[h]
            else:
                rc, out = run([EXWASM, "tv", mb, ob, "--smt-timeout-ms", "10000"], 300)
                stats["tv_runs"] += 1
                res = []
                if rc == "timeout":
                    res = [("*", "unknown", "tv process timeout")]
                for line in out.splitlines():
                    parts = line.split("\t")
                    if len(parts) >= 3 and parts[1] in ("equivalent", "counterexample", "unsupported", "unknown"):
                        res.append((parts[0], parts[1], parts[3] if len(parts) > 3 else ""))
                if not res:
                    msg = [l for l in out.splitlines() if l.startswith("error")] or [out[-200:]]
                    res = [("*", "error", "tv module error: " + msg[0])]
                seen[h] = res
                if any(v == "counterexample" for _, v, _ in res):
                    stats["cex"] += 1
                    nbad += 1
                    d = "%s/bad/%05d" % (wd, nbad)
                    os.makedirs(d, exist_ok=True)
                    shutil.copy(mw, d + "/m.wat")
                    shutil.copy(mb, d + "/m.wasm")
                    shutil.copy(ob, d + "/o.wasm")
                    open(d + "/info.txt", "w").write("cex seed=%d cfg=%s\n%s" % (seed, ck, out))
            for fn, v, det in res:
                stats["funcs_validated"] += 1
                stats["verdicts"][v] = stats["verdicts"].get(v, 0) + 1
                pc[v] = pc.get(v, 0) + 1
                if v in ("unsupported", "unknown", "error"):
                    k = norm(det)
                    if k not in stats[v]:
                        # keep one example per reason
                        ed = wd + "/unsup/" + hashlib.sha1(k.encode()).hexdigest()[:10]
                        os.makedirs(ed, exist_ok=True)
                        shutil.copy(mw, ed + "/m.wat")
                        shutil.copy(ob, ed + "/o.wasm")
                        open(ed + "/info.txt", "w").write("%s\t%s\t%s\tcfg=%s\n" % (fn, v, det, ck))
                    stats[v][k] = stats[v].get(k, 0) + 1
        stats["last_seed"] = seed
        stats["elapsed"] = time.time() - t0
        json.dump(stats, open(wd + "/stats.json.tmp", "w"), indent=1, sort_keys=True)
        os.replace(wd + "/stats.json.tmp", wd + "/stats.json")


if __name__ == "__main__":
    main()
