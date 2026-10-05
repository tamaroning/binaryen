#!/bin/bash
# fe_pred.sh CANDIDATE.wat
#   Exit 0 when `wasm-opt $FEATS $CFG --fuzz-exec` (upstream main) reports changed results on the
#   candidate, with its "env" imports stubbed as in drive.fuzz_exec_check.  For vfuzz/sreduce.py.
HERE=$(dirname "$(realpath "$0")")
UFUZZ_CONFIG=${UFUZZ_CONFIG:-$HERE/config.decl.json} python3 - "$1" <<'PY'
import os, sys, tempfile
sys.path.insert(0, os.path.dirname(os.path.realpath(sys.argv[0])) if False else os.environ.get("UFUZZ_HERE", "."))
import cfg, drive
with tempfile.TemporaryDirectory() as wd:
    r = drive.fuzz_exec_check(cfg.load(), os.environ["FEATS"].split(), sys.argv[1], os.environ["CFG"].split(), wd)
sys.exit(0 if r == "detects" else 1)
PY
