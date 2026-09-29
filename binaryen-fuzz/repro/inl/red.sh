#!/bin/bash
cd "$(dirname "$0")"
B=../../../bin
F="--all-features --disable-fp16 --disable-shared-everything --disable-stack-switching"
BINARYEN_CORES=1 $B/wasm-reduce orig.wasm $F --command "$B/wasm-opt t.wasm $F --inlining-optimizing --merge-similar-functions --roundtrip -o /dev/null 2>&1 | grep -q 'Pop has not been found'" -t t.wasm -w w.wasm > reduce.log 2>&1
$B/wasm-opt w.wasm $F -S -o w.wat
echo REDUCE_DONE >> reduce.log
