#!/bin/bash
# Binaryen's own fuzzer alone: the FO arm of job_cmp.sh (fuzz_opt.py's handlers as the oracle),
# WORKERS workers on the same seeds as the comparison, without the TV arm beside it.  Every worker
# is pinned to an equal share of the job's CPUs.  The first submission freezes the driver into
# OUT/code and the settings into OUT/run.env; resubmitting with the same OUT resumes every worker.
#   sbatch -p gr20100a --rsc p=1:t=56:c=56:m=55G -t HH:MM:00 -o OUT/%x.o%j.out \
#          --export=ALL,OUT=...,WORKERS=16,HOURS=24,BASE=40000000000 job_fo.sh
set -eu
E=$HOME/work/fuzzenv
mkdir -p "$OUT/fo"
if [ ! -f "$OUT/run.env" ]; then
  mkdir -p "$OUT/code" && cp $HOME/work/binaryen/binaryen-fuzz/ttftv/{fuzz_tv.py,summarize.py,job_fo.sh,triage.py} "$OUT/code/"
  (cd $HOME/work/binaryen && git rev-parse --short HEAD) > "$OUT/code/COMMIT"
  cat > "$OUT/run.env" <<END
WORKERS=$WORKERS
HOURS=$HOURS
BASE=$BASE
TTFTV_ROOT=$E/bn-82439
TTFTV_BIN=$E/bn-82439-build/bin
TTFTV_EXWASM=none
TTFTV_IL=none
TTFTV_EXPORT_ALL=0
TTFTV_FO_S=${TTFTV_FO_S:-600}
V8=$HOME/.jsvu/engines/v8/v8
END
fi
set -a; . "$OUT/run.env"; set +a
# fuzz_opt.py runs its scripts with python3 (3.12 is needed) and Wasm2JS with node
export PATH=$E/pybin:$E/node-v24.21.0-linux-x64/bin:$PATH
export LD_LIBRARY_PATH=/opt/system/app/gcc/12.2.0/lib64:${LD_LIBRARY_PATH:-}
rm -f "$OUT/fo/STOP"
date; hostname; lscpu | grep -E "Model name|^CPU\(s\)"; "$TTFTV_BIN/wasm-opt" --version; "$V8" -e 'print(version())'
(cd "$TTFTV_ROOT" && git log -1 --oneline)
cpus=($(/usr/bin/python3.12 -c 'import os; print(*sorted(os.sched_getaffinity(0)))'))
per=$(( ${#cpus[@]} / WORKERS ))
echo "${#cpus[@]} cpus, $per per worker"
for k in $(seq 0 $((WORKERS - 1))); do
  set=$(IFS=,; echo "${cpus[*]:$((k * per)):$per}")
  taskset -c "$set" /usr/bin/python3.12 "$OUT/code/fuzz_tv.py" --worker $k --base $BASE --hours $HOURS \
    --out "$OUT/fo" --oracle fo > "$OUT/fo/w$k.log" 2>&1 &
done
wait
date; echo finished
