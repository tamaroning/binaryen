#!/usr/bin/env python3
"""Line / function / branch coverage of src/passes/*.cpp from a GCOV_PREFIX tree.

usage: report.py BUILD_DIR GCOV_PREFIX_DIR OUT.json
Links the .gcno files next to the .gcda files, runs `gcov --json-format` and merges per source file.
OUT.json: {file: {"lines": {line: count}, "funcs": {name: count}, "br": [total, taken]}}
"""
import glob
import gzip
import json
import os
import subprocess
import sys
import tempfile


def main():
    build, pre, outj = [os.path.abspath(x) for x in sys.argv[1:4]]
    res = {}
    gcdas = glob.glob(pre + build + "/**/*.gcda", recursive=True)
    for gcda in gcdas:
        rel = os.path.relpath(gcda, pre)
        d = os.path.dirname(gcda)
        gcno = os.path.join("/", rel[:-5] + ".gcno")
        link = gcda[:-5] + ".gcno"
        if not os.path.exists(link) and os.path.exists(gcno):
            os.symlink(gcno, link)
        if "/src/passes/" not in gcda:
            continue
        with tempfile.TemporaryDirectory() as td:
            subprocess.run(["gcov", "-b", "-c", "--json-format", "-o", d, gcda], cwd=td, capture_output=True)
            for jf in glob.glob(td + "/*.gcov.json.gz"):
                data = json.load(gzip.open(jf))
                cwd = data.get("current_working_directory", "")
                for f in data["files"]:
                    p = os.path.normpath(os.path.join(cwd, f["file"]))
                    if "/src/passes/" not in p or not p.endswith(".cpp"):
                        continue
                    e = res.setdefault(os.path.basename(p), {"lines": {}, "funcs": {}, "br": {}})
                    for ln in f["lines"]:
                        n = ln["line_number"]
                        e["lines"][n] = max(e["lines"].get(n, 0), ln["count"])
                        for i, b in enumerate(ln.get("branches", [])):
                            k = "%d.%d" % (n, i)
                            e["br"][k] = max(e["br"].get(k, 0), 1 if b["count"] > 0 else 0)
                    for fn in f["functions"]:
                        e["funcs"][fn["demangled_name"]] = max(e["funcs"].get(fn["demangled_name"], 0),
                                                                fn["execution_count"])
    json.dump(res, open(outj, "w"))
    tl = sum(len(e["lines"]) for e in res.values())
    cl = sum(1 for e in res.values() for c in e["lines"].values() if c)
    print("files %d lines %d/%d (%.1f%%)" % (len(res), cl, tl, 100.0 * cl / max(1, tl)))


if __name__ == "__main__":
    main()
