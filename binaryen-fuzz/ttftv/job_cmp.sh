#!/bin/bash
# One trial of the comparison: the TV arm (OUT/tv) and the FO arm (OUT/fo) side by side on one
# node, WORKERS workers each, on the same seeds.  Every worker is pinned to an equal share of the
# job's CPUs, given to the two arms in turn (tv0, fo0, tv1, fo1, ...).
# The first submission freezes the driver into OUT/code and the settings into OUT/run.env;
# resubmitting with the same OUT resumes every worker after its last seed with those settings.
#   sbatch -p gr20100a --rsc p=1:t=112:c=112:m=110G -t HH:MM:00 -o OUT/%x.o%j.out \
#          --export=ALL,OUT=...,WORKERS=16,HOURS=6,BASE=40000000000 job_cmp.sh
set -eu
E=$HOME/work/fuzzenv
mkdir -p "$OUT/tv" "$OUT/fo"
if [ ! -f "$OUT/run.env" ]; then
  mkdir -p "$OUT/code" && cp $HOME/work/binaryen/binaryen-fuzz/ttftv/{fuzz_tv.py,summarize.py,job_cmp.sh,triage.py} "$OUT/code/"
  cat > "$OUT/run.env" <<END
WORKERS=$WORKERS
HOURS=$HOURS
BASE=$BASE
TTFTV_ROOT=$E/bn-82439
TTFTV_BIN=$E/bn-82439-build/bin
TTFTV_EXWASM=$TTFTV_EXWASM
TTFTV_IL=$E/ttftv/wasm-3.0-ext.sexp
TTFTV_SMT_MS=${TTFTV_SMT_MS:-5000}
TTFTV_TV_S=${TTFTV_TV_S:-600}
TTFTV_TV_PAR=${TTFTV_TV_PAR:-0}
TTFTV_MEM_GB=${TTFTV_MEM_GB:-3}
TTFTV_FO_S=${TTFTV_FO_S:-600}
TTFTV_EXPORT_ALL=${TTFTV_EXPORT_ALL:-0}
V8=$HOME/.jsvu/engines/v8/v8
END
fi
set -a; . "$OUT/run.env"; set +a
# fuzz_opt.py runs its scripts with python3 (3.12 is needed) and Wasm2JS with node
export PATH=$E/pybin:$E/node-v24.21.0-linux-x64/bin:$PATH
export LD_LIBRARY_PATH=$E/z3py/z3/lib:/opt/system/app/gcc/12.2.0/lib64:${LD_LIBRARY_PATH:-}
rm -f "$OUT/tv/STOP" "$OUT/fo/STOP"
date; hostname; lscpu | grep -E "Model name|^CPU\(s\)"; "$TTFTV_BIN/wasm-opt" --version; "$V8" -e 'print(version())'
cpus=($(/usr/bin/python3.12 -c 'import os; print(*sorted(os.sched_getaffinity(0)))'))
per=$(( ${#cpus[@]} / (2 * WORKERS) ))
echo "${#cpus[@]} cpus, $per per worker"
i=0
for k in $(seq 0 $((WORKERS - 1))); do
  for arm in tv fo; do
    set=$(IFS=,; echo "${cpus[*]:$((i * per)):$per}")
    i=$((i + 1))
    taskset -c "$set" /usr/bin/python3.12 "$OUT/code/fuzz_tv.py" --worker $k --base $BASE --hours $HOURS \
      --out "$OUT/$arm" --oracle $arm > "$OUT/$arm/w$k.log" 2>&1 &
  done
done
wait
date; echo finished
