#!/bin/bash
# reduce_persist.sh V8DENAN.jsonl OUTROOT [JOBS] [SECS]
#   For every V8 difference that v8denan.py found to survive --denan, build a
#   denanned copy of the finding (m.wasm after --denan, its text, meta, and the
#   denanned difference as out.txt) under OUTROOT/NAME/in and reduce it with
#   reduce_v8.sh into OUTROOT/NAME/red, against upstream main's wasm-opt.
#   Findings whose reduction finished in an earlier run are skipped.
HERE=$(dirname "$(realpath "$0")")
IN=$1; ROOT=$(realpath -m "$2"); JOBS=${3:-8}; SECS=${4:-900}
W=/home/tamaron/work/binaryen-main/build/bin/wasm-opt
mkdir -p "$ROOT"
python3 - "$IN" <<'EOF' > "$ROOT/list.txt"
import json, sys
for ln in open(sys.argv[1]):
    r = json.loads(ln)
    if "error" not in r and r["plain"][0] > 0 and r["denan"][0] > 0:
        print(r["dir"] + "\t" + r["denan"][1].replace("\n", " ").replace("\t", " "))
EOF
one() {
  d=$1; det=$2
  name=$(basename "$d"); o=$ROOT/$name
  if grep -q '^end:' "$o/reduce.log" 2>/dev/null; then  # reduced by an earlier run
    echo "$name $(grep -E '^(start|end):' "$o/reduce.log" | tr '\n' ' ') $(wc -l < "$o/red/w.wat") lines (earlier run)"
    return
  fi
  rm -rf "$o"
  mkdir -p "$o/in"
  feats=$(python3 -c "
import sys, os, subprocess; sys.path.insert(0, '$HERE')
import cfg
t = open('$d/m.wat').read() if os.path.exists('$d/m.wat') else \
    subprocess.run(['wasm-tools', 'print', '$d/m.wasm'], capture_output=True, text=True).stdout
print(' '.join(cfg.features_for(cfg.FEATURES, t, False)))")
  $W $feats "$d/m.wasm" --denan -o "$o/in/m.wasm" 2>/dev/null
  wasm-tools print "$o/in/m.wasm" > "$o/in/m.wat"
  cp "$d/meta.json" "$o/in/"
  echo "$det" > "$o/in/out.txt"
  "$HERE/reduce_v8.sh" "$o/in" "$o/red" "$SECS" "$W" > "$o/reduce.log" 2>&1
  echo "$name $(grep -E '^(start|end):' "$o/reduce.log" | tr '\n' ' ') $(wc -l < "$o/red/w.wat" 2>/dev/null) lines"
}
export -f one
export HERE ROOT W SECS
tr '\t' '\n' < "$ROOT/list.txt" | xargs -d '\n' -n 2 -P "$JOBS" bash -c 'one "$0" "$1"'
