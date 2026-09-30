/home/tamaron/work/binaryen/bin/wasm-opt wp10/mut.wat --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching --fuzz-exec --roundtrip --simplify-globals-optimizing --gsi -o /dev/null
/home/tamaron/work/binaryen/bin/wasm-opt -ttf wp10/in.bin --all-features --disable-fp16 --disable-shared-everything --disable-stack-switching -o wp10/gen.wasm --denan --no-fuzz-oob
