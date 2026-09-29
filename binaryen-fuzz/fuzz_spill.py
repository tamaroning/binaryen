#!/usr/bin/env python3
"""--spill-pointers needs a global named __stack_pointer (ABI::getStackPointerGlobal).
Generate, inject that global via a wat round-trip, then run the pass."""
import os, random, subprocess, sys, time
BIN='/home/tamaron/work/binaryen/bin/wasm-opt'
DIS='/home/tamaron/work/binaryen/bin/wasm-dis'
AS='/home/tamaron/work/binaryen/bin/wasm-as'
W=sys.argv[1]; os.makedirs(W, exist_ok=True)
os.makedirs(os.path.join(W,'bad'), exist_ok=True)
F=['--all-features','--disable-fp16','--disable-shared-everything','--disable-stack-switching']
top=random.Random(int(sys.argv[2]) if len(sys.argv)>2 else 7)
def P(n): return os.path.join(W,n)
tested=ran=miscomp=bad=0; t0=time.time()
for n in range(100000):
    r=random.Random(top.getrandbits(64))
    open(P('s.dat'),'wb').write(bytes(r.getrandbits(8) for _ in range(r.randint(800,15000))))
    ga=['--denan'] if r.random()<0.6 else []
    try:
        if subprocess.run([BIN,'-ttf',P('s.dat'),'-o',P('a.wasm')]+F+ga,
                          capture_output=True,timeout=60).returncode: continue
        if subprocess.run([DIS,P('a.wasm')]+F+['-o',P('a.wat')],
                          capture_output=True,timeout=60).returncode: continue
    except subprocess.TimeoutExpired: continue
    s=open(P('a.wat')).read().rstrip()
    if not s.endswith(')'):
        continue
    # append, not prepend: the wat parser requires imports before definitions
    s=s[:-1]+' (global $__stack_pointer (mut i32) (i32.const 65536))\n)\n'
    open(P('b.wat'),'w').write(s)
    try:
        if subprocess.run([AS,P('b.wat')]+F+['-o',P('b.wasm')],
                          capture_output=True,timeout=60).returncode: continue
    except subprocess.TimeoutExpired: continue
    tested+=1
    try:
        q=subprocess.run([BIN,P('b.wasm'),'--fuzz-exec','--spill-pointers','-o',os.devnull]+F,
                         capture_output=True,text=True,timeout=90)
    except subprocess.TimeoutExpired: continue
    err=q.stdout+q.stderr
    if 'failed to find the stack pointer' in err: continue
    ran+=1
    if q.returncode:
        if 'optimization passes changed results' in err: kind='MISCOMPILE'; miscomp+=1
        elif 'validat' in err.lower() or 'Assertion' in err or 'Segmentation' in err: kind='INVALID'; bad+=1
        else: continue
        d=os.path.join(W,'bad','%s_%d'%(kind,n)); os.makedirs(d,exist_ok=True)
        subprocess.run(['cp',P('b.wasm'),os.path.join(d,'before.wasm')])
        open(os.path.join(d,'err.txt'),'w').write(err[-6000:])
        print('%s at %d -> %s'%(kind,n,d),flush=True)
    if tested and tested%100==0:
        print('tested %d, pass actually ran %d, miscompiles %d, invalid %d (%.0fs)'
              %(tested,ran,miscomp,bad,time.time()-t0),flush=True)
