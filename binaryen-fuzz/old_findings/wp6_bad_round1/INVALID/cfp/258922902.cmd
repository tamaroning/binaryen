/home/tamaron/work/binaryen/bin/wasm-opt wp6/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --cfp -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp6/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp6/gen.wasm --denan --no-fuzz-oob
