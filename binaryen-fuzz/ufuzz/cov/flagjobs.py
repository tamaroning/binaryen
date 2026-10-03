#!/usr/bin/env python3
"""Jobs that run option-gated passes over the modules of a corpus (to tell option-gated from shape-gated code).
usage: flagjobs.py CORPUS_DIR OUT_DIR [N modules=300]"""
import json
import os
import sys

FLAGS = [["--closed-world", "--traps-never-happen", "--abstract-type-refining"],
         ["--closed-world", "--traps-never-happen", "-O3"],
         ["--inlining-optimizing", "--partial-inlining-ifs=4", "--inline-functions-with-loops",
          "--flexible-inline-max-function-size=300", "--always-inline-max-function-size=100"],
         ["--reorder-globals-always"],
         ["--flatten", "--i64-to-i32-lowering"],
         ["--alignment-lowering"], ["--avoid-reinterprets"], ["--optimize-added-constants", "--low-memory-unused"]]


def main():
    src, out = sys.argv[1], sys.argv[2]
    n = int(sys.argv[3]) if len(sys.argv) > 3 else 300
    os.makedirs(out, exist_ok=True)
    seen = {}
    for line in open(src + "/jobs.jsonl"):
        j = json.loads(line)
        seen.setdefault(j["wasm"], j["feats"])
    with open(out + "/jobs.jsonl", "w") as fh:
        for w, feats in list(seen.items())[:n]:
            for c in FLAGS:
                fh.write(json.dumps({"wasm": w, "feats": feats, "cfg": c}) + "\n")


if __name__ == "__main__":
    main()
