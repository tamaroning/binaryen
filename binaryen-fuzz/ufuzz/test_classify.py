#!/usr/bin/env python3
"""Tests for the finding classification in drive.py and the pass sampler.

  - counterexamples: cex_class (module-global-invariant passes -> cexsus, alignment-lowering alone ->
    cexknown, assumption flags -> cexsus, everything else -> cex), with the pass list taken from a
    real wasm-opt run
  - V8 differences: v8_check (engine limits -> v8-limit, assumption flags -> v8sus, NaN-observing
    modules -> v8nan, else v8diff)
  - the sampler: every pass reachable, fruitful passes more often, shape configs for a focus

usage: python3 test_classify.py
"""
import collections
import os
import random
import subprocess
import sys
import tempfile
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import cfg  # noqa: E402
import drive  # noqa: E402


class Stub(drive.Worker):
    def __init__(self, wd, res):
        self.wd, self.wid, self.r = wd, "t", random.Random(1)
        self.stats = {"oracle_b": {}, "v8_diffs": 0}
        self.res_v8 = res
        self.nbad = 0
        self.saved = []
        self.nan_mod = False

    def v8(self, cf, a, b):
        return self.res_v8

    def save_bad(self, kind, *a, **k):
        self.saved.append(kind)


class Classify(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.cf = cfg.load()
        cls.d = tempfile.mkdtemp()
        wat = cls.d + "/x.wat"
        with open(wat, "w") as fh:
            fh.write('(module (memory 1 1) (global $g (mut i32) (i32.const 0)) (func (export "f") (param i32) '
                     '(i32.store align=1 (local.get 0) (global.get $g))))')
        subprocess.run(["wasm-tools", "parse", wat, "-o", cls.d + "/x.wasm"], check=True)

    def ps(self, c):
        return drive.expanded_passes(self.cf, c, self.d + "/x.wasm")

    def test_alignment_lowering_known(self):
        c = ["--alignment-lowering"]
        self.assertEqual(drive.cex_class(c, self.ps(c))[0], "cexknown")

    def test_alignment_lowering_in_sequence_is_not_known(self):
        c = ["--alignment-lowering", "--vacuum"]
        self.assertEqual(drive.cex_class(c, self.ps(c))[0], "cex")

    def test_simplify_globals_suspect(self):
        for p in ("simplify-globals", "simplify-globals-optimizing", "propagate-globals-globally"):
            c = ["--" + p]
            self.assertEqual(drive.cex_class(c, self.ps(c))[0], "cexsus", p)

    def test_olevel_expands_to_module_fact_passes(self):
        c = ["-O1"]
        ps = self.ps(c)
        self.assertIn("simplify-globals", ps)
        self.assertEqual(drive.cex_class(c, ps)[0], "cexsus")

    def test_assume_flags_suspect(self):
        for fl in ("--low-memory-unused", "--closed-world", "--traps-never-happen", "--fast-math"):
            self.assertEqual(drive.cex_class([fl, "--vacuum"], ["vacuum"])[0], "cexsus", fl)

    def test_plain_pass_is_a_real_candidate(self):
        c = ["--optimize-instructions"]
        self.assertEqual(drive.cex_class(c, self.ps(c))[0], "cex")

    def test_lowering_suspect(self):
        self.assertEqual(drive.cex_class(["--i64-to-i32-lowering"], ["i64-to-i32-lowering"])[0], "cexsus")

    def v8(self, res, cfgs, nan=False):
        w = Stub(self.d, res)
        w.nan_mod = nan
        out = drive.Worker.v8_check(w, self.cf, "m", "s", " ".join(cfgs), None, "a", "b", "A")
        return out[0], w.saved

    def test_v8_same_and_limits(self):
        self.assertEqual(self.v8({"same": True}, ["--vacuum"])[0], "v8-same")
        self.assertEqual(self.v8({"same": False, "detail": "RangeError: array too large"}, ["--vacuum"]),
                         ("v8-limit", []))
        self.assertEqual(self.v8({"same": False, "detail": "Out of memory: wasm"}, ["--vacuum"]), ("v8-limit", []))

    def test_v8_assumption_flags(self):
        self.assertEqual(self.v8({"same": False, "detail": "f(1): ok:1 vs ok:2"}, ["--low-memory-unused", "--vacuum"]),
                         ("v8-diff-assumed", ["v8sus"]))
        self.assertEqual(self.v8({"same": False, "detail": "x"}, ["--closed-world", "--gsi"]),
                         ("v8-diff-assumed", ["v8sus"]))

    def test_v8_diff_and_nan(self):
        self.assertEqual(self.v8({"same": False, "detail": "x"}, ["--vacuum"]), ("v8-diff", ["v8diff"]))
        self.assertEqual(self.v8({"same": False, "detail": "x"}, ["--vacuum"], nan=True), ("v8-diff-nan", ["v8nan"]))

    def test_v8_hang_is_a_difference(self):
        # v8diff.js cuts calls off after 1.5 s: a trap that becomes a hang is reported
        wat = self.d + "/h.wat"
        with open(wat, "w") as fh:
            fh.write('(module (func (export "f") (param i32) (result i32) (unreachable)))')
        subprocess.run(["wasm-tools", "parse", wat, "-o", self.d + "/h1.wasm"], check=True)
        with open(wat, "w") as fh:
            fh.write('(module (func (export "f") (param i32) (result i32) (loop $l (br $l)) (i32.const 0)))')
        subprocess.run(["wasm-tools", "parse", wat, "-o", self.d + "/h2.wasm"], check=True)
        w = drive.Worker.__new__(drive.Worker)
        w.r = random.Random(3)
        res = drive.Worker.v8(w, self.cf, self.d + "/h1.wasm", self.d + "/h2.wasm")
        self.assertFalse(res.get("same", True), res)
        self.assertIn("hang", res.get("detail", ""))


class Sampler(unittest.TestCase):
    def test_distribution(self):
        r = random.Random(7)
        wts = drive.pass_weights()
        single = collections.Counter()
        kinds = collections.Counter()
        for _ in range(30000):
            c, kind = drive.pick_config(r, wts)
            kinds[kind] += 1
            if kind == "single":
                single[c[-1][2:]] += 1
        # broad: nearly every single pass is reached
        self.assertGreater(len(single), 0.9 * len(drive.SINGLE))
        # moderately biased: fruitful passes at most a few times as frequent as the others
        fr = [single[p] for p in drive.FRUITFUL if p in drive.SINGLE]
        ot = [single[p] for p in drive.SINGLE if p not in drive.FRUITFUL and p not in drive.NEEDS_CLOSED]
        ratio = (sum(fr) / len(fr)) / (sum(ot) / len(ot))
        self.assertTrue(1.5 < ratio < 4.5, ratio)
        for k in ("single", "seq", "olevel", "closed"):
            self.assertGreater(kinds[k], 500, k)

    def test_closed_world_passes_get_the_flag(self):
        for p in drive.NEEDS_CLOSED:
            self.assertIn("--closed-world", drive.pass_args(p))

    def test_olevels_with_closed_world(self):
        r = random.Random(3)
        seen = set()
        for _ in range(4000):
            c, kind = drive.pick_config(r, None)
            if "--closed-world" in c and any(re_o(x) for x in c):
                seen.add(tuple(c))
        self.assertTrue(any(c[1:] == ("-O3",) for c in seen), seen)

    def test_focus_hint(self):
        r = random.Random(5)
        got = collections.Counter()
        for _ in range(2000):
            c, kind = drive.pick_config(r, None, "sh_tinit", 0.3)
            got["--gsi" in c and "--closed-world" in c] += 1
        self.assertGreater(got[True], 200)


def re_o(x):
    return x in ("-O1", "-O2", "-O3", "-Os", "-O4", "-Oz")


if __name__ == "__main__":
    unittest.main(verbosity=2)
