#!/bin/bash
# reproduce: ctor-eval writes a binary that does not validate
B=/home/tamaron/work/binaryen/bin
F="--all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --disable-gc --disable-relaxed-simd"
$B/wasm-ctor-eval "$1" -o e.wasm --ctors=func,func_invoker,func_8,func_8_invoker,func_10_invoker,func_12,func_15_invoker,func_17,func_17_invoker,func_19_invoker,func_21,func_24_invoker,func_26,func_26_invoker,func_28_invoker,func_30_invoker,func_33_invoker,func_35,func_35_invoker,func_37,func_38 --kept-exports=func,func_invoker,func_8,func_8_invoker,func_10_invoker,func_12,func_15_invoker,func_17,func_17_invoker,func_19_invoker,func_21,func_24_invoker,func_26,func_26_invoker,func_28_invoker,func_30_invoker,func_33_invoker,func_35,func_35_invoker,func_37,func_38 --ignore-external-input $F > /dev/null 2>&1 || exit 1
$B/wasm-opt e.wasm $F -o /dev/null 2>&1 | grep -q "wasm-validator error"
