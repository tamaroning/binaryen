#!/bin/bash
# Short summary of the running campaign.
cd "$(dirname "$0")"
for p in $(cat pids 2>/dev/null); do kill -0 "$p" 2>/dev/null && r="$r $p"; done
echo "running:${r:- none}"
python3 aggregate.py --brief
