#!/bin/bash
# Feature-focused campaign (V8 differential + crashes), detached.
cd /home/tamaron/work/binaryen/binaryen-fuzz/feat
n=0
for p in eh simd mixed mixed misc; do n=$((n+1)); mkdir -p w$n; setsid nohup python3 drive.py w$n $p $((n*1000000)) > w$n.log 2>&1 & echo $! >> pids; done
