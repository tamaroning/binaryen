/home/tamaron/work/binaryen/bin/wasm-opt wp3/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --inlining-optimizing -o /dev/null
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp3/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp3/gen.wasm --no-fuzz-oob
