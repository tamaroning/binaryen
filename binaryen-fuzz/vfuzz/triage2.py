#!/usr/bin/env python3
"""Triage round-5 counterexamples.

usage: triage2.py BADDIR...
For every bad/NNNNN directory: re-run the exwasm proof, replay the
counterexample state on V8 (cmp2.js state), run the cmp.js-style V8
differential (cmp2.js diff), and write verdict.txt.
"""
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))


def parse_cex(msg):
    m = re.search(r"counterexample Test \{ inputs: \[(.*?)\], locals: \[(.*?)\], mem: ArrVal \{ seed: (\d+), "
                  r"fills: \[(.*?)\], over: \{(.*?)\} \}, mem_len: (\d+), globals: \[(.*?)\] \}(.*)", msg)
    if not m:
        return None
    nums = lambda s: [int(x) for x in s.replace(" ", "").split(",") if x]
    over = {}
    for kv in m.group(5).split(","):
        if ":" in kv:
            k, v = kv.split(":")
            over[int(k)] = int(v)
    return {"inputs": nums(m.group(1)), "locals": nums(m.group(2)), "seed": int(m.group(3)),
            "fills": m.group(4), "over": over, "mem_len": int(m.group(6)),
            "globals": nums(m.group(7)), "extra": m.group(8).strip().splitlines()[0]}


def node(*args):
    p = subprocess.run(["node", os.path.join(HERE, "cmp2.js"), *args], capture_output=True, text=True, timeout=120)
    return (p.stdout + p.stderr).strip()


def main():
    for d in sys.argv[1:]:
        info = open(os.path.join(d, "info.txt")).read()
        cex = parse_cex(info)
        sig = json.load(open(os.path.join(d, "m.json")))
        out = []
        if cex:
            np = len(sig["params"])
            st = {"params": sig["params"], "args": cex["locals"][:np], "mem_len": cex["mem_len"],
                  "seed": cex["seed"], "over": cex["over"], "globals": cex["globals"]}
            with open(os.path.join(d, "state.json"), "w") as fh:
                json.dump(st, fh)
            out.append("cex: " + json.dumps(st) + " " + cex["extra"])
            out.append("replay:\n" + node("state", os.path.join(d, "state.json"), os.path.join(d, "m.wasm"),
                                          os.path.join(d, "o.wasm")))
        else:
            out.append("cex: unparsed")
        out.append("v8diff: " + node("diff", os.path.join(d, "m.json"), os.path.join(d, "m.wasm"),
                                     os.path.join(d, "o.wasm")))
        txt = "\n".join(out)
        with open(os.path.join(d, "verdict.txt"), "w") as fh:
            fh.write(txt + "\n")
        cfg = re.search(r"config=(.*)", info).group(1)
        print(f"== {d} [{cfg}]\n{txt}")


if __name__ == "__main__":
    main()
