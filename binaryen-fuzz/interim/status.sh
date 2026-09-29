#!/bin/bash
# Totals of the interim campaign (integer int*/, GC gc*/).
cd /home/tamaron/work/binaryen/binaryen-fuzz/interim
python3 - <<'PY'
import json, glob
def tot(pat, keys):
    t = {k: 0 for k in keys}
    for f in glob.glob(pat):
        try:
            s = json.load(open(f))
        except Exception:
            continue
        for k in keys:
            t[k] += s.get(k, 0) if isinstance(s.get(k, 0), (int, float)) else 0
    return t
print("integer:", tot("int*/stats.json", ["modules", "opt_runs", "proved", "cex", "not_proved", "timeout"]))
print("gc     :", tot("gc*/stats.json", ["modules", "funcs_validated", "cex", "optfail"]))
PY
echo "counterexample dirs:"; grep -l -L "optfail" */bad/*/info.txt 2>/dev/null | head
