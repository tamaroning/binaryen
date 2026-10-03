#!/bin/bash
# crash_pred.sh CANDIDATE.wat  (env: W CFG FEATS SIG)
# exit 0 when wasm-opt $FEATS $CFG on the assembled candidate prints a line matching $SIG
t=$(mktemp -d); trap 'rm -rf "$t"' EXIT
wasm-tools parse "$1" -o "$t/a.wasm" 2>/dev/null || exit 1
wasm-tools validate --features all "$t/a.wasm" 2>/dev/null || exit 1
timeout 60 ${W:-/home/tamaron/work/binaryen-0903/build/bin/wasm-opt} $FEATS $CFG "$t/a.wasm" -o /dev/null 2>&1 | grep -qE "$SIG"
