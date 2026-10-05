#!/usr/bin/env python3
"""First triage of TV counterexamples --fuzz-exec misses.

usage: tvonly_triage.py OUT.jsonl DIR...

For each finding directory (kind cex, fuzz_exec misses/timeout) records:
  rt:  exwasm tv of its counterexample functions between m.wasm and m.wasm
       written back by wasm-opt with no passes ("counterexample" there means the
       difference does not come from the passes: a validator false positive or a
       reader/writer issue);
  v8:  v8diff.js between m.wasm and o.wasm for seeds 1..3 (3 s hang limit).
A finding with rt != counterexample and a V8 difference is a concrete bug
candidate; one with neither needs a closer look (value-dependent or a false
positive).
"""
import json
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
from recheck import check  # noqa: E402


def v8(node, a, b, seed):
    env = dict(os.environ, V8DIFF_HANG_MS="3000")
    try:
        p = subprocess.run([node, "--experimental-wasm-type-reflection", "--experimental-wasm-exnref",
                            os.path.join(HERE, "v8diff.js"), a, b, str(seed)], capture_output=True, text=True,
                           timeout=600, env=env)
        return json.loads(p.stdout.strip().splitlines()[-1])
    except Exception as e:  # noqa: BLE001
        return {"skip": "%s" % type(e).__name__}


def main():
    out = sys.argv[1]
    c = cfg.load()
    done = {json.loads(ln)["dir"] for ln in open(out)} if os.path.exists(out) else set()
    with open(out, "a") as fh:
        for d in sys.argv[2:]:
            d = os.path.abspath(d)
            if d in done:
                continue
            meta = json.load(open(d + "/meta.json"))
            text = open(d + "/m.wat").read() if os.path.exists(d + "/m.wat") else ""
            feats = cfg.features_for(cfg.FEATURES, text, False)
            rec = {"dir": d, "cfg": meta["cfg"], "fuzz_exec": meta.get("fuzz_exec"), "rt": {}, "v8": []}
            with tempfile.TemporaryDirectory() as t:
                p = subprocess.run([c["wasm_opt"]] + feats + [d + "/m.wasm", "-o", t + "/o.wasm"],
                                   capture_output=True, text=True, timeout=120)
                if p.returncode == 0:
                    os.makedirs(t + "/x")
                    os.symlink(d + "/m.wasm", t + "/x/m.wasm")
                    os.symlink(t + "/o.wasm", t + "/x/o.wasm")
                    for f in meta.get("cex_funcs", []):
                        rec["rt"][f] = check(c["exwasm"], c["il"], t + "/x", f, c["smt_timeout_ms"], c["tv_timeout_s"],
                                             c.get("mem_gb", 3))["verdict"]
            if not meta.get("nov8"):
                for s in (1, 2, 3):
                    r = v8(c["node"], d + "/m.wasm", d + "/o.wasm", s)
                    rec["v8"].append(r.get("detail") or ("skip:" + r["skip"] if r.get("skip") else "same"))
            fh.write(json.dumps(rec) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
