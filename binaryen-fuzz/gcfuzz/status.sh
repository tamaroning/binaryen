#!/bin/bash
# summarise the six workers
cd /home/tamaron/work/binaryen/binaryen-fuzz/gcfuzz/
python3 - "$1" <<'PY'
import json,glob,collections
T=collections.Counter(); U=collections.Counter(); K=collections.Counter(); V=collections.Counter()
for f in sorted(glob.glob(__import__('sys').argv[1] if len(__import__('sys').argv)>1 and __import__('sys').argv[1] else 'w[0-9]*/stats.json')):
    s=json.load(open(f))
    for k in ['modules','invalid','funcs_validated','tv_runs','optfail','cex']: T[k]+=s[k]
    V.update(s['verdicts']); U.update(s['unsupported']); K.update(s['unknown']); K.update(s.get('error',{}))
print(dict(T)); print(dict(V)); print(U.most_common(20)); print(K.most_common(10))
PY
ls -d w*/bad/* 2>/dev/null
