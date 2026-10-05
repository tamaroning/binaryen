#!/bin/bash
# start.sh OUTDIR [JOBS]: run effcheck detached, pid in OUTDIR.pid
cd "$(dirname "$0")"
setsid nohup python3 run.py "$1" --jobs "${2:-3}" > "$1.log" 2>&1 &
echo $! > "$1.pid"
