// node run.js A.wasm B.wasm : A = original (call ctor first), B = ctor-evaluated
const fs = require('fs');
function go(f, callCtor) {
  const i = new WebAssembly.Instance(new WebAssembly.Module(fs.readFileSync(f)), {});
  if (callCtor) i.exports.ctor();
  const out = [];
  for (const k of Object.keys(i.exports).sort()) if (k[0] === 'r') { try { out.push(k + '=' + i.exports[k]()); } catch (e) { out.push(k + '=trap'); } }
  return out.join(' ');
}
const a = go(process.argv[2], true), b = go(process.argv[3], false);
console.log(a === b ? 'OK' : 'DIFF\n  orig ' + a + '\n  eval ' + b);
