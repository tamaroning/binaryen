#!/usr/bin/env python3
"""Sweep: does each individual pass emit a module that binaryen itself rejects?

For every pass, generate random modules and run the pass alone.  A nonzero exit
with validator output means the pass produced invalid wasm.
"""
import os, random, re, subprocess, sys, json, collections

BIN = '/home/tamaron/work/binaryen/bin/wasm-opt'
WORK = sys.argv[1]
ROUNDS = int(sys.argv[2]) if len(sys.argv) > 2 else 40
os.makedirs(WORK, exist_ok=True)

# Passes excluded because emitting a module that no longer validates on its own
# is their documented job, or they need arguments / external files.
SKIP = {
    'extract-function', 'extract-function-index', 'remove-imports',
    'remove-exports', 'remove-memory', 'remove-memory-init', 'set-globals',
    'poppify', 'experimental-poppy', 'generate-stack-ir', 'optimize-stack-ir',
    'print-stack-ir', 'no-stack-ir', 'emit-target-features',
    'separate-data-segments', 'input-source-map', 'output-source-map',
    'output-source-map-url', 'symbolmap', 'print-function-map',
    'emit-spec-wrapper', 'emit-module-names', 'emit-text', 'dwarfdump',
    'string-lowering-magic-imports-assert',
    'translate-to-exnref', 'emit-exnref', 'experimental-new-eh',
    'spill-pointers', 'generate-dyncalls', 'generate-i64-dyncalls',
    'legalize-js-interface', 'legalize-and-prune-js-interface',
    'minify-imports', 'minify-imports-and-exports',
    'minify-imports-and-exports-and-modules', 'j2cl-opts', 'j2cl-cleanup',
    'merge-j2cl-itables', 'optimize-j2cl', 'post-emscripten',
    'asyncify',  # needs its own imports
}

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

FEATS = ['--all-features', '--disable-fp16', '--disable-shared-everything',
         '--disable-stack-switching']

def main():
    passes = load_passes()
    print('sweeping %d passes x %d rounds' % (len(passes), ROUNDS), flush=True)
    bad = collections.defaultdict(list)
    seed_f = os.path.join(WORK, 'seed.dat')
    before = os.path.join(WORK, 'before.wasm')
    top = random.Random(4242)
    for rnd in range(ROUNDS):
        r = random.Random(top.getrandbits(64))
        with open(seed_f, 'wb') as f:
            f.write(bytes(r.getrandbits(8) for _ in range(r.randint(2000, 20000))))
        ga = ['--denan'] if r.random() < 0.5 else []
        try:
            p = subprocess.run([BIN, '-ttf', seed_f, '-o', before] + FEATS + ga,
                               capture_output=True, text=True, timeout=60)
        except subprocess.TimeoutExpired:
            continue
        if p.returncode != 0:
            continue
        for name in passes:
            try:
                q = subprocess.run([BIN, before, '--' + name, '-o', os.devnull] + FEATS,
                                   capture_output=True, text=True, timeout=60)
            except subprocess.TimeoutExpired:
                continue
            err = q.stdout + q.stderr
            if q.returncode != 0 and ('validat' in err.lower() or 'Assertion' in err or 'Segmentation' in err):
                if len(bad[name]) < 3:
                    d = os.path.join(WORK, 'bad', name, str(rnd))
                    os.makedirs(d, exist_ok=True)
                    subprocess.run(['cp', before, os.path.join(d, 'before.wasm')])
                    open(os.path.join(d, 'err.txt'), 'w').write(err[:8000])
                    bad[name].append(rnd)
                    print('BAD %-45s round %d' % (name, rnd), flush=True)
        print('round %d done; bad passes so far: %d' % (rnd, len(bad)), flush=True)
    json.dump({k: v for k, v in bad.items()}, open(os.path.join(WORK, 'summary.json'), 'w'), indent=1)
    print('DONE. bad passes:', sorted(bad))

main()
