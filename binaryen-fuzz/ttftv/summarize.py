"""Summary of a fuzz_tv.py run: python3 summarize.py OUT"""
import collections
import glob
import json
import os
import re
import sys

out = sys.argv[1]
rows = []
for p in sorted(glob.glob(os.path.join(out, "rows-w*.jsonl"))):
    for line in open(p):
        try:
            rows.append(json.loads(line))
        except ValueError:
            pass
st = collections.Counter(r["status"] for r in rows)
hours = sum(r.get("dt", 0) for r in rows) / 3600
print("modules %d, worker-hours %.1f" % (len(rows), hours))
print("status", dict(st.most_common()))
err = collections.Counter(re.sub(r"\(at offset 0x[0-9a-f]+\)|/\S+: ", "", r.get("detail", ""))[:70]
                          for r in rows if r["status"] == "tv-error")
print("tv errors", err.most_common(8))
fn = collections.Counter()
for r in rows:
    for k, v in (r.get("counts") or {}).items():
        fn[k] += v
print("functions", dict(fn))
tvs = sorted(r["tv_s"] for r in rows if r.get("status") == "tv")
if tvs:
    print("tv seconds per module: median %.1f, p90 %.1f, max %.1f" % (tvs[len(tvs) // 2], tvs[int(len(tvs) * .9)], tvs[-1]))
cex = [r for r in rows if r.get("cex")]
print("modules with a counterexample:", len(cex))
for r in cex:
    fe = r.get("fuzz_exec", {})
    print("  seed %d  funcs %s  fuzz-exec changed=%s  opts %s" % (r["seed"], ",".join(r["cex"]), fe.get("changed"), " ".join(r["opts"])[:110]))
