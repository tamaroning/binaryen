/home/tamaron/work/binaryen/bin/wasm-opt wp4/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --strip-target-features --inlining-optimizing -o /dev/null
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp4/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp4/gen.wasm --denan --no-fuzz-oob
