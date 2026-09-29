// V8 differential run of one export of two modules with GC entry objects.
//
// usage: node cmp.js BEFORE.wasm AFTER.wasm FNAME SPEC.json
//   SPEC = {"params": [...], "entries": [...]}  (one concrete run)
//   param: {"k":"i32","v":n} {"k":"i64","v":"n"} {"k":"null"} {"k":"i31","v":n} {"k":"obj","i":n}
//   entry: {"T":"S0","f":[...]} (numeric fields in declaration order; arrays: 2 elements)
// usage: node cmp.js BEFORE.wasm AFTER.wasm FNAME --random N PTYPES.json
//   PTYPES = ["i32","i64","S0","i31",...]; N random single calls, prints how many differ.
const fs = require('fs');
const path = require('path');
const helperBytes = fs.readFileSync(path.join(__dirname, 'helper.wasm'));
const H = new WebAssembly.Instance(new WebAssembly.Module(helperBytes), {}).exports;

function inst(file) {
  const m = new WebAssembly.Module(fs.readFileSync(file));
  return new WebAssembly.Instance(m, {}).exports;
}

function mkEntry(e) {
  const f = e.f;
  switch (e.T) {
    case 'S0': return H.new_S0(f[0] | 0, f[1] | 0, f[2] | 0, BigInt.asIntN(64, BigInt(f[3])));
    case 'S1': return H.new_S1(f[0] | 0, f[2] | 0);
    case 'S2': return H.new_S2(f[0] | 0);
    case 'A0': return H.new_A0(f[0] | 0, f[1] | 0);
    case 'A1': return H.new_A1(f[0] | 0, f[1] | 0);
    case 'A2': return H.new_A2(f[0] | 0, f[1] | 0);
    case 'A3': return H.new_A3();
  }
  throw new Error('type ' + e.T);
}

function dump(T, o, ents, depth) {
  if (o === null) return null;
  const id = ents.indexOf(o);
  if (depth > 0 && id >= 0) return {entry: id};
  if (depth > 3) return '...';
  const d = (T2, x) => dump(T2, x, ents, depth + 1);
  switch (T) {
    case 'S0': return [H.S0_0(o), H.S0_1(o), H.S0_2(o), String(H.S0_3(o))];
    case 'S1': return [H.S1_0(o), d('S0', H.S1_1(o)), H.S1_2(o)];
    case 'S2': return [H.S2_0(o)];
    case 'A0': case 'A1': case 'A2': {
      const n = H[T + '_len'](o), r = [];
      for (let i = 0; i < n; i++) r.push(H[T + '_get'](o, i));
      return r;
    }
    case 'A3': {
      const n = H.A3_len(o), r = [];
      for (let i = 0; i < n; i++) r.push(d('S2', H.A3_get(o, i)));
      return r;
    }
  }
}

function runOne(file, fname, spec) {
  const X = inst(file);
  if (spec.mem) { const m = new Uint8Array(X.mem.buffer); for (const a in spec.mem) if (+a < m.length) m[+a] = spec.mem[a]; }
  if (spec.globals) { X.g0.value = spec.globals[0] | 0; X.g1.value = spec.globals[1] | 0; }
  const ents = spec.entries.map(mkEntry);
  const args = spec.params.map(p => {
    switch (p.k) {
      case 'i32': return p.v | 0;
      case 'i64': return BigInt.asIntN(64, BigInt(p.v));
      case 'null': return null;
      case 'i31': return p.v;
      case 'obj': return ents[p.i];
    }
  });
  let res;
  try {
    const r = X[fname](...args);
    res = typeof r === 'bigint' ? String(r) : r;
  } catch (e) {
    res = 'trap';
    if (!(e instanceof WebAssembly.RuntimeError)) res = 'error:' + e.message;
  }
  const mem = new Uint8Array(X.mem.buffer);
  let h = 0;
  for (let i = 0; i < mem.length; i++) if (mem[i]) h = (h * 31 + i * 7 + mem[i]) >>> 0;
  return JSON.stringify({res, g0: X.g0.value, g1: X.g1.value, mem: h,
                         ents: ents.map((o, i) => dump(spec.entries[i].T, o, ents, 0))});
}

const INTS = [0, 1, -1, 2, 3, 0x7f, 0x80, 0xff, 0x100, 0x1ff, 0x7fff, 0x8000, 0xffff, -129, 0x7fffffff, -0x80000000];
function rint() { return Math.random() < 0.6 ? INTS[Math.floor(Math.random() * INTS.length)] : (Math.random() * 2 ** 32) | 0; }
function randomSpec(ptypes) {
  const entries = [], params = [];
  for (const t of ptypes) {
    if (t === 'i32') params.push({k: 'i32', v: rint()});
    else if (t === 'i64') params.push({k: 'i64', v: String(BigInt(rint()) * BigInt(rint() + 3))});
    else if (t === 'i31') params.push(Math.random() < 0.3 ? {k: 'null'} : {k: 'i31', v: rint() & 0x3fffffff});
    else {
      const c = Math.random();
      const same = entries.map((e, i) => [e, i]).filter(([e]) => e.T === t);
      if (c < 0.2) params.push({k: 'null'});
      else if (c < 0.4 && same.length) params.push({k: 'obj', i: same[Math.floor(Math.random() * same.length)][1]});
      else {
        entries.push({T: t, f: [rint(), rint(), rint(), rint()]});
        params.push({k: 'obj', i: entries.length - 1});
      }
    }
  }
  return {params, entries};
}

const [before, after, fname] = process.argv.slice(2, 5);
if (process.argv[5] === '--random') {
  const n = +process.argv[6];
  const ptypes = JSON.parse(fs.readFileSync(process.argv[7]));
  let diff = 0, first = null;
  for (let i = 0; i < n; i++) {
    const spec = randomSpec(ptypes);
    const a = runOne(before, fname, spec), b = runOne(after, fname, spec);
    if (a !== b) { diff++; if (!first) first = {spec, a, b}; }
  }
  console.log(JSON.stringify({trials: n, differ: diff, first}));
} else {
  const spec = JSON.parse(fs.readFileSync(process.argv[5]));
  const a = runOne(before, fname, spec), b = runOne(after, fname, spec);
  console.log('before', a);
  console.log('after ', b);
  console.log(a === b ? 'SAME' : 'DIFFER');
}
