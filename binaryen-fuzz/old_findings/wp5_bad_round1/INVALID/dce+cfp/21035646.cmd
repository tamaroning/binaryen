/home/tamaron/work/binaryen/bin/wasm-opt wp5/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --dce --cfp -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp5/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp5/gen.wasm
