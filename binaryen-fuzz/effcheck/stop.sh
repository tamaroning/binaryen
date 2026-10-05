#!/bin/bash
# stop.sh OUTDIR: stop the effcheck run started by start.sh and its exwasm children
cd "$(dirname "$0")"
p=$(cat "$1.pid" 2>/dev/null) || exit 0
g=$(ps -o pgid= -p "$p" | tr -d ' ')
[ -n "$g" ] && kill -TERM -- -"$g" 2>/dev/null
rm -f "$1.pid"; echo stopped
