/home/tamaron/work/binaryen/bin/wasm-opt wp7/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --inlining-optimizing --roundtrip -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp7/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp7/gen.wasm --denan --no-fuzz-oob
