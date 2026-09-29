#!/bin/bash
cd "$(dirname "$0")"
for i in $(seq 1 10); do mkdir -p wp$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_pop.py wp$i $((9300+i)) > wp$i/log.txt 2>&1 < /dev/null & done
for i in $(seq 1 8); do mkdir -p wv$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_v8b.py wv$i $((9400+i)) > wv$i/log.txt 2>&1 < /dev/null & done
