#!/usr/bin/env python3
"""Union of report.py JSON files (max count per line / function / branch).
usage: merge.py OUT.json A.json B.json ..."""
import json
import sys

out = {}
for p in sys.argv[2:]:
    for f, e in json.load(open(p)).items():
        o = out.setdefault(f, {"lines": {}, "funcs": {}, "br": {}})
        for k in ("lines", "funcs", "br"):
            for key, c in e[k].items():
                o[k][key] = max(o[k].get(key, 0), c)
json.dump(out, open(sys.argv[1], "w"))
