#!/bin/bash
# usage: ctor_run.sh BINDIR OUTDIR SEED0 N  -- ctor-eval of GC-array ctors vs running them
B=$1; O=$2; s0=$3; N=$4; mkdir -p $O; H=$(dirname $0)
F="--enable-gc --enable-reference-types --enable-bulk-memory --enable-sign-ext --enable-mutable-globals --enable-nontrapping-float-to-int"
for i in $(seq 1 $N); do
  s=$((s0+i)); m=$O/m$s
  python3 $H/gen_ctor_arr.py $s $m || continue
  $B/wasm-opt $F $m.wat -o $m.wasm 2>/dev/null || { echo "PARSE $s"; continue; }
  $B/wasm-ctor-eval $F $m.wasm --ctors=ctor -o $m.e.wasm > $m.ce 2>&1 || { echo "CTORFAIL $s $(tail -1 $m.ce)"; continue; }
  grep -q "success on ctor" $m.ce || { echo "NOEVAL $s"; continue; }
  bad=0
  r=$(node $H/ctor_cmp.js $m.wasm $m.e.wasm 2>&1)
  [ "$r" = OK ] || { echo "DIFF $s $r"; bad=1; }
  for o in -O3 --precompute-propagate; do
    $B/wasm-opt $F $m.e.wasm $o -o $m.o.wasm 2>/dev/null && { r=$(node $H/ctor_cmp.js $m.wasm $m.o.wasm 2>&1); [ "$r" = OK ] || { echo "DIFF-OPT $s $o $r"; bad=1; }; }
  done
  [ $bad = 0 ] && rm -f $m.*
done
