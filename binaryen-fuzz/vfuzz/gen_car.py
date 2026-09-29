#!/usr/bin/env python3
"""gen_ca.py plus nullable struct references, so ConstraintAnalysis also sees
ref.is_null / ref.eq / br_on_null / br_on_non_null constraints. A wrongly
proven nullness shows up as a removed or added trap (ref.as_non_null,
struct.get) or as a different accumulator.

usage: gen_car.py SEED OUTPREFIX
"""
import json
import random
import sys

from gen_ca import G

REF = "(ref null $s)"


class GR(G):
    def rget(self, v=None):
        return f"(local.get {v or self.r.choice(self.rvars)})"

    def rval(self, d=0):
        r = self.r
        k = r.random()
        if k < 0.25:
            return "(ref.null $s)"
        if k < 0.50:
            return f"(struct.new $s {self.val('i32')})"
        if k < 0.70:
            return self.rget()
        if k < 0.80 and d < 2:
            return f"(select (result {REF}) {self.rval(d+1)} {self.rval(d+1)} {self.cond()})"
        if k < 0.83:
            return f"(ref.as_non_null {self.rget()})"
        if d < 2:
            return f"(local.tee {r.choice(self.rvars)} {self.rval(d+1)})"
        return "(ref.null $s)"

    def rterm(self):
        r = self.r
        if r.random() < 0.7:
            return self.rget()
        v = r.choice(self.rvars)
        return f"(local.tee {v} {self.rval(1)})"

    def cond(self, d=0):
        r = self.r
        if r.random() < 0.4:
            k = r.random()
            if k < 0.45:
                return f"(ref.is_null {self.rterm()})"
            if k < 0.70:
                return f"(ref.eq {self.rterm()} {self.rterm() if r.random() < 0.7 else '(ref.null $s)'})"
            if k < 0.85:
                return f"(i32.eqz (ref.is_null {self.rterm()}))"
            return f"(i32.and (ref.is_null {self.rterm()}) {super().cond(d+1)})"
        return super().cond(d)

    def record(self):
        r = self.r
        k = r.random()
        if k < 0.3:
            x = f"(ref.is_null {self.rget()})"
        elif k < 0.36:
            x = f"(struct.get $s 0 {self.rget()})"
        else:
            return super().record()
        return f"(local.set $acc (i32.add (i32.mul (local.get $acc) (i32.const 31)) {x}))"

    def stmt(self, d):
        r = self.r
        k = r.random()
        if k < 0.15:
            return f"(local.set {r.choice(self.rvars)} {self.rval()})"
        if k < 0.22 and d < 4:
            self.nl += 1
            lab = f"$b{self.nl}"
            return (f"(block {lab} (br_on_null {lab} {self.rget()}) (drop) "
                    f"{self.stmts(d+1)})")
        if k < 0.28 and d < 4:
            self.nl += 1
            lab = f"$b{self.nl}"
            v = r.choice(self.rvars)
            return (f"(local.set {v} (block {lab} (result (ref $s)) (br_on_non_null {lab} {self.rget()}) "
                    f"{self.stmts(d+1)} (struct.new $s {self.val('i32')})))")
        return super().stmt(d)

    def func(self, i):
        self.rvars = [f"$r{j}" for j in range(self.r.randrange(1, 4))]
        f, ps = super().func(i)
        locs = " ".join(f"(local {v} {REF})" for v in self.rvars)
        f = f.replace("(local $acc i32)", locs + " (local $acc i32)", 1)
        return f, ps


def main():
    seed = int(sys.argv[1])
    out = sys.argv[2]
    r = random.Random(seed)
    g = GR(r, tee=r.random() < 0.5)
    fs, sigs = [], {}
    for i in range(r.randrange(2, 6)):
        f, ps = g.func(i)
        fs.append(f)
        sigs[f"f{i}"] = ps
    with open(out + ".wat", "w") as fh:
        fh.write("(module (type $s (struct (field (mut i32))))\n" + "\n".join(fs) + "\n)\n")
    with open(out + ".sig.json", "w") as fh:
        json.dump(sigs, fh)


if __name__ == "__main__":
    main()
