#!/bin/bash
# usage: launch2.sh OUTROOT : 12 ca (no-assert build), 6 int, 6 float
R=$1; mkdir -p $R; : > $R/pids
i=0
for m in ca ca ca ca ca ca ca ca ca ca ca ca int int int int int int float float float float float float; do
  i=$((i+1))
  if [ $m = ca ]; then W=/tmp/claude-1000/-home-tamaron-work-superwasm/61259fd3-cc21-4f2f-aff8-e6f9e5975ac9/scratchpad/btip/build-na/bin/wasm-opt; else W=/tmp/claude-1000/-home-tamaron-work-superwasm/61259fd3-cc21-4f2f-aff8-e6f9e5975ac9/scratchpad/btip/build/bin/wasm-opt; fi
  WASM_OPT=$W setsid python3 /home/tamaron/work/binaryen/binaryen-fuzz/vfuzz/drive.py $R/w$i $m $((i*15485863+$RANDOM)) > $R/w$i.log 2>&1 &
  echo $! >> $R/pids
done
