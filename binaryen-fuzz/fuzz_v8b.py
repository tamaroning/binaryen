#!/usr/bin/env python3
"""Differential against V8 (node), independent of binaryen's own interpreter.

Runs the module before and after optimization under node + scripts/fuzz_shell.js
and compares stdout.  This catches rewrites whose unsoundness binaryen's
interpreter would agree with.
"""
import os, random, re, subprocess, sys, collections, json

BIN = '/home/tamaron/work/binaryen/bin/wasm-opt'
SHELL = '/home/tamaron/work/binaryen/scripts/fuzz_shell.js'
NODE = 'node'
WORK = sys.argv[1]
SEED0 = int(sys.argv[2]) if len(sys.argv) > 2 else 1
os.makedirs(WORK, exist_ok=True)

# V8 (node, no d8 flags) cannot take these.
FEATS = ['--all-features', '--disable-fp16', '--disable-shared-everything',
         '--disable-stack-switching', '--disable-strings',
         '--disable-relaxed-atomics', '--disable-multibyte',
         '--disable-custom-descriptors', '--disable-wide-arithmetic',
         '--disable-custom-page-sizes', '--disable-compact-imports',
         '--disable-relaxed-simd']

CLOSED = {'abstract-type-refining', 'cfp', 'cfp-reftest', 'gto', 'reorder-types',
          'signature-pruning', 'type-merging', 'type-refining', 'type-refining-gufa'}
NOT_STANDALONE = {'no-inline', 'no-full-inline', 'no-partial-inline', 'flatten',
                  'rereloop', 'dfo', 'asyncify', 'alignment-lowering'}
OPTS = [('-O1',), ('-O2',), ('-O3',), ('-Os',), ('-Oz',), ('--generate-stack-ir', '--optimize-stack-ir'), ('--abstract-type-refining',), ('--alignment-lowering',), ('--asyncify',), ('--cfp',), ('--cfp-reftest',), ('--coalesce-locals',), ('--coalesce-locals-learning',), ('--code-folding',), ('--code-pushing',), ('--const-hoisting',), ('--dae',), ('--dae-optimizing',), ('--dae2',), ('--dce',), ('--dfo',), ('--directize',), ('--discard-global-effects',), ('--duplicate-function-elimination',), ('--duplicate-import-elimination',), ('--flatten',), ('--generate-global-effects',), ('--global-refining',), ('--gsi',), ('--gsi-desc-cast',), ('--gto',), ('--gufa',), ('--gufa-cast-all',), ('--gufa-optimizing',), ('--heap-store-optimization',), ('--heap2local',), ('--inlining',), ('--inlining-optimizing',), ('--intrinsic-lowering',), ('--licm',), ('--limit-segments',), ('--local-cse',), ('--local-subtyping',), ('--memory-packing',), ('--merge-blocks',), ('--merge-locals',), ('--merge-similar-functions',), ('--minimize-rec-groups',), ('--monomorphize',), ('--monomorphize-always',), ('--multi-memory-lowering',), ('--multi-memory-lowering-with-bounds-checks',), ('--no-full-inline',), ('--no-inline',), ('--no-partial-inline',), ('--once-reduction',), ('--optimize-casts',), ('--optimize-instructions',), ('--pick-load-signs',), ('--precompute',), ('--precompute-propagate',), ('--propagate-globals-globally',), ('--remove-unused-brs',), ('--remove-unused-module-elements',), ('--remove-unused-names',), ('--remove-unused-nonfunction-module-elements',), ('--remove-unused-types',), ('--reorder-functions',), ('--reorder-functions-by-name',), ('--reorder-globals',), ('--reorder-locals',), ('--reorder-types',), ('--rereloop',), ('--roundtrip',), ('--rse',), ('--signature-pruning',), ('--signature-refining',), ('--signext-lowering',), ('--simplify-globals',), ('--simplify-globals-optimizing',), ('--simplify-locals',), ('--simplify-locals-nonesting',), ('--simplify-locals-nostructure',), ('--simplify-locals-notee',), ('--simplify-locals-notee-nostructure',), ('--ssa',), ('--ssa-nomerge',), ('--strip',), ('--strip-debug',), ('--strip-dwarf',), ('--strip-producers',), ('--strip-target-features',), ('--strip-toolchain-annotations',), ('--translate-to-exnref',), ('--translate-to-new-eh',), ('--tuple-optimization',), ('--type-finalizing',), ('--type-merging',), ('--type-refining',), ('--type-refining-gufa',), ('--type-ssa',), ('--type-unfinalizing',), ('--unsubtyping',), ('--vacuum',)]
OPTS = [o for o in OPTS if o[0].strip('-') not in NOT_STANDALONE]


EXCEPTION_PREFIX = 'exception thrown: '
INSTANTIATE_ERROR = 'exception thrown: failed to instantiate module'


def fix_double(m):
    x = m.group(1)
    if 'nan' in x or 'NaN' in x:
        x = 'nan'
    else:
        x = x.replace('Infinity', 'inf')
        try:
            x = str(float(x))
        except ValueError:
            pass
    return 'f64.const ' + x


def normalize(out):
    """Port of fix_output()/fix_output_for_js() from scripts/fuzz_opt.py.

    Canonicalizes the parts that legitimately differ after optimization:
    trap/exception kinds, funcref indices, tag names, i31 printing, doubles,
    and the harness's null-vs-0 argument artifact.
    """
    out = re.sub(r'f64\.const (-?[nanN:abcdefxIity\d+-.]+)', fix_double, out)
    out = re.sub(r'funcref\([\d\w$+-_:]+\)', 'funcref()', out)
    out = re.sub(r'i31ref\((-?\d+)\)', r'\1', out)
    out = re.sub(r' tag\$\d+', ' tag', out)
    out = re.sub(r' null', ' 0', out)
    if INSTANTIATE_ERROR in out:
        after = out.find(INSTANTIATE_ERROR)
        after = out.find('\n', after)
        out = out[:after + 1]
    lines = []
    for line in out.splitlines():
        if 'V8 is running with experimental features' in line:
            continue
        if 'Warning: unknown flag' in line or 'Try --help for options' in line:
            continue
        if EXCEPTION_PREFIX in line:
            # an exception must still occur, but its kind may legitimately change
            line = '     *exception*'
        lines.append(line)
    return '\n'.join(lines)


def run_node(wasm, timeout=25):
    try:
        p = subprocess.run([NODE, '--wasm-staging', SHELL, wasm],
                           capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return None
    return p.stdout


def main():
    top = random.Random(SEED0)
    before = os.path.join(WORK, 'before.wasm')
    after = os.path.join(WORK, 'after.wasm')
    seed_f = os.path.join(WORK, 'seed.dat')
    n = found = 0
    import time
    t0 = time.time()
    while True:
        n += 1
        seed = top.getrandbits(64)
        r = random.Random(seed)
        with open(seed_f, 'wb') as f:
            f.write(bytes(r.getrandbits(8) for _ in range(r.randint(500, 12000))))
        # always de-NaN: NaN bit patterns legitimately differ across engines
        # legalize so i64/ref exports are callable from JS instead of throwing
        ga = ['--denan', '--legalize-and-prune-js-interface']
        if r.random() < 0.5:
            ga.append('--no-fuzz-oob')
        closed = r.random() < 0.5
        if closed:
            ga.append('--closed-world')
            if r.random() < 0.5:
                ga.append('--enclose-world')
        # stripping @binaryen.js.called annotations changes what closed-world may assume
        opts_pool = ([o for o in OPTS if o[0] != '--strip-toolchain-annotations'] if closed
                     else [o for o in OPTS if o[0].strip('-') not in CLOSED])
        try:
            p = subprocess.run([BIN, '-ttf', seed_f, '-o', before] + FEATS + ga,
                               capture_output=True, text=True, timeout=60)
        except subprocess.TimeoutExpired:
            continue
        if p.returncode != 0:
            continue
        out_before = run_node(before)
        # Only skip modules V8 cannot even build; traps and thrown exceptions
        # are observable behaviour and must be compared, not filtered.
        if (out_before is None or 'CompileError' in out_before
                or 'failed to instantiate' in out_before):
            continue
        opts = []
        for _ in range(r.randint(1, 3)):
            opts += list(r.choice(opts_pool))
        if closed:
            opts.append('--closed-world')
        try:
            q = subprocess.run([BIN, before, '-o', after] + opts + FEATS,
                               capture_output=True, text=True, timeout=90)
        except subprocess.TimeoutExpired:
            continue
        if q.returncode != 0:
            continue
        out_after = run_node(after)
        if out_after is None:
            continue
        # V8 host limits (fuzz_opt.py ignores these too): they legitimately
        # vanish when the optimizer removes the allocation
        HOST = ('requested new array is too large', 'Maximum call stack size exceeded',
                'out of memory', 'Array buffer allocation failed')
        if any(h in out_before or h in out_after for h in HOST):
            continue
        if normalize(out_after) != normalize(out_before):
            found += 1
            d = os.path.join(WORK, 'bad', 'v%03d' % found)
            os.makedirs(d, exist_ok=True)
            subprocess.run(['cp', before, os.path.join(d, 'before.wasm')])
            subprocess.run(['cp', after, os.path.join(d, 'after.wasm')])
            open(os.path.join(d, 'opts.txt'), 'w').write(' '.join(opts))
            open(os.path.join(d, 'before.out'), 'w').write(out_before)
            open(os.path.join(d, 'after.out'), 'w').write(out_after)
            print('V8-DIFF #%d iter %d opts=%s' % (found, n, ' '.join(opts)), flush=True)
        if n % 20 == 0:
            print('iter %d, %.0fs, found %d' % (n, time.time() - t0, found), flush=True)


if __name__ == '__main__':
    main()
