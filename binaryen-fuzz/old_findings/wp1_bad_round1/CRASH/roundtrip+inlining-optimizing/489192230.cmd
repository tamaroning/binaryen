/home/tamaron/work/binaryen/bin/wasm-opt wp1/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --roundtrip --inlining-optimizing -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp1/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp1/gen.wasm --no-fuzz-oob
