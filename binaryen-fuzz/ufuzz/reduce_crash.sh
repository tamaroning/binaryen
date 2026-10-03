#!/bin/bash
# reduce_crash.sh FINDING_DIR OUTDIR SIGNATURE_REGEX [SECS] [WASM_OPT]
#   wasm-reduce m.wasm of a saved finding while running its configuration still prints
#   a line matching SIGNATURE_REGEX.  Leaves OUTDIR/w.wasm and OUTDIR/w.wat.
if [ -n "$REDUCE_TEST" ]; then
  cd "$RDIR"
  timeout 60 $W $FEATS $CFG t.wasm -o /dev/null 2>&1 | grep -qE "$SIG" && echo CRASH || echo OK
  exit 0
fi
D=$(realpath "$1"); OUT=$2; SIG=$3; SECS=${4:-600}
W=${5:-/home/tamaron/work/binaryen-0903/build/bin/wasm-opt}
HERE=$(dirname "$(realpath "$0")")
mkdir -p "$OUT"; OUT=$(realpath "$OUT")
cp "$D/m.wasm" "$OUT/orig.wasm"; cp "$D/m.wasm" "$OUT/t.wasm"
CFG=$(python3 -c "import json; print(json.load(open('$D/meta.json'))['cfg'])")
FEATS=$(python3 -c "
import sys, os, subprocess; sys.path.insert(0, '$HERE')
import cfg
t = open('$D/m.wat').read() if os.path.exists('$D/m.wat') else subprocess.run(['wasm-tools', 'print', '$D/m.wasm'], capture_output=True, text=True).stdout
print(' '.join(cfg.features_for(cfg.FEATURES, t, False)))")
export REDUCE_TEST=1 RDIR=$OUT CFG FEATS W SIG
echo "start: $(bash "$HERE/reduce_crash.sh")"
cd "$OUT" && (ulimit -v 6000000; timeout "$SECS" "$(dirname "$W")/wasm-reduce" orig.wasm "--command=bash $HERE/reduce_crash.sh" --test t.wasm --working w.wasm $FEATS -f 2>&1 | tail -1)
cp w.wasm t.wasm
echo "end: $(bash "$HERE/reduce_crash.sh")"
$W $FEATS w.wasm --print > w.wat 2>/dev/null
wc -l w.wat
