#!/bin/bash
# pass_pred.sh CANDIDATE.wat
#   Exit 0 when exwasm tv gives a counterexample for $FUNC between the candidate (assembled by
#   wasm-tools) and the candidate optimized with $CFG by wasm-opt $W, while $FUNC against itself
#   is equivalent.  Unlike tv_pred.sh the baseline is not written back by wasm-opt, so a
#   difference from reading/writing alone also counts.  For vfuzz/sreduce.py.
X=${EXWASM:-/home/tamaron/work/binaryen/binaryen-fuzz/bin/exwasm-1004d}
IL=/home/tamaron/work/exwasm/il/wasm-3.0-ext.sexp
W=${W:-/home/tamaron/work/binaryen-0903/build/bin/wasm-opt}
ulimit -v 4000000
t=$(mktemp -d)
trap 'rm -rf "$t"' EXIT
wasm-tools parse "$1" -o "$t/a.wasm" 2>/dev/null || exit 1
wasm-tools validate --features all "$t/a.wasm" 2>/dev/null || exit 1
timeout 60 $W $FEATS "$t/a.wasm" $CFG -o "$t/b.wasm" >/dev/null 2>&1 || exit 1
v() { timeout 120 $X --il $IL tv "$1" "$2" --func "$FUNC" --smt-timeout-ms 10000 2>/dev/null | awk -F'\t' -v f="$FUNC" '$1==f{print $2}'; }
[ "$(v "$t/a.wasm" "$t/a.wasm")" = equivalent ] || exit 1
[ "$(v "$t/a.wasm" "$t/b.wasm")" = counterexample ]
