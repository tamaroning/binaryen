// V8 differential oracle for modules exwasm does not cover.
//
//   node --experimental-wasm-type-reflection v8diff.js BEFORE.wasm AFTER.wasm [SEED]
//
// Prints one JSON line {same, calls, detail, skip}.  Both modules are
// instantiated once with the same deterministic import stubs; every exported
// function whose parameters can be built from JS is called with the same
// argument vectors in the same order.  After each call the outcome (result,
// trap, exception), the import-call trace of that call, and the exported
// memories / globals are compared.  Every NaN is equal to every other NaN
// (payloads are nondeterministic); references compare by null-ness only.
// A stack overflow on either side ends the comparison (frame sizes are
// engine-defined and may change with optimization).
'use strict';
const fs = require('fs');
const [beforeF, afterF, seedArg] = process.argv.slice(2, 5);
let seed = Number(seedArg || 4242) | 0;
function rnd() { seed = (Math.imul(seed, 1103515245) + 12345) & 0x7fffffff; return seed; }
function pick(a) { return a[rnd() % a.length]; }
const I32 = [0, 1, -1, 2, 3, 4, 7, 8, 16, 31, 32, 64, 0x7f, 0x80, 0xff, 0x100, 0x7fff, 0x8000, 0xffff, 0x10000,
  0x7fffffff, -0x80000000, -2, 1024, 65535, 65536, -65536];
const I64 = [0n, 1n, -1n, 2n, 7n, 31n, 32n, 63n, 64n, 0xffn, 0x7fffffffn, 0x80000000n, 0xffffffffn, 0x100000000n,
  0x7fffffffffffffffn, -0x8000000000000000n, -2n, 65536n];
const F = [0, -0, 1, -1, 0.5, -0.5, 1.5, 2 ** 31, -(2 ** 31), 2 ** 32, 2 ** 63, 1e30, -1e-30, 3.4e38, Infinity,
  -Infinity, NaN, 5e-324];

function norm(v) {
  if (typeof v === 'number') return Number.isNaN(v) ? 'NaN' : (Object.is(v, -0) ? '-0' : String(v));
  if (typeof v === 'bigint') return v.toString() + 'n';
  if (v === null || v === undefined) return String(v);
  return 'ref';
}

function argFor(t) {
  switch (t) {
    case 'i32': return rnd() % 3 ? pick(I32) : (rnd() ^ (rnd() << 16)) | 0;
    case 'i64': return rnd() % 3 ? pick(I64) : BigInt.asIntN(64, (BigInt(rnd()) << 33n) ^ BigInt(rnd()));
    case 'f32': return Math.fround(rnd() % 3 ? pick(F) : (rnd() - 2 ** 30) / (rnd() + 1));
    case 'f64': return rnd() % 3 ? pick(F) : (rnd() - 2 ** 30) / (rnd() + 1);
  }
  if (typeof t === 'string') {
    // abstract nullable references: null, or a small integer (an i31ref) where allowed
    if (/^(anyref|eqref|i31ref)$/.test(t) && rnd() % 3 === 0) return rnd() % 1000;
    if (/ref$/.test(t) || t === 'externref' || t === 'funcref' || t === 'exnref') return null;
  }
  if (t && typeof t === 'object' && t.nullable) return null;
  throw new Error('unbuildable param ' + JSON.stringify(t));
}

function defaultOf(t) {
  if (t === 'i64') return 0n;
  if (t === 'i32' || t === 'f32' || t === 'f64') return 0;
  return null;
}

function makeImports(mod, trace) {
  const imp = {};
  let n = 0;
  for (const d of WebAssembly.Module.imports(mod)) {
    imp[d.module] = imp[d.module] || {};
    if (d.kind === 'function') {
      const rs = (d.type && d.type.results) || [];
      imp[d.module][d.name] = (...args) => {
        n++;
        trace.push(d.name + '(' + args.map(norm).join(',') + ')');
        let h = 7 + n;
        for (const a of args) {
          const x = typeof a === 'bigint' ? Number(BigInt.asIntN(32, a)) : (typeof a === 'number' && Number.isFinite(a) ? (a | 0) : 1);
          h = (Math.imul(h, 31) + x) | 0;
        }
        if (!rs.length) return undefined;
        const r = rs[0];
        if (r === 'i64') return BigInt(h) * 3n;
        if (r === 'i32') return h;
        if (r === 'f32' || r === 'f64') return h / 7;
        return null;
      };
    } else if (d.kind === 'memory') {
      imp[d.module][d.name] = new WebAssembly.Memory(d.type);
    } else if (d.kind === 'global') {
      const vt = d.type.value;
      // an immutable global import may be given as a plain value
      const val = /extern\)?$/.test(vt) && !/null/.test(vt) && vt !== 'externref' ? {} : defaultOf(vt);
      imp[d.module][d.name] = d.type.mutable ? new WebAssembly.Global({ value: vt, mutable: true }, val) : val;
    } else if (d.kind === 'table') {
      imp[d.module][d.name] = new WebAssembly.Table(d.type);
    } else if (d.kind === 'tag') {
      imp[d.module][d.name] = new WebAssembly.Tag({ parameters: (d.type && d.type.parameters) || [] });
    }
  }
  return imp;
}

function hash(buf) {
  const u = new Uint8Array(buf);
  let h = 2166136261;
  for (let i = 0; i < u.length; i++) if (u[i]) { h ^= u[i] + i; h = Math.imul(h, 16777619); }
  return (h >>> 0) + '/' + u.length;
}

function state(ex) {
  const s = [];
  for (const k of Object.keys(ex).sort()) {
    const v = ex[k];
    if (v instanceof WebAssembly.Memory) s.push(k + '=' + hash(v.buffer));
    else if (v instanceof WebAssembly.Global) { try { s.push(k + '=' + norm(v.value)); } catch (e) { s.push(k + '=?'); } }
  }
  return s.join(' ');
}

// A call that runs longer than HANG_MS is cut off (vm watchdog terminates the
// wasm loop) and counts as outcome "hang", so that a trap turning into a
// non-terminating loop (or back) is a difference instead of a process timeout.
// V8DIFF_HANG_MS overrides the limit (re-checks use a longer one).
const vm = require('vm');
const HANG_MS = Number(process.env.V8DIFF_HANG_MS || 1500);
const callScript = new vm.Script('f(...a)');
const callCtx = vm.createContext({ f: null, a: null });

function outcome(f, a) {
  try {
    callCtx.f = f; callCtx.a = a;
    let r = callScript.runInContext(callCtx, { timeout: HANG_MS });
    if (!Array.isArray(r)) r = [r];
    return 'ok:' + r.map(norm).join(',');
  } catch (e) {
    if (e && e.code === 'ERR_SCRIPT_EXECUTION_TIMEOUT') return 'hang';
    if (e instanceof WebAssembly.RuntimeError) return 'trap';
    if (typeof WebAssembly.Exception === 'function' && e instanceof WebAssembly.Exception) return 'wasm-exception';
    if (e instanceof RangeError && /stack/i.test(e.message)) return 'stack-overflow';
    return 'js-error:' + (e && e.constructor && e.constructor.name);
  }
}

function out(o) { console.log(JSON.stringify(o)); process.exit(0); }

let ma, mb;
try { ma = new WebAssembly.Module(fs.readFileSync(beforeF)); } catch (e) { out({ same: true, skip: 'before does not compile: ' + e.message }); }
try { mb = new WebAssembly.Module(fs.readFileSync(afterF)); } catch (e) { out({ same: false, detail: 'after does not compile: ' + e.message }); }
const ta = [], tb = [];
let ia, ib;
try { ia = new WebAssembly.Instance(ma, makeImports(ma, ta)); } catch (e) { out({ same: true, skip: 'before does not instantiate: ' + String(e.message).slice(0, 80) }); }
try { ib = new WebAssembly.Instance(mb, makeImports(mb, tb)); } catch (e) {
  out({ same: false, detail: 'after does not instantiate: ' + e.message });
}
const sigs = {};
for (const e of WebAssembly.Module.exports(ma)) if (e.kind === 'function') sigs[e.name] = e.type;
const diffs = [];
let calls = 0, skipped = 0, stop = '';
if (ta.join('|') !== tb.join('|')) diffs.push('start trace: ' + ta.join(' ') + ' vs ' + tb.join(' '));
if (state(ia.exports) !== state(ib.exports)) diffs.push('initial state: ' + state(ia.exports) + ' vs ' + state(ib.exports));
for (const name of Object.keys(sigs).sort()) {
  if (diffs.length || stop) break;
  const fa = ia.exports[name], fb = ib.exports[name];
  if (typeof fb !== 'function') { diffs.push(name + ': missing in after'); break; }
  const ps = (sigs[name] && sigs[name].parameters) || [];
  for (let v = 0; v < 5 && calls < 120; v++) {
    let args;
    try { args = ps.map(argFor); } catch (e) { skipped++; break; }
    ta.length = 0; tb.length = 0;
    const oa = outcome(fa, args), ob = outcome(fb, args);
    calls++;
    if (oa === 'stack-overflow' || ob === 'stack-overflow') { stop = 'stack overflow in ' + name; break; }
    const where = `${name}(${args.map(norm)})`;
    if (oa !== ob) diffs.push(`${where}: ${oa} vs ${ob}`);
    else if (oa === 'hang') { stop = 'hang in ' + name; break; }  // state after a cut-off call is arbitrary
    else if (ta.join('|') !== tb.join('|')) diffs.push(`${where} imports: ${ta.slice(0, 6).join(' ')} vs ${tb.slice(0, 6).join(' ')}`);
    else {
      const sa = state(ia.exports), sb = state(ib.exports);
      if (sa !== sb) diffs.push(`${where} state: ${sa} vs ${sb}`);
    }
    if (diffs.length) break;
  }
}
out({ same: diffs.length === 0, calls, skipped, stop, detail: diffs.slice(0, 2).join(' | ').slice(0, 600) });
