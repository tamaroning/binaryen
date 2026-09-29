#!/usr/bin/env python3
"""Feature-focused wasm-opt campaign (no exwasm): wasm-smith modules with the
features of PROFILE, optimized by random wasm-opt configurations, checked for
(1) wasm-opt crashes / invalid output and (2) V8 differences (cmp.js).

usage: drive.py WORKDIR PROFILE SEED0 [SECONDS]
Appends one JSON line per (module, config) to WORKDIR/results.jsonl, copies
every finding to WORKDIR/bad/NNNNN/, rewrites WORKDIR/stats.json atomically
after every module."""
import json
import os
import random
import shutil
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
SCR = "/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad"
WASM_OPT = os.environ.get("WASM_OPT", SCR + "/binaryen-tip/build/bin/wasm-opt")

# Every feature wasm-smith can emit except custom descriptors (whose exact
# types neither V8 nor the validator read).
BIN_FEATURES = ["--enable-sign-ext", "--enable-mutable-globals", "--enable-nontrapping-float-to-int",
                "--enable-bulk-memory", "--enable-reference-types", "--enable-multivalue",
                "--enable-exception-handling", "--enable-gc", "--enable-tail-call", "--enable-simd",
                "--enable-relaxed-simd", "--enable-memory64", "--enable-multimemory", "--enable-extended-const"]
# Features a profile does not name are turned off in wasm-smith.
SMITH_FEATURES = ["--exceptions-enabled", "--gc-enabled", "--tail-call-enabled", "--simd-enabled",
                  "--relaxed-simd-enabled", "--threads-enabled", "--shared-everything-threads-enabled",
                  "--wide-arithmetic-enabled", "--custom-page-sizes-enabled", "--memory64-enabled",
                  "--extended-const-enabled", "--reference-types-enabled",
                  "--bulk-memory-enabled", "--multi-value-enabled"]
COMMON_SMITH = ["--export-everything", "true", "--max-imports", "0", "--ensure-termination",
                "--canonicalize-nans", "true", "--allow-start-export", "false", "--min-funcs", "1",
                "--max-funcs", "8", "--max-instructions", "400", "--max-memory32-bytes", "131072",
                "--max-memory64-bytes", "131072", "--max-table-elements", "64"]
PROFILES = {
    # exceptions, tail calls, typed function references, tables
    "eh": (["--exceptions-enabled", "true", "--tail-call-enabled", "true", "--reference-types-enabled", "true",
            "--gc-enabled", "false", "--simd-enabled", "false", "--max-tables", "3", "--max-tags", "4"],
           ["--enable-exception-handling", "--enable-tail-call"]),
    # SIMD (not relaxed), bulk memory, memory64
    "simd": (["--simd-enabled", "true", "--relaxed-simd-enabled", "false", "--memory64-enabled", "true",
              "--bulk-memory-enabled", "true", "--gc-enabled", "false"],
             ["--enable-simd", "--enable-memory64"]),
    # everything new at once: GC, exceptions, tail calls, multi-memory, memory64, tables, bulk memory
    "mixed": (["--gc-enabled", "true", "--exceptions-enabled", "true", "--tail-call-enabled", "true",
               "--max-memories", "3", "--memory64-enabled", "true",
               "--max-tables", "3", "--simd-enabled", "false", "--custom-page-sizes-enabled", "false"],
              ["--enable-gc", "--enable-exception-handling", "--enable-tail-call", "--enable-multimemory",
               "--enable-memory64"]),
    # extended-const, multi-value, wide arithmetic-free integer/float mix, tables
    "misc": (["--extended-const-enabled", "true", "--multi-value-enabled", "true", "--max-tables", "4",
              "--simd-enabled", "false", "--gc-enabled", "false"],
             ["--enable-extended-const"]),
}
CONFIGS = [["-O1"], ["-O2"], ["-O3"], ["-O4"], ["-Os"], ["-Oz"], ["-O3", "--converge"],
           ["--optimize-instructions"], ["--precompute-propagate"], ["--remove-unused-brs"], ["--vacuum"],
           ["--simplify-locals"], ["--code-folding"], ["--merge-blocks"], ["--dce"], ["--local-cse"],
           ["--code-pushing"], ["--rse"], ["--coalesce-locals"], ["--heap2local"], ["--optimize-casts"],
           ["--inlining-optimizing"], ["--dae-optimizing"], ["--simplify-globals-optimizing"],
           ["--directize"], ["--remove-unused-module-elements"], ["--merge-similar-functions"],
           ["--duplicate-function-elimination"], ["--low-memory-unused", "--optimize-added-constants-propagate"], ["--licm"],
           ["--untee"], ["--flatten", "--simplify-locals"], ["--ssa-nomerge", "--optimize-instructions"],
           ["--generate-stack-ir", "--optimize-stack-ir"], ["--avoid-reinterprets"], ["--memory-packing"],
           ["--tuple-optimization"], ["--local-subtyping"], ["--type-ssa"], ["--gufa"], ["--monomorphize"],
           ["--outlining"], ["--pick-load-signs"], ["--heap-store-optimization"], ["--constraint-analysis"],
           ["--signext-lowering"], ["--memory64-lowering"], ["--multi-memory-lowering"],
           ["--dealign", "--alignment-lowering"], ["--translate-to-exnref"]]


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def save(wd, stats):
    tmp = os.path.join(wd, "stats.json.tmp")
    with open(tmp, "w") as f:
        json.dump(stats, f, indent=1, sort_keys=True)
    os.replace(tmp, os.path.join(wd, "stats.json"))


def keep(wd, stats, kind, files, info):
    stats["findings"] += 1
    d = os.path.join(wd, "bad", "%05d" % stats["findings"])
    os.makedirs(d, exist_ok=True)
    for f in files:
        if os.path.exists(f):
            shutil.copy(f, d)
    with open(os.path.join(d, "info.txt"), "w") as f:
        f.write(kind + "\n" + info + "\n")


def main():
    wd, prof, seed0 = sys.argv[1], sys.argv[2], int(sys.argv[3])
    secs = float(sys.argv[4]) if len(sys.argv) > 4 else 1e9
    smith_args, _ = PROFILES[prof]
    named = set(smith_args[0::2])
    smith_args = smith_args + [a for f in SMITH_FEATURES if f not in named for a in (f, "false")]
    feats = BIN_FEATURES
    os.makedirs(wd, exist_ok=True)
    rng = random.Random(seed0)
    stats = {"profile": prof, "modules": 0, "smith_fail": 0, "input_rejected": 0, "opt_runs": 0,
             "unchanged": 0, "crash": 0, "invalid_output": 0, "v8_diff": 0, "v8_same": 0, "timeout": 0,
             "findings": 0, "per_config": {}, "reject_reasons": {}, "crash_sigs": {}, "started": time.time()}
    base, opt, raw = (os.path.join(wd, x) for x in ("base.wasm", "opt.wasm", "raw.bin"))
    t0 = time.time()
    seed = seed0
    results = open(os.path.join(wd, "results.jsonl"), "a", buffering=1)
    last_save = 0.0
    while time.time() - t0 < secs:
        if time.time() - last_save > 30:
            stats["elapsed"] = time.time() - t0
            save(wd, stats)
            last_save = time.time()
        seed += 1
        with open(raw, "wb") as f:
            f.write(random.Random(seed).randbytes(rng.choice([2000, 5000, 12000])))
        rc, out = run(["wasm-tools", "smith"] + COMMON_SMITH + smith_args + [raw, "-o", base], 60)
        if rc != 0:
            stats["smith_fail"] += 1
            continue
        # Binaryen must accept the input as-is (round trip without passes).
        rc, out = run([WASM_OPT] + feats + [base, "-o", opt], 60)
        if rc != 0:
            stats["input_rejected"] += 1
            r = (out.strip().splitlines() or ["?"])[-1][:80]
            stats["reject_reasons"][r] = stats["reject_reasons"].get(r, 0) + 1
            continue
        stats["modules"] += 1
        for cfg in rng.sample(CONFIGS, 3):
            key = " ".join(cfg)
            pc = stats["per_config"].setdefault(key, {"runs": 0, "crash": 0, "diff": 0, "unchanged": 0})
            pc["runs"] += 1
            stats["opt_runs"] += 1
            rc, out = run([WASM_OPT] + feats + cfg + [base, "-o", opt], 120)
            rec = {"seed": seed, "cfg": key}
            if rc == "timeout":
                stats["timeout"] += 1
                rec["v"] = "opt-timeout"
            elif rc != 0:
                if "Fatal" in out or "Assertion" in out or rc < 0 or "error" in out.lower():
                    stats["crash"] += 1
                    pc["crash"] += 1
                    rec["v"] = "crash"
                    rec["msg"] = out.strip().splitlines()[-1][:200] if out.strip() else str(rc)
                    # Signature: the assertion / UNREACHABLE / Fatal line, without paths.
                    sig = next((ln for ln in out.splitlines() if "Assertion" in ln or "UNREACHABLE" in ln or ln.startswith("Fatal")), rec["msg"])
                    sig = sig.split("/src/")[-1][:160]
                    rec["sig"] = sig
                    seen = stats["crash_sigs"].get(sig, 0)
                    stats["crash_sigs"][sig] = seen + 1
                    if seen < 5:
                        keep(wd, stats, "crash " + key + "\n" + sig, [base], out[-3000:])
            else:
                if open(base, "rb").read() == open(opt, "rb").read():
                    stats["unchanged"] += 1
                    pc["unchanged"] += 1
                vrc, vout = run(["wasm-tools", "validate", "--features", "all", opt], 60)
                if vrc != 0:
                    stats["invalid_output"] += 1
                    rec["v"] = "invalid"
                    keep(wd, stats, "invalid output " + key, [base, opt], vout[-2000:])
                else:
                    crc, cout = run(["node", "--experimental-wasm-exnref", os.path.join(HERE, "cmp.js"), base, opt], 120)
                    try:
                        r = json.loads(cout.strip().splitlines()[-1])
                    except (ValueError, IndexError):
                        r = {"same": True, "detail": "cmp failed: " + cout[-200:]}
                    if r.get("same"):
                        stats["v8_same"] += 1
                        rec["v"] = "same"
                    else:
                        stats["v8_diff"] += 1
                        pc["diff"] += 1
                        rec["v"] = "v8-diff"
                        rec["detail"] = r.get("detail", "")[:300]
                        keep(wd, stats, "v8 diff " + key, [base, opt], r.get("detail", ""))
            results.write(json.dumps(rec) + "\n")
        stats["elapsed"] = time.time() - t0
        save(wd, stats)
    save(wd, stats)


if __name__ == "__main__":
    main()
