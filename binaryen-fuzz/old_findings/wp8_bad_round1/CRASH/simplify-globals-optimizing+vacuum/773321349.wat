(module
 (type $0 (sub (func (result (ref i31)))))
 (type $1 (func (param v128 f64)))
 (type $2 (struct (field arrayref) (field (mut f32)) (field (mut (ref $1)))))
 (type $3 (struct (field (ref $0)) (field (ref $2)) (field f32) (field (mut i32)) (field f32)))
 (type $4 (array i8))
 (type $5 (func))
 (type $6 (struct))
 (type $7 (func (param i32)))
 (type $8 (func (param f64 v128 (ref array)) (result i32)))
 (type $9 (func (result i64 v128 (ref (exact $4)))))
 (type $10 (func (result (ref (exact $3)) (ref (exact $0)))))
 (type $11 (func (result i32)))
 (type $12 (func (param i64)))
 (type $13 (func (param f64)))
 (type $14 (func (param externref)))
 (type $15 (func (result (ref null $3) (ref null $0))))
 (type $16 (func (param f32)))
 (type $17 (func (param v128)))
 (type $18 (func (param anyref)))
 (type $19 (func (param funcref)))
 (type $20 (func (param i64 i32 (ref $3) f64) (result i64 v128 arrayref)))
 (type $21 (func (param i32) (result i31ref)))
 (type $22 (func (param funcref stringref) (result i64 (ref null $2))))
 (type $23 (func (param (ref $2) (ref $2)) (result i32 i64 f64 (ref null $1))))
 (type $24 (array (mut i16)))
 (type $25 (func (param (ref struct) i32) (result (ref null $2))))
 (type $26 (func (param anyref f64) (result structref)))
 (type $27 (func (param f32 i32 (ref null $1)) (result (ref struct))))
 (type $28 (func (param exnref i64 f32) (result (ref null $3))))
 (type $29 (func (param i32 (ref $2)) (result (ref $0))))
 (type $30 (func (param (ref string) f32 i64 exnref)))
 (type $31 (func (result (ref $1))))
 (type $32 (func (param (ref null $3) f64 i64 (ref eq)) (result (ref $1))))
 (type $33 (func (param f64 f64 f32 i64) (result funcref)))
 (type $34 (func (param (ref $0) i31ref arrayref) (result v128)))
 (type $35 (func (param exnref f32 (ref null $0) (ref null $2)) (result i64 i64)))
 (type $36 (func (param (ref eq) i64 (ref $0) funcref (ref null $2) (ref eq)) (result (ref null $0))))
 (type $37 (func (param f32) (result f32)))
 (type $38 (func (param f64) (result f64)))
 (type $39 (func (param v128) (result v128)))
 (type $40 (func (result i64 v128 arrayref)))
 (type $41 (func (result i64 (ref null $2))))
 (type $42 (func (result i32 i64 f64 (ref null $1))))
 (type $43 (func (result i64 i64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $7) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $7) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $16) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $13) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $17) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $18) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $19) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $14) (param externref)))
 (global $global$0 (mut i64) (i64.const 64))
 (global $global$1 (mut i64) (i64.const 255))
 (global $global$2 (mut v128) (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$3 structref (struct.new_default $6))
 (global $global$4 f32 (f32.const 4294967296))
 (global $global$5 (ref null $3) (struct.new $3
  (ref.func $0)
  (struct.new $2
   (array.new_fixed $4 0)
   (f32.const 65502)
   (ref.func $1)
  )
  (f32.const -140737488355328)
  (i32.const -95)
  (f32.const -1099511627776)
 ))
 (global $global$6 (mut exnref) (ref.null noexn))
 (global $global$7 f64 (f64.const -88))
 (global $global$8 eqref (array.new_fixed $4 0))
 (global $global$9 eqref (ref.null none))
 (global $global$10 arrayref (array.new_fixed $4 0))
 (global $global$11 v128 (v128.const i32x4 0x8ba55cff 0xcef18673 0x7e250801 0xc7023980))
 (global $global$12 (mut i32) (i32.const 12))
 (global $global$13 i64 (i64.const 2147483647))
 (global $global$14 i64 (i64.const 32767))
 (global $global$15 (ref null $3) (ref.null none))
 (global $global$16 f64 (f64.const 4294967197))
 (global $global$17 f32 (f32.const 0))
 (global $global$18 (ref null $2) (struct.new $2
  (array.new_fixed $4 0)
  (f32.const 90)
  (ref.func $1)
 ))
 (global $global$19 (mut f32) (global.get $global$17))
 (global $global$20 v128 (v128.const i32x4 0x00000000 0x40652000 0x45200000 0x41effffb))
 (global $global$21 f32 (f32.const 0))
 (global $global$22 (ref null $0) (ref.func $0))
 (global $global$23 f32 (f32.const 117))
 (global $global$24 structref (struct.new_default $6))
 (global $global$25 (mut f64) (global.get $global$16))
 (global $global$26 (ref null $0) (ref.func $0))
 (global $global$27 i32 (i32.const -65))
 (global $global$28 (ref null $1) (ref.func $1))
 (global $global$29 eqref (ref.i31
  (i32.const -32767)
 ))
 (global $global$30 (ref null $2) (global.get $global$18))
 (global $global$31 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 "\f0\89\cf\96@\8c\b7\85\1a\97P/QL")
 (data $1 "x9\ed\177\19}\ee\ba@G\07\de\82+\denN\c8")
 (data $2 (i64.const 0) "j|4S\e0\a4\d31[b\e2\8b(\ea\8a\b8&}\14\b6M\b7\0f\ed\b5A\e6")
 (data $3 (i64.const 27) "m\e4\daN\c9\ff\1c\87\d3|\ea\11\0b\93/A\9f\d6\a0}[\fc")
 (table $0 8 8 funcref)
 (table $1 2 exnref)
 (elem $0 (table $0) (i32.const 0) func $4 $9 $28 $28 $28 $31 $44)
 (elem declare func $0 $1 $12 $14 $15 $19 $2 $20 $22 $24 $26 $3 $35 $36 $40 $6 $fimport$1 $fimport$4 $fimport$7 $fimport$8)
 (tag $tag$0 (type $12) (param i64))
 (tag $tag$1 (type $5))
 (export "global$_1" (global $global$2))
 (export "global$_3" (global $global$5))
 (export "global$_6" (global $global$12))
 (export "global$_8" (global $global$15))
 (export "global$_10" (global $global$17))
 (export "global$_12" (global $global$19))
 (export "global$_18" (global $global$30))
 (export "ref_func_target_invoker" (func $2))
 (export "ref_func_target_1_invoker" (func $3))
 (export "func_invoker" (func $5))
 (export "func_15" (func $6))
 (export "func_15_invoker" (func $7))
 (export "func_18_invoker" (func $10))
 (export "func_20" (func $11))
 (export "func_20_invoker" (func $12))
 (export "func_22_invoker" (func $14))
 (export "func_24" (func $15))
 (export "func_26" (func $17))
 (export "func_27" (func $18))
 (export "func_27_invoker" (func $19))
 (export "func_29" (func $20))
 (export "func_29_invoker" (func $21))
 (export "func_31" (func $22))
 (export "func_33_invoker" (func $25))
 (export "func_35" (func $26))
 (export "func_35_invoker" (func $27))
 (export "func_37_invoker" (func $29))
 (export "func_40" (func $31))
 (export "func_40_invoker" (func $32))
 (export "func_42_invoker" (func $34))
 (export "func_45" (func $36))
 (export "func_45_invoker" (func $37))
 (export "func_47" (func $38))
 (export "func_47_invoker" (func $39))
 (export "func_49_invoker" (func $41))
 (export "func_53_invoker" (func $45))
 (export "func_55_invoker" (func $47))
 (func $0 (type $0) (result (ref i31))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $1) (param $0 v128) (param $1 f64)
  (local.set $0
   (call $51
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $2 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $0)
  )
  (drop
   (call $0)
  )
  (drop
   (call $0)
  )
 )
 (func $3 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $1
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const -2251799813685248.5)
  )
  (call $1
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const -33)
  )
 )
 (func $4 (type $8) (param $0 f64) (param $1 v128) (param $2 (ref array)) (result i32)
  (local $3 i64)
  (local $4 f32)
  (local $5 (ref string))
  (local.set $0
   (call $50
    (local.get $0)
   )
  )
  (local.set $1
   (call $51
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (ref.eq
   (array.new_fixed $4 0)
   (ref.i31
    (i32.const 257572444)
   )
  )
 )
 (func $5 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $4
    (f64.const 1797693134862315708145274e284)
    (v128.const i32x4 0x006b0067 0xb9010200 0x9d45ff01 0x80fe00e9)
    (array.new_fixed $4 0)
   )
  )
 )
 (func $6 (type $11) (result i32)
  (local $0 f32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (i32.const -2147483648)
  )
 )
 (func $7 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
 )
 (func $8 (type $20) (param $0 i64) (param $1 i32) (param $2 (ref $3)) (param $3 f64) (result i64 v128 arrayref)
  (local $4 exnref)
  (local $5 (ref null $0))
  (local $6 (ref null $0))
  (local $7 funcref)
  (local $8 (ref null $2))
  (local $9 (ref null $3))
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (local $14 f64)
  (local.set $3
   (call $50
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (block (type $9) (result i64 v128 (ref (exact $4)))
   (nop)
   (try (type $9) (result i64 v128 (ref (exact $4)))
    (do
     (if (type $9) (result i64 v128 (ref (exact $4)))
      (i32.load16_s offset=22 align=1
       (i64.and
        (local.get $0)
        (i64.const 15)
       )
      )
      (then
       (tuple.make 3
        (i64.const -32767)
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (array.new_fixed $4 0)
       )
      )
      (else
       (if
        (i32.eqz
         (global.get $global$31)
        )
        (then
         (global.set $global$31
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$31
        (i32.sub
         (global.get $global$31)
         (i32.const 1)
        )
       )
       (call_ref $5
        (ref.func $3)
       )
       (nop)
       (call $fimport$3
        (f32.const -513)
       )
       (return
        (tuple.make 3
         (i64.const 65527)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (array.new_fixed $4 0)
        )
       )
      )
     )
    )
    (catch_all
     (tuple.make 3
      (i64.const -11)
      (v128.const i32x4 0x713b2b46 0xe5000004 0x7f000100 0x0dae3900)
      (array.new_fixed $4 0)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $9 (type $21) (param $0 i32) (result i31ref)
  (local $1 arrayref)
  (local $2 (ref null $3))
  (local $3 funcref)
  (local $4 (ref null $2))
  (local $5 anyref)
  (local $6 anyref)
  (local $7 (ref null $0))
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref null $0))
  (local $11 (ref null $0))
  (local $12 f64)
  (local $13 f32)
  (local $14 f32)
  (local $15 v128)
  (local $16 v128)
  (local $17 i64)
  (local $18 i64)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (ref.i31
    (i32.const -2147483648)
   )
  )
 )
 (func $10 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $9
    (i32.const -127)
   )
  )
  (drop
   (call $9
    (i32.const 4096)
   )
  )
 )
 (func $11 (type $22) (param $0 funcref) (param $1 stringref) (result i64 (ref null $2))
  (local $2 (ref $3))
  (local $3 funcref)
  (local $4 stringref)
  (local $5 (ref null $2))
  (local $6 (ref null $1))
  (local $7 (ref null $3))
  (local $8 structref)
  (local $9 (ref null $0))
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 f64)
  (local $15 i32)
  (local $16 i32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const -262143)
   (struct.new $2
    (array.new_fixed $4 0)
    (f32.const 4294967296)
    (ref.func $1)
   )
  )
 )
 (func $12 (type $5)
  (local $scratch (tuple i64 (ref null $2)))
  (local $scratch_1 i64)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $11
        (ref.func $12)
        (string.const "\f0\90\8d\88\e2\82\ac")
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch)
     )
    )
    (local.get $scratch_1)
   )
  )
 )
 (func $13 (type $23) (param $0 (ref $2)) (param $1 (ref $2)) (result i32 i64 f64 (ref null $1))
  (local $2 (ref $3))
  (local $3 (ref $3))
  (local $4 (ref $2))
  (local $5 (ref null $0))
  (local $6 (ref null $0))
  (local $7 (ref null $1))
  (local $8 stringref)
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 (ref null $2))
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 f32)
  (local $21 f64)
  (local $22 v128)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $10
   (string.const "\ed\bd\88")
  )
  (local.set $4
   (struct.new $2
    (array.new_fixed $4 0)
    (call $49
     (global.get $global$17)
    )
    (ref.func $1)
   )
  )
  (local.set $2
   (struct.new $3
    (ref.func $0)
    (struct.new $2
     (ref.null none)
     (f32.const 9223372036854775808)
     (ref.func $1)
    )
    (local.get $20)
    (global.get $global$12)
    (local.get $20)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$31)
    )
    (then
     (global.set $global$31
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$31
    (i32.sub
     (global.get $global$31)
     (i32.const 1)
    )
   )
   (nop)
   (nop)
   (atomic.fence acqrel)
   (br_if $label
    (i32.eqz
     (i8x16.extract_lane_s 12
      (call $51
       (global.get $global$2)
      )
     )
    )
   )
   (if
    (call_indirect $0 (type $8)
     (call $50
      (f64.load offset=22 align=4
       (i64.and
        (i64.div_u
         (block (result i64)
          (nop)
          (i64.const -163022555)
         )
         (i64.const -960)
        )
        (i64.const 15)
       )
      )
     )
     (call $51
      (global.get $global$2)
     )
     (array.new_fixed $4 0)
     (i32.const 0)
    )
    (then
     (nop)
    )
    (else
     (if
      (i32.eqz
       (block (result i32)
        (nop)
        (struct.get $3 3
         (struct.new $3
          (ref.func $0)
          (local.get $0)
          (f32.const 4294967296)
          (i32.const 78)
          (call $49
           (f32.neg
            (try (result f32)
             (do
              (f32.const 8796093022208)
             )
             (catch_all
              (local.tee $20
               (local.get $20)
              )
             )
            )
           )
          )
         )
        )
       )
      )
      (then
       (block $block
        (atomic.fence)
        (call_ref $5
         (ref.func $2)
        )
        (atomic.fence)
        (block $block1
         (try
          (do
           (loop
            (if
             (i32.eqz
              (global.get $global$31)
             )
             (then
              (global.set $global$31
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$31
             (i32.sub
              (global.get $global$31)
              (i32.const 1)
             )
            )
            (atomic.fence)
            (br $block)
           )
           (unreachable)
          )
          (catch $tag$0
           (drop (pop i64))
           (i64.atomic.store32 acqrel offset=3
            (i64.const -4194305)
            (i64.const -9223372036854775807)
           )
          )
          (catch_all
           (table.set $1
            (i32.const 0)
            (loop $label1 (result (ref exn))
             (if
              (i32.eqz
               (global.get $global$31)
              )
              (then
               (global.set $global$31
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$31
              (i32.sub
               (global.get $global$31)
               (i32.const 1)
              )
             )
             (nop)
             (drop
              (br_on_null $label1
               (struct.new $3
                (ref.as_non_null
                 (ref.null nofunc)
                )
                (local.get $0)
                (call $49
                 (f32.load offset=3
                  (i64.and
                   (i64.const -128)
                   (i64.const 15)
                  )
                 )
                )
                (i32.const 97)
                (try (result f32)
                 (do
                  (local.get $20)
                 )
                 (catch $tag$0
                  (local.set $16 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $16))))
                  (f32.const 9223372036854775808)
                 )
                )
               )
              )
             )
             (block
              (try_table (catch_all $label)
               (f32.store offset=3 align=1
                (i64.and
                 (i64.const -9223372036854775807)
                 (i64.const 15)
                )
                (local.get $20)
               )
              )
              (br $block1)
             )
             (unreachable)
            )
           )
          )
         )
        )
       )
      )
     )
    )
   )
  )
  (call $fimport$3
   (loop $label5 (result f32)
    (if
     (i32.eqz
      (global.get $global$31)
     )
     (then
      (global.set $global$31
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$31
     (i32.sub
      (global.get $global$31)
      (i32.const 1)
     )
    )
    (loop $label2
     (if
      (i32.eqz
       (global.get $global$31)
      )
      (then
       (global.set $global$31
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$31
      (i32.sub
       (global.get $global$31)
       (i32.const 1)
      )
     )
     (nop)
     (br_if $label2
      (i32.eqz
       (ref.is_null
        (ref.func $1)
       )
      )
     )
    )
    (call $fimport$2
     (select
      (i64.const -2147483649)
      (i64.const -24788)
      (call_ref $11
       (ref.func $6)
      )
     )
    )
    (block $block3
     (i32.atomic.store16 acqrel offset=3
      (i64.const -1707521488)
      (loop $label3 (result i32)
       (if
        (i32.eqz
         (global.get $global$31)
        )
        (then
         (global.set $global$31
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$31
        (i32.sub
         (global.get $global$31)
         (i32.const 1)
        )
       )
       (if
        (i32.eqz
         (local.tee $12
          (i64.ne
           (i64.const -316414408148)
           (i64.extend_i32_u
            (if (result i32)
             (i32.lt_u
              (block (result i32)
               (block
                (return
                 (tuple.make 4
                  (i32.const -1)
                  (i64.const -2251799813685248)
                  (f64.const -1)
                  (ref.func $24)
                 )
                )
               )
               (unreachable)
              )
              (local.get $12)
             )
             (then
              (return
               (tuple.make 4
                (i32.const 184)
                (i64.const 247)
                (f64.const 4290382189)
                (ref.func $24)
               )
              )
             )
             (else
              (string.compare
               (ref.as_non_null
                (local.get $8)
               )
               (ref.as_non_null
                (local.get $8)
               )
              )
             )
            )
           )
          )
         )
        )
        (then
         (block $block2
          (call $fimport$1
           (string.measure_wtf16
            (block (result (ref string))
             (br_if $block2
              (i32.eqz
               (i32.const -2048)
              )
             )
             (string.const "\ed\bd\88")
            )
           )
          )
          (if
           (i32.eqz
            (i31.get_s
             (ref.cast (ref i31)
              (ref.i31
               (i32.const 1025)
              )
             )
            )
           )
           (then
            (nop)
            (nop)
           )
          )
         )
        )
        (else
         (f32.store offset=22 align=2
          (i64.and
           (i64.load offset=4 align=4
            (i64.and
             (i64.const -359031366617)
             (i64.const 15)
            )
           )
           (i64.const 15)
          )
          (local.get $20)
         )
         (nop)
        )
       )
       (call $fimport$0
        (i32.const -17)
       )
       (br_if $label3
        (call_ref $11
         (ref.func $6)
        )
       )
       (try (result i32)
        (do
         (global.get $global$12)
        )
        (catch $tag$0
         (drop (pop i64))
         (try (result i32)
          (do
           (ref.eq
            (ref.null none)
            (ref.null none)
           )
          )
          (catch $tag$0
           (local.set $18 (call $__popsink_0 (pop i64)))
           (if (result i32)
            (i32.const 26208)
            (then
             (f64.store offset=4
              (i64.and
               (i64.extend8_s
                (local.get $19)
               )
               (i64.const 15)
              )
              (f64.const 1797693134862315708145274e284)
             )
             (f64.ge
              (local.get $21)
              (f64.const 4294967240)
             )
            )
            (else
             (br $block3)
            )
           )
          )
          (catch_all
           (loop $label4 (result i32)
            (if
             (i32.eqz
              (global.get $global$31)
             )
             (then
              (global.set $global$31
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$31
             (i32.sub
              (global.get $global$31)
              (i32.const 1)
             )
            )
            (local.set $21
             (f64.const 65460)
            )
            (nop)
            (br_if $label4
             (i32.eqz
              (local.get $12)
             )
            )
            (i32x4.extract_lane 1
             (local.tee $22
              (local.get $22)
             )
            )
           )
          )
         )
        )
        (catch_all
         (local.get $12)
        )
       )
      )
     )
     (call $fimport$0
      (i32.const -5516)
     )
    )
    (br_if $label5
     (i32.eqz
      (i32.const -14)
     )
    )
    (call $49
     (global.get $global$19)
    )
   )
  )
  (drop
   (local.get $10)
  )
  (drop
   (array.new_default $24
    (i32.and
     (i32.const 89)
     (i32.const 1023)
    )
   )
  )
  (if
   (i32.eqz
    (ref.eq
     (struct.new_default $6)
     (ref.i31
      (i32.const -1834491)
     )
    )
   )
   (then
    (nop)
    (return
     (tuple.make 4
      (i32.const -1)
      (i64.const 62043)
      (f64.const 1)
      (ref.func $1)
     )
    )
   )
   (else
    (try
     (do
      (if
       (loop $label6 (result i32)
        (if
         (i32.eqz
          (global.get $global$31)
         )
         (then
          (global.set $global$31
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$31
         (i32.sub
          (global.get $global$31)
          (i32.const 1)
         )
        )
        (local.set $22
         (local.get $22)
        )
        (br_if $label6
         (i32.eqz
          (local.get $12)
         )
        )
        (i32.load8_s offset=22
         (i64.and
          (i64.load16_u offset=4
           (i64.and
            (i64.const 0)
            (i64.const 15)
           )
          )
          (i64.const 15)
         )
        )
       )
       (then
        (nop)
        (return
         (tuple.make 4
          (i32.const 78)
          (i64.const -2147483648)
          (f64.const -562949953421313)
          (ref.func $1)
         )
        )
       )
       (else
        (local.set $9
         (ref.as_non_null
          (local.tee $8
           (string.const "")
          )
         )
        )
        (return
         (tuple.make 4
          (global.get $global$12)
          (local.tee $18
           (i64.atomic.load8_u acqrel offset=22
            (i64.and
             (block $block4 (result i64)
              (try_table (catch $tag$0 $block4) (catch $tag$0 $block4)
               (call $fimport$8
                (string.const "\ed\bd\88")
               )
              )
              (local.get $18)
             )
             (i64.const 15)
            )
           )
          )
          (local.get $21)
          (ref.null nofunc)
         )
        )
       )
      )
      (unreachable)
     )
     (catch_all
      (nop)
     )
    )
    (return
     (tuple.make 4
      (i32.const 128)
      (i64.const -105)
      (f64.const 17522)
      (ref.func $1)
     )
    )
   )
  )
  (unreachable)
 )
 (func $14 (type $5)
  (local $0 f32)
  (local $1 v128)
  (local $2 v128)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 (ref null $3))
  (local $13 (ref null $3))
  (local $14 (ref array))
  (local $15 (ref array))
  (local $16 (ref string))
  (local $17 (ref $1))
  (local $18 (ref $2))
  (local $19 nullref)
  (local $scratch (tuple i32 i64 f64 (ref null $1)))
  (local $scratch_21 f64)
  (local $scratch_22 i64)
  (local $scratch_23 i32)
  (local $scratch_24 (tuple i32 i64 f64 (ref null $1)))
  (local $scratch_25 f64)
  (local $scratch_26 i64)
  (local $scratch_27 i32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $18
   (struct.new $2
    (ref.null none)
    (call $49
     (global.get $global$19)
    )
    (ref.func $1)
   )
  )
  (local.set $17
   (ref.func $1)
  )
  (local.set $15
   (array.new_fixed $4 0)
  )
  (drop
   (block (result i32)
    (local.set $scratch_23
     (tuple.extract 4 0
      (local.tee $scratch
       (call $13
        (struct.new $2
         (array.new_fixed $4 0)
         (f32.const 2)
         (ref.func $1)
        )
        (struct.new $2
         (block (result (ref (exact $4)))
          (drop
           (ref.func $14)
          )
          (array.new_fixed $4 0)
         )
         (call $49
          (global.get $global$17)
         )
         (ref.func $1)
        )
       )
      )
     )
    )
    (drop
     (block (result i64)
      (local.set $scratch_22
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result f64)
        (local.set $scratch_21
         (tuple.extract 4 2
          (local.get $scratch)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch)
         )
        )
        (local.get $scratch_21)
       )
      )
      (local.get $scratch_22)
     )
    )
    (local.get $scratch_23)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_27
     (tuple.extract 4 0
      (local.tee $scratch_24
       (call $13
        (struct.new $2
         (array.new_fixed $4 0)
         (f32.const 16383)
         (ref.func $1)
        )
        (struct.new $2
         (array.new_fixed $4 0)
         (f32.const -99)
         (ref.func $1)
        )
       )
      )
     )
    )
    (drop
     (block (result i64)
      (local.set $scratch_26
       (tuple.extract 4 1
        (local.get $scratch_24)
       )
      )
      (drop
       (block (result f64)
        (local.set $scratch_25
         (tuple.extract 4 2
          (local.get $scratch_24)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_24)
         )
        )
        (local.get $scratch_25)
       )
      )
      (local.get $scratch_26)
     )
    )
    (local.get $scratch_27)
   )
  )
  (drop
   (struct.new $2
    (array.new_fixed $4 0)
    (local.get $0)
    (ref.func $1)
   )
  )
  (block
   (nop)
   (return)
  )
  (local.set $15
   (local.set $17
    (local.set $17
     (local.set $15
      (local.set $18
       (local.set $17
        (local.set $18
         (local.set $17
          (local.set $16
           (local.set $14
            (local.set $15
             (unreachable)
            )
           )
          )
         )
        )
       )
      )
     )
    )
   )
  )
 )
 (func $15 (type $0) (result (ref i31))
  (local $0 (ref null $0))
  (local $1 (ref $1))
  (local $2 i32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (block (result (ref i31))
   (call $fimport$6
    (ref.i31
     (i32.const -79)
    )
   )
   (ref.i31
    (local.get $2)
   )
  )
 )
 (func $16 (type $25) (param $0 (ref struct)) (param $1 i32) (result (ref null $2))
  (local $2 (ref null $0))
  (local $3 (ref null $1))
  (local $4 i31ref)
  (local $5 (ref eq))
  (local $6 structref)
  (local $7 (ref $2))
  (local $8 (ref $3))
  (local $9 (ref string))
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 f32)
  (local $17 f32)
  (local $18 f32)
  (local $19 v128)
  (local $20 i32)
  (local $21 f64)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.tee $7
   (loop $label (result (ref (exact $2)))
    (if
     (i32.eqz
      (global.get $global$31)
     )
     (then
      (global.set $global$31
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$31
     (i32.sub
      (global.get $global$31)
      (i32.const 1)
     )
    )
    (br_if $label
     (i32.eqz
      (local.get $1)
     )
    )
    (block $block1
     (block $block
      (br_if $block
       (if (result i32)
        (local.get $1)
        (then
         (struct.set $2 1
          (select (result (ref (exact $2)))
           (struct.new $2
            (array.new_fixed $4 0)
            (local.get $16)
            (ref.func $1)
           )
           (block (result (ref (exact $2)))
            (loop (result (ref (exact $2)))
             (if
              (i32.eqz
               (global.get $global$31)
              )
              (then
               (global.set $global$31
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$31
              (i32.sub
               (global.get $global$31)
               (i32.const 1)
              )
             )
             (block (result (ref (exact $2)))
              (loop $label1
               (if
                (i32.eqz
                 (global.get $global$31)
                )
                (then
                 (global.set $global$31
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$31
                (i32.sub
                 (global.get $global$31)
                 (i32.const 1)
                )
               )
               (i64.atomic.store16 offset=22
                (i64.and
                 (i64.const -96592799790331)
                 (i64.const 15)
                )
                (i64.const -108)
               )
               (call $fimport$8
                (global.get $gimport$0)
               )
               (br_if $label1
                (local.get $1)
               )
              )
              (if
               (local.get $20)
               (then
                (local.set $14
                 (i64.and
                  (i64.const 55819)
                  (i64.const 15)
                 )
                )
               )
              )
              (struct.new $2
               (array.new_fixed $4 0)
               (local.get $16)
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
             )
            )
           )
           (local.get $20)
          )
          (local.get $16)
         )
         (br $label)
        )
        (else
         (local.get $20)
        )
       )
      )
      (drop
       (br_on_null $block1
        (struct.new $2
         (array.new_fixed $4 0)
         (call $49
          (global.get $global$17)
         )
         (ref.func $1)
        )
       )
      )
     )
    )
    (br_if $label
     (local.get $1)
    )
    (struct.new $2
     (array.new_fixed $4 0)
     (f32.const -576460752303423488)
     (ref.func $1)
    )
   )
  )
 )
 (func $17 (type $26) (param $0 anyref) (param $1 f64) (result structref)
  (local $2 eqref)
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $fimport$1
   (i32.const -12496)
  )
  (return
   (struct.new_default $6)
  )
 )
 (@binaryen.js.called)
 (func $18 (type $27) (param $0 f32) (param $1 i32) (param $2 (ref null $1)) (result (ref struct))
  (local.set $0
   (call $49
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $2)))
   (drop
    (i64.and
     (i64.const 126)
     (i64.const 15)
    )
   )
   (block
    (call $fimport$3
     (f32.const -32.35599899291992)
    )
    (return
     (struct.new_default $6)
    )
   )
   (unreachable)
  )
 )
 (func $19 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $18
    (f32.const 51)
    (i32.const -1106132)
    (ref.null nofunc)
   )
  )
  (drop
   (call $18
    (f32.const 2147483648)
    (i32.const -126)
    (ref.func $1)
   )
  )
  (drop
   (call $18
    (f32.const 0)
    (i32.const 201)
    (ref.func $1)
   )
  )
 )
 (func $20 (type $0) (result (ref i31))
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f64)
  (local $4 v128)
  (local $5 v128)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 (ref null $3))
  (local $10 (ref $3))
  (local $11 (ref null $2))
  (local $12 (ref null $2))
  (local $13 externref)
  (local $14 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (block (result (ref i31))
   (nop)
   (nop)
   (nop)
   (ref.i31
    (i32.const -85)
   )
  )
 )
 (func $21 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $20)
  )
 )
 (@binaryen.js.called)
 (func $22 (type $28) (param $0 exnref) (param $1 i64) (param $2 f32) (result (ref null $3))
  (local $3 f64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 v128)
  (local $12 v128)
  (local $13 (ref $2))
  (local $14 (ref eq))
  (local $15 (ref null $1))
  (local $16 stringref)
  (local $17 i31ref)
  (local $18 (ref null $2))
  (local $19 eqref)
  (local $20 (ref array))
  (local $21 (ref $3))
  (local $22 (ref $3))
  (local $23 (ref $3))
  (local $24 (ref string))
  (local $25 (ref string))
  (local $scratch i32)
  (local.set $2
   (call $49
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $13
   (struct.new $2
    (array.new_fixed $4 0)
    (local.get $2)
    (ref.func $1)
   )
  )
  (block $block (result (ref null $3))
   (block $block1
    (if
     (i32.eqz
      (global.get $global$12)
     )
     (then
      (if
       (i32.eqz
        (ref.eq
         (array.new_fixed $4 0)
         (struct.new_default $6)
        )
       )
       (then
        (call $fimport$6
         (loop $label (result (ref $3))
          (if
           (i32.eqz
            (global.get $global$31)
           )
           (then
            (global.set $global$31
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$31
           (i32.sub
            (global.get $global$31)
            (i32.const 1)
           )
          )
          (if
           (i32.eqz
            (global.get $global$31)
           )
           (then
            (global.set $global$31
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$31
           (i32.sub
            (global.get $global$31)
            (i32.const 1)
           )
          )
          (br_on_non_null $block
           (ref.as_non_null
            (ref.null none)
           )
          )
          (call $fimport$5
           (if (result v128)
            (call_indirect $0 (type $8)
             (select
              (local.get $3)
              (local.get $3)
              (i32.const 0)
             )
             (if (result v128)
              (i32.eqz
               (global.get $global$12)
              )
              (then
               (try
                (do
                 (nop)
                )
                (catch_all
                 (nop)
                )
               )
               (call $51
                (global.get $global$2)
               )
              )
              (else
               (if
                (i32.eqz
                 (global.get $global$31)
                )
                (then
                 (global.set $global$31
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$31
                (i32.sub
                 (global.get $global$31)
                 (i32.const 1)
                )
               )
               (br_if $label
                (i32.eqz
                 (f64.eq
                  (f64.const 3402823466385288598117041e14)
                  (call $50
                   (f64.div
                    (f64.const 65421)
                    (local.get $3)
                   )
                  )
                 )
                )
               )
               (br $block1)
              )
             )
             (local.tee $20
              (loop (result (ref (exact $4)))
               (if
                (i32.eqz
                 (global.get $global$31)
                )
                (then
                 (global.set $global$31
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$31
                (i32.sub
                 (global.get $global$31)
                 (i32.const 1)
                )
               )
               (array.new_fixed $4 0)
              )
             )
             (i32.load16_u offset=4
              (i64.and
               (i64.const 25203)
               (i64.const 15)
              )
             )
            )
            (then
             (v128.const i32x4 0xe9000000 0xc1c778f3 0xc5200000 0x41effff0)
            )
            (else
             (select
              (try (result v128)
               (do
                (loop $label1 (result v128)
                 (if
                  (i32.eqz
                   (global.get $global$31)
                  )
                  (then
                   (global.set $global$31
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$31
                  (i32.sub
                   (global.get $global$31)
                   (i32.const 1)
                  )
                 )
                 (call $fimport$4
                  (f64.const -31.655)
                 )
                 (br_if $label1
                  (ref.eq
                   (struct.new_default $6)
                   (ref.i31
                    (i32.const -122)
                   )
                  )
                 )
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
               )
               (catch $tag$0
                (throw $tag$0 (pop i64))
                (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               )
              )
              (if (result v128)
               (i32.const 32766)
               (then
                (call $51
                 (global.get $global$2)
                )
               )
               (else
                (drop
                 (br_on_null $block1
                  (local.get $13)
                 )
                )
                (br $label)
               )
              )
              (local.get $8)
             )
            )
           )
          )
          (call $fimport$3
           (call $49
            (f32x4.extract_lane 3
             (local.tee $11
              (local.get $12)
             )
            )
           )
          )
          (nop)
          (drop
           (br_on_cast $block (ref null $3) (ref null $3)
            (global.get $global$15)
           )
          )
          (br_if $label
           (stringview_wtf16.get_codeunit
            (stringview_wtf16.slice
             (string.const "\ed\a0\80")
             (block (result i32)
              (local.set $9
               (block (result i32)
                (local.set $scratch
                 (local.tee $8
                  (i32.gt_s
                   (block (result i32)
                    (nop)
                    (i32.const 8)
                   )
                   (f32.eq
                    (f32.const 0.20999999344348907)
                    (local.get $2)
                   )
                  )
                 )
                )
                (local.set $10
                 (i32x4.extract_lane 0
                  (local.get $12)
                 )
                )
                (local.get $scratch)
               )
              )
              (local.get $9)
             )
             (local.get $10)
            )
            (block (result i32)
             (drop
              (br_on_null $block1
               (ref.null nofunc)
              )
             )
             (local.set $9
              (local.get $8)
             )
             (local.get $9)
            )
           )
          )
          (drop
           (br_on_null $block1
            (try (result (ref (exact $0)))
             (do
              (ref.func $15)
             )
             (catch $tag$0
              (local.set $6 (select (pop i64) (local.get $6) (i32.const 7)))
              (if (result (ref (exact $0)))
               (string.encode_wtf16_array
                (if (result (ref string))
                 (i32.eqz
                  (i32.trunc_sat_f64_u
                   (call $50
                    (global.get $global$16)
                   )
                  )
                 )
                 (then
                  (loop (result (ref string))
                   (if
                    (i32.eqz
                     (global.get $global$31)
                    )
                    (then
                     (global.set $global$31
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$31
                    (i32.sub
                     (global.get $global$31)
                     (i32.const 1)
                    )
                   )
                   (string.const "")
                  )
                 )
                 (else
                  (throw $tag$0
                   (local.get $1)
                  )
                 )
                )
                (ref.cast (ref none)
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (i32.atomic.rmw16.or_u offset=4
                 (i64.and
                  (local.get $4)
                  (i64.const 15)
                 )
                 (local.tee $8
                  (local.get $8)
                 )
                )
               )
               (then
                (call $fimport$5
                 (local.tee $11
                  (call $51
                   (global.get $global$2)
                  )
                 )
                )
                (call $21)
                (br $block1)
               )
               (else
                (i64.atomic.store32 offset=4
                 (i64.and
                  (block (result i64)
                   (drop
                    (br_on_cast $block nullref nullref
                     (ref.null none)
                    )
                   )
                   (i64.store16 offset=4
                    (i64.and
                     (i64.rem_u
                      (local.get $4)
                      (local.get $4)
                     )
                     (i64.const 15)
                    )
                    (i64.const 4611686018427387904)
                   )
                   (local.tee $4
                    (i64.const -89)
                   )
                  )
                  (i64.const 15)
                 )
                 (i64.atomic.rmw8.cmpxchg_u acqrel offset=22
                  (i64.and
                   (i64.extend8_s
                    (local.get $1)
                   )
                   (i64.const 15)
                  )
                  (local.get $4)
                  (i64.const 2199023255552)
                 )
                )
                (ref.func $15)
               )
              )
             )
            )
           )
          )
          (local.tee $21
           (block $block2 (result (ref $3))
            (call $fimport$7
             (ref.func $22)
            )
            (drop
             (local.get $2)
            )
            (local.tee $22
             (br_if $block2
              (ref.cast (ref $3)
               (local.tee $23
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
              (block (result i32)
               (br_on_non_null $block
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (string.eq
                (local.tee $24
                 (local.tee $25
                  (string.const "\f0\90\8d\88\f0\90\8d\88\ed\a0\80")
                 )
                )
                (string.const "")
               )
              )
             )
            )
           )
          )
         )
        )
       )
      )
     )
    )
    (f64.store offset=3
     (i64.and
      (local.get $4)
      (i64.const 15)
     )
     (call $50
      (global.get $global$25)
     )
    )
   )
   (return
    (struct.new $3
     (ref.func $20)
     (struct.new $2
      (array.new_fixed $4 0)
      (local.get $2)
      (ref.func $1)
     )
     (local.get $2)
     (global.get $global$12)
     (local.get $2)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $23 (type $29) (param $0 i32) (param $1 (ref $2)) (result (ref $0))
  (local $2 i32)
  (local $3 (ref $1))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (if (result (ref (exact $0)))
   (i32.eqz
    (local.get $0)
   )
   (then
    (call $fimport$8
     (ref.null noextern)
    )
    (ref.func $15)
   )
   (else
    (ref.func $20)
   )
  )
 )
 (func $24 (type $1) (param $0 v128) (param $1 f64)
  (local $2 v128)
  (local $3 v128)
  (local $4 f64)
  (local $5 f64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 f32)
  (local $11 exnref)
  (local $12 (ref null $0))
  (local $13 (ref null $1))
  (local $14 eqref)
  (local $15 anyref)
  (local $16 anyref)
  (local $17 externref)
  (local $18 (ref array))
  (local $19 (ref struct))
  (local.set $0
   (call $51
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (nop)
  (block $block
   (drop
    (br_on_null $block
     (block (result (ref (exact $0)))
      (struct.set $2 2
       (struct.new $2
        (array.new_fixed $4 0)
        (f32.const -69)
        (ref.func $1)
       )
       (ref.func $1)
      )
      (ref.func $15)
     )
    )
   )
   (drop
    (struct.new $2
     (array.new_fixed $4 0)
     (call $49
      (f32.load offset=3 align=1
       (i64.and
        (local.get $7)
        (i64.const 15)
       )
      )
     )
     (ref.func $1)
    )
   )
  )
 )
 (func $25 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $24
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const -9223372036854775808)
  )
  (call $24
   (v128.const i32x4 0x0caf0104 0xb76e02b1 0xff329fb4 0xff00c0b3)
   (f64.const 120)
  )
  (call $24
   (v128.const i32x4 0x34697ef0 0x00a62c7f 0xf800ea80 0xff7cff91)
   (f64.const 9223372036854775808)
  )
 )
 (func $26 (type $1) (param $0 v128) (param $1 f64)
  (local.set $0
   (call $51
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (return_call_ref $14
   (global.get $gimport$0)
   (ref.func $fimport$8)
  )
 )
 (func $27 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $26
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const 4294967296.096)
  )
  (call $26
   (v128.const i32x4 0x2afdf88d 0x74db003c 0x8001c872 0x08000001)
   (f64.const -8589934592)
  )
  (call $26
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const 4294938945)
  )
 )
 (@binaryen.js.called)
 (func $28 (type $0) (result (ref i31))
  (local $0 (ref null $2))
  (local $1 (ref null $2))
  (local $2 (ref eq))
  (local $3 (ref null $3))
  (local $4 (ref struct))
  (local $5 (ref string))
  (local $6 i64)
  (local $7 i64)
  (local $8 f32)
  (local $9 f32)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (ref.i31
   (i32.const -128)
  )
 )
 (func $29 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $28)
  )
  (drop
   (call $28)
  )
 )
 (func $30 (type $30) (param $0 (ref string)) (param $1 f32) (param $2 i64) (param $3 exnref)
  (local $4 (ref $2))
  (local $5 (ref $2))
  (local $6 (ref $1))
  (local $7 (ref i31))
  (local $8 i64)
  (local $9 i32)
  (local.set $1
   (call $49
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $6
   (ref.func $24)
  )
  (block $block
   (struct.set $2 2
    (local.tee $4
     (select (result (ref $2))
      (local.tee $5
       (try_table (result (ref (exact $2))) (catch_all $block)
        (struct.new $2
         (array.new_fixed $4 0)
         (local.get $1)
         (ref.func $24)
        )
       )
      )
      (struct.new $2
       (array.new_fixed $4 0)
       (local.get $1)
       (ref.func $24)
      )
      (i32.const 262144)
     )
    )
    (try (result (ref $1))
     (do
      (local.tee $6
       (ref.func $24)
      )
     )
     (catch $tag$0
      (global.set $global$0 (pop i64))
      (local.get $6)
     )
    )
   )
   (call $fimport$2
    (select
     (i64.atomic.load acqrel offset=4
      (i64.and
       (if (result i64)
        (call_indirect $0 (type $8)
         (call $50
          (global.get $global$16)
         )
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (loop $label1 (result (ref (exact $4)))
          (if
           (i32.eqz
            (global.get $global$31)
           )
           (then
            (global.set $global$31
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$31
           (i32.sub
            (global.get $global$31)
            (i32.const 1)
           )
          )
          (loop $label
           (if
            (i32.eqz
             (global.get $global$31)
            )
            (then
             (global.set $global$31
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$31
            (i32.sub
             (global.get $global$31)
             (i32.const 1)
            )
           )
           (nop)
           (nop)
           (br_if $label
            (i32.eqz
             (i32.const -32769)
            )
           )
          )
          (br_if $block
           (global.get $global$12)
          )
          (call $fimport$5
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (block
           (block
            (call $fimport$3
             (loop $label2 (result f32)
              (if
               (i32.eqz
                (global.get $global$31)
               )
               (then
                (global.set $global$31
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$31
               (i32.sub
                (global.get $global$31)
                (i32.const 1)
               )
              )
              (br_if $label1
               (i32.eqz
                (local.get $9)
               )
              )
              (br_if $label2
               (local.get $9)
              )
              (local.get $1)
             )
            )
            (br $block)
           )
           (unreachable)
          )
          (unreachable)
         )
         (i32.const 0)
        )
        (then
         (call $fimport$0
          (i32.const 0)
         )
         (local.tee $2
          (loop $label3 (result i64)
           (if
            (i32.eqz
             (global.get $global$31)
            )
            (then
             (global.set $global$31
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$31
            (i32.sub
             (global.get $global$31)
             (i32.const 1)
            )
           )
           (drop
            (br_on_null $label3
             (local.tee $5
              (struct.new $2
               (array.new_fixed $4 0)
               (f32.const -18446744073709551615)
               (ref.func $24)
              )
             )
            )
           )
           (drop
            (ref.i31
             (i32.const -37)
            )
           )
           (if
            (i32.eqz
             (f32.lt
              (local.get $1)
              (local.get $1)
             )
            )
            (then
             (loop
              (if
               (i32.eqz
                (global.get $global$31)
               )
               (then
                (global.set $global$31
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$31
               (i32.sub
                (global.get $global$31)
                (i32.const 1)
               )
              )
              (nop)
              (br $label3)
             )
             (unreachable)
            )
            (else
             (local.set $1
              (local.tee $1
               (local.get $1)
              )
             )
             (br $block)
            )
           )
           (unreachable)
          )
         )
        )
        (else
         (i64.const 65)
        )
       )
       (i64.const 15)
      )
     )
     (i64.load8_u offset=22
      (i64.and
       (i64.const 262143)
       (i64.const 15)
      )
     )
     (i32.const -2097153)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $31 (type $15) (result (ref null $3) (ref null $0))
  (local $0 (ref null $0))
  (local $1 stringref)
  (local $2 (ref $2))
  (local $3 structref)
  (local $4 f64)
  (local $5 i64)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $2
   (struct.new $2
    (array.new_fixed $4 0)
    (f32.const 4294967296)
    (ref.func $26)
   )
  )
  (block (type $10) (result (ref (exact $3)) (ref (exact $0)))
   (nop)
   (loop $label
    (if
     (i32.eqz
      (global.get $global$31)
     )
     (then
      (global.set $global$31
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$31
     (i32.sub
      (global.get $global$31)
      (i32.const 1)
     )
    )
    (local.set $2
     (local.tee $2
      (if (result (ref (exact $2)))
       (i32.const 2147483647)
       (then
        (local.set $4
         (f64.const 0)
        )
        (struct.new $2
         (array.new_fixed $4 0)
         (call $49
          (global.get $global$17)
         )
         (ref.func $24)
        )
       )
       (else
        (atomic.fence)
        (br $label)
       )
      )
     )
    )
    (call $fimport$5
     (block (result v128)
      (call $fimport$7
       (ref.func $fimport$8)
      )
      (v128.const i32x4 0x00dc8f00 0x0100aa00 0xe1fffffe 0x00ff04ec)
     )
    )
    (br_if $label
     (global.get $global$12)
    )
   )
   (nop)
   (loop (type $10) (result (ref (exact $3)) (ref (exact $0)))
    (if
     (i32.eqz
      (global.get $global$31)
     )
     (then
      (global.set $global$31
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$31
     (i32.sub
      (global.get $global$31)
      (i32.const 1)
     )
    )
    (block (type $10) (result (ref (exact $3)) (ref (exact $0)))
     (data.drop $2)
     (tuple.make 2
      (try (result (ref (exact $3)))
       (do
        (struct.new $3
         (ref.func $15)
         (struct.new $2
          (array.new_fixed $4 0)
          (f32.const 3402823466385288598117041e14)
          (ref.func $24)
         )
         (f32.const 1.8370000123977661)
         (global.get $global$12)
         (f32.const 4611686018427387904)
        )
       )
       (catch $tag$0
        (local.set $5 (select (pop i64) (local.get $5) (i32.const 1)))
        (struct.new $3
         (ref.func $0)
         (local.get $2)
         (f32.const 0)
         (i32.const 65482)
         (f32.const 2147483648)
        )
       )
       (catch_all
        (struct.new $3
         (ref.func $15)
         (struct.new $2
          (array.new_fixed $4 0)
          (f32.const -4611686018427387904)
          (ref.func $26)
         )
         (f32.const -9223372036854775808)
         (i32.const -2147483648)
         (f32.const 0)
        )
       )
      )
      (ref.func $15)
     )
    )
   )
  )
 )
 (func $32 (type $5)
  (local $scratch (tuple (ref null $3) (ref null $0)))
  (local $scratch_1 (ref null $3))
  (local $scratch_2 (tuple (ref null $3) (ref null $0)))
  (local $scratch_3 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $3))
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $31)
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch)
     )
    )
    (local.get $scratch_1)
   )
  )
  (drop
   (block (result (ref null $3))
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $31)
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_2)
     )
    )
    (local.get $scratch_3)
   )
  )
 )
 (func $33 (type $31) (result (ref $1))
  (local $0 i32)
  (local $1 i64)
  (local $2 arrayref)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $fimport$7
   (ref.func $fimport$7)
  )
  (return
   (ref.func $26)
  )
 )
 (func $34 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $33)
  )
 )
 (func $35 (type $32) (param $0 (ref null $3)) (param $1 f64) (param $2 i64) (param $3 (ref eq)) (result (ref $1))
  (local $4 stringref)
  (local $5 (ref $2))
  (local $6 (ref null $0))
  (local $7 (ref string))
  (local $8 (ref exn))
  (local $9 (ref exn))
  (local $10 v128)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (local $scratch (ref $7))
  (local $scratch_17 i64)
  (local $scratch_18 (ref (exact $4)))
  (local $scratch_19 (ref (exact $6)))
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $8
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$1)
    )
    (unreachable)
   )
  )
  (block $block3 (result (ref (exact $1)))
   (if
    (global.get $global$12)
    (then
     (atomic.fence acqrel)
    )
    (else
     (block $block1
      (try_table (catch_all $block1)
       (block $block2
        (call_ref $13
         (local.get $1)
         (ref.func $fimport$4)
        )
        (drop
         (br_on_null $block2
          (try (result (ref $0))
           (do
            (drop
             (br_on_null $block2
              (ref.func $35)
             )
            )
            (loop $label (result (ref (exact $0)))
             (if
              (i32.eqz
               (global.get $global$31)
              )
              (then
               (global.set $global$31
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$31
              (i32.sub
               (global.get $global$31)
               (i32.const 1)
              )
             )
             (drop
              (br_on_cast_fail $block3 (ref (exact $1)) (ref (exact $1))
               (ref.func $24)
              )
             )
             (block $block4
              (try_table (catch_all $block4)
               (table.set $1
                (i32.const 0)
                (block $block5 (result (ref exn))
                 (try_table (catch_all_ref $block5)
                  (throw $tag$0
                   (i64.const -88)
                  )
                 )
                 (unreachable)
                )
               )
              )
             )
             (br_if $label
              (i32.const 2147483646)
             )
             (ref.func $15)
            )
           )
           (catch $tag$0
            (global.set $global$0 (pop i64))
            (ref.func $28)
           )
           (catch_all
            (loop (result (ref $0))
             (if
              (i32.eqz
               (global.get $global$31)
              )
              (then
               (global.set $global$31
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$31
              (i32.sub
               (global.get $global$31)
               (i32.const 1)
              )
             )
             (block $block6 (result (ref $0))
              (drop
               (br_on_cast $block3 (ref (exact $1)) (ref (exact $1))
                (ref.func $24)
               )
              )
              (br_on_non_null $block6
               (local.get $6)
              )
              (drop
               (i64.and
                (i64.const -7645)
                (i64.const 15)
               )
              )
              (block
               (nop)
               (br $block1)
              )
              (unreachable)
             )
            )
           )
          )
         )
        )
       )
      )
      (f32.store offset=3 align=1
       (i64.mul
        (if (result i64)
         (i32.eqz
          (select
           (struct.get $3 3
            (struct.new $3
             (ref.func $15)
             (struct.new $2
              (ref.null none)
              (f32.const -91)
              (ref.func $24)
             )
             (call $49
              (global.get $global$19)
             )
             (i32.const 0)
             (f32.const -1.1754943508222875e-38)
            )
           )
           (i32.const 65432)
           (local.tee $15
            (string.compare
             (local.tee $7
              (loop (result (ref string))
               (if
                (i32.eqz
                 (global.get $global$31)
                )
                (then
                 (global.set $global$31
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$31
                (i32.sub
                 (global.get $global$31)
                 (i32.const 1)
                )
               )
               (string.const "")
              )
             )
             (local.get $7)
            )
           )
          )
         )
         (then
          (block $block8 (result i64)
           (br_if $block1
            (i32.eqz
             (global.get $global$12)
            )
           )
           (if (result i64)
            (string.eq
             (try (result (ref string))
              (do
               (string.const "")
              )
              (catch $tag$0
               (local.set $12 (i64.mul (pop i64) (i64.const -1)))
               (select (result (ref string))
                (local.tee $7
                 (loop $label1 (result (ref string))
                  (if
                   (i32.eqz
                    (global.get $global$31)
                   )
                   (then
                    (global.set $global$31
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$31
                   (i32.sub
                    (global.get $global$31)
                    (i32.const 1)
                   )
                  )
                  (local.set $0
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                  (br_if $label1
                   (i32.eqz
                    (loop (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$31)
                      )
                      (then
                       (global.set $global$31
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$31
                      (i32.sub
                       (global.get $global$31)
                       (i32.const 1)
                      )
                     )
                     (call $6)
                    )
                   )
                  )
                  (local.tee $7
                   (string.const "")
                  )
                 )
                )
                (loop $label2 (result (ref string))
                 (if
                  (i32.eqz
                   (global.get $global$31)
                  )
                  (then
                   (global.set $global$31
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$31
                  (i32.sub
                   (global.get $global$31)
                   (i32.const 1)
                  )
                 )
                 (table.set $1
                  (i64.lt_u
                   (i64.shl
                    (i64.const -15)
                    (local.get $2)
                   )
                   (local.get $2)
                  )
                  (ref.cast (ref exn)
                   (if (result (ref exn))
                    (i32.eqz
                     (i32.const -5741753)
                    )
                    (then
                     (local.tee $8
                      (local.tee $9
                       (block $block7 (result (ref exn))
                        (try_table (catch_all_ref $block7)
                         (throw $tag$0
                          (i64x2.extract_lane 1
                           (local.get $10)
                          )
                         )
                        )
                        (unreachable)
                       )
                      )
                     )
                    )
                    (else
                     (local.get $8)
                    )
                   )
                  )
                 )
                 (br_if $label2
                  (try (result i32)
                   (do
                    (select
                     (i32.const -19)
                     (local.get $15)
                     (i32.const -21700)
                    )
                   )
                   (catch $tag$0
                    (local.set $13 (call_ref $__sinkT_0 (pop i64) (ref.func $__popsink_0)))
                    (ref.test (ref nofunc)
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                    )
                   )
                  )
                 )
                 (string.const "\ed\a0\80\c2\a3")
                )
                (local.tee $15
                 (f64.lt
                  (local.tee $1
                   (f64.const 257)
                  )
                  (call $50
                   (f64.max
                    (f64.const 65426)
                    (local.get $1)
                   )
                  )
                 )
                )
               )
              )
             )
             (local.get $4)
            )
            (then
             (nop)
             (data.drop $3)
             (drop
              (block (result (ref (exact $6)))
               (local.set $scratch_19
                (struct.new_default $6)
               )
               (drop
                (block (result (ref (exact $4)))
                 (local.set $scratch_18
                  (array.new_fixed $4 0)
                 )
                 (local.set $14
                  (block (result i64)
                   (local.set $scratch_17
                    (i64.const -128)
                   )
                   (drop
                    (block (result (ref $7))
                     (local.set $scratch
                      (ref.func $fimport$1)
                     )
                     (drop
                      (i32.const 84)
                     )
                     (local.get $scratch)
                    )
                   )
                   (local.get $scratch_17)
                  )
                 )
                 (local.get $scratch_18)
                )
               )
               (local.get $scratch_19)
              )
             )
             (drop
              (i64.and
               (local.get $14)
               (i64.const 15)
              )
             )
             (loop $label3
              (if
               (i32.eqz
                (global.get $global$31)
               )
               (then
                (global.set $global$31
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$31
               (i32.sub
                (global.get $global$31)
                (i32.const 1)
               )
              )
              (drop
               (br_on_null $label3
                (array.new_fixed $4 0)
               )
              )
              (br $block1)
             )
             (unreachable)
            )
            (else
             (i64x2.extract_lane 1
              (call $51
               (i32x4.min_s
                (try_table (result v128) (catch $tag$0 $block8)
                 (drop
                  (br_on_null $block1
                   (string.const "\ed\a0\80")
                  )
                 )
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
                (try_table (result v128) (catch $tag$0 $block8) (catch_all $block1)
                 (call $51
                  (global.get $global$2)
                 )
                )
               )
              )
             )
            )
           )
          )
         )
         (else
          (nop)
          (br $block1)
         )
        )
        (local.get $2)
       )
       (f32.const 9223372036854775808)
      )
     )
    )
   )
   (drop
    (br_on_cast_fail $block3 (ref (exact $1)) (ref (exact $1))
     (ref.func $26)
    )
   )
   (ref.func $1)
  )
 )
 (func $36 (type $33) (param $0 f64) (param $1 f64) (param $2 f32) (param $3 i64) (result funcref)
  (local $4 (ref null $0))
  (local $5 structref)
  (local $6 (ref null $1))
  (local $7 (ref $3))
  (local $8 f32)
  (local $9 f32)
  (local $10 f64)
  (local $11 i64)
  (local $12 i64)
  (local.set $0
   (call $50
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (local.set $2
   (call $49
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (ref.func $36)
 )
 (func $37 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $36
    (f64.const -0)
    (f64.const 108)
    (f32.const 0.7319999933242798)
    (i64.const -60)
   )
  )
 )
 (func $38 (type $1) (param $0 v128) (param $1 f64)
  (local $2 (ref $2))
  (local $3 externref)
  (local $4 (ref array))
  (local $5 (ref eq))
  (local $6 (ref null $3))
  (local $7 f64)
  (local $8 f32)
  (local.set $0
   (call $51
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (nop)
  (loop $label
   (if
    (i32.eqz
     (global.get $global$31)
    )
    (then
     (global.set $global$31
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$31
    (i32.sub
     (global.get $global$31)
     (i32.const 1)
    )
   )
   (table.set $1
    (i32.const 1)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1)
     )
     (unreachable)
    )
   )
   (br $label)
  )
  (local.set $5
   (unreachable)
  )
 )
 (func $39 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $38
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f64.const 186)
  )
 )
 (func $40 (type $34) (param $0 (ref $0)) (param $1 i31ref) (param $2 arrayref) (result v128)
  (local $3 anyref)
  (local $4 (ref null $3))
  (local $5 (ref $3))
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 f64)
  (local $11 v128)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (local.set $5
   (struct.new $3
    (ref.func $28)
    (struct.new $2
     (array.new_fixed $4 0)
     (f32.const -3402823466385288598117041e14)
     (ref.func $24)
    )
    (f32.const -17179869184)
    (global.get $global$12)
    (call $49
     (global.get $global$17)
    )
   )
  )
  (block $block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$31)
     )
     (then
      (global.set $global$31
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$31
     (i32.sub
      (global.get $global$31)
      (i32.const 1)
     )
    )
    (call $fimport$5
     (call $51
      (i16x8.avgr_u
       (block (result v128)
        (local.get $11)
       )
       (call $51
        (f32x4.max
         (try_table (result v128) (catch_all $label)
          (local.get $11)
         )
         (block (result v128)
          (nop)
          (drop
           (loop $label2 (result v128)
            (if
             (i32.eqz
              (global.get $global$31)
             )
             (then
              (global.set $global$31
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$31
             (i32.sub
              (global.get $global$31)
              (i32.const 1)
             )
            )
            (if
             (i32.eqz
              (i32.const 65535)
             )
             (then
              (call $fimport$1
               (local.get $9)
              )
              (loop $label1
               (if
                (i32.eqz
                 (global.get $global$31)
                )
                (then
                 (global.set $global$31
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$31
                (i32.sub
                 (global.get $global$31)
                 (i32.const 1)
                )
               )
               (drop
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (drop
                (f32.const 4)
               )
               (unreachable)
               (local.set $10
                (local.get $10)
               )
               (br_if $label1
                (local.get $9)
               )
              )
              (call $fimport$3
               (call $49
                (global.get $global$19)
               )
              )
             )
             (else
              (nop)
              (i32.store16 offset=22
               (i64.and
                (i64.const -262145)
                (block (result i64)
                 (drop
                  (ref.null nofunc)
                 )
                 (i64.const 15)
                )
               )
               (struct.get $3 3
                (local.get $5)
               )
              )
             )
            )
            (try_table (catch_all $label2)
             (table.set $0
              (i32.const 5)
              (block (result (ref $0))
               (local.get $0)
              )
             )
            )
            (nop)
            (br $block)
           )
          )
          (if
           (i32x4.all_true
            (call $51
             (v128.load offset=22
              (i64.and
               (if (result i64)
                (local.get $9)
                (then
                 (i64.const -274877906944)
                )
                (else
                 (local.get $8)
                )
               )
               (i64.const 15)
              )
             )
            )
           )
           (then
            (if
             (if (result i32)
              (i32.eqz
               (if (result i32)
                (i32.eqz
                 (i32.const -2147483647)
                )
                (then
                 (local.get $9)
                )
                (else
                 (i32.trunc_f32_u
                  (try_table (result f32) (catch_all $block)
                   (f32.const 0.8639999628067017)
                  )
                 )
                )
               )
              )
              (then
               (local.get $9)
              )
              (else
               (i32.const -720547042)
              )
             )
             (then
              (nop)
             )
            )
            (nop)
            (call $fimport$6
             (array.new_fixed $4 0)
            )
            (br $block)
           )
           (else
            (call $fimport$5
             (if (result v128)
              (i32.eqz
               (local.get $9)
              )
              (then
               (table.set $0
                (i32.const 0)
                (ref.func $40)
               )
               (br $block)
              )
              (else
               (nop)
               (call $51
                (global.get $global$2)
               )
              )
             )
            )
            (br $block)
           )
          )
          (unreachable)
         )
        )
       )
      )
     )
    )
   )
   (block
    (call_ref $5
     (ref.func $19)
    )
    (br $block)
   )
   (unreachable)
  )
  (return
   (local.get $11)
  )
 )
 (func $41 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $51
    (call $40
     (ref.func $28)
     (ref.i31
      (i32.const -21442)
     )
     (array.new_fixed $4 0)
    )
   )
  )
 )
 (func $42 (type $7) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 (ref null $1))
  (local $6 funcref)
  (local $7 (ref struct))
  (local $8 (ref $3))
  (local $9 anyref)
  (local $10 (ref $0))
  (local $11 (ref string))
  (local $12 structref)
  (local $13 (ref $2))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $fimport$2
   (i64.const 4194303)
  )
 )
 (func $43 (type $35) (param $0 exnref) (param $1 f32) (param $2 (ref null $0)) (param $3 (ref null $2)) (result i64 i64)
  (local $4 (ref $3))
  (local $5 (ref $3))
  (local $6 exnref)
  (local $7 structref)
  (local $8 (ref $0))
  (local $9 (ref null $0))
  (local $10 stringref)
  (local $11 (ref array))
  (local $12 eqref)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f32)
  (local $17 f32)
  (local $18 f32)
  (local $19 f32)
  (local $20 i64)
  (local $21 i64)
  (local $22 i64)
  (local.set $1
   (call $49
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (local.get $21)
   (local.get $22)
  )
 )
 (@binaryen.js.called)
 (func $44 (type $1) (param $0 v128) (param $1 f64)
  (local $2 (ref array))
  (local $3 eqref)
  (local $4 i31ref)
  (local $5 i31ref)
  (local $6 structref)
  (local $7 f64)
  (local $8 f64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 f32)
  (local.set $0
   (call $51
    (local.get $0)
   )
  )
  (local.set $1
   (call $50
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const -8191)
  )
 )
 (func $45 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (call $44
   (v128.const i32x4 0xff11c701 0x006f80c3 0x3cc99f01 0x00f98101)
   (f64.const 0)
  )
 )
 (func $46 (type $0) (result (ref i31))
  (local $0 anyref)
  (local $1 anyref)
  (local $2 i31ref)
  (local $3 stringref)
  (local $4 funcref)
  (local $5 (ref null $2))
  (local $6 i32)
  (local $7 f32)
  (local $8 i64)
  (local $9 i64)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (ref.i31
   (i32.const -86)
  )
 )
 (func $47 (type $5)
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (drop
   (call $46)
  )
  (drop
   (call $46)
  )
  (drop
   (call $46)
  )
 )
 (func $48 (type $36) (param $0 (ref eq)) (param $1 i64) (param $2 (ref $0)) (param $3 funcref) (param $4 (ref null $2)) (param $5 (ref eq)) (result (ref null $0))
  (local $6 (ref $1))
  (if
   (i32.eqz
    (global.get $global$31)
   )
   (then
    (global.set $global$31
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$31
   (i32.sub
    (global.get $global$31)
    (i32.const 1)
   )
  )
  (ref.cast (ref (exact $0))
   (ref.func $15)
  )
 )
 (func $49 (type $37) (param $0 f32) (result f32)
  (if (result f32)
   (f32.eq
    (local.get $0)
    (local.get $0)
   )
   (then
    (local.get $0)
   )
   (else
    (f32.const 0)
   )
  )
 )
 (func $50 (type $38) (param $0 f64) (result f64)
  (if (result f64)
   (f64.eq
    (local.get $0)
    (local.get $0)
   )
   (then
    (local.get $0)
   )
   (else
    (f64.const 0)
   )
  )
 )
 (func $51 (type $39) (param $0 v128) (result v128)
  (if (result v128)
   (i32.and
    (i32.and
     (f32.eq
      (f32x4.extract_lane 0
       (local.get $0)
      )
      (f32x4.extract_lane 0
       (local.get $0)
      )
     )
     (f32.eq
      (f32x4.extract_lane 1
       (local.get $0)
      )
      (f32x4.extract_lane 1
       (local.get $0)
      )
     )
    )
    (i32.and
     (f32.eq
      (f32x4.extract_lane 2
       (local.get $0)
      )
      (f32x4.extract_lane 2
       (local.get $0)
      )
     )
     (f32.eq
      (f32x4.extract_lane 3
       (local.get $0)
      )
      (f32x4.extract_lane 3
       (local.get $0)
      )
     )
    )
   )
   (then
    (local.get $0)
   )
   (else
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (type $__sinkT_0 (func (param i64) (result i64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
