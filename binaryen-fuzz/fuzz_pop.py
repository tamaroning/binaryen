#!/usr/bin/env python3
"""Vary the shape of the expression that consumes a catch body's dangling pop.

The fuzzer (TranslateToFuzzReader::makeTry) always emits
    (catch $t (local.set $x (pop T)) ...)
so passes only ever see a pop as the direct child of a local.set.  Here the
generated module is emitted as text, every such pop is rewritten into some
other legal consumer (tee, drop, select, unary/binary op, call, call_ref,
ref.cast, ref.as_non_null, if-condition, rethrow), and each semantics-preserving
pass is then checked with --fuzz-exec plus a validity check.
"""
import os, random, re, subprocess, sys, json, collections

BIN = '/home/tamaron/work/binaryen/bin/wasm-opt'
WORK = sys.argv[1]
SEED0 = int(sys.argv[2]) if len(sys.argv) > 2 else 1
os.makedirs(WORK, exist_ok=True)

FEATS = ['--all-features', '--disable-fp16', '--disable-shared-everything',
         '--disable-stack-switching']

SEM = json.load(open(os.path.join(os.path.dirname(__file__), 'coverage.json')))['sem']
KNOWN_BAD = {'dealign', 'avoid-reinterprets', 'untee', 'outlining'}
# not runnable standalone on arbitrary modules: option-style flags, passes that
# need flat IR, and lowerings that do not support every feature we enable
NOT_STANDALONE = {'no-inline', 'no-full-inline', 'no-partial-inline', 'flatten',
                  'rereloop', 'dfo', 'asyncify', 'alignment-lowering'}
CLOSED = {'abstract-type-refining', 'cfp', 'cfp-reftest', 'gto', 'reorder-types',
          'signature-pruning', 'type-merging', 'type-refining', 'type-refining-gufa'}
PASSES = ['--' + p for p in SEM if p not in KNOWN_BAD and p not in NOT_STANDALONE]

NUMERIC = {'i32', 'i64', 'f32', 'f64', 'v128'}


def split_types(s):
    """Split a wat type list 'i32 (ref null $x) externref' at top level."""
    if s.startswith('(tuple '):
        s = s[len('(tuple '):-1]
    out, depth, cur = [], 0, ''
    for ch in s:
        if ch == '(':
            depth += 1
        if ch == ')':
            depth -= 1
        if ch == ' ' and depth == 0:
            if cur:
                out.append(cur)
            cur = ''
        else:
            cur += ch
    if cur:
        out.append(cur)
    return out


def is_ref(t):
    return t.startswith('(ref') or t.endswith('ref')


def is_nullable_ref(t):
    return t.startswith('(ref null') or (t.endswith('ref') and not t.startswith('('))


TYPEDEF = re.compile(r'^\s*\(type (\$\S+) (?:\(sub (?:final )?(?:\$\S+ )?)?\((struct|array)\b(.*)$', re.M)


def sexp_at(s, i):
    """Return the balanced parenthesised substring of s starting at index i."""
    depth = 0
    for j in range(i, len(s)):
        if s[j] == '(':
            depth += 1
        elif s[j] == ')':
            depth -= 1
            if depth == 0:
                return s[i:j + 1]
    return None


def first_field(rest):
    """'(field (mut i32)) (field i64)))' -> ('i32', True) or None."""
    i = rest.find('(field ')
    if i < 0:
        return None
    node = sexp_at(rest, i)
    if not node:
        return None
    toks = split_types(node[len('(field '):-1])
    toks = [t for t in toks if not t.startswith('$')]
    if not toks:
        return None
    t = toks[0]
    mut = t.startswith('(mut ')
    if mut:
        t = t[len('(mut '):-1]
    return t, mut


def module_info(wat):
    mem = re.search(r'^ \(memory (\$\S+ )?(i64 )?', wat, re.M)
    info = {'struct': {}, 'array': {}, 'memory': bool(mem) and not mem.group(2), 'globals': {}}
    for m in TYPEDEF.finditer(wat):
        name, kind, rest = m.group(1), m.group(2), m.group(3)
        if kind == 'struct':
            f = first_field(rest)
            if f:
                info['struct'][name] = f
        else:
            info['array'][name] = True
    for m in re.finditer(r'^ \(global (\$\S+) \(mut ([^\n]*?)\) \(', wat, re.M):
        info['globals'].setdefault(m.group(2), m.group(1))
    return info


class Mutator:
    def __init__(self, rnd, info):
        self.rnd = rnd
        self.info = info
        self.sinks = {}   # type text -> (typename, funcname)
        self.count = 0
        self.shapes = collections.Counter()

    def sink(self, t):
        if t not in self.sinks:
            k = len(self.sinks)
            self.sinks[t] = ('$__sinkT_%d' % k, '$__popsink_%d' % k)
        return self.sinks[t]

    def rewrite(self, tag, local, types):
        ts = split_types(types)
        pop = '(pop %s)' % types
        r = self.rnd
        choices = []
        if len(ts) == 1:
            t = ts[0]
            choices += [
                ('tee', lambda: '(local.set %s (local.tee %s %s))' % (local, local, pop)),
                ('drop', lambda: '(drop %s)' % pop),
                ('call', lambda: '(local.set %s (call %s %s))' % (local, self.sink(t)[1], pop)),
                ('call_ref', lambda: '(local.set %s (call_ref %s %s (ref.func %s)))'
                    % (local, self.sink(t)[0], pop, self.sink(t)[1])),
                ('throw', lambda: '(throw %s %s)' % (tag, pop)),
            ]
            if t in NUMERIC:
                choices.append(('select', lambda: '(local.set %s (select %s (local.get %s) (i32.const %d)))'
                                % (local, pop, local, r.choice([0, 1, 7]))))
            elif is_nullable_ref(t) and t not in ('exnref', 'funcref', 'nullref', 'nullfuncref', 'nullexternref'):
                bottom = 'noextern' if t == 'externref' else 'none'
                choices.append(('select', lambda: '(local.set %s (select (result %s) %s (ref.null %s) (i32.const %d)))'
                                % (local, t, pop, bottom, r.choice([0, 1, 7]))))
            if t == 'i32':
                choices += [
                    ('binop', lambda: '(local.set %s (i32.%s %s (i32.const %d)))' % (local, r.choice(['add', 'mul', 'xor', 'shl', 'and']), pop, r.randint(-5, 40))),
                    ('ifcond', lambda: '(local.set %s (if (result i32) %s (then (i32.const 1)) (else (local.get %s))))' % (local, pop, local)),
                    ('eqz', lambda: '(local.set %s (i32.eqz %s))' % (local, pop)),
                ]
            if t == 'i64':
                choices += [
                    ('binop', lambda: '(local.set %s (i64.%s %s (i64.const %d)))' % (local, r.choice(['add', 'mul', 'xor', 'sub']), pop, r.randint(-5, 40))),
                    ('ifcond', lambda: '(local.set %s (if (result i64) (i64.eqz %s) (then (i64.const 1)) (else (local.get %s))))' % (local, pop, local)),
                ]
            if t in ('f32', 'f64'):
                choices += [
                    ('unop', lambda: '(local.set %s (%s.%s %s))' % (local, t, r.choice(['neg', 'abs', 'sqrt', 'nearest']), pop)),
                    ('binop', lambda: '(local.set %s (%s.%s %s (%s.const %d)))' % (local, t, r.choice(['add', 'mul', 'min']), pop, t, r.randint(-5, 40))),
                ]
            if t == 'v128':
                choices.append(('unop', lambda: '(local.set %s (i32x4.neg %s))' % (local, pop)))
            if is_ref(t):
                choices.append(('isnull_if', lambda: '(if (ref.is_null %s) (then (nop)) (else (unreachable)))' % pop))
            if is_nullable_ref(t):
                choices.append(('as_non_null', lambda: '(local.set %s (ref.as_non_null %s))' % (local, pop)))
            if t.startswith('(ref null $') or t.startswith('(ref $'):
                hname = t.split()[-1].rstrip(')')
                if hname in self.info['struct']:
                    ft, fmut = self.info['struct'][hname]
                    op = 'struct.get_u' if ft in ('i8', 'i16') else 'struct.get'
                    choices.append(('struct_get', lambda: '(drop (%s %s 0 %s))' % (op, hname, pop)))
                    if fmut and ft in NUMERIC:
                        choices.append(('struct_set', lambda: '(struct.set %s 0 %s (%s.const 1))' % (hname, pop, ft)))
                if hname in self.info['array']:
                    choices.append(('array_len', lambda: '(drop (array.len %s))' % pop))
                choices.append(('ref_test', lambda: '(drop (ref.test %s %s))' % (t.replace('(ref null ', '(ref '), pop)))
            hn = t.split()[-1].rstrip(')') if t.startswith('(ref') else None
            if t in ('eqref', 'structref', 'i31ref', 'arrayref') or hn in self.info['struct'] or hn in self.info['array']:
                choices.append(('ref_eq', lambda: '(drop (ref.eq %s (ref.null none)))' % pop))
            if t == 'i31ref':
                choices.append(('i31_get', lambda: '(drop (i31.get_s %s))' % pop))
            if t == 'i32' and self.info['memory']:
                choices.append(('load', lambda: '(local.set %s (i32.load8_u %s))' % (local, pop)))
                choices.append(('store', lambda: '(i32.store8 %s (i32.const 42))' % pop))
            if t in self.info['globals']:
                choices.append(('global_set', lambda: '(global.set %s %s)' % (self.info['globals'][t], pop)))
            if t.startswith('(ref null $'):
                choices.append(('cast', lambda: '(local.set %s (ref.cast %s %s))' % (local, t, pop)))
                choices.append(('cast_nn', lambda: '(local.set %s (ref.cast %s %s))' % (local, t.replace('(ref null ', '(ref '), pop)))
            if t in ('externref',):
                choices.append(('any_convert', lambda: '(drop (any.convert_extern %s))' % pop))
            if t in ('anyref', 'eqref', 'structref', 'i31ref', 'arrayref'):
                choices.append(('extern_convert', lambda: '(drop (extern.convert_any %s))' % pop))
        else:
            choices += [
                ('drop', lambda: '(drop %s)' % pop),
                ('throw', lambda: '(throw %s %s)' % (tag, pop)),
            ]
        # keep the original shape sometimes so passes see mixtures
        choices.append(('orig', lambda: '(local.set %s %s)' % (local, pop)))
        name, f = r.choice(choices)
        self.shapes[name] += 1
        self.count += 1
        return f()

    def additions(self):
        s = ''
        for t, (tn, fn) in self.sinks.items():
            s += ' (type %s (func (param %s) (result %s)))\n' % (tn, t, t)
            s += ' (func %s (type %s) (local.get 0))\n' % (fn, tn)
        return s


PAT = re.compile(r'\(catch (\$\S+)\n(\s*)\(local\.set (\$\S+)\n\s*\(pop ([^\n]*)\)\n\s*\)')


def mutate(wat, rnd):
    m = Mutator(rnd, module_info(wat))

    def sub(mo):
        tag, indent, local, types = mo.group(1), mo.group(2), mo.group(3), mo.group(4)
        return '(catch %s\n%s%s' % (tag, indent, m.rewrite(tag, local, types))
    out = PAT.sub(sub, wat)
    if m.count == 0:
        return None, m
    out = out.rstrip()
    assert out.endswith(')')
    out = out[:-1] + m.additions() + ')\n'
    return out, m


# ---------------------------------------------------------------------------
# EH structure mutations: the fuzzer never emits `delegate` or `rethrow`
# (TranslateToFuzzReader::makeTry has "TODO: delegate stuff"), so passes never
# see them.  Give every legacy `try` a label, wrap its `do` body in an inner
# try that delegates to it (semantically a no-op), and insert a conditional
# rethrow into catch bodies.

def children(node):
    """Depth-1 children of an s-expression string as (start, end) spans,
    excluding the head symbol.  Atoms are included."""
    spans, depth, i, n = [], 0, 0, len(node)
    assert node[0] == '('
    # skip head symbol
    j = 1
    while j < n and node[j] not in ' \n\t(':
        j += 1
    i = j
    while i < n - 1:
        c = node[i]
        if c in ' \n\t':
            i += 1
            continue
        if c == '(':
            e = i
            d = 0
            while True:
                if node[e] == '(':
                    d += 1
                elif node[e] == ')':
                    d -= 1
                    if d == 0:
                        break
                e += 1
            spans.append((i, e + 1))
            i = e + 1
        else:
            e = i
            while e < n and node[e] not in ' \n\t()':
                e += 1
            spans.append((i, e))
            i = e
    return spans


class EHMutator:
    def __init__(self, rnd):
        self.rnd = rnd
        self.k = 0
        self.shapes = collections.Counter()
        self.rt_kind = rnd.choice(['never', 'always'])

    def mutate_try(self, node):
        ch = children(node)
        parts = [node[a:b] for a, b in ch]
        label = None
        idx = 0
        if parts and parts[0].startswith('$'):
            label = parts[0]
            idx = 1
        if any(p.startswith('(delegate') for p in parts):
            return node
        if any(p.startswith('(type ') for p in parts):
            return node
        typ = ''
        if idx < len(parts) and parts[idx].startswith('(result'):
            typ = parts[idx]
            idx += 1
        if idx >= len(parts) or not parts[idx].startswith('(do'):
            return node
        if label is None:
            label = '$__t_%d' % self.k
            self.k += 1
        do = parts[idx]
        rest = parts[idx + 1:]
        r = self.rnd
        # A: wrap the do body in a try that delegates to us
        if r.random() < 0.6:
            inner_body = do[len('(do'):-1]
            do = '(do (try %s (do %s) (delegate %s)))' % (typ, inner_body, label)
            self.shapes['delegate'] += 1
        # B: conditional rethrow inside catch bodies
        new_rest = []
        for p in rest:
            if (p.startswith('(catch ') or p.startswith('(catch_all')) and r.random() < 0.6:
                cch = children(p)
                cparts = [p[a:b] for a, b in cch]
                stmt = '(if (global.get $__rt) (then (rethrow %s)))' % label
                if p.startswith('(catch '):
                    # cparts[0] is the tag; the pop (if any) is in cparts[1]
                    if len(cparts) >= 2:
                        cparts.insert(2, stmt)
                    else:
                        cparts.append(stmt)
                    p = '(catch ' + '\n'.join(cparts) + ')'
                else:
                    cparts.insert(0, stmt)
                    p = '(catch_all ' + '\n'.join(cparts) + ')'
                self.shapes['rethrow'] += 1
            new_rest.append(p)
        return '(try %s %s %s %s)' % (label, typ, do, ' '.join(new_rest))

    def additions(self):
        if self.rt_kind == 'never':
            return ' (global $__rt (mut i32) (i32.const 0))\n'
        return ' (global $__rt i32 (i32.const 1))\n'


TRY_RE = re.compile(r'\(try(?=[\s(])')


def mutate_eh(text, rnd):
    m = EHMutator(rnd)
    starts = [mo.start() for mo in TRY_RE.finditer(text)]
    # innermost/last first so earlier offsets stay valid
    for st in reversed(starts):
        node = sexp_at(text, st)
        if node is None:
            continue
        new = m.mutate_try(node)
        text = text[:st] + new + text[st + len(node):]
    if not m.shapes:
        return text, m
    text = text.rstrip()
    assert text.endswith(')')
    text = text[:-1] + m.additions() + ')\n'
    return text, m


# ---------------------------------------------------------------------------
# Statement injection: instructions the fuzzer never builds (checked against
# wasm-delegations.def): memory.size/grow, table.size/grow/fill/copy/init,
# elem.drop, array.new_data/new_elem/init_data/init_elem, SIMD lane loads and
# stores, plus a second table.  Each replaces a `(nop)` in statement position.

MEM_RE = re.compile(r'^ \(memory (\$\S+)( i64)? ', re.M)
TABLE_RE = re.compile(r'^ \(table (\$\S+)( i64)? \d+(?: \d+)? (\S+)\)$', re.M)


class StmtMutator:
    def __init__(self, rnd, wat):
        self.rnd = rnd
        self.shapes = collections.Counter()
        self.mems = MEM_RE.findall(wat)
        self.tables = [(n, t) for n, i64, t in TABLE_RE.findall(wat) if not i64 and t == 'funcref']
        self.used = set()

    def menu(self):
        r = self.rnd
        m = []
        if len(self.mems) == 1:
            name, i64 = self.mems[0]
            it = 'i64' if i64 else 'i32'
            I = lambda k: '(%s.const %d)' % (it, k)
            m += [
                ('memory_size', lambda: '(drop (memory.size))'),
                ('memory_grow', lambda: '(drop (memory.grow %s))' % I(r.choice([0, 1]))),
                ('memory_init', lambda: '(memory.init $__pd %s (i32.const %d) (i32.const %d))' % (I(r.randrange(8)), r.randrange(3), r.randrange(4))),
                ('data_drop', lambda: '(data.drop $__pd)'),
            ]
            if not i64:
                m += [
                    ('simd_store_lane', lambda: '(v128.store%d_lane %d (i32.const %d) (v128.const i32x4 1 2 3 4))' % ((lambda b: (b, r.randrange(128 // b)))(r.choice([8, 16, 32, 64])) + (r.randrange(64),))),
                    ('simd_load_lane', lambda: '(drop (v128.load%d_lane %d (i32.const %d) (v128.const i32x4 5 6 7 8)))' % ((lambda b: (b, r.randrange(128 // b)))(r.choice([8, 16, 32, 64])) + (r.randrange(64),))),
                ]
        tabs = self.tables + [('$__t2', 'funcref')]
        t = r.choice(tabs)[0]
        t2 = r.choice(tabs)[0]
        m += [
            ('table_size', lambda: '(drop (table.size %s))' % t),
            ('table_grow', lambda: '(drop (table.grow %s (ref.null func) (i32.const %d)))' % (t, r.choice([0, 1]))),
            ('table_fill', lambda: '(table.fill %s (i32.const %d) (ref.func $__dummy) (i32.const %d))' % (t, r.randrange(3), r.randrange(2))),
            ('table_copy', lambda: '(table.copy %s %s (i32.const %d) (i32.const %d) (i32.const %d))' % (t, t2, r.randrange(2), r.randrange(2), r.randrange(2))),
            ('table_init', lambda: '(table.init %s $__pe (i32.const %d) (i32.const 0) (i32.const %d))' % (t, r.randrange(3), r.randrange(2))),
            ('elem_drop', lambda: '(elem.drop $__pe)'),
            ('table_get2', lambda: '(drop (table.get $__t2 (i32.const %d)))' % r.randrange(3)),
            ('table_set2', lambda: '(table.set $__t2 (i32.const %d) (ref.func $__dummy))' % r.randrange(3)),
            ('call_indirect2', lambda: '(call_indirect $__t2 (type $__dummyT) (i32.const %d))' % r.randrange(3)),
            ('array_new_data', lambda: '(drop (array.new_data $__ai8 $__pd (i32.const %d) (i32.const %d)))' % (r.randrange(3), r.randrange(4))),
            ('array_new_elem', lambda: '(drop (array.new_elem $__afr $__pe (i32.const 0) (i32.const %d)))' % r.randrange(2)),
            ('array_init_data', lambda: '(array.init_data $__ai8 $__pd (array.new_default $__ai8 (i32.const 4)) (i32.const %d) (i32.const %d) (i32.const %d))' % (r.randrange(2), r.randrange(2), r.randrange(3))),
            ('array_init_elem', lambda: '(array.init_elem $__afr $__pe (array.new_default $__afr (i32.const 2)) (i32.const %d) (i32.const 0) (i32.const %d))' % (r.randrange(2), r.randrange(2))),
        ]
        return m

    def stmt(self):
        name, f = self.rnd.choice(self.menu())
        self.shapes[name] += 1
        return f()

    def additions(self):
        return (' (type $__ai8 (array (mut i8)))\n'
                ' (type $__afr (array (mut funcref)))\n'
                ' (type $__dummyT (func))\n'
                ' (table $__t2 2 5 funcref)\n'
                ' (elem $__pe func $__dummy)\n'
                ' (data $__pd "\\00\\01\\02\\03\\04\\05\\06\\07")\n'
                ' (func $__dummy (type $__dummyT))\n')


def mutate_stmt(text, rnd):
    m = StmtMutator(rnd, text)
    count = [0]

    def sub(mo):
        if count[0] >= 40 or rnd.random() < 0.4:
            return mo.group(0)
        count[0] += 1
        return m.stmt()
    out = re.sub(r'\(nop\)', sub, text)
    if not m.shapes:
        return text, m
    out = out.rstrip()
    assert out.endswith(')')
    out = out[:-1] + m.additions() + ')\n'
    return out, m


MULNEG1 = re.compile(r'\((i32|i64|f32|f64)\.mul \(pop (i32|i64|f32|f64)\) \((i32|i64|f32|f64)\.const -1\)')


def known_bug(out, chain, mutated):
    """Findings already written up; keep them out of the way."""
    if 'Pop has not been found' in out and MULNEG1.search(mutated):
        return 'oi-mul-neg1'
    if "pop's location is not valid" in out and any(c.strip('-') in ('cfp', 'cfp-reftest', 'gsi', 'gsi-desc-cast', 'type-refining', 'type-refining-gufa') for c in chain):
        return 'cfp-gsi-pop'
    return None


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
    shapes = collections.Counter()
    bad = collections.Counter()
    i = 0
    while True:
        i += 1
        seed = rnd.randrange(1 << 30)
        r = random.Random(seed)
        nbytes = r.randint(400, 20000)
        data = bytes(r.getrandbits(8) for _ in range(nbytes))
        inp = os.path.join(WORK, 'in.bin')
        with open(inp, 'wb') as f:
            f.write(data)
        wat = os.path.join(WORK, 'gen.wat')
        wasm = os.path.join(WORK, 'gen.wasm')
        gen = [BIN, '-ttf', inp] + FEATS + ['-o', wasm]
        # closed-world must be decided at generation time: the generator then
        # drops the call-ref imports that would let the host call funcrefs
        closed = r.random() < 0.5
        if closed:
            gen.append('--closed-world')
            if r.random() < 0.5:
                gen.append('--enclose-world')
        # stripping @binaryen.js.called annotations changes what closed-world may assume
        passes = ([p for p in PASSES if p != '--strip-toolchain-annotations'] if closed
                  else [p for p in PASSES if p.strip('-') not in CLOSED])
        if r.random() < 0.7:
            gen.append('--denan')
        if r.random() < 0.5:
            gen.append('--no-fuzz-oob')
        rc, out = run(gen)
        if rc != 0:
            stats['genfail'] += 1
            continue
        # via the binary, so binaryen-only IR (tuple globals) is lowered away
        rc, out = run([BIN, wasm] + FEATS + ['-S', '-o', wat])
        if rc != 0:
            stats['disfail'] += 1
            continue
        text = open(wat).read()
        mutated, m = mutate(text, r)
        if mutated is None:
            stats['nopop'] += 1
            mutated = text
        if r.random() < 0.6:
            mutated, em = mutate_eh(mutated, r)
            m.shapes.update(em.shapes)
        if r.random() < 0.6:
            mutated, sm = mutate_stmt(mutated, r)
            m.shapes.update(sm.shapes)
        if mutated == text:
            stats['unmutated'] += 1
            continue
        mut = os.path.join(WORK, 'mut.wat')
        with open(mut, 'w') as f:
            f.write(mutated)
        # the mutated module must itself be valid, otherwise the mutation is wrong
        rc, out = run([BIN, mut] + FEATS + ['-o', os.devnull])
        if rc != 0:
            stats['mutinvalid'] += 1
            d = os.path.join(WORK, 'mutinvalid')
            os.makedirs(d, exist_ok=True)
            if stats['mutinvalid'] <= 5:
                open(os.path.join(d, 'm%d.wat' % stats['mutinvalid']), 'w').write(mutated)
                open(os.path.join(d, 'm%d.err' % stats['mutinvalid']), 'w').write(out)
            continue
        shapes.update(m.shapes)
        stats['ok'] += 1
        # try several pass chains on this module
        for _ in range(r.randint(3, 8)):
            n = r.choice([1, 1, 1, 2, 2, 3])
            chain = [r.choice(passes) for _ in range(n)]
            if r.random() < 0.3:
                chain.insert(r.randrange(len(chain) + 1), '--roundtrip')
            cmd = [BIN, mut] + FEATS + ['--fuzz-exec'] + chain + ['-o', os.devnull]
            if closed:
                cmd.append('--closed-world')
            rc, out = run(cmd)
            kind = None
            if 'changed results' in out:
                kind = 'MISCOMPILE'
            elif rc == -999:
                kind = None  # interpreter timeouts happen; ignore
            elif rc != 0:
                if 'validat' in out:
                    kind = 'INVALID'
                elif 'Assertion' in out or 'UNREACHABLE' in out or rc < 0 or 'Segmentation' in out:
                    kind = 'CRASH'
                else:
                    kind = 'FATAL'  # usually a driver/configuration problem; review
            if kind and known_bug(out, chain, mutated):
                stats['known:' + known_bug(out, chain, mutated)] += 1
                kind = None
            if kind:
                key = kind + ':' + '+'.join(chain)
                bad[key] += 1
                d = os.path.join(WORK, 'bad', kind, '+'.join(c.strip('-') for c in chain))
                if bad[key] <= 3:
                    os.makedirs(d, exist_ok=True)
                    tag = '%d' % seed
                    open(os.path.join(d, tag + '.wat'), 'w').write(mutated)
                    open(os.path.join(d, tag + '.cmd'), 'w').write(' '.join(cmd) + '\n' + ' '.join(gen) + '\n')
                    open(os.path.join(d, tag + '.out'), 'w').write(out[-20000:])
        if i % 20 == 0:
            print('iter %d %s shapes=%s bad=%d %s' % (i, dict(stats), dict(shapes), len(bad), sorted(bad)[:20]), flush=True)
            json.dump({'stats': stats, 'shapes': shapes, 'bad': bad}, open(os.path.join(WORK, 'summary.json'), 'w'), indent=1)


if __name__ == '__main__':
    main()
