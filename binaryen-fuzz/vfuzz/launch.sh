#!/bin/bash
# usage: launch.sh OUTROOT   (runs 24 workers, pids in OUTROOT/pids)
R=$1; mkdir -p $R; : > $R/pids
export WASM_OPT=/tmp/claude-1000/-home-tamaron-work-superwasm/61259fd3-cc21-4f2f-aff8-e6f9e5975ac9/scratchpad/btip/build/bin/wasm-opt
i=0
for m in ca ca ca ca ca ca ca ca ca ca ca ca int int int int int int float float float float float float; do
  i=$((i+1)); setsid python3 /home/tamaron/work/binaryen/binaryen-fuzz/vfuzz/drive.py $R/w$i $m $((i*7919+$RANDOM)) > $R/w$i.log 2>&1 &
  echo $! >> $R/pids
done
