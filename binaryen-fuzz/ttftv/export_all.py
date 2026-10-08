"""Copies of reach-run modules with every defined function exported, optimized again.

For each OUT/cex/<seed> of a reach run, a.wasm with an export "x<N>" added for each defined
function without one (through Binaryen's text format), optimized with the seed's options by
the build under test into b.wasm, in NEW/cex/<seed>; reach_tv.py NEW then finds where the
bug fires and runs TV there.

usage: export_all.py OUT NEW   (env TTFTV_WASM_OPT: the build under test)
"""
import json, os, re, shutil, subprocess, sys

out, new = sys.argv[1], sys.argv[2]
WO = os.environ["TTFTV_WASM_OPT"]
for seed in sorted(os.listdir(os.path.join(out, "cex"))):
    d, n = os.path.join(out, "cex", seed), os.path.join(new, "cex", seed)
    m = json.load(open(os.path.join(d, "meta.json")))
    feats = m["features"]
    text = subprocess.run([WO, os.path.join(d, "a.wasm"), "--print"] + feats, capture_output=True, text=True).stdout
    funcs = re.findall(r"^ \(func (\$\S+)", text, flags=re.M)
    exported = set(re.findall(r'^ \(export "[^"]*" \(func (\$\S+?)\)\)', text, flags=re.M))
    adds = "".join(f' (export "x{k}" (func {f}))\n' for k, f in enumerate(funcs) if f not in exported)
    body = text.rstrip()
    assert body.endswith(")")
    os.makedirs(n, exist_ok=True)
    with open(os.path.join(n, "a.wat"), "w") as f:
        f.write(body[:-1] + adds + ")\n")
    r1 = subprocess.run([WO, os.path.join(n, "a.wat"), "-o", os.path.join(n, "a.wasm")] + feats, capture_output=True, text=True)
    r2 = subprocess.run([WO, os.path.join(n, "a.wasm"), "-o", os.path.join(n, "b.wasm")] + m["opts"] + m.get("fuzz_opts", []) + feats,
                        capture_output=True, text=True)
    ok = r1.returncode == 0 and r2.returncode == 0
    json.dump(m, open(os.path.join(n, "meta.json"), "w"))
    if not ok:
        shutil.rmtree(n)
    print(seed, "ok" if ok else "fail", len(funcs) - len(exported), flush=True)
