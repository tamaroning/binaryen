/home/tamaron/work/binaryen/bin/wasm-opt wp9/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --simplify-locals --dae2 --roundtrip -o /dev/null --closed-world
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp9/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp9/gen.wasm
