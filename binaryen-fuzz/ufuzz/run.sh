#!/bin/bash
# Start N ufuzz workers (default 4), detached and without an end time.
# Each worker appends to runs/wK/results.jsonl, copies findings to
# runs/wK/bad/ and saves runs/wK/stats.json every few minutes.
# Stop with ./stop.sh; see ./status.sh and aggregate.py.
cd "$(dirname "$0")"
N=${1:-4}
rm -f STOP
RUNS=${RUNS:-runs}
mkdir -p $RUNS
base=$(( $(date +%s) % 100000 * 1000 ))
for k in $(seq 1 "$N"); do
  w=$RUNS/w$k
  mkdir -p $w
  rm -f $w/STOP
  setsid nohup python3 drive.py $w w$k $(( base + k * 100000000 )) >> $w/worker.log 2>&1 &
  echo $! >> pids
done
echo "started $N workers: $(tr '\n' ' ' < pids)"
