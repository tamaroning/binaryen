// Differential runner: node cmp.js base.wasm opt1.wasm [opt2.wasm ...]
// Calls every export of base with the same argument vectors on each module,
// compares results/traps after every call, then memory and globals.
// Prints one line per optimized module: "OK <file>" or "DIFF <file> <why>".
'use strict';
const fs = require('fs');

const I32 = [0, 1, -1, 2, 31, 32, 63, 64, 0x7fffffff, -0x80000000, 0xff, 0xffff,
  0x10000, -2, 7, 8, 16, 0x80, 0x8000, 100, -100, 0x55555555];
const I64 = [0n, 1n, -1n, 2n, 31n, 32n, 63n, 64n, 0x7fffffffn, -0x80000000n,
  0xffffffffn, 0x100000000n, 0x7fffffffffffffffn, -0x8000000000000000n, -2n,
  0xffn, 0x8000000000000000n - (1n << 64n) + 1n, 255n, 65536n];
const F = [0, -0, 1, -1, 0.5, -0.5, Infinity, -Infinity, NaN, 2147483648,
  -2147483648, 2147483647, 4294967296, 9223372036854775808, 1e-45, 1.5,
  -1.5, 2.5, 3.4028234663852886e38, 1e300, 5e-324];

let seed = 1;
function rnd() { seed = (seed * 1103515245 + 12345) & 0x7fffffff; return seed; }
function pick(a) { return a[rnd() % a.length]; }
function arg(t) {
  const r = rnd() % 100;
  if (t === 'i32') return r < 70 ? pick(I32) : (rnd() ^ (rnd() << 16)) | 0;
  if (t === 'i64') return r < 70 ? pick(I64) : BigInt.asIntN(64, (BigInt(rnd()) << 33n) ^ BigInt(rnd()) ^ (BigInt(rnd()) << 50n));
  if (t === 'f32') return r < 70 ? Math.fround(pick(F)) : Math.fround((rnd() - 0x3fffffff) / (rnd() + 1));
  return r < 70 ? pick(F) : (rnd() - 0x3fffffff) / (rnd() + 1) * (r % 2 ? 1e10 : 1);
}

function show(v) {
  if (typeof v === 'number') {
    if (Number.isNaN(v)) return 'nan';
    if (Object.is(v, -0)) return '-0';
  }
  return String(v);
}

function run(file, calls) {
  const mod = new WebAssembly.Module(fs.readFileSync(file));
  const imports = {};
  let tempRet0 = 0;
  for (const im of WebAssembly.Module.imports(mod)) {
    imports[im.module] = imports[im.module] || {};
    if (/setTempRet0/.test(im.name)) imports[im.module][im.name] = v => { tempRet0 = v; };
    else if (/getTempRet0/.test(im.name)) imports[im.module][im.name] = () => tempRet0;
    else imports[im.module][im.name] = () => { throw new Error('import ' + im.name); };
  }
  const inst = new WebAssembly.Instance(mod, imports);
  const ex = inst.exports;
  const log = [];
  for (const [name, args] of calls) {
    const f = ex[name];
    if (!f) { log.push(name + ':missing'); continue; }
    let r;
    try { r = show(f(...args)); if (imports.env && (imports.env.setTempRet0 || imports.env.getTempRet0)) r += '/' + tempRet0; } catch (e) {
      if (e instanceof RangeError && /call stack/.test(e.message)) r = 'STACK';
      else r = 'trap';
    }
    if (process.env.VMEM && ex.mem) {
      const b = new Uint8Array(ex.mem.buffer); let h = 2166136261;
      for (let i = 0; i < b.length; i++) { h ^= b[i]; h = Math.imul(h, 16777619); }
      r += '|m' + (h >>> 0);
    }
    log.push(name + ':' + r);
  }
  let mem = '';
  if (ex.mem) {
    const b = new Uint8Array(ex.mem.buffer);
    let h = 2166136261;
    for (let i = 0; i < b.length; i++) { h ^= b[i]; h = Math.imul(h, 16777619); }
    mem = b.length + ':' + (h >>> 0);
  }
  const gl = [];
  for (const k of Object.keys(ex).sort()) if (ex[k] instanceof WebAssembly.Global) {
    let v;
    try { v = ex[k].value; } catch (e) { continue; }
    if (process.env.VSKIP_I64_GLOBALS && (typeof v === 'bigint' || k === 'g1')) continue;
    gl.push(k + '=' + show(v));
  }
  if (process.env.VSTAT) { const t = log.filter(l => l.endsWith(":trap")).length; console.error("STAT", file, log.length, t); }
  return { log, mem, gl: gl.join(',') };
}

function main() {
  const [base, ...opts] = process.argv.slice(2);
  const sigs = JSON.parse(fs.readFileSync(base.replace(/\.wasm$/, '.sig.json'), 'utf8'));
  seed = 12345;
  const calls = [];
  const names = Object.keys(sigs).sort();
  for (let rep = 0; rep < 40; rep++)
    for (const n of names) calls.push([n, sigs[n].map(arg)]);
  const b = run(base, calls);
  for (const o of opts) {
    let x;
    try { x = run(o, calls); } catch (e) { console.log('DIFF ' + o + ' load:' + e.message.slice(0, 200)); continue; }
    let why = null;
    for (let i = 0; i < calls.length; i++) {
      if (b.log[i] !== x.log[i]) {
        if (b.log[i].endsWith('STACK') || x.log[i].endsWith('STACK')) { why = null; break; }
        why = `call#${i} ${calls[i][0]}(${calls[i][1].map(show).join(',')}) ${b.log[i]} vs ${x.log[i]}`;
        break;
      }
    }
    if (!why && b.mem !== x.mem) why = 'mem ' + b.mem + ' vs ' + x.mem;
    if (!why && b.gl !== x.gl) why = 'globals ' + b.gl + ' vs ' + x.gl;
    console.log((why ? 'DIFF ' : 'OK ') + o + (why ? ' ' + why : ''));
  }
}
main();
