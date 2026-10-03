#!/bin/bash
# tv_pred.sh CANDIDATE.wat
#   Exit 0 when running $CFG (wasm-opt $W with $FEATS) on the candidate gives
#   an exwasm tv counterexample for $FUNC while $FUNC against itself is
#   equivalent.  For vfuzz/sreduce.py:
#     FUNC=f1 CFG=--reorder-locals FEATS="-all" sreduce.py in.wat out.wat -- ./tv_pred.sh
X=${EXWASM:-/home/tamaron/work/binaryen/binaryen-fuzz/bin/exwasm-1003b}
IL=/home/tamaron/work/exwasm/il/wasm-3.0-ext.sexp
W=${W:-/home/tamaron/work/binaryen-main/build/bin/wasm-opt}
ulimit -v 4000000
t=$(mktemp -d)
trap 'rm -rf "$t"' EXIT
timeout 30 $W $FEATS "$1" -o "$t/a.wasm" >/dev/null 2>&1 || exit 1
timeout 30 $W $FEATS "$t/a.wasm" $CFG -o "$t/b.wasm" >/dev/null 2>&1 || exit 1
v() { timeout 60 $X --il $IL tv "$1" "$2" --func "$FUNC" --smt-timeout-ms 5000 2>/dev/null | awk -F'\t' -v f="$FUNC" '$1==f{print $2}'; }
[ "$(v "$t/a.wasm" "$t/a.wasm")" = equivalent ] || exit 1
[ "$(v "$t/a.wasm" "$t/b.wasm")" = counterexample ]
