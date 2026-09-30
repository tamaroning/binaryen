/home/tamaron/work/binaryen/bin/wasm-opt wp8/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --monomorphize -o /dev/null
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp8/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp8/gen.wasm
