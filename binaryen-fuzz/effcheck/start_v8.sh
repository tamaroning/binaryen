#!/bin/bash
# start_v8.sh OUTDIR [JOBS] [MODE]
cd "$(dirname "$0")"
setsid nohup python3 run_v8.py "$1" --jobs "${2:-3}" --mode "${3:-ge}" > "$1.v8.log" 2>&1 &
echo $! > "$1.v8.pid"
