#!/usr/bin/env python3
"""Build a coverage corpus: N modules the way drive.build makes them (gen / mix sources + mutations),
each with the wasm-opt feature flags and 2-3 pass configurations drive.pick_config picks.

usage: corpus.py OUTDIR N [--seed0 S] [--baseline] [--battery] [--focus TAG]
  --baseline  switch the "cov" row family and the cov_* mutators off (the generator before this work)
writes OUTDIR/m<i>.wasm and OUTDIR/jobs.jsonl  ({"wasm", "feats", "cfg"} per line)
"""
import json
import os
import random
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))
import cfg  # noqa: E402
import drive  # noqa: E402
import gen  # noqa: E402
import mut  # noqa: E402
import table  # noqa: E402
from wmod import Unsupported  # noqa: E402


# fixed configurations per module (--battery): isolates the effect of the module shapes from the
# random pass choice
BATTERY = [["-O3"], ["--closed-world", "-O3"], ["--closed-world", "-O4"], ["-Os"], ["--closed-world", "-Oz"], ["-O1"],
           ["--closed-world", "--gsi", "--gufa", "--cfp", "--type-refining", "--abstract-type-refining",
            "--signature-refining", "--signature-pruning", "--unsubtyping", "--gto", "--remove-unused-types", "-O2"],
           ["--generate-global-effects", "-O3", "--inlining-optimizing", "--optimize-level=3", "-O3"],
           ["--flatten", "--simplify-locals-notee-nostructure", "--local-cse", "--licm", "--rse", "-O2"]]


def main():
    out, n = sys.argv[1], int(sys.argv[2])
    seed0 = int(sys.argv[sys.argv.index("--seed0") + 1]) if "--seed0" in sys.argv else 700000
    baseline = "--baseline" in sys.argv
    os.makedirs(out, exist_ok=True)
    cf = cfg.load()
    cf["mutations"] = [1, 4]
    mw = {}
    if baseline:
        table.FEATURES_ON.discard("cov")
        table.FOCUS_TAGS.discard("cov")
        mw = {x: 0.0 for x in mut.MUTATORS if x.startswith("cov_")}
    wts = drive.pass_weights()
    jobs = open(out + "/jobs.jsonl", "w")
    k = 0
    seed = seed0
    while k < n:
        seed += 1
        r = random.Random(seed)
        fl = gen.pick_flags(random.Random(seed * 7 + 1), cf)
        if "--focus" in sys.argv:
            fl = (fl[0], fl[1], sys.argv[sys.argv.index("--focus") + 1])
        m = gen.gen_module(seed, None, flags=fl)
        pool = []
        if r.random() < .5:
            mu = mut.Mut(r, m, pool, mw)
            for _ in range(r.randint(1, 3)):
                f = r.choice(m.funcs)
                try:
                    mut.type_func(m, f)
                    mu.m_splice(f, pool_only=True)
                except (Unsupported, ValueError, KeyError, IndexError, TypeError, AttributeError):
                    pass
        mut.mutate(r, m, pool, r.randint(1, 4), mw)
        wat = "%s/m%d.wat" % (out, k)
        wasm = "%s/m%d.wasm" % (out, k)
        with open(wat, "w") as fh:
            fh.write(m.text())
        if subprocess.run(["wasm-tools", "parse", wat, "-o", wasm], capture_output=True).returncode or \
                subprocess.run(["wasm-tools", "validate", "--features", "all", wasm], capture_output=True).returncode:
            continue
        text = open(wat).read()
        noeh = bool(m.meta.get("noeh"))
        feats = cfg.features_for(cfg.FEATURES, text, noeh)
        focus = m.meta.get("focus")
        if "--battery" in sys.argv:
            for c in BATTERY:
                jobs.write(json.dumps({"wasm": wasm, "feats": feats, "cfg": c}) + "\n")
            os.remove(wat)
            k += 1
            continue
        for _ in range(r.randint(*cf["configs_per_module"])):
            c, kind = drive.pick_config(r, wts, focus, cf.get("shape_bias", .3))
            jobs.write(json.dumps({"wasm": wasm, "feats": feats, "cfg": c}) + "\n")
        os.remove(wat)
        k += 1
    jobs.close()


if __name__ == "__main__":
    main()
