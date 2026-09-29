#!/usr/bin/env python3
"""Random pass PAIRS: does the composition emit invalid wasm, crash, or change
observable behaviour?

The DeAlign miscompile only became silent once a second pass consumed the
corrupted IR, so pairs are worth sweeping separately from single passes.
"""
import os, random, re, subprocess, sys, collections, json

BIN = '/home/tamaron/work/binaryen/bin/wasm-opt'
WORK = sys.argv[1]
SEED0 = int(sys.argv[2]) if len(sys.argv) > 2 else 1
os.makedirs(WORK, exist_ok=True)

SKIP = {
    'extract-function', 'extract-function-index', 'remove-imports',
    'remove-exports', 'remove-memory', 'remove-memory-init', 'set-globals',
    'poppify', 'experimental-poppy', 'print-stack-ir', 'emit-target-features',
    'separate-data-segments', 'input-source-map', 'output-source-map',
    'output-source-map-url', 'symbolmap', 'print-function-map',
    'emit-spec-wrapper', 'emit-module-names', 'emit-text', 'dwarfdump',
    'string-lowering-magic-imports-assert', 'emit-exnref',
    'experimental-new-eh', 'spill-pointers', 'generate-dyncalls',
    'generate-i64-dyncalls', 'legalize-js-interface',
    'legalize-and-prune-js-interface', 'minify-imports',
    'minify-imports-and-exports', 'minify-imports-and-exports-and-modules',
    'j2cl-opts', 'j2cl-cleanup', 'merge-j2cl-itables', 'optimize-j2cl',
    'post-emscripten', 'asyncify', 'fuzz-exec', 'fuzz-exec-before',
    # already-known-broken alone: keep them out so pairs surface new causes
    'dealign', 'outlining', 'memory64-lowering', 'table64-lowering',
    'strip-eh', 'instrument-locals', 'fpcast-emu', 'stub-unsupported-js',
    # intentionally not semantics-preserving
    'llvm-nontrapping-fptoint-lowering', 'llvm-memory-copy-fill-lowering',
    'optimize-added-constants', 'optimize-added-constants-propagate',
    'string-lowering', 'string-lowering-magic-imports', 'string-lifting',
    'string-gathering', 'fast-math', 'traps-never-happen',
    'ignore-implicit-traps', 'low-memory-unused', 'trap-mode-clamp',
    'trap-mode-js', 'safe-heap', 'stack-check', 'log-execution',
    'instrument-memory', 'trace-calls', 'no-validation',
    # semantics-changing by design, or pure output/ABI changes
    'denan', 'enclose-world', 'remove-non-js-ops', 'remove-relaxed-simd',
    'optimize-for-js', 'i64-to-i32-lowering', 'instrument-branch-hints',
    'mark-js-called', 'inline-main', 'souperify', 'souperify-single-use',
    'print', 'print-boundary', 'print-call-graph', 'print-features',
    'print-full', 'print-minified', 'metrics', 'func-metrics', 'nm',
    'name-types', 'constraint-analysis', 'propagate-debug-locs',
}

FEATS = ['--all-features', '--disable-fp16', '--disable-shared-everything',
         '--disable-stack-switching']


def load_passes():
    out = subprocess.run([BIN, '--help'], capture_output=True, text=True).stdout
    i = out.index('Optimization passes:')
    j = out.index('Optimization options:', i)
    names = []
    for line in out[i:j].splitlines():
        m = re.match(r'^  --([a-z0-9][a-z0-9-]*)\s\s', line)
        if m and m.group(1) not in SKIP:
            names.append(m.group(1))
    return sorted(set(names))


def main():
    passes = load_passes()
    print('%d passes, sweeping random pairs' % len(passes), flush=True)
    top = random.Random(SEED0)
    seed_f = os.path.join(WORK, 'seed.dat')
    before = os.path.join(WORK, 'before.wasm')
    seen = collections.defaultdict(int)
    n = 0
    while True:
        n += 1
        r = random.Random(top.getrandbits(64))
        with open(seed_f, 'wb') as f:
            f.write(bytes(r.getrandbits(8) for _ in range(r.randint(1500, 15000))))
        ga = ['--denan'] if r.random() < 0.6 else []
        if r.random() < 0.5:
            ga.append('--no-fuzz-oob')
        try:
            p = subprocess.run([BIN, '-ttf', seed_f, '-o', before] + FEATS + ga,
                               capture_output=True, text=True, timeout=60)
        except subprocess.TimeoutExpired:
            continue
        if p.returncode != 0:
            continue
        for _ in range(12):
            a, b = r.choice(passes), r.choice(passes)
            key = a + '+' + b
            try:
                q = subprocess.run(
                    [BIN, before, '--fuzz-exec', '--' + a, '--' + b,
                     '-o', os.devnull] + FEATS,
                    capture_output=True, text=True, timeout=60)
            except subprocess.TimeoutExpired:
                continue
            err = q.stdout + q.stderr
            if q.returncode == 0:
                continue
            if 'optimization passes changed results' in err:
                kind = 'MISCOMPILE'
            elif 'validat' in err.lower():
                kind = 'INVALID'
            elif 'Assertion' in err or 'Segmentation' in err:
                kind = 'CRASH'
            else:
                continue
            if seen[key] >= 2:
                continue
            seen[key] += 1
            d = os.path.join(WORK, 'bad', kind, key)
            os.makedirs(d, exist_ok=True)
            subprocess.run(['cp', before, os.path.join(d, 'before.wasm')])
            open(os.path.join(d, 'err.txt'), 'w').write(err[-8000:])
            print('%-11s %s' % (kind, key), flush=True)
        if n % 50 == 0:
            print('module %d, distinct bad pairs %d' % (n, len(seen)), flush=True)
            json.dump(dict(seen), open(os.path.join(WORK, 'summary.json'), 'w'), indent=1)


main()
