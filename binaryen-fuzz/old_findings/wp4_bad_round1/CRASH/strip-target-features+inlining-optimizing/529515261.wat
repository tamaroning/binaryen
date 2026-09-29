(module
 (type $0 (sub (array (ref null $0))))
 (type $1 (struct (field f32) (field (mut i16)) (field v128) (field i16) (field (mut f64))))
 (type $2 (func))
 (type $3 (func (param i32)))
 (type $4 (array i8))
 (type $5 (struct))
 (type $6 (func (result i64 i64)))
 (type $7 (func (param i64)))
 (type $8 (func (param f64) (result i32)))
 (type $9 (func (param f64)))
 (type $10 (func (param funcref)))
 (type $11 (func (param exnref i32 (ref string) (ref $0) (ref string) f32 (ref $1)) (result i32)))
 (type $12 (array (mut i16)))
 (type $13 (func (param eqref) (result (ref $0))))
 (type $14 (func (result i64)))
 (type $15 (func (result f32)))
 (type $16 (func (param f32)))
 (type $17 (func (param v128)))
 (type $18 (func (param anyref)))
 (type $19 (func (param externref)))
 (type $20 (func (param (ref null $1) externref f32 i64 (ref null $0)) (result (ref eq))))
 (type $21 (func (param (ref eq)) (result i64)))
 (type $22 (func (param f32 anyref f32 arrayref) (result i64 i64)))
 (type $23 (func (result eqref)))
 (type $24 (func (param f64 (ref $1)) (result i64 f64)))
 (type $25 (func (param (ref string))))
 (type $26 (func (param (ref eq) (ref null $0)) (result f32)))
 (type $27 (func (result (ref eq))))
 (type $28 (func (param anyref f64) (result exnref)))
 (type $29 (func (param f32 (ref $0)) (result i64 eqref)))
 (type $30 (func (param f64 i64) (result v128)))
 (type $31 (func (param (ref $0)) (result (ref $0))))
 (type $32 (func (result i32)))
 (type $33 (func (param (ref $0) (ref struct) anyref) (result v128)))
 (type $34 (func (result (ref null $0))))
 (type $35 (func (param v128) (result f32)))
 (type $36 (func (param f32) (result f32)))
 (type $37 (func (param f64) (result f64)))
 (type $38 (func (param v128) (result v128)))
 (type $39 (func (result i64 f64)))
 (type $40 (func (result i64 eqref)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $3) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $3) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $7) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $16) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $9) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $17) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $18) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $10) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $19) (param externref)))
 (global $global$0 i64 (i64.const -256))
 (global $global$1 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 (i64.const 0) "\a8\04\97\afKr\d3\0c\11\a3WW\9c\fa\83W\82\80\c2\85(5\0b\f2\0f")
 (data $1 (i64.const 25) "")
 (data $2 "G\db\91\a1l\1c8_~ \88Wi\"\8c\c0\be}\a7")
 (data $3 "+\'")
 (data $4 (i64.const 25) "K\84oS\c0m\7fb\a9Jv5;\05\18\ad*z\1f\a8")
 (table $0 i64 11 11 funcref (ref.null nofunc))
 (table $1 7 7 exnref)
 (elem $0 (table $0) (i64.const 0) func $0 $0 $2 $2 $2 $11 $11 $26 $29 $33 $36)
 (elem declare func $10 $14 $16 $3 $5 $7 $fimport$0 $fimport$2 $fimport$4)
 (tag $tag$0 (type $3) (param i32))
 (tag $tag$1 (type $2))
 (export "global$" (global $global$0))
 (export "func" (func $0))
 (export "func_invoker" (func $1))
 (export "func_13_invoker" (func $5))
 (export "func_15" (func $6))
 (export "func_17" (func $8))
 (export "func_17_invoker" (func $9))
 (export "func_20_invoker" (func $12))
 (export "func_22" (func $13))
 (export "func_23" (func $14))
 (export "func_23_invoker" (func $15))
 (export "func_25_invoker" (func $17))
 (export "func_27_invoker" (func $19))
 (export "func_29" (func $20))
 (export "func_31_invoker" (func $23))
 (export "func_33_invoker" (func $25))
 (export "func_35" (func $26))
 (export "func_35_invoker" (func $27))
 (export "func_38_invoker" (func $30))
 (export "func_41" (func $32))
 (export "func_42_invoker" (func $34))
 (export "func_44" (func $35))
 (export "func_45_invoker" (func $37))
 (export "func_47_invoker" (func $39))
 (export "func_49" (func $40))
 (export "func_49_invoker" (func $41))
 (@binaryen.js.called)
 (func $0 (type $20) (param $0 (ref null $1)) (param $1 externref) (param $2 f32) (param $3 i64) (param $4 (ref null $0)) (result (ref eq))
  (local $5 eqref)
  (local $6 (ref string))
  (local $7 anyref)
  (local $8 (ref null $0))
  (local $9 (ref $0))
  (local $10 nullexternref)
  (local $11 f32)
  (local.set $2
   (call $43
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (loop $label (result (ref i31))
   (if
    (i32.eqz
     (global.get $global$1)
    )
    (then
     (global.set $global$1
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$1
    (i32.sub
     (global.get $global$1)
     (i32.const 1)
    )
   )
   (call $fimport$1
    (block $block (result i32)
     (call $fimport$8
      (try_table (result (ref string)) (catch $tag$0 $block) (catch $tag$0 $block) (catch_all $label)
       (string.const "93\c2\a3\ed\bd\88")
      )
     )
     (block (result i32)
      (nop)
      (i32.const 33554432)
     )
    )
   )
   (call $fimport$8
    (local.get $10)
   )
   (call $fimport$2
    (i64.const -60)
   )
   (return
    (array.new_fixed $4 0)
   )
  )
 )
 (func $1 (type $2)
  (local $0 f32)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $0
    (struct.new $1
     (local.get $0)
     (i32.const -34)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (i32.const -536870911)
     (f64.const -11217)
    )
    (string.const "\c2\a3")
    (f32.const 0)
    (i64.const 32769)
    (array.new_default $0
     (i32.and
      (i32.const 12)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $2 (type $3) (param $0 i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 v128)
  (local $5 v128)
  (local $6 f32)
  (local $7 f32)
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref null $0))
  (local $11 anyref)
  (local $12 stringref)
  (local $13 (ref func))
  (local $14 exnref)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (nop)
  (block $block
   (try_table (catch_all $block)
    (if
     (i16x8.extract_lane_s 1
      (if (result v128)
       (i32.eqz
        (ref.eq
         (array.new_default $0
          (i32.and
           (i32.const 5)
           (i32.const 1023)
          )
         )
         (ref.cast (ref none)
          (local.get $8)
         )
        )
       )
       (then
        (br_if $block
         (select
          (i32.atomic.rmw8.cmpxchg_u acqrel offset=22
           (i64.and
            (i64.const -32766)
            (i64.const 15)
           )
           (if (result i32)
            (local.get $0)
            (then
             (unreachable)
            )
            (else
             (block
              (f32.store offset=22 align=2
               (i64.and
                (i64.const -5)
                (i64.const 15)
               )
               (f32.const 9223372036854775808)
              )
              (br $block)
             )
             (unreachable)
            )
           )
           (local.get $0)
          )
          (i32x4.extract_lane 3
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (ref.is_null
           (ref.cast (ref $0)
            (block (result (ref $0))
             (call $1)
             (ref.as_non_null
              (local.tee $10
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
        (br $block)
       )
       (else
        (if
         (local.get $0)
         (then
          (block $block2
           (nop)
           (struct.set $1 4
            (struct.new $1
             (call $43
              (f32.load offset=22 align=2
               (i64.and
                (i64.extend8_s
                 (i64.atomic.load offset=22
                  (i64.and
                   (local.get $3)
                   (i64.const 15)
                  )
                 )
                )
                (i64.const 15)
               )
              )
             )
             (if (result i32)
              (i32.eqz
               (block $block1 (result i32)
                (if
                 (if (result i32)
                  (i32.const -128)
                  (then
                   (i32.const -65535)
                  )
                  (else
                   (return)
                  )
                 )
                 (then
                  (drop
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
                (br_if $block1
                 (local.get $0)
                 (i32.eqz
                  (i32.const 0)
                 )
                )
               )
              )
              (then
               (local.get $0)
              )
              (else
               (br_if $block
                (i32.eqz
                 (i32.const -16777215)
                )
               )
               (nop)
               (br $block2)
              )
             )
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (if (result i32)
              (i32.atomic.rmw8.cmpxchg_u offset=22
               (i64.and
                (i64.atomic.rmw16.cmpxchg_u offset=4
                 (i64.and
                  (i64.const -6456254)
                  (i64.const 15)
                 )
                 (local.get $3)
                 (local.get $3)
                )
                (i64.const 15)
               )
               (local.get $0)
               (ref.eq
                (ref.i31
                 (i32.const -6466005)
                )
                (struct.new_default $5)
               )
              )
              (then
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (local.set $8
                (ref.as_non_null
                 (local.tee $10
                  (ref.as_non_null
                   (local.get $10)
                  )
                 )
                )
               )
               (atomic.fence acqrel)
               (if
                (i32.eqz
                 (local.get $0)
                )
                (then
                 (nop)
                )
               )
               (nop)
               (br $block2)
              )
              (else
               (loop (result i32)
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (block (result i32)
                 (if
                  (i8x16.extract_lane_s 5
                   (block (result v128)
                    (call_ref $9
                     (f64.const 17592186044416)
                     (ref.func $fimport$4)
                    )
                    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                   )
                  )
                  (then
                   (call_ref $3
                    (local.get $0)
                    (ref.func $fimport$0)
                   )
                   (drop
                    (block (result i64)
                     (local.set $scratch
                      (i64.const 255)
                     )
                     (drop
                      (i64.const -32769)
                     )
                     (local.get $scratch)
                    )
                   )
                  )
                  (else
                   (nop)
                  )
                 )
                 (i32.atomic.load16_u acqrel offset=22
                  (i64.and
                   (local.get $3)
                   (i64.const 15)
                  )
                 )
                )
               )
              )
             )
             (try (result f64)
              (do
               (f64.const 58)
              )
              (catch_all
               (call $44
                (f64.convert_i32_s
                 (i32.atomic.rmw16.cmpxchg_u acqrel offset=22
                  (i64.and
                   (i64.const -29)
                   (i64.const 15)
                  )
                  (if (result i32)
                   (i32.const 4194304)
                   (then
                    (i32.const 33554432)
                   )
                   (else
                    (return)
                   )
                  )
                  (i32.const 2)
                 )
                )
               )
              )
             )
            )
            (f64.const 4290066241)
           )
          )
         )
         (else
          (nop)
         )
        )
        (local.get $5)
       )
      )
     )
     (then
      (drop
       (local.get $8)
      )
     )
     (else
      (table.set $1
       (i32.const 3)
       (local.tee $14
        (block $block3 (result (ref exn))
         (try_table (catch_all_ref $block3)
          (throw $tag$1)
         )
         (unreachable)
        )
       )
      )
      (table.set $1
       (i32.const 1)
       (block $block4 (result (ref exn))
        (try_table (catch_all_ref $block4)
         (throw $tag$1)
        )
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (func $3 (type $11) (param $0 exnref) (param $1 i32) (param $2 (ref string)) (param $3 (ref $0)) (param $4 (ref string)) (param $5 f32) (param $6 (ref $1)) (result i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 i32)
  (local $12 i32)
  (local $13 f32)
  (local $14 f32)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 (ref struct))
  (local $19 (ref $0))
  (local $20 eqref)
  (local $21 arrayref)
  (local $22 structref)
  (local.set $5
   (call $43
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $11
   (local.tee $11
    (i32.const 1851)
   )
  )
  (return
   (local.get $11)
  )
 )
 (func $4 (type $21) (param $0 (ref eq)) (result i64)
  (local $1 f32)
  (local $2 arrayref)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result i64)
   (nop)
   (i64.const -4294967294)
  )
 )
 (func $5 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $4
    (array.new_fixed $4 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $6 (type $22) (param $0 f32) (param $1 anyref) (param $2 f32) (param $3 arrayref) (result i64 i64)
  (local $4 (ref $0))
  (local $5 (ref $0))
  (local $6 i64)
  (local $7 i64)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (local.set $0
   (call $43
    (local.get $0)
   )
  )
  (local.set $2
   (call $43
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (if (type $6) (result i64 i64)
   (f64.ge
    (f64.const 9223372036854775808)
    (f64.const 13637)
   )
   (then
    (call $fimport$0
     (i32.const 185)
    )
    (tuple.make 2
     (i64.const -98)
     (i64.const -58)
    )
   )
   (else
    (nop)
    (unreachable)
   )
  )
 )
 (func $7 (type $2)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f32)
  (local $10 i64)
  (local $11 i64)
  (local $12 f64)
  (local $13 (ref null $0))
  (local $14 (ref null $0))
  (local $15 (ref null $1))
  (local $16 (ref $1))
  (local $17 structref)
  (local $18 (ref string))
  (local $19 (ref string))
  (local $20 (ref string))
  (local $21 (ref string))
  (local $22 (ref none))
  (local $23 (ref $12))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $16
   (struct.new_default $1)
  )
  (local.set $13
   (ref.as_non_null
    (local.get $13)
   )
  )
  (nop)
  (block $block
   (call $fimport$3
    (select
     (local.tee $9
      (f32.const 33860)
     )
     (local.get $9)
     (block (result i32)
      (drop
       (br_on_null $block
        (ref.func $7)
       )
      )
      (drop
       (br_on_null $block
        (struct.new_default $1)
       )
      )
      (block $block1 (result i32)
       (nop)
       (try_table (catch $tag$0 $block1) (catch $tag$0 $block1) (catch_all $block)
        (try_table (catch_all $block)
         (if
          (br_if $block1
           (local.get $0)
           (i32.eqz
            (call_ref $11
             (block $block2 (result (ref exn))
              (try_table (catch_all_ref $block2)
               (throw $tag$0
                (i32.const 230)
               )
              )
              (unreachable)
             )
             (i32.const -128)
             (string.const "\c2\a3\e2\82\ac\ed\bd\88")
             (ref.as_non_null
              (local.get $13)
             )
             (string.const "")
             (if (result f32)
              (i32.eqz
               (local.get $0)
              )
              (then
               (local.get $9)
              )
              (else
               (local.get $9)
              )
             )
             (local.get $16)
             (ref.func $3)
            )
           )
          )
          (then
           (call_ref $7
            (i64.atomic.load offset=3
             (i64.and
              (i64.const 24)
              (i64.const 15)
             )
            )
            (ref.func $fimport$2)
           )
           (br $block)
          )
          (else
           (drop
            (f32.const 0)
           )
           (throw $tag$0
            (block (result i32)
             (block
              (call_ref $2
               (ref.func $5)
              )
              (return)
             )
             (unreachable)
            )
           )
          )
         )
         (local.set $22
          (local.set $18
           (unreachable)
          )
         )
        )
        (local.set $16
         (local.set $16
          (local.set $23
           (local.set $21
            (unreachable)
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
  )
 )
 (func $8 (type $23) (result eqref)
  (local $0 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (array.new_fixed $4 0)
 )
 (func $9 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $8)
  )
 )
 (@binaryen.js.called)
 (func $10 (type $24) (param $0 f64) (param $1 (ref $1)) (result i64 f64)
  (local.set $0
   (call $44
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $fimport$7
   (ref.func $10)
  )
  (return
   (tuple.make 2
    (i64.const -2305843009213693952)
    (f64.const 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $11 (type $2)
  (local $0 exnref)
  (local $1 stringref)
  (local $2 externref)
  (local $3 (ref null $1))
  (local $4 (ref $0))
  (local $5 (ref $1))
  (local $6 (ref $1))
  (local $7 v128)
  (local $8 v128)
  (local $9 v128)
  (local $10 f32)
  (local $11 f32)
  (local $12 i64)
  (local $13 f64)
  (local $14 f64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (struct.new_default $1)
  )
 )
 (func $12 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $11)
 )
 (@binaryen.js.called)
 (func $13 (type $10) (param $0 funcref)
  (local $1 i32)
  (local $2 v128)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $fimport$6
   (array.new_fixed $4 0)
  )
  (table.set $1
   (i32.const 3)
   (ref.null noexn)
  )
 )
 (@binaryen.js.called)
 (func $14 (type $13) (param $0 eqref) (result (ref $0))
  (local $1 stringref)
  (local $2 (ref null $1))
  (local $3 (ref $0))
  (local $4 (ref null $0))
  (local $5 i31ref)
  (local $6 (ref $1))
  (local $7 (ref string))
  (local $8 (ref $12))
  (local $9 (ref func))
  (local $10 i64)
  (local $11 i64)
  (local $12 f64)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 v128)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (i32.atomic.load acqrel offset=22
     (i64.and
      (global.get $global$0)
      (i64.const 15)
     )
    )
   )
   (then
    (drop
     (i32.const 5)
    )
    (loop $label
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (call $fimport$4
      (call $44
       (f64.load offset=4 align=1
        (i64.and
         (i64.atomic.load32_u acqrel offset=22
          (i64.and
           (i64.rem_s
            (i64.const 70)
            (call $4
             (ref.i31
              (i32.const -28338)
             )
            )
           )
           (i64.const 15)
          )
         )
         (i64.const 15)
        )
       )
      )
     )
     (br $label)
    )
    (unreachable)
   )
   (else
    (block
     (call $fimport$7
      (local.tee $9
       (ref.cast (ref (exact $13))
        (ref.func $14)
       )
      )
     )
     (return
      (array.new_default $0
       (i32.and
        (i32.const 8)
        (i32.const 1023)
       )
      )
     )
    )
    (unreachable)
   )
  )
  (unreachable)
 )
 (func $15 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $14
    (ref.i31
     (i32.const -5154492)
    )
   )
  )
  (drop
   (call $14
    (ref.i31
     (i32.const 32767)
    )
   )
  )
  (drop
   (call $14
    (ref.null none)
   )
  )
 )
 (func $16 (type $14) (result i64)
  (local $0 (ref null $1))
  (local $1 (ref null $0))
  (local $2 (ref null $0))
  (local $3 (ref i31))
  (local $4 (ref $1))
  (local $5 (ref $1))
  (local $6 (ref $1))
  (local $7 stringref)
  (local $8 (ref array))
  (local $9 structref)
  (local $10 f32)
  (local $11 i32)
  (local $12 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result i64)
   (nop)
   (nop)
   (i64.atomic.load8_u acqrel offset=22
    (i64.and
     (i64.reinterpret_f64
      (if (result f64)
       (ref.is_null
        (struct.new_default $5)
       )
       (then
        (data.drop $4)
        (try_table
         (table.set $0
          (i64.const 3)
          (ref.func $16)
         )
         (return
          (i64.const 128)
         )
        )
        (unreachable)
       )
       (else
        (call $44
         (struct.get $1 4
          (struct.new $1
           (f32.const 67108864)
           (local.get $11)
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           (local.get $11)
           (f64.const 4294967179)
          )
         )
        )
       )
      )
     )
     (i64.const 15)
    )
   )
  )
 )
 (func $17 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $16)
  )
 )
 (@binaryen.js.called)
 (func $18 (type $25) (param $0 (ref string))
  (local $1 f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 (ref array))
  (local $5 (ref array))
  (local $6 (ref $0))
  (local $7 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $fimport$3
   (local.get $1)
  )
  (block $block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$1)
     )
     (then
      (global.set $global$1
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$1
     (i32.sub
      (global.get $global$1)
      (i32.const 1)
     )
    )
    (drop
     (array.new_default $0
      (i32.and
       (i32.const 17)
       (i32.const 1023)
      )
     )
    )
    (drop
     (array.new $0
      (ref.null none)
      (i32.and
       (i32.const 13)
       (i32.const 1023)
      )
     )
    )
    (loop
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (br_if $label
      (i32.eqz
       (select
        (ref.eq
         (ref.i31
          (i32.const -126)
         )
         (local.tee $5
          (array.new_fixed $4 0)
         )
        )
        (ref.eq
         (array.new_fixed $4 0)
         (local.get $7)
        )
        (local.get $3)
       )
      )
     )
     (br $block)
    )
    (local.set $6
     (unreachable)
    )
   )
   (local.set $4
    (unreachable)
   )
  )
 )
 (func $19 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $18
   (string.const "\c2\a3\c2\a3")
  )
  (call $18
   (string.const "")
  )
 )
 (func $20 (type $7) (param $0 i64)
  (local $1 i64)
  (local $2 v128)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 stringref)
  (local $8 (ref $1))
  (local $9 (ref string))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block $block
   (block
    (call $12)
    (br $block)
   )
   (local.set $9
    (local.set $8
     (unreachable)
    )
   )
  )
 )
 (func $21 (type $26) (param $0 (ref eq)) (param $1 (ref null $0)) (result f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 arrayref)
  (local $6 structref)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call_indirect $0 (type $3)
   (i32.atomic.load acqrel offset=3
    (i64.and
     (loop (result i64)
      (if
       (i32.eqz
        (global.get $global$1)
       )
       (then
        (global.set $global$1
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$1
       (i32.sub
        (global.get $global$1)
        (i32.const 1)
       )
      )
      (block (result i64)
       (call $fimport$5
        (call $45
         (v128.load offset=2 align=8
          (i64.and
           (i64.trunc_f32_s
            (try (result f32)
             (do
              (f32.const -3402823466385288598117041e14)
             )
             (catch $tag$0
              (local.set $4 (i32.eqz (pop i32)))
              (f32.const -17179869184)
             )
            )
           )
           (i64.const 15)
          )
         )
        )
       )
       (i64x2.extract_lane 1
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
      )
     )
     (i64.const 15)
    )
   )
   (i64.const 2)
  )
  (nop)
  (return
   (f32.const 0)
  )
 )
 (func $22 (type $27) (result (ref eq))
  (local $0 (ref eq))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.tee $0
   (struct.new_default $1)
  )
 )
 (func $23 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $22)
  )
 )
 (@binaryen.js.called)
 (func $24 (type $14) (result i64)
  (local $0 (ref null $0))
  (local $1 v128)
  (local $2 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (i64.const -9223372036854775807)
 )
 (func $25 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $24)
  )
  (drop
   (call $24)
  )
 )
 (func $26 (type $15) (result f32)
  (local $0 exnref)
  (local $1 (ref null $1))
  (local $2 (ref $1))
  (local $3 f32)
  (local $4 f64)
  (local $5 v128)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (f32.const 18446744073709551615)
  )
 )
 (func $27 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $43
    (call $26)
   )
  )
  (drop
   (call $43
    (call $26)
   )
  )
 )
 (func $28 (type $28) (param $0 anyref) (param $1 f64) (result exnref)
  (local $2 (ref null $0))
  (local $3 i32)
  (local $4 f32)
  (local.set $1
   (call $44
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block $block (result (ref exn))
   (try_table (catch_all_ref $block)
    (throw $tag$1)
   )
   (unreachable)
  )
 )
 (func $29 (type $8) (param $0 f64) (result i32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f64)
  (local $4 i32)
  (local $5 v128)
  (local $6 i64)
  (local $7 exnref)
  (local $8 exnref)
  (local $9 (ref $1))
  (local $10 eqref)
  (local.set $0
   (call $44
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (i32.const 16)
 )
 (func $30 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $29
    (f64.const -3)
   )
  )
  (drop
   (call $29
    (f64.const 2472557367)
   )
  )
 )
 (@binaryen.js.called)
 (func $31 (type $29) (param $0 f32) (param $1 (ref $0)) (result i64 eqref)
  (local $2 (ref null $0))
  (local $3 (ref $1))
  (local $4 (ref $0))
  (local $5 f32)
  (local.set $0
   (call $43
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (throw_ref
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$1)
    )
    (unreachable)
   )
  )
 )
 (func $32 (type $30) (param $0 f64) (param $1 i64) (result v128)
  (local $2 i64)
  (local $3 i32)
  (local.set $0
   (call $44
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
 )
 (func $33 (type $31) (param $0 (ref $0)) (result (ref $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (array.new_default $0
   (i32.and
    (i32.const 13)
    (i32.const 1023)
   )
  )
 )
 (func $34 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $33
    (array.new $0
     (array.new_default $0
      (i32.and
       (i32.const 8)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 7)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $33
    (array.new_default $0
     (i32.and
      (i32.const 10)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $35 (type $32) (result i32)
  (local $0 (ref $1))
  (local $1 f32)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (throw_ref
   (ref.null noexn)
  )
 )
 (@binaryen.js.called)
 (func $36 (type $33) (param $0 (ref $0)) (param $1 (ref struct)) (param $2 anyref) (result v128)
  (local $3 (ref $1))
  (local $4 (ref $1))
  (local $5 (ref $0))
  (local $6 (ref $0))
  (local $7 i31ref)
  (local $8 (ref null $1))
  (local $9 (ref null $0))
  (local $10 exnref)
  (local $11 f64)
  (local $12 f64)
  (local $13 f32)
  (local $14 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (throw $tag$0
   (ref.test (ref (exact $1))
    (struct.new_default $1)
   )
  )
 )
 (func $37 (type $2)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 v128)
  (local $11 f32)
  (local $12 f32)
  (local $13 (ref string))
  (local $14 (ref $1))
  (local $15 anyref)
  (local $16 (ref array))
  (local $17 (ref $0))
  (local $18 (ref $0))
  (local $19 (ref $0))
  (local $20 (ref null $0))
  (local $scratch i64)
  (local $scratch_22 f64)
  (local $scratch_23 (ref extern))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $14
   (struct.new_default $1)
  )
  (local.set $13
   (string.const "\f0\90\8d\88")
  )
  (drop
   (call $45
    (call $36
     (array.new $0
      (try (result (ref (exact $0)))
       (do
        (array.new $0
         (array.new_default $0
          (i32.and
           (i32.const 6)
           (i32.const 1023)
          )
         )
         (i32.and
          (i32.const 15)
          (i32.const 1023)
         )
        )
       )
       (catch $tag$0
        (local.set $0 (call $__popsink_0 (pop i32)))
        (loop $label
         (if
          (i32.eqz
           (global.get $global$1)
          )
          (then
           (global.set $global$1
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$1
          (i32.sub
           (global.get $global$1)
           (i32.const 1)
          )
         )
         (br_if $label
          (i32.eqz
           (i32.const -3072433)
          )
         )
         (call $fimport$2
          (i64.atomic.rmw32.xor_u offset=22
           (i64.and
            (loop (result i64)
             (if
              (i32.eqz
               (global.get $global$1)
              )
              (then
               (global.set $global$1
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$1
              (i32.sub
               (global.get $global$1)
               (i32.const 1)
              )
             )
             (try (result i64)
              (do
               (i64.const 16251)
              )
              (catch $tag$0
               (local.set $2 (i32.mul (pop i32) (i32.const -1)))
               (local.tee $8
                (i64x2.extract_lane 1
                 (try (result v128)
                  (do
                   (v128.const i32x4 0x0073ffff 0x00000040 0x003effff 0xbb2aff7f)
                  )
                  (catch $tag$0
                   (local.set $3 (i32.eqz (pop i32)))
                   (try_table (result v128) (catch_all $label)
                    (local.get $10)
                   )
                  )
                 )
                )
               )
              )
              (catch_all
               (select
                (i64x2.extract_lane 0
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
                (block (result i64)
                 (try_table (catch_all $label)
                  (local.set $1
                   (local.get $1)
                  )
                 )
                 (i64.trunc_f64_s
                  (f64.const -9223372036854775808)
                 )
                )
                (local.tee $1
                 (if (result i32)
                  (local.get $1)
                  (then
                   (i32.const -91)
                  )
                  (else
                   (i32.const 8)
                  )
                 )
                )
               )
              )
             )
            )
            (i64.const 15)
           )
           (i64.atomic.rmw16.or_u offset=2
            (i64.and
             (local.tee $8
              (i64.trunc_sat_f32_s
               (select
                (local.tee $11
                 (local.get $12)
                )
                (if (result f32)
                 (local.get $1)
                 (then
                  (loop $label1 (result f32)
                   (if
                    (i32.eqz
                     (global.get $global$1)
                    )
                    (then
                     (global.set $global$1
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$1
                    (i32.sub
                     (global.get $global$1)
                     (i32.const 1)
                    )
                   )
                   (nop)
                   (br_if $label1
                    (i32.eqz
                     (i32.const -71)
                    )
                   )
                   (local.get $11)
                  )
                 )
                 (else
                  (local.get $11)
                 )
                )
                (ref.eq
                 (ref.i31
                  (i32.const -5217173)
                 )
                 (array.new_fixed $4 0)
                )
               )
              )
             )
             (i64.const 15)
            )
            (block (result i64)
             (drop
              (block (result (ref extern))
               (local.set $scratch_23
                (global.get $gimport$0)
               )
               (drop
                (block (result f64)
                 (local.set $scratch_22
                  (f64.const -3402823466385288598117041e14)
                 )
                 (local.set $9
                  (block (result i64)
                   (local.set $scratch
                    (i64.const -17857)
                   )
                   (drop
                    (struct.new $1
                     (local.get $11)
                     (local.get $1)
                     (local.get $10)
                     (i32.const 941763401)
                     (f64.const 0)
                    )
                   )
                   (local.get $scratch)
                  )
                 )
                 (local.get $scratch_22)
                )
               )
               (local.get $scratch_23)
              )
             )
             (local.get $9)
            )
           )
          )
         )
        )
        (return)
       )
       (catch_all
        (call $fimport$0
         (i32.const -8388608)
        )
        (drop
         (if (result (ref null $0))
          (i32.lt_u
           (local.tee $6
            (try (result i32)
             (do
              (loop $label3 (result i32)
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (ref.eq
                (ref.i31
                 (i32.const 64)
                )
                (if (result (ref $1))
                 (i32.eqz
                  (block (result i32)
                   (call $fimport$1
                    (call_indirect $0 (type $8)
                     (f64.const 0)
                     (i64.const 8)
                    )
                   )
                   (stringview_wtf16.get_codeunit
                    (local.get $13)
                    (block (result i32)
                     (local.set $7
                      (ref.eq
                       (if (result (ref struct))
                        (struct.get_u $1 3
                         (local.tee $14
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                        (then
                         (struct.new_default $5)
                        )
                        (else
                         (local.get $14)
                        )
                       )
                       (loop $label2 (result (ref array))
                        (if
                         (i32.eqz
                          (global.get $global$1)
                         )
                         (then
                          (global.set $global$1
                           (i32.const 100)
                          )
                          (unreachable)
                         )
                        )
                        (global.set $global$1
                         (i32.sub
                          (global.get $global$1)
                          (i32.const 1)
                         )
                        )
                        (try
                         (do
                          (nop)
                         )
                         (catch_all
                          (call $fimport$6
                           (local.get $15)
                          )
                         )
                        )
                        (nop)
                        (br_if $label2
                         (i32.eqz
                          (local.get $1)
                         )
                        )
                        (local.tee $16
                         (local.tee $17
                          (local.tee $18
                           (if (result (ref $0))
                            (i32.eqz
                             (local.get $1)
                            )
                            (then
                             (ref.as_non_null
                              (local.tee $20
                               (ref.as_non_null
                                (ref.null none)
                               )
                              )
                             )
                            )
                            (else
                             (ref.as_non_null
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
                     (local.get $7)
                    )
                   )
                  )
                 )
                 (then
                  (atomic.fence)
                  (br $label3)
                 )
                 (else
                  (call_indirect $0 (type $3)
                   (local.get $1)
                   (i64.const 2)
                  )
                  (try_table (result (ref $1)) (catch_all $label3)
                   (local.get $14)
                  )
                 )
                )
               )
              )
             )
             (catch $tag$0
              (local.set $5 (select (pop i32) (local.get $5) (i32.const 7)))
              (if
               (i32.eqz
                (global.get $global$1)
               )
               (then
                (global.set $global$1
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$1
               (i32.sub
                (global.get $global$1)
                (i32.const 1)
               )
              )
              (call $fimport$6
               (ref.i31
                (i32.const 128)
               )
              )
              (call $fimport$4
               (call $44
                (f64.min
                 (f64.const 0)
                 (f64.const -1.1754943508222875e-38)
                )
               )
              )
              (return)
             )
            )
           )
           (array.len
            (local.tee $19
             (try (result (ref (exact $0)))
              (do
               (loop (result (ref (exact $0)))
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (call $fimport$1
                 (call_indirect $0 (type $8)
                  (f64.const 65425)
                  (i64.const 8)
                 )
                )
                (loop $label4
                 (if
                  (i32.eqz
                   (global.get $global$1)
                  )
                  (then
                   (global.set $global$1
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$1
                  (i32.sub
                   (global.get $global$1)
                   (i32.const 1)
                  )
                 )
                 (nop)
                 (nop)
                 (loop
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (try
                   (do
                    (nop)
                   )
                   (catch $tag$0
                    (local.set $4 (i32.eqz (pop i32)))
                    (call $fimport$4
                     (f64.const 65433)
                    )
                   )
                  )
                  (br $label4)
                 )
                 (local.set $13
                  (unreachable)
                 )
                )
                (unreachable)
               )
              )
              (catch_all
               (array.new $0
                (array.new $0
                 (array.new_default $0
                  (i32.and
                   (i32.const 15)
                   (i32.const 1023)
                  )
                 )
                 (i32.and
                  (i32.const 14)
                  (i32.const 1023)
                 )
                )
                (i32.and
                 (i32.const 16)
                 (i32.const 1023)
                )
               )
              )
             )
            )
           )
          )
          (then
           (array.get $0
            (local.get $19)
            (local.get $6)
           )
          )
          (else
           (array.new $0
            (array.new $0
             (array.new_default $0
              (i32.and
               (i32.const 0)
               (i32.const 1023)
              )
             )
             (i32.and
              (i32.const 13)
              (i32.const 1023)
             )
            )
            (i32.and
             (i32.const 3)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (drop
         (string.const "")
        )
        (loop $label5
         (if
          (i32.eqz
           (global.get $global$1)
          )
          (then
           (global.set $global$1
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$1
          (i32.sub
           (global.get $global$1)
           (i32.const 1)
          )
         )
         (atomic.fence acqrel)
         (br $label5)
        )
        (unreachable)
       )
      )
      (i32.and
       (i32.const 17)
       (i32.const 1023)
      )
     )
     (struct.new_default $5)
     (ref.i31
      (i32.const -26)
     )
    )
   )
  )
  (drop
   (call $45
    (call $36
     (array.new_default $0
      (i32.and
       (i32.const 16)
       (i32.const 1023)
      )
     )
     (struct.new_default $5)
     (ref.null none)
    )
   )
  )
  (drop
   (call $45
    (call $36
     (array.new_default $0
      (i32.and
       (i32.const 17)
       (i32.const 1023)
      )
     )
     (struct.new_default $5)
     (ref.i31
      (i32.const -7382178)
     )
    )
   )
  )
 )
 (func $38 (type $34) (result (ref null $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (array.new_default $0
   (i32.and
    (i32.const 14)
    (i32.const 1023)
   )
  )
 )
 (func $39 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $38)
  )
  (drop
   (call $38)
  )
 )
 (func $40 (type $35) (param $0 v128) (result f32)
  (local $1 v128)
  (local $2 v128)
  (local $3 externref)
  (local.set $0
   (call $45
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (f32.const -524288)
  )
 )
 (func $41 (type $2)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $43
    (call $40
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
   )
  )
 )
 (func $42 (type $15) (result f32)
  (local $0 (ref $0))
  (local $1 (ref $0))
  (local $2 structref)
  (local $3 eqref)
  (local $4 (ref null $1))
  (local $5 funcref)
  (local $6 funcref)
  (local $7 (ref null $0))
  (local $8 (ref null $0))
  (local $9 stringref)
  (local $10 i32)
  (local $11 f64)
  (local $12 f32)
  (local $13 f32)
  (local $14 f32)
  (local $scratch f32)
  (local $scratch_16 f64)
  (local $scratch_17 nullexnref)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $43
   (f32.max
    (call $43
     (f32.copysign
      (call $43
       (struct.get $1 0
        (struct.new_default $1)
       )
      )
      (block (result f32)
       (drop
        (block (result nullexnref)
         (local.set $scratch_17
          (ref.null noexn)
         )
         (drop
          (block (result f64)
           (local.set $scratch_16
            (f64.const -113)
           )
           (local.set $14
            (block (result f32)
             (local.set $scratch
              (f32.const -37)
             )
             (drop
              (i64.const -30450)
             )
             (local.get $scratch)
            )
           )
           (local.get $scratch_16)
          )
         )
         (local.get $scratch_17)
        )
       )
       (call $43
        (local.get $14)
       )
      )
     )
    )
    (if (result f32)
     (i32x4.extract_lane 1
      (v128.const i32x4 0x32318746 0x0100aa80 0x0f0100ff 0x588461ff)
     )
     (then
      (local.tee $12
       (local.get $13)
      )
     )
     (else
      (local.get $12)
     )
    )
   )
  )
 )
 (func $43 (type $36) (param $0 f32) (result f32)
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
 (func $44 (type $37) (param $0 f64) (result f64)
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
 (func $45 (type $38) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
