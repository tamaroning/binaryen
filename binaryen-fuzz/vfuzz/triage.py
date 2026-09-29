#!/usr/bin/env python3
"""Re-run every saved finding and print the ones that reproduce.

usage: triage.py BADDIR...   (each BADDIR holds m.wasm, m.sig.json, info.txt)
"""
import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
WASM_OPT = os.environ.get("WASM_OPT", "wasm-opt")
FE = ["--enable-nontrapping-float-to-int", "--enable-sign-ext",
      "--enable-bulk-memory", "--enable-mutable-globals", "--enable-tail-call"]


def run(cmd, timeout):
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)
        return p.returncode, p.stdout.decode(errors="replace")
    except subprocess.TimeoutExpired:
        return "timeout", ""


def main():
    for d in sys.argv[1:]:
        info = open(os.path.join(d, "info.txt")).read().splitlines()
        cfg = info[1][len("config="):].split()
        with tempfile.TemporaryDirectory() as t:
            o = os.path.join(t, "o.wasm")
            rc, msg = run([WASM_OPT, *FE, os.path.join(d, "m.wasm"), *cfg, "-o", o], 60)
            if rc != 0:
                line = next((l for l in msg.splitlines() if "Assertion" in l or "Fatal" in l or "error" in l), msg[-120:])
                print(f"REPRO CRASH {d} | {' '.join(cfg)} | {line[-150:]}")
                continue
            rc, msg = run(["node", os.path.join(HERE, "cmp.js"), os.path.join(d, "m.wasm"), o], 60)
            if rc == "timeout":
                print(f"REPRO HANG {d} | {' '.join(cfg)}")
            elif msg.startswith("DIFF"):
                print(f"REPRO DIFF {d} | {' '.join(cfg)} | {msg.split(' ', 2)[2][:150].strip()}")
            else:
                print(f"NOREPRO {d}")


if __name__ == "__main__":
    main()
