#!/usr/bin/env python3
"""Differential loop: wasm-opt --fuzz-exec (interpret before-opt vs after-opt).

Same core check as binaryen's own FuzzExec handler in scripts/fuzz_opt.py,
but standalone so it needs no d8.  Pass list and closed-world gating are
copied from fuzz_opt.py so we do not report its known-incomparable passes.
"""
import os, random, subprocess, sys, time, shutil

BIN = '/home/tamaron/work/binaryen/bin/wasm-opt'
WORK = sys.argv[1]
SEED0 = int(sys.argv[2]) if len(sys.argv) > 2 else 0
FINDINGS = os.path.join(WORK, 'findings')
os.makedirs(FINDINGS, exist_ok=True)

FEATURES = [
    'threads', 'mutable-globals', 'nontrapping-float-to-int', 'simd',
    'bulk-memory', 'sign-ext', 'exception-handling', 'tail-call',
    'reference-types', 'multivalue', 'gc', 'memory64', 'relaxed-simd',
    'extended-const', 'strings', 'multimemory', 'bulk-memory-opt',
    'call-indirect-overlong', 'custom-descriptors', 'relaxed-atomics',
    'custom-page-sizes', 'wide-arithmetic',
]

opt_choices = [
    (),
    ('-O1',), ('-O2',), ('-O3',), ('-O4',), ('-Os',), ('-Oz',),
    ("--abstract-type-refining",), ("--cfp",), ("--cfp-reftest",),
    ("--coalesce-locals",), ("--code-pushing",), ("--code-folding",),
    ("--const-hoisting",), ("--dae",), ("--dae-optimizing",), ("--dae2",),
    ("--dce",), ("--directize",), ("--discard-global-effects",),
    ("--flatten", "--dfo",), ("--duplicate-function-elimination",),
    ("--flatten",), ("--inlining",), ("--inlining-optimizing",),
    ("--flatten", "--simplify-locals-notee-nostructure", "--local-cse",),
    ("--generate-global-effects",), ("--global-refining",), ("--gsi",),
    ("--gto",), ("--gufa",), ("--gufa-cast-all",), ("--gufa-optimizing",),
    ("--local-cse",), ("--heap2local",),
    ("--remove-unused-names", "--heap2local",), ("--heap-store-optimization",),
    ("--generate-stack-ir",), ("--licm",), ("--local-subtyping",),
    ("--memory-packing",), ("--merge-blocks",), ('--merge-locals',),
    ('--monomorphize', '--pass-arg=monomorphize-min-benefit@0'),
    ('--monomorphize', '--pass-arg=monomorphize-min-benefit@50'),
    ('--monomorphize', '--pass-arg=monomorphize-min-benefit@95'),
    ('--monomorphize-always',), ('--minimize-rec-groups',), ('--no-stack-ir',),
    ('--once-reduction',), ("--optimize-casts",), ("--optimize-instructions",),
    ("--optimize-stack-ir",), ("--generate-stack-ir", "--optimize-stack-ir",),
    ("--generate-stack-ir", "--optimize-stack-ir", "--roundtrip"),
    ("--pick-load-signs",), ("--precompute",), ("--precompute-propagate",),
    ("--remove-unused-brs",), ("--remove-unused-nonfunction-module-elements",),
    ("--remove-unused-module-elements",), ("--remove-unused-names",),
    ("--remove-unused-types",), ("--reorder-functions",), ("--reorder-locals",),
    ("--reorder-types",), ("--flatten", "--rereloop",), ("--roundtrip",),
    ("--rse",), ("--signature-pruning",), ("--signature-refining",),
    ("--simplify-globals",), ("--simplify-globals-optimizing",),
    ("--simplify-locals",), ("--simplify-locals-nonesting",),
    ("--simplify-locals-nostructure",), ("--simplify-locals-notee",),
    ("--simplify-locals-notee-nostructure",), ("--ssa",),
    ("--tuple-optimization",), ("--type-finalizing",), ("--type-refining",),
    ("--type-refining-gufa",), ("--type-merging",), ("--type-ssa",),
    ("--type-unfinalizing",), ("--unsubtyping",), ("--vacuum",),
]

requires_closed_world = {
    ("--type-refining",), ("--type-refining-gufa",), ("--signature-pruning",),
    ("--signature-refining",), ("--gto",), ("--remove-unused-types",),
    ("--abstract-type-refining",), ("--cfp",), ("--cfp-reftest",),
    ("--reorder-types",), ("--type-finalizing",), ("--type-unfinalizing",),
    ("--type-ssa",), ("--type-merging",), ("--unsubtyping",)}


def feature_opts(r):
    opts = ['--all-features', '--disable-fp16']
    if r.random() < 0.5:
        for f in FEATURES:
            if r.random() < 0.2:
                opts.append('--disable-' + f)
    for f in ('shared-everything', 'stack-switching'):
        opts.append('--disable-' + f)
    return opts


def get_random_opts(r, closed_world, feats):
    usable = opt_choices if closed_world else [c for c in opt_choices if c not in requires_closed_world]
    groups, has_flatten = [], False
    while True:
        c = r.choice(usable)
        if '--flatten' in c or '-O4' in c:
            if has_flatten:
                continue
            if '--enable-multivalue' in feats or '--enable-reference-types' in feats:
                continue
            if '--enable-exception-handling' in feats:
                continue
            has_flatten = True
        if ('--rereloop' in c or '--dfo' in c) and '--enable-exception-handling' in feats:
            continue
        groups.append(c)
        if len(groups) > 12 or r.random() < 0.3:
            break
    ret = [f for g in groups for f in g]
    if r.random() < 0.4:
        ret.insert(r.randint(0, len(ret)), '--roundtrip')
    if '-O' not in str(ret):
        if r.random() < 0.5:
            ret += ['--optimize-level=%d' % r.randint(0, 3)]
        if r.random() < 0.5:
            ret += ['--shrink-level=%d' % r.randint(0, 3)]
    return ret


def main():
    top = random.Random(SEED0) if SEED0 else random.Random()
    seed_f = os.path.join(WORK, 'seed.dat')
    before = os.path.join(WORK, 'before.wasm')
    n = found = 0
    t0 = time.time()
    while True:
        n += 1
        seed = top.getrandbits(64)
        r = random.Random(seed)
        with open(seed_f, 'wb') as f:
            f.write(bytes(r.getrandbits(8) for _ in range(r.randint(400, 25000))))
        feats = feature_opts(r)
        ga = []
        if r.random() < 0.7:
            ga.append('--denan')
        if r.random() < 0.5:
            ga.append('--no-fuzz-oob')
        closed_world = r.random() < 0.35
        if closed_world:
            ga.append('--closed-world')
            if r.random() < 0.5:
                ga.append('--enclose-world')
        try:
            p = subprocess.run([BIN, '-ttf', seed_f, '-o', before] + feats + ga,
                               capture_output=True, text=True, timeout=60)
        except subprocess.TimeoutExpired:
            continue
        if p.returncode != 0:
            continue
        opts = get_random_opts(r, closed_world, feats)
        if closed_world:
            opts.append('--closed-world')
        try:
            q = subprocess.run([BIN, before, '--fuzz-exec', '-o', os.devnull] + opts + feats,
                               capture_output=True, text=True, timeout=120)
        except subprocess.TimeoutExpired:
            continue
        out = q.stdout + q.stderr
        if q.returncode != 0 and 'optimization passes changed results' in out:
            found += 1
            d = os.path.join(FINDINGS, 'f%03d_%d' % (found, seed & 0xffffff))
            os.makedirs(d, exist_ok=True)
            shutil.copy(before, os.path.join(d, 'before.wasm'))
            shutil.copy(seed_f, os.path.join(d, 'seed.dat'))
            with open(os.path.join(d, 'cmd.txt'), 'w') as f:
                f.write('GEN: %s\n' % ' '.join([BIN, '-ttf', 'seed.dat', '-o', 'before.wasm'] + feats + ga))
                f.write('OPT: %s\n' % ' '.join([BIN, 'before.wasm', '--fuzz-exec', '-o', os.devnull] + opts + feats))
            with open(os.path.join(d, 'out.txt'), 'w') as f:
                f.write(out)
            print('FOUND #%d iter %d -> %s' % (found, n, d), flush=True)
        if n % 100 == 0:
            print('iter %d, %.0fs, found %d' % (n, time.time() - t0, found), flush=True)

main()
