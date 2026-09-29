(module
 (rec
  (type $0 (sub (func (param f32))))
  (type $1 (func (result v128)))
  (type $2 (sub (array (mut (ref null $3)))))
  (type $3 (sub (func (param i32) (result v128 (ref null $11) (ref eq) (ref $4) (ref $7) f32))))
  (type $4 (sub (func (result (ref $5)))))
  (type $5 (sub (func (param (ref null $13) f32 (ref null $7) v128) (result i32))))
  (type $6 (array (mut f32)))
  (type $7 (array i64))
  (type $8 (sub (struct (field (mut i16)) (field (mut (ref $9))) (field (mut (ref $7))) (field (mut v128)))))
  (type $9 (func (param (ref null $5) anyref i32 i32 f32 (ref $10)) (result v128 f64 i32 v128 i32 (ref $1))))
  (type $10 (sub (func (param i64 f32 i32) (result f64))))
  (type $11 (struct (field i8) (field v128)))
  (type $12 (sub (array (mut i64))))
  (type $13 (sub (array (mut v128))))
 )
 (rec
  (type $14 (struct (field (mut i64))))
  (type $15 (struct (field (mut f64)) (field (mut (ref $5))) (field f64) (field (ref $17)) (field (mut f32))))
  (type $16 (sub $5 (func (param (ref null $13) f32 (ref null $7) v128) (result i32))))
  (type $17 (sub final $13 (array (mut v128))))
 )
 (type $18 (array i8))
 (type $19 (func))
 (type $20 (func (result v128 f64 i32 v128 i32 (ref $1))))
 (type $21 (array (mut i16)))
 (type $22 (struct))
 (type $23 (func (param i32)))
 (type $24 (func (param f64)))
 (type $25 (func (param (ref array) (ref null $1)) (result f32)))
 (type $26 (func (param f32 i64 f32) (result i32)))
 (type $27 (func (result i32)))
 (type $28 (func (result v128 f64 (ref null $9) anyref)))
 (type $29 (func (result (ref exn) f32 (ref nofunc) v128 f64)))
 (type $30 (func (result v128 f64 (ref (exact $9)) (ref (exact $2)))))
 (type $31 (func (param (ref $11))))
 (type $32 (func (param i64)))
 (type $33 (func (param f32)))
 (type $34 (func (param v128)))
 (type $35 (func (param anyref)))
 (type $36 (func (param funcref)))
 (type $37 (func (param externref)))
 (type $38 (func (param i32 i32) (result i32)))
 (type $39 (func (param f64) (result i31ref)))
 (type $40 (func (param i32 (ref $14) exnref eqref f32) (result i32)))
 (type $41 (func (param f32) (result f32)))
 (type $42 (func (param f64) (result f64)))
 (type $43 (func (param v128) (result v128)))
 (type $44 (func (result v128 (ref null $11) (ref eq) (ref $4) (ref $7) f32)))
 (import "__fuzz_import" "global$_14" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $23) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $23) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $32) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $33) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $24) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $34) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $35) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $36) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $37) (param externref)))
 (import "fuzzing-support" "sleep" (func $fimport$9 (type $38) (param i32 i32) (result i32)))
 (global $global$0 (mut i32) (i32.const 32767))
 (global $global$1 arrayref (array.new_fixed $18 0))
 (global $global$2 f32 (f32.const -562949953421312))
 (global $global$3 (mut (ref null $0)) (ref.func $0))
 (global $global$4 externref (ref.null noextern))
 (global $global$5 (ref $2) (array.new $2
  (ref.null nofunc)
  (i32.const 26)
 ))
 (global $global$6 f64 (f64.const -18446744073709551615))
 (global $global$7 i32 (i32.const -5306))
 (global $global$8 (ref null $10) (ref.func $1))
 (global $global$9 (ref null $8) (struct.new $8
  (i32.const -2147483648)
  (ref.func $2)
  (array.new $7
   (i64.const 2147483648)
   (i32.const 26)
  )
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
 ))
 (global $global$10 (ref null $1) (ref.null nofunc))
 (global $global$11 v128 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$12 f64 (f64.const 2147483646.556))
 (global $global$13 (mut (ref null $12)) (array.new_default $12
  (i32.const 87)
 ))
 (global $global$14 f64 (f64.const -3402823466385288598117041e14))
 (global $global$15 structref (struct.new_default $22))
 (global $global$16 (ref null $8) (ref.null none))
 (global $global$17 eqref (ref.i31
  (i32.const 32768)
 ))
 (global $global$18 f64 (f64.const 183))
 (global $global$19 i64 (i64.const 32767))
 (global $global$20 eqref (ref.i31
  (i32.const 16777215)
 ))
 (global $global$21 (ref null $9) (ref.func $2))
 (global $global$22 i64 (i64.const 43))
 (global $global$23 (mut (ref null $16)) (ref.null nofunc))
 (global $global$24 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 (i32.const 0) "\ef6\cd8\t\dar\f6!\91")
 (table $0 8 8 funcref (ref.null nofunc))
 (table $1 9 9 exnref)
 (elem $0 (table $0) (i32.const 0) func $9 $11 $13 $14 $14 $16 $17 $24)
 (elem declare func $2 $4 $5 $7 $fimport$4)
 (tag $tag$0 (type $31) (param (ref $11)))
 (export "global$_9" (global $global$12))
 (export "global$_10" (global $global$13))
 (export "global$_12" (global $global$19))
 (export "global$_13" (global $global$20))
 (export "global$_16" (global $global$22))
 (export "ref_func_target_1_invoker" (func $3))
 (export "func" (func $4))
 (export "func_15" (func $5))
 (export "func_15_invoker" (func $6))
 (export "func_17_invoker" (func $8))
 (export "func_20" (func $10))
 (export "func_21" (func $11))
 (export "func_21_invoker" (func $12))
 (export "func_24" (func $14))
 (export "func_24_invoker" (func $15))
 (export "func_26" (func $16))
 (export "func_28" (func $18))
 (export "func_29_invoker" (func $20))
 (export "func_34" (func $24))
 (export "func_35" (func $25))
 (export "func_35_invoker" (func $26))
 (func $0 (type $0) (param $0 f32)
  (local.set $0
   (call $29
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $1 (type $10) (param $0 i64) (param $1 f32) (param $2 i32) (result f64)
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $9) (param $0 (ref null $5)) (param $1 anyref) (param $2 i32) (param $3 i32) (param $4 f32) (param $5 (ref $10)) (result v128 f64 i32 v128 i32 (ref $1))
  (local.set $4
   (call $29
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $3 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $30
    (call $1
     (i64.const 154)
     (f32.const -827059)
     (i32.const -33554433)
    )
   )
  )
 )
 (func $4 (type $16) (param $0 (ref null $13)) (param $1 f32) (param $2 (ref null $7)) (param $3 v128) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 f32)
  (local $9 f32)
  (local $10 (ref struct))
  (local $11 funcref)
  (local $12 (ref null $14))
  (local $13 (ref null $10))
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (local.set $3
   (call $31
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (global.get $global$0)
 )
 (func $5 (type $1) (result v128)
  (local $0 (ref null $8))
  (local $1 (ref struct))
  (local $2 (ref null $9))
  (local $3 i31ref)
  (local $4 (ref $17))
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 f64)
  (local $14 f32)
  (local $15 f32)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (v128.const i32x4 0x003fffff 0x00000000 0x0000ffff 0x00000000)
 )
 (func $6 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $31
    (call $5)
   )
  )
 )
 (func $7 (type $25) (param $0 (ref array)) (param $1 (ref null $1)) (result f32)
  (local $2 (ref $14))
  (local $3 anyref)
  (local $4 (ref $11))
  (local $5 funcref)
  (local $6 externref)
  (local $7 (ref $10))
  (local $8 f64)
  (local $9 i32)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const -32)
  )
  (return
   (f32.const -3.109045351680995e-17)
  )
 )
 (func $8 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $29
    (call $7
     (array.new_fixed $18 0)
     (ref.null nofunc)
    )
   )
  )
 )
 (func $9 (type $10) (param $0 i64) (param $1 f32) (param $2 i32) (result f64)
  (local $3 (ref $12))
  (local $4 (ref null $3))
  (local $5 (ref null $9))
  (local $6 (ref null $2))
  (local $7 stringref)
  (local $8 (ref null $16))
  (local $9 (ref null $15))
  (local $10 f64)
  (local $11 v128)
  (local $12 v128)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 f32)
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (call $30
   (global.get $global$12)
  )
 )
 (func $10 (type $10) (param $0 i64) (param $1 f32) (param $2 i32) (result f64)
  (local $3 f64)
  (local $4 f64)
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (loop (result f64)
   (if
    (i32.eqz
     (global.get $global$24)
    )
    (then
     (global.set $global$24
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$24
    (i32.sub
     (global.get $global$24)
     (i32.const 1)
    )
   )
   (block $block (result f64)
    (nop)
    (local.tee $3
     (br_if $block
      (local.get $4)
      (i32.eqz
       (i32.atomic.load8_u acqrel offset=22
        (i32.and
         (i64.gt_s
          (i64.const 67108865)
          (i64.const 67108865)
         )
         (i32.const 15)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $11 (type $39) (param $0 f64) (result i31ref)
  (local $1 i31ref)
  (local $2 i31ref)
  (local $3 (ref null $5))
  (local $4 (ref null $15))
  (local $5 structref)
  (local $6 eqref)
  (local $7 (ref struct))
  (local $8 (ref $3))
  (local $9 (ref null $3))
  (local $10 (ref string))
  (local $11 (ref $17))
  (local $12 (ref $17))
  (local $13 (ref $11))
  (local $14 (ref $11))
  (local $15 nullref)
  (local $16 (ref i31))
  (local $17 i64)
  (local $18 i64)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 v128)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (local.get $2)
 )
 (func $12 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $11
    (f64.const -67)
   )
  )
  (drop
   (call $11
    (f64.const 9223372036854775808)
   )
  )
 )
 (@binaryen.js.called)
 (func $13 (type $26) (param $0 f32) (param $1 i64) (param $2 f32) (result i32)
  (local $3 f64)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 (ref $4))
  (local $14 stringref)
  (local $15 (ref $7))
  (local $16 (ref $12))
  (local $17 (ref $12))
  (local $18 (ref none))
  (local.set $0
   (call $29
    (local.get $0)
   )
  )
  (local.set $2
   (call $29
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (block (result i32)
   (local.set $3
    (local.get $3)
   )
   (block (result i32)
    (block
     (table.set $0
      (i32.const 1)
      (ref.func $4)
     )
     (return
      (global.get $global$0)
     )
    )
    (unreachable)
   )
  )
 )
 (func $14 (type $10) (param $0 i64) (param $1 f32) (param $2 i32) (result f64)
  (local $3 (ref $11))
  (local $4 (ref $11))
  (local $5 (ref null $14))
  (local $6 (ref null $2))
  (local $7 eqref)
  (local $8 (ref $6))
  (local $9 i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 f64)
  (local $13 v128)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 f32)
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (if
   (i32.lt_u
    (local.tee $10
     (local.get $2)
    )
    (array.len
     (local.tee $8
      (array.new_default $6
       (i32.and
        (i32.const 69)
        (i32.const 1023)
       )
      )
     )
    )
   )
   (then
    (array.set $6
     (local.get $8)
     (local.get $10)
     (local.get $17)
    )
   )
  )
  (return
   (f64.const 122)
  )
 )
 (func $15 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $30
    (call $14
     (i64.const 65535)
     (f32.const 59)
     (i32.const -1)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $16 (type $1) (result v128)
  (local $0 f64)
  (local $1 arrayref)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
 )
 (func $17 (type $1) (result v128)
  (local $0 (ref $5))
  (local $1 (ref i31))
  (local $2 (ref i31))
  (local $3 (ref i31))
  (local $4 funcref)
  (local $5 (ref $11))
  (local $6 (ref $11))
  (local $7 (ref $11))
  (local $8 (ref $11))
  (local $9 (ref $11))
  (local $10 (ref $11))
  (local $11 (ref string))
  (local $12 (ref $21))
  (local $13 (ref $21))
  (local $14 (ref null $1))
  (local $15 anyref)
  (local $16 (ref null $4))
  (local $17 (ref $2))
  (local $18 (ref $2))
  (local $19 (ref eq))
  (local $20 (ref $6))
  (local $21 (ref $6))
  (local $22 (ref $6))
  (local $23 nullref)
  (local $24 (ref (exact $1)))
  (local $25 v128)
  (local $26 f64)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $32 i32)
  (local $33 i32)
  (local $34 f32)
  (local $35 i64)
  (local $scratch i32)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (local.set $20
   (array.new_default $6
    (i32.and
     (i32.const 91)
     (i32.const 1023)
    )
   )
  )
  (local.set $11
   (string.const "")
  )
  (local.set $2
   (ref.i31
    (i32.const -12)
   )
  )
  (block (result v128)
   (call $fimport$4
    (call $30
     (f64x2.extract_lane 1
      (try (result v128)
       (do
        (try (result v128)
         (do
          (loop $label
           (if
            (i32.eqz
             (global.get $global$24)
            )
            (then
             (global.set $global$24
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$24
            (i32.sub
             (global.get $global$24)
             (i32.const 1)
            )
           )
           (block
            (call $fimport$7
             (local.get $4)
            )
            (br $label)
           )
           (local.set $19
            (local.set $17
             (local.set $18
              (local.set $7
               (local.set $11
                (local.set $1
                 (local.set $2
                  (local.set $3
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
          (unreachable)
         )
         (catch $tag$0
          (drop (struct.get_u $11 0 (pop (ref $11))))
          (local.get $25)
         )
        )
       )
       (catch_all
        (try (result v128)
         (do
          (call $31
           (call_ref $1
            (ref.func $16)
           )
          )
         )
         (catch $tag$0
          (local.set $9 (local.tee $9 (pop (ref $11))))
          (block (result v128)
           (call $fimport$6
            (if (result (ref eq))
             (i32.eqz
              (if (result i32)
               (i32.eqz
                (if (result i32)
                 (f32.gt
                  (call $29
                   (call_ref $25
                    (array.new_fixed $18 0)
                    (ref.as_non_null
                     (ref.null nofunc)
                    )
                    (ref.func $7)
                   )
                  )
                  (f32.const 0)
                 )
                 (then
                  (block $block (result i32)
                   (nop)
                   (br_if $block
                    (i32.const 1734280524)
                    (local.get $27)
                   )
                  )
                 )
                 (else
                  (block $block1 (result i32)
                   (drop
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                   (drop
                    (try (result i32)
                     (do
                      (i32.const 32767)
                     )
                     (catch $tag$0
                      (drop (pop (ref $11)))
                      (local.set $scratch
                       (i32.const 32767)
                      )
                      (drop
                       (i64.const -274877906943)
                      )
                      (local.get $scratch)
                     )
                    )
                   )
                   (drop
                    (array.new_default $12
                     (i32.and
                      (i32.const 0)
                      (i32.const 1023)
                     )
                    )
                   )
                   (drop
                    (string.compare
                     (string.const "\e2\82\ac\ed\bd\88")
                     (local.get $11)
                    )
                   )
                   (drop
                    (br_if $block1
                     (local.get $27)
                     (i32.eqz
                      (local.get $27)
                     )
                    )
                   )
                   (unreachable)
                   (i16x8.extract_lane_u 4
                    (call $31
                     (call $17)
                    )
                   )
                  )
                 )
                )
               )
               (then
                (block
                 (return
                  (call $31
                   (call_indirect $0 (type $1)
                    (i32.const 5)
                   )
                  )
                 )
                )
                (unreachable)
               )
               (else
                (nop)
                (call $fimport$9
                 (i64.ne
                  (i64.clz
                   (local.get $35)
                  )
                  (i64.atomic.rmw16.sub_u offset=22
                   (i32.and
                    (i32.const 16383)
                    (i32.const 15)
                   )
                   (local.get $35)
                  )
                 )
                 (local.get $27)
                )
               )
              )
             )
             (then
              (nop)
              (if (result (ref (exact $14)))
               (i31.get_u
                (local.get $2)
               )
               (then
                (struct.new_default $14)
               )
               (else
                (data.drop $0)
                (return
                 (local.get $25)
                )
               )
              )
             )
             (else
              (if (result (ref (exact $12)))
               (f64.gt
                (call $30
                 (f64.reinterpret_i64
                  (if (result i64)
                   (local.get $27)
                   (then
                    (i64.const 4294967168)
                   )
                   (else
                    (local.get $35)
                   )
                  )
                 )
                )
                (local.get $26)
               )
               (then
                (array.new_default $12
                 (i32.and
                  (i32.const 47)
                  (i32.const 1023)
                 )
                )
               )
               (else
                (try_table
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (drop
                  (f32.const -1099511627776)
                 )
                 (unreachable)
                )
                (return
                 (v128.const i32x4 0xa400204b 0x4661b8ad 0xb51b01ff 0x010001fe)
                )
               )
              )
             )
            )
           )
           (local.get $25)
          )
         )
        )
       )
      )
     )
    )
   )
   (if
    (i32.const 32767)
    (then
     (drop
      (i32.and
       (i32.atomic.load acqrel offset=4
        (i32.and
         (local.get $27)
         (i32.const 15)
        )
       )
       (i32.const 15)
      )
     )
     (if
      (i32.eqz
       (i32.load8_s offset=4
        (loop (result i32)
         (if
          (i32.eqz
           (global.get $global$24)
          )
          (then
           (global.set $global$24
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$24
          (i32.sub
           (global.get $global$24)
           (i32.const 1)
          )
         )
         (i32.const -32768)
        )
       )
      )
      (then
       (drop
        (block $block2 (result f32)
         (nop)
         (br_if $block2
          (call $29
           (f32.load offset=22 align=1
            (i32.and
             (i32.const -2147483647)
             (i32.const 15)
            )
           )
          )
          (local.tee $27
           (global.get $global$0)
          )
         )
        )
       )
       (try_table
        (drop
         (if (result (ref (exact $18)))
          (i32.eqz
           (local.get $27)
          )
          (then
           (drop
            (ref.as_non_null
             (ref.null none)
            )
           )
           (drop
            (local.tee $20
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
           (block
            (nop)
            (return
             (local.get $25)
            )
           )
           (unreachable)
          )
          (else
           (call $fimport$7
            (ref.as_non_null
             (ref.null nofunc)
            )
           )
           (array.new_fixed $18 0)
          )
         )
        )
        (block
         (if
          (i32.lt_u
           (i32.add
            (local.tee $29
             (string.eq
              (string.const "\ed\a0\80\e2\82\ac")
              (local.get $11)
             )
            )
            (local.tee $30
             (local.get $27)
            )
           )
           (array.len
            (local.tee $21
             (local.get $20)
            )
           )
          )
          (then
           (if
            (i32.lt_u
             (i32.add
              (local.tee $31
               (local.get $27)
              )
              (local.tee $32
               (local.get $30)
              )
             )
             (array.len
              (local.tee $22
               (local.get $20)
              )
             )
            )
            (then
             (array.copy $6 $6
              (local.get $21)
              (local.get $29)
              (local.get $22)
              (local.get $31)
              (local.get $32)
             )
            )
           )
          )
         )
         (return
          (local.get $25)
         )
        )
        (unreachable)
       )
       (unreachable)
      )
      (else
       (call $fimport$6
        (ref.i31
         (i32.const -112)
        )
       )
       (return
        (local.get $25)
       )
      )
     )
     (unreachable)
    )
    (else
     (atomic.fence)
     (if
      (local.get $27)
      (then
       (return
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
      )
      (else
       (call $fimport$5
        (call $31
         (call_indirect $0 (type $1)
          (i32.const 5)
         )
        )
       )
       (call $fimport$7
        (ref.null nofunc)
       )
       (return
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
      )
     )
     (unreachable)
    )
   )
   (unreachable)
  )
 )
 (@binaryen.js.called)
 (func $18 (type $0) (param $0 f32)
  (local $1 (ref $3))
  (local $2 exnref)
  (local $3 exnref)
  (local $4 (ref null $14))
  (local $5 stringref)
  (local $6 structref)
  (local $7 (ref null $7))
  (local $8 arrayref)
  (local $9 (ref $2))
  (local $10 (ref null $5))
  (local $11 externref)
  (local $12 (ref null $13))
  (local $13 f32)
  (local $14 f32)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 i32)
  (local $20 i32)
  (local $21 i64)
  (local.set $0
   (call $29
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $19 (type $27) (result i32)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 v128)
  (local $13 arrayref)
  (local $14 anyref)
  (local $15 (ref $15))
  (local $16 (ref $15))
  (local $17 (ref $11))
  (local $18 (ref $11))
  (local $19 (ref $11))
  (local $20 (ref $11))
  (local $21 (ref $11))
  (local $22 (ref $11))
  (local $23 (ref $11))
  (local $24 (ref $11))
  (local $25 (ref eq))
  (local $26 (ref eq))
  (local $27 (ref array))
  (local $28 (ref null $8))
  (local $29 (ref $12))
  (local $30 (ref func))
  (local $31 (ref $16))
  (local $32 (ref $16))
  (local $33 (ref none))
  (local $34 (ref $7))
  (local $35 (ref null $0))
  (local $scratch f32)
  (local $scratch_37 i64)
  (local $scratch_38 (tuple (ref exn) f32 (ref nofunc) v128 f64))
  (local $scratch_39 v128)
  (local $scratch_40 (ref nofunc))
  (local $scratch_41 f32)
  (local $scratch_42 (ref exn))
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (local.set $15
   (struct.new $15
    (call $30
     (global.get $global$12)
    )
    (ref.func $4)
    (local.get $10)
    (array.new_default $17
     (i32.and
      (i32.const 57)
      (i32.const 1023)
     )
    )
    (call $29
     (global.get $global$2)
    )
   )
  )
  (drop
   (string.const "\ed\bd\88\ed\a0\80998")
  )
  (drop
   (array.new_default $21
    (i32.and
     (i32.const 11)
     (i32.const 1023)
    )
   )
  )
  (drop
   (i32.const -65535)
  )
  (drop
   (loop $label (result i64)
    (if
     (i32.eqz
      (global.get $global$24)
     )
     (then
      (global.set $global$24
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$24
     (i32.sub
      (global.get $global$24)
      (i32.const 1)
     )
    )
    (block $block
     (drop
      (struct.new $8
       (local.get $3)
       (ref.func $2)
       (array.new $7
        (i64.const -6938797)
        (i32.and
         (i32.const 14)
         (i32.const 1023)
        )
       )
       (call $31
        (global.get $global$11)
       )
      )
     )
     (block
      (drop
       (block (result f32)
        (local.set $scratch
         (f32.const 0)
        )
        (local.set $11
         (f64.const 4290519346)
        )
        (local.get $scratch)
       )
      )
      (local.set $9
       (call $30
        (local.get $11)
       )
      )
      (br $block)
     )
     (local.set $23
      (unreachable)
     )
    )
    (drop
     (block (result i64)
      (local.set $scratch_37
       (i64.const -66)
      )
      (local.set $5
       (i32.const -18846)
      )
      (local.get $scratch_37)
     )
    )
    (br_if $label
     (local.get $5)
    )
    (i64.or
     (i64.atomic.rmw16.sub_u offset=1
      (i32.and
       (i32.const 65535)
       (i32.const 15)
      )
      (i64.trunc_f32_u
       (loop $label1 (result f32)
        (if
         (i32.eqz
          (global.get $global$24)
         )
         (then
          (global.set $global$24
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$24
         (i32.sub
          (global.get $global$24)
          (i32.const 1)
         )
        )
        (call $fimport$3
         (call $29
          (f32.convert_i32_s
           (if (result i32)
            (local.get $3)
            (then
             (br_if $label1
              (i32.eqz
               (local.tee $3
                (local.get $3)
               )
              )
             )
             (br $label)
            )
            (else
             (i32.store8 offset=22
              (i32.and
               (global.get $global$0)
               (i32.const 15)
              )
              (local.get $3)
             )
             (i32.const -1874376369)
            )
           )
          )
         )
        )
        (br_if $label1
         (try (result i32)
          (do
           (i32.const -1707)
          )
          (catch $tag$0
           (local.set $24 (call_ref $__sinkT_0 (pop (ref $11)) (ref.func $__popsink_0)))
           (local.get $3)
          )
          (catch_all
           (block
            (table.set $1
             (i32.const 2)
             (block (result (ref exn))
              (local.set $scratch_42
               (tuple.extract 5 0
                (local.tee $scratch_38
                 (loop (type $29) (result (ref exn) f32 (ref nofunc) v128 f64)
                  (if
                   (i32.eqz
                    (global.get $global$24)
                   )
                   (then
                    (global.set $global$24
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$24
                   (i32.sub
                    (global.get $global$24)
                    (i32.const 1)
                   )
                  )
                  (tuple.make 5
                   (block $block1 (result (ref exn))
                    (try_table (catch_all_ref $block1)
                     (throw $tag$0
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                    (unreachable)
                   )
                   (f32.const 167)
                   (ref.as_non_null
                    (ref.null nofunc)
                   )
                   (v128.const i32x4 0x01001361 0x46004000 0xff004d82 0x4b82e6b2)
                   (f64.const -1797693134862315708145274e284)
                  )
                 )
                )
               )
              )
              (drop
               (block (result f32)
                (local.set $scratch_41
                 (tuple.extract 5 1
                  (local.get $scratch_38)
                 )
                )
                (drop
                 (block (result (ref nofunc))
                  (local.set $scratch_40
                   (tuple.extract 5 2
                    (local.get $scratch_38)
                   )
                  )
                  (drop
                   (block (result v128)
                    (local.set $scratch_39
                     (tuple.extract 5 3
                      (local.get $scratch_38)
                     )
                    )
                    (drop
                     (tuple.extract 5 4
                      (local.get $scratch_38)
                     )
                    )
                    (local.get $scratch_39)
                   )
                  )
                  (local.get $scratch_40)
                 )
                )
                (local.get $scratch_41)
               )
              )
              (local.get $scratch_42)
             )
            )
            (br $label)
           )
           (unreachable)
          )
         )
        )
        (call $29
         (struct.get $15 4
          (local.get $15)
         )
        )
       )
      )
     )
     (i64.const -63)
    )
   )
  )
  (block
   (nop)
   (return
    (block (result i32)
     (call $fimport$0
      (i32.const 0)
     )
     (global.get $global$0)
    )
   )
  )
  (unreachable)
 )
 (func $20 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $19)
  )
  (drop
   (call $19)
  )
 )
 (func $21 (type $3) (param $0 i32) (result v128 (ref null $11) (ref eq) (ref $4) (ref $7) f32)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $22 (type $40) (param $0 i32) (param $1 (ref $14)) (param $2 exnref) (param $3 eqref) (param $4 f32) (result i32)
  (local $5 f64)
  (local $6 v128)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 (ref $6))
  (local $12 structref)
  (local $13 exnref)
  (local $14 (ref $2))
  (local $15 (ref $2))
  (local $16 (ref $2))
  (local $17 (ref $2))
  (local $18 (ref $7))
  (local $19 (ref $11))
  (local $scratch i64)
  (local $scratch_21 (ref (exact $15)))
  (local.set $4
   (call $29
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (if
   (local.get $0)
   (then
    (call $fimport$2
     (i64.const 137438953472)
    )
    (nop)
   )
   (else
    (block
     (i64.atomic.store acqrel offset=22
      (i32.and
       (ref.is_null
        (ref.func $5)
       )
       (i32.const 15)
      )
      (if (result i64)
       (i32.lt_u
        (local.tee $9
         (loop $label (result i32)
          (if
           (i32.eqz
            (global.get $global$24)
           )
           (then
            (global.set $global$24
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$24
           (i32.sub
            (global.get $global$24)
            (i32.const 1)
           )
          )
          (local.set $5
           (local.get $5)
          )
          (block $block
           (drop
            (local.tee $7
             (local.get $0)
            )
           )
           (drop
            (array.new $13
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (i32.and
              (i32.const 7)
              (i32.const 1023)
             )
            )
           )
           (if
            (local.get $0)
            (then
             (call $fimport$2
              (i64.const 8754)
             )
             (br $label)
            )
            (else
             (try_table (catch_all $block)
              (nop)
             )
             (br $label)
            )
           )
           (local.set $17
            (local.set $14
             (local.set $15
              (local.set $16
               (unreachable)
              )
             )
            )
           )
          )
          (br_if $label
           (local.tee $0
            (string.measure_wtf16
             (string.const "\e2\82\ac\f0\90\8d\88\e2\82\ac")
            )
           )
          )
          (ref.is_null
           (array.new_default $12
            (i32.and
             (i32.const 85)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (array.len
         (local.tee $18
          (array.new $7
           (global.get $global$22)
           (i32.and
            (i32.const 67)
            (i32.const 1023)
           )
          )
         )
        )
       )
       (then
        (array.get $7
         (local.get $18)
         (local.get $9)
        )
       )
       (else
        (i64.const -129)
       )
      )
     )
     (return
      (local.get $0)
     )
    )
    (unreachable)
   )
  )
  (return_call_indirect $0 (type $26)
   (local.get $4)
   (block (result i64)
    (drop
     (block (result (ref (exact $15)))
      (local.set $scratch_21
       (struct.new $15
        (f64.const 53360)
        (ref.func $4)
        (f64.const 9223372036854775808)
        (array.new $17
         (call $31
          (global.get $global$11)
         )
         (i32.and
          (i32.const 71)
          (i32.const 1023)
         )
        )
        (call $29
         (global.get $global$2)
        )
       )
      )
      (local.set $10
       (block (result i64)
        (local.set $scratch
         (i64.const -391584)
        )
        (drop
         (string.const "\f0\90\8d\88")
        )
        (local.get $scratch)
       )
      )
      (local.get $scratch_21)
     )
    )
    (local.get $10)
   )
   (try (result f32)
    (do
     (local.get $4)
    )
    (catch $tag$0
     (throw $tag$0 (pop (ref $11)))
     (f32.const 4294945536)
    )
    (catch_all
     (loop
      (if
       (i32.eqz
        (global.get $global$24)
       )
       (then
        (global.set $global$24
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$24
       (i32.sub
        (global.get $global$24)
        (i32.const 1)
       )
      )
      (block
       (drop
        (array.new_default $17
         (i32.and
          (i32.const 14)
          (i32.const 1023)
         )
        )
       )
       (drop
        (i32.const -128)
       )
       (block
        (call $fimport$6
         (ref.i31
          (i32.const -121)
         )
        )
        (return
         (local.get $0)
        )
       )
       (unreachable)
      )
      (unreachable)
     )
     (unreachable)
    )
   )
   (i32.const 2)
  )
 )
 (func $23 (type $28) (result v128 f64 (ref null $9) anyref)
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 v128)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (block (type $30) (result v128 f64 (ref (exact $9)) (ref (exact $2)))
   (local.set $0
    (loop (result i32)
     (if
      (i32.eqz
       (global.get $global$24)
      )
      (then
       (global.set $global$24
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$24
      (i32.sub
       (global.get $global$24)
       (i32.const 1)
      )
     )
     (nop)
     (block
      (call $fimport$6
       (struct.new_default $22)
      )
      (return
       (tuple.make 4
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (f64.const 0)
        (ref.func $2)
        (array.new_fixed $18 0)
       )
      )
     )
     (unreachable)
    )
   )
   (block (type $30) (result v128 f64 (ref (exact $9)) (ref (exact $2)))
    (call $fimport$5
     (call $31
      (i32x4.neg
       (local.get $4)
      )
     )
    )
    (tuple.make 4
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (f64.const -4294967296.944)
     (ref.func $2)
     (array.new_default $2
      (i32.and
       (i32.const 8)
       (i32.const 1023)
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $24 (type $0) (param $0 f32)
  (local.set $0
   (call $29
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const 0)
  )
 )
 (func $25 (type $27) (result i32)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (block (result i32)
   (nop)
   (i32.const -27635)
  )
 )
 (func $26 (type $19)
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (drop
   (call $25)
  )
 )
 (func $27 (type $10) (param $0 i64) (param $1 f32) (param $2 i32) (result f64)
  (local $3 (ref string))
  (local.set $1
   (call $29
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (f64.const 0)
  )
 )
 (func $28 (type $9) (param $0 (ref null $5)) (param $1 anyref) (param $2 i32) (param $3 i32) (param $4 f32) (param $5 (ref $10)) (result v128 f64 i32 v128 i32 (ref $1))
  (local $6 i64)
  (local $7 i64)
  (local $8 v128)
  (local $9 v128)
  (local $10 v128)
  (local $11 v128)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 f64)
  (local $17 arrayref)
  (local $18 stringref)
  (local $19 (ref i31))
  (local $20 (ref $8))
  (local $21 nullref)
  (local $22 (ref $11))
  (local $23 (ref $21))
  (local $24 (ref null $1))
  (local $scratch i32)
  (local $scratch_26 v128)
  (local $scratch_27 i32)
  (local $scratch_28 f64)
  (local $scratch_29 v128)
  (local.set $4
   (call $29
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$24)
   )
   (then
    (global.set $global$24
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$24
   (i32.sub
    (global.get $global$24)
    (i32.const 1)
   )
  )
  (local.set $10
   (block (result v128)
    (local.set $scratch_29
     (call $31
      (local.get $10)
     )
    )
    (local.set $16
     (block (result f64)
      (local.set $scratch_28
       (call $30
        (local.get $16)
       )
      )
      (local.set $13
       (block (result i32)
        (local.set $scratch_27
         (local.get $13)
        )
        (local.set $11
         (block (result v128)
          (local.set $scratch_26
           (call $31
            (local.get $11)
           )
          )
          (local.set $14
           (block (result i32)
            (local.set $scratch
             (local.get $14)
            )
            (local.set $24
             (ref.as_non_null
              (local.get $24)
             )
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_26)
         )
        )
        (local.get $scratch_27)
       )
      )
      (local.get $scratch_28)
     )
    )
    (local.get $scratch_29)
   )
  )
  (block (type $20) (result v128 f64 i32 v128 i32 (ref $1))
   (call $fimport$3
    (call $29
     (f32.max
      (call $29
       (struct.get $15 4
        (struct.new $15
         (f64.const -10)
         (ref.func $4)
         (call $30
          (global.get $global$12)
         )
         (array.new $17
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          (i32.and
           (i32.const 35)
           (i32.const 1023)
          )
         )
         (local.get $4)
        )
       )
      )
      (try (result f32)
       (do
        (call_ref $24
         (call $30
          (global.get $global$12)
         )
         (ref.func $fimport$4)
        )
        (f32.const 4294967296)
       )
       (catch_all
        (local.get $4)
       )
      )
     )
    )
   )
   (call $fimport$8
    (global.get $gimport$1)
   )
   (loop $label2 (type $20) (result v128 f64 i32 v128 i32 (ref $1))
    (if
     (i32.eqz
      (global.get $global$24)
     )
     (then
      (global.set $global$24
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$24
     (i32.sub
      (global.get $global$24)
      (i32.const 1)
     )
    )
    (nop)
    (br_if $label2
     (if (result i32)
      (loop $label1 (result i32)
       (if
        (i32.eqz
         (global.get $global$24)
        )
        (then
         (global.set $global$24
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$24
        (i32.sub
         (global.get $global$24)
         (i32.const 1)
        )
       )
       (loop $label
        (if
         (i32.eqz
          (global.get $global$24)
         )
         (then
          (global.set $global$24
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$24
         (i32.sub
          (global.get $global$24)
          (i32.const 1)
         )
        )
        (block $block
         (block
          (if
           (if (result i32)
            (local.get $3)
            (then
             (return
              (tuple.make 6
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               (f64.const 0)
               (i32.const -12283)
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               (i32.const -4)
               (ref.func $5)
              )
             )
            )
            (else
             (local.tee $2
              (ref.is_null
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
             )
            )
           )
           (then
            (call $fimport$3
             (call $29
              (f32x4.extract_lane 0
               (local.get $8)
              )
             )
            )
            (br $label)
           )
           (else
            (call $fimport$8
             (ref.null noextern)
            )
            (br $block)
           )
          )
          (local.set $23
           (local.set $22
            (local.set $20
             (unreachable)
            )
           )
          )
         )
         (nop)
        )
       )
       (br_if $label1
        (i32.const -26)
       )
       (local.get $3)
      )
      (then
       (local.get $2)
      )
      (else
       (local.get $3)
      )
     )
    )
    (tuple.make 6
     (call $31
      (local.get $10)
     )
     (call $30
      (local.get $16)
     )
     (local.get $13)
     (call $31
      (local.get $11)
     )
     (local.get $14)
     (ref.as_non_null
      (local.get $24)
     )
    )
   )
  )
 )
 (func $29 (type $41) (param $0 f32) (result f32)
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
 (func $30 (type $42) (param $0 f64) (result f64)
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
 (func $31 (type $43) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param (ref $11)) (result (ref $11))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
