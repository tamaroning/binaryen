// Round-5 V8 runner for gen_tv2.py modules (memories m0/m1, globals g0..g2,
// imports env.h / env.v, export f).
//
//   node cmp2.js diff SIG.json base.wasm opt.wasm
//     cmp.js-style differential: 40 calls with boundary/random arguments on
//     one fresh instance of each module, results/traps compared after every
//     call, then every memory (length + hash) and every global.
//   node cmp2.js state STATE.json base.wasm opt.wasm
//     replay one exwasm counterexample: STATE = {params:[types], args:[...],
//     mem_len, seed, over:{addr:byte}, globals:[...]}; every memory is grown to
//     mem_len and filled, globals are set, f is called once; prints both
//     outcomes.
'use strict';
const fs = require('fs');

const I32 = [0, 1, -1, 2, 31, 32, 63, 64, 0x7fffffff, -0x80000000, 0xff, 0xffff,
  0x10000, -2, 7, 8, 16, 0x80, 0x8000, 100, -100, 0x55555555, 65535, 65536, 0xfffc];
const I64 = [0n, 1n, -1n, 2n, 31n, 32n, 63n, 64n, 0x7fffffffn, -0x80000000n,
  0xffffffffn, 0x100000000n, 0x7fffffffffffffffn, -0x8000000000000000n, -2n,
  0xffn, 255n, 65536n, 0xfffcn];

let seed = 12345;
function rnd() { seed = (seed * 1103515245 + 12345) & 0x7fffffff; return seed; }
function pick(a) { return a[rnd() % a.length]; }
function arg(t) {
  const r = rnd() % 100;
  if (t === 'i32') return r < 70 ? pick(I32) : (rnd() ^ (rnd() << 16)) | 0;
  return r < 70 ? pick(I64) : BigInt.asIntN(64, (BigInt(rnd()) << 33n) ^ BigInt(rnd()) ^ (BigInt(rnd()) << 50n));
}

function inst(file) {
  const mod = new WebAssembly.Module(fs.readFileSync(file));
  const imports = { env: { h: x => (Math.imul(x, 7) + 3) | 0, v: () => {} } };
  return new WebAssembly.Instance(mod, imports).exports;
}

function memState(ex) {
  const out = [];
  for (const k of Object.keys(ex).sort()) if (ex[k] instanceof WebAssembly.Memory) {
    const b = new Uint8Array(ex[k].buffer);
    let h = 2166136261;
    for (let i = 0; i < b.length; i++) { h ^= b[i]; h = Math.imul(h, 16777619); }
    out.push(k + ':' + b.length + ':' + (h >>> 0));
  }
  for (const k of Object.keys(ex).sort()) if (ex[k] instanceof WebAssembly.Global) out.push(k + '=' + ex[k].value);
  return out.join(' ');
}

function call(ex, args) {
  try { return String(ex.f(...args)); } catch (e) { return 'trap:' + (e.message || e).toString().slice(0, 40); }
}

function diff(sigf, a, b) {
  const params = JSON.parse(fs.readFileSync(sigf, 'utf8')).params;
  const calls = [];
  for (let i = 0; i < 40; i++) calls.push(params.map(arg));
  const ea = inst(a), eb = inst(b);
  for (let i = 0; i < calls.length; i++) {
    const ra = call(ea, calls[i]), rb = call(eb, calls[i]);
    if (ra !== rb) { console.log(`DIFF call#${i} f(${calls[i].join(',')}) ${ra} vs ${rb}`); return; }
  }
  const sa = memState(ea), sb = memState(eb);
  if (sa !== sb) { console.log('DIFF state ' + sa + ' vs ' + sb); return; }
  console.log('OK');
}

function setup(ex, st) {
  for (const k of Object.keys(ex).sort()) if (ex[k] instanceof WebAssembly.Memory) {
    const m = ex[k];
    const want = Math.ceil(Number(st.mem_len) / 65536);
    const have = m.buffer.byteLength / 65536;
    if (want > have) {
      try { m.grow(typeof m.type === 'function' && m.type().address === 'i64' ? BigInt(want - have) : want - have); } catch (e) {
        try { m.grow(BigInt(want - have)); } catch (e2) { console.log('cannot grow ' + k + ' to ' + want + ': ' + e2.message); }
      }
    }
    const buf = new Uint8Array(m.buffer);
    if (st.seed) buf.fill(st.seed);
    for (const [ad, v] of Object.entries(st.over || {})) if (Number(ad) < buf.length) buf[Number(ad)] = v;
  }
  const gs = Object.keys(ex).filter(k => /^g\d+$/.test(k)).sort();
  (st.globals || []).forEach((v, i) => {
    if (i < gs.length) {
      const g = ex[gs[i]];
      g.value = typeof g.value === 'bigint' ? BigInt.asIntN(64, BigInt(v)) : Number(BigInt.asIntN(32, BigInt(v)));
    }
  });
}

function state(stf, a, b) {
  const st = JSON.parse(fs.readFileSync(stf, 'utf8'));
  const args = st.params.map((t, i) => t === 'i64' ? BigInt.asIntN(64, BigInt(st.args[i])) : Number(BigInt.asIntN(32, BigInt(st.args[i]))));
  const res = [];
  for (const f of [a, b]) {
    const ex = inst(f);
    setup(ex, st);
    const r = call(ex, args);
    res.push(r + ' | ' + memState(ex));
  }
  console.log('before: ' + res[0]);
  console.log('after:  ' + res[1]);
  console.log(res[0] === res[1] ? 'SAME' : 'DIFF');
}

const [mode, x, a, b] = process.argv.slice(2);
if (mode === 'diff') diff(x, a, b); else state(x, a, b);
