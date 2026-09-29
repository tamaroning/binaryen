(module
 (rec
  (type $0 (sub (array i32)))
  (type $1 (sub $0 (array i32)))
 )
 (rec
  (type $2 (sub (struct)))
  (type $3 (sub $0 (array i32)))
 )
 (type $4 (func))
 (type $5 (array i8))
 (type $6 (struct))
 (type $7 (array (mut i16)))
 (type $8 (func (param f64 structref (ref $3) arrayref) (result i32)))
 (type $9 (func (result nullref f64 nullexternref)))
 (type $10 (func (param i32)))
 (type $11 (func (param funcref) (result i32)))
 (type $12 (func (param i64 eqref) (result (ref null $0) eqref)))
 (type $13 (func (result f32 f64)))
 (type $14 (func (param v128)))
 (type $15 (func (result (ref null $3))))
 (type $16 (func (param i32) (result (ref null $1))))
 (type $17 (func (result funcref)))
 (type $18 (func (result (ref $0))))
 (type $19 (func (param i64 (ref $3))))
 (type $20 (func (param (ref $0))))
 (type $21 (func (param i64)))
 (type $22 (func (param f32)))
 (type $23 (func (param f64)))
 (type $24 (func (param anyref)))
 (type $25 (func (param funcref)))
 (type $26 (func (param externref)))
 (type $27 (func (param funcref i32)))
 (type $28 (func (result eqref)))
 (type $29 (func (param (ref string) v128 (ref array) f64 f32 f32 (ref $2) i32) (result i64)))
 (type $30 (func (result (ref array))))
 (type $31 (func (param f32) (result (ref null $1))))
 (type $32 (func (result f32)))
 (type $33 (func (param (ref null $2) (ref $3) stringref (ref $1) i31ref i64 (ref null $2) arrayref) (result (ref $1))))
 (type $34 (func (param i32) (result stringref)))
 (type $35 (func (param (ref $3) v128 i32 i32) (result (ref null $0))))
 (type $36 (func (param v128 (ref $0)) (result f32)))
 (type $37 (func (param i32 f64) (result f32)))
 (type $38 (func (param anyref) (result f32)))
 (type $39 (func (param (ref array) f32 (ref null $3) (ref array) f32 (ref struct)) (result (ref null $0) f32 f32 i64)))
 (type $40 (func (result (ref null $2))))
 (type $41 (func (param f64) (result (ref null $2) eqref i32)))
 (type $42 (func (param (ref null $0) f64 i31ref externref) (result f64)))
 (type $43 (func (param v128 i64 exnref i32 i32 (ref struct) (ref array)) (result (ref null $1))))
 (type $44 (func (result (ref null $0))))
 (type $45 (func (param i31ref i32) (result (ref null $0) f64 stringref)))
 (type $46 (func (result (ref struct))))
 (type $47 (func (param i32 f32 (ref $3) (ref null $2)) (result externref)))
 (type $48 (func (param f64 (ref null $0) (ref $0) (ref $2) i32 externref) (result exnref)))
 (type $49 (func (result (ref null $0) eqref)))
 (type $50 (func (result (ref null $0) f32 f32 i64)))
 (type $51 (func (result (ref null $2) eqref i32)))
 (type $52 (func (result (ref null $0) f64 stringref)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $10) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $10) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $21) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $22) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $23) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $14) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $24) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $25) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $26) (param externref)))
 (import "fuzzing-support" "call-ref" (func $fimport$9 (type $27) (param funcref i32)))
 (import "fuzzing-support" "call-ref-catch" (func $fimport$10 (type $11) (param funcref) (result i32)))
 (global $global$0 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 "\ea\1b\e1\d8\9b\a1\c5\9d\04\b5\fd\a2\0f\b9\1e\fbb\db")
 (data $1 "\a3W\a5\ad$\d0\d0\a6\c5\ee")
 (data $2 "z\17\7f\94")
 (data $3 (i32.const 0) "\b1\f8l\ca.\1e\cbl&\1b\d2\ef\e5")
 (table $0 20 funcref (ref.null nofunc))
 (table $1 4 4 exnref)
 (elem $0 (table $0) (i32.const 0) func $0 $0 $0 $1 $2 $10 $12 $13 $20 $20 $20 $20 $21 $21 $23 $34 $36 $36 $39 $39)
 (elem declare func $32 $40 $45 $5 $7 $8 $fimport$10 $fimport$5 $fimport$8)
 (tag $tag$0 (type $10) (param i32))
 (tag $tag$1 (type $20) (param (ref $0)))
 (tag $tag$2 (type $4))
 (export "tag$" (tag $tag$0))
 (export "func" (func $0))
 (export "func_13" (func $2))
 (export "func_15_invoker" (func $5))
 (export "func_17" (func $6))
 (export "func_18" (func $7))
 (export "func_19_invoker" (func $9))
 (export "func_21" (func $10))
 (export "func_21_invoker" (func $11))
 (export "func_24_invoker" (func $14))
 (export "func_26_invoker" (func $16))
 (export "func_29_invoker" (func $19))
 (export "func_31" (func $20))
 (export "func_32_invoker" (func $22))
 (export "func_35_invoker" (func $25))
 (export "func_37_invoker" (func $27))
 (export "func_39" (func $28))
 (export "func_41_invoker" (func $31))
 (export "func_43_invoker" (func $33))
 (export "func_45_invoker" (func $35))
 (export "func_50" (func $39))
 (export "func_51_invoker" (func $41))
 (export "func_53_invoker" (func $43))
 (func $0 (type $28) (result eqref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (ref.null none)
 )
 (func $1 (type $29) (param $0 (ref string)) (param $1 v128) (param $2 (ref array)) (param $3 f64) (param $4 f32) (param $5 f32) (param $6 (ref $2)) (param $7 i32) (result i64)
  (local $8 (ref $2))
  (local $9 (ref null $2))
  (local $10 (ref $3))
  (local $11 i31ref)
  (local $12 (ref null $3))
  (local $13 arrayref)
  (local $14 (ref struct))
  (local $15 (ref $0))
  (local $16 (ref $0))
  (local $17 (ref $0))
  (local $18 f32)
  (local $19 f32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $10
   (array.new $3
    (i32.const -23)
    (i32.and
     (i32.const 3)
     (i32.const 1023)
    )
   )
  )
  (block
   (call $fimport$6
    (loop $label (result nullref)
     (if
      (i32.eqz
       (global.get $global$0)
      )
      (then
       (global.set $global$0
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$0
      (i32.sub
       (global.get $global$0)
       (i32.const 1)
      )
     )
     (block (result nullref)
      (try_table (catch_all $label)
       (block
        (return
         (i64.const 4097)
        )
       )
       (unreachable)
      )
      (local.set $0
       (local.set $17
        (unreachable)
       )
      )
     )
    )
   )
   (block
    (nop)
    (return
     (i64.const 23373)
    )
   )
   (local.set $2
    (unreachable)
   )
  )
  (unreachable)
 )
 (func $2 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (return)
 )
 (@binaryen.js.called)
 (func $3 (type $15) (result (ref null $3))
  (local $0 (ref $1))
  (local $1 (ref $1))
  (local $2 (ref $1))
  (local $3 (ref $1))
  (local $4 eqref)
  (local $5 (ref $0))
  (local $6 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (array.new $3
   (ref.is_null
    (ref.i31
     (i32.const -54)
    )
   )
   (i32.and
    (i32.const 31)
    (i32.const 1023)
   )
  )
 )
 (func $4 (type $30) (result (ref array))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (array.new_fixed $5 0)
 )
 (func $5 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $4)
  )
  (drop
   (call $4)
  )
 )
 (func $6 (type $31) (param $0 f32) (result (ref null $1))
  (local $1 structref)
  (local $2 structref)
  (local $3 (ref null $2))
  (local $4 (ref null $0))
  (local $5 (ref null $1))
  (local $6 (ref null $1))
  (local $7 (ref $1))
  (local $8 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.tee $7
   (array.new_default $1
    (i32.and
     (i32.const 25)
     (i32.const 1023)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $7 (type $16) (param $0 i32) (result (ref null $1))
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 f32)
  (local $5 (ref null $2))
  (local $6 (ref $1))
  (local $7 i31ref)
  (local $8 (ref i31))
  (local $9 (ref $0))
  (local $10 (ref $0))
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $6
   (array.new_default $1
    (i32.and
     (i32.const 22)
     (i32.const 1023)
    )
   )
  )
  (local.set $5
   (ref.as_non_null
    (local.get $5)
   )
  )
  (block
   (if
    (local.get $0)
    (then
     (loop $label
      (if
       (i32.eqz
        (global.get $global$0)
       )
       (then
        (global.set $global$0
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$0
       (i32.sub
        (global.get $global$0)
        (i32.const 1)
       )
      )
      (nop)
      (br_if $label
       (local.get $0)
      )
      (call $fimport$1
       (select
        (stringview_wtf16.get_codeunit
         (string.const "\e2\82\ac\ed\a0\80")
         (block (result i32)
          (local.set $3
           (select
            (ref.eq
             (select (result i31ref)
              (ref.null none)
              (try (result i31ref)
               (do
                (local.get $7)
               )
               (catch_all
                (ref.i31
                 (i32.const 4194303)
                )
               )
              )
              (local.tee $0
               (call $fimport$10
                (ref.cast (ref (exact $16))
                 (ref.func $7)
                )
               )
              )
             )
             (array.new_default $3
              (i32.and
               (i32.const 1)
               (i32.const 1023)
              )
             )
            )
            (string.encode_wtf16_array
             (try (result (ref string))
              (do
               (string.const "")
              )
              (catch $tag$0
               (local.set $1 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
               (string.const "\ed\a0\8053")
              )
             )
             (array.new_default $7
              (i32.and
               (i32.const 27)
               (i32.const 1023)
              )
             )
             (i32.load8_u offset=22
              (i32.and
               (local.tee $0
                (loop $label1 (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$0)
                  )
                  (then
                   (global.set $global$0
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$0
                  (i32.sub
                   (global.get $global$0)
                   (i32.const 1)
                  )
                 )
                 (block
                  (nop)
                  (if
                   (i32.load16_u offset=3
                    (local.get $1)
                   )
                   (then
                    (call $fimport$3
                     (local.get $4)
                    )
                   )
                   (else
                    (nop)
                   )
                  )
                 )
                 (br_if $label1
                  (block (result i32)
                   (block
                    (nop)
                    (br $label1)
                   )
                   (unreachable)
                  )
                 )
                 (select
                  (loop $label2 (result i32)
                   (if
                    (i32.eqz
                     (global.get $global$0)
                    )
                    (then
                     (global.set $global$0
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$0
                    (i32.sub
                     (global.get $global$0)
                     (i32.const 1)
                    )
                   )
                   (nop)
                   (br_if $label2
                    (i32.eqz
                     (ref.eq
                      (ref.i31
                       (i32.const -752612036)
                      )
                      (local.tee $6
                       (ref.as_non_null
                        (ref.null none)
                       )
                      )
                     )
                    )
                   )
                   (local.get $0)
                  )
                  (i32.const -1)
                  (local.get $0)
                 )
                )
               )
               (i32.const 15)
              )
             )
            )
            (loop (result i32)
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (block (result i32)
              (nop)
              (i32.const -2147483648)
             )
            )
           )
          )
          (local.get $3)
         )
        )
        (i32.const -74)
        (i32.atomic.load8_u offset=4
         (i32.and
          (i32x4.extract_lane 2
           (f32x4.splat
            (f32.const -116)
           )
          )
          (i32.const 15)
         )
        )
       )
      )
     )
    )
    (else
     (nop)
     (call $fimport$6
      (array.new_fixed $5 0)
     )
    )
   )
   (return
    (array.new_default $1
     (i32.and
      (if (result i32)
       (i32.eqz
        (loop $label3 (result i32)
         (if
          (i32.eqz
           (global.get $global$0)
          )
          (then
           (global.set $global$0
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$0
          (i32.sub
           (global.get $global$0)
           (i32.const 1)
          )
         )
         (block
          (nop)
          (memory.fill
           (i32.and
            (ref.is_null
             (if (result (ref $1))
              (i31.get_s
               (local.tee $8
                (select (result (ref none))
                 (ref.cast (ref none)
                  (ref.cast (ref $2)
                   (ref.as_non_null
                    (local.tee $5
                     (ref.as_non_null
                      (local.get $5)
                     )
                    )
                   )
                  )
                 )
                 (try (result (ref none))
                  (do
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                  (catch $tag$0
                   (local.set $2 (i32.eqz (pop i32)))
                   (select (result (ref none))
                    (ref.as_non_null
                     (ref.null none)
                    )
                    (ref.as_non_null
                     (ref.null none)
                    )
                    (i32.const 254)
                   )
                  )
                 )
                 (local.get $1)
                )
               )
              )
              (then
               (br $label3)
              )
              (else
               (block $block (result (ref $1))
                (nop)
                (loop $label4 (result (ref $1))
                 (if
                  (i32.eqz
                   (global.get $global$0)
                  )
                  (then
                   (global.set $global$0
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$0
                  (i32.sub
                   (global.get $global$0)
                   (i32.const 1)
                  )
                 )
                 (call_ref $14
                  (v128.const i32x4 0x01ffff00 0x76bc80f1 0xffff0000 0xff00c6e2)
                  (ref.func $fimport$5)
                 )
                 (br_if $label4
                  (call_ref $11
                   (ref.func $7)
                   (ref.func $fimport$10)
                  )
                 )
                 (local.tee $6
                  (br_if $block
                   (local.get $6)
                   (i32.load16_u offset=22
                    (i32.and
                     (i32.const -45)
                     (i32.const 15)
                    )
                   )
                  )
                 )
                )
               )
              )
             )
            )
            (i32.const 15)
           )
           (i32.const -114)
           (i32.const -32)
          )
         )
         (drop
          (br_on_null $label3
           (struct.new_default $2)
          )
         )
         (br_if $label3
          (i32.atomic.load8_u acqrel offset=4
           (i32.and
            (i32.atomic.load acqrel offset=3
             (i32.and
              (local.get $1)
              (i32.const 15)
             )
            )
            (i32.const 15)
           )
          )
         )
         (loop (result i32)
          (if
           (i32.eqz
            (global.get $global$0)
           )
           (then
            (global.set $global$0
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$0
           (i32.sub
            (global.get $global$0)
            (i32.const 1)
           )
          )
          (if (result i32)
           (ref.eq
            (array.new_fixed $5 0)
            (try (result (ref $2))
             (do
              (struct.new_default $2)
             )
             (catch $tag$1
              (local.set $9 (local.tee $9 (pop (ref $0))))
              (loop (result (ref $2))
               (if
                (i32.eqz
                 (global.get $global$0)
                )
                (then
                 (global.set $global$0
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$0
                (i32.sub
                 (global.get $global$0)
                 (i32.const 1)
                )
               )
               (block (result (ref $2))
                (local.set $0
                 (local.get $0)
                )
                (ref.cast (ref $2)
                 (ref.as_non_null
                  (local.get $5)
                 )
                )
               )
              )
             )
            )
           )
           (then
            (try (result i32)
             (do
              (local.tee $0
               (if (result i32)
                (ref.is_null
                 (struct.new_default $6)
                )
                (then
                 (throw_ref
                  (ref.null noexn)
                 )
                )
                (else
                 (drop
                  (block (result i64)
                   (local.set $scratch
                    (i64.const -38)
                   )
                   (local.set $3
                    (i32.const 32769)
                   )
                   (local.get $scratch)
                  )
                 )
                 (local.get $3)
                )
               )
              )
             )
             (catch $tag$1
              (local.set $10 (pop (ref $0)))
              (if
               (ref.eq
                (if (result (ref null (exact $5)))
                 (i32.eqz
                  (i32.const 65535)
                 )
                 (then
                  (array.new_fixed $5 0)
                 )
                 (else
                  (br_if $label3
                   (local.get $1)
                  )
                  (ref.null none)
                 )
                )
                (struct.new_default $2)
               )
               (then
                (nop)
                (br $label3)
               )
               (else
                (throw_ref
                 (ref.null noexn)
                )
               )
              )
              (unreachable)
             )
            )
           )
           (else
            (nop)
            (br $label3)
           )
          )
         )
        )
       )
       (then
        (nop)
        (return
         (array.new_default $1
          (i32.and
           (i32.const 14)
           (i32.const 1023)
          )
         )
        )
       )
       (else
        (block $block1 (result i32)
         (nop)
         (try (result i32)
          (do
           (br_if $block1
            (loop $label5 (result i32)
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (block $block4
              (table.set $1
               (i32.const 3)
               (try_table (result (ref exn)) (catch $tag$0 $block1) (catch $tag$0 $block1) (catch_all $label5)
                (if (result (ref exn))
                 (i32.eqz
                  (ref.test (ref string)
                   (string.const "")
                  )
                 )
                 (then
                  (block $block3 (result (ref exn))
                   (nop)
                   (br_if $block3
                    (block $block2 (result (ref exn))
                     (try_table (catch_all_ref $block2)
                      (throw $tag$2)
                     )
                     (unreachable)
                    )
                    (loop $label6 (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$0)
                      )
                      (then
                       (global.set $global$0
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$0
                      (i32.sub
                       (global.get $global$0)
                       (i32.const 1)
                      )
                     )
                     (block
                      (local.set $4
                       (try (result f32)
                        (do
                         (local.get $4)
                        )
                        (catch_all
                         (local.get $4)
                        )
                       )
                      )
                     )
                     (br_if $label6
                      (i32.eqz
                       (br_if $block1
                        (i32.const 127)
                        (i32.eqz
                         (loop (result i32)
                          (if
                           (i32.eqz
                            (global.get $global$0)
                           )
                           (then
                            (global.set $global$0
                             (i32.const 100)
                            )
                            (unreachable)
                           )
                          )
                          (global.set $global$0
                           (i32.sub
                            (global.get $global$0)
                            (i32.const 1)
                           )
                          )
                          (local.get $0)
                         )
                        )
                       )
                      )
                     )
                     (i32.const -16093)
                    )
                   )
                  )
                 )
                 (else
                  (i64.store16 offset=2
                   (i32.and
                    (local.tee $0
                     (ref.eq
                      (ref.null none)
                      (block (result (ref $2))
                       (drop
                        (br_on_null $label5
                         (ref.i31
                          (i32.const 2)
                         )
                        )
                       )
                       (ref.as_non_null
                        (local.get $5)
                       )
                      )
                     )
                    )
                    (i32.const 15)
                   )
                   (i64.const -536870913)
                  )
                  (br $label5)
                 )
                )
               )
              )
              (try_table (catch $tag$0 $block1) (catch_all $block4)
               (nop)
              )
             )
             (br_if $label5
              (i32.eqz
               (block (result i32)
                (try
                 (do
                  (nop)
                 )
                 (catch_all
                  (call $fimport$0
                   (i32.const 139)
                  )
                 )
                )
                (ref.test (ref (exact $6))
                 (struct.new_default $6)
                )
               )
              )
             )
             (i32.clz
              (i32.trunc_f64_u
               (f64.const -288230376151711744)
              )
             )
            )
            (i32.eqz
             (i32.const 68)
            )
           )
          )
          (catch_all
           (loop $label7
            (if
             (i32.eqz
              (global.get $global$0)
             )
             (then
              (global.set $global$0
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$0
             (i32.sub
              (global.get $global$0)
              (i32.const 1)
             )
            )
            (block
             (nop)
             (br $label7)
            )
            (unreachable)
           )
           (unreachable)
          )
         )
        )
       )
      )
      (i32.const 1023)
     )
    )
   )
  )
  (unreachable)
 )
 (func $8 (type $12) (param $0 i64) (param $1 eqref) (result (ref null $0) eqref)
  (local $2 anyref)
  (local $3 (ref null $2))
  (local $4 stringref)
  (local $5 arrayref)
  (local $6 (ref string))
  (local $7 (ref $3))
  (local $8 (ref $3))
  (local $9 (ref null $3))
  (local $10 (ref $0))
  (local $11 (ref $0))
  (local $12 (ref $0))
  (local $13 (ref $1))
  (local $14 i64)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (drop
    (local.tee $6
     (string.const "\f0\90\8d\88\e2\82\ac\ed\a0\80")
    )
   )
   (drop
    (loop (result (ref (exact $7)))
     (if
      (i32.eqz
       (global.get $global$0)
      )
      (then
       (global.set $global$0
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$0
      (i32.sub
       (global.get $global$0)
       (i32.const 1)
      )
     )
     (block
      (nop)
      (loop
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$0
        (i32.sub
         (global.get $global$0)
         (i32.const 1)
        )
       )
       (block
        (call_ref $4
         (ref.func $5)
        )
        (nop)
       )
      )
     )
     (block
      (block
       (nop)
       (atomic.fence)
       (block
        (nop)
        (table.set $0
         (i32.const 2)
         (loop $label (result (ref (exact $12)))
          (if
           (i32.eqz
            (global.get $global$0)
           )
           (then
            (global.set $global$0
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$0
           (i32.sub
            (global.get $global$0)
            (i32.const 1)
           )
          )
          (atomic.fence)
          (br_if $label
           (loop (result i32)
            (if
             (i32.eqz
              (global.get $global$0)
             )
             (then
              (global.set $global$0
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$0
             (i32.sub
              (global.get $global$0)
              (i32.const 1)
             )
            )
            (local.get $16)
           )
          )
          (ref.func $8)
         )
        )
       )
      )
      (return
       (tuple.make 2
        (array.new_default $0
         (i32.and
          (i32.const 34)
          (i32.const 1023)
         )
        )
        (ref.null none)
       )
      )
     )
     (unreachable)
    )
   )
   (loop
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (return
      (tuple.make 2
       (array.new_default $0
        (i32.and
         (i32.const 0)
         (i32.const 1023)
        )
       )
       (struct.new_default $6)
      )
     )
    )
    (unreachable)
   )
   (local.set $13
    (unreachable)
   )
  )
  (unreachable)
 )
 (func $9 (type $4)
  (local $scratch (tuple (ref null $0) eqref))
  (local $scratch_1 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $0))
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $8
        (i64.const -7369)
        (struct.new_default $6)
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
 (@binaryen.js.called)
 (func $10 (type $32) (result f32)
  (local $0 (ref null $1))
  (local $1 f64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (f32.const -3402823466385288598117041e14)
 )
 (func $11 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $10)
  )
  (drop
   (call $10)
  )
  (drop
   (call $10)
  )
 )
 (func $12 (type $17) (result funcref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $17)))
   (nop)
   (ref.func $12)
  )
 )
 (@binaryen.js.called)
 (func $13 (type $8) (param $0 f64) (param $1 structref) (param $2 (ref $3)) (param $3 arrayref) (result i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block $block (result i32)
   (try_table (catch $tag$0 $block)
    (call $fimport$6
     (struct.new_default $2)
    )
   )
   (return
    (i32.const 65535)
   )
  )
 )
 (func $14 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $13
    (f64.const -33.233)
    (struct.new_default $6)
    (array.new_default $3
     (i32.and
      (i32.const 20)
      (i32.const 1023)
     )
    )
    (array.new_fixed $5 0)
   )
  )
  (drop
   (call $13
    (f64.const -9223372036854775808)
    (struct.new_default $6)
    (array.new_default $3
     (i32.and
      (i32.const 20)
      (i32.const 1023)
     )
    )
    (array.new_fixed $5 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $15 (type $18) (result (ref $0))
  (local $0 v128)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 externref)
  (local $9 (ref $0))
  (local $10 (ref $0))
  (local $11 (ref $3))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (array.new $1
   (local.tee $2
    (local.tee $3
     (call_indirect $0 (type $8)
      (f64x2.extract_lane 0
       (v128.const i32x4 0xfffc28f6 0x41efffff 0xfffea7f0 0x420fffff)
      )
      (struct.new_default $6)
      (loop $label (result (ref (exact $3)))
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$0
        (i32.sub
         (global.get $global$0)
         (i32.const 1)
        )
       )
       (i64.atomic.store32 acqrel offset=22
        (i32.and
         (i32.const 2147483647)
         (i32.const 15)
        )
        (local.get $7)
       )
       (if
        (call_indirect $0 (type $8)
         (f64.const -nan:0xffffffffffff8)
         (struct.new_default $6)
         (array.new $3
          (i32.const 2147483647)
          (i32.and
           (i32.const 13)
           (i32.const 1023)
          )
         )
         (loop (result (ref (exact $3)))
          (if
           (i32.eqz
            (global.get $global$0)
           )
           (then
            (global.set $global$0
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$0
           (i32.sub
            (global.get $global$0)
            (i32.const 1)
           )
          )
          (block (result (ref (exact $3)))
           (nop)
           (array.new $3
            (i32.const -124)
            (i32.and
             (i32.const 6)
             (i32.const 1023)
            )
           )
          )
         )
         (i32.const 45413)
        )
        (then
         (loop
          (if
           (i32.eqz
            (global.get $global$0)
           )
           (then
            (global.set $global$0
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$0
           (i32.sub
            (global.get $global$0)
            (i32.const 1)
           )
          )
          (block
           (br $label)
          )
          (unreachable)
         )
         (unreachable)
        )
        (else
         (call $fimport$1
          (i32.const -85)
         )
         (br $label)
        )
       )
       (unreachable)
      )
      (local.tee $11
       (try (result (ref (exact $3)))
        (do
         (array.new_default $3
          (i32.and
           (i32.const 23)
           (i32.const 1023)
          )
         )
        )
        (catch $tag$1
         (drop (array.len (pop (ref $0))))
         (array.new_default $3
          (i32.and
           (i32.const 14)
           (i32.const 1023)
          )
         )
        )
        (catch $tag$0
         (throw $tag$0 (pop i32))
         (array.new $3
          (i32.const -116)
          (i32.and
           (i32.const 13)
           (i32.const 1023)
          )
         )
        )
        (catch_all
         (array.new_default $3
          (i32.and
           (i32.const 39)
           (i32.const 1023)
          )
         )
        )
       )
      )
      (i32.const 7)
     )
    )
   )
   (i32.and
    (i32.const 13)
    (i32.const 1023)
   )
  )
 )
 (func $16 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $15)
  )
  (drop
   (call $15)
  )
 )
 (func $17 (type $18) (result (ref $0))
  (local $0 (ref $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $0
   (array.new_default $0
    (i32.and
     (i32.const 3)
     (i32.const 1023)
    )
   )
  )
  (block
   (return
    (local.get $0)
   )
  )
  (unreachable)
 )
 (func $18 (type $33) (param $0 (ref null $2)) (param $1 (ref $3)) (param $2 stringref) (param $3 (ref $1)) (param $4 i31ref) (param $5 i64) (param $6 (ref null $2)) (param $7 arrayref) (result (ref $1))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block (result (ref $1))
   (nop)
   (local.tee $3
    (array.new $1
     (i32.const 1073741824)
     (i32.and
      (i32.const 27)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $19 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $18
    (ref.null none)
    (array.new $3
     (i32.const -128)
     (i32.and
      (i32.const 19)
      (i32.const 1023)
     )
    )
    (string.const "\ed\bd\88\e2\82\ac\c2\a3")
    (array.new $1
     (i32.const 2097152)
     (block (result i32)
      (drop
       (i64.const -31955)
      )
      (i32.and
       (i32.const 35)
       (i32.const 1023)
      )
     )
    )
    (ref.i31
     (i32.const 32768)
    )
    (i64.const -16383)
    (struct.new_default $2)
    (ref.null none)
   )
  )
 )
 (@binaryen.js.called)
 (func $20 (type $34) (param $0 i32) (result stringref)
  (local $1 v128)
  (local $2 v128)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 funcref)
  (local $9 (ref $1))
  (local $10 (ref $0))
  (local $11 (ref $0))
  (local $12 (ref struct))
  (local $13 (ref struct))
  (local $14 (ref string))
  (local $15 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (string.const "")
 )
 (func $21 (type $19) (param $0 i64) (param $1 (ref $3))
  (local $2 (ref null $0))
  (local $3 funcref)
  (local $4 exnref)
  (local $5 eqref)
  (local $6 stringref)
  (local $7 (ref string))
  (local $8 (ref $0))
  (local $9 f64)
  (local $10 f64)
  (local $11 i32)
  (local $12 i32)
  (local $13 v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (f64.store offset=22 align=4
   (i32.and
    (if (result i32)
     (i32.eqz
      (string.measure_wtf16
       (ref.cast (ref string)
        (block (result (ref string))
         (nop)
         (string.const "\c2\a3")
        )
       )
      )
     )
     (then
      (try (result i32)
       (do
        (i32.const -26)
       )
       (catch $tag$0
        (local.set $12 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
        (drop
         (string.eq
          (local.get $6)
          (string.const "\c2\a3")
         )
        )
        (block
         (nop)
         (return)
        )
        (unreachable)
       )
      )
     )
     (else
      (block
       (nop)
       (call $fimport$9
        (ref.func $21)
        (call $fimport$10
         (ref.func $21)
        )
       )
      )
      (return)
     )
    )
    (i32.const 15)
   )
   (local.tee $10
    (f64.const 7012)
   )
  )
 )
 (func $22 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (call $21
   (i64.const 124)
   (array.new $3
    (i32.const 536870912)
    (i32.and
     (i32.const 35)
     (i32.const 1023)
    )
   )
  )
 )
 (func $23 (type $35) (param $0 (ref $3)) (param $1 v128) (param $2 i32) (param $3 i32) (result (ref null $0))
  (local $4 (ref extern))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$8
    (if (result externref)
     (i32.eqz
      (i32.const 32767)
     )
     (then
      (block $block (result nullexternref)
       (nop)
       (br_if $block
        (ref.null noextern)
        (i32.const -112)
       )
      )
     )
     (else
      (local.tee $4
       (string.const "\f0\90\8d\88\e2\82\ac\e2\82\ac")
      )
     )
    )
   )
   (return
    (array.new_default $0
     (i32.and
      (i32.const 4)
      (i32.const 1023)
     )
    )
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $24 (type $36) (param $0 v128) (param $1 (ref $0)) (result f32)
  (local $2 (ref null $3))
  (local $3 structref)
  (local $4 f32)
  (local $5 f64)
  (local $6 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (f32.const 65510)
 )
 (func $25 (type $4)
  (local $0 (ref string))
  (local $1 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $24
    (v128.const i32x4 0xff8500ae 0xff00ffa1 0x00003663 0x5b291708)
    (array.new $0
     (stringview_wtf16.get_codeunit
      (local.tee $0
       (string.const "543\c2\a3\c2\a3")
      )
      (block (result i32)
       (local.set $1
        (i32.const -8388608)
       )
       (local.get $1)
      )
     )
     (i32.and
      (i32.const 28)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $24
    (v128.const i32x4 0xffffffa1 0xffffffff 0x00000000 0xc1700000)
    (array.new $0
     (i32.const -7841469)
     (i32.and
      (i32.const 23)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $24
    (v128.const i32x4 0x8002cb00 0x003ff04b 0xcfdd0100 0x00e30744)
    (array.new_default $0
     (i32.and
      (i32.const 7)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $26 (type $37) (param $0 i32) (param $1 f64) (result f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$4
    (f64x2.extract_lane 1
     (v128.const i32x4 0xff856514 0xffffffff 0x00007fff 0x00000000)
    )
   )
   (return
    (f32.const -2147483648)
   )
  )
  (unreachable)
 )
 (func $27 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $26
    (i32.const -105)
    (f64.const -nan:0xfffffffffff95)
   )
  )
 )
 (func $28 (type $38) (param $0 anyref) (result f32)
  (local $1 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (table.set $1
    (i32.const 2)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$2)
     )
     (unreachable)
    )
   )
   (return
    (f32.const 16382.857421875)
   )
  )
  (unreachable)
 )
 (func $29 (type $39) (param $0 (ref array)) (param $1 f32) (param $2 (ref null $3)) (param $3 (ref array)) (param $4 f32) (param $5 (ref struct)) (result (ref null $0) f32 f32 i64)
  (local $6 stringref)
  (local $7 stringref)
  (local $8 stringref)
  (local $9 (ref null $2))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 (ref $3))
  (local $13 (ref $3))
  (local $14 (ref $3))
  (local $15 exnref)
  (local $16 (ref null $3))
  (local $17 (ref null $3))
  (local $18 (ref $2))
  (local $19 (ref string))
  (local $20 (ref i31))
  (local $21 (ref i31))
  (local $22 (ref i31))
  (local $23 funcref)
  (local $24 (ref func))
  (local $25 (ref func))
  (local $26 (ref $0))
  (local $27 (ref $0))
  (local $28 (ref $0))
  (local $29 (ref $0))
  (local $30 (ref $0))
  (local $31 (ref $0))
  (local $32 (ref $0))
  (local $33 (ref $0))
  (local $34 (ref $0))
  (local $35 (ref $0))
  (local $36 (ref $1))
  (local $37 (ref $1))
  (local $38 (ref null $1))
  (local $39 (ref extern))
  (local $40 eqref)
  (local $41 (ref $7))
  (local $42 arrayref)
  (local $43 i32)
  (local $44 i32)
  (local $45 i32)
  (local $46 i32)
  (local $47 i32)
  (local $48 i32)
  (local $49 i32)
  (local $50 i32)
  (local $51 i32)
  (local $52 i32)
  (local $53 i32)
  (local $54 i32)
  (local $55 i32)
  (local $56 i32)
  (local $57 i32)
  (local $58 i32)
  (local $59 i32)
  (local $60 f32)
  (local $61 f32)
  (local $62 f64)
  (local $63 f64)
  (local $64 f64)
  (local $65 f64)
  (local $66 i64)
  (local $67 i64)
  (local $68 i64)
  (local $69 i64)
  (local $70 i64)
  (local $71 i64)
  (local $72 v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $37
   (array.new $1
    (local.get $45)
    (i32.and
     (i32.const 26)
     (i32.const 1023)
    )
   )
  )
  (local.set $24
   (ref.func $fimport$8)
  )
  (local.set $22
   (ref.i31
    (i32.const -11)
   )
  )
  (local.set $19
   (string.const "32")
  )
  (local.set $18
   (struct.new_default $2)
  )
  (local.set $10
   (array.new_default $3
    (i32.and
     (i32.const 20)
     (i32.const 1023)
    )
   )
  )
  (loop
   (if
    (i32.eqz
     (global.get $global$0)
    )
    (then
     (global.set $global$0
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$0
    (i32.sub
     (global.get $global$0)
     (i32.const 1)
    )
   )
   (drop
    (block (result (ref string))
     (if
      (select
       (block (result i32)
        (block
         (nop)
         (return
          (tuple.make 4
           (ref.null none)
           (f32.const -nan:0x741e3e)
           (f32.const -79)
           (i64.const 32767)
          )
         )
        )
        (local.set $35
         (local.set $37
          (local.set $34
           (unreachable)
          )
         )
        )
       )
       (loop (result i32)
        (if
         (i32.eqz
          (global.get $global$0)
         )
         (then
          (global.set $global$0
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$0
         (i32.sub
          (global.get $global$0)
          (i32.const 1)
         )
        )
        (block (result i32)
         (local.get $45)
        )
       )
       (local.tee $45
        (i32.const -32768)
       )
      )
      (then
       (local.set $40
        (array.new_fixed $5 0)
       )
      )
     )
     (local.get $19)
    )
   )
   (block
    (nop)
    (return
     (tuple.make 4
      (ref.null none)
      (f32.const 37)
      (f32.const 4294967296)
      (i64.const 262144)
     )
    )
   )
   (unreachable)
  )
  (tuple.make 4
   (block ;; (replaces unreachable ArrayNew we can't emit)
    (drop
     (unreachable)
    )
    (drop
     (i32.and
      (i32.const 29)
      (i32.const 1023)
     )
    )
    (unreachable)
   )
   (local.get $1)
   (f32.const nan:0x400000)
   (local.get $68)
  )
 )
 (@binaryen.js.called)
 (func $30 (type $40) (result (ref null $2))
  (local $0 f64)
  (local $1 (ref null $3))
  (local $2 i31ref)
  (local $3 (ref null $0))
  (local $4 (ref null $0))
  (local $5 (ref null $0))
  (local $6 (ref array))
  (local $7 anyref)
  (local $8 (ref $2))
  (local $9 stringref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (struct.new_default $2)
 )
 (func $31 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $30)
  )
 )
 (@binaryen.js.called)
 (func $32 (type $15) (result (ref null $3))
  (local $0 anyref)
  (local $1 (ref $0))
  (local $2 (ref $0))
  (local $3 nullfuncref)
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (if (result (ref (exact $3)))
   (if (result i32)
    (i32.lt_u
     (local.tee $4
      (call_indirect $0 (type $8)
       (f64.const -1797693134862315708145274e284)
       (struct.new_default $6)
       (array.new $3
        (call_indirect $0 (type $8)
         (f64.const -nan:0xffffffffffff4)
         (struct.new_default $2)
         (block $block (result (ref (exact $3)))
          (try_table
           (i32.atomic.store8 acqrel offset=22
            (i32.and
             (ref.eq
              (ref.as_non_null
               (ref.null none)
              )
              (try_table (result (ref none))
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
             (i32.const 15)
            )
            (ref.eq
             (ref.null none)
             (block (result (ref none))
              (br_on_non_null $block
               (ref.as_non_null
                (ref.null none)
               )
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
          (array.new_default $3
           (i32.and
            (i32.const 27)
            (i32.const 1023)
           )
          )
         )
         (if (result (ref (exact $5)))
          (call_ref $11
           (ref.func $32)
           (ref.func $fimport$10)
          )
          (then
           (call $fimport$7
            (local.get $3)
           )
           (return
            (array.new $3
             (local.get $4)
             (i32.and
              (i32.const 17)
              (i32.const 1023)
             )
            )
           )
          )
          (else
           (array.new_fixed $5 0)
          )
         )
         (i32.const 7)
        )
        (i32.and
         (i32.const 0)
         (i32.const 1023)
        )
       )
       (ref.null none)
       (i32.const 7)
      )
     )
     (array.len
      (local.tee $2
       (local.tee $1
        (array.new_default $3
         (i32.and
          (if (result i32)
           (local.get $4)
           (then
            (nop)
            (return
             (ref.null none)
            )
           )
           (else
            (nop)
            (local.get $4)
           )
          )
          (i32.const 1023)
         )
        )
       )
      )
     )
    )
    (then
     (array.get $0
      (local.get $2)
      (local.get $4)
     )
    )
    (else
     (i32.const -114)
    )
   )
   (then
    (call $fimport$8
     (ref.cast (ref extern)
      (global.get $gimport$0)
     )
    )
    (return
     (array.new_default $3
      (i32.and
       (i32.const 31)
       (i32.const 1023)
      )
     )
    )
   )
   (else
    (array.new_default $3
     (i32.and
      (i32.const 42)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $33 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $32)
  )
  (drop
   (call $32)
  )
  (drop
   (call $32)
  )
  (drop
   (call $32)
  )
  (drop
   (call $32)
  )
  (drop
   (call $32)
  )
 )
 (@binaryen.js.called)
 (func $34 (type $41) (param $0 f64) (result (ref null $2) eqref i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 f32)
  (local $10 v128)
  (local $11 f64)
  (local $12 (ref null $3))
  (local $13 (ref null $2))
  (local $14 (ref null $0))
  (local $15 i31ref)
  (local $16 (ref $1))
  (local $17 (ref array))
  (local $18 (ref $0))
  (local $19 structref)
  (local $20 (ref $7))
  (local $scratch (tuple f32 f64))
  (local $scratch_22 f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (drop
    (block (result f32)
     (local.set $scratch_22
      (tuple.extract 2 0
       (local.tee $scratch
        (try (type $13) (result f32 f64)
         (do
          (tuple.make 2
           (f32.const -nan:0x7fffb4)
           (f64.const 72057594037927936)
          )
         )
         (catch $tag$1
          (if (ref.is_null (pop (ref $0))) (then (nop)) (else (unreachable)))
          (tuple.make 2
           (f32.const -32669)
           (f64.const 2.2250738585072014e-308)
          )
         )
         (catch $tag$0
          (local.set $7 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
          (tuple.make 2
           (f32.const 18790)
           (f64.const 4294967272)
          )
         )
        )
       )
      )
     )
     (local.set $11
      (tuple.extract 2 1
       (local.get $scratch)
      )
     )
     (local.get $scratch_22)
    )
   )
   (if
    (if (result i32)
     (call_ref $8
      (local.get $11)
      (local.tee $19
       (ref.null none)
      )
      (ref.cast (ref (exact $3))
       (if (result (ref (exact $3)))
        (local.tee $6
         (string.encode_wtf16_array
          (if (result (ref string))
           (f32.ge
            (f32.const -nan:0x7faa35)
            (block (result f32)
             (loop
              (if
               (i32.eqz
                (global.get $global$0)
               )
               (then
                (global.set $global$0
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$0
               (i32.sub
                (global.get $global$0)
                (i32.const 1)
               )
              )
              (block
               (memory.copy
                (i32.and
                 (i32.const 187)
                 (i32.const 15)
                )
                (i32.and
                 (f32.ge
                  (f32.const -nan:0x7fff9f)
                  (f32.const -nan:0x4a4a39)
                 )
                 (i32.const 15)
                )
                (local.get $6)
               )
               (data.drop $3)
              )
             )
             (f32.const -nan:0x1f0904)
            )
           )
           (then
            (nop)
            (return
             (tuple.make 3
              (ref.null none)
              (struct.new_default $6)
              (i32.const -42)
             )
            )
           )
           (else
            (string.const "\e2\82\ac")
           )
          )
          (local.tee $20
           (array.new_default $7
            (i32.and
             (i32.const 6)
             (i32.const 1023)
            )
           )
          )
          (i32.const 82)
         )
        )
        (then
         (nop)
         (return
          (tuple.make 3
           (struct.new_default $2)
           (ref.i31
            (i32.const -95)
           )
           (i32.const 127)
          )
         )
        )
        (else
         (nop)
         (if (result (ref (exact $3)))
          (i32.eqz
           (i32.const 65447)
          )
          (then
           (local.set $6
            (i32.const -1048575)
           )
           (array.new_default $3
            (i32.and
             (i32.const 20)
             (i32.const 1023)
            )
           )
          )
          (else
           (block $block (result (ref (exact $3)))
            (drop
             (br_on_cast_fail $block (ref (exact $3)) (ref (exact $3))
              (array.new $3
               (local.get $6)
               (i32.and
                (i32.const 3)
                (i32.const 1023)
               )
              )
             )
            )
            (return
             (tuple.make 3
              (struct.new_default $2)
              (ref.i31
               (i32.const -47)
              )
              (i32.const -2147483648)
             )
            )
           )
          )
         )
        )
       )
      )
      (array.new_default $1
       (i32.and
        (i32.const 2)
        (i32.const 1023)
       )
      )
      (ref.func $13)
     )
     (then
      (i32.const 0)
     )
     (else
      (i32.const -28814)
     )
    )
    (then
     (call $fimport$3
      (f32.sqrt
       (f32.const -1152921504606846976)
      )
     )
     (nop)
    )
    (else
     (try_table
      (nop)
     )
    )
   )
   (loop
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (nop)
     (return
      (tuple.make 3
       (struct.new_default $2)
       (struct.new_default $6)
       (i32.const -52)
      )
     )
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $35 (type $4)
  (local $scratch (tuple (ref null $2) eqref i32))
  (local $scratch_1 eqref)
  (local $scratch_2 (ref null $2))
  (local $scratch_3 (tuple (ref null $2) eqref i32))
  (local $scratch_4 eqref)
  (local $scratch_5 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $2))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $34
        (f64.const 111)
       )
      )
     )
    )
    (drop
     (block (result eqref)
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
   (block (result (ref null $2))
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $34
        (f64.const 4294967295)
       )
      )
     )
    )
    (drop
     (block (result eqref)
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
 )
 (func $36 (type $42) (param $0 (ref null $0)) (param $1 f64) (param $2 i31ref) (param $3 externref) (result f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 v128)
  (local $15 f32)
  (local $16 i32)
  (local $17 eqref)
  (local $18 eqref)
  (local $19 (ref $3))
  (local $20 (ref $3))
  (local $21 (ref null $3))
  (local $22 i31ref)
  (local $23 stringref)
  (local $24 (ref null $1))
  (local $25 funcref)
  (local $26 externref)
  (local $27 (ref exn))
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (call $16)
   (loop $label
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (table.set $1
      (i32.const 1)
      (local.tee $27
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$1
          (array.new $0
           (local.get $16)
           (block (result i32)
            (drop
             (block (result i64)
              (local.set $scratch
               (i64.const -34)
              )
              (local.set $7
               (f64.const -43)
              )
              (local.get $scratch)
             )
            )
            (i32.and
             (i32.trunc_sat_f64_u
              (local.get $7)
             )
             (i32.const 1023)
            )
           )
          )
         )
        )
        (unreachable)
       )
      )
     )
     (br $label)
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $37 (type $43) (param $0 v128) (param $1 i64) (param $2 exnref) (param $3 i32) (param $4 i32) (param $5 (ref struct)) (param $6 (ref array)) (result (ref null $1))
  (local $7 f64)
  (local $8 v128)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 (ref array))
  (local $13 (ref null $3))
  (local $14 (ref $0))
  (local $15 (ref $1))
  (local $16 (ref null $1))
  (local $17 (ref null $1))
  (local $18 (ref string))
  (local $19 funcref)
  (local $20 stringref)
  (local $21 (ref $2))
  (local $22 arrayref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $15
   (array.new $1
    (i32.const 4096)
    (i32.and
     (i32.const 11)
     (i32.const 1023)
    )
   )
  )
  (local.get $15)
 )
 (@binaryen.js.called)
 (func $38 (type $44) (result (ref null $0))
  (local $0 (ref eq))
  (local $1 (ref struct))
  (local $2 (ref null $2))
  (local $3 eqref)
  (local $4 eqref)
  (local $5 (ref null $1))
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (table.set $1
    (i32.const 3)
    (loop $label (result (ref exn))
     (if
      (i32.eqz
       (global.get $global$0)
      )
      (then
       (global.set $global$0
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$0
      (i32.sub
       (global.get $global$0)
       (i32.const 1)
      )
     )
     (call $fimport$2
      (i64.const 32769)
     )
     (block
      (nop)
      (block
       (call $fimport$3
        (f32.const -1810337792)
       )
       (br $label)
      )
      (unreachable)
     )
     (unreachable)
    )
   )
   (drop
    (memory.atomic.notify offset=22
     (i32.and
      (i32.atomic.load16_u offset=3
       (i32.and
        (local.get $8)
        (i32.const 15)
       )
      )
      (i32.const 15)
     )
     (i32.const -32769)
    )
   )
   (loop $label1
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (br $label1)
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $39 (type $45) (param $0 i31ref) (param $1 i32) (result (ref null $0) f64 stringref)
  (local $2 arrayref)
  (local $3 (ref null $1))
  (local $4 (ref null $1))
  (local $5 (ref $2))
  (local $6 externref)
  (local $7 (ref null $2))
  (local $8 anyref)
  (local $9 (ref $3))
  (local $10 (ref null $0))
  (local $11 f32)
  (local $12 f32)
  (local $13 f64)
  (local $14 f64)
  (local $15 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $9
   (array.new_default $3
    (i32.and
     (i32.const 26)
     (i32.const 1023)
    )
   )
  )
  (block (type $9) (result nullref f64 nullexternref)
   (call_indirect $0 (type $19)
    (local.get $15)
    (local.get $9)
    (i32.const 13)
   )
   (if (type $9) (result nullref f64 nullexternref)
    (i32.const 8)
    (then
     (nop)
     (return
      (tuple.make 3
       (array.new $0
        (local.get $1)
        (i32.and
         (i32.const 29)
         (i32.const 1023)
        )
       )
       (f64.const -9223372036854775808)
       (string.const "")
      )
     )
    )
    (else
     (table.set $1
      (i32.const 3)
      (block $block (result (ref exn))
       (try_table (catch_all_ref $block)
        (throw $tag$2)
       )
       (unreachable)
      )
     )
     (tuple.make 3
      (ref.null none)
      (f64.const -21)
      (ref.null noextern)
     )
    )
   )
  )
 )
 (func $40 (type $4)
  (local $0 f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 (ref $2))
  (local $7 stringref)
  (local $8 (ref null $1))
  (local $9 structref)
  (local $10 (ref null $3))
  (local $11 (ref string))
  (local $12 (ref null $2))
  (local $13 (ref $0))
  (local $14 (ref $3))
  (local $15 (ref i31))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $11
   (string.const "\c2\a3")
  )
  (local.set $6
   (struct.new_default $2)
  )
  (block
   (call $fimport$7
    (ref.func $40)
   )
   (drop
    (try_table (result (ref string))
     (local.tee $11
      (string.const "")
     )
    )
   )
   (drop
    (v128.const i32x4 0xffffffc8 0xffffffff 0xfffe0001 0xffffffff)
   )
   (drop
    (array.new_fixed $5 0)
   )
   (drop
    (f64.promote_f32
     (f32.const -nan:0x7fe237)
    )
   )
   (drop
    (f32.const 127.62899780273438)
   )
   (if
    (i32.eqz
     (stringview_wtf16.get_codeunit
      (local.get $11)
      (block (result i32)
       (local.set $4
        (i32.const -41)
       )
       (local.get $4)
      )
     )
    )
    (then
     (call $fimport$3
      (local.get $5)
     )
     (return)
    )
    (else
     (call $fimport$4
      (f64.const -2.2250738585072014e-308)
     )
     (return)
    )
   )
   (local.set $14
    (local.set $15
     (unreachable)
    )
   )
  )
  (unreachable)
 )
 (func $41 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (call $40)
  (call $40)
  (call $40)
 )
 (func $42 (type $46) (result (ref struct))
  (local $0 i64)
  (local $1 (ref $3))
  (local $2 (ref null $0))
  (local $3 arrayref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (struct.new_default $6)
 )
 (func $43 (type $4)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $42)
  )
 )
 (func $44 (type $47) (param $0 i32) (param $1 f32) (param $2 (ref $3)) (param $3 (ref null $2)) (result externref)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 externref)
  (local $10 (ref $1))
  (local $11 (ref $2))
  (local $12 i31ref)
  (local $13 (ref $3))
  (local $14 (ref extern))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.tee $14
   (global.get $gimport$0)
  )
 )
 (@binaryen.js.called)
 (func $45 (type $48) (param $0 f64) (param $1 (ref null $0)) (param $2 (ref $0)) (param $3 (ref $2)) (param $4 i32) (param $5 externref) (result exnref)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 f64)
  (local $14 (ref func))
  (local $15 (ref string))
  (local $16 (ref $7))
  (local $17 (ref $7))
  (local $18 (ref null $7))
  (local $19 stringref)
  (local $20 (ref $0))
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $18
   (ref.as_non_null
    (local.get $18)
   )
  )
  (local.set $15
   (string.const "\f0\90\8d\88\c2\a3")
  )
  (local.set $14
   (ref.func $45)
  )
  (block
   (loop $label1
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (call $fimport$8
      (loop $label (result (ref string))
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$0
        (i32.sub
         (global.get $global$0)
         (i32.const 1)
        )
       )
       (block
        (call $fimport$5
         (select
          (v128.const i32x4 0x00000003 0xffffe24f 0x7fffffff 0x0000001b)
          (v128.const i32x4 0xf309362b 0xc14d0775 0xffff0000 0x00000000)
          (i32.atomic.load offset=3
           (i32.and
            (call $fimport$10
             (ref.func $45)
            )
            (i32.const 15)
           )
          )
         )
        )
        (call $fimport$8
         (global.get $gimport$0)
        )
       )
       (br_if $label
        (call $fimport$10
         (local.tee $14
          (ref.func $45)
         )
        )
       )
       (string.const "\f0\90\8d\88\f0\90\8d\88")
      )
     )
     (call $fimport$6
      (block (result (ref (exact $1)))
       (call $fimport$7
        (ref.func $45)
       )
       (array.new_default $1
        (i32.and
         (i32.const 42)
         (i32.const 1023)
        )
       )
      )
     )
    )
    (br_if $label1
     (i32.eqz
      (local.get $4)
     )
    )
    (drop
     (ref.i31
      (i32.const -55)
     )
    )
    (block
     (loop
      (if
       (i32.eqz
        (global.get $global$0)
       )
       (then
        (global.set $global$0
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$0
       (i32.sub
        (global.get $global$0)
        (i32.const 1)
       )
      )
      (if
       (string.measure_wtf16
        (local.tee $15
         (string.const "")
        )
       )
       (then
        (drop
         (block (result i64)
          (local.set $scratch
           (i64.const -76)
          )
          (local.set $9
           (f32.const -9223372036854775808)
          )
          (local.get $scratch)
         )
        )
        (call $fimport$3
         (local.get $9)
        )
        (block
         (nop)
         (call $fimport$8
          (if (result (ref extern))
           (ref.eq
            (local.get $3)
            (if (result (ref $0))
             (i32.eqz
              (local.get $4)
             )
             (then
              (local.get $2)
             )
             (else
              (local.get $2)
             )
            )
           )
           (then
            (local.tee $15
             (local.get $15)
            )
           )
           (else
            (global.get $gimport$0)
           )
          )
         )
        )
       )
       (else
        (call $fimport$6
         (ref.null none)
        )
       )
      )
     )
     (return
      (ref.null noexn)
     )
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
