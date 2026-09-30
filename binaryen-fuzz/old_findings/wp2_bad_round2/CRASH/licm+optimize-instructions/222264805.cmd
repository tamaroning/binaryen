/home/tamaron/work/binaryen/bin/wasm-opt wp2/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --licm --optimize-instructions -o /dev/null
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp2/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp2/gen.wasm --denan
