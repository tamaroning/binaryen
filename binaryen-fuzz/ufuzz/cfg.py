"""Run configuration.  Workers re-read config.json before every module, so
switching the exwasm snapshot (or the SMT timeout) takes effect without a
restart: edit config.json, e.g. {"exwasm": ".../bin/exwasm-gc6"}."""
import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
SCR = "/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad"
DEFAULTS = {
    "exwasm": SCR + "/bin/exwasm-gc5",
    "il": HERE + "/il/wasm-3.0.sexp",
    "wasm_opt": SCR + "/binaryen-tip/build/bin/wasm-opt",
    "smt_timeout_ms": 10000,
    "tv_timeout_s": 300,
    "configs_per_module": [2, 3],
    "mutations": [1, 4],
    "source_weights": {"gen": 0.3, "mix": 0.3, "seed": 0.28, "raw": 0.12},
    "features": None,
    "seeds": HERE + "/seeds",
    "node": "node",
    # share of generated/seed modules whose kept functions also go through
    # the V8 differential (modules with functions exwasm rejects always do)
    "v8_rate": 1.0,
    # optional: a wasm-opt built with --coverage; every `cov_rate` config is
    # replayed with it (GCOV_PREFIX=WORKDIR/cov) so src/passes coverage can be
    # merged with gcov/lcov afterwards
    "cov_wasm_opt": None,
    "cov_rate": 0.1,
}
FEATURES = ["--enable-gc", "--enable-reference-types", "--enable-multimemory", "--enable-memory64",
            "--enable-bulk-memory", "--enable-sign-ext", "--enable-mutable-globals",
            "--enable-nontrapping-float-to-int", "--enable-exception-handling"]

# everything V8 runs deterministically (no relaxed SIMD, threads, strings,
# stack switching, custom descriptors); used for "raw" modules that only
# go through the crash / validity / V8 oracle
RAW_FEATURES = FEATURES + ["--enable-simd", "--enable-exception-handling", "--enable-tail-call",
                           "--enable-extended-const", "--enable-multivalue"]


def load():
    c = dict(DEFAULTS)
    p = os.path.join(HERE, "config.json")
    try:
        with open(p) as f:
            c.update(json.load(f))
    except (OSError, ValueError):
        pass
    return c
