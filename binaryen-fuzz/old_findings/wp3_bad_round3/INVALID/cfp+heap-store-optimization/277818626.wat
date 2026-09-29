(module
 (rec
  (type $0 (sub (array (mut i32))))
  (type $1 (sub (array f32)))
  (type $2 (sub (struct (field i64) (field i16) (field i32))))
  (type $3 (struct (field (mut i32)) (field i64)))
  (type $4 (sub final $2 (struct (field i64) (field i16) (field i32) (field (mut f64)) (field (mut f64)) (field i8))))
  (type $5 (sub final $0 (array (mut i32))))
  (type $6 (array (mut (ref $5))))
  (type $7 (sub (func (result (ref null $0)))))
  (type $8 (sub (func (result v128 i64 i32 v128 (ref $8)))))
 )
 (type $9 (func))
 (type $10 (array i8))
 (rec
  (type $11 (sub (struct (field (mut v128)))))
  (type $12 (sub (func (result v128))))
 )
 (type $13 (struct))
 (type $14 (func (result i64 i64)))
 (type $15 (array (mut i16)))
 (type $16 (func (param i32)))
 (type $17 (func (param externref)))
 (type $18 (func (param f32)))
 (type $19 (func (result anyref)))
 (type $20 (func (param stringref) (result i64 i64)))
 (type $21 (func (param i32 f64 f64) (result f32)))
 (type $22 (func (result v128 (ref null $11))))
 (type $23 (func (param (ref null $3))))
 (type $24 (func (param i32) (result funcref)))
 (type $25 (func (param i32 funcref)))
 (type $26 (func (param i64)))
 (type $27 (func (param f64)))
 (type $28 (func (param v128)))
 (type $29 (func (param anyref)))
 (type $30 (func (param funcref)))
 (type $31 (func (param i32 i32)))
 (type $32 (func (param i32) (result i32)))
 (type $33 (func (param f64 f32) (result i64)))
 (type $34 (func (param i32) (result (ref $11))))
 (type $35 (func (param f32 i32 (ref null $0)) (result i32)))
 (type $36 (func (result f64)))
 (type $37 (func (param (ref string) i64 f64) (result i31ref)))
 (type $38 (func (param f32 f64) (result i64 i64)))
 (type $39 (func (param (ref null $7))))
 (type $40 (func (param externref) (result i64)))
 (type $41 (func (param v128 (ref $8) structref i64) (result externref)))
 (type $42 (func (param externref (ref struct)) (result v128)))
 (type $43 (func (param (ref null $7) (ref null $2) i64 f64) (result (ref array))))
 (type $44 (func (result (ref null $0))))
 (type $45 (func (param (ref $8) (ref $8) (ref $6) (ref null $6) f32) (result (ref null $3))))
 (type $46 (func (param structref arrayref) (result (ref $1))))
 (type $47 (func (param i64 (ref $5)) (result exnref)))
 (type $48 (func (param (ref null $8) stringref) (result i64)))
 (type $49 (func (param (ref array) f32 f32 (ref string))))
 (type $50 (func (param f32) (result f32)))
 (type $51 (func (param f64) (result f64)))
 (type $52 (func (param v128) (result v128)))
 (type $53 (func (result v128 i64 i32 v128 (ref (exact $8)))))
 (type $54 (func (result f64 (ref none) f32 i32)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_28" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $16) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $24) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $25) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $16) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $26) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $18) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $27) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $28) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $29) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $30) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $17) (param externref)))
 (import "fuzzing-support" "call-export" (func $fimport$11 (type $31) (param i32 i32)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$12 (type $32) (param i32) (result i32)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $16) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $17) (param externref)))
 (global $global$0 (mut f32) (f32.const 33554432))
 (global $global$1 (mut i64) (i64.const -128))
 (global $global$2 (ref $7) (ref.func $0))
 (global $global$3 i64 (i64.const -4294967295))
 (global $global$4 i64 (i64.const -25839))
 (global $global$5 f32 (f32.const 9223372036854775808))
 (global $global$6 (ref struct) (struct.new_default $13))
 (global $global$7 f32 (global.get $global$5))
 (global $global$8 f64 (f64.const -262144))
 (global $global$9 (mut i64) (i64.const -34359738368))
 (global $global$10 i32 (i32.const -129251))
 (global $global$11 (mut (ref $12)) (ref.func $1))
 (global $global$12 (mut i64) (i64.const -256))
 (global $global$13 (mut exnref) (ref.null noexn))
 (global $global$14 arrayref (array.new_fixed $10 0))
 (global $global$15 (mut f64) (f64.const 5))
 (global $global$16 (mut f64) (f64.const -1797693134862315708145274e284))
 (global $global$17 (ref $3) (struct.new_default $3))
 (global $global$18 (mut i64) (i64.const -9223372036854775807))
 (global $global$19 (mut (ref null $0)) (ref.null none))
 (global $global$20 f32 (f32.const 0))
 (global $global$21 arrayref (array.new_fixed $10 0))
 (global $global$22 i31ref (ref.i31
  (i32.const -116)
 ))
 (global $global$23 (ref null $2) (struct.new_default $2))
 (global $global$24 (ref $6) (array.new $6
  (array.new_default $5
   (i32.const 91)
  )
  (i32.const 58)
 ))
 (global $global$25 (mut (ref $7)) (ref.func $0))
 (global $global$26 (mut (ref null $2)) (struct.new_default $2))
 (global $global$27 (mut (ref null $2)) (struct.new_default $2))
 (global $global$28 (mut f32) (f32.const 55584))
 (global $global$29 i64 (i64.const -17592186044416))
 (global $global$30 arrayref (array.new_fixed $10 0))
 (global $global$31 f32 (f32.const -9223372036854775808))
 (global $global$32 (ref null $4) (struct.new_default $4))
 (global $global$33 i31ref (ref.i31
  (i32.const -32)
 ))
 (global $global$34 arrayref (ref.null none))
 (global $global$35 i32 (i32.const 111))
 (global $global$36 funcref (ref.null nofunc))
 (global $global$37 (ref $5) (array.new $5
  (global.get $global$35)
  (i32.const 6)
 ))
 (global $global$38 (mut i64) (i64.const -4194304))
 (global $global$39 (mut i64) (i64.const 2147483648))
 (global $global$40 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 (i32.const 0) ";\bf_\8a\b0\08n\dcE\r\e5")
 (data $1 "\84\9dG\de13\7f\ff9\bca\e81x\d0D\bc\90\ef\14\'\fd\ed")
 (data $2 "\d8\fa\85\a2\1e\e9s\03\eb\8e\80\1b\07\02\9c\ab\a5\ce\b3\03O)\d6\fb\d6{f=")
 (data $3 "*\c5\86(\adD")
 (data $4 (i32.const 11) "\99\16\0e\c5")
 (table $0 i64 16 16 funcref)
 (table $1 4 exnref)
 (elem $0 (table $0) (i64.const 0) func $13 $20 $22 $28 $28 $31 $35 $36 $36 $42 $45 $48 $48 $53 $55 $55)
 (elem declare func $11 $26 $30 $39 $4 $fimport$5)
 (tag $tag$0 (type $23) (param (ref null $3)))
 (tag $tag$1 (type $9))
 (tag $tag$2 (type $9))
 (export "global$" (global $global$0))
 (export "global$_2" (global $global$2))
 (export "global$_5" (global $global$6))
 (export "global$_7" (global $global$8))
 (export "global$_8" (global $global$9))
 (export "global$_13" (global $global$14))
 (export "global$_15" (global $global$17))
 (export "global$_18" (global $global$24))
 (export "global$_19" (global $global$25))
 (export "wasmtag" (tag $eimport$0))
 (export "table" (table $0))
 (export "ref_func_target_invoker" (func $2))
 (export "ref_func_target_1_invoker" (func $3))
 (export "func" (func $4))
 (export "func_18" (func $5))
 (export "func_18_invoker" (func $6))
 (export "func_20_invoker" (func $8))
 (export "func_22" (func $9))
 (export "func_22_invoker" (func $10))
 (export "func_24_invoker" (func $12))
 (export "func_26" (func $13))
 (export "func_26_invoker" (func $14))
 (export "func_28" (func $15))
 (export "func_28_invoker" (func $16))
 (export "func_31" (func $18))
 (export "func_31_invoker" (func $19))
 (export "func_33" (func $20))
 (export "func_33_invoker" (func $21))
 (export "func_35" (func $22))
 (export "func_36" (func $23))
 (export "func_36_invoker" (func $24))
 (export "func_41_invoker" (func $29))
 (export "func_44_invoker" (func $32))
 (export "func_46" (func $33))
 (export "func_46_invoker" (func $34))
 (export "func_50_invoker" (func $38))
 (export "func_52" (func $39))
 (export "func_53_invoker" (func $41))
 (export "func_55_invoker" (func $43))
 (export "func_57" (func $44))
 (export "func_61" (func $48))
 (export "func_62" (func $49))
 (export "func_62_invoker" (func $50))
 (export "func_64_invoker" (func $52))
 (export "func_66" (func $53))
 (export "func_66_invoker" (func $54))
 (export "func_68" (func $55))
 (export "func_68_invoker" (func $56))
 (export "func_70_invoker" (func $58))
 (export "func_72" (func $59))
 (func $0 (type $7) (result (ref null $0))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $12) (result v128)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $0)
  )
 )
 (func $3 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $62
    (call $1)
   )
  )
  (drop
   (call $62
    (call $1)
   )
  )
 )
 (func $4 (type $12) (result v128)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (return
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
 )
 (func $5 (type $33) (param $0 f64) (param $1 f32) (result i64)
  (local $2 (ref $0))
  (local $3 arrayref)
  (local $4 (ref $11))
  (local $5 (ref $12))
  (local $6 (ref i31))
  (local $7 i32)
  (local.set $0
   (call $61
    (local.get $0)
   )
  )
  (local.set $1
   (call $60
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (i64.const 4294967295)
 )
 (func $6 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $5
    (f64.const -30)
    (f32.const -51)
   )
  )
 )
 (func $7 (type $12) (result v128)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $62
   (call_ref $12
    (ref.func $4)
   )
  )
 )
 (func $8 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $62
    (call $7)
   )
  )
 )
 (func $9 (type $19) (result anyref)
  (local $0 (ref null $5))
  (local $1 externref)
  (local $2 externref)
  (local $3 (ref null $12))
  (local $4 (ref $11))
  (local $5 (ref $0))
  (local $6 nullref)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block
   (block
    (nop)
    (return
     (struct.new_default $13)
    )
   )
   (local.set $4
    (unreachable)
   )
  )
  (unreachable)
 )
 (func $10 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $9)
  )
  (drop
   (call $9)
  )
 )
 (@binaryen.js.called)
 (func $11 (type $7) (result (ref null $0))
  (local $0 (ref null $2))
  (local $1 (ref null $2))
  (local $2 (ref null $5))
  (local $3 i31ref)
  (local $4 exnref)
  (local $5 (ref $4))
  (local $6 anyref)
  (local $7 anyref)
  (local $8 funcref)
  (local $9 funcref)
  (local $10 (ref null $1))
  (local $11 (ref null $0))
  (local $12 externref)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 f32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (array.new_default $0
   (i32.and
    (i32.const 33)
    (i32.const 1023)
   )
  )
 )
 (func $12 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $11)
  )
 )
 (func $13 (type $7) (result (ref null $0))
  (local $0 (ref null $3))
  (local $1 (ref null $4))
  (local $2 arrayref)
  (local $3 (ref null $5))
  (local $4 f32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const -27391)
  )
  (return
   (array.new $0
    (ref.is_null
     (struct.new $11
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     )
    )
    (i32.and
     (i32.const 31)
     (i32.const 1023)
    )
   )
  )
 )
 (func $14 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $13)
  )
  (drop
   (call $13)
  )
 )
 (@binaryen.js.called)
 (func $15 (type $12) (result v128)
  (local $0 v128)
  (local $scratch f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (block (result f64)
    (local.set $scratch
     (f64.const 0)
    )
    (local.set $0
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (local.get $scratch)
   )
  )
  (call $62
   (i16x8.splat
    (i16x8.extract_lane_s 3
     (call $62
      (local.get $0)
     )
    )
   )
  )
 )
 (func $16 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $62
    (call $15)
   )
  )
 )
 (func $17 (type $7) (result (ref null $0))
  (local $0 i32)
  (local $1 f64)
  (local $2 structref)
  (local $3 (ref null $3))
  (local $4 anyref)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block $block (result (ref (exact $5)))
   (drop
    (br_on_cast $block (ref (exact $5)) (ref (exact $5))
     (array.new_default $5
      (i32.and
       (i32.const 80)
       (i32.const 1023)
      )
     )
    )
   )
   (return
    (array.new $0
     (global.get $global$10)
     (i32.and
      (i32.const 94)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $18 (type $7) (result (ref null $0))
  (local $0 externref)
  (local $1 externref)
  (local $2 (ref null $2))
  (local $3 (ref string))
  (local $4 i64)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (array.new_default $5
   (i32.and
    (i32.const 30)
    (i32.const 1023)
   )
  )
 )
 (func $19 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $18)
  )
  (drop
   (call $18)
  )
 )
 (func $20 (type $20) (param $0 stringref) (result i64 i64)
  (local $1 externref)
  (local $2 (ref null $12))
  (local $3 (ref $7))
  (local $4 funcref)
  (local $5 (ref null $0))
  (local $6 (ref null $4))
  (local $7 (ref null $6))
  (local $8 (ref $11))
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 f32)
  (local $14 f32)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const -49)
   (i64.const 35184372088832)
  )
 )
 (func $21 (type $9)
  (local $scratch (tuple i64 i64))
  (local $scratch_1 i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $20
        (string.const "")
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
 (func $22 (type $34) (param $0 i32) (result (ref $11))
  (local $1 eqref)
  (local $2 (ref null $8))
  (local $3 (ref $7))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const 245)
  )
  (return
   (struct.new $11
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $23 (type $35) (param $0 f32) (param $1 i32) (param $2 (ref null $0)) (result i32)
  (local $3 f64)
  (local $4 v128)
  (local $5 f32)
  (local $6 (ref struct))
  (local $7 structref)
  (local $8 (ref i31))
  (local.set $0
   (call $60
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (i31.get_s
   (if (result (ref i31))
    (i32.eqz
     (local.get $1)
    )
    (then
     (block $block (result (ref i31))
      (drop
       (br_on_cast $block (ref i31) (ref i31)
        (ref.i31
         (i32.const 131072)
        )
       )
      )
      (drop
       (struct.new_default $3)
      )
      (local.tee $8
       (ref.i31
        (i32.const -65)
       )
      )
     )
    )
    (else
     (ref.i31
      (i32.const -2147483648)
     )
    )
   )
  )
 )
 (func $24 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $23
    (f32.const -1)
    (i32.const 1)
    (ref.null none)
   )
  )
  (drop
   (call $23
    (f32.const -32767.89453125)
    (i32.const -128)
    (array.new $0
     (ref.is_null
      (array.new_default $1
       (i32.and
        (i32.const 7)
        (i32.const 1023)
       )
      )
     )
     (i32.and
      (i32.const 21)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $25 (type $36) (result f64)
  (local $0 i32)
  (local $1 f32)
  (local $2 (ref null $5))
  (local $3 (ref null $12))
  (local $4 (ref null $3))
  (local $5 (ref null $4))
  (local $6 (ref null $4))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result f64)
   (call_ref $18
    (call $60
     (f32.min
      (loop (result f32)
       (if
        (i32.eqz
         (global.get $global$40)
        )
        (then
         (global.set $global$40
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$40
        (i32.sub
         (global.get $global$40)
         (i32.const 1)
        )
       )
       (local.tee $1
        (call $60
         (f32.demote_f64
          (call $61
           (global.get $global$8)
          )
         )
        )
       )
      )
      (local.get $1)
     )
    )
    (ref.func $fimport$5)
   )
   (call $61
    (struct.get $4 4
     (struct.new_default $4)
    )
   )
  )
 )
 (func $26 (type $8) (result v128 i64 i32 v128 (ref $8))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $27 (type $8) (result v128 i64 i32 v128 (ref $8))
  (local $0 f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 (ref null $1))
  (local $5 (ref struct))
  (local $6 (ref eq))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block $block (type $53) (result v128 i64 i32 v128 (ref (exact $8)))
   (br_if $block
    (tuple.make 5
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (i64.const 9007199254740993)
     (i32.const 143)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (ref.func $26)
    )
    (i32.eqz
     (i32.const -2147483647)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $28 (type $37) (param $0 (ref string)) (param $1 i64) (param $2 f64) (result i31ref)
  (local $3 (ref $3))
  (local $4 externref)
  (local $5 (ref $0))
  (local $6 (ref $5))
  (local $7 (ref null $5))
  (local $8 i31ref)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 f64)
  (local $13 i64)
  (local.set $2
   (call $61
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (ref.i31
    (i32.const -5367)
   )
  )
 )
 (func $29 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $28
    (string.const "")
    (i64.const -8)
    (f64.const -0.165)
   )
  )
 )
 (func $30 (type $38) (param $0 f32) (param $1 f64) (result i64 i64)
  (local $2 (ref null $2))
  (local $3 (ref $5))
  (local $4 (ref string))
  (local $5 (ref $6))
  (local $6 (ref $6))
  (local $7 (ref $6))
  (local $8 (ref $1))
  (local $9 (ref $1))
  (local $10 (ref null $3))
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local.set $0
   (call $60
    (local.get $0)
   )
  )
  (local.set $1
   (call $61
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (if
   (i31.get_u
    (ref.i31
     (i32.const 1)
    )
   )
   (then
    (call $fimport$2
     (i32.const 126)
     (ref.func $30)
    )
   )
   (else
    (nop)
   )
  )
  (return_call_indirect $0 (type $20)
   (local.tee $4
    (string.const "\e2\82\ac\ed\bd\88")
   )
   (i64.const 1)
  )
 )
 (func $31 (type $39) (param $0 (ref null $7))
  (local $1 (ref array))
  (local $2 externref)
  (local $3 anyref)
  (local $4 i31ref)
  (local $5 funcref)
  (local $6 (ref $8))
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $32 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $31
   (ref.func $11)
  )
 )
 (func $33 (type $40) (param $0 externref) (result i64)
  (local $1 anyref)
  (local $2 (ref $1))
  (local $3 (ref null $3))
  (local $4 (ref null $7))
  (local $5 (ref null $7))
  (local $6 (ref string))
  (local $7 i32)
  (local $8 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (loop $label (result i64)
   (if
    (i32.eqz
     (global.get $global$40)
    )
    (then
     (global.set $global$40
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$40
    (i32.sub
     (global.get $global$40)
     (i32.const 1)
    )
   )
   (call $fimport$10
    (local.tee $0
     (global.get $gimport$0)
    )
   )
   (call $fimport$3
    (global.get $global$35)
   )
   (block $block
    (loop
     (if
      (i32.eqz
       (global.get $global$40)
      )
      (then
       (global.set $global$40
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$40
      (i32.sub
       (global.get $global$40)
       (i32.const 1)
      )
     )
     (call $fimport$10
      (ref.cast (ref extern)
       (global.get $gimport$0)
      )
     )
     (br $block)
    )
    (unreachable)
   )
   (if
    (i32.const 1048576)
    (then
     (call $fimport$3
      (i32.const 65536)
     )
     (return
      (i64.const -44)
     )
    )
    (else
     (call $fimport$6
      (f64.const 121)
     )
     (block
      (call $fimport$8
       (ref.i31
        (i32.const -120)
       )
      )
      (br $label)
     )
     (local.set $6
      (unreachable)
     )
    )
   )
   (unreachable)
  )
 )
 (func $34 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $33
    (ref.null noextern)
   )
  )
  (drop
   (call $33
    (string.const "")
   )
  )
  (drop
   (call $33
    (global.get $gimport$1)
   )
  )
 )
 (func $35 (type $21) (param $0 i32) (param $1 f64) (param $2 f64) (result f32)
  (local $3 i64)
  (local $4 f64)
  (local.set $1
   (call $61
    (local.get $1)
   )
  )
  (local.set $2
   (call $61
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (f32.const 4)
 )
 (func $36 (type $14) (result i64 i64)
  (local $0 i32)
  (local $1 f32)
  (local $2 f64)
  (local $3 structref)
  (local $4 (ref null $12))
  (local $5 (ref null $8))
  (local $6 (ref null $8))
  (local $7 eqref)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const 134217728)
   (i64.const -91)
  )
 )
 (func $37 (type $41) (param $0 v128) (param $1 (ref $8)) (param $2 structref) (param $3 i64) (result externref)
  (local $4 (ref null $0))
  (local $5 (ref null $0))
  (local $6 (ref null $0))
  (local $7 (ref null $3))
  (local $8 (ref null $6))
  (local $9 (ref null $12))
  (local $10 i31ref)
  (local $11 i31ref)
  (local $12 stringref)
  (local $13 anyref)
  (local $14 (ref $2))
  (local $15 (ref array))
  (local $16 arrayref)
  (local $17 (ref null $2))
  (local $18 i64)
  (local $19 i64)
  (local $20 i32)
  (local $21 f64)
  (local $22 f32)
  (local.set $0
   (call $62
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (string.const "\e2\82\ac")
 )
 (func $38 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $37
    (v128.const i32x4 0xa0010002 0x0000bc4b 0x2d7f00fe 0x80007fef)
    (ref.func $26)
    (ref.null none)
    (i64.const -17148)
   )
  )
  (drop
   (call $37
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (ref.func $26)
    (struct.new_default $13)
    (i64.const -17179869184)
   )
  )
 )
 (@binaryen.js.called)
 (func $39 (type $8) (result v128 i64 i32 v128 (ref $8))
  (local $0 (ref $4))
  (local $1 (ref null $3))
  (local $2 (ref null $3))
  (local $3 i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.set $0
   (struct.new_default $4)
  )
  (memory.copy
   (i32.and
    (global.get $global$10)
    (i32.const 15)
   )
   (ref.test (ref $4)
    (try $__t_3 (result (ref $4)) (do (try (result (ref $4)) (do 
      (struct.new_default $4)
     ) (delegate $__t_3))) (catch $tag$1
(local.tee $0
       (struct.new_default $4)
      )
(if (global.get $__rt) (then (rethrow $__t_3)))) (catch $tag$0
(drop (struct.get $3 0 (pop (ref null $3))))
(if (global.get $__rt) (then (rethrow $__t_3)))
(local.get $0)))
   )
   (if (result i32)
    (i32.eqz
     (call $fimport$12
      (i32.rem_u
       (ref.eq
        (struct.new_default $11)
        (try $__t_2 (result (ref $3)) (do (try (result (ref $3)) (do 
          (ref.cast (ref $3)
           (local.get $2)
          )
         ) (delegate $__t_2))) (catch_all (if (global.get $__rt) (then (rethrow $__t_2)))
(struct.new_default $3)))
       )
       (i32.const 74)
      )
     )
    )
    (then
     (i32.const -17)
    )
    (else
     (call $fimport$2
      (i64.le_u
       (local.get $3)
       (local.get $3)
      )
      (call $fimport$1
       (i32.const -7779012)
      )
     )
     (return
      (tuple.make 5
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (i64.const 8796093022209)
       (i32.const -65535)
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (ref.func $26)
      )
     )
    )
   )
  )
  (return
   (tuple.make 5
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (i64.const -57)
    (i32.const -5213182)
    (v128.const i32x4 0xff6c6301 0x5c8a0bbf 0xa3637e00 0x24135bff)
    (ref.func $26)
   )
  )
 )
 (func $40 (type $12) (result v128)
  (local $0 f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $62
   (v128.load offset=4 align=1
    (i32.and
     (ref.eq
      (if (result (ref (exact $5)))
       (i32.eqz
        (i32.load16_u offset=3 align=1
         (i32.and
          (try_table (result i32)
           (i32.const 67108863)
          )
          (i32.const 15)
         )
        )
       )
       (then
        (return
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
       )
       (else
        (call $fimport$6
         (local.get $0)
        )
        (array.new_default $5
         (i32.and
          (i32.const 82)
          (i32.const 1023)
         )
        )
       )
      )
      (if (result (ref (exact $10)))
       (i32.eqz
        (i32.const 99)
       )
       (then
        (array.new_fixed $10 0)
       )
       (else
        (call $fimport$0
         (i32.const -39)
        )
        (return
         (v128.const i32x4 0x00000000 0x40548000 0xb22d0e56 0x410ffffe)
        )
       )
      )
     )
     (ref.eq
      (struct.new_default $3)
      (try_table (result (ref (exact $10)))
       (array.new_fixed $10 0)
      )
     )
    )
   )
  )
 )
 (func $41 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $62
    (call $40)
   )
  )
 )
 (func $42 (type $42) (param $0 externref) (param $1 (ref struct)) (result v128)
  (local $2 (ref string))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $fimport$9
   (ref.func $42)
  )
  (return
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
 )
 (func $43 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $62
    (call $42
     (global.get $gimport$1)
     (struct.new_default $13)
    )
   )
  )
 )
 (func $44 (type $43) (param $0 (ref null $7)) (param $1 (ref null $2)) (param $2 i64) (param $3 f64) (result (ref array))
  (local $4 funcref)
  (local $5 exnref)
  (local $6 (ref $4))
  (local $7 f32)
  (local $8 i32)
  (local.set $3
   (call $61
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $10)))
   (call $fimport$9
    (global.get $global$36)
   )
   (call $fimport$0
    (i32.const 0)
   )
   (array.new_fixed $10 0)
  )
 )
 (func $45 (type $44) (result (ref null $0))
  (local $0 (ref any))
  (local $1 (ref $4))
  (local $2 (ref null $4))
  (local $3 (ref $5))
  (local $4 (ref $5))
  (local $5 (ref $5))
  (local $6 (ref $5))
  (local $7 (ref $5))
  (local $8 (ref $0))
  (local $9 (ref $0))
  (local $10 (ref $12))
  (local $11 (ref null $3))
  (local $12 (ref null $3))
  (local $13 (ref null $3))
  (local $14 (ref null $3))
  (local $15 (ref string))
  (local $16 (ref none))
  (local $17 (ref $6))
  (local $18 (ref array))
  (local $19 f64)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $32 i32)
  (local $33 i32)
  (local $34 f32)
  (local $35 i64)
  (local $36 i64)
  (local $37 i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.set $18
   (array.new_fixed $10 0)
  )
  (block (result nullref)
   (data.drop $1)
   (loop $label (result nullref)
    (if
     (i32.eqz
      (global.get $global$40)
     )
     (then
      (global.set $global$40
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$40
     (i32.sub
      (global.get $global$40)
      (i32.const 1)
     )
    )
    (nop)
    (br_if $label
     (local.get $20)
    )
    (ref.null none)
   )
  )
 )
 (func $46 (type $12) (result v128)
  (local $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 f64)
  (local $5 (ref null $8))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
 )
 (func $47 (type $45) (param $0 (ref $8)) (param $1 (ref $8)) (param $2 (ref $6)) (param $3 (ref null $6)) (param $4 f32) (result (ref null $3))
  (local.set $4
   (call $60
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $3)))
   (nop)
   (struct.new_default $3)
  )
 )
 (func $48 (type $19) (result anyref)
  (local $0 (ref string))
  (local $1 structref)
  (local $2 arrayref)
  (local $3 i31ref)
  (local $4 (ref array))
  (local $5 v128)
  (local $6 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (ref.i31
   (i32.const -40)
  )
 )
 (func $49 (type $46) (param $0 structref) (param $1 arrayref) (result (ref $1))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $1)))
   (call $10)
   (array.new $1
    (call $60
     (global.get $global$0)
    )
    (i32.and
     (i32.const 6)
     (i32.const 1023)
    )
   )
  )
 )
 (func $50 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $49
    (struct.new_default $13)
    (array.new_fixed $10 0)
   )
  )
  (drop
   (call $49
    (struct.new_default $13)
    (array.new_fixed $10 0)
   )
  )
  (drop
   (call $49
    (struct.new_default $13)
    (array.new_fixed $10 0)
   )
  )
  (drop
   (call $49
    (ref.null none)
    (array.new_fixed $10 0)
   )
  )
  (drop
   (call $49
    (struct.new_default $13)
    (array.new_fixed $10 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $51 (type $47) (param $0 i64) (param $1 (ref $5)) (result exnref)
  (local $2 exnref)
  (local $3 stringref)
  (local $4 eqref)
  (local $5 eqref)
  (local $6 i31ref)
  (local $7 (ref eq))
  (local $8 (ref null $2))
  (local $9 (ref null $2))
  (local $10 (ref null $2))
  (local $11 (ref $3))
  (local $12 anyref)
  (local $13 anyref)
  (local $14 (ref null $0))
  (local $15 (ref null $4))
  (local $16 (ref $8))
  (local $17 (ref struct))
  (local $18 (ref null $1))
  (local $19 i32)
  (local $20 i32)
  (local $21 i64)
  (local $22 i64)
  (local $23 f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block $block (result (ref exn))
   (try_table (catch_all_ref $block)
    (throw $tag$2)
   )
   (unreachable)
  )
 )
 (func $52 (type $9)
  (local $0 (ref string))
  (local $1 (ref $5))
  (local $2 (ref $5))
  (local $3 (ref $5))
  (local $4 (ref $15))
  (local $5 (ref $15))
  (local $6 nullref)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $scratch (tuple f64 (ref none) f32 i32))
  (local $scratch_12 f32)
  (local $scratch_13 (ref none))
  (local $scratch_14 f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $51
    (i64.const 4294967207)
    (array.new $5
     (string.compare
      (string.const "\ed\bd\88\e2\82\ac\ed\a0\80")
      (local.tee $0
       (string.const "\ed\bd\88\c2\a3")
      )
     )
     (i32.and
      (i32.const 96)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $51
    (i64.const -1843898861)
    (array.new $5
     (ref.eq
      (local.tee $1
       (if (result (ref $5))
        (i32.const 32767)
        (then
         (try_table (result (ref $5))
          (loop $label2 (result (ref $5))
           (if
            (i32.eqz
             (global.get $global$40)
            )
            (then
             (global.set $global$40
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$40
            (i32.sub
             (global.get $global$40)
             (i32.const 1)
            )
           )
           (loop $label1
            (if
             (i32.eqz
              (global.get $global$40)
             )
             (then
              (global.set $global$40
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$40
             (i32.sub
              (global.get $global$40)
              (i32.const 1)
             )
            )
            (if
             (i32.eqz
              (i32.const 134217728)
             )
             (then
              (nop)
              (nop)
             )
             (else
              (nop)
             )
            )
            (br_if $label1
             (if (result i32)
              (i32.lt_u
               (local.tee $8
                (loop $label (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$40)
                  )
                  (then
                   (global.set $global$40
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$40
                  (i32.sub
                   (global.get $global$40)
                   (i32.const 1)
                  )
                 )
                 (i32.store offset=22 align=1
                  (try_table (result i32) (catch_all $label)
                   (ref.is_null
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (i64.ne
                   (i64.const -288230376151711744)
                   (local.get $7)
                  )
                 )
                 (br_if $label
                  (i32.const 255)
                 )
                 (drop
                  (block (result f64)
                   (local.set $scratch_14
                    (tuple.extract 4 0
                     (local.tee $scratch
                      (if (type $54) (result f64 (ref none) f32 i32)
                       (i32.const 5716)
                       (then
                        (tuple.make 4
                         (f64.const 0)
                         (ref.as_non_null
                          (ref.null none)
                         )
                         (f32.const 0)
                         (i32.const 8388608)
                        )
                       )
                       (else
                        (tuple.make 4
                         (f64.const 0)
                         (ref.as_non_null
                          (ref.null none)
                         )
                         (f32.const 53107)
                         (i32.const -11460)
                        )
                       )
                      )
                     )
                    )
                   )
                   (drop
                    (block (result (ref none))
                     (local.set $scratch_13
                      (tuple.extract 4 1
                       (local.get $scratch)
                      )
                     )
                     (drop
                      (block (result f32)
                       (local.set $scratch_12
                        (tuple.extract 4 2
                         (local.get $scratch)
                        )
                       )
                       (local.set $10
                        (tuple.extract 4 3
                         (local.get $scratch)
                        )
                       )
                       (local.get $scratch_12)
                      )
                     )
                     (local.get $scratch_13)
                    )
                   )
                   (local.get $scratch_14)
                  )
                 )
                 (local.get $10)
                )
               )
               (array.len
                (local.tee $2
                 (array.new_default $5
                  (i32.and
                   (i32.const 53)
                   (i32.const 1023)
                  )
                 )
                )
               )
              )
              (then
               (array.get $5
                (local.get $2)
                (local.get $8)
               )
              )
              (else
               (i32.const -113)
              )
             )
            )
            (f32.store offset=4
             (i32.and
              (stringview_wtf16.get_codeunit
               (try_table (result (ref string)) (catch $tag$1 $label2) (catch_all $label1)
                (drop
                 (br_on_null $label1
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                 )
                )
                (local.get $0)
               )
               (block (result i32)
                (local.set $10
                 (ref.eq
                  (if (result nullref)
                   (i32.const 64)
                   (then
                    (ref.null none)
                   )
                   (else
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (ref.i31
                   (i32.const 127)
                  )
                 )
                )
                (local.get $10)
               )
              )
              (i32.const 15)
             )
             (f32.const -17)
            )
           )
           (br_if $label2
            (i32.const -255)
           )
           (local.set $3
            (br $label2)
           )
          )
         )
        )
        (else
         (return)
        )
       )
      )
      (ref.null none)
     )
     (i32.and
      (i32.const 81)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $51
    (i64.const -32767)
    (array.new_default $5
     (i32.and
      (i32.const 0)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $51
    (i64.const -2048)
    (array.new_default $5
     (i32.and
      (i32.const 14)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (i64.const -67)
  )
  (drop
   (string.from_code_point
    (string.encode_wtf16_array
     (string.const "\c2\a3")
     (local.tee $4
      (local.tee $5
       (array.new $15
        (global.get $global$10)
        (i32.and
         (i32.const 17)
         (i32.const 1023)
        )
       )
      )
     )
     (memory.atomic.notify offset=22
      (i32.and
       (i32.const -65535)
       (i32.const 15)
      )
      (i8x16.extract_lane_s 9
       (loop (result v128)
        (if
         (i32.eqz
          (global.get $global$40)
         )
         (then
          (global.set $global$40
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$40
         (i32.sub
          (global.get $global$40)
          (i32.const 1)
         )
        )
        (call $62
         (i32x4.le_s
          (call $62
           (v128.load offset=4 align=8
            (i32.and
             (i32.const 127)
             (i32.const 15)
            )
           )
          )
          (v128.const i32x4 0xdf000000 0x55000000 0xc5c5d800 0xc67ffc00)
         )
        )
       )
      )
     )
    )
   )
  )
  (block
   (return)
  )
  (unreachable)
 )
 (func $53 (type $48) (param $0 (ref null $8)) (param $1 stringref) (result i64)
  (local $2 (ref null $3))
  (local $3 (ref null $3))
  (local $4 (ref null $3))
  (local $5 (ref struct))
  (local $6 (ref null $4))
  (local $7 (ref null $11))
  (local $8 eqref)
  (local $9 exnref)
  (local $10 (ref string))
  (local $11 (ref $15))
  (local $12 (ref null $0))
  (local $13 (ref $0))
  (local $14 (ref $0))
  (local $15 (ref $5))
  (local $16 (ref $5))
  (local $17 (ref $5))
  (local $18 (ref $1))
  (local $19 f32)
  (local $20 f32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 f64)
  (local $30 v128)
  (local $31 v128)
  (local $32 i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.set $15
   (array.new $5
    (global.get $global$10)
    (i32.and
     (local.tee $24
      (try_table (result i32)
       (try $__t_1 (result i32) (do (try (result i32) (do 
         (local.tee $25
          (i32.const -2147483648)
         )
        ) (delegate $__t_1))) (catch_all
         (global.get $global$10)
        ))
      )
     )
     (i32.const 1023)
    )
   )
  )
  (local.set $12
   (ref.as_non_null
    (local.get $12)
   )
  )
  (i64.const -81)
 )
 (func $54 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $53
    (ref.func $26)
    (string.const "\ed\bd\88")
   )
  )
  (drop
   (call $53
    (ref.func $39)
    (string.const "\f0\90\8d\88\ed\a0\80")
   )
  )
  (drop
   (call $53
    (ref.null nofunc)
    (string.const "882")
   )
  )
 )
 (func $55 (type $22) (result v128 (ref null $11))
  (local $0 (ref null $2))
  (local $1 (ref eq))
  (local $2 arrayref)
  (local $3 i31ref)
  (local $4 (ref $4))
  (local $5 (ref null $3))
  (local $6 (ref null $3))
  (local $7 (ref null $3))
  (local $8 (ref null $3))
  (local $9 (ref null $3))
  (local $10 (ref extern))
  (local $11 (ref $11))
  (local $12 (ref null $4))
  (local $13 v128)
  (local $14 v128)
  (local $15 i64)
  (local $16 i64)
  (local $17 f64)
  (local $18 f64)
  (local $19 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.set $11
   (struct.new $11
    (local.get $14)
   )
  )
  (local.set $4
   (struct.new_default $4)
  )
  (i32.atomic.store8 offset=22
   (i32.and
    (global.get $global$35)
    (i32.const 15)
   )
   (if (result i32)
    (i32.rem_s
     (global.get $global$35)
     (ref.eq
      (global.get $global$24)
      (ref.i31
       (i32.const 42)
      )
     )
    )
    (then
     (call $fimport$10
      (local.tee $10
       (string.const "\ed\bd\88\ed\a0\80\c2\a3")
      )
     )
     (f32.lt
      (call $60
       (f32x4.extract_lane 3
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
      )
      (call $60
       (call_ref $21
        (f32.le
         (call $60
          (f32.max
           (f32.const 76)
           (f32.const -9223372036854775808)
          )
         )
         (loop $label1 (result f32)
          (if
           (i32.eqz
            (global.get $global$40)
           )
           (then
            (global.set $global$40
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$40
           (i32.sub
            (global.get $global$40)
            (i32.const 1)
           )
          )
          (block $block
           (drop
            (br_on_null $block
             (array.new_fixed $10 0)
            )
           )
           (nop)
          )
          (br_if $label1
           (i32.eqz
            (loop $label (result i32)
             (if
              (i32.eqz
               (global.get $global$40)
              )
              (then
               (global.set $global$40
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$40
              (i32.sub
               (global.get $global$40)
               (i32.const 1)
              )
             )
             (local.set $11
              (local.get $11)
             )
             (br_if $label
              (i32.const -107)
             )
             (local.get $19)
            )
           )
          )
          (f32.const 0)
         )
        )
        (f64.const 0)
        (call $61
         (call $25)
        )
        (ref.func $35)
       )
      )
     )
    )
    (else
     (local.get $19)
    )
   )
  )
  (return
   (tuple.make 2
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (struct.new $11
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
   )
  )
 )
 (func $56 (type $9)
  (local $scratch (tuple v128 (ref null $11)))
  (local $scratch_1 v128)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (block (result v128)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $55)
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
 (func $57 (type $49) (param $0 (ref array)) (param $1 f32) (param $2 f32) (param $3 (ref string))
  (local.set $1
   (call $60
    (local.get $1)
   )
  )
  (local.set $2
   (call $60
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $58 (type $9)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (call $57
   (array.new_fixed $10 0)
   (f32.const 4294967296)
   (f32.const 9223372036854775808)
   (string.const "")
  )
 )
 (func $59 (type $12) (result v128)
  (local $0 (ref $5))
  (local $1 (ref null $3))
  (local $2 (ref null $3))
  (local $3 (ref null $3))
  (local $4 (ref null $7))
  (local $5 (ref $7))
  (local $6 (ref $7))
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 f32)
  (local $11 v128)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result v128)
   (call $fimport$9
    (if (result (ref $7))
     (i32.const 0)
     (then
      (global.get $global$25)
     )
     (else
      (call $fimport$5
       (try $__t_0 (result f32) (do
         (call $60
          (f32.load offset=22 align=2
           (i32.and
            (if (result i32)
             (i32.lt_u
              (local.tee $7
               (ref.eq
                (struct.new_default $13)
                (array.new $5
                 (i32.const 2047)
                 (i32.and
                  (i32.const 72)
                  (i32.const 1023)
                 )
                )
               )
              )
              (array.len
               (local.tee $0
                (array.new $5
                 (i32.const -34)
                 (i32.and
                  (i32.const 9)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
             (then
              (array.get $5
               (local.get $0)
               (local.get $7)
              )
             )
             (else
              (i32.const 256)
             )
            )
            (i32.const 15)
           )
          )
         )
        ) (catch $tag$1
(local.get $10)
(if (global.get $__rt) (then (rethrow $__t_0)))) (catch $tag$0
(local.set $1 (call_ref $__sinkT_0 (pop (ref null $3)) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_0)))
(block
          (block
           (nop)
           (return
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
          )
          (unreachable)
         )
(unreachable)))
      )
      (atomic.fence)
      (return
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
      )
     )
    )
   )
   (if (result v128)
    (i32.eqz
     (i32.const -81)
    )
    (then
     (call $fimport$5
      (loop $label (result f32)
       (if
        (i32.eqz
         (global.get $global$40)
        )
        (then
         (global.set $global$40
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$40
        (i32.sub
         (global.get $global$40)
         (i32.const 1)
        )
       )
       (if
        (i32.eqz
         (global.get $global$40)
        )
        (then
         (global.set $global$40
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$40
        (i32.sub
         (global.get $global$40)
         (i32.const 1)
        )
       )
       (call $fimport$3
        (i32.const -8192)
       )
       (call $fimport$3
        (i32.const 17511)
       )
       (f64.store offset=22 align=1
        (i32.and
         (string.measure_wtf16
          (string.const "")
         )
         (i32.const 15)
        )
        (call $61
         (f64x2.extract_lane 1
          (call $62
           (v128.load offset=22 align=8
            (i32.and
             (ref.is_null
              (array.new_fixed $10 0)
             )
             (i32.const 15)
            )
           )
          )
         )
        )
       )
       (try_table (catch_all $label)
        (block
         (call $fimport$0
          (i32.const 0)
         )
         (return
          (v128.const i32x4 0x00000000 0xc0430000 0xe0000000 0xc7efffff)
         )
        )
        (unreachable)
       )
       (local.set $5
        (local.set $6
         (unreachable)
        )
       )
      )
     )
     (local.get $11)
    )
    (else
     (local.get $11)
    )
   )
  )
 )
 (func $60 (type $50) (param $0 f32) (result f32)
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
 (func $61 (type $51) (param $0 f64) (result f64)
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
 (func $62 (type $52) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param (ref null $3)) (result (ref null $3))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (global $__rt (mut i32) (i32.const 0))
)
