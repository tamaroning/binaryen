#!/usr/bin/env python3
"""TNH findings where --traps-never-happen made the optimizer ADD a trap or change a value.

usage: tnh_added.py OUT.jsonl DIR...

--traps-never-happen lets the optimizer assume no trap happens, so removing a
trap (original traps, optimized returns) is licensed.  The reverse -- the
original returns and the optimized module traps, or returns another value --
is not.  Runs `wasm-opt --fuzz-exec` on the finding's module and
configuration and keeps the exports where the original did not trap and the
optimized module differs.
"""
import json, os, subprocess, sys
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402


def outcomes(text):
    ev, cur = [], None
    for ln in text.splitlines():
        if ln.startswith("[fuzz-exec] comparing"):
            break
        if ln.startswith("[fuzz-exec] export "):
            cur = ln.split()[-1]
            ev.append([cur, "ok"])
        elif ln.startswith("[fuzz-exec] note result:") and ev:
            ev[-1][1] = ln.split("=>", 1)[1].strip()
        elif ln.startswith("[trap") and ev:
            ev[-1][1] = "trap"
        elif ln.startswith("[exception thrown") and ev:
            ev[-1][1] = "exception"
    return ev


def main():
    c = cfg.load()
    out = sys.argv[1]
    done = {json.loads(l)["dir"] for l in open(out)} if os.path.exists(out) else set()
    with open(out, "a") as fh:
        for d in sys.argv[2:]:
            d = os.path.abspath(d)
            if d in done:
                continue
            meta = json.load(open(d + "/meta.json"))
            wat = d + "/m.wat"
            text = open(wat).read() if os.path.exists(wat) else ""
            feats = cfg.features_for(cfg.FEATURES, text, False)
            try:
                p = subprocess.run([c["wasm_opt"]] + feats + [d + "/m.wasm"] + meta["cfg"].split() + ["--fuzz-exec", "-o", "/dev/null"],
                                   capture_output=True, text=True, timeout=120)
            except subprocess.TimeoutExpired:
                continue
            ev = outcomes(p.stdout + p.stderr)
            n = len(ev) // 2
            added = []
            for (a, x), (b, y) in zip(ev[:n], ev[n:2 * n]):
                if a == b and x not in ("trap", "exception") and x != y:
                    added.append((a, x, y))
            fh.write(json.dumps({"dir": d, "cfg": meta["cfg"], "added": added}) + "\n")
            fh.flush()


if __name__ == "__main__":
    main()
