// V8 differential of two modules produced from one wasm-smith module:
//   node cmp.js base.wasm opt.wasm  -> prints JSON {same: bool, detail}
// Every exported function whose parameters are numbers (i32/i64/f32/f64) is
// called with a few argument vectors on one instance of each module, in the
// same order; results, traps/exceptions, exported memories and globals are
// compared after each call. Floats are compared with every NaN equal (NaN
// bits are nondeterministic in Wasm); references by null-ness only.
'use strict';
const fs = require('fs');
let seed = 4242;
function rnd() { seed = (seed * 1103515245 + 12345) & 0x7fffffff; return seed; }
const I32 = [0, 1, -1, 2, 7, 31, 32, 0x7fffffff, -0x80000000, 0xff, 0xffff, 0x10000, 65535, -2];
const I64 = [0n, 1n, -1n, 2n, 63n, 64n, 0x7fffffffn, 0xffffffffn, 0x100000000n, 0x7fffffffffffffffn, -0x8000000000000000n];
const F = [0, -0, 1, -1, 0.5, 1e30, -1e-30, Infinity, -Infinity, NaN, 2 ** 31, 2 ** 63, 3.4e38];
function pick(a) { return a[rnd() % a.length]; }
function arg(t) {
  if (t === 'i32') return rnd() % 3 ? pick(I32) : (rnd() ^ (rnd() << 16)) | 0;
  if (t === 'i64') return rnd() % 3 ? pick(I64) : BigInt.asIntN(64, (BigInt(rnd()) << 33n) ^ BigInt(rnd()));
  return rnd() % 3 ? pick(F) : (rnd() - 2 ** 30) / (rnd() + 1);
}
function norm(v) {
  if (typeof v === 'number') return Number.isNaN(v) ? 'NaN' : (Object.is(v, -0) ? '-0' : String(v));
  if (typeof v === 'bigint') return v.toString() + 'n';
  if (v === null || v === undefined) return String(v);
  return 'ref';
}
function outcome(f, a) {
  try {
    let r = f(...a);
    if (!Array.isArray(r)) r = [r];
    return 'ok:' + r.map(norm).join(',');
  } catch (e) {
    if (e instanceof WebAssembly.RuntimeError) return 'trap';
    if (e instanceof WebAssembly.Exception) return 'wasm-exception';
    if (e instanceof RangeError && /stack/i.test(e.message)) return 'stack-overflow';
    return 'js-error:' + (e && e.constructor && e.constructor.name);
  }
}
function hash(buf) { let h = 2166136261; const u = new Uint8Array(buf); for (let i = 0; i < u.length; i++) { h ^= u[i]; h = Math.imul(h, 16777619); } return (h >>> 0) + '/' + u.length; }
function state(inst) {
  const s = [];
  for (const [k, v] of Object.entries(inst.exports)) {
    if (v instanceof WebAssembly.Memory) s.push(k + '=' + hash(v.buffer));
    else if (v instanceof WebAssembly.Global) { try { s.push(k + '=' + norm(v.value)); } catch (e) { s.push(k + '=?'); } }
  }
  return s.join(' ');
}
const [a, b] = process.argv.slice(2).map(p => new WebAssembly.Module(fs.readFileSync(p)));
function inst(m) { return new WebAssembly.Instance(m, {}); }
let ia, ib;
try { ia = inst(a); } catch (e) { console.log(JSON.stringify({ same: true, detail: 'base does not instantiate: ' + e.message })); process.exit(0); }
try { ib = inst(b); } catch (e) { console.log(JSON.stringify({ same: false, detail: 'opt does not instantiate: ' + e.message })); process.exit(0); }
const types = {};
for (const e of WebAssembly.Module.exports(a)) types[e.name] = e.kind;
const diffs = [];
let calls = 0;
for (const name of Object.keys(ia.exports).sort()) {
  const fa = ia.exports[name], fb = ib.exports[name];
  if (typeof fa !== 'function') continue;
  if (typeof fb !== 'function') { diffs.push(name + ': missing in opt'); continue; }
  // Parameter types are not exposed; try the arity with i32 first, then others.
  const n = fa.length;
  for (let v = 0; v < 6 && calls < 200; v++) {
    const t = ['i32', 'i64', 'f64'][v % 3];
    const args = Array.from({ length: n }, () => arg(t));
    const oa = outcome(fa, args), ob = outcome(fb, args);
    calls++;
    if (oa.startsWith('js-error') && ob.startsWith('js-error')) continue; // wrong argument kinds
    if (oa === 'stack-overflow' || ob === 'stack-overflow') continue;     // depth is engine-defined
    if (oa !== ob) diffs.push(`${name}(${args.map(norm)}): ${oa} vs ${ob}`);
    const sa = state(ia), sb = state(ib);
    if (sa !== sb) diffs.push(`${name}(${args.map(norm)}) state: ${sa} vs ${sb}`);
    if (diffs.length) break;
  }
  if (diffs.length) break;
}
console.log(JSON.stringify({ same: diffs.length === 0, calls, detail: diffs.slice(0, 3).join(' | ') }));
