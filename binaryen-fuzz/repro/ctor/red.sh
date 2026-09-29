#!/bin/bash
cd "$(dirname "$0")"
B=/home/tamaron/work/binaryen/bin
F="--all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --disable-gc --disable-relaxed-simd"
BINARYEN_CORES=1 $B/wasm-reduce orig.wasm $F --command "./check.sh t.wasm" -t t.wasm -w w.wasm > reduce.log 2>&1
$B/wasm-opt w.wasm $F -S -o w.wat
echo REDUCE_DONE >> reduce.log
