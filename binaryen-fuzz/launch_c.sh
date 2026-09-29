#!/bin/bash
cd "$(dirname "$0")"
for i in $(seq 1 6); do mkdir -p wc$i; BINARYEN_CORES=1 setsid nohup python3 -u fuzz_ctor.py wc$i $((9600+i)) > wc$i/log.txt 2>&1 < /dev/null & done
