#!/bin/bash
# Stop every ufuzz worker (and the exwasm / wasm-opt it is running).
cd "$(dirname "$0")"
touch STOP
for p in $(cat pids 2>/dev/null); do
  g=$(ps -o pgid= -p "$p" 2>/dev/null | tr -d ' ')
  [ -n "$g" ] && kill -TERM -- -"$g" 2>/dev/null
done
sleep 2
for p in $(cat pids 2>/dev/null); do kill -0 "$p" 2>/dev/null && echo "still running: $p"; done
rm -f pids; echo stopped
