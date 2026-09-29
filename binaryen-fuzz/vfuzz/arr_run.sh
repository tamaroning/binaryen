#!/bin/bash
# usage: arr_run.sh WASM_OPT OUTDIR SEED0 N
B=$1; O=$2; s0=$3; N=$4; mkdir -p $O
F="--enable-gc --enable-reference-types --enable-bulk-memory --enable-sign-ext --enable-mutable-globals --enable-nontrapping-float-to-int"
H=$(dirname $0)
for i in $(seq 1 $N); do
  s=$((s0+i)); m=$O/m$s
  python3 $H/gen_arr.py $s $m || continue
  $B $F $m.wat -o $m.wasm 2>/dev/null || { echo "PARSE $s"; continue; }
  WASM_OPT=$B python3 $H/interp_vs_v8.py $F -- $m.wasm
  outs=""; k=0
  for c in "-O3" "--precompute-propagate" "--heap2local --precompute-propagate" "-O2 --gufa-optimizing" "--closed-world -O3" "-Oz"; do
    k=$((k+1)); $B $F $m.wasm $c -o ${m}_$k.wasm 2>/dev/null || { echo "CRASH $s [$c]"; continue; }; outs="$outs ${m}_$k.wasm"
  done
  timeout 60 node $H/cmp.js $m.wasm $outs | grep -v ^OK | sed "s|^|$s |"
  rm -f ${m}_*.wasm
done
