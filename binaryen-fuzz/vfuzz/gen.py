#!/usr/bin/env python3
"""Generate arithmetic-dense wasm modules (text) for value-dependent fuzzing.

Functions are exported (in "partial" modules only some are, so that
inter-procedural passes can change the others); the harness calls them with many argument
vectors (boundary values + random), unlike --fuzz-exec which passes zeros.
"""
import random
import sys

I32C = [0, 1, 2, 3, -1, -2, 7, 8, 15, 16, 31, 32, 33, 63, 64, 65, 0xff, 0x100,
        0xffff, 0x10000, 0x7fff, 0x8000, 0x7fffffff, -0x80000000, -0x7fffffff,
        0x55555555, 0x0f0f0f0f, 0x7ffffffe, 0xff00, -256, -65536, 24, 48]
I64C = [0, 1, 2, -1, -2, 31, 32, 33, 63, 64, 65, 0xff, 0xffff, 0xffffffff,
        0x100000000, 0x7fffffff, 0x80000000, -0x80000000, 0x7fffffffffffffff,
        -0x8000000000000000, 0xffffffff00000000 - (1 << 64), 0x5555555555555555,
        -0x100000000, 0x7fffffffffffffff - 1, 56, 48, 40]
FC = ["0", "-0", "1", "-1", "0.5", "-0.5", "2", "inf", "-inf", "nan",
      "-nan", "nan:0x200000", "2147483648", "-2147483648", "2147483647",
      "4294967296", "9223372036854775808", "-9223372036854775808",
      "0x1p-149", "0x1p-126", "0x1.fffffep127", "1e10", "-1e-10", "3.5",
      "-2.5", "0x1p-1074", "0x1p-1022", "0x1.fffffffffffffp1023",
      "18446744073709551616", "4294967295", "-4294967296", "0x1p+23",
      "0x1p+52", "0.49999999999999994"]

INT = ("i32", "i64")
FLT = ("f32", "f64")

IBIN = ["add", "sub", "mul", "div_s", "div_u", "rem_s", "rem_u", "and", "or",
        "xor", "shl", "shr_s", "shr_u", "rotl", "rotr"]
ICMP = ["eq", "ne", "lt_s", "lt_u", "gt_s", "gt_u", "le_s", "le_u", "ge_s",
        "ge_u"]
FBIN = ["add", "sub", "mul", "div", "min", "max", "copysign"]
FUN = ["abs", "neg", "sqrt", "ceil", "floor", "trunc", "nearest"]
FCMP = ["eq", "ne", "lt", "gt", "le", "ge"]


class Gen:
    def __init__(self, rng, floats, mem, nfuncs, straight=False):
        self.straight = straight
        self.r = rng
        self.floats = floats
        self.mem = mem
        self.nfuncs = nfuncs
        self.types = ("i32", "i64", "f32", "f64") if floats else INT
        self.globals = [("i32", "g0"), ("i64", "g1")] + \
            ([("f64", "g2"), ("f32", "g3")] if floats else [("i32", "g2")])
        self.sigs = []
        self.partial = False
        self.exported = set()

    def ty(self):
        r = self.r.random()
        if r < 0.5:
            return "i32"
        if r < 0.8 or not self.floats:
            return "i64" if r < 0.8 else "i32"
        return self.r.choice(FLT)

    def const(self, t):
        r = self.r
        if t == "i32":
            if r.random() < 0.8:
                v = r.choice(I32C)
            elif r.random() < 0.5:
                v = (1 << r.randrange(32)) - r.choice([0, 1, 0, -1])
            else:
                v = r.randrange(-(1 << 31), 1 << 31)
            v = ((v + (1 << 31)) % (1 << 32)) - (1 << 31)
            return f"(i32.const {v})"
        if t == "i64":
            if r.random() < 0.8:
                v = r.choice(I64C)
            elif r.random() < 0.5:
                v = (1 << r.randrange(64)) - r.choice([0, 1, 0, -1])
            else:
                v = r.randrange(-(1 << 63), 1 << 63)
            v = ((v + (1 << 63)) % (1 << 64)) - (1 << 63)
            return f"(i64.const {v})"
        v = r.choice(FC) if r.random() < 0.85 else repr(r.uniform(-1e6, 1e6))
        return f"({t}.const {v})"

    # ---- expressions -------------------------------------------------
    def leaf(self, t):
        cands = [v for v in self.vars if v[0] == t]
        if cands and self.r.random() < 0.6:
            return f"(local.get {self.r.choice(cands)[1]})"
        gs = [g for g in self.globals if g[0] == t]
        if gs and not self.straight and self.r.random() < 0.15:
            return f"(global.get ${self.r.choice(gs)[1]})"
        return self.const(t)

    def addr(self, d):
        r = self.r.random()
        if r < 0.75:
            return f"(i32.and {self.expr('i32', d + 1)} (i32.const {self.r.choice([0xfff8, 0xff, 0xfff0, 0x3f, 0xffff])}))"
        if r < 0.93:
            return f"(i32.const {self.r.choice([0, 8, 16, 65528, 65535, 65532, 65536, -8, 100, 1, 2, 3, 4, 32])})"
        return self.expr("i32", d + 1)

    def load(self, t, d):
        off = self.r.choice([0, 0, 0, 0, 0, 1, 4, 8, 16, 0, 1, 2, 65535, 0xfffffff0])
        if t in INT and self.r.random() < 0.5:
            sz = self.r.choice(["8", "16"] + (["32"] if t == "i64" else []))
            op = f"{t}.load{sz}_{self.r.choice('su')}"
            al = self.r.choice([1] + [int(sz) // 8])
        else:
            op = f"{t}.load"
            al = self.r.choice([1, 2, 4] + ([8] if t in ("i64", "f64") else []))
        return f"({op} offset={off} align={al} {self.addr(d)})"

    def expr(self, t, d=0):
        r = self.r
        if d >= self.maxd or r.random() < 0.12 + d * 0.08:
            return self.leaf(t)
        k = r.random()
        cands = [v for v in self.vars if v[0] == t]
        if t in INT:
            if k < 0.30:
                op = r.choice(IBIN)
                if op[:3] in ("div", "rem") and r.random() < 0.6:
                    op = r.choice(IBIN)
                return f"({t}.{op} {self.expr(t, d+1)} {self.expr(t, d+1)})"
            if k < 0.40:
                ot = r.choice(self.types)
                if ot in INT:
                    op = r.choice(ICMP)
                else:
                    op = r.choice(FCMP)
                c = f"({ot}.{op} {self.expr(ot, d+1)} {self.expr(ot, d+1)})"
                return c if t == "i32" else f"(i64.extend_i32_{r.choice('su')} {c})"
            if k < 0.48:
                ops = ["clz", "ctz", "popcnt", "extend8_s", "extend16_s"] + \
                    (["extend32_s"] if t == "i64" else [])
                if r.random() < 0.3:
                    c = f"({t}.eqz {self.expr(t, d+1)})"
                    return c if t == "i32" else f"(i64.extend_i32_u {c})"
                return f"({t}.{r.choice(ops)} {self.expr(t, d+1)})"
            if k < 0.56:
                if t == "i32":
                    if self.floats and r.random() < 0.5:
                        ft = r.choice(FLT)
                        op = "trunc" if r.random() < 0.25 else "trunc_sat"
                        if r.random() < 0.3 and ft == "f32":
                            return f"(i32.reinterpret_f32 {self.expr('f32', d+1)})"
                        return f"(i32.{op}_{ft}_{r.choice('su')} {self.expr(ft, d+1)})"
                    return f"(i32.wrap_i64 {self.expr('i64', d+1)})"
                if self.floats and r.random() < 0.5:
                    ft = r.choice(FLT)
                    op = "trunc" if r.random() < 0.25 else "trunc_sat"
                    if r.random() < 0.3 and ft == "f64":
                        return f"(i64.reinterpret_f64 {self.expr('f64', d+1)})"
                    return f"(i64.{op}_{ft}_{r.choice('su')} {self.expr(ft, d+1)})"
                return f"(i64.extend_i32_{r.choice('su')} {self.expr('i32', d+1)})"
        else:
            if k < 0.30:
                return f"({t}.{r.choice(FBIN)} {self.expr(t, d+1)} {self.expr(t, d+1)})"
            if k < 0.42:
                return f"({t}.{r.choice(FUN)} {self.expr(t, d+1)})"
            if k < 0.56:
                c = r.random()
                if c < 0.2:
                    o = "f64" if t == "f32" else "f32"
                    op = "demote_f64" if t == "f32" else "promote_f32"
                    return f"({t}.{op} {self.expr(o, d+1)})"
                if c < 0.3:
                    it = "i32" if t == "f32" else "i64"
                    return f"({t}.reinterpret_{it} {self.expr(it, d+1)})"
                it = r.choice(INT)
                return f"({t}.convert_{it}_{r.choice('su')} {self.expr(it, d+1)})"
        if k < 0.64:
            return f"(select (result {t}) {self.expr(t, d+1)} {self.expr(t, d+1)} {self.expr('i32', d+1)})"
        if k < 0.70 and cands:
            return f"(local.tee {r.choice(cands)[1]} {self.expr(t, d+1)})"
        if k < 0.76 and self.mem:
            return self.load(t, d)
        if self.straight and k >= 0.76:
            return self.leaf(t)
        if k < 0.82:
            return f"(if (result {t}) {self.expr('i32', d+1)} (then {self.stmts(d+2, 1)} {self.expr(t, d+1)}) (else {self.expr(t, d+1)}))"
        if k < 0.87:
            lab = self.label()
            v = f"(br_if {lab} {self.expr(t, d+2)} {self.expr('i32', d+2)})"
            body = f"(drop {v}) {self.stmts(d+2, 1)} {self.expr(t, d+1)}"
            return f"(block {lab} (result {t}) {body})"
        if k < 0.92 and self.callable_sigs(t):
            j, ps, _ = r.choice(self.callable_sigs(t))
            args = " ".join(self.expr(p, d+1) for p in ps)
            return f"(call $f{j} {args})"
        if k < 0.94 and self.mem and t == "i32":
            return r.choice(["(memory.size)", f"(memory.grow {r.choice(['(i32.const 0)', '(i32.const 1)', self.expr('i32', d+1)])})"])
        return self.leaf(t)

    def callable_sigs(self, t):
        return [s for s in self.sigs if s[2] == t]

    def label(self):
        self.nlab += 1
        return f"$b{self.nlab}"

    # ---- statements --------------------------------------------------
    def stmt(self, d):
        r = self.r
        k = r.random()
        if k < 0.35 and self.vars:
            v = r.choice(self.vars)
            return f"(local.set {v[1]} {self.expr(v[0], d)})"
        if k < 0.55 and self.mem:
            t = r.choice(self.types)
            if t in INT and r.random() < 0.5:
                sz = r.choice(["8", "16"] + (["32"] if t == "i64" else []))
                op = f"{t}.store{sz}"
            else:
                op = f"{t}.store"
            off = r.choice([0, 0, 0, 0, 1, 4, 8, 2, 3, 65535, 0xfffffff0])
            return f"({op} offset={off} {self.addr(d)} {self.expr(t, d)})"
        if self.straight and k >= 0.55:
            return f"(drop {self.expr(r.choice(self.types), d)})"
        if k < 0.65:
            g = r.choice(self.globals)
            return f"(global.set ${g[1]} {self.expr(g[0], d)})"
        if k < 0.75:
            return f"(drop {self.expr(r.choice(self.types), d)})"
        if k < 0.83 and d < self.maxd:
            return f"(if {self.expr('i32', d+1)} (then {self.stmts(d+1, 2)}) (else {self.stmts(d+1, 2)}))"
        if k < 0.90 and d < self.maxd and self.counters:
            c = self.counters.pop()
            lab = self.label()
            n = r.choice([1, 2, 3, 5])
            s = (f"(local.set {c} (i32.const {n})) (loop {lab} {self.stmts(d+1, 3)} "
                 f"(br_if {lab} (i32.gt_s (local.tee {c} (i32.sub (local.get {c}) (i32.const 1))) (i32.const 0))))")
            return s
        if k < 0.95 and d < self.maxd:
            lab = self.label()
            return f"(block {lab} {self.stmts(d+1, 1)} (br_if {lab} {self.expr('i32', d+1)}) {self.stmts(d+1, 2)})"
        if self.sigs:
            j, ps, rt = r.choice(self.sigs)
            args = " ".join(self.expr(p, d+1) for p in ps)
            return f"(drop (call $f{j} {args}))"
        return "(nop)"

    def stmts(self, d, n):
        return " ".join(self.stmt(d) for _ in range(self.r.randrange(n + 1)))

    def func(self, i):
        r = self.r
        ps = [self.ty() for _ in range(r.randrange(4))]
        ls = [self.ty() for _ in range(r.randrange(4))]
        rt = self.ty()
        self.vars = [(t, f"$p{j}") for j, t in enumerate(ps)] + \
                    [(t, f"$l{j}") for j, t in enumerate(ls)]
        self.counters = [f"$c{j}" for j in range(2)]
        self.nlab = 0
        self.maxd = r.choice([3, 4, 5, 6])
        body = self.stmts(1, 5) + " " + self.expr(rt, 0)
        params = " ".join(f"(param $p{j} {t})" for j, t in enumerate(ps))
        locs = " ".join(f"(local $l{j} {t})" for j, t in enumerate(ls))
        locs += " (local $c0 i32) (local $c1 i32)"
        self.sigs.append((i, ps, rt))
        exp = f'(export "f{i}") ' if i in self.exported else ""
        return (f'(func $f{i} {exp}{params} (result {rt}) {locs}\n  {body})')

    def module(self):
        out = ["(module"]
        if self.mem:
            out.append('(memory $m (export "mem") 1 2)')
            out.append('(data (i32.const 0) "\\01\\02\\03\\04\\80\\ff\\7f\\00\\fe\\ff\\ff\\ff\\00\\00\\00\\80")')
        inits = {"i32": "(i32.const 7)", "i64": "(i64.const -3)",
                 "f64": "(f64.const 1.5)", "f32": "(f32.const -0)"}
        for t, n in self.globals:
            exp = f'(export "{n}") ' if not self.partial or self.r.random() < 0.5 else ""
            out.append(f'(global ${n} {exp}(mut {t}) {inits[t]})')
        if self.partial:
            self.exported = {self.nfuncs - 1} | {i for i in range(self.nfuncs - 1) if self.r.random() < 0.35}
        else:
            self.exported = set(range(self.nfuncs))
        for i in range(self.nfuncs):
            out.append(self.func(i))
        out.append(")")
        return "\n".join(out)


def main():
    seed = int(sys.argv[1])
    floats = len(sys.argv) > 2 and sys.argv[2] == "f"
    straight = len(sys.argv) > 2 and sys.argv[2] == "s"
    r = random.Random(seed)
    g = Gen(r, floats, mem=r.random() < 0.8, nfuncs=r.randrange(2, 7), straight=straight)
    g.partial = not straight and r.random() < 0.5
    out = sys.argv[3]
    with open(out + ".wat", "w") as f:
        f.write(g.module())
    import json
    sigs = {f"f{i}": ps for i, ps, _ in g.sigs if i in g.exported}
    if len(sys.argv) > 2 and sys.argv[2] == "l":
        # after --legalize-js-interface each i64 param is two i32 halves
        sigs = {k: [t for p in v for t in (["i32", "i32"] if p == "i64" else [p])] for k, v in sigs.items()}
    with open(out + ".sig.json", "w") as f:
        json.dump(sigs, f)


if __name__ == "__main__":
    main()
