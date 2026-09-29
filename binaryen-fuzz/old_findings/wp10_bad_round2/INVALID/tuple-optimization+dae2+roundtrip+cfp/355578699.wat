(module
 (type $0 (struct))
 (rec
  (type $1 (struct (field (mut i64)) (field i64)))
  (type $2 (sub (func (param i32) (result f64))))
  (type $3 (sub (array (mut f64))))
  (type $4 (func (param i31ref f32 i32 funcref v128) (result v128)))
  (type $5 (sub (func (param f64 f64) (result (ref $3) v128 i32 i64 i64))))
  (type $6 (struct))
  (type $7 (struct (field (mut i64)) (field (mut (ref null $2))) (field f64)))
 )
 (rec
  (type $8 (array (mut i8)))
  (type $9 (sub (func (param (ref struct) f32 f64 i32))))
  (type $10 (array v128))
  (type $11 (struct (field (mut externref)) (field i8) (field f64) (field (mut i8))))
  (type $12 (array (mut anyref)))
  (type $13 (func (param (ref $14) (ref $17) i32 i64 f64) (result v128)))
  (type $14 (struct (field (mut v128)) (field (ref null $4)) (field (mut i16)) (field (ref null $13)) (field f32)))
  (type $15 (func (result (ref $19))))
  (type $16 (sub (func (param i64 (ref null $17) f32 (ref $3) i32 exnref))))
  (type $17 (sub (func (param (ref null $18) (ref $7) (ref func) v128))))
  (type $18 (func (result (ref nofunc))))
  (type $19 (func (result f32 f32)))
  (type $20 (func (param i64) (result externref)))
  (type $21 (func))
 )
 (type $22 (array i8))
 (type $23 (func))
 (type $24 (array (mut i16)))
 (type $25 (func (param anyref)))
 (type $26 (func (param i32)))
 (type $27 (func (param externref)))
 (type $28 (func (param i32) (result i32)))
 (type $29 (func (param i32 i32) (result i32)))
 (type $30 (func (param f32)))
 (type $31 (func (result f32 eqref anyref)))
 (type $32 (func (param (ref $14))))
 (type $33 (func (param i64)))
 (type $34 (func (param f64)))
 (type $35 (func (param v128)))
 (type $36 (func (param funcref)))
 (type $37 (func (result funcref)))
 (type $38 (func (param (ref $5) (ref $6) i64 (ref $19) i32 i64) (result (ref $10))))
 (type $39 (func (param f32) (result f32)))
 (type $40 (func (param f64) (result f64)))
 (type $41 (func (param v128) (result v128)))
 (type $42 (func (result (ref $3) v128 i32 i64 i64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_20" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $26) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $26) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $33) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $30) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $34) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $35) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $25) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $36) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $27) (param externref)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$9 (type $28) (param i32) (result i32)))
 (import "fuzzing-support" "sleep" (func $fimport$10 (type $29) (param i32 i32) (result i32)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $26) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $27) (param externref)))
 (global $global$0 i32 (i32.const -1154519020))
 (global $global$1 i64 (i64.const -576460752303423488))
 (global $global$2 (mut (ref null $17)) (ref.func $0))
 (global $global$3 i32 (i32.const -255))
 (global $global$4 (ref null $17) (ref.func $0))
 (global $global$5 anyref (ref.i31
  (i32.const 120)
 ))
 (global $global$6 (ref null $21) (ref.null nofunc))
 (global $global$7 (mut i64) (i64.const 9223372036854775807))
 (global $global$8 (mut i64) (i64.const -2))
 (global $global$9 (ref null $11) (struct.new $11
  (string.const "797")
  (i32.const -67108864)
  (f64.const 19)
  (global.get $global$0)
 ))
 (global $global$10 i64 (i64.const -9223372036854775808))
 (global $global$11 (ref null $14) (struct.new $14
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  (ref.null nofunc)
  (i32.const 186781468)
  (ref.func $1)
  (f32.const -5258)
 ))
 (global $global$12 i64 (i64.const 4294967216))
 (global $global$13 (ref null $6) (struct.new_default $6))
 (global $global$14 (ref null $2) (ref.null nofunc))
 (global $global$15 stringref (string.const "988\e2\82\ac\ed\a0\80"))
 (global $global$16 i32 (i32.const -6922413))
 (global $global$17 (mut (ref $3)) (array.new $3
  (f64.const 0)
  (i32.const 20)
 ))
 (global $global$18 (mut i64) (i64.const 72057594037927937))
 (global $global$19 (mut i64) (i64.const -9))
 (global $global$20 (ref null $12) (array.new_default $12
  (i32.const 53)
 ))
 (global $global$21 (mut i64) (i64.const -32767))
 (global $global$22 (mut stringref) (string.const "\f0\90\8d\88\e2\82\ac"))
 (global $global$23 (ref null $10) (array.new $10
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  (i32.const 21)
 ))
 (global $global$24 (ref null $15) (ref.func $2))
 (global $global$25 f32 (f32.const -9223372036854775808))
 (global $global$26 (mut (ref $21)) (ref.func $3))
 (global $global$27 eqref (struct.new_default $0))
 (global $global$28 (mut i32) (i32.const 100))
 (memory $0 16 16 shared)
 (data $0 "`y\0b")
 (data $1 "\d2\d3\"\\d\04\94\c1")
 (data $2 (i32.const 0) "\92\fd\a0\a4\eb$\e0\1e\8fM\03\ec=\bc\eb\97\15")
 (data $3 "\bd|\81\c4rn\03\e4:=\12\0f\02%\19\89\rT\b0\cc\b6\1e")
 (data $4 "3\'?,u\152\9a5X(\174")
 (data $5 "A\d8J\95g\1e\07\9bs\81\act\eb\fa\c4\ef:")
 (table $0 3 3 funcref)
 (table $1 3 exnref)
 (elem $0 (table $0) (i32.const 0) func $15 $20)
 (elem declare func $0 $1 $10 $11 $12 $4 $5 $6 $7 $8 $9 $fimport$10 $fimport$3 $fimport$6 $fimport$9)
 (tag $tag$0 (type $32) (param (ref $14)))
 (tag $tag$1 (type $23))
 (export "global$_1" (global $global$1))
 (export "global$_2" (global $global$2))
 (export "global$_13" (global $global$22))
 (export "tag$" (tag $tag$0))
 (export "wasmtag" (tag $eimport$0))
 (export "ref_func_target_1_invoker" (func $12))
 (export "ref_func_target_2_invoker" (func $13))
 (export "func" (func $14))
 (export "func_26" (func $24))
 (export "func_26_invoker" (func $16))
 (export "func_29" (func $18))
 (export "func_29_invoker" (func $19))
 (export "func_31" (func $20))
 (export "func_33_invoker" (func $23))
 (func $0 (type $17) (param $0 (ref null $18)) (param $1 (ref $7)) (param $2 (ref func)) (param $3 v128)
  (local.set $3
   (call $27
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $1 (type $13) (param $0 (ref $14)) (param $1 (ref $17)) (param $2 i32) (param $3 i64) (param $4 f64) (result v128)
  (local.set $4
   (call $26
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $15) (result (ref $19))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $3 (type $21)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $4 (type $9) (param $0 (ref struct)) (param $1 f32) (param $2 f64) (param $3 i32)
  (local.set $1
   (call $25
    (local.get $1)
   )
  )
  (local.set $2
   (call $26
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $5 (type $20) (param $0 i64) (result externref)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $6 (type $18) (result (ref nofunc))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $7 (type $5) (param $0 f64) (param $1 f64) (result (ref $3) v128 i32 i64 i64)
  (local.set $0
   (call $26
    (local.get $0)
   )
  )
  (local.set $1
   (call $26
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $8 (type $4) (param $0 i31ref) (param $1 f32) (param $2 i32) (param $3 funcref) (param $4 v128) (result v128)
  (local.set $1
   (call $25
    (local.get $1)
   )
  )
  (local.set $4
   (call $27
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $9 (type $2) (param $0 i32) (result f64)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $10 (type $16) (param $0 i64) (param $1 (ref null $17)) (param $2 f32) (param $3 (ref $3)) (param $4 i32) (param $5 exnref)
  (local.set $2
   (call $25
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $11 (type $19) (result f32 f32)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $12 (type $23)
  (local $0 (ref null $14))
  (local $1 (ref null $14))
  (local $2 (ref struct))
  (local $3 (ref $14))
  (local $4 (ref $14))
  (local $5 (ref $14))
  (local $6 (ref $14))
  (local $7 (ref null $8))
  (local $8 (ref array))
  (local $9 (ref $3))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 (ref null $18))
  (local $13 (ref i31))
  (local $14 (ref $24))
  (local $15 (ref $24))
  (local $16 (ref $8))
  (local $17 (ref $8))
  (local $18 (ref $8))
  (local $19 (ref $8))
  (local $20 (ref null $2))
  (local $21 (ref null $13))
  (local $22 (ref $13))
  (local $23 (ref string))
  (local $24 (ref (exact $0)))
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $32 i64)
  (local $33 i64)
  (local $34 f64)
  (local $35 v128)
  (local $36 f32)
  (local $scratch i32)
  (local $scratch_38 i32)
  (local $scratch_39 (ref (exact $11)))
  (local $scratch_40 (ref (exact $9)))
  (local $scratch_41 (ref (exact $16)))
  (local $scratch_42 f32)
  (local $scratch_43 (ref (exact $8)))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (local.set $15
   (array.new $24
    (local.get $25)
    (i32.and
     (i32.const 64)
     (i32.const 1023)
    )
   )
  )
  (drop
   (call $27
    (call $1
     (struct.new_default $14)
     (ref.func $0)
     (i32.const -1)
     (i64.const 4095)
     (f64.const -16384)
    )
   )
  )
  (drop
   (call $27
    (call $1
     (struct.new $14
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
      (block (result (ref (exact $4)))
       (loop $label
        (if
         (i32.eqz
          (global.get $global$28)
         )
         (then
          (global.set $global$28
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$28
         (i32.sub
          (global.get $global$28)
          (i32.const 1)
         )
        )
        (atomic.fence acqrel)
        (br_if $label
         (i32.eqz
          (try (result i32)
           (do
            (i32.const 113)
           )
           (catch_all
            (ref.eq
             (ref.as_non_null
              (local.tee $0
               (struct.new $14
                (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                (ref.null nofunc)
                (i32.const -6)
                (ref.func $1)
                (f32.const 4294945536)
               )
              )
             )
             (block (result (ref (exact $11)))
              (local.set $scratch_39
               (struct.new $11
                (string.const "")
                (i32.const 0)
                (f64.const -4094.713)
                (local.get $25)
               )
              )
              (drop
               (block (result i32)
                (local.set $scratch_38
                 (i32.const 1048576)
                )
                (drop
                 (block (result i32)
                  (local.set $scratch
                   (i32.const -4194304)
                  )
                  (drop
                   (i32.const 65487)
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
           )
          )
         )
        )
        (memory.fill
         (i32.and
          (string.eq
           (string.const "\ed\bd\88\f0\90\8d\88\ed\bd\88")
           (string.const "\ed\bd\88549\e2\82\ac")
          )
          (i32.const 15)
         )
         (try_table (result i32) (catch_all $label)
          (ref.eq
           (struct.new_default $0)
           (if (result (ref array))
            (call_ref $28
             (i32.const -42)
             (block (result (ref $28))
              (drop
               (block (result (ref (exact $9)))
                (local.set $scratch_40
                 (ref.func $4)
                )
                (drop
                 (ref.func $5)
                )
                (local.get $scratch_40)
               )
              )
              (ref.func $fimport$9)
             )
            )
            (then
             (drop
              (br_on_null $label
               (struct.new_default $0)
              )
             )
             (drop
              (block $block (result (ref exn))
               (try_table (catch_all_ref $block)
                (throw $tag$0
                 (ref.as_non_null
                  (local.get $0)
                 )
                )
               )
               (unreachable)
              )
             )
             (drop
              (string.const "\f0\90\8d\88")
             )
             (drop
              (local.get $25)
             )
             (block
              (nop)
              (br $label)
             )
             (local.set $2
              (unreachable)
             )
            )
            (else
             (loop $label1 (result (ref array))
              (if
               (i32.eqz
                (global.get $global$28)
               )
               (then
                (global.set $global$28
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$28
               (i32.sub
                (global.get $global$28)
                (i32.const 1)
               )
              )
              (try_table (catch_all $label)
               (nop)
              )
              (br_if $label1
               (i32.eqz
                (call $fimport$10
                 (i32.atomic.load8_u acqrel offset=22
                  (i32.and
                   (ref.eq
                    (ref.as_non_null
                     (ref.null none)
                    )
                    (local.tee $7
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                   (i32.const 15)
                  )
                 )
                 (i32.atomic.load offset=4
                  (i32.and
                   (i64.gt_u
                    (local.get $32)
                    (local.get $32)
                   )
                   (i32.const 15)
                  )
                 )
                )
               )
              )
              (local.tee $8
               (array.new $12
                (ref.null none)
                (i32.and
                 (i32.const 75)
                 (i32.const 1023)
                )
               )
              )
             )
            )
           )
          )
         )
         (if (result i32)
          (i32.eqz
           (ref.eq
            (struct.new $1
             (local.get $32)
             (local.get $32)
            )
            (select (result (ref $3))
             (array.new_default $3
              (i32.and
               (i32.const 62)
               (i32.const 1023)
              )
             )
             (local.tee $9
              (array.new $3
               (f64.const 0)
               (i32.and
                (i32.const 47)
                (i32.const 1023)
               )
              )
             )
             (memory.atomic.notify offset=22
              (i32.and
               (i32.load offset=22
                (i32.and
                 (i32.trunc_f32_s
                  (f32.const -268435456)
                 )
                 (i32.const 15)
                )
               )
               (i32.const 15)
              )
              (local.get $25)
             )
            )
           )
          )
          (then
           (call_ref $17
            (ref.func $6)
            (struct.new_default $7)
            (ref.func $12)
            (call $27
             (f64x2.splat
              (local.get $34)
             )
            )
            (ref.func $0)
           )
           (drop
            (br_on_null $label
             (try (result (ref (exact $1)))
              (do
               (struct.new_default $1)
              )
              (catch_all
               (struct.new_default $1)
              )
             )
            )
           )
           (local.get $25)
          )
          (else
           (local.set $25
            (local.get $25)
           )
           (br $label)
          )
         )
        )
       )
       (ref.func $8)
      )
      (local.tee $25
       (if (result i32)
        (i32.eqz
         (loop $label2 (result i32)
          (if
           (i32.eqz
            (global.get $global$28)
           )
           (then
            (global.set $global$28
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$28
           (i32.sub
            (global.get $global$28)
            (i32.const 1)
           )
          )
          (struct.set $14 2
           (struct.new_default $14)
           (struct.get_s $11 1
            (struct.new $11
             (string.const "")
             (global.get $global$0)
             (f64.const 0.125)
             (global.get $global$0)
            )
           )
          )
          (br_if $label2
           (local.get $25)
          )
          (local.tee $25
           (stringview_wtf16.get_codeunit
            (if (result (ref string))
             (string.measure_wtf16
              (if (result (ref string))
               (i32.eqz
                (i32.load8_u offset=22
                 (call $fimport$9
                  (i32.rem_u
                   (i32.const -43)
                   (i32.const 12)
                  )
                 )
                )
               )
               (then
                (string.const "\ed\bd\88")
               )
               (else
                (br_if $label2
                 (i32.eqz
                  (if (result i32)
                   (i32.lt_u
                    (local.tee $30
                     (ref.is_null
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                    (array.len
                     (local.tee $19
                      (loop (result (ref $8))
                       (if
                        (i32.eqz
                         (global.get $global$28)
                        )
                        (then
                         (global.set $global$28
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$28
                        (i32.sub
                         (global.get $global$28)
                         (i32.const 1)
                        )
                       )
                       (local.tee $16
                        (try (result (ref $8))
                         (do
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                         (catch $tag$0
                          (local.set $4 (call $__popsink_0 (pop (ref $14))))
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                         (catch_all
                          (local.tee $17
                           (local.tee $18
                            (ref.as_non_null
                             (ref.null none)
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
                   (then
                    (array.get_s $8
                     (local.get $19)
                     (local.get $30)
                    )
                   )
                   (else
                    (local.get $25)
                   )
                  )
                 )
                )
                (br $label2)
               )
              )
             )
             (then
              (string.const "\f0\90\8d\88")
             )
             (else
              (string.const "\ed\bd\88\ed\a0\80")
             )
            )
            (block (result i32)
             (local.set $31
              (local.tee $25
               (local.get $25)
              )
             )
             (local.get $31)
            )
           )
          )
         )
        )
        (then
         (loop $label3
          (if
           (i32.eqz
            (global.get $global$28)
           )
           (then
            (global.set $global$28
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$28
           (i32.sub
            (global.get $global$28)
            (i32.const 1)
           )
          )
          (i32.atomic.store8 acqrel offset=22
           (i32.and
            (local.get $25)
            (i32.const 15)
           )
           (i31.get_u
            (try (result (ref i31))
             (do
              (ref.i31
               (i32.const 0)
              )
             )
             (catch $tag$0
              (drop (struct.get $14 0 (pop (ref $14))))
              (ref.i31
               (i32.const -1)
              )
             )
             (catch_all
              (ref.cast (ref i31)
               (ref.i31
                (i32.const 70)
               )
              )
             )
            )
           )
          )
          (br $label3)
         )
         (local.set $8
          (unreachable)
         )
        )
        (else
         (nop)
         (drop
          (block (result (ref (exact $8)))
           (local.set $scratch_43
            (array.new_default $8
             (i32.and
              (i32.const 74)
              (i32.const 1023)
             )
            )
           )
           (drop
            (block (result f32)
             (local.set $scratch_42
              (f32.const 140737488355328)
             )
             (drop
              (block (result (ref (exact $16)))
               (local.set $scratch_41
                (ref.func $10)
               )
               (local.set $31
                (i32.const 256)
               )
               (local.get $scratch_41)
              )
             )
             (local.get $scratch_42)
            )
           )
           (local.get $scratch_43)
          )
         )
         (local.get $31)
        )
       )
      )
      (local.tee $21
       (try (result (ref (exact $13)))
        (do
         (ref.func $1)
        )
        (catch $tag$0
         (local.set $6 (call_ref $__sinkT_0 (pop (ref $14)) (ref.func $__popsink_0)))
         (block
          (nop)
          (return)
         )
         (local.set $22
          (unreachable)
         )
        )
       )
      )
      (call $25
       (f32.max
        (loop $label4 (result f32)
         (if
          (i32.eqz
           (global.get $global$28)
          )
          (then
           (global.set $global$28
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$28
          (i32.sub
           (global.get $global$28)
           (i32.const 1)
          )
         )
         (block (result f32)
          (try
           (do
            (drop
             (br_on_null $label4
              (struct.new $7
               (local.get $32)
               (ref.func $9)
               (local.get $34)
              )
             )
            )
           )
           (catch_all
            (block
             (br $label4)
            )
            (local.set $23
             (unreachable)
            )
           )
          )
          (local.get $36)
         )
        )
        (call $25
         (struct.get $14 4
          (ref.as_non_null
           (local.get $0)
          )
         )
        )
       )
      )
     )
     (ref.func $0)
     (i32.const -2147483648)
     (i64.const 25)
     (f64.const 4294967292)
    )
   )
  )
 )
 (func $13 (type $23)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (drop
   (call $2)
  )
 )
 (func $14 (type $37) (result funcref)
  (local $0 stringref)
  (local $1 (ref $9))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (f32.store offset=4
   (i32.and
    (global.get $global$0)
    (i32.const 15)
   )
   (call $25
    (global.get $global$25)
   )
  )
  (return
   (ref.func $4)
  )
 )
 (func $15 (type $25) (param $0 anyref)
  (local $1 anyref)
  (local $2 (ref null $10))
  (local $3 externref)
  (local $4 (ref $16))
  (local $5 (ref $8))
  (local $6 i32)
  (local $7 v128)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const 4194305)
  )
  (block $block
   (drop
    (br_on_null $block
     (array.new_fixed $22 0)
    )
   )
   (br_if $block
    (i32.eqz
     (i16x8.extract_lane_s 0
      (call $27
       (call_ref $4
        (ref.i31
         (i32.const -117)
        )
        (try_table (result f32) (catch_all $block)
         (call $25
          (f32.load offset=3 align=1
           (i32.and
            (i32.load offset=22 align=1
             (i32.and
              (block (result i32)
               (drop
                (br_on_null $block
                 (block (result (ref nofunc))
                  (nop)
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                 )
                )
               )
               (i32.const 255)
              )
              (i32.const 15)
             )
            )
            (i32.const 15)
           )
          )
         )
        )
        (struct.get_s $11 3
         (struct.new $11
          (local.get $3)
          (local.get $6)
          (f64.const 222)
          (local.get $6)
         )
        )
        (ref.func $15)
        (local.get $7)
        (ref.func $8)
       )
      )
     )
    )
   )
  )
 )
 (func $16 (type $23)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (call $15
   (array.new_fixed $22 0)
  )
  (call $15
   (array.new_fixed $22 0)
  )
  (call $15
   (ref.null none)
  )
 )
 (func $17 (type $20) (param $0 i64) (result externref)
  (local $1 (ref $14))
  (local $2 (ref $14))
  (local $3 (ref $14))
  (local $4 (ref string))
  (local $5 (ref $24))
  (local $6 stringref)
  (local $7 externref)
  (local $8 (ref $8))
  (local $9 (ref $8))
  (local $10 (ref $8))
  (local $11 (ref exn))
  (local $12 (ref exn))
  (local $13 (ref exn))
  (local $14 (ref null $7))
  (local $15 (ref $7))
  (local $16 (ref i31))
  (local $17 (ref eq))
  (local $18 (ref extern))
  (local $19 f32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 v128)
  (local $scratch i32)
  (local $scratch_28 (ref (exact $20)))
  (local $scratch_29 (ref exn))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (local.set $16
   (ref.i31
    (i32.const -3703715)
   )
  )
  (local.set $12
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$1)
    )
    (unreachable)
   )
  )
  (local.set $5
   (array.new_default $24
    (i32.and
     (i32.const 11)
     (i32.const 1023)
    )
   )
  )
  (local.set $4
   (string.const "\f0\90\8d\88\ed\a0\80\ed\a0\80")
  )
  (block $block2 (result (ref extern))
   (v128.store offset=1 align=1
    (i32.and
     (i8x16.extract_lane_s 4
      (try (result v128)
       (do
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
       (catch $tag$0
        (if (ref.is_null (pop (ref $14))) (then (nop)) (else (unreachable)))
        (drop
         (block (result (ref exn))
          (local.set $scratch_29
           (block $block1 (result (ref exn))
            (try_table (catch_all_ref $block1)
             (throw $tag$1)
            )
            (unreachable)
           )
          )
          (drop
           (block (result (ref (exact $20)))
            (local.set $scratch_28
             (ref.func $5)
            )
            (local.set $25
             (block (result i32)
              (local.set $scratch
               (i32.const -32767)
              )
              (drop
               (i64.const -4)
              )
              (local.get $scratch)
             )
            )
            (local.get $scratch_28)
           )
          )
          (local.get $scratch_29)
         )
        )
        (if (result v128)
         (local.get $25)
         (then
          (br_on_non_null $block2
           (global.get $gimport$0)
          )
          (drop
           (f32.lt
            (if (result f32)
             (i32.const 4)
             (then
              (select
               (call $25
                (global.get $global$25)
               )
               (f32.const 0)
               (i16x8.extract_lane_u 2
                (call $27
                 (v128.load offset=4 align=8
                  (i32.and
                   (i32.const 65)
                   (i32.const 15)
                  )
                 )
                )
               )
              )
             )
             (else
              (drop
               (i32.and
                (string.encode_wtf16_array
                 (local.tee $4
                  (string.const "")
                 )
                 (local.tee $5
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (i32.const -32768)
                )
                (i32.const 15)
               )
              )
              (drop
               (i32.and
                (string.eq
                 (local.get $6)
                 (local.get $4)
                )
                (i32.const 15)
               )
              )
              (block
               (nop)
               (return
                (string.const "\f0\90\8d\88\c2\a3\c2\a3")
               )
              )
              (unreachable)
             )
            )
            (block (result f32)
             (call $fimport$3
              (loop (result f32)
               (if
                (i32.eqz
                 (global.get $global$28)
                )
                (then
                 (global.set $global$28
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$28
                (i32.sub
                 (global.get $global$28)
                 (i32.const 1)
                )
               )
               (block (result f32)
                (i32.atomic.store8 offset=22
                 (i32.and
                  (i32.const -2147483648)
                  (i32.const 15)
                 )
                 (i32.const 32767)
                )
                (f32.const -208533340160)
               )
              )
             )
             (local.get $19)
            )
           )
          )
          (block
           (f32.store offset=4 align=1
            (i32.const 1131222591)
            (if (result f32)
             (string.encode_wtf16_array
              (local.get $4)
              (local.get $5)
              (i32.trunc_sat_f32_s
               (f32.const 32768)
              )
             )
             (then
              (call $fimport$8
               (local.get $7)
              )
              (select
               (local.get $19)
               (f32.const 31770)
               (try_table (result i32)
                (loop $label (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$28)
                  )
                  (then
                   (global.set $global$28
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$28
                  (i32.sub
                   (global.get $global$28)
                   (i32.const 1)
                  )
                 )
                 (nop)
                 (br_if $label
                  (i32.eqz
                   (local.get $20)
                  )
                 )
                 (local.get $20)
                )
               )
              )
             )
             (else
              (call $fimport$5
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              )
              (call $25
               (global.get $global$25)
              )
             )
            )
           )
           (return
            (global.get $gimport$1)
           )
          )
          (unreachable)
         )
         (else
          (call $fimport$7
           (ref.func $fimport$3)
          )
          (return
           (local.get $7)
          )
         )
        )
       )
       (catch_all
        (drop
         (br_on_cast_fail $block2 (ref extern) (ref extern)
          (loop $label1 (result (ref extern))
           (if
            (i32.eqz
             (global.get $global$28)
            )
            (then
             (global.set $global$28
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$28
            (i32.sub
             (global.get $global$28)
             (i32.const 1)
            )
           )
           (call $fimport$2
            (loop (result i64)
             (if
              (i32.eqz
               (global.get $global$28)
              )
              (then
               (global.set $global$28
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$28
              (i32.sub
               (global.get $global$28)
               (i32.const 1)
              )
             )
             (block (result i64)
              (call $fimport$8
               (if (result (ref extern))
                (i32.eqz
                 (i32.load16_s offset=22
                  (i32.and
                   (ref.eq
                    (local.tee $17
                     (ref.i31
                      (i32.const -3)
                     )
                    )
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                   (i32.const 15)
                  )
                 )
                )
                (then
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (try_table (result (ref extern)) (catch_all $label1)
                  (local.tee $18
                   (string.const "\e2\82\ac\c2\a3")
                  )
                 )
                )
                (else
                 (loop $label2 (result (ref string))
                  (if
                   (i32.eqz
                    (global.get $global$28)
                   )
                   (then
                    (global.set $global$28
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$28
                   (i32.sub
                    (global.get $global$28)
                    (i32.const 1)
                   )
                  )
                  (table.set $1
                   (i32.const 0)
                   (ref.null noexn)
                  )
                  (i32.store8 offset=4
                   (i32.and
                    (select
                     (local.get $20)
                     (i32.const 153)
                     (local.get $20)
                    )
                    (i32.const 15)
                   )
                   (i32.const -55)
                  )
                  (br_if $label2
                   (i32.eqz
                    (i64.lt_u
                     (i64.const -37)
                     (i64.const -91)
                    )
                   )
                  )
                  (string.const "")
                 )
                )
               )
              )
              (local.get $0)
             )
            )
           )
           (block $block3
            (br_if $block3
             (try_table (result i32) (catch_all $block3)
              (call $fimport$10
               (f64.ne
                (call $26
                 (f64.load offset=22 align=1
                  (i32.and
                   (local.get $20)
                   (i32.const 15)
                  )
                 )
                )
                (if (result f64)
                 (local.get $20)
                 (then
                  (block
                   (nop)
                   (br $label1)
                  )
                  (unreachable)
                 )
                 (else
                  (nop)
                  (if (result f64)
                   (memory.atomic.notify offset=3
                    (i32.and
                     (i32.const -43)
                     (i32.const 15)
                    )
                    (local.get $20)
                   )
                   (then
                    (call $26
                     (f64.trunc
                      (f64.const 0)
                     )
                    )
                   )
                   (else
                    (f64.const -1.1754943508222875e-38)
                   )
                  )
                 )
                )
               )
               (global.get $global$0)
              )
             )
            )
           )
           (br_if $label1
            (i32.eqz
             (i32.trunc_f64_u
              (f64.const 35638)
             )
            )
           )
           (loop $label3 (result (ref extern))
            (if
             (i32.eqz
              (global.get $global$28)
             )
             (then
              (global.set $global$28
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$28
             (i32.sub
              (global.get $global$28)
              (i32.const 1)
             )
            )
            (nop)
            (br_if $label3
             (i32.eqz
              (call $fimport$9
               (i32.rem_u
                (local.get $20)
                (i32.const 22)
               )
              )
             )
            )
            (global.get $gimport$0)
           )
          )
         )
        )
        (loop (result v128)
         (if
          (i32.eqz
           (global.get $global$28)
          )
          (then
           (global.set $global$28
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$28
          (i32.sub
           (global.get $global$28)
           (i32.const 1)
          )
         )
         (local.get $26)
        )
       )
      )
     )
     (i32.const 15)
    )
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0xc3500000)
   )
   (string.const "\c2\a3\e2\82\ac903")
  )
 )
 (func $18 (type $21)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (call_ref $25
   (struct.new_default $0)
   (ref.func $fimport$6)
  )
 )
 (func $19 (type $23)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (call $18)
  (call $18)
  (call $18)
 )
 (func $20 (type $2) (param $0 i32) (result f64)
  (local $1 stringref)
  (local $2 (ref string))
  (local $3 (ref string))
  (local $4 (ref $14))
  (local $5 (ref $14))
  (local $6 (ref $14))
  (local $7 (ref $14))
  (local $8 (ref $14))
  (local $9 (ref none))
  (local $10 (ref none))
  (local $11 (ref extern))
  (local $12 (ref $8))
  (local $13 (ref $8))
  (local $14 (ref $8))
  (local $15 nullref)
  (local $16 (ref $24))
  (local $17 (ref null $16))
  (local $18 (ref $3))
  (local $19 f64)
  (local $20 f64)
  (local $21 v128)
  (local $22 f32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $scratch i32)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (local.set $12
   (array.new $8
    (global.get $global$0)
    (i32.and
     (i32.const 70)
     (i32.const 1023)
    )
   )
  )
  (local.set $2
   (string.const "\e2\82\ac\ed\a0\80")
  )
  (return_call_ref $2
   (local.tee $0
    (try (result i32)
     (do
      (local.get $0)
     )
     (catch $tag$0
      (if (ref.is_null (pop (ref $14))) (then (nop)) (else (unreachable)))
      (string.compare
       (local.get $2)
       (if (result (ref string))
        (i32.eqz
         (if (result i32)
          (i32.lt_u
           (local.tee $23
            (call_ref $29
             (try_table (result i32)
              (local.get $0)
             )
             (local.get $0)
             (ref.func $fimport$10)
            )
           )
           (array.len
            (local.tee $14
             (if (result (ref $8))
              (i32.eqz
               (i32.const -17)
              )
              (then
               (block $block (result (ref $8))
                (drop
                 (ref.null none)
                )
                (drop
                 (br_on_cast_fail $block (ref $8) (ref $8)
                  (local.tee $12
                   (local.tee $13
                    (ref.as_non_null
                     (local.get $15)
                    )
                   )
                  )
                 )
                )
                (call $fimport$3
                 (select
                  (f32.const -99)
                  (local.tee $22
                   (call $25
                    (f32.load offset=22
                     (i32.and
                      (local.tee $0
                       (i32.const -56)
                      )
                      (i32.const 15)
                     )
                    )
                   )
                  )
                  (ref.eq
                   (struct.new_default $0)
                   (ref.i31
                    (i32.const -107)
                   )
                  )
                 )
                )
                (try (result (ref $8))
                 (do
                  (local.get $12)
                 )
                 (catch $tag$0
                  (drop (ref.eq (pop (ref $14)) (ref.null none)))
                  (array.new $8
                   (ref.eq
                    (array.new_fixed $22 0)
                    (ref.null none)
                   )
                   (i32.and
                    (i32.const 13)
                    (i32.const 1023)
                   )
                  )
                 )
                )
               )
              )
              (else
               (nop)
               (block (result (ref $8))
                (call $fimport$2
                 (loop $label (result i64)
                  (if
                   (i32.eqz
                    (global.get $global$28)
                   )
                   (then
                    (global.set $global$28
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$28
                   (i32.sub
                    (global.get $global$28)
                    (i32.const 1)
                   )
                  )
                  (call $fimport$8
                   (string.const "\f0\90\8d\88\e2\82\ac\ed\a0\80")
                  )
                  (br_if $label
                   (local.get $0)
                  )
                  (nop)
                  (drop
                   (ref.null none)
                  )
                  (unreachable)
                 )
                )
                (local.tee $13
                 (local.tee $13
                  (local.get $12)
                 )
                )
               )
              )
             )
            )
           )
          )
          (then
           (array.get_s $8
            (local.get $14)
            (local.get $23)
           )
          )
          (else
           (i32.const -32768)
          )
         )
        )
        (then
         (call $fimport$8
          (local.get $1)
         )
         (stringview_wtf16.slice
          (block (result (ref string))
           (nop)
           (string.const "\ed\a0\80\e2\82\ac\e2\82\ac")
          )
          (block (result i32)
           (local.set $25
            (block (result i32)
             (local.set $scratch
              (local.get $0)
             )
             (local.set $26
              (global.get $global$0)
             )
             (local.get $scratch)
            )
           )
           (local.get $25)
          )
          (local.get $26)
         )
        )
        (else
         (unreachable)
        )
       )
      )
     )
    )
   )
   (ref.func $9)
  )
 )
 (func $21 (type $31) (result f32 eqref anyref)
  (local $0 structref)
  (local $1 (ref null $2))
  (local $2 funcref)
  (local $3 (ref null $7))
  (local $4 (ref $14))
  (local $5 (ref $14))
  (local $6 (ref $14))
  (local $7 (ref none))
  (local $8 v128)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 f64)
  (local $scratch i32)
  (local $scratch_19 f64)
  (local $scratch_20 (ref $7))
  (local $scratch_21 i32)
  (local $scratch_22 f64)
  (local $scratch_23 (ref $7))
  (local $scratch_24 (ref (exact $9)))
  (local $scratch_25 f64)
  (local $scratch_26 (ref (exact $6)))
  (local $scratch_27 f32)
  (local $scratch_28 f32)
  (local $scratch_29 f32)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (local.set $3
   (block (result (ref $7))
    (local.set $scratch_20
     (ref.as_non_null
      (local.get $3)
     )
    )
    (local.set $17
     (block (result f64)
      (local.set $scratch_19
       (call $26
        (local.get $17)
       )
      )
      (local.set $14
       (block (result i32)
        (local.set $scratch
         (local.get $14)
        )
        (local.set $11
         (call $25
          (local.get $11)
         )
        )
        (local.get $scratch)
       )
      )
      (local.get $scratch_19)
     )
    )
    (local.get $scratch_20)
   )
  )
  (tuple.make 3
   (local.tee $10
    (block (result f32)
     (nop)
     (drop
      (block (result f32)
       (local.set $scratch_28
        (f32.const -134217728)
       )
       (local.set $12
        (block (result f32)
         (local.set $scratch_27
          (f32.const 71)
         )
         (drop
          (block (result (ref (exact $6)))
           (local.set $scratch_26
            (try_table (result (ref (exact $6)))
             (drop
              (global.get $global$0)
             )
             (drop
              (global.get $global$0)
             )
             (block
              (nop)
              (return
               (tuple.make 3
                (f32.const 32)
                (struct.new_default $0)
                (ref.i31
                 (i32.const -88)
                )
               )
              )
             )
             (unreachable)
            )
           )
           (drop
            (block (result f64)
             (local.set $scratch_25
              (f64.const -9223372036854775808)
             )
             (drop
              (block (result (ref (exact $9)))
               (local.set $scratch_24
                (ref.func $4)
               )
               (drop
                (if (result (ref i31))
                 (i32.eqz
                  (call_ref $29
                   (try (result i32)
                    (do
                     (loop $label (result i32)
                      (if
                       (i32.eqz
                        (global.get $global$28)
                       )
                       (then
                        (global.set $global$28
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$28
                       (i32.sub
                        (global.get $global$28)
                        (i32.const 1)
                       )
                      )
                      (drop
                       (block (result (ref $7))
                        (local.set $scratch_23
                         (ref.as_non_null
                          (local.get $3)
                         )
                        )
                        (drop
                         (block (result f64)
                          (local.set $scratch_22
                           (call $26
                            (local.get $17)
                           )
                          )
                          (drop
                           (block (result i32)
                            (local.set $scratch_21
                             (local.get $14)
                            )
                            (local.set $12
                             (call $25
                              (local.get $11)
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
                      (call $fimport$3
                       (call $25
                        (local.get $12)
                       )
                      )
                      (memory.init $4
                       (i32.and
                        (local.get $15)
                        (i32.const 15)
                       )
                       (i32.const 11)
                       (i32.const 1)
                      )
                      (br_if $label
                       (local.tee $15
                        (local.get $15)
                       )
                      )
                      (string.measure_wtf16
                       (string.const "\ed\a0\80")
                      )
                     )
                    )
                    (catch $tag$0
                     (local.set $4 (pop (ref $14)))
                     (local.get $15)
                    )
                    (catch_all
                     (nop)
                     (i31.get_u
                      (ref.i31
                       (i32.const -126)
                      )
                     )
                    )
                   )
                   (ref.eq
                    (struct.new_default $0)
                    (ref.null none)
                   )
                   (ref.func $fimport$10)
                  )
                 )
                 (then
                  (if (result (ref i31))
                   (loop $label1 (result i32)
                    (if
                     (i32.eqz
                      (global.get $global$28)
                     )
                     (then
                      (global.set $global$28
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$28
                     (i32.sub
                      (global.get $global$28)
                      (i32.const 1)
                     )
                    )
                    (call_ref $30
                     (call $25
                      (struct.get $14 4
                       (local.tee $5
                        (local.tee $6
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                       )
                      )
                     )
                     (ref.func $fimport$3)
                    )
                    (br_if $label1
                     (i32.eqz
                      (loop (result i32)
                       (if
                        (i32.eqz
                         (global.get $global$28)
                        )
                        (then
                         (global.set $global$28
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$28
                        (i32.sub
                         (global.get $global$28)
                         (i32.const 1)
                        )
                       )
                       (i32.const -62)
                      )
                     )
                    )
                    (global.get $global$0)
                   )
                   (then
                    (drop
                     (ref.i31
                      (i32.const 1048576)
                     )
                    )
                    (select
                     (loop $label2 (result (ref i31))
                      (if
                       (i32.eqz
                        (global.get $global$28)
                       )
                       (then
                        (global.set $global$28
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$28
                       (i32.sub
                        (global.get $global$28)
                        (i32.const 1)
                       )
                      )
                      (nop)
                      (if
                       (i32.lt_u
                        (local.tee $16
                         (local.get $15)
                        )
                        (array.len
                         (local.tee $7
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                       )
                       (then
                        (drop
                         (local.get $7)
                        )
                        (drop
                         (local.get $16)
                        )
                        (drop
                         (f64.const -0.242)
                        )
                        (unreachable)
                       )
                      )
                      (drop
                       (br_on_null $label2
                        (if (result (ref none))
                         (i32.eqz
                          (local.tee $15
                           (i32.const -61)
                          )
                         )
                         (then
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                         (else
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                       )
                      )
                      (br_if $label2
                       (i32.eqz
                        (ref.eq
                         (ref.as_non_null
                          (ref.null none)
                         )
                         (struct.new_default $0)
                        )
                       )
                      )
                      (loop $label3 (result (ref i31))
                       (if
                        (i32.eqz
                         (global.get $global$28)
                        )
                        (then
                         (global.set $global$28
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$28
                        (i32.sub
                         (global.get $global$28)
                         (i32.const 1)
                        )
                       )
                       (nop)
                       (br_if $label3
                        (i32.eqz
                         (i32.const -26598)
                        )
                       )
                       (ref.i31
                        (i32.const -117)
                       )
                      )
                     )
                     (ref.as_non_null
                      (ref.null none)
                     )
                     (unreachable)
                    )
                   )
                   (else
                    (block $block (result (ref i31))
                     (drop
                      (br_on_cast_fail $block (ref i31) (ref i31)
                       (ref.i31
                        (i32.const 65417)
                       )
                      )
                     )
                     (return
                      (tuple.make 3
                       (f32.const 1.2291450535054557e-26)
                       (array.new_fixed $22 0)
                       (ref.null none)
                      )
                     )
                    )
                   )
                  )
                 )
                 (else
                  (call_indirect $0 (type $25)
                   (try_table (result (ref none))
                    (if (result (ref none))
                     (i32.eqz
                      (i32.const -74)
                     )
                     (then
                      (nop)
                      (return
                       (tuple.make 3
                        (f32.const 9223372036854775808)
                        (ref.null none)
                        (ref.null none)
                       )
                      )
                     )
                     (else
                      (nop)
                      (if (result (ref none))
                       (i32.eqz
                        (try (result i32)
                         (do
                          (i32.const 127)
                         )
                         (catch_all
                          (local.get $15)
                         )
                        )
                       )
                       (then
                        (return
                         (tuple.make 3
                          (f32.const -2147483648)
                          (ref.null none)
                          (array.new_fixed $22 0)
                         )
                        )
                       )
                       (else
                        (loop (result (ref none))
                         (if
                          (i32.eqz
                           (global.get $global$28)
                          )
                          (then
                           (global.set $global$28
                            (i32.const 100)
                           )
                           (unreachable)
                          )
                         )
                         (global.set $global$28
                          (i32.sub
                           (global.get $global$28)
                           (i32.const 1)
                          )
                         )
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                       )
                      )
                     )
                    )
                   )
                   (i32.const 0)
                  )
                  (return
                   (tuple.make 3
                    (f32.const 0)
                    (struct.new_default $0)
                    (array.new_fixed $22 0)
                   )
                  )
                 )
                )
               )
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
       (local.get $scratch_28)
      )
     )
     (call $25
      (f32.max
       (call $25
        (local.get $12)
       )
       (call $25
        (block (result f32)
         (local.set $scratch_29
          (f32.const -3568)
         )
         (drop
          (ref.null none)
         )
         (local.get $scratch_29)
        )
       )
      )
     )
    )
   )
   (struct.new $11
    (string.const "")
    (local.get $15)
    (f64.const 572)
    (local.get $15)
   )
   (struct.new_default $6)
  )
 )
 (func $22 (type $38) (param $0 (ref $5)) (param $1 (ref $6)) (param $2 i64) (param $3 (ref $19)) (param $4 i32) (param $5 i64) (result (ref $10))
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (call $fimport$3
   (call $25
    (global.get $global$25)
   )
  )
  (return
   (array.new_default $10
    (i32.and
     (i32.const 85)
     (i32.const 1023)
    )
   )
  )
 )
 (func $23 (type $23)
  (if
   (i32.eqz
    (global.get $global$28)
   )
   (then
    (global.set $global$28
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$28
   (i32.sub
    (global.get $global$28)
    (i32.const 1)
   )
  )
  (drop
   (call $22
    (ref.func $7)
    (struct.new_default $6)
    (i64.const 2049)
    (ref.func $11)
    (i32.const -1048575)
    (i64.const 127)
   )
  )
  (drop
   (call $22
    (ref.func $7)
    (struct.new_default $6)
    (i64.const -127)
    (ref.func $11)
    (i32.const 1048576)
    (i64.const -9223372036854775808)
   )
  )
 )
 (func $24 (type $27) (param $0 externref)
  (call $15
   (ref.cast anyref
    (any.convert_extern
     (local.get $0)
    )
   )
  )
 )
 (func $25 (type $39) (param $0 f32) (result f32)
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
 (func $26 (type $40) (param $0 f64) (result f64)
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
 (func $27 (type $41) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param (ref $14)) (result (ref $14))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
