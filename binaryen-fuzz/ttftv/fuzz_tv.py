"""Binaryen's own fuzzer (scripts/fuzz_opt.py) with a choice of oracle: exwasm's TV or fuzz_opt's own.

Generation (wasm-opt -ttf with fuzz_opt's settings, features and initial contents) and the
choice of passes are fuzz_opt.py's own functions, called in the order main() and test_one()
call them, so a seed here draws the same module and the same passes as in fuzz_opt.py.  Only
the oracle differs (--oracle): `tv` runs exwasm tv on (a.wasm, b.wasm); `fo` runs one of
fuzz_opt's testcase handlers on them, chosen as test_one() chooses it, except TrapsNeverHappen
(it optimizes again under --traps-never-happen, which changes what counts as correct) and
ClusterFuzz (it ignores the pair and tests ClusterFuzz's own bundle on modules of its own).  Both
oracles share everything up to b.wasm, so a seed gives both the same a.wasm, b.wasm and passes.
Two departures, both so that exwasm can read the module and neither aimed at a bug: proposals
beyond WebAssembly 3.0 are disabled (NON_3_0), and legacy `try` in the generated module is
translated by Binaryen's --translate-to-exnref before optimization.  With TTFTV_EXPORT_ALL=1,
every defined function is also exported before optimization (see EXPORT_ALL).
Unlike fuzz_opt.py, a worker does not stop at the first failure.

usage: fuzz_tv.py --worker K --base SEED --hours H --out DIR [--oracle tv|fo]
       Worker K draws the seeds BASE + K * 10^8, BASE + K * 10^8 + 1, ...  Rerunning the same
       command resumes (see main); `touch DIR/STOP` stops every worker after its current module.
env:   TTFTV_ROOT    binaryen worktree whose scripts/ and test/ are used (initial contents)
       TTFTV_BIN     directory of the wasm-opt under test
       TTFTV_EXWASM  exwasm binary;  TTFTV_IL  its IL
       TTFTV_SMT_MS (20000), TTFTV_TV_S (600), TTFTV_MEM_GB (3)
       TTFTV_TV_PAR  (0) if K > 0, run one exwasm per exported function (--func), K at a time,
                     so a module cut off at TTFTV_TV_S keeps the verdicts of its finished functions
       V8            d8 for --oracle fo (fuzz_opt's handlers run it); TTFTV_FO_S (600) per module
"""
import argparse
import hashlib
import json
import os
import random
import re
import resource
import shutil
import subprocess
import sys
import time

ap = argparse.ArgumentParser()
ap.add_argument("--worker", type=int, required=True)
ap.add_argument("--base", type=int, required=True)
ap.add_argument("--hours", type=float, required=True)
ap.add_argument("--out", required=True)
ap.add_argument("--oracle", choices=("tv", "fo"), default="tv")
ap.add_argument("--regen", type=int, help="only regenerate a.wasm / b.wasm of this seed into OUT/work/wK (no TV)")
args = ap.parse_args()

ROOT = os.environ["TTFTV_ROOT"]
BIN = os.environ["TTFTV_BIN"]
EXWASM = os.environ["TTFTV_EXWASM"]
IL = os.environ["TTFTV_IL"]
SMT_MS = int(os.environ.get("TTFTV_SMT_MS", "20000"))
TV_S = int(os.environ.get("TTFTV_TV_S", "600"))
MEM_GB = float(os.environ.get("TTFTV_MEM_GB", "3"))
# TTFTV_REACH: bin directory of a wasm-opt with one bug fixed; instead of TV, record whether its
# output differs from the one under test (whether the bug fires on the module)
REACH = os.environ.get("TTFTV_REACH")
# TTFTV_EXPORT_ALL=1: export every defined function of the generated module before optimizing
# it (as e4_tv.py does for real programs), so that each is validated on its own
EXPORT_ALL = os.environ.get("TTFTV_EXPORT_ALL") == "1"

OUT = os.path.abspath(args.out)
WDIR = os.path.join(OUT, "work", "w%d" % args.worker)
os.makedirs(WDIR, exist_ok=True)
os.makedirs(os.path.join(OUT, "cex"), exist_ok=True)
STOP = os.path.join(OUT, "STOP")

# fuzz_opt.py parses sys.argv through test/shared.py and chdirs to --out-dir at import; it
# exits unless a V8 shell is set, which we never run
sys.argv = ["fuzz_opt.py", "--binaryen-bin", BIN, "--out-dir", WDIR]
os.environ.setdefault("V8", "/bin/true")
sys.path.insert(0, os.path.join(ROOT, "scripts"))
_stdout = sys.stdout
# fuzz_opt prints every command and the output of every run (GBs per worker-hour); kept only
# with TTFTV_FO_LOG=1
sys.stdout = open(os.path.join(WDIR, "fuzz_opt.log") if os.environ.get("TTFTV_FO_LOG") == "1" else os.devnull, "a")
import fuzz_opt as F  # noqa: E402

# Proposals beyond WebAssembly 3.0 have no semantics in the IL, and exwasm rejects a whole module
# that uses one; fuzz_opt.py otherwise enables them in most modules.  They are disabled on top of
# fuzz_opt's own feature choice (after FEATURE_DISABLE_FLAGS is computed, so its random draws
# are unchanged).
NON_3_0 = ["threads", "strings", "stack-switching", "shared-everything", "custom-descriptors",
           "acquire-release-atomics", "relaxed-atomics", "custom-page-sizes", "wide-arithmetic",
           "compact-imports"]
if os.environ.get("TTFTV_ONLY_3_0", "1") == "1":
    F.CONSTANT_FEATURE_OPTS += ["--disable-" + f for f in NON_3_0]

F.init_important_initial_contents()

# fuzz_shell.js prints an exported i64 global as its two 32-bit halves, Binaryen's interpreter as
# one number, and fix_output does not reconcile them, so CompareVMs reports every module that
# exports an i64 global and runs on d8.  fuzz_opt.py rarely runs d8 (most of its modules enable a
# feature d8 lacks), but with NON_3_0 disabled it often does.  Likewise, an exported f64 global
# is printed exactly by the interpreter (9223372036854775808) and as JS prints it by d8
# (9223372036854776000).  Both outputs get the same rewrite: a logged pair of 32-bit numbers
# becomes the 64-bit value, and a logged number that is not an integer below 2^53 is printed as
# Python prints that double.  The only comparison lost is between i64 values above 2^53 that
# differ in their low bits.
_fix_output = F.fix_output


def _join_halves(m):
    lo, hi = int(m.group(1)) & 0xffffffff, int(m.group(2)) & 0xffffffff
    v = (hi << 32) | lo
    return "[LoggingExternalInterface logging %d]" % (v - (1 << 64) if v >> 63 else v)


def _as_double(m):
    x = m.group(1)
    if re.fullmatch(r"-?\d+", x) and abs(int(x)) < (1 << 53):
        return m.group(0)
    if "nan" in x.lower():
        return "[LoggingExternalInterface logging nan]"
    try:
        return "[LoggingExternalInterface logging %r]" % float(x.replace("Infinity", "inf"))
    except ValueError:
        return m.group(0)


def fix_output(out):
    out = _fix_output(out)
    if out == F.IGNORE:
        return out
    out = re.sub(r"\[LoggingExternalInterface logging (-?\d+) (-?\d+)\]", _join_halves, out)
    return re.sub(r"\[LoggingExternalInterface logging ([-+.\w:]+)\]", _as_double, out)


F.fix_output = fix_output

# fuzz_opt.py runs bundle_clusterfuzz.py through its shebang, /usr/bin/python3, which is too old
# here; run Binaryen's Python scripts with this interpreter instead.
_run = F.run


def run_py(cmd, *a, **k):
    if cmd and str(cmd[0]).endswith(".py"):
        cmd = [sys.executable] + list(cmd)
    return _run(cmd, *a, **k)


F.run = run_py


def limit_as():
    b = int(MEM_GB * (1 << 30))
    resource.setrlimit(resource.RLIMIT_AS, (b, b))


def run(cmd, timeout, mem=False):
    t0 = time.time()
    try:
        p = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout,
                           preexec_fn=limit_as if mem else None)
        return p.returncode, p.stdout.decode(errors="replace"), time.time() - t0
    except subprocess.TimeoutExpired:
        return "timeout", "", time.time() - t0


# wasm-opt's assumption flags that exwasm takes as premises
PREMISES = {"--traps-never-happen": "traps-never-happen", "-tnh": "traps-never-happen",
            "--fast-math": "fast-math", "-ffm": "fast-math"}
VERDICTS = ("equivalent", "bounded", "counterexample", "unsupported", "unknown")


def export_all(a):
    """Adds an export "x<N>" for each defined function of `a` without one (in place)."""
    # the text goes to a file: under BINARYEN_PASS_DEBUG, wasm-opt also logs to stderr
    wat = a + ".wat"
    rc, out, _ = run([os.path.join(BIN, "wasm-opt"), a, "-S", "-o", wat] + F.FEATURE_OPTS, 300)
    if rc != 0:
        return rc, out
    with open(wat) as f:
        text = f.read()
    funcs = re.findall(r"^ \(func (\$\S+)", text, flags=re.M)
    exported = set(re.findall(r'^ \(export "[^"]*" \(func (\$\S+?)\)\)', text, flags=re.M))
    adds = "".join(' (export "x%d" (func %s))\n' % (k, f) for k, f in enumerate(funcs) if f not in exported)
    with open(wat, "w") as f:
        f.write(text.rstrip()[:-1] + adds + ")\n")
    rc, out, _ = run([os.path.join(BIN, "wasm-opt"), wat, "-o", a] + F.FEATURE_OPTS, 300)
    return rc, out


def tv(a, b, opts):
    cmd = [EXWASM, "--il", IL, "tv", a, b, "--smt-timeout-ms", str(SMT_MS)]
    assume = sorted({PREMISES[f] for f in opts if f in PREMISES})
    if assume:
        cmd += ["--assume", ",".join(assume)]
    rc, out, dt = run(cmd, TV_S, mem=True)
    res = {}
    for line in out.splitlines():
        p = line.split("\t")
        if len(p) >= 3 and p[1] in VERDICTS:
            res[p[0]] = [p[1], p[3] if len(p) > 3 else "", p[2]]
    err = None
    if rc == "timeout":
        err = "tv timeout"
    elif not res:
        err = ([ln for ln in out.splitlines() if ln.startswith("error")] or [out.strip()[-200:]])[0][:200]
    return res, err, dt, out


TV_PAR = int(os.environ.get("TTFTV_TV_PAR", "0"))


def func_exports(path):
    """The function exports of a wasm binary that exwasm tv checks (it skips names starting
    with "__")."""
    def leb(b, i):
        r = s = 0
        while True:
            x = b[i]
            i += 1
            r |= (x & 0x7f) << s
            s += 7
            if x < 0x80:
                return r, i
    with open(path, "rb") as f:
        b = f.read()
    i, out = 8, []
    while i < len(b):
        n, j = leb(b, i + 1)
        if b[i] == 7:
            c, j = leb(b, j)
            for _ in range(c):
                ln, j = leb(b, j)
                name = b[j:j + ln].decode()
                kind = b[j + ln]
                _, j = leb(b, j + ln + 1)
                if kind == 0 and not name.startswith("__"):
                    out.append(name)
            break
        i = j + n
    return out


def tv_par(a, b, opts):
    """tv() with one process per exported function, TV_PAR at a time, within TV_S in all."""
    from concurrent.futures import ThreadPoolExecutor
    t0 = time.time()
    deadline = t0 + TV_S
    assume = sorted({PREMISES[f] for f in opts if f in PREMISES})

    def check(name):
        left = deadline - time.time()
        if left < 1:
            return name, "skipped", ""
        # the memory limit through prlimit: preexec_fn is not safe in threads
        cmd = ["prlimit", "--as=%d" % int(MEM_GB * (1 << 30)), EXWASM, "--il", IL, "tv", a, b,
               "--smt-timeout-ms", str(SMT_MS), "--func", name]
        if assume:
            cmd += ["--assume", ",".join(assume)]
        rc, out, _ = run(cmd, left)
        return name, rc, out

    names = func_exports(a)
    with ThreadPoolExecutor(TV_PAR) as ex:
        outs = list(ex.map(check, names))
    res, errs = {}, []
    for name, rc, out in outs:
        for line in out.splitlines():
            p = line.split("\t")
            if len(p) >= 3 and p[1] in VERDICTS:
                res[p[0]] = [p[1], p[3] if len(p) > 3 else "", p[2]]
        if name not in res:
            errs.append("tv timeout" if rc in ("timeout", "skipped") else
                        ([ln for ln in out.splitlines() if ln.startswith("error")] or [out.strip()[-200:]])[0][:200])
    err = None
    if errs:
        err = ("tv timeout" if "tv timeout" in errs else errs[0]) + (" (%d of %d functions)" % (len(errs), len(names)) if res else "")
    return res, err, time.time() - t0, "\n".join(o for _, _, o in outs)


def save_cex(seed, row, tv_out):
    d = os.path.join(OUT, "cex", str(seed))
    os.makedirs(d, exist_ok=True)
    for f in ("input.dat", "a.wasm", "b.wasm", "c.wasm"):
        if os.path.exists(os.path.join(WDIR, f)):
            shutil.copy(os.path.join(WDIR, f), d)
    if F.INITIAL_CONTENTS and os.path.exists(F.INITIAL_CONTENTS):
        shutil.copy(F.INITIAL_CONTENTS, os.path.join(d, "initial" + os.path.splitext(F.INITIAL_CONTENTS)[1]))
    with open(os.path.join(d, "tv.out"), "w") as f:
        f.write(tv_out)
    with open(os.path.join(d, "meta.json"), "w") as f:
        json.dump(row, f, indent=1)


FO_S = int(os.environ.get("TTFTV_FO_S", "600"))


def fo(seed, row, opts):
    """fuzz_opt's oracle on WDIR/a.wasm and b.wasm: test_one()'s choice of handler and its
    handle_pair, in a forked child (in a process group of its own, killed after FO_S seconds,
    since fuzz_opt runs its commands without a timeout).  A failure is saved to OUT/fail/<seed>."""
    a, b = os.path.join(WDIR, "a.wasm"), os.path.join(WDIR, "b.wasm")
    for f in ("a", "b"):
        shutil.copy(os.path.join(WDIR, f + ".wasm"), os.path.join(WDIR, f + "0.wasm"))
    rfd, wfd = os.pipe()
    pid = os.fork()
    if pid == 0:
        os.close(rfd)
        os.setpgrp()
        res = {}
        try:
            hs = [h for h in F.testcase_handlers if not isinstance(h, (F.TrapsNeverHappen, F.ClusterFuzz))]
            relevant = [h for h in hs if not hasattr(h, "get_commands") and h.can_run_on_wasm(a)]
            if not relevant:
                res = {"status": "fo-none"}
            else:
                filtered = [h for h in relevant if random.random() < h.frequency]
                if not filtered:
                    filtered = [random.choice(relevant)]
                h = random.choice(filtered)
                res = {"handler": h.__class__.__name__}
                sys.stdout.flush()
                h.handle_pair(input=os.path.join(WDIR, "input.dat"), before_wasm=a, after_wasm=b,
                              opts=opts + F.FEATURE_OPTS)
                res["status"] = "fo-ok"
        except BaseException as e:
            import traceback
            res["status"] = "fo-fail"
            res["detail"] = repr(e)[:300]
            res["error"] = traceback.format_exc()
        sys.stdout.flush()
        with os.fdopen(wfd, "w") as f:
            json.dump(res, f)
        os._exit(0)
    os.close(wfd)
    t0, res = time.time(), None
    with os.fdopen(rfd) as f:
        import select
        while time.time() - t0 < FO_S:
            if select.select([f], [], [], 5)[0]:
                txt = f.read()
                res = json.loads(txt) if txt else {"status": "fo-error", "detail": "no result"}
                break
    if res is None:
        res = {"status": "fo-timeout"}
    try:
        os.killpg(pid, 9)
    except ProcessLookupError:
        pass
    os.waitpid(pid, 0)
    res["fo_s"] = round(time.time() - t0, 1)
    error = res.pop("error", "")
    if res["status"] == "fo-fail":
        d = os.path.join(OUT, "fail", str(seed))
        os.makedirs(d, exist_ok=True)
        # the pair as made before the handler ran (handlers may write over a.wasm and b.wasm)
        for f in ("input.dat", "a0.wasm", "b0.wasm"):
            shutil.copy(os.path.join(WDIR, f), os.path.join(d, f.replace("0", "")))
        with open(os.path.join(d, "error.txt"), "w") as f:
            f.write(error)
        if F.INITIAL_CONTENTS and os.path.exists(F.INITIAL_CONTENTS):
            shutil.copy(F.INITIAL_CONTENTS, os.path.join(d, "initial" + os.path.splitext(F.INITIAL_CONTENTS)[1]))
        with open(os.path.join(d, "meta.json"), "w") as f:
            json.dump(dict(row, **res), f, indent=1)
    return res


def one(seed):
    # fuzz_opt.py main(): seed, input size, random bytes; then test_one() up to b.wasm
    random.seed(seed)
    size = F.random_size()
    F.make_random_input(size, os.path.join(WDIR, "input.dat"))
    F.randomize_pass_debug()
    F.randomize_feature_opts()
    F.randomize_fuzz_settings()
    F.pick_initial_contents()
    opts = F.get_random_opts()
    a, b = os.path.join(WDIR, "a.wasm"), os.path.join(WDIR, "b.wasm")
    for f in (a, b):
        if os.path.exists(f):
            os.remove(f)
    row = {"seed": seed, "size": size, "init": F.INITIAL_CONTENTS and os.path.relpath(F.INITIAL_CONTENTS, ROOT),
           "gen_args": F.GEN_ARGS, "opts": opts, "fuzz_opts": F.FUZZ_OPTS,
           "pass_debug": bool(os.environ.get("BINARYEN_PASS_DEBUG"))}
    gen = [os.path.join(BIN, "wasm-opt"), os.path.join(WDIR, "input.dat"), "-ttf", "-o", a] + F.GEN_ARGS + F.FEATURE_OPTS
    if F.INITIAL_CONTENTS:
        gen += ["--initial-fuzz=" + F.INITIAL_CONTENTS]
    rc, out, _ = run(gen, 300)
    if rc != 0 or not os.path.exists(a):
        row["status"] = "gen-fail"
        row["detail"] = out.strip()[-200:]
        return row
    F.update_feature_opts(a)
    row["features"] = F.FEATURE_OPTS
    if "--enable-exception-handling" in F.FEATURE_OPTS:
        # -ttf mixes legacy `try` (not in WebAssembly 3.0; exwasm rejects the module) with
        # `try_table`; Binaryen's own translation to the new instructions gives the input
        rc, out, _ = run([os.path.join(BIN, "wasm-opt"), a, "-o", a, "--translate-to-exnref"] + F.FEATURE_OPTS, 300)
        if rc != 0:
            row["status"] = "exnref-fail"
            row["detail"] = out.strip()[-200:]
            return row
    if EXPORT_ALL:
        rc, out = export_all(a)
        if rc != 0:
            row["status"] = "export-fail"
            row["detail"] = out.strip()[-200:]
            return row
    opt = [os.path.join(BIN, "wasm-opt"), a, "-o", b] + opts + F.FUZZ_OPTS + F.FEATURE_OPTS
    rc, out, _ = run(opt, 300)
    if rc != 0 or not os.path.exists(b):
        row["status"] = "opt-fail"
        row["detail"] = out.strip()[-200:]
        return row
    # the pair, to check that both oracles see the same one for a seed
    for k, f in (("a_sha1", a), ("b_sha1", b)):
        with open(f, "rb") as fh:
            row[k] = hashlib.sha1(fh.read()).hexdigest()[:16]
    if args.regen is not None:
        return row
    if args.oracle == "fo":
        row.update(fo(seed, row, opts))
        return row
    if REACH:
        # no TV: does the bug fire here?  The same options under a build with its fix
        c = os.path.join(WDIR, "c.wasm")
        rc, out, _ = run([os.path.join(REACH, "wasm-opt"), a, "-o", c] + opts + F.FUZZ_OPTS + F.FEATURE_OPTS, 300)
        row["status"] = "reach"
        with open(b, "rb") as fb, open(c, "rb") as fc:
            row["reach"] = rc == 0 and fb.read() != fc.read()
        if row["reach"]:
            save_cex(seed, row, "")
        return row
    with open(a, "rb") as fa, open(b, "rb") as fb:
        if hashlib.sha1(fa.read()).digest() == hashlib.sha1(fb.read()).digest():
            row["status"] = "unchanged"
            return row
    res, err, dt, tv_out = (tv_par if TV_PAR > 0 else tv)(a, b, opts)
    row["tv_s"] = round(dt, 1)
    row["counts"] = {v: sum(1 for r in res.values() if r[0] == v) for v in VERDICTS}
    row["status"] = "tv-error" if err and not res else "tv"
    if err:
        row["detail"] = err
    cex = {fn: r for fn, r in res.items() if r[0] == "counterexample"}
    if cex:
        row["cex"] = cex
        save_cex(seed, row, tv_out)
    return row


def main():
    # resumable: a worker continues after the last seed in its rows file, and --hours is the
    # worker's total fuzzing time over all its runs (the sum of the rows' "dt")
    path = os.path.join(OUT, "rows-w%d.jsonl" % args.worker)
    seed, used = args.base + args.worker * 100000000, 0.0
    if os.path.exists(path):
        with open(path) as f:
            for line in f:
                try:
                    r = json.loads(line)
                except ValueError:  # a line cut by a kill
                    continue
                seed = max(seed, r["seed"] + 1)
                used += r.get("dt", 0)
    end = time.time() + args.hours * 3600 - used
    rows = open(path, "a")
    while time.time() < end and not os.path.exists(STOP):
        t0 = time.time()
        try:
            row = one(seed)
        except Exception as e:  # a fuzzer-side failure; keep going with the next seed
            row = {"seed": seed, "status": "driver-error", "detail": repr(e)[:300]}
        row["t"] = round(time.time(), 1)
        row["dt"] = round(time.time() - t0, 1)
        rows.write(json.dumps(row) + "\n")
        rows.flush()
        if row.get("cex"):
            print("cex", seed, list(row["cex"]), file=_stdout, flush=True)
        if row.get("status") == "fo-fail":
            print("fail", seed, row.get("handler"), row.get("detail", "")[:200], file=_stdout, flush=True)
        seed += 1

if args.regen is not None:
    print(json.dumps(one(args.regen)), file=_stdout)
else:
    main()
