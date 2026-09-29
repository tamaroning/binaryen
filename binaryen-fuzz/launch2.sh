#!/bin/bash
# campaigns 9-11: pop-shape mutation, ctor-eval, V8 over all passes
cd "$(dirname "$0")"
for i in $(seq 1 10); do mkdir -p wp$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_pop.py wp$i $((9000+i)) > wp$i/log.txt 2>&1 < /dev/null & done
for i in $(seq 1 6); do mkdir -p wc$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_ctor.py wc$i $((9100+i)) > wc$i/log.txt 2>&1 < /dev/null & done
for i in $(seq 1 8); do mkdir -p wv$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_v8b.py wv$i $((9200+i)) > wv$i/log.txt 2>&1 < /dev/null & done
