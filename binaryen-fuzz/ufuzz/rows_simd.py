"""SIMD rows: one row per lane-wise / relaxed instruction (data-driven from
wmod.SIMD), v128 loads and stores (including lane forms and near-end
addresses), v128.const and the scalar results (extract_lane, bitmask,
all_true, any_true).  A v128 value never crosses a function boundary
(JavaScript cannot pass one), so functions observe vectors through scalar
results, memory and globals.

Feature tags: simd (everything else), relaxed (implementation-defined ops).
"""
from table import ROWS, Row, row
from wmod import RELAXED, SIMD, VMEM, N

LANES = {"i8x16": 16, "i16x8": 8, "i32x4": 4, "i64x2": 2, "f32x4": 4, "f64x2": 2}


def _simd_gen(op, nimm, ps, r):
    shape = op.split(".")[0]

    def gen(g, want, d):
        imms = []
        if nimm == 16:
            imms = [str(g.r.randrange(32)) for _ in range(16)]
        elif nimm == 1:
            imms = [str(g.r.randrange(LANES[shape]))]
        return N(op, imms, [g.expr(p, d + 1) for p in ps])
    return gen


for _op, (_ni, _ps, _r) in sorted(SIMD.items()):
    ROWS.append(Row(_op, "relaxed" if _op in RELAXED else "simd", .22 if _op in RELAXED else .3, _r,
                    _simd_gen(_op, _ni, _ps, _r)))


@row("v128.const", "simd", 3, "v128")
def _vconst(g, want, d):
    return g.vconst()


def _vmem_imms(g, op, kind, nat):
    k = g.pick_mem()
    if k is None:
        return None
    name, at = g.m.memories[k][0], g.m.memories[k][1]
    imms = [name] if len(g.m.memories) > 1 or g.r.random() < .5 else []
    off = g.r.choice([0, 0, 0, 1, 4, 8, 15, 16, 0xfff0, 0xfff8, 0xfffc, 0xffff, 0x10000, 0x7fffffff])
    if off:
        imms.append("offset=%d" % off)
    if g.r.random() < .35:
        a = nat
        while a > 1 and g.r.random() < .5:
            a //= 2
        imms.append("align=%d" % a)
    if "lane" in kind:
        w = nat * 8
        imms.append(str(g.r.randrange(128 // w)))
    return imms, at, name


def _vaddr(g, at, mem, d):
    """an address that is often within a few bytes of the end of the memory"""
    if g.r.random() < .3:
        sub = g.r.choice([1, 2, 4, 8, 15, 16, 17, 24])
        return N(at + ".sub", [], [N(at + ".mul", [], [N("memory.size", [mem]), N(at + ".const", ["65536"])]),
                                   N(at + ".const", [str(sub)])])
    return g.addr(at, d)


def _vmem_gen(op, kind, nat):
    def gen(g, want, d):
        x = _vmem_imms(g, op, kind, nat)
        if x is None:
            return None
        imms, at, mem = x
        kids = [_vaddr(g, at, mem, d)]
        if kind in ("store", "loadlane", "storelane"):
            kids.append(g.expr("v128", d + 1))
        n = N(op, imms, kids)
        return n
    return gen


for _op, (_kind, _nat) in sorted(VMEM.items()):
    ROWS.append(Row(_op, "simd", .35 if "lane" not in _op else .25, "void" if "store" in _kind else "v128",
                    _vmem_gen(_op, _kind, _nat)))


@row("relaxed twice", "relaxed", .6, "v128")
def _relaxed_twice(g, want, d):
    """the same relaxed operation twice on the same operands: the results are
    implementation-defined but must agree within one implementation"""
    from wmod import SIMD as S
    ops = sorted(o for o in RELAXED if S[o][2] == "v128")
    op = g.r.choice(ops)
    ni, ps, r = S[op]
    args = [g.expr(p, d + 1) for p in ps]
    a = N(op, [], args)
    b = N(op, [], [x.clone() for x in args])
    comb = g.r.choice(["v128.xor", "i32x4.sub", "i8x16.eq", "v128.and", "i64x2.eq"])
    return N(comb, [], [a, b])


@row("v128 shuffle/swizzle chain", "simd", .5, "v128")
def _vshuffle(g, want, d):
    inner = N("i8x16.shuffle", [str(g.r.randrange(32)) for _ in range(16)], [g.expr("v128", d + 1), g.expr("v128", d + 1)])
    return N("i8x16.swizzle", [], [inner, g.expr("v128", d + 1)])
