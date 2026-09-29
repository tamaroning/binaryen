#!/usr/bin/env python3
"""Greedy s-expression reducer for .wat files.

usage: sreduce.py IN.wat OUT.wat -- CMD...
CMD gets the candidate file path appended and must exit 0 while the bug is
still present. Tries, for every list node: delete it, replace it by one of its
list children, replace it by a zero constant of a guessed type.
"""
import os
import re
import subprocess
import sys
import tempfile


def parse(s):
    toks = re.findall(r'\(|\)|"(?:[^"\\]|\\.)*"|;;[^\n]*|[^\s()]+', s)
    stack = [[]]
    for t in toks:
        if t.startswith(";;"):
            continue
        if t == "(":
            stack.append([])
        elif t == ")":
            x = stack.pop()
            stack[-1].append(x)
        else:
            stack[-1].append(t)
    return stack[0][0]


def show(x, ind=0):
    if isinstance(x, str):
        return x
    if all(isinstance(c, str) for c in x) or len(show_flat(x)) < 70:
        return show_flat(x)
    head = []
    rest = list(x)
    while rest and isinstance(rest[0], str):
        head.append(rest.pop(0))
    pad = " " * (ind + 1)
    return "(" + " ".join(head) + "".join("\n" + pad + show(c, ind + 1) for c in rest) + ")"


def show_flat(x):
    if isinstance(x, str):
        return x
    return "(" + " ".join(show_flat(c) for c in x) + ")"


def paths(x, p=()):
    if isinstance(x, list):
        yield p
        for i, c in enumerate(x):
            yield from paths(c, p + (i,))


def get(x, p):
    for i in p:
        x = x[i]
    return x


def replaced(x, p, new):
    if not p:
        return new
    y = list(x)
    if new is None and len(p) == 1:
        del y[p[0]]
        return y
    y[p[0]] = replaced(x[p[0]], p[1:], new)
    return y


def main():
    src, dst = sys.argv[1], sys.argv[2]
    cmd = sys.argv[sys.argv.index("--") + 1:]
    tree = parse(open(src).read())
    tmp = tempfile.mktemp(suffix=".wat")

    def ok(t):
        with open(tmp, "w") as f:
            f.write(show(t))
        return subprocess.run(cmd + [tmp], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).returncode == 0

    assert ok(tree), "input does not reproduce"
    changed = True
    while changed:
        changed = False
        for p in sorted(paths(tree), key=len):
            if not p:
                continue
            try:
                node = get(tree, p)
            except (IndexError, TypeError):
                continue
            if not isinstance(node, list) or not node or node[0] in ("module", "func", "type", "param", "result", "local", "export", "memory", "import"):
                if isinstance(node, list) and node and node[0] in ("func", "param", "local", "export", "import"):
                    pass
                else:
                    continue
            cands = [None]
            cands += [c for c in node if isinstance(c, list)]
            cands += [["i32.const", "0"], ["i64.const", "0"], ["nop"], ["unreachable"]]
            for c in cands:
                t = replaced(tree, p, c)
                if t != tree and ok(t):
                    tree = t
                    changed = True
                    with open(dst, "w") as f:
                        f.write(show(tree) + "\n")
                    break
    with open(dst, "w") as f:
        f.write(show(tree) + "\n")
    os.unlink(tmp)


if __name__ == "__main__":
    main()
