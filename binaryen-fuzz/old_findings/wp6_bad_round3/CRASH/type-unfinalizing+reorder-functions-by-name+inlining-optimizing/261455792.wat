(module
 (rec
  (type $0 (sub (struct (field (mut (ref null $0))) (field i64))))
  (type $1 (array v128))
 )
 (type $2 (sub (array i32)))
 (type $3 (func))
 (type $4 (struct))
 (type $5 (array i8))
 (type $6 (array (mut i16)))
 (type $7 (func (result i32)))
 (type $8 (func (result (ref $1))))
 (type $9 (func (param i32)))
 (type $10 (func (param externref)))
 (type $11 (func (param f64)))
 (type $12 (func (param i64)))
 (type $13 (func (param anyref)))
 (type $14 (func (result (ref $2))))
 (type $15 (func (result f32 i64 (ref null $2) i31ref)))
 (type $16 (func (param v128 (ref $0) i32 f64 arrayref v128) (result i64)))
 (type $17 (func (result (ref null $1) i32 i32 externref)))
 (type $18 (func (result f32)))
 (type $19 (func (result f64)))
 (type $20 (func (result funcref)))
 (type $21 (func (result (ref null $1))))
 (type $22 (func (result i64 i64)))
 (type $23 (func (param exnref) (result f32)))
 (type $24 (func (result i32 (ref (exact $2)))))
 (type $25 (func (result v128 (ref exn) (ref null (exact $2)) i32)))
 (type $26 (func (param f32)))
 (type $27 (func (param v128)))
 (type $28 (func (param funcref)))
 (type $29 (func (param v128) (result f32)))
 (type $30 (func (result (ref null $0))))
 (type $31 (func (param (ref null $2))))
 (type $32 (func (result (ref null $2))))
 (type $33 (func (param (ref null $1) (ref null $0) (ref array) stringref f32) (result arrayref (ref null $1) (ref null $2) (ref null $0))))
 (type $34 (func (param f64 i32 exnref) (result i32)))
 (type $35 (func (param i31ref (ref array) funcref) (result f64)))
 (type $36 (func (result (ref $0))))
 (type $37 (func (param (ref null $0) (ref $0)) (result i32 (ref null $2))))
 (type $38 (func (param structref (ref null $2) (ref $1)) (result f64 i32 structref)))
 (type $39 (func (param i64) (result f64)))
 (type $40 (func (param i32 v128 f64 (ref null $0) (ref $0) (ref $2) i32) (result (ref $0))))
 (type $41 (func (result i64)))
 (type $42 (func (param f64 i32) (result (ref null $1))))
 (type $43 (func (param f32) (result eqref (ref null $0) i32)))
 (type $44 (func (param (ref $2) (ref null $1) f32 (ref $2) i32 i32 (ref $1)) (result (ref $0))))
 (type $45 (func (param i32 exnref (ref null $2)) (result i64)))
 (type $46 (func (param (ref null $2)) (result f32)))
 (type $47 (func (param (ref null $1)) (result v128)))
 (type $48 (func (param (ref null $1) i64 exnref (ref $0) (ref $1)) (result (ref struct))))
 (type $49 (func (param i32 f64 i32 (ref $2)) (result (ref null $0) i32 (ref null $1) eqref f32)))
 (type $50 (func (result anyref)))
 (type $51 (func (param arrayref f32) (result f32)))
 (type $52 (func (param (ref null $0)) (result (ref null $2))))
 (type $53 (func (param (ref null $2) i64 structref f64) (result v128 exnref arrayref i32)))
 (type $54 (func (param anyref (ref $0) f64 i64) (result i31ref)))
 (type $55 (func (result stringref)))
 (type $56 (func (param (ref eq) (ref struct) (ref null $2)) (result stringref)))
 (type $57 (func (param (ref struct) (ref $2) (ref $1) (ref $1) i64) (result f32)))
 (type $58 (func (param i64 (ref null $1) (ref string)) (result i31ref)))
 (type $59 (func (result arrayref)))
 (type $60 (func (param f64) (result f64)))
 (type $61 (func (param (ref $1) i32 i31ref eqref) (result (ref $2))))
 (type $62 (func (result f32 i64 nullref (ref i31))))
 (type $63 (func (result nullref (ref (exact $1)) (ref (exact $2)) (ref (exact $0)))))
 (type $64 (func (result arrayref (ref null $1) (ref null $2) (ref null $0))))
 (type $65 (func (result (ref (exact $1)) i32 i32 (ref string))))
 (type $66 (func (result i32 (ref null $2))))
 (type $67 (func (result f64 i32 structref)))
 (type $68 (func (result eqref (ref null $0) i32)))
 (type $69 (func (result (ref (exact $0)) i32 (ref (exact $1)) (ref (exact $0)) f32)))
 (type $70 (func (result (ref null $0) i32 (ref null $1) eqref f32)))
 (type $71 (func (result v128 exnref arrayref i32)))
 (type $72 (func (result v128 f64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $9) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $9) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $26) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $11) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $27) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $13) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $28) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $10) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $9) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $10) (param externref)))
 (global $global$0 i32 (i32.const -128))
 (global $global$1 (ref $0) (struct.new $0
  (struct.new_default $0)
  (i64.const -51)
 ))
 (global $global$2 f64 (f64.const 9223372036854775808))
 (global $global$3 (mut f32) (f32.const -1048575.8125))
 (global $global$4 (mut (ref null $2)) (ref.null none))
 (global $global$5 (mut structref) (struct.new_default $4))
 (global $global$6 (mut i32) (i32.const -32767))
 (global $global$7 (ref $1) (array.new_default $1
  (i32.const 71)
 ))
 (global $global$8 f32 (f32.const -1023.8090209960938))
 (global $global$9 arrayref (array.new_fixed $5 0))
 (global $global$10 i32 (i32.const 256))
 (global $global$11 f64 (f64.const -73))
 (global $global$12 eqref (ref.i31
  (i32.const -110)
 ))
 (global $global$13 (mut (ref null $1)) (array.new_default $1
  (i32.const 69)
 ))
 (global $global$14 structref (struct.new_default $4))
 (global $global$15 f64 (global.get $global$2))
 (global $global$16 (mut i32) (global.get $global$0))
 (global $global$17 (ref string) (string.const ""))
 (global $global$18 (mut f32) (f32.const -nan:0x7ff722))
 (global $global$19 (mut (ref null $2)) (ref.null none))
 (global $global$20 (mut f32) (f32.const 65446))
 (global $global$21 (mut (ref $2)) (array.new $2
  (i32.const -127)
  (i32.const 15)
 ))
 (global $global$22 (mut v128) (v128.const i32x4 0x00010001 0x7ffe0400 0x0a540000 0xfe00ff80))
 (global $global$23 stringref (string.const "\c2\a3\e2\82\ac\e2\82\ac"))
 (global $global$24 (mut i32) (i32.const 1))
 (global $global$25 (mut exnref) (ref.null noexn))
 (global $global$26 (ref struct) (struct.new_default $4))
 (global $global$27 f32 (f32.const -44))
 (global $global$28 f32 (f32.const 1))
 (global $global$29 eqref (struct.new_default $4))
 (global $global$30 i64 (i64.const -131073))
 (global $global$31 (ref null $2) (array.new $2
  (global.get $global$0)
  (i32.const 16)
 ))
 (global $global$32 f32 (f32.const 2147483648))
 (global $global$33 f64 (f64.const 70368744177662.88))
 (global $global$34 v128 (v128.const i32x4 0xe0000000 0xc7efffff 0xffffd45e 0xffffffff))
 (global $global$35 i32 (global.get $global$0))
 (global $global$36 f64 (global.get $global$15))
 (global $global$37 (ref null $1) (array.new_default $1
  (i32.const 7)
 ))
 (global $global$38 eqref (struct.new_default $4))
 (global $global$39 i32 (global.get $global$35))
 (global $global$40 i31ref (ref.i31
  (i32.const 86)
 ))
 (global $global$41 (ref $1) (global.get $global$7))
 (global $global$42 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 "\81\b5j\1a\11<dP\cf\f5\f1hot\cc\86M,\b2\7f\e8\f0{.")
 (data $1 "\eeA\e2M\17.j\a3\db5\db\\\aex\d5\efgOm\d94\15T&l")
 (data $2 (i32.const 0) "\e4-e\c1C@\9b!\13\fe\18\cajDo\e8\f4@\dc\1d\98\06\85\93\f6>")
 (data $3 (i32.const 26) "{\":\13")
 (data $4 "\bfzRd\ab\ed\c9BN\cdi\8a\83\87\e9k\8d\b1\fa\ff\ce")
 (table $0 27 27 funcref (ref.null nofunc))
 (table $1 5 5 exnref)
 (elem $0 (table $0) (i32.const 0) func $3 $8 $8 $8 $24 $24 $28 $28 $30 $40 $43 $43 $43 $49 $54 $56 $65 $65 $73 $73 $73 $73 $73 $73 $73 $86 $86)
 (elem declare func $1 $10 $18 $2 $38 $7 $76 $80 $fimport$2 $fimport$6)
 (tag $tag$0 (type $3))
 (tag $tag$1 (type $11) (param f64))
 (export "global$" (global $global$0))
 (export "global$_2" (global $global$2))
 (export "global$_7" (global $global$12))
 (export "global$_8" (global $global$13))
 (export "global$_11" (global $global$16))
 (export "global$_14" (global $global$21))
 (export "global$_20" (global $global$30))
 (export "global$_24" (global $global$37))
 (export "global$_25" (global $global$38))
 (export "global$_27" (global $global$40))
 (export "func" (func $0))
 (export "func_10_invoker" (func $2))
 (export "func_12" (func $3))
 (export "func_13" (func $4))
 (export "func_15" (func $6))
 (export "func_15_invoker" (func $7))
 (export "func_17_invoker" (func $9))
 (export "func_20_invoker" (func $12))
 (export "func_22_invoker" (func $14))
 (export "func_24_invoker" (func $16))
 (export "func_26_invoker" (func $18))
 (export "func_28" (func $19))
 (export "func_28_invoker" (func $20))
 (export "func_33_invoker" (func $25))
 (export "func_35_invoker" (func $27))
 (export "func_37_invoker" (func $29))
 (export "func_39" (func $30))
 (export "func_41" (func $32))
 (export "func_43_invoker" (func $35))
 (export "func_45" (func $36))
 (export "func_45_invoker" (func $37))
 (export "func_47" (func $38))
 (export "func_48" (func $39))
 (export "func_49" (func $40))
 (export "func_50_invoker" (func $42))
 (export "func_52" (func $43))
 (export "func_52_invoker" (func $44))
 (export "func_54" (func $45))
 (export "func_54_invoker" (func $46))
 (export "func_56_invoker" (func $48))
 (export "func_58" (func $49))
 (export "func_58_invoker" (func $50))
 (export "func_60" (func $51))
 (export "func_61_invoker" (func $53))
 (export "func_63_invoker" (func $55))
 (export "func_65" (func $56))
 (export "func_67_invoker" (func $59))
 (export "func_69_invoker" (func $61))
 (export "func_72" (func $63))
 (export "func_72_invoker" (func $64))
 (export "func_74" (func $65))
 (export "func_75_invoker" (func $67))
 (export "func_78_invoker" (func $70))
 (export "func_80_invoker" (func $72))
 (export "func_82" (func $73))
 (export "func_83_invoker" (func $75))
 (export "func_85" (func $76))
 (export "func_85_invoker" (func $77))
 (export "func_87_invoker" (func $79))
 (export "func_89" (func $80))
 (export "func_89_invoker" (func $81))
 (export "func_91_invoker" (func $83))
 (export "func_93" (func $84))
 (export "func_96_invoker" (func $88))
 (func $0 (type $14) (result (ref $2))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (call_ref $12
    (global.get $global$30)
    (ref.func $fimport$2)
   )
   (return
    (global.get $global$21)
   )
  )
  (unreachable)
 )
 (func $1 (type $7) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 i64)
  (local $6 v128)
  (local $7 f32)
  (local $8 (ref null $0))
  (local $9 (ref array))
  (local $10 externref)
  (local $11 eqref)
  (local $12 eqref)
  (local $13 (ref null $2))
  (local $14 funcref)
  (local $15 funcref)
  (local $16 stringref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (table.set $1
    (i32.const 0)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0)
     )
     (unreachable)
    )
   )
   (return
    (i32.const -2097152)
   )
  )
  (unreachable)
 )
 (func $2 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $1)
  )
 )
 (@binaryen.js.called)
 (func $3 (type $29) (param $0 v128) (result f32)
  (local $1 f32)
  (local $2 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (i32.store16 offset=22 align=1
    (i32.and
     (i32.const 922750044)
     (i32.const 15)
    )
    (i32.const -17860)
   )
   (return
    (f32.const 108)
   )
  )
  (unreachable)
 )
 (func $4 (type $30) (result (ref null $0))
  (local $0 (ref $1))
  (local $1 (ref $2))
  (local $2 structref)
  (local $3 (ref null $0))
  (local $4 (ref null $2))
  (local $5 exnref)
  (local $6 i32)
  (local $7 i32)
  (local $8 v128)
  (local $9 f64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $0)))
   (nop)
   (struct.new_default $0)
  )
 )
 (func $5 (type $15) (result f32 i64 (ref null $2) i31ref)
  (local $0 i32)
  (local $1 i32)
  (local $2 funcref)
  (local $scratch i32)
  (local $scratch_4 f64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (type $62) (result f32 i64 nullref (ref i31))
   (loop $label1
    (if
     (i32.eqz
      (global.get $global$42)
     )
     (then
      (global.set $global$42
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$42
     (i32.sub
      (global.get $global$42)
      (i32.const 1)
     )
    )
    (atomic.fence)
    (br_if $label1
     (loop $label (result i32)
      (if
       (i32.eqz
        (global.get $global$42)
       )
       (then
        (global.set $global$42
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$42
       (i32.sub
        (global.get $global$42)
        (i32.const 1)
       )
      )
      (block
       (block
        (block
         (nop)
         (call $fimport$1
          (ref.test (ref $0)
           (global.get $global$1)
          )
         )
        )
        (call $fimport$5
         (v128.const i32x4 0x00000000 0x40d414c0 0xfffffffa 0xffffffff)
        )
       )
      )
      (br_if $label
       (local.get $0)
      )
      (ref.test (ref none)
       (ref.i31
        (i32.const -128)
       )
      )
     )
    )
    (try_table (catch_all $label1)
     (drop
      (block (result f64)
       (local.set $scratch_4
        (f64.const 4294967207)
       )
       (local.set $1
        (block (result i32)
         (local.set $scratch
          (i32.const -125)
         )
         (drop
          (struct.new_default $4)
         )
         (local.get $scratch)
        )
       )
       (local.get $scratch_4)
      )
     )
     (i64.atomic.store32 acqrel offset=22
      (i32.and
       (local.get $1)
       (i32.const 15)
      )
      (block (result i64)
       (drop
        (br_on_null $label1
         (struct.new_default $4)
        )
       )
       (i64.const -97)
      )
     )
    )
   )
   (call $fimport$7
    (local.get $2)
   )
   (tuple.make 4
    (f32.const 4194303.75)
    (i64.const 65430)
    (ref.null none)
    (ref.i31
     (i32.const 638221682)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $6 (type $7) (result i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$3
    (f32.const 17)
   )
   (return
    (i32.const -255)
   )
  )
  (unreachable)
 )
 (func $7 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
 )
 (@binaryen.js.called)
 (func $8 (type $7) (result i32)
  (local $0 stringref)
  (local $1 (ref null $2))
  (local $2 (ref null $2))
  (local $3 (ref null $1))
  (local $4 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result i32)
   (nop)
   (i32.const 102)
  )
 )
 (func $9 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $8)
  )
 )
 (func $10 (type $16) (param $0 v128) (param $1 (ref $0)) (param $2 i32) (param $3 f64) (param $4 arrayref) (param $5 v128) (result i64)
  (local $6 (ref null $0))
  (local $7 structref)
  (local $8 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (i64.div_s
   (i64x2.extract_lane 0
    (v128.const i32x4 0x00000000 0x40002c25 0x00000039 0xcb6700b0)
   )
   (i64.const -4294967297)
  )
 )
 (@binaryen.js.called)
 (func $11 (type $31) (param $0 (ref null $2))
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 (ref $6))
  (local $9 (ref $6))
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 i31ref)
  (local $13 (ref eq))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block $block
   (if
    (i32.eqz
     (i32.ctz
      (stringview_wtf16.get_codeunit
       (string.const "\ed\bd\881018\ed\a0\80")
       (block (result i32)
        (local.set $10
         (block (result (ref string))
          (string.const "\ed\a0\80")
         )
        )
        (local.set $7
         (if (result i32)
          (i32.lt_u
           (i32.add
            (local.tee $4
             (global.get $global$35)
            )
            (local.tee $5
             (string.measure_wtf16
              (local.get $10)
             )
            )
           )
           (array.len
            (local.tee $9
             (local.tee $8
              (array.new $6
               (i32.const -2209)
               (i32.and
                (i32.const 23)
                (i32.const 1023)
               )
              )
             )
            )
           )
          )
          (then
           (string.encode_wtf16_array
            (local.get $10)
            (local.get $9)
            (local.get $4)
           )
          )
          (else
           (local.get $6)
          )
         )
        )
        (local.get $7)
       )
      )
     )
    )
    (then
     (call $fimport$2
      (local.get $3)
     )
    )
   )
   (call $fimport$4
    (try_table (result f64) (catch_all $block)
     (drop
      (br_on_null $block
       (local.get $12)
      )
     )
     (drop
      (br_on_null $block
       (local.tee $13
        (struct.new_default $4)
       )
      )
     )
     (drop
      (br_on_null $block
       (array.new_fixed $5 0)
      )
     )
     (f64.convert_i32_s
      (string.measure_wtf16
       (local.tee $11
        (loop $label (result (ref string))
         (if
          (i32.eqz
           (global.get $global$42)
          )
          (then
           (global.set $global$42
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$42
          (i32.sub
           (global.get $global$42)
           (i32.const 1)
          )
         )
         (block
          (atomic.fence acqrel)
          (drop
           (i32.and
            (i32.const -91)
            (i32.const 15)
           )
          )
          (if
           (i32.eqz
            (i32x4.extract_lane 0
             (v128.const i32x4 0x012576bf 0x012a8149 0xe2ff21ff 0xfffe2fdc)
            )
           )
           (then
            (call $fimport$6
             (array.new_fixed $5 0)
            )
            (return_call_ref $3
             (ref.func $7)
            )
           )
           (else
            (call $fimport$2
             (i64.const 4294967195)
            )
            (br $label)
           )
          )
          (unreachable)
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
 (func $12 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $11
   (ref.null none)
  )
 )
 (func $13 (type $32) (result (ref null $2))
  (local $0 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (call_ref $13
    (struct.new_default $0)
    (ref.func $fimport$6)
   )
   (return
    (local.get $0)
   )
  )
  (unreachable)
 )
 (func $14 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $13)
  )
  (drop
   (call $13)
  )
  (drop
   (call $13)
  )
 )
 (func $15 (type $33) (param $0 (ref null $1)) (param $1 (ref null $0)) (param $2 (ref array)) (param $3 stringref) (param $4 f32) (result arrayref (ref null $1) (ref null $2) (ref null $0))
  (local $5 (ref null $1))
  (local $6 (ref null $1))
  (local $7 i31ref)
  (local $8 (ref $1))
  (local $9 (ref $1))
  (local $10 (ref $0))
  (local $11 externref)
  (local $12 exnref)
  (local $13 exnref)
  (local $14 (ref $2))
  (local $15 (ref $2))
  (local $16 (ref $2))
  (local $17 (ref $2))
  (local $18 (ref $2))
  (local $19 (ref exn))
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $32 i32)
  (local $33 v128)
  (local $34 v128)
  (local $35 v128)
  (local $36 v128)
  (local $scratch i32)
  (local $scratch_38 (ref exn))
  (local $scratch_39 (ref (exact $2)))
  (local $scratch_40 v128)
  (local $scratch_41 (ref (exact $1)))
  (local $scratch_42 f32)
  (local $scratch_43 nullref)
  (local $scratch_44 f64)
  (local $scratch_45 i32)
  (local $scratch_46 (ref i31))
  (local $scratch_47 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.set $6
   (block (result (ref (exact $1)))
    (local.set $scratch_41
     (array.new_default $1
      (i32.and
       (i32.const 2)
       (i32.const 1023)
      )
     )
    )
    (local.set $34
     (block (result v128)
      (local.set $scratch_40
       (v128.const i32x4 0x422b0450 0x2f530b58 0xffffe478 0xffffffff)
      )
      (local.set $17
       (block (result (ref (exact $2)))
        (local.set $scratch_39
         (array.new_default $2
          (i32.and
           (i32.const 30)
           (i32.const 1023)
          )
         )
        )
        (local.set $19
         (block (result (ref exn))
          (local.set $scratch_38
           (block $block (result (ref exn))
            (try_table (catch_all_ref $block)
             (throw $tag$0)
            )
            (unreachable)
           )
          )
          (local.set $28
           (block (result i32)
            (local.set $scratch
             (i32.const -255)
            )
            (local.set $29
             (i32.const -33554432)
            )
            (local.get $scratch)
           )
          )
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
  (local.set $14
   (global.get $global$21)
  )
  (block (type $63) (result nullref (ref (exact $1)) (ref (exact $2)) (ref (exact $0)))
   (call $fimport$6
    (struct.new_default $4)
   )
   (tuple.make 4
    (ref.null none)
    (array.new_default $1
     (i32.and
      (i32.const 2)
      (i32.const 1023)
     )
    )
    (array.new $2
     (if (result i32)
      (select
       (ref.eq
        (struct.new $0
         (global.get $global$1)
         (i64.const 76)
        )
        (struct.new $0
         (local.tee $10
          (global.get $global$1)
         )
         (global.get $global$30)
        )
       )
       (i32.trunc_sat_f64_u
        (block (result f64)
         (local.set $scratch_44
          (f64.const 65536.947)
         )
         (drop
          (block (result nullref)
           (local.set $scratch_43
            (ref.null none)
           )
           (drop
            (block (result f32)
             (local.set $scratch_42
              (f32.const -nan:0x7fffe6)
             )
             (drop
              (ref.null noexn)
             )
             (local.get $scratch_42)
            )
           )
           (local.get $scratch_43)
          )
         )
         (local.get $scratch_44)
        )
       )
       (string.measure_wtf16
        (string.const "\c2\a3")
       )
      )
      (then
       (stringview_wtf16.get_codeunit
        (global.get $global$17)
        (block (result i32)
         (local.set $32
          (try_table (result i32)
           (ref.eq
            (local.tee $1
             (global.get $global$1)
            )
            (global.get $global$21)
           )
          )
         )
         (local.get $32)
        )
       )
      )
      (else
       (nop)
       (return
        (tuple.make 4
         (array.new_fixed $5 0)
         (array.new_default $1
          (i32.and
           (i32.const 19)
           (i32.const 1023)
          )
         )
         (array.new_default $2
          (i32.and
           (i32.const 17)
           (i32.const 1023)
          )
         )
         (struct.new_default $0)
        )
       )
      )
     )
     (i32.and
      (i32.const 11)
      (i32.const 1023)
     )
    )
    (struct.new $0
     (loop (result (ref $0))
      (if
       (i32.eqz
        (global.get $global$42)
       )
       (then
        (global.set $global$42
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$42
       (i32.sub
        (global.get $global$42)
        (i32.const 1)
       )
      )
      (local.tee $10
       (local.tee $10
        (global.get $global$1)
       )
      )
     )
     (call $10
      (loop (result v128)
       (if
        (i32.eqz
         (global.get $global$42)
        )
        (then
         (global.set $global$42
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$42
        (i32.sub
         (global.get $global$42)
         (i32.const 1)
        )
       )
       (block (result v128)
        (data.drop $4)
        (v128.const i32x4 0x0001ff8a 0xfffcffeb 0xfffb554a 0xd2273e61)
       )
      )
      (local.get $10)
      (if (result i32)
       (i32.eqz
        (if (result i32)
         (i32.const 32767)
         (then
          (loop
           (if
            (i32.eqz
             (global.get $global$42)
            )
            (then
             (global.set $global$42
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$42
            (i32.sub
             (global.get $global$42)
             (i32.const 1)
            )
           )
           (block
            (loop $label1
             (if
              (i32.eqz
               (global.get $global$42)
              )
              (then
               (global.set $global$42
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$42
              (i32.sub
               (global.get $global$42)
               (i32.const 1)
              )
             )
             (block
              (call $fimport$8
               (local.get $11)
              )
              (block $block1
               (loop $label
                (if
                 (i32.eqz
                  (global.get $global$42)
                 )
                 (then
                  (global.set $global$42
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$42
                 (i32.sub
                  (global.get $global$42)
                  (i32.const 1)
                 )
                )
                (try_table (catch_all $block1)
                 (nop)
                )
                (br_if $label
                 (i32.eqz
                  (i32.const 65535)
                 )
                )
                (nop)
               )
              )
             )
             (br_if $label1
              (i32.eqz
               (i31.get_u
                (ref.i31
                 (i32.const -32)
                )
               )
              )
             )
             (block
              (nop)
              (return
               (tuple.make 4
                (array.new_fixed $5 0)
                (ref.null none)
                (ref.null none)
                (ref.null none)
               )
              )
             )
             (unreachable)
            )
            (unreachable)
           )
           (unreachable)
          )
          (unreachable)
         )
         (else
          (local.get $25)
         )
        )
       )
       (then
        (call $fimport$2
         (call_ref $16
          (f64x2.min
           (try (result v128)
            (do
             (local.get $33)
            )
            (catch $tag$1
             (local.set $22 (f64.mul (pop f64) (f64.const -1)))
             (local.get $33)
            )
           )
           (v128.load offset=2 align=4
            (i32.and
             (if (result i32)
              (i32.lt_u
               (local.tee $26
                (i32.atomic.load16_u offset=3
                 (i32.and
                  (i32.const -1165295)
                  (i32.const 15)
                 )
                )
               )
               (array.len
                (local.tee $15
                 (block (result (ref $2))
                  (nop)
                  (local.tee $14
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
               )
              )
              (then
               (array.get $2
                (local.get $15)
                (local.get $26)
               )
              )
              (else
               (local.get $25)
              )
             )
             (i32.const 15)
            )
           )
          )
          (struct.new_default $0)
          (block (result i32)
           (drop
            (block (result i64)
             (local.set $scratch_47
              (i64.const -12761)
             )
             (drop
              (block (result (ref i31))
               (local.set $scratch_46
                (ref.i31
                 (i32.const -268435456)
                )
               )
               (local.set $32
                (block (result i32)
                 (local.set $scratch_45
                  (i32.const -21651)
                 )
                 (drop
                  (array.new_default $2
                   (i32.and
                    (i32.const 12)
                    (i32.const 1023)
                   )
                  )
                 )
                 (local.get $scratch_45)
                )
               )
               (local.get $scratch_46)
              )
             )
             (local.get $scratch_47)
            )
           )
           (local.get $32)
          )
          (global.get $global$36)
          (array.new_fixed $5 0)
          (i16x8.extadd_pairwise_i8x16_s
           (local.get $33)
          )
          (ref.func $10)
         )
        )
        (return
         (tuple.make 4
          (array.new_fixed $5 0)
          (array.new $1
           (local.get $33)
           (i32.and
            (i32.const 24)
            (i32.const 1023)
           )
          )
          (array.new_default $2
           (i32.and
            (i32.const 53)
            (i32.const 1023)
           )
          )
          (struct.new $0
           (global.get $global$1)
           (i64.const -94)
          )
         )
        )
       )
       (else
        (try (result i32)
         (do
          (drop
           (string.const "381\ed\bd\88\f0\90\8d\88")
          )
          (block
           (return
            (tuple.make 4
             (array.new_fixed $5 0)
             (array.new $1
              (local.get $33)
              (i32.and
               (i32.const 91)
               (i32.const 1023)
              )
             )
             (array.new_default $2
              (i32.and
               (i32.const 87)
               (i32.const 1023)
              )
             )
             (struct.new_default $0)
            )
           )
          )
          (unreachable)
         )
         (catch $tag$1
          (local.set $23 (call $__popsink_0 (pop f64)))
          (i32.const -32768)
         )
         (catch_all
          (local.get $25)
         )
        )
       )
      )
      (loop (result f64)
       (if
        (i32.eqz
         (global.get $global$42)
        )
        (then
         (global.set $global$42
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$42
        (i32.sub
         (global.get $global$42)
         (i32.const 1)
        )
       )
       (block
        (nop)
        (call $fimport$0
         (i32.const -24011)
        )
       )
       (block
        (loop
         (if
          (i32.eqz
           (global.get $global$42)
          )
          (then
           (global.set $global$42
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$42
          (i32.sub
           (global.get $global$42)
           (i32.const 1)
          )
         )
         (block
          (nop)
          (call $fimport$1
           (local.tee $25
            (stringview_wtf16.get_codeunit
             (string.const "\ed\bd\88")
             (local.get $25)
            )
           )
          )
         )
        )
        (return
         (tuple.make 4
          (array.new_fixed $5 0)
          (array.new $1
           (v128.const i32x4 0xff00ff01 0xee0dff01 0xfeff9ae2 0xff01c5ca)
           (i32.and
            (i32.const 89)
            (i32.const 1023)
           )
          )
          (array.new_default $2
           (i32.and
            (i32.const 11)
            (i32.const 1023)
           )
          )
          (struct.new_default $0)
         )
        )
       )
       (local.set $9
        (local.set $35
         (local.set $18
          (local.set $13
           (local.set $30
            (local.set $31
             (local.set $8
              (unreachable)
             )
            )
           )
          )
         )
        )
       )
      )
      (array.new_fixed $5 0)
      (local.get $33)
     )
    )
   )
  )
 )
 (func $16 (type $3)
  (local $0 v128)
  (local $1 i64)
  (local $scratch (tuple arrayref (ref null $1) (ref null $2) (ref null $0)))
  (local $scratch_3 (ref null $2))
  (local $scratch_4 (ref null $1))
  (local $scratch_5 arrayref)
  (local $scratch_6 (tuple arrayref (ref null $1) (ref null $2) (ref null $0)))
  (local $scratch_7 (ref null $2))
  (local $scratch_8 (ref null $1))
  (local $scratch_9 arrayref)
  (local $scratch_10 (tuple arrayref (ref null $1) (ref null $2) (ref null $0)))
  (local $scratch_11 (ref null $2))
  (local $scratch_12 (ref null $1))
  (local $scratch_13 arrayref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result arrayref)
    (local.set $scratch_5
     (tuple.extract 4 0
      (local.tee $scratch
       (call $15
        (array.new $1
         (local.tee $0
          (v128.const i32x4 0x00f5ff02 0x48310001 0xffc20328 0x7fffff82)
         )
         (i32.and
          (i32.const 41)
          (i32.const 1023)
         )
        )
        (struct.new_default $0)
        (array.new_fixed $5 0)
        (ref.null noextern)
        (f32.const -99)
       )
      )
     )
    )
    (drop
     (block (result (ref null $1))
      (local.set $scratch_4
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result (ref null $2))
        (local.set $scratch_3
         (tuple.extract 4 2
          (local.get $scratch)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch)
         )
        )
        (local.get $scratch_3)
       )
      )
      (local.get $scratch_4)
     )
    )
    (local.get $scratch_5)
   )
  )
  (drop
   (block (result arrayref)
    (local.set $scratch_9
     (tuple.extract 4 0
      (local.tee $scratch_6
       (call $15
        (ref.null none)
        (struct.new $0
         (struct.get $0 0
          (global.get $global$1)
         )
         (i64.const -40)
        )
        (array.new_fixed $5 0)
        (string.const "")
        (f32.const -32)
       )
      )
     )
    )
    (drop
     (block (result (ref null $1))
      (local.set $scratch_8
       (tuple.extract 4 1
        (local.get $scratch_6)
       )
      )
      (drop
       (block (result (ref null $2))
        (local.set $scratch_7
         (tuple.extract 4 2
          (local.get $scratch_6)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_6)
         )
        )
        (local.get $scratch_7)
       )
      )
      (local.get $scratch_8)
     )
    )
    (local.get $scratch_9)
   )
  )
  (drop
   (block (result arrayref)
    (local.set $scratch_13
     (tuple.extract 4 0
      (local.tee $scratch_10
       (call $15
        (array.new_default $1
         (i32.and
          (i32.const 73)
          (i32.const 1023)
         )
        )
        (struct.new $0
         (struct.new $0
          (ref.null none)
          (global.get $global$30)
         )
         (local.tee $1
          (i64.atomic.rmw16.and_u acqrel offset=3
           (i32.and
            (i32.const 4194304)
            (i32.const 15)
           )
           (i64.const -17392)
          )
         )
        )
        (array.new_fixed $5 0)
        (string.const "\ed\a0\80")
        (f32.const -nan:0x4e626a)
       )
      )
     )
    )
    (drop
     (block (result (ref null $1))
      (local.set $scratch_12
       (tuple.extract 4 1
        (local.get $scratch_10)
       )
      )
      (drop
       (block (result (ref null $2))
        (local.set $scratch_11
         (tuple.extract 4 2
          (local.get $scratch_10)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_10)
         )
        )
        (local.get $scratch_11)
       )
      )
      (local.get $scratch_12)
     )
    )
    (local.get $scratch_13)
   )
  )
  (try_table
   (block
    (call $12)
    (try_table
     (try_table
      (loop $label
       (if
        (i32.eqz
         (global.get $global$42)
        )
        (then
         (global.set $global$42
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$42
        (i32.sub
         (global.get $global$42)
         (i32.const 1)
        )
       )
       (block
        (nop)
        (br $label)
       )
       (unreachable)
      )
      (unreachable)
     )
     (unreachable)
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $17 (type $17) (result (ref null $1) i32 i32 externref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (type $65) (result (ref (exact $1)) i32 i32 (ref string))
   (call $fimport$8
    (ref.as_non_null
     (ref.null noextern)
    )
   )
   (tuple.make 4
    (array.new_default $1
     (i32.and
      (i32.const 94)
      (i32.const 1023)
     )
    )
    (i32.const 2)
    (i32.const -16873)
    (string.const "\c2\a3")
   )
  )
 )
 (func $18 (type $3)
  (local $scratch (tuple (ref null $1) i32 i32 externref))
  (local $scratch_1 i32)
  (local $scratch_2 i32)
  (local $scratch_3 (ref null $1))
  (local $scratch_4 (tuple (ref null $1) i32 i32 externref))
  (local $scratch_5 i32)
  (local $scratch_6 i32)
  (local $scratch_7 (ref null $1))
  (local $scratch_8 (tuple (ref null $1) i32 i32 externref))
  (local $scratch_9 i32)
  (local $scratch_10 i32)
  (local $scratch_11 (ref null $1))
  (local $scratch_12 (tuple (ref null $1) i32 i32 externref))
  (local $scratch_13 i32)
  (local $scratch_14 i32)
  (local $scratch_15 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_3
     (tuple.extract 4 0
      (local.tee $scratch
       (call $17)
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_2
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result i32)
        (local.set $scratch_1
         (tuple.extract 4 2
          (local.get $scratch)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch)
         )
        )
        (local.get $scratch_1)
       )
      )
      (local.get $scratch_2)
     )
    )
    (local.get $scratch_3)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_7
     (tuple.extract 4 0
      (local.tee $scratch_4
       (call $17)
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_6
       (tuple.extract 4 1
        (local.get $scratch_4)
       )
      )
      (drop
       (block (result i32)
        (local.set $scratch_5
         (tuple.extract 4 2
          (local.get $scratch_4)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_4)
         )
        )
        (local.get $scratch_5)
       )
      )
      (local.get $scratch_6)
     )
    )
    (local.get $scratch_7)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_11
     (tuple.extract 4 0
      (local.tee $scratch_8
       (call $17)
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_10
       (tuple.extract 4 1
        (local.get $scratch_8)
       )
      )
      (drop
       (block (result i32)
        (local.set $scratch_9
         (tuple.extract 4 2
          (local.get $scratch_8)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_8)
         )
        )
        (local.get $scratch_9)
       )
      )
      (local.get $scratch_10)
     )
    )
    (local.get $scratch_11)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_15
     (tuple.extract 4 0
      (local.tee $scratch_12
       (call $17)
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_14
       (tuple.extract 4 1
        (local.get $scratch_12)
       )
      )
      (drop
       (block (result i32)
        (local.set $scratch_13
         (tuple.extract 4 2
          (local.get $scratch_12)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_12)
         )
        )
        (local.get $scratch_13)
       )
      )
      (local.get $scratch_14)
     )
    )
    (local.get $scratch_15)
   )
  )
 )
 (func $19 (type $34) (param $0 f64) (param $1 i32) (param $2 exnref) (result i32)
  (local $3 exnref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.get $1)
 )
 (func $20 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $19
    (f64.const 4294964586)
    (i32.const 63)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1
       (global.get $global$2)
      )
     )
     (unreachable)
    )
   )
  )
  (drop
   (call $19
    (f64.const -1073741825)
    (i32.const 127)
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$1
       (f64x2.extract_lane 1
        (i8x16.relaxed_laneselect
         (global.get $global$22)
         (global.get $global$22)
         (v128.load offset=22 align=8
          (i32.and
           (string.measure_wtf16
            (global.get $global$17)
           )
           (i32.const 15)
          )
         )
        )
       )
      )
     )
     (unreachable)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $21 (type $18) (result f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$4
    (global.get $global$36)
   )
   (throw $tag$1
    (f64.const -2147483647.648)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $22 (type $35) (param $0 i31ref) (param $1 (ref array)) (param $2 funcref) (result f64)
  (local $3 f64)
  (local $4 f64)
  (local $5 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (global.get $global$15)
   )
  )
  (unreachable)
 )
 (func $23 (type $36) (result (ref $0))
  (local $0 arrayref)
  (local $1 (ref null $0))
  (local $2 externref)
  (local $3 structref)
  (local $4 (ref null $1))
  (local $5 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (select (result (ref $0))
   (struct.new $0
    (global.get $global$1)
    (i64.const -17)
   )
   (global.get $global$1)
   (global.get $global$0)
  )
 )
 (@binaryen.js.called)
 (func $24 (type $37) (param $0 (ref null $0)) (param $1 (ref $0)) (result i32 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (if (type $24) (result i32 (ref (exact $2)))
   (ref.test (ref string)
    (string.const "\ed\a0\80")
   )
   (then
    (nop)
    (return
     (tuple.make 2
      (i32.const -123)
      (array.new $2
       (global.get $global$16)
       (i32.and
        (i32.const 45)
        (i32.const 1023)
       )
      )
     )
    )
   )
   (else
    (tuple.make 2
     (i32.const -42)
     (array.new $2
      (call $8)
      (i32.and
       (i32.const 7)
       (i32.const 1023)
      )
     )
    )
   )
  )
 )
 (func $25 (type $3)
  (local $scratch (tuple i32 (ref null $2)))
  (local $scratch_1 i32)
  (local $scratch_2 (tuple i32 (ref null $2)))
  (local $scratch_3 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $24
        (struct.new_default $0)
        (struct.new $0
         (ref.cast (ref (exact $0))
          (struct.new_default $0)
         )
         (i64.const -9899)
        )
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
  (drop
   (block (result i32)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $24
        (struct.new $0
         (struct.new_default $0)
         (i64.const 9223372036854775807)
        )
        (struct.new_default $0)
       )
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
 (func $26 (type $3)
  (local $0 (ref $2))
  (local $1 externref)
  (local $2 externref)
  (local $3 (ref null $2))
  (local $4 f64)
  (local $5 f32)
  (local $6 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const 0)
  )
 )
 (func $27 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $26)
  (call $26)
 )
 (func $28 (type $38) (param $0 structref) (param $1 (ref null $2)) (param $2 (ref $1)) (result f64 i32 structref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (return
   (tuple.make 3
    (f64.const 3846)
    (i32.const -1672195741)
    (ref.null none)
   )
  )
 )
 (func $29 (type $3)
  (local $0 v128)
  (local $1 v128)
  (local $scratch (tuple f64 i32 structref))
  (local $scratch_3 i32)
  (local $scratch_4 f64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result f64)
    (local.set $scratch_4
     (tuple.extract 3 0
      (local.tee $scratch
       (call $28
        (struct.new_default $4)
        (ref.null none)
        (array.new_default $1
         (i32.and
          (i32.const 78)
          (i32.const 1023)
         )
        )
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_3
       (tuple.extract 3 1
        (local.get $scratch)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch)
       )
      )
      (local.get $scratch_3)
     )
    )
    (local.get $scratch_4)
   )
  )
  (drop
   (struct.new_default $4)
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$42)
    )
    (then
     (global.set $global$42
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$42
    (i32.sub
     (global.get $global$42)
     (i32.const 1)
    )
   )
   (block
    (drop
     (i32.const 250)
    )
    (br $label)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $30 (type $3)
  (local $0 i31ref)
  (local $1 (ref null $1))
  (local $2 (ref null $1))
  (local $3 arrayref)
  (local $4 arrayref)
  (local $5 stringref)
  (local $6 (ref null $2))
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 v128)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const 0)
  )
 )
 (func $31 (type $14) (result (ref $2))
  (local $0 (ref $2))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.tee $0
   (global.get $global$21)
  )
 )
 (@binaryen.js.called)
 (func $32 (type $39) (param $0 i64) (result f64)
  (local $1 (ref array))
  (local $2 (ref struct))
  (local $3 arrayref)
  (local $4 arrayref)
  (local $5 arrayref)
  (local $6 externref)
  (local $7 (ref null $2))
  (local $8 (ref null $2))
  (local $9 (ref null $1))
  (local $10 (ref null $1))
  (local $11 f64)
  (local $12 f64)
  (local $13 i32)
  (local $14 i64)
  (local $15 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (f64.const -4611686018427387904)
 )
 (func $33 (type $19) (result f64)
  (local $0 (ref $1))
  (local $1 (ref null $0))
  (local $2 stringref)
  (local $3 arrayref)
  (local $4 i31ref)
  (local $5 i32)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f32)
  (local $10 v128)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f64.const -nan:0xfffffffdb5536)
   )
  )
  (unreachable)
 )
 (func $34 (type $40) (param $0 i32) (param $1 v128) (param $2 f64) (param $3 (ref null $0)) (param $4 (ref $0)) (param $5 (ref $2)) (param $6 i32) (result (ref $0))
  (local $7 eqref)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 f64)
  (local $12 v128)
  (local $13 f32)
  (local $14 f32)
  (local $15 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.get $4)
 )
 (func $35 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $34
    (i32.const 1)
    (v128.const i32x4 0xffffe312 0xffffffff 0xffffffaf 0xffffffff)
    (f64.const -121)
    (struct.new $0
     (struct.new $0
      (struct.new_default $0)
      (global.get $global$30)
     )
     (global.get $global$30)
    )
    (struct.new $0
     (struct.new $0
      (struct.new_default $0)
      (global.get $global$30)
     )
     (i64.const -38)
    )
    (array.new_default $2
     (i32.and
      (i32.const 3)
      (i32.const 1023)
     )
    )
    (i32.const -255)
   )
  )
 )
 (func $36 (type $41) (result i64)
  (local $0 f32)
  (local $1 f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 v128)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 (ref null $1))
  (local $11 eqref)
  (local $12 (ref null $2))
  (local $13 i31ref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result i64)
   (nop)
   (local.get $9)
  )
 )
 (func $37 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $36)
  )
 )
 (@binaryen.js.called)
 (func $38 (type $20) (result funcref)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 (ref string))
  (local $6 (ref none))
  (local $7 (ref $1))
  (local $8 (ref $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $20)))
   (drop
    (string.const "579\e2\82\ac\ed\bd\88")
   )
   (try_table
    (block
     (loop $label
      (if
       (i32.eqz
        (global.get $global$42)
       )
       (then
        (global.set $global$42
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$42
       (i32.sub
        (global.get $global$42)
        (i32.const 1)
       )
      )
      (block
       (call $fimport$3
        (f32.const 89)
       )
       (i32.atomic.store offset=4
        (i32.and
         (block (result i32)
          (drop
           (i32.const -76)
          )
          (local.get $0)
         )
         (i32.const 15)
        )
        (i32.atomic.load16_u acqrel offset=22
         (i32.and
          (call_indirect $0 (type $7)
           (i32.const 1)
          )
          (i32.const 15)
         )
        )
       )
      )
      (br_if $label
       (i32.eqz
        (global.get $global$35)
       )
      )
      (br_if $label
       (i32.eqz
        (local.get $0)
       )
      )
     )
     (return
      (ref.func $38)
     )
    )
    (unreachable)
   )
   (unreachable)
  )
 )
 (func $39 (type $8) (result (ref $1))
  (local $0 eqref)
  (local $1 (ref struct))
  (local $2 anyref)
  (local $3 externref)
  (local $4 i32)
  (local $5 i64)
  (local $6 f64)
  (local $7 f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $39)
 )
 (func $40 (type $42) (param $0 f64) (param $1 i32) (result (ref null $1))
  (local $2 (ref string))
  (local $3 eqref)
  (local $4 eqref)
  (local $5 (ref $0))
  (local $6 (ref $2))
  (local $7 (ref null $0))
  (local $8 structref)
  (local $9 i31ref)
  (local $10 i32)
  (local $11 f64)
  (local $12 f64)
  (local $13 f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$42)
     )
     (then
      (global.set $global$42
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$42
     (i32.sub
      (global.get $global$42)
      (i32.const 1)
     )
    )
    (call $fimport$0
     (i32.const -2)
    )
    (br_if $label
     (i32.eqz
      (local.get $1)
     )
    )
    (try
     (do
      (if
       (ref.eq
        (ref.i31
         (i32.const 49)
        )
        (array.new $1
         (v128.const i32x4 0x42a00000 0xbd6d9168 0x417d7cee 0xd7800000)
         (i32.and
          (i32.const 58)
          (i32.const 1023)
         )
        )
       )
       (then
        (call_ref $3
         (ref.func $2)
        )
        (nop)
       )
      )
     )
     (catch_all
      (local.set $1
       (i32.const -32768)
      )
     )
    )
   )
   (return
    (array.new $1
     (global.get $global$22)
     (i32.and
      (i32.const 92)
      (i32.const 1023)
     )
    )
   )
  )
  (unreachable)
 )
 (func $41 (type $21) (result (ref null $1))
  (local $0 arrayref)
  (local $1 arrayref)
  (local $2 i31ref)
  (local $3 stringref)
  (local $4 v128)
  (local $5 v128)
  (local $6 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (array.new $1
   (local.get $5)
   (i32.and
    (i32.const 1)
    (i32.const 1023)
   )
  )
 )
 (func $42 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $41)
  )
  (drop
   (call $41)
  )
  (drop
   (call $41)
  )
 )
 (func $43 (type $43) (param $0 f32) (result eqref (ref null $0) i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (call $7)
   (return
    (tuple.make 3
     (array.new_fixed $5 0)
     (struct.new $0
      (struct.new $0
       (struct.new $0
        (struct.new $0
         (global.get $global$1)
         (i64.const -5435783)
        )
        (i64.const -9223372036854775808)
       )
       (i64.const -7545729016520908)
      )
      (i64.const -20222)
     )
     (i32.const 125309968)
    )
   )
  )
  (unreachable)
 )
 (func $44 (type $3)
  (local $scratch (tuple eqref (ref null $0) i32))
  (local $scratch_1 (ref null $0))
  (local $scratch_2 eqref)
  (local $scratch_3 (tuple eqref (ref null $0) i32))
  (local $scratch_4 (ref null $0))
  (local $scratch_5 eqref)
  (local $scratch_6 (tuple eqref (ref null $0) i32))
  (local $scratch_7 (ref null $0))
  (local $scratch_8 eqref)
  (local $scratch_9 (tuple eqref (ref null $0) i32))
  (local $scratch_10 (ref null $0))
  (local $scratch_11 eqref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result eqref)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $43
        (f32.const 191)
       )
      )
     )
    )
    (drop
     (block (result (ref null $0))
      (local.set $scratch_1
       (tuple.extract 3 1
        (local.get $scratch)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch)
       )
      )
      (local.get $scratch_1)
     )
    )
    (local.get $scratch_2)
   )
  )
  (drop
   (block (result eqref)
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $43
        (f32.const -nan:0x7fffc0)
       )
      )
     )
    )
    (drop
     (block (result (ref null $0))
      (local.set $scratch_4
       (tuple.extract 3 1
        (local.get $scratch_3)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch_3)
       )
      )
      (local.get $scratch_4)
     )
    )
    (local.get $scratch_5)
   )
  )
  (drop
   (block (result eqref)
    (local.set $scratch_8
     (tuple.extract 3 0
      (local.tee $scratch_6
       (call $43
        (f32.const -nan:0x7fff9a)
       )
      )
     )
    )
    (drop
     (block (result (ref null $0))
      (local.set $scratch_7
       (tuple.extract 3 1
        (local.get $scratch_6)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch_6)
       )
      )
      (local.get $scratch_7)
     )
    )
    (local.get $scratch_8)
   )
  )
  (drop
   (block (result eqref)
    (local.set $scratch_11
     (tuple.extract 3 0
      (local.tee $scratch_9
       (call $43
        (f32.const -562949953421312)
       )
      )
     )
    )
    (drop
     (block (result (ref null $0))
      (local.set $scratch_10
       (tuple.extract 3 1
        (local.get $scratch_9)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch_9)
       )
      )
      (local.get $scratch_10)
     )
    )
    (local.get $scratch_11)
   )
  )
 )
 (@binaryen.js.called)
 (func $45 (type $19) (result f64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $46 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $45)
  )
 )
 (func $47 (type $44) (param $0 (ref $2)) (param $1 (ref null $1)) (param $2 f32) (param $3 (ref $2)) (param $4 i32) (param $5 i32) (param $6 (ref $1)) (result (ref $0))
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f32)
  (local $16 f32)
  (local $17 i64)
  (local $18 (ref $0))
  (local $19 externref)
  (local $20 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (global.get $global$1)
 )
 (func $48 (type $3)
  (local $0 i31ref)
  (local $1 stringref)
  (local $2 (ref none))
  (local $3 (ref $2))
  (local $4 (ref $1))
  (local $5 (ref i31))
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f64)
  (local $12 v128)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (struct.new_default $0)
  )
  (if
   (global.get $global$16)
   (then
    (call $fimport$0
     (i32.const 0)
    )
    (return)
   )
   (else
    (try_table
     (block
      (loop
       (if
        (i32.eqz
         (global.get $global$42)
        )
        (then
         (global.set $global$42
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$42
        (i32.sub
         (global.get $global$42)
         (i32.const 1)
        )
       )
       (block
        (atomic.fence)
        (nop)
       )
      )
      (return)
     )
     (unreachable)
    )
    (unreachable)
   )
  )
  (local.set $5
   (local.set $4
    (local.set $3
     (local.set $2
      (unreachable)
     )
    )
   )
  )
 )
 (func $49 (type $45) (param $0 i32) (param $1 exnref) (param $2 (ref null $2)) (result i64)
  (local $3 (ref $0))
  (local $4 (ref $2))
  (local $5 i64)
  (local $scratch (ref (exact $1)))
  (local $scratch_7 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result i64)
   (local.set $scratch_7
    (i64.const 8796093022207)
   )
   (drop
    (block (result (ref (exact $1)))
     (local.set $scratch
      (array.new $1
       (v128.const i32x4 0xffffffec 0xffffffe0 0xffffdd7f 0x0000ff8f)
       (i32.and
        (i32.const 23)
        (i32.const 1023)
       )
      )
     )
     (drop
      (v128.const i32x4 0x00200000 0xffffff81 0x0000ff8b 0xffff8001)
     )
     (local.get $scratch)
    )
   )
   (local.get $scratch_7)
  )
 )
 (func $50 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $49
    (i32.const 53)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1
       (f64.const -5167336)
      )
     )
     (unreachable)
    )
    (array.new $2
     (i32.const 65535)
     (i32.and
      (i32.const 24)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $51 (type $22) (result i64 i64)
  (local $0 i64)
  (local $1 i64)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (local.tee $0
    (block (result i64)
     (local.set $scratch
      (i64.const -2147483648)
     )
     (local.set $1
      (i64.const 2147483648)
     )
     (local.get $scratch)
    )
   )
   (local.get $1)
  )
 )
 (func $52 (type $46) (param $0 (ref null $2)) (result f32)
  (local $1 f64)
  (local $2 f64)
  (local $3 exnref)
  (local $4 stringref)
  (local $5 (ref struct))
  (local $6 externref)
  (local $7 (ref $0))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (try_table
    (struct.set $0 0
     (local.tee $7
      (call $23)
     )
     (global.get $global$1)
    )
   )
   (return
    (f32.const 65534)
   )
  )
  (unreachable)
 )
 (func $53 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $52
    (array.new_default $2
     (i32.and
      (i32.const 26)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $52
    (array.new $2
     (i32.const -2147483648)
     (block (result i32)
      (drop
       (f32.const -nan:0x7fffec)
      )
      (i32.and
       (i32.const 80)
       (i32.const 1023)
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $54 (type $47) (param $0 (ref null $1)) (result v128)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (i64x2.splat
   (i64.const 65474)
  )
 )
 (func $55 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $54
    (array.new $1
     (v128.const i32x4 0x0003ffa8 0xff870000 0x80000000 0x0000ffb4)
     (i32.and
      (i32.const 4)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $54
    (array.new_default $1
     (i32.and
      (i32.const 92)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $56 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $fimport$7
   (ref.func $56)
  )
 )
 (func $57 (type $48) (param $0 (ref null $1)) (param $1 i64) (param $2 exnref) (param $3 (ref $0)) (param $4 (ref $1)) (result (ref struct))
  (local $5 (ref null $0))
  (local $6 (ref null $0))
  (local $7 (ref $1))
  (local $8 i31ref)
  (local $9 exnref)
  (local $10 f32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (if
    (f32.ge
     (f32.load offset=4
      (i32.and
       (i32.const -32769)
       (i32.const 15)
      )
     )
     (f32.const 136)
    )
    (then
     (block
      (return
       (struct.new_default $4)
      )
     )
     (unreachable)
    )
    (else
     (call $fimport$1
      (local.get $13)
     )
     (return
      (global.get $global$26)
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $58 (type $49) (param $0 i32) (param $1 f64) (param $2 i32) (param $3 (ref $2)) (result (ref null $0) i32 (ref null $1) eqref f32)
  (local $4 (ref null $2))
  (local $5 (ref eq))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (type $69) (result (ref (exact $0)) i32 (ref (exact $1)) (ref (exact $0)) f32)
   (call $26)
   (tuple.make 5
    (struct.new $0
     (struct.new $0
      (struct.new $0
       (struct.new_default $0)
       (i64.const -7322538)
      )
      (i64.const 32766)
     )
     (i64.const 47218)
    )
    (i32.const -1424370)
    (array.new $1
     (v128.const i32x4 0xfffff242 0xffffffff 0x7ffffffe 0x00000000)
     (i32.and
      (i32.const 47)
      (i32.const 1023)
     )
    )
    (struct.new $0
     (global.get $global$1)
     (global.get $global$30)
    )
    (f32.const -nan:0x7ffff5)
   )
  )
 )
 (func $59 (type $3)
  (local $scratch (tuple (ref null $0) i32 (ref null $1) eqref f32))
  (local $scratch_1 eqref)
  (local $scratch_2 (ref null $1))
  (local $scratch_3 i32)
  (local $scratch_4 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $0))
    (local.set $scratch_4
     (tuple.extract 5 0
      (local.tee $scratch
       (call $58
        (i32.const -2147483648)
        (f64.const -2147483648.893)
        (i32.const 16777216)
        (array.new_default $2
         (i32.and
          (i32.const 6)
          (i32.const 1023)
         )
        )
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_3
       (tuple.extract 5 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result (ref null $1))
        (local.set $scratch_2
         (tuple.extract 5 2
          (local.get $scratch)
         )
        )
        (drop
         (block (result eqref)
          (local.set $scratch_1
           (tuple.extract 5 3
            (local.get $scratch)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch)
           )
          )
          (local.get $scratch_1)
         )
        )
        (local.get $scratch_2)
       )
      )
      (local.get $scratch_3)
     )
    )
    (local.get $scratch_4)
   )
  )
 )
 (func $60 (type $50) (result anyref)
  (local $0 externref)
  (local $1 i31ref)
  (local $2 exnref)
  (local $3 (ref null $2))
  (local $4 f64)
  (local $5 v128)
  (local $6 i64)
  (local $7 f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (call $40
   (global.get $global$2)
   (i32.const 268435455)
  )
 )
 (func $61 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $60)
  )
 )
 (func $62 (type $51) (param $0 arrayref) (param $1 f32) (result f32)
  (local $2 (ref array))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f32.const -nan:0x7f8824)
   )
  )
  (unreachable)
 )
 (func $63 (type $52) (param $0 (ref null $0)) (result (ref null $2))
  (local $1 (ref null $2))
  (local $2 (ref null $2))
  (local $3 (ref null $2))
  (local $4 (ref null $1))
  (local $5 (ref null $0))
  (local $6 (ref null $0))
  (local $7 (ref eq))
  (local $8 externref)
  (local $9 structref)
  (local $10 funcref)
  (local $11 funcref)
  (local $12 i31ref)
  (local $13 stringref)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 v128)
  (local $18 v128)
  (local $19 f32)
  (local $20 f64)
  (local $21 f64)
  (local $22 i64)
  (local $23 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block $block (result (ref $2))
   (block $block2
    (call_ref $3
     (ref.func $18)
    )
    (br_if $block2
     (i32.eqz
      (i32.atomic.load16_u acqrel offset=4
       (i32.and
        (block $block3 (result i32)
         (nop)
         (drop
          (br_on_cast $block (ref $2) (ref $2)
           (global.get $global$21)
          )
         )
         (br_if $block3
          (local.get $14)
          (string.eq
           (if (result (ref string))
            (block (result i32)
             (local.set $14
              (call_indirect $0 (type $7)
               (i32.const 1)
              )
             )
             (ref.eq
              (struct.new_default $0)
              (array.new $2
               (i32.const -45)
               (i32.and
                (i32.const 42)
                (i32.const 1023)
               )
              )
             )
            )
            (then
             (if
              (i32.eqz
               (select
                (loop $label (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$42)
                  )
                  (then
                   (global.set $global$42
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$42
                  (i32.sub
                   (global.get $global$42)
                   (i32.const 1)
                  )
                 )
                 (call $fimport$5
                  (v128.const i32x4 0xc2800000 0x80000000 0xcf000000 0x55000000)
                 )
                 (br_if $label
                  (i64.le_s
                   (local.get $23)
                   (i64.const -1808051706)
                  )
                 )
                 (string.compare
                  (string.const "\f0\90\8d\88304983")
                  (ref.as_non_null
                   (local.tee $13
                    (string.const "\ed\a0\80")
                   )
                  )
                 )
                )
                (i32.atomic.rmw16.add_u acqrel offset=22
                 (i32.and
                  (i31.get_u
                   (ref.as_non_null
                    (local.get $12)
                   )
                  )
                  (i32.const 15)
                 )
                 (local.tee $14
                  (local.get $14)
                 )
                )
                (i31.get_s
                 (ref.as_non_null
                  (local.tee $12
                   (select (result (ref i31))
                    (loop $label1 (result (ref i31))
                     (if
                      (i32.eqz
                       (global.get $global$42)
                      )
                      (then
                       (global.set $global$42
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$42
                      (i32.sub
                       (global.get $global$42)
                       (i32.const 1)
                      )
                     )
                     (nop)
                     (br_if $label1
                      (i32.eqz
                       (local.get $14)
                      )
                     )
                     (ref.i31
                      (i32.const -2147483647)
                     )
                    )
                    (ref.i31
                     (i32.const -128)
                    )
                    (local.get $14)
                   )
                  )
                 )
                )
               )
              )
              (then
               (return
                (local.get $1)
               )
              )
              (else
               (table.set $1
                (i32.const 3)
                (block $block1 (result (ref exn))
                 (try_table (catch_all_ref $block1)
                  (throw $tag$0)
                 )
                 (unreachable)
                )
               )
               (br $block2)
              )
             )
             (unreachable)
            )
            (else
             (call $fimport$0
              (i32.const 8191)
             )
             (loop (result (ref string))
              (if
               (i32.eqz
                (global.get $global$42)
               )
               (then
                (global.set $global$42
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$42
               (i32.sub
                (global.get $global$42)
                (i32.const 1)
               )
              )
              (call $fimport$6
               (local.tee $7
                (ref.as_non_null
                 (local.get $6)
                )
               )
              )
              (if
               (i32.eqz
                (local.get $14)
               )
               (then
                (br $block2)
               )
               (else
                (i64.atomic.store8 acqrel offset=22
                 (i32.and
                  (block (result i32)
                   (nop)
                   (i32.const -73)
                  )
                  (i32.const 15)
                 )
                 (local.tee $23
                  (select
                   (i64.const -75)
                   (local.tee $23
                    (local.get $23)
                   )
                   (local.get $14)
                  )
                 )
                )
                (br $block2)
               )
              )
              (unreachable)
             )
            )
           )
           (ref.as_non_null
            (local.tee $13
             (ref.as_non_null
              (local.get $13)
             )
            )
           )
          )
         )
        )
        (i32.const 15)
       )
      )
     )
    )
   )
   (return
    (array.new $2
     (local.get $14)
     (i32.and
      (i32.const 90)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $64 (type $3)
  (local $0 i64)
  (local $scratch (ref (exact $2)))
  (local $scratch_2 i64)
  (local $scratch_3 nullref)
  (local $scratch_4 f32)
  (local $scratch_5 (ref exn))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $63
    (struct.new_default $0)
   )
  )
  (drop
   (call $63
    (struct.new $0
     (struct.new_default $0)
     (block (result i64)
      (drop
       (block (result (ref exn))
        (local.set $scratch_5
         (block $block (result (ref exn))
          (try_table (catch_all_ref $block)
           (throw $tag$0)
          )
          (unreachable)
         )
        )
        (drop
         (block (result f32)
          (local.set $scratch_4
           (f32.const -nan:0x7fffe7)
          )
          (drop
           (block (result nullref)
            (local.set $scratch_3
             (ref.null none)
            )
            (local.set $0
             (block (result i64)
              (local.set $scratch_2
               (i64.const -9223372036854775808)
              )
              (drop
               (block (result (ref (exact $2)))
                (local.set $scratch
                 (array.new_default $2
                  (i32.and
                   (i32.const 0)
                   (i32.const 1023)
                  )
                 )
                )
                (drop
                 (i32.const -4194304)
                )
                (local.get $scratch)
               )
              )
              (local.get $scratch_2)
             )
            )
            (local.get $scratch_3)
           )
          )
          (local.get $scratch_4)
         )
        )
        (local.get $scratch_5)
       )
      )
      (local.get $0)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $65 (type $53) (param $0 (ref null $2)) (param $1 i64) (param $2 structref) (param $3 f64) (result v128 exnref arrayref i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (if (type $25) (result v128 (ref exn) (ref null (exact $2)) i32)
   (i32.eqz
    (i32.const 2097151)
   )
   (then
    (tuple.make 4
     (v128.const i32x4 0x00000000 0x43e00000 0xc3e00000 0x41eff5e8)
     (block $block (result (ref exn))
      (try_table (catch_all_ref $block)
       (throw $tag$0)
      )
      (unreachable)
     )
     (array.new $2
      (i32.const 65425)
      (i32.and
       (i32.const 49)
       (i32.const 1023)
      )
     )
     (i32.const -1048577)
    )
   )
   (else
    (try
     (do
      (local.set $3
       (local.get $3)
      )
     )
     (catch_all
      (nop)
     )
    )
    (tuple.make 4
     (v128.const i32x4 0x000074fe 0x82fb00ff 0x855800a2 0x44473ea6)
     (block $block1 (result (ref exn))
      (try_table (catch_all_ref $block1)
       (throw $tag$0)
      )
      (unreachable)
     )
     (ref.null none)
     (i32.const 239)
    )
   )
  )
 )
 (func $66 (type $54) (param $0 anyref) (param $1 (ref $0)) (param $2 f64) (param $3 i64) (result i31ref)
  (local $4 anyref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $67 (type $3)
  (local $0 i64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 (ref $2))
  (local $6 (ref $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $66
    (struct.new_default $4)
    (struct.new $0
     (struct.new_default $0)
     (i64.rotl
      (i64.const 1)
      (i64.const 2147483648)
     )
    )
    (f64.const 4294935594)
    (i64.const 268435457)
   )
  )
  (drop
   (call $66
    (array.new_fixed $5 0)
    (struct.new $0
     (struct.new_default $0)
     (local.tee $0
      (call $10
       (loop (result v128)
        (if
         (i32.eqz
          (global.get $global$42)
         )
         (then
          (global.set $global$42
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$42
         (i32.sub
          (global.get $global$42)
          (i32.const 1)
         )
        )
        (i32x4.shl
         (v128.const i32x4 0xf801ffff 0x002bffaf 0xff970000 0x2965ff81)
         (local.get $1)
        )
       )
       (global.get $global$1)
       (if (result i32)
        (i32.lt_u
         (local.tee $2
          (if (result i32)
           (i32.eqz
            (ref.is_null
             (ref.i31
              (i32.const 17229)
             )
            )
           )
           (then
            (atomic.fence)
            (return)
           )
           (else
            (i32.const 16777217)
           )
          )
         )
         (array.len
          (local.tee $5
           (array.new $2
            (local.get $1)
            (i32.and
             (i32.const 81)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (then
         (array.get $2
          (local.get $5)
          (local.get $2)
         )
        )
        (else
         (i32.const -116)
        )
       )
       (f64x2.extract_lane 1
        (local.get $4)
       )
       (array.new_fixed $5 0)
       (if (result v128)
        (i32.lt_u
         (local.tee $3
          (i32.load offset=4 align=1
           (i32.and
            (i32.load16_u
             (i32.and
              (i16x8.extract_lane_s 7
               (local.get $4)
              )
              (i32.const 15)
             )
            )
            (i32.const 15)
           )
          )
         )
         (array.len
          (local.tee $6
           (array.new_default $1
            (i32.and
             (i32.const 56)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (then
         (array.get $1
          (local.get $6)
          (local.get $3)
         )
        )
        (else
         (local.get $4)
        )
       )
      )
     )
    )
    (f64.const 4294967211)
    (i64.const 4294967207)
   )
  )
 )
 (func $68 (type $55) (result stringref)
  (local $0 f32)
  (local $1 i64)
  (local $2 f64)
  (local $3 i31ref)
  (local $4 (ref null $1))
  (local $5 (ref null $2))
  (local $6 (ref $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result stringref)
   (call $fimport$0
    (i32.const 4096)
   )
   (try (result stringref)
    (do
     (string.const "\ed\bd\88\ed\a0\80")
    )
    (catch $tag$1
     (local.set $2 (select (pop f64) (local.get $2) (i32.const 0)))
     (string.const "")
    )
    (catch_all
     (global.get $global$23)
    )
   )
  )
 )
 (func $69 (type $8) (result (ref $1))
  (local $0 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $1)))
   (drop
    (i32.and
     (local.tee $0
      (i32.const -2048)
     )
     (i32.const 15)
    )
   )
   (block
    (nop)
    (return
     (array.new_default $1
      (i32.and
       (i32.const 45)
       (i32.const 1023)
      )
     )
    )
   )
   (unreachable)
  )
 )
 (func $70 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $69)
  )
  (drop
   (call $69)
  )
 )
 (func $71 (type $56) (param $0 (ref eq)) (param $1 (ref struct)) (param $2 (ref null $2)) (result stringref)
  (local $3 f64)
  (local $4 i64)
  (local $5 f32)
  (local $6 i32)
  (local $scratch (ref string))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result (ref string))
   (if
    (i32.eqz
     (i32.const 65534)
    )
    (then
     (nop)
    )
   )
   (local.set $scratch
    (string.const "\f0\90\8d\88")
   )
   (drop
    (i64.const 4294967276)
   )
   (local.get $scratch)
  )
 )
 (func $72 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $71
    (ref.i31
     (i32.const 32768)
    )
    (struct.new_default $4)
    (ref.null none)
   )
  )
  (drop
   (call $71
    (ref.i31
     (i32.const 8)
    )
    (struct.new_default $4)
    (array.new $2
     (call_indirect $0 (type $7)
      (i32.const 3)
     )
     (i32.and
      (i32.const 21)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $73 (type $21) (result (ref null $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (array.new $1
     (global.get $global$22)
     (i32.and
      (i32.const 31)
      (i32.const 1023)
     )
    )
   )
  )
  (unreachable)
 )
 (func $74 (type $7) (result i32)
  (local $0 (ref null $1))
  (local $1 (ref null $1))
  (local $2 (ref struct))
  (local $3 stringref)
  (local $4 f32)
  (local $5 i32)
  (local $scratch i32)
  (local $scratch_7 (ref (exact $1)))
  (local $scratch_8 (ref (exact $2)))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (i32.atomic.load8_u acqrel offset=22
   (i32.and
    (i32.atomic.rmw8.cmpxchg_u offset=4
     (i32.and
      (global.get $global$35)
      (i32.const 15)
     )
     (ref.eq
      (array.new_default $2
       (i32.and
        (i32.const 42)
        (i32.const 1023)
       )
      )
      (struct.new_default $0)
     )
     (block (result i32)
      (drop
       (block (result (ref (exact $2)))
        (local.set $scratch_8
         (array.new_default $2
          (i32.and
           (i32.const 11)
           (i32.const 1023)
          )
         )
        )
        (drop
         (block (result (ref (exact $1)))
          (local.set $scratch_7
           (array.new_default $1
            (i32.and
             (i32.const 81)
             (i32.const 1023)
            )
           )
          )
          (local.set $5
           (block (result i32)
            (local.set $scratch
             (i32.const -655)
            )
            (drop
             (ref.null none)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_7)
         )
        )
        (local.get $scratch_8)
       )
      )
      (local.get $5)
     )
    )
    (i32.const 15)
   )
  )
 )
 (func $75 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
  (drop
   (call $74)
  )
 )
 (@binaryen.js.called)
 (func $76 (type $8) (result (ref $1))
  (local $0 externref)
  (local $1 (ref string))
  (local $2 exnref)
  (local $3 v128)
  (local $4 f64)
  (local $5 f64)
  (local $6 f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.set $1
   (global.get $global$17)
  )
  (select (result (ref (exact $1)))
   (array.new_default $1
    (i32.and
     (i32.const 72)
     (i32.const 1023)
    )
   )
   (if (result (ref (exact $1)))
    (i32.eqz
     (try (result i32)
      (do
       (try_table
        (block
         (call $fimport$6
          (if (result (ref i31))
           (i32.const 185)
           (then
            (ref.i31
             (i32.const 65467)
            )
           )
           (else
            (nop)
            (return
             (array.new_default $1
              (i32.and
               (i32.const 45)
               (i32.const 1023)
              )
             )
            )
           )
          )
         )
         (loop
          (if
           (i32.eqz
            (global.get $global$42)
           )
           (then
            (global.set $global$42
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$42
           (i32.sub
            (global.get $global$42)
            (i32.const 1)
           )
          )
          (loop $label
           (if
            (i32.eqz
             (global.get $global$42)
            )
            (then
             (global.set $global$42
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$42
            (i32.sub
             (global.get $global$42)
             (i32.const 1)
            )
           )
           (block
            (call $fimport$7
             (block (result (ref (exact $8)))
              (nop)
              (ref.func $76)
             )
            )
            (br $label)
           )
           (unreachable)
          )
          (unreachable)
          (drop
           (string.const "")
          )
          (drop
           (string.const "\ed\a0\80\c2\a3\c2\a3")
          )
          (loop
           (if
            (i32.eqz
             (global.get $global$42)
            )
            (then
             (global.set $global$42
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$42
            (i32.sub
             (global.get $global$42)
             (i32.const 1)
            )
           )
           (block
            (block
             (nop)
             (nop)
            )
            (return
             (global.get $global$7)
            )
           )
           (unreachable)
          )
          (local.set $1
           (unreachable)
          )
         )
         (unreachable)
        )
        (unreachable)
       )
       (unreachable)
      )
      (catch $tag$1
       (local.set $5 (pop f64))
       (i32.trunc_sat_f64_s
        (f64.load offset=4 align=2
         (i32.and
          (string.compare
           (local.get $1)
           (global.get $global$17)
          )
          (i32.const 15)
         )
        )
       )
      )
      (catch_all
       (string.eq
        (string.const "\ed\bd\88")
        (if (result (ref string))
         (i32.eqz
          (global.get $global$16)
         )
         (then
          (table.set $1
           (i32.const 1)
           (local.tee $2
            (block $block (result (ref exn))
             (try_table (catch_all_ref $block)
              (throw $tag$0)
             )
             (unreachable)
            )
           )
          )
          (return
           (global.get $global$41)
          )
         )
         (else
          (nop)
          (string.const "974")
         )
        )
       )
      )
     )
    )
    (then
     (call $fimport$4
      (f64.load offset=22 align=1
       (i32.and
        (i32.const -15)
        (i32.const 15)
       )
      )
     )
     (return
      (array.new $1
       (local.get $3)
       (i32.and
        (i32.const 91)
        (i32.const 1023)
       )
      )
     )
    )
    (else
     (if (result (ref (exact $1)))
      (i32.eqz
       (global.get $global$16)
      )
      (then
       (loop $label1
        (if
         (i32.eqz
          (global.get $global$42)
         )
         (then
          (global.set $global$42
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$42
         (i32.sub
          (global.get $global$42)
          (i32.const 1)
         )
        )
        (block
         (call $fimport$3
          (local.tee $6
           (f32.load offset=3
            (i32.and
             (i32.const -255)
             (i32.const 15)
            )
           )
          )
         )
         (br $label1)
        )
        (unreachable)
       )
       (unreachable)
      )
      (else
       (array.new_default $1
        (i32.and
         (i32.const 0)
         (i32.const 1023)
        )
       )
      )
     )
    )
   )
   (global.get $global$39)
  )
 )
 (func $77 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $76)
  )
 )
 (func $78 (type $57) (param $0 (ref struct)) (param $1 (ref $2)) (param $2 (ref $1)) (param $3 (ref $1)) (param $4 i64) (result f32)
  (local $5 eqref)
  (local $6 exnref)
  (local $7 (ref eq))
  (local $8 i31ref)
  (local $9 v128)
  (local $10 f64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f32.const -0.23800000548362732)
   )
  )
  (unreachable)
 )
 (func $79 (type $3)
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 v128)
  (local $9 i31ref)
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 (ref string))
  (local $13 (ref $6))
  (local $14 (ref $6))
  (local $15 (ref $6))
  (local $16 (ref $6))
  (local $17 (ref $6))
  (local $scratch (tuple v128 f64))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.set $10
   (string.const "\f0\90\8d\88\e2\82\ac")
  )
  (drop
   (call $78
    (struct.new_default $4)
    (array.new $2
     (memory.atomic.notify offset=22
      (i32.and
       (try (result i32)
        (do
         (string.compare
          (global.get $global$17)
          (string.const "\e2\82\ac600")
         )
        )
        (catch $tag$1
         (local.set $0 (local.tee $0 (pop f64)))
         (loop $label
          (if
           (i32.eqz
            (global.get $global$42)
           )
           (then
            (global.set $global$42
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$42
           (i32.sub
            (global.get $global$42)
            (i32.const 1)
           )
          )
          (block
           (drop
            (try (result f64)
             (do
              (block
               (call $fimport$8
                (string.const "\c2\a3\c2\a3962")
               )
               (br $label)
              )
              (unreachable)
             )
             (catch $tag$1
              (local.set $1 (pop f64))
              (local.get $2)
             )
            )
           )
           (br $label)
          )
          (unreachable)
         )
         (unreachable)
        )
       )
       (i32.const 15)
      )
      (call_ref $7
       (ref.func $8)
      )
     )
     (i32.and
      (i32.const 83)
      (i32.const 1023)
     )
    )
    (array.new_default $1
     (i32.and
      (i32.const 94)
      (i32.const 1023)
     )
    )
    (array.new_default $1
     (i32.and
      (i32.const 37)
      (i32.const 1023)
     )
    )
    (i64.const 2251799813685249)
   )
  )
  (drop
   (call $78
    (struct.new_default $4)
    (block (result (ref (exact $2)))
     (local.set $12
      (string.const "\f0\90\8d\88\c2\a3")
     )
     (array.new $2
      (i32.load offset=2 align=2
       (i32.and
        (if (result i32)
         (i32.lt_u
          (i32.add
           (local.tee $6
            (i32.const 8764)
           )
           (local.tee $7
            (string.measure_wtf16
             (local.get $12)
            )
           )
          )
          (array.len
           (local.tee $17
            (array.new $6
             (i32.const -2147483648)
             (i32.and
              (i32.const 11)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (string.encode_wtf16_array
           (local.get $12)
           (local.get $17)
           (local.get $6)
          )
         )
         (else
          (string.measure_wtf16
           (local.get $10)
          )
         )
        )
        (i32.const 15)
       )
      )
      (i32.and
       (i32.const 16)
       (i32.const 1023)
      )
     )
    )
    (array.new $1
     (tuple.extract 2 0
      (local.tee $scratch
       (block (type $72) (result v128 f64)
        (nop)
        (tuple.make 2
         (local.get $8)
         (local.get $3)
        )
       )
      )
     )
     (block (result i32)
      (drop
       (tuple.extract 2 1
        (local.get $scratch)
       )
      )
      (i32.and
       (i32.const 71)
       (i32.const 1023)
      )
     )
    )
    (array.new_default $1
     (i32.and
      (i32.const 83)
      (i32.const 1023)
     )
    )
    (i64.const 122)
   )
  )
 )
 (func $80 (type $23) (param $0 exnref) (result f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 v128)
  (local $scratch f64)
  (local $scratch_9 (ref (exact $4)))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (f32.min
   (block (result f32)
    (call $fimport$1
     (stringview_wtf16.get_codeunit
      (string.const "19")
      (block (result i32)
       (local.set $2
        (string.measure_wtf16
         (try_table (result (ref string))
          (string.const "977")
         )
        )
       )
       (local.get $2)
      )
     )
    )
    (loop $label3 (result f32)
     (if
      (i32.eqz
       (global.get $global$42)
      )
      (then
       (global.set $global$42
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$42
      (i32.sub
       (global.get $global$42)
       (i32.const 1)
      )
     )
     (block
      (call $fimport$8
       (try (result (ref extern))
        (do
         (global.get $gimport$0)
        )
        (catch_all
         (try (result (ref string))
          (do
           (if (result (ref string))
            (ref.test (ref struct)
             (global.get $global$26)
            )
            (then
             (string.const "\ed\bd\88")
            )
            (else
             (loop $label
              (if
               (i32.eqz
                (global.get $global$42)
               )
               (then
                (global.set $global$42
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$42
               (i32.sub
                (global.get $global$42)
                (i32.const 1)
               )
              )
              (nop)
              (br_if $label
               (i32.eqz
                (i32.const 131072)
               )
              )
              (loop $label1
               (if
                (i32.eqz
                 (global.get $global$42)
                )
                (then
                 (global.set $global$42
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$42
                (i32.sub
                 (global.get $global$42)
                 (i32.const 1)
                )
               )
               (block
                (call $fimport$3
                 (if (result f32)
                  (i32.const 2147483646)
                  (then
                   (f32.const -nan:0x7fde44)
                  )
                  (else
                   (f32.const 69)
                  )
                 )
                )
                (call $fimport$3
                 (f32.convert_i64_s
                  (local.get $3)
                 )
                )
               )
               (br_if $label1
                (i32.eqz
                 (local.get $1)
                )
               )
               (call $fimport$6
                (ref.i31
                 (i32.const -1)
                )
               )
              )
             )
             (throw $tag$1
              (local.tee $4
               (f64.mul
                (f64.const -nan:0xfffffffffc331)
                (block (result f64)
                 (drop
                  (block (result (ref (exact $4)))
                   (local.set $scratch_9
                    (struct.new_default $4)
                   )
                   (local.set $6
                    (block (result f64)
                     (local.set $scratch
                      (f64.const -nan:0xfffffffffffcd)
                     )
                     (drop
                      (string.const "\e2\82\ac\ed\bd\88\e2\82\ac")
                     )
                     (local.get $scratch)
                    )
                   )
                   (local.get $scratch_9)
                  )
                 )
                 (local.get $6)
                )
               )
              )
             )
            )
           )
          )
          (catch $tag$1
           (drop (pop f64))
           (global.get $global$17)
          )
          (catch_all
           (if (result (ref string))
            (i32.eqz
             (block (result i32)
              (call $fimport$5
               (local.tee $7
                (loop $label2 (result v128)
                 (if
                  (i32.eqz
                   (global.get $global$42)
                  )
                  (then
                   (global.set $global$42
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$42
                  (i32.sub
                   (global.get $global$42)
                   (i32.const 1)
                  )
                 )
                 (nop)
                 (br_if $label2
                  (i32.eqz
                   (i32.const -29)
                  )
                 )
                 (v128.const i32x4 0x46bc1e00 0x45911800 0x46000725 0xffffff96)
                )
               )
              )
              (local.get $1)
             )
            )
            (then
             (table.set $0
              (i32.const 0)
              (ref.func $80)
             )
             (string.const "")
            )
            (else
             (call_ref $3
              (ref.func $7)
             )
             (global.get $global$17)
            )
           )
          )
         )
        )
       )
      )
      (call_indirect $0 (type $3)
       (i32.const 8)
      )
     )
     (br_if $label3
      (i31.get_s
       (ref.i31
        (i32.const 0)
       )
      )
     )
     (f32.const -18446744073709551615)
    )
   )
   (f32.load offset=4 align=2
    (i32.and
     (ref.is_null
      (select (result (ref (exact $23)))
       (ref.func $80)
       (ref.func $80)
       (i32.load16_s offset=22
        (i32.and
         (local.tee $1
          (block $block (result i32)
           (call $fimport$2
            (if (result i64)
             (i32.eqz
              (br_if $block
               (ref.eq
                (ref.as_non_null
                 (ref.null none)
                )
                (ref.null none)
               )
               (br_if $block
                (try_table (result i32)
                 (local.get $1)
                )
                (i32.eqz
                 (local.get $1)
                )
               )
              )
             )
             (then
              (call $fimport$5
               (local.tee $7
                (local.get $7)
               )
              )
              (return
               (f32.const -nan:0x7fffbc)
              )
             )
             (else
              (if
               (i32.eqz
                (local.get $1)
               )
               (then
                (call_indirect $0 (type $3)
                 (i32.const 8)
                )
                (call $fimport$8
                 (global.get $gimport$0)
                )
               )
              )
              (local.tee $3
               (i64.div_s
                (local.get $3)
                (local.get $3)
               )
              )
             )
            )
           )
           (return
            (f32.const 140737488355328)
           )
          )
         )
         (i32.const 15)
        )
       )
      )
     )
     (i32.const 15)
    )
   )
  )
 )
 (func $81 (type $3)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $80
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1
       (block (result f64)
        (if
         (i32.eqz
          (global.get $global$39)
         )
         (then
          (unreachable)
         )
         (else
          (nop)
          (call $2)
         )
        )
        (global.get $global$2)
       )
      )
     )
     (unreachable)
    )
   )
  )
  (drop
   (call $80
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$1
       (f64.const -2147483647)
      )
     )
     (unreachable)
    )
   )
  )
  (drop
   (call $80
    (ref.null noexn)
   )
  )
 )
 (func $82 (type $58) (param $0 i64) (param $1 (ref null $1)) (param $2 (ref string)) (result i31ref)
  (local $3 (ref null $1))
  (local $4 i32)
  (local $5 i32)
  (local $6 f64)
  (local $7 v128)
  (local $8 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (ref.i31
   (i32.const -2048)
  )
 )
 (func $83 (type $3)
  (local $0 i32)
  (local $1 i32)
  (local $2 (ref $1))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (drop
   (call $82
    (i64.const 128)
    (array.new $1
     (v128.const i32x4 0xc2ac0000 0xffffa05a 0xc034fdf4 0xffff8008)
     (i32.and
      (i32.const 72)
      (i32.const 1023)
     )
    )
    (string.const "\ed\a0\80\c2\a3\ed\a0\80")
   )
  )
  (drop
   (i64.const -255)
  )
  (if
   (i32.const -78)
   (then
    (memory.init $2
     (i32.and
      (string.measure_wtf16
       (global.get $global$17)
      )
      (i32.const 15)
     )
     (i32.const 7)
     (i32.const 1)
    )
    (return)
   )
   (else
    (block
     (nop)
     (nop)
    )
    (return)
   )
  )
  (local.set $2
   (unreachable)
  )
 )
 (func $84 (type $18) (result f32)
  (local $0 (ref $0))
  (local $1 (ref $0))
  (local $2 f64)
  (local $3 f64)
  (local $4 i64)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block
   (drop
    (try (result (ref $2))
     (do
      (global.get $global$21)
     )
     (catch $tag$1
      (local.set $3 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
      (global.get $global$21)
     )
     (catch_all
      (global.get $global$21)
     )
    )
   )
   (return
    (f32.const -0.17900000512599945)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $85 (type $59) (result arrayref)
  (local $0 externref)
  (local $1 (ref null $0))
  (local $2 (ref null $0))
  (local $3 (ref null $1))
  (local $4 (ref null $1))
  (local $5 stringref)
  (local $6 stringref)
  (local $7 structref)
  (local $8 (ref $0))
  (local $9 (ref $0))
  (local $10 funcref)
  (local $11 funcref)
  (local $12 (ref string))
  (local $13 (ref $2))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 f64)
  (local $19 f64)
  (local $20 i32)
  (local $21 f32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $5)))
   (if
    (i32.eqz
     (global.get $global$39)
    )
    (then
     (block $block1
      (local.set $19
       (local.get $19)
      )
      (block $block
       (if
        (ref.eq
         (global.get $global$26)
         (global.get $global$7)
        )
        (then
         (nop)
         (nop)
        )
       )
       (try_table (catch_all $block)
        (if
         (i32.eqz
          (try_table (result i32) (catch_all $block1)
           (global.get $global$16)
          )
         )
         (then
          (call $fimport$1
           (global.get $global$16)
          )
         )
        )
       )
      )
      (call $fimport$5
       (global.get $global$22)
      )
     )
    )
   )
   (array.new_fixed $5 0)
  )
 )
 (func $86 (type $60) (param $0 f64) (result f64)
  (local $1 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.tee $0
   (local.get $0)
  )
 )
 (func $87 (type $61) (param $0 (ref $1)) (param $1 i32) (param $2 i31ref) (param $3 eqref) (result (ref $2))
  (local $4 (ref null $1))
  (local $5 (ref $2))
  (local $6 stringref)
  (local $7 (ref null $2))
  (local $8 externref)
  (local $9 anyref)
  (local $10 (ref $6))
  (local $11 (ref $6))
  (local $12 (ref string))
  (local $13 f32)
  (local $14 v128)
  (local $15 i64)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (if
   (call_ref $7
    (ref.func $1)
   )
   (then
    (nop)
    (nop)
    (return
     (global.get $global$21)
    )
   )
   (else
    (return
     (array.new $2
      (i32.const -262144)
      (i32.and
       (i32.const 59)
       (i32.const 1023)
      )
     )
    )
   )
  )
  (unreachable)
 )
 (func $88 (type $3)
  (local $0 v128)
  (local $1 f64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 (ref string))
  (local $10 (ref none))
  (local $11 (ref $2))
  (local $12 (ref $2))
  (local $13 (ref i31))
  (local $14 (ref i31))
  (local $15 i31ref)
  (if
   (i32.eqz
    (global.get $global$42)
   )
   (then
    (global.set $global$42
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$42
   (i32.sub
    (global.get $global$42)
    (i32.const 1)
   )
  )
  (local.set $14
   (ref.i31
    (i32.const -12438)
   )
  )
  (local.set $7
   (string.const "955\e2\82\ac\e2\82\ac")
  )
  (drop
   (call $87
    (array.new $1
     (local.tee $0
      (global.get $global$22)
     )
     (i32.and
      (i32.const 81)
      (i32.const 1023)
     )
    )
    (i32.const -4799)
    (ref.i31
     (i32.const -114)
    )
    (ref.i31
     (i32.const 255)
    )
   )
  )
  (drop
   (call $87
    (array.new $1
     (local.tee $0
      (local.tee $0
       (local.get $0)
      )
     )
     (i32.and
      (i32.const 29)
      (i32.const 1023)
     )
    )
    (i32.const -119)
    (ref.null none)
    (ref.i31
     (i32.const 256)
    )
   )
  )
  (drop
   (call $87
    (array.new $1
     (block (result v128)
      (if (result v128)
       (i32.eqz
        (i32.const -128)
       )
       (then
        (try
         (do
          (nop)
         )
         (catch $tag$1
          (local.set $1 (local.tee $1 (pop f64)))
          (struct.set $0 0
           (struct.new_default $0)
           (struct.new_default $0)
          )
         )
         (catch_all
          (loop $label1
           (if
            (i32.eqz
             (global.get $global$42)
            )
            (then
             (global.set $global$42
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$42
            (i32.sub
             (global.get $global$42)
             (i32.const 1)
            )
           )
           (block $block1
            (drop
             (loop $label (result (ref string))
              (if
               (i32.eqz
                (global.get $global$42)
               )
               (then
                (global.set $global$42
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$42
               (i32.sub
                (global.get $global$42)
                (i32.const 1)
               )
              )
              (block $block (result (ref string))
               (memory.fill
                (i32.and
                 (call_indirect $0 (type $7)
                  (i32.const 1)
                 )
                 (i32.const 15)
                )
                (i32.const -70)
                (memory.atomic.notify offset=22
                 (i32.and
                  (block (result i32)
                   (local.get $2)
                  )
                  (i32.const 15)
                 )
                 (try_table (result i32) (catch_all $label)
                  (local.get $2)
                 )
                )
               )
               (br_on_non_null $block
                (global.get $global$17)
               )
               (br_if $block
                (local.get $7)
                (i32.eqz
                 (if (result i32)
                  (i31.get_s
                   (ref.i31
                    (i32.const -2147483648)
                   )
                  )
                  (then
                   (local.set $9
                    (local.tee $7
                     (local.tee $8
                      (string.const "")
                     )
                    )
                   )
                   (if (result i32)
                    (i32.lt_u
                     (i32.add
                      (local.tee $3
                       (block (result i32)
                        (nop)
                        (local.get $2)
                       )
                      )
                      (local.tee $4
                       (string.measure_wtf16
                        (local.get $9)
                       )
                      )
                     )
                     (array.len
                      (local.tee $10
                       (ref.as_non_null
                        (ref.null none)
                       )
                      )
                     )
                    )
                    (then
                     (string.encode_wtf16_array
                      (local.get $9)
                      (local.get $10)
                      (local.get $3)
                     )
                    )
                    (else
                     (local.get $2)
                    )
                   )
                  )
                  (else
                   (i32.const 245)
                  )
                 )
                )
               )
              )
             )
            )
            (block
             (block
              (local.set $2
               (i32.const -47)
              )
              (nop)
             )
             (br $label1)
            )
            (memory.fill
             (i32.and
              (stringview_wtf16.get_codeunit
               (local.set $6
                (i64.eqz
                 (unreachable)
                )
               )
               (local.get $6)
              )
              (i32.const 15)
             )
             (global.get $global$0)
             (ref.eq
              (select (result (ref i31))
               (block (result (ref i31))
                (nop)
                (local.tee $13
                 (local.tee $14
                  (ref.i31
                   (i32.const -1048576)
                  )
                 )
                )
               )
               (local.get $14)
               (stringview_wtf16.get_codeunit
                (local.get $7)
                (block (result i32)
                 (drop
                  (br_on_null $block1
                   (global.get $global$1)
                  )
                 )
                 (local.set $6
                  (f32.eq
                   (f32.const -72057594037927936)
                   (loop $label2 (result f32)
                    (if
                     (i32.eqz
                      (global.get $global$42)
                     )
                     (then
                      (global.set $global$42
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$42
                     (i32.sub
                      (global.get $global$42)
                      (i32.const 1)
                     )
                    )
                    (nop)
                    (br_if $label2
                     (select
                      (i32.const -1048575)
                      (if (result i32)
                       (i32.lt_u
                        (local.tee $5
                         (local.get $2)
                        )
                        (array.len
                         (local.tee $12
                          (local.tee $11
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                         )
                        )
                       )
                       (then
                        (array.get $2
                         (local.get $12)
                         (local.get $5)
                        )
                       )
                       (else
                        (local.get $2)
                       )
                      )
                      (local.get $2)
                     )
                    )
                    (f32.const 524287.78125)
                   )
                  )
                 )
                 (local.get $6)
                )
               )
              )
              (local.get $15)
             )
            )
            (nop)
           )
          )
         )
        )
        (v128.const i32x4 0xc2280000 0x5f000000 0x7f7fffff 0xd0000000)
       )
       (else
        (return)
       )
      )
     )
     (i32.and
      (i32.const 13)
      (i32.const 1023)
     )
    )
    (i32.const -116)
    (ref.i31
     (i32.const -30)
    )
    (struct.new_default $4)
   )
  )
 )
 (type $__sinkT_0 (func (param f64) (result f64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
