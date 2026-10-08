#!/bin/bash
# One run of fuzz_tv.py: WORKERS workers for HOURS hours each (in total over resumes), into OUT.
# The first submission freezes the driver into OUT/code and the settings into OUT/run.env;
# resubmitting with the same OUT resumes every worker after its last seed with those settings.
#   sbatch -p gr20100a --rsc p=1:t=64:c=64:m=110G -t HH:MM:00 -o OUT/%x.o%j.out \
#          --export=ALL,OUT=...,WORKERS=32,HOURS=3,BASE=20261008000 job.sh
set -eu
E=$HOME/work/fuzzenv/ttftv
mkdir -p "$OUT"
if [ ! -f "$OUT/run.env" ]; then
  mkdir -p "$OUT/code" && cp $HOME/work/binaryen/binaryen-fuzz/ttftv/{fuzz_tv.py,summarize.py,job.sh,triage.py,reach_tv.py} "$OUT/code/"
  [ -n "${EXWASM_PATCH:-}" ] && cp "$EXWASM_PATCH" "$OUT/code/exwasm.patch"
  cat > "$OUT/run.env" <<END
WORKERS=$WORKERS
HOURS=$HOURS
BASE=$BASE
TTFTV_ROOT=$HOME/work/fuzzenv/bn-82439
TTFTV_BIN=$E/bin
TTFTV_EXWASM=${TTFTV_EXWASM:-$E/bin/exwasm-706a02e}
TTFTV_IL=$E/wasm-3.0-ext.sexp
TTFTV_SMT_MS=${TTFTV_SMT_MS:-5000}
TTFTV_TV_S=${TTFTV_TV_S:-600}
TTFTV_MEM_GB=${TTFTV_MEM_GB:-3}
TTFTV_EXPORT_ALL=${TTFTV_EXPORT_ALL:-0}
END
fi
set -a; . "$OUT/run.env"; set +a
export LD_LIBRARY_PATH=$HOME/work/fuzzenv/z3py/z3/lib:/opt/system/app/gcc/12.2.0/lib64:${LD_LIBRARY_PATH:-}
rm -f "$OUT/STOP"
date; hostname; "$TTFTV_BIN/wasm-opt" --version
for k in $(seq 0 $((WORKERS - 1))); do
  /usr/bin/python3.12 "$OUT/code/fuzz_tv.py" --worker $k --base $BASE --hours $HOURS --out "$OUT" \
    > "$OUT/w$k.log" 2>&1 &
done
wait
date; echo finished
