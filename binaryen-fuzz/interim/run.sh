#!/bin/bash
# Interim campaign until ufuzz is ready: integer tv2 + GC drive, exwasm-gc5.
cd /home/tamaron/work/binaryen/binaryen-fuzz
export EXWASM=/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad/bin/exwasm-gc5
export EXWASM_IL=/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad/il/wasm-3.0.sexp
export NO_GLOBAL_PROLOGUE=1 GEN_ALLOW_WRAP_SIZE64=1
D=interim
for i in 1 2 3; do setsid nohup python3 vfuzz/tv2.py $D/int$i $((9000+i*1000)) 86400 > $D/int$i.log 2>&1 & echo $! >> $D/pids; done
for g in gc sub gc; do n=$((n+1)); setsid nohup python3 gcfuzz/drive.py $D/gc$n $((7000+n*1000)) 86400 $g > $D/gc$n.log 2>&1 & echo $! >> $D/pids; done
