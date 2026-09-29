#!/usr/bin/env python3
"""Compare binaryen's interpreter (wasm-opt --fuzz-exec-before, zero args)
against V8 (node, zero args) on the same module.

usage: interp_vs_v8.py FEATURES -- M.wasm...
Prints "MISMATCH file export interp=... v8=..." lines.
"""
import json
import os
import re
import subprocess
import sys

WASM_OPT = os.environ.get("WASM_OPT", "wasm-opt")

JS = r"""
const fs = require('fs');
const m = new WebAssembly.Module(fs.readFileSync(process.argv[1]));
const i = new WebAssembly.Instance(m, {});
const out = {};
for (const e of WebAssembly.Module.exports(m)) {
  if (e.kind !== 'function') continue;
  const f = i.exports[e.name];
  const args = JSON.parse(process.argv[2])[e.name] || [];
  try { const r = f(...args.map(t => t === 'i64' ? 0n : 0)); out[e.name] = String(r); }
  catch (err) { out[e.name] = 'trap'; }
}
console.log(JSON.stringify(out));
"""


def interp(path, feats):
    p = subprocess.run([WASM_OPT, *feats, path, "--fuzz-exec-before", "-o", "/dev/null"],
                       capture_output=True, text=True, timeout=60)
    res = {}
    cur = None
    for line in (p.stdout + p.stderr).splitlines():
        m = re.match(r"\[fuzz-exec\] export (\S+)", line)
        if m:
            cur = m.group(1)
            continue
        m = re.match(r"\[fuzz-exec\] note result: (\S+) => (.*)", line)
        if m:
            v = m.group(2).strip()
            v = re.sub(r"^(-?\d+)(?:\s*\(.*\))?$", r"\1", v)
            res[m.group(1)] = v
            continue
        if cur and "[trap" in line:
            res.setdefault(cur, "trap")
    return res


def main():
    sep = sys.argv.index("--")
    feats = sys.argv[1:sep]
    for path in sys.argv[sep + 1:]:
        sig = path[:-5] + ".sig.json"
        sigs = open(sig).read() if os.path.exists(sig) else "{}"
        a = interp(path, feats)
        p = subprocess.run(["node", "-e", JS, path, sigs], capture_output=True, text=True, timeout=60)
        try:
            b = json.loads(p.stdout)
        except json.JSONDecodeError:
            print("NODEERR", path, p.stderr[-200:])
            continue
        for k, v in b.items():
            if k not in a:
                continue
            if a[k] != v:
                print(f"MISMATCH {path} {k} interp={a[k]} v8={v}")


if __name__ == "__main__":
    main()
