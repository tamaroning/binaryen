#!/bin/bash
# reduce_tv.sh FINDING_DIR FUNC OUTDIR [SECS] [WASM_OPT]
#   wasm-reduce m.wasm of a saved finding so that running its configuration
#   still gives an exwasm tv counterexample for FUNC, while FUNC against itself
#   stays equivalent.  Leaves OUTDIR/w.wasm and OUTDIR/w.wat.
# Called with REDUCE_TEST=1 it is the wasm-reduce test command itself.
X=${EXWASM:-/home/tamaron/work/binaryen/binaryen-fuzz/bin/exwasm-1003b}
IL=/home/tamaron/work/exwasm/il/wasm-3.0-ext.sexp
if [ -n "$REDUCE_TEST" ]; then
  ulimit -v 4000000
  cd "$RDIR"
  timeout 30 $W $FEATS $CFG t.wasm -o t_opt.wasm >/dev/null 2>&1 || { echo OPTFAIL; exit 0; }
  self=$(timeout 60 $X --il $IL tv t.wasm t.wasm --func $FUNC --smt-timeout-ms 5000 2>/dev/null | awk -F'\t' -v f=$FUNC '$1==f{print $2}')
  [ "$self" = equivalent ] || { echo SELF-$self; exit 0; }
  timeout 60 $X --il $IL tv t.wasm t_opt.wasm --func $FUNC --smt-timeout-ms 5000 2>/dev/null | awk -F'\t' -v f=$FUNC '$1==f{print $2}' | head -1
  exit 0
fi
D=$(realpath "$1"); FUNC=$2; OUT=$3; SECS=${4:-900}
W=${5:-/home/tamaron/work/binaryen/build/bin/wasm-opt}
HERE=$(dirname "$(realpath "$0")")
mkdir -p "$OUT"; OUT=$(realpath "$OUT")
cp "$D/m.wasm" "$OUT/orig.wasm"; cp "$D/m.wasm" "$OUT/t.wasm"
CFG=$(python3 -c "import json; print(json.load(open('$D/meta.json'))['cfg'])")
FEATS=$(python3 -c "
import sys; sys.path.insert(0, '$HERE')
import cfg
import os, subprocess
t = open('$D/m.wat').read() if os.path.exists('$D/m.wat') else \\
    subprocess.run(['wasm-tools', 'print', '$D/m.wasm'], capture_output=True, text=True).stdout
print(' '.join(cfg.features_for(cfg.FEATURES, t, False)))")
export REDUCE_TEST=1 RDIR=$OUT FUNC CFG FEATS W X
echo "cfg: $CFG"
echo "start: $(bash "$HERE/reduce_tv.sh")"
cd "$OUT" && (ulimit -v 6000000; timeout "$SECS" /home/tamaron/work/binaryen/build/bin/wasm-reduce orig.wasm \
  "--command=bash $HERE/reduce_tv.sh" --test t.wasm --working w.wasm -all -f 2>&1 | tail -1)
cp w.wasm t.wasm
echo "end: $(bash "$HERE/reduce_tv.sh")"
$W $FEATS w.wasm --print > w.wat 2>/dev/null
$W $FEATS w.wasm $CFG --print > w_opt.wat 2>/dev/null
wc -l w.wat
