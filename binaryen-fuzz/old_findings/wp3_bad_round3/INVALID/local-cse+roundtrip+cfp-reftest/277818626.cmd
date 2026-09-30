/home/tamaron/work/binaryen/bin/wasm-opt wp3/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --local-cse --roundtrip --cfp-reftest -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp3/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp3/gen.wasm --closed-world --denan
