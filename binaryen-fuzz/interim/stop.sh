#!/bin/bash
cd /home/tamaron/work/binaryen/binaryen-fuzz/interim
for p in $(cat pids); do kill -- -$(ps -o pgid= -p $p | tr -d ' ') 2>/dev/null || kill $p 2>/dev/null; done
rm -f pids; echo stopped
