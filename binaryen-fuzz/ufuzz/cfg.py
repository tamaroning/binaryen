"""Run configuration.  Workers re-read config.json before every module, so
switching the exwasm snapshot (or the SMT timeout) takes effect without a
restart: edit config.json, e.g. {"exwasm": ".../bin/exwasm-gc6"}."""
import json
import os
import re

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
    # generator: share of modules that may contain rows the snapshot rejects at module level
    # ("wide": oracle B only), that avoid exception handling (wasm-opt without the EH feature),
    # and that boost one row family ("focus").  "features_add": ["atomic"] turns the atomics
    # rows on for every module (needs a snapshot that derives them), ["atomic_wide"] for wide
    # modules only.  "features_remove": row tags to switch off.
    "wide_rate": 0.1,
    "noeh_rate": 0.12,
    "focus_rate": 0.35,
    # row families a focused module may boost (default: all of table.FOCUS_TAGS); a campaign
    # on the newer WebAssembly 3.0 features sets, e.g., gc2, cast, exn, callref, ctl2, table
    "focus_tags": None,
    "features_add": [],
    "features_remove": [],
    # pass sampler: weight of a pass the rule-level campaign found fruitful, relative to 1 for
    # every other pass; adaptive factor from the observed share of changed functions
    "fruitful_weight": 2.5,
    "shape_bias": 0.3,
    # extra sampling factor per pass, e.g. for the passes a recent upstream change touched
    "pass_boost": {},
}
FEATURES = ["--enable-gc", "--enable-reference-types", "--enable-multimemory", "--enable-memory64",
            "--enable-bulk-memory", "--enable-sign-ext", "--enable-mutable-globals",
            "--enable-nontrapping-float-to-int", "--enable-exception-handling"]

# everything V8 runs deterministically (no relaxed SIMD, threads, strings,
# stack switching, custom descriptors); used for "raw" modules that only
# go through the crash / validity / V8 oracle
RAW_FEATURES = FEATURES + ["--enable-simd", "--enable-exception-handling", "--enable-tail-call",
                           "--enable-extended-const", "--enable-multivalue"]


def needs(text, noeh=False):
    """wasm-opt feature flags a module's text needs beyond FEATURES"""
    out = []
    if noeh:
        out.append("-EH")
    if "v128" in text or "x4." in text or "i8x16" in text or "i16x8" in text or "i64x2" in text or "f64x2" in text:
        out.append("--enable-simd")
    if "relaxed_" in text:
        out.append("--enable-relaxed-simd")
    if ".atomic." in text or "atomic.fence" in text:
        out.append("--enable-threads")
    if "return_call" in text:
        out.append("--enable-tail-call")
    if re.search(r"\(result [^()]* [^()]*\)|\(result [^()]*\) \(result", text):
        out.append("--enable-multivalue")
    return out


def features_for(base, text, noeh=False):
    """`base` feature flags plus what `text` needs (and minus EH for noeh modules)"""
    nd = needs(text, noeh)
    fl = [f for f in base if not (noeh and f == "--enable-exception-handling")]
    return fl + [x for x in nd if x != "-EH" and x not in fl]


def load():
    c = dict(DEFAULTS)
    p = os.environ.get("UFUZZ_CONFIG") or os.path.join(HERE, "config.json")
    try:
        with open(p) as f:
            c.update(json.load(f))
    except (OSError, ValueError):
        pass
    return c
