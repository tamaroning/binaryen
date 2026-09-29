#!/bin/bash
# Totals and crash signatures of the feature campaign.
cd /home/tamaron/work/binaryen/binaryen-fuzz/feat
python3 - <<'PY'
import json, glob, collections
T = collections.Counter(); sig = collections.Counter(); byp = collections.defaultdict(collections.Counter)
for f in sorted(glob.glob("w*/stats.json")):
    try: s = json.load(open(f))
    except Exception: continue
    for k in ["modules", "opt_runs", "crash", "invalid_output", "v8_diff", "v8_same", "unchanged", "input_rejected"]:
        T[k] += s.get(k, 0); byp[s["profile"]][k] += s.get(k, 0)
    sig.update(s.get("crash_sigs", {}))
print(dict(T))
for p, c in byp.items(): print(" ", p, dict(c))
print("crash signatures:")
for k, v in sig.most_common(20): print(f"  {v:5d}  {k}")
PY
echo "v8 diffs / invalid outputs:"; grep -l -E "^(v8 diff|invalid)" w*/bad/*/info.txt 2>/dev/null | head
