#!/usr/bin/env python3
"""Port of fuzz_opt.py's CtorEval handler (needs no d8).

wasm-ctor-eval evaluates the exported functions at compile time and bakes the
resulting state into the module.  Compare --fuzz-exec-before output of the
module before and after evalling, with fix_output() normalization.
"""
import os, random, re, subprocess, sys, json, collections

ROOT = '/home/tamaron/work/binaryen/bin/'
OPT, DIS, CTOR, METADCE = (ROOT + t for t in ('wasm-opt', 'wasm-dis', 'wasm-ctor-eval', 'wasm-metadce'))
WORK = sys.argv[1]
SEED0 = int(sys.argv[2]) if len(sys.argv) > 2 else 1
os.makedirs(WORK, exist_ok=True)

ALL_DISABLE = ['fp16', 'shared-everything', 'stack-switching']
OPTIONAL = ['threads', 'simd', 'multivalue', 'gc', 'exception-handling', 'memory64',
            'strings', 'relaxed-simd', 'multimemory', 'custom-descriptors',
            'wide-arithmetic', 'custom-page-sizes', 'compact-imports', 'multibyte',
            'relaxed-atomics']

TRAP_PREFIX = 'warning: '  # fuzz-exec prints '[trap ...]' actually; see below
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


def fix_output(out):
    out = re.sub(r'f64\.const (-?[nanN:abcdefxIity\d+-.]+)', fix_double, out)
    out = out.replace('[trap ', EXCEPTION_PREFIX + '[trap ')
    out = re.sub(r'funcref\([\d\w$+-_:]+\)', 'funcref()', out)
    out = re.sub(r'i31ref\((-?\d+)\)', r'\1', out)
    out = re.sub(r' tag\$\d+', ' tag', out)
    if INSTANTIATE_ERROR in out:
        after = out.find(INSTANTIATE_ERROR)
        after = out.find('\n', after)
        out = out[:after + 1]
    lines = []
    for line in out.splitlines():
        if EXCEPTION_PREFIX in line:
            line = '     *exception*'
        lines.append(line)
    return '\n'.join(lines)


def run(cmd, timeout=60):
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout,
                           env=dict(os.environ, BINARYEN_MAX_INTERPRETER_DEPTH='1000'))
        return p.returncode, p.stdout + p.stderr
    except subprocess.TimeoutExpired:
        return -999, 'TIMEOUT'


def main():
    rnd = random.Random(SEED0)
    stats = collections.Counter()
    nbad = 0
    i = 0
    while True:
        i += 1
        if i % 100 == 0:
            print('iter %d %s bad=%d' % (i, dict(stats), nbad), flush=True)
            json.dump(stats, open(os.path.join(WORK, 'summary.json'), 'w'), indent=1)
        seed = rnd.randrange(1 << 30)
        r = random.Random(seed)
        nbytes = r.randint(400, 20000)
        data = bytes(r.getrandbits(8) for _ in range(nbytes))
        inp = os.path.join(WORK, 'in.bin')
        open(inp, 'wb').write(data)
        feats = ['--all-features'] + ['--disable-' + f for f in ALL_DISABLE]
        if r.random() < 0.5:
            feats += ['--disable-' + f for f in OPTIONAL if r.random() < 0.2]
        wasm = os.path.join(WORK, 'a.wasm')
        gen = [OPT, '-ttf', inp] + feats + ['-o', wasm]
        if r.random() < 0.7:
            gen.append('--denan')
        if r.random() < 0.5:
            gen.append('--no-fuzz-oob')
        rc, out = run(gen)
        if rc != 0:
            stats['genfail'] += 1
            continue
        rc, wat = run([DIS, wasm] + feats)
        if rc != 0:
            stats['disfail'] += 1
            continue
        if '(import "fuzzing-support" "call-export' in wat or \
           ('(import "fuzzing-support" "table-' in wat and '(export "table" (table ' in wat):
            stats['notices_exports'] += 1
            continue
        exports = re.findall(r'^ [(]export "(.*[^\\]?)" [(]func', wat, re.M)
        exports = [e for e in exports if re.fullmatch(r'^[0-9a-zA-Z_]+$', e)]
        if not exports:
            stats['noexports'] += 1
            continue
        keep = exports[:]
        if re.search(r'^ [(]export "table" [(]table', wat, re.M):
            keep.append('table')
        graph = [{'name': 'outside', 'reaches': ['export-' + e for e in keep], 'root': True}]
        graph += [{'name': 'export-' + e, 'export': e} for e in keep]
        gpath = os.path.join(WORK, 'graph.json')
        json.dump(graph, open(gpath, 'w'))
        filtered = os.path.join(WORK, 'filtered.wasm')
        rc, out = run([METADCE, wasm, '-o', filtered, '--graph-file', gpath] + feats)
        if rc != 0:
            stats['metadcefail'] += 1
            continue
        rc, before = run([OPT, filtered] + feats + ['--fuzz-exec-before', '-o', os.devnull])
        if rc == -999:
            stats['timeout'] += 1
            continue
        evalled = os.path.join(WORK, 'evalled.wasm')
        ctors = ','.join(exports)
        ccmd = [CTOR, filtered, '-o', evalled, '--ctors=' + ctors, '--kept-exports=' + ctors,
                '--ignore-external-input'] + feats
        rc, cout = run(ccmd, timeout=120)
        if rc != 0:
            stats['ctorfail'] += 1
            if 'Assertion' in cout or 'Segmentation' in cout or rc < 0:
                nbad += 1
                d = os.path.join(WORK, 'bad', 'CRASH_%d' % nbad)
                os.makedirs(d)
                os.rename(filtered, os.path.join(d, 'filtered.wasm'))
                open(os.path.join(d, 'cmd.txt'), 'w').write(' '.join(gen) + '\n' + ' '.join(ccmd) + '\n')
                open(os.path.join(d, 'out.txt'), 'w').write(cout[-20000:])
            continue
        if '...stopping since could not flatten memory' in cout or \
           '...stopping since could not create module instance' in cout:
            stats['ctor_noeval'] += 1
            continue
        if '...success' not in cout and '...partial evalling success' not in cout:
            stats['ctor_nothing'] += 1
            continue
        stats['evalled'] += 1
        rc, after = run([OPT, evalled] + feats + ['--fuzz-exec-before', '-o', os.devnull])
        if rc == -999:
            stats['timeout'] += 1
            continue
        b, a = fix_output(before), fix_output(after)
        if '[host limit ' in before or '[host limit ' in after:
            # host limits (allocation, stack) are arbitrary; fuzz_opt.py ignores them too
            stats['hostlimit'] += 1
            continue
        if b != a:
            nbad += 1
            stats['MISCOMPILE'] += 1
            d = os.path.join(WORK, 'bad', 'MISCOMPILE_%d' % nbad)
            os.makedirs(d)
            os.rename(filtered, os.path.join(d, 'filtered.wasm'))
            os.rename(evalled, os.path.join(d, 'evalled.wasm'))
            open(os.path.join(d, 'cmd.txt'), 'w').write(' '.join(gen) + '\n' + ' '.join(ccmd) + '\n')
            open(os.path.join(d, 'before.out'), 'w').write(before)
            open(os.path.join(d, 'after.out'), 'w').write(after)
            open(os.path.join(d, 'ctor.out'), 'w').write(cout[-20000:])
        if i % 20 == 0:
            print('iter %d %s bad=%d' % (i, dict(stats), nbad), flush=True)
            json.dump(stats, open(os.path.join(WORK, 'summary.json'), 'w'), indent=1)


if __name__ == '__main__':
    main()
