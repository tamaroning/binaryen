// V8 replay for ufuzz counterexamples.
//
//   node cmp.js BEFORE.wasm AFTER.wasm HELPER.wasm PLAN.json
//
// PLAN = {fname, imports: {"mod.field": "i32"|"i64"|null}, types: {T: {kind, fields}},
//         calls: [{params: [...], entries: [...], mem: {addr: byte}, pages: n, globals: {name: v}}]}
//   param: {k:"i32",v} {k:"i64",v:"str"} {k:"null"} {k:"i31",v} {k:"obj",i}
//   entry: {T, f:[...]}   (numeric fields in order; reference fields are null)
// Every call runs on a fresh instance of each module (and fresh entry
// objects); prints one JSON line per call: {same, a, b}.
'use strict';
const fs = require('fs');
const [before, after, helperF, planF] = process.argv.slice(2, 6);
const plan = JSON.parse(fs.readFileSync(planF, 'utf8'));
const H = new WebAssembly.Instance(new WebAssembly.Module(fs.readFileSync(helperF)), {}).exports;

function mkImports(mod) {
  const imp = {};
  for (const d of WebAssembly.Module.imports(mod)) {
    if (d.kind !== 'function') continue;
    const rt = plan.imports[d.module + '.' + d.name];
    let n = 0;
    imp[d.module] = imp[d.module] || {};
    imp[d.module][d.name] = (...args) => {
      n++;
      let h = 7 + n;
      for (const a of args) h = (Math.imul(h, 31) + Number(BigInt.asIntN(32, BigInt(a)))) | 0;
      if (rt === 'i64') return BigInt(h) * 3n;
      if (rt === 'i32') return h;
      return undefined;
    };
  }
  return imp;
}

function inst(file) {
  const mod = new WebAssembly.Module(fs.readFileSync(file));
  return new WebAssembly.Instance(mod, mkImports(mod)).exports;
}

function mkEntry(e) {
  const t = plan.types[e.T];
  const args = [];
  if (t.kind === 'struct') {
    t.fields.forEach((s, j) => { if (s !== 'ref') args.push(s === 'i64' ? BigInt.asIntN(64, BigInt(e.f[j] || 0)) : (Number(e.f[j] || 0) | 0)); });
  } else if (t.fields[0] !== 'ref') {
    for (let j = 0; j < 2; j++) args.push(t.fields[0] === 'i64' ? BigInt.asIntN(64, BigInt(e.f[j] || 0)) : (Number(e.f[j] || 0) | 0));
  }
  return H['new_' + t.idx](...args);
}

function dump(e, o, ents) {
  const t = plan.types[e.T];
  const out = [];
  if (t.kind === 'struct') {
    t.fields.forEach((s, j) => {
      const v = H['get_' + t.idx + '_' + j](o);
      out.push(s === 'ref' ? (v === null ? null : 'e' + ents.indexOf(v)) : String(v));
    });
  } else {
    const n = H['len_' + t.idx](o);
    for (let j = 0; j < n; j++) {
      const v = H['get_' + t.idx](o, j);
      out.push(t.fields[0] === 'ref' ? (v === null ? null : 'e' + ents.indexOf(v)) : String(v));
    }
  }
  return out;
}

function state(X) {
  const out = [];
  for (const k of Object.keys(X).sort()) {
    const v = X[k];
    if (v instanceof WebAssembly.Memory) {
      const b = new Uint8Array(v.buffer);
      let h = 2166136261;
      for (let i = 0; i < b.length; i++) if (b[i]) { h ^= b[i] + i; h = Math.imul(h, 16777619); }
      out.push(k + ':' + b.length + ':' + (h >>> 0));
    } else if (v instanceof WebAssembly.Global) {
      out.push(k + '=' + String(v.value));
    }
  }
  return out.join(' ');
}

function runOne(file, call) {
  let X;
  try { X = inst(file); } catch (e) { return 'instantiate:' + e.message; }
  try {
    const mems = Object.keys(X).filter(k => X[k] instanceof WebAssembly.Memory).sort();
    if (call.pages && mems.length) {
      const m = X[mems[0]];
      const cur = m.buffer.byteLength / 65536;
      if (call.pages > cur) m.grow(call.pages - cur);
    }
    if (call.mem && mems.length) {
      const b = new Uint8Array(X[mems[0]].buffer);
      for (const a in call.mem) if (+a < b.length) b[+a] = call.mem[a];
    }
    for (const g in (call.globals || {})) {
      if (X[g] instanceof WebAssembly.Global) {
        try { X[g].value = typeof X[g].value === 'bigint' ? BigInt.asIntN(64, BigInt(call.globals[g])) : (Number(call.globals[g]) | 0); } catch (e) { /* immutable */ }
      }
    }
  } catch (e) { return 'setup:' + e.message; }
  const ents = call.entries.map(mkEntry);
  const args = call.params.map(p => {
    switch (p.k) {
      case 'i32': return Number(p.v) | 0;
      case 'i64': return BigInt.asIntN(64, BigInt(p.v));
      case 'null': return null;
      case 'i31': return H.mk_i31(p.v | 0);
      case 'obj': return ents[p.i];
    }
    throw new Error('param ' + p.k);
  });
  let res;
  try {
    const r = X[plan.fname](...args);
    res = (r === null || r === undefined) ? String(r) : (typeof r === 'object' ? ('ref:e' + ents.indexOf(r)) : String(r));
  } catch (e) {
    res = e instanceof WebAssembly.RuntimeError ? 'trap' : 'error:' + e.message;
  }
  return JSON.stringify({res, st: state(X), ents: call.entries.map((e, i) => dump(e, ents[i], ents))});
}

for (const call of plan.calls) {
  const a = runOne(before, call), b = runOne(after, call);
  console.log(JSON.stringify({same: a === b, a, b}));
}
