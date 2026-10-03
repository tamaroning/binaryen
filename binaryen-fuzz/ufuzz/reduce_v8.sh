#!/bin/bash
# reduce_v8.sh FINDING_DIR OUTDIR [SECS] [WASM_OPT] [CFG]
#   wasm-reduce m.wasm of a saved finding so that running its configuration
#   (or CFG) still makes v8diff.js report a difference of the same kind as
#   the saved one ("state", "hang", "trap", ...).  Leaves OUTDIR/w.wasm,
#   OUTDIR/w.wat and OUTDIR/w_opt.wat.
# Called with REDUCE_TEST=1 it is the wasm-reduce test command itself.
if [ -n "$REDUCE_TEST" ]; then
  cd "$RDIR"
  # no ulimit -v here: V8 reserves a large virtual range for each wasm memory
  timeout 30 $W $FEATS $CFG t.wasm -o t_opt.wasm >/dev/null 2>&1 || { echo OPTFAIL; exit 0; }
  out=$(V8DIFF_HANG_MS=3000 timeout 60 node --experimental-wasm-type-reflection --experimental-wasm-exnref \
        "$HERE/v8diff.js" t.wasm t_opt.wasm 1 2>/dev/null | tail -1)
  case "$out" in
    *'"same":false'*) echo "$out" | grep -q -- "$KIND" && echo DIFF || echo OTHER ;;
    *) echo SAME ;;
  esac
  exit 0
fi
D=$(realpath "$1"); OUT=$2; SECS=${3:-900}
W=${4:-/home/tamaron/work/binaryen-main/build/bin/wasm-opt}
HERE=$(dirname "$(realpath "$0")")
mkdir -p "$OUT"; OUT=$(realpath "$OUT")
cp "$D/m.wasm" "$OUT/orig.wasm"; cp "$D/m.wasm" "$OUT/t.wasm"
CFG=${5:-$(python3 -c "import json; print(json.load(open('$D/meta.json'))['cfg'])")}
FEATS=$(python3 -c "
import sys; sys.path.insert(0, '$HERE')
import cfg
import os, subprocess
t = open('$D/m.wat').read() if os.path.exists('$D/m.wat') else \\
    subprocess.run(['wasm-tools', 'print', '$D/m.wasm'], capture_output=True, text=True).stdout
print(' '.join(cfg.features_for(cfg.FEATURES, t, False)))")
first=$(head -1 "$D/out.txt")
case "$first" in
  *state:*) KIND="state:" ;;
  *hang*) KIND="hang" ;;
  *trap*) KIND="trap" ;;
  *) KIND='"same":false' ;;
esac
export REDUCE_TEST=1 RDIR=$OUT CFG FEATS W HERE KIND
echo "cfg: $CFG  kind: $KIND"
echo "start: $(bash "$HERE/reduce_v8.sh")"
cd "$OUT" && (timeout "$SECS" /home/tamaron/work/binaryen/build/bin/wasm-reduce orig.wasm \
  "--command=bash $HERE/reduce_v8.sh" --test t.wasm --working w.wasm $FEATS -f 2>&1 | tail -1)
cp w.wasm t.wasm
echo "end: $(bash "$HERE/reduce_v8.sh")"
$W $FEATS w.wasm --print > w.wat 2>/dev/null
$W $FEATS w.wasm $CFG --print > w_opt.wat 2>/dev/null
wc -l w.wat
