#!/usr/bin/env python3
"""Catalog of single statements, one per kind of observable effect, and the shared module
declarations they need.  Every statement is closed (no operands from outside) and leaves
the stack unchanged.  `$out` is a block label wrapped around the function body."""

DECLS = r"""
  (type $ft (func (result i32)))
  (type $vt (func))
  (type $S (sub (struct (field (mut i32)))))
  (type $S2 (sub $S (struct (field (mut i32)) (field (mut i32)))))
  (type $I (struct (field i32)))
  (type $A (array (mut i32)))
  (type $AI (array i32))
  (import "e" "f" (func $e (result i32)))
  (import "e" "g" (func $v))
  (memory $m 1 2)
  (memory $m2 1)
  (memory $sm 1 1 shared)
  (data $d "abcd")
  (data $da (i32.const 8) "xy")
  (table $t 4 8 funcref)
  (table $tr 2 2 (ref null $S))
  (table $t2 2 4 funcref)
  (type $AF (array (mut funcref)))
  (elem $el2 funcref (ref.func $h) (ref.null func))
  (elem $el func $h)
  (elem declare func $h)
  (tag $tg (param i32))
  (global $g (mut i32) (i32.const 0))
  (global $gi i32 (i32.const 1))
  (func $h (type $ft) (i32.const 1))
  (func $k_hang (loop $l (br $l)))
  (func $k_rec (call $k_rec))
  (func $k_trap (unreachable))
  (func $k_store (i32.store (i32.const 0) (i32.const 5)))
  (func $k_grow (drop (memory.grow (i32.const 1))))
  (func $k_gset (global.set $g (i32.const 3)))
  (func $k_throw (throw $tg (i32.const 7)))
  (func $k_pure (drop (i32.add (i32.const 1) (i32.const 2))))
  (func $k_bounded (local $i i32) (loop $l (br_if $l (i32.lt_u (local.tee $i (i32.add (local.get $i) (i32.const 1))) (i32.const 3)))))
  (func $k_rethang (return_call $k_hang))
  (func $k_ind (drop (call_indirect $t (type $ft) (i32.const 0))))
  (func $k_ref (drop (call_ref $ft (ref.func $h))))
  (func $k_chain_hang (call $k_hang))
  (func $k_chain_trap (call $k_trap))
  (func $k_chain_pure (call $k_pure))
"""

# name -> statement
CAT = {
    "nop": "(nop)",
    "pure": "(drop (i32.add (i32.const 1) (i32.const 2)))",
    # locals
    "lget": "(drop (local.get $x))",
    "lset": "(local.set $x (i32.const 1))",
    # memory 0
    "load": "(drop (i32.load (i32.const 0)))",
    "load_off": "(drop (i32.load offset=4 (i32.const 0)))",
    "load_edge": "(drop (i32.load (i32.const 65534)))",
    "load8": "(drop (i32.load8_u (i32.const 1)))",
    "load64": "(drop (i64.load (i32.const 0)))",
    "load_m2": "(drop (i32.load $m2 (i32.const 0)))",
    "store": "(i32.store (i32.const 0) (i32.const 7))",
    "store_off": "(i32.store offset=4 (i32.const 0) (i32.const 7))",
    "store_edge": "(i32.store (i32.const 65534) (i32.const 7))",
    "store8": "(i32.store8 (i32.const 1) (i32.const 7))",
    "store64": "(i64.store (i32.const 0) (i64.const 7))",
    "store_m2": "(i32.store $m2 (i32.const 0) (i32.const 7))",
    "mem_size": "(drop (memory.size))",
    "mem_size_m2": "(drop (memory.size $m2))",
    "mem_grow": "(drop (memory.grow (i32.const 1)))",
    "mem_grow0": "(drop (memory.grow (i32.const 0)))",
    "mem_grow_m2": "(drop (memory.grow $m2 (i32.const 1)))",
    "mem_fill": "(memory.fill (i32.const 0) (i32.const 1) (i32.const 4))",
    "mem_fill_oob": "(memory.fill (i32.const 65532) (i32.const 1) (i32.const 8))",
    "mem_copy": "(memory.copy (i32.const 0) (i32.const 4) (i32.const 4))",
    "mem_copy_oob": "(memory.copy (i32.const 65532) (i32.const 0) (i32.const 8))",
    "mem_copy_m2": "(memory.copy $m2 $m (i32.const 0) (i32.const 0) (i32.const 4))",
    "mem_init": "(memory.init $d (i32.const 0) (i32.const 0) (i32.const 4))",
    "mem_init_oob": "(memory.init $d (i32.const 65534) (i32.const 0) (i32.const 4))",
    "data_drop": "(data.drop $d)",
    "data_drop_da": "(data.drop $da)",
    "mem_init_da": "(memory.init $da (i32.const 0) (i32.const 0) (i32.const 1))",
    # atomics / shared memory
    "a_load": "(drop (i32.atomic.load (i32.const 0)))",
    "a_store": "(i32.atomic.store (i32.const 0) (i32.const 1))",
    "a_rmw": "(drop (i32.atomic.rmw.add (i32.const 0) (i32.const 1)))",
    "a_cmpxchg": "(drop (i32.atomic.rmw.cmpxchg (i32.const 0) (i32.const 0) (i32.const 1)))",
    "a_fence": "(atomic.fence)",
    "sm_load": "(drop (i32.load $sm (i32.const 0)))",
    "sm_store": "(i32.store $sm (i32.const 0) (i32.const 1))",
    "sm_a_rmw": "(drop (i32.atomic.rmw.add $sm (i32.const 0) (i32.const 1)))",
    # globals
    "gget": "(drop (global.get $g))",
    "gset": "(global.set $g (i32.const 1))",
    "gget_imm": "(drop (global.get $gi))",
    # tables
    "tget": "(drop (table.get $t (i32.const 0)))",
    "tget_oob": "(drop (table.get $t (i32.const 100)))",
    "tset": "(table.set $t (i32.const 0) (ref.func $h))",
    "tset_null": "(table.set $t (i32.const 0) (ref.null func))",
    "tsize": "(drop (table.size $t))",
    "tgrow": "(drop (table.grow $t (ref.null func) (i32.const 1)))",
    "tfill": "(table.fill $t (i32.const 0) (ref.func $h) (i32.const 2))",
    "tfill_oob": "(table.fill $t (i32.const 3) (ref.func $h) (i32.const 4))",
    "tcopy": "(table.copy $t $t (i32.const 0) (i32.const 1) (i32.const 2))",
    "tinit": "(table.init $t $el (i32.const 0) (i32.const 0) (i32.const 1))",
    "elem_drop": "(elem.drop $el)",
    "call_ind": "(drop (call_indirect $t (type $ft) (i32.const 0)))",
    "tr_get": "(drop (table.get $tr (i32.const 0)))",
    "tr_set": "(table.set $tr (i32.const 0) (ref.null $S))",
    "tr_grow": "(drop (table.grow $tr (ref.null $S) (i32.const 1)))",
    # calls
    "call_e": "(drop (call $e))",
    "call_v": "(call $v)",
    "call_h": "(drop (call $h))",
    "call_ref": "(drop (call_ref $ft (ref.func $h)))",
    # GC: structs
    "s_new": "(drop (struct.new $S (i32.const 1)))",
    "s_set": "(struct.set $S 0 (local.get $os) (i32.const 5))",
    "s_get": "(drop (struct.get $S 0 (local.get $os)))",
    "i_get": "(drop (struct.get $I 0 (local.get $oi)))",
    "s_get_null": "(drop (struct.get $S 0 (local.get $nl)))",
    "s_set_null": "(struct.set $S 0 (local.get $nl) (i32.const 1))",
    "s_eq": "(drop (ref.eq (struct.new $S (i32.const 1)) (struct.new $S (i32.const 1))))",
    "s_cast": "(drop (ref.cast (ref $S) (local.get $os)))",
    "s_cast_fail": "(drop (ref.cast (ref $S2) (local.get $os)))",
    "s_test": "(drop (ref.test (ref $S2) (local.get $os)))",
    "as_nonnull_null": "(drop (ref.as_non_null (local.get $nl)))",
    # GC: arrays
    "a_new": "(drop (array.new $A (i32.const 1) (i32.const 4)))",
    "a_get": "(drop (array.get $A (local.get $oa) (i32.const 0)))",
    "a_get_oob": "(drop (array.get $A (local.get $oa) (i32.const 9)))",
    "a_set": "(array.set $A (local.get $oa) (i32.const 0) (i32.const 3))",
    "a_set_oob": "(array.set $A (local.get $oa) (i32.const 9) (i32.const 3))",
    "ai_get": "(drop (array.get $AI (local.get $oai) (i32.const 0)))",
    "a_len": "(drop (array.len (local.get $oa)))",
    "a_fill": "(array.fill $A (local.get $oa) (i32.const 0) (i32.const 1) (i32.const 4))",
    "a_fill_oob": "(array.fill $A (local.get $oa) (i32.const 2) (i32.const 1) (i32.const 4))",
    "a_copy": "(array.copy $A $A (local.get $oa) (i32.const 0) (local.get $oa) (i32.const 1) (i32.const 2))",
    "a_copy_oob": "(array.copy $A $A (local.get $oa) (i32.const 3) (local.get $oa) (i32.const 0) (i32.const 4))",
    "a_init_data": "(array.init_data $A $d (local.get $oa) (i32.const 0) (i32.const 0) (i32.const 1))",
    "a_new_data": "(drop (array.new_data $A $d (i32.const 0) (i32.const 1)))",
    # more tables / calls
    "t2_get": "(drop (table.get $t2 (i32.const 0)))",
    "t2_set": "(table.set $t2 (i32.const 0) (ref.func $h))",
    "t2_size": "(drop (table.size $t2))",
    "t2_grow": "(drop (table.grow $t2 (ref.null func) (i32.const 1)))",
    "t_copy_t2": "(table.copy $t2 $t (i32.const 0) (i32.const 0) (i32.const 1))",
    "call_ind_oob": "(drop (call_indirect $t (type $ft) (i32.const 100)))",
    "call_ind_t2": "(drop (call_indirect $t2 (type $ft) (i32.const 0)))",
    "call_ref_null": "(drop (call_ref $ft (ref.null $ft)))",
    "call_try": "(block $b3 (try_table (catch_all $b3) (drop (call $e))))",
    # more GC
    "af_new_elem": "(drop (array.new_elem $AF $el2 (i32.const 0) (i32.const 1)))",
    "af_new_elem_oob": "(drop (array.new_elem $AF $el2 (i32.const 1) (i32.const 4)))",
    "af_new_fixed": "(drop (array.new_fixed $A 2 (i32.const 1) (i32.const 2)))",
    "s_new_default": "(drop (struct.new_default $S))",
    "s2_get_cast": "(drop (struct.get $S2 1 (ref.cast (ref $S2) (local.get $os))))",
    "lset_ref": "(local.set $nl (local.get $os))",
    "i31_new": "(drop (ref.i31 (i32.const 1)))",
    "i31_get": "(drop (i31.get_s (ref.i31 (i32.const 1))))",
    "i31_get_null": "(drop (i31.get_s (ref.null i31)))",
    "br_on_null": "(drop (br_on_null $out (local.get $nl)))",
    # atomics extra, simd, float
    "a_notify": "(drop (memory.atomic.notify $sm (i32.const 0) (i32.const 1)))",
    "a_wait": "(drop (memory.atomic.wait32 $sm (i32.const 0) (i32.const 1) (i64.const 0)))",
    "v_load": "(drop (v128.load (i32.const 0)))",
    "v_store": "(v128.store (i32.const 0) (v128.const i32x4 1 2 3 4))",
    "v_store_edge": "(v128.store (i32.const 65530) (v128.const i32x4 1 2 3 4))",
    "f_add": "(drop (f32.add (f32.const nan) (f32.const 1)))",
    # callees (global effects mode compares call effects with the callee's)
    "cf_hang": "(call $k_hang)",
    "cf_rec": "(call $k_rec)",
    "cf_trap": "(call $k_trap)",
    "cf_store": "(call $k_store)",
    "cf_grow": "(call $k_grow)",
    "cf_gset": "(call $k_gset)",
    "cf_throw": "(block $b5 (try_table (catch_all $b5) (call $k_throw)))",
    "cf_pure": "(call $k_pure)",
    "cf_bounded": "(call $k_bounded)",
    "cf_rethang": "(call $k_rethang)",
    "cf_ind": "(call $k_ind)",
    "cf_ref": "(call $k_ref)",
    "cf_chain_hang": "(call $k_chain_hang)",
    "cf_chain_trap": "(call $k_chain_trap)",
    "cf_chain_pure": "(call $k_chain_pure)",
    # more non-termination shapes
    "hang_if": "(loop $l (if (i32.const 1) (then (br $l))))",
    "hang_table": "(loop $l (br_table $l $l (i32.const 0)))",
    "hang_nested": "(block $nb (loop $l (block $m (br $l))))",
    "hang_mem": "(loop $l (br_if $l (i32.load (i32.const 0))))",
    "bounded": "(block $o2 (local.set $x (i32.const 0)) (loop $l (br_if $l (i32.lt_u (local.tee $x (i32.add (local.get $x) (i32.const 1))) (i32.const 3)))))",
    # exceptions
    "throw": "(throw $tg (i32.const 1))",
    "try_catch": "(block $b (try_table (catch_all $b) (throw $tg (i32.const 1))))",
    "try_catch_store": "(block $b4 (try_table (catch_all $b4) (i32.store (i32.const 0) (i32.const 9)) (throw $tg (i32.const 1))))",
    "try_catch_set": "(block $b2 (try_table (catch_all $b2) (global.set $g (i32.const 4)) (throw $tg (i32.const 1))))",
    # traps and non-termination
    "trap": "(unreachable)",
    "div0": "(drop (i32.div_u (i32.const 1) (i32.const 0)))",
    "trunc": "(drop (i32.trunc_f32_s (f32.const nan)))",
    "hang": "(loop $l (br $l))",
    "hang_cond": "(block $o (loop $l (br_if $l (global.get $g))))",
    # control transfer
    "ret": "(return)",
    "br_out": "(br $out)",
    "br_if_out": "(br_if $out (global.get $g))",
}
