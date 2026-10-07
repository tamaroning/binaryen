#!/bin/bash
# Start N ufuzz workers (default 4), detached and without an end time.
# Each worker appends to runs/wK/results.jsonl, copies findings to
# runs/wK/bad/ and saves runs/wK/stats.json every few minutes.
# Stop with ./stop.sh; see ./status.sh and aggregate.py.
# BASE fixes the seeds (worker k starts at BASE + k * 100000000); without it,
# BASE is taken from the clock. Every start appends the seeds, the revision
# of this directory and the config to $RUNS/seeds.txt.
cd "$(dirname "$0")"
N=${1:-4}
rm -f STOP
RUNS=${RUNS:-runs}
mkdir -p $RUNS
base=${BASE:-$(( $(date +%s) % 100000 * 1000 ))}
{
  echo "# $(date -Iseconds) host=$(hostname) N=$N BASE=$base"
  echo "# ufuzz $(git rev-parse HEAD 2>/dev/null)$(git diff --quiet -- . 2>/dev/null || echo ' (modified)')"
  echo "# UFUZZ_CONFIG=${UFUZZ_CONFIG:-config.json}"
} >> $RUNS/seeds.txt
for k in $(seq 1 "$N"); do
  w=$RUNS/w$k
  mkdir -p $w
  rm -f $w/STOP
  echo "w$k $(( base + k * 100000000 ))" >> $RUNS/seeds.txt
  setsid nohup python3 drive.py $w w$k $(( base + k * 100000000 )) >> $w/worker.log 2>&1 &
  echo $! >> pids
done
echo "started $N workers: $(tr '\n' ' ' < pids)"
