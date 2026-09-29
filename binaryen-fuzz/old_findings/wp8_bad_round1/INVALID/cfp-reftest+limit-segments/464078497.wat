(module
 (rec
  (type $0 (descriptor $3) (struct (field (ref $5)) (field (mut (ref $4)))))
  (type $1 (sub (struct (field (mut f64)) (field (mut i16)) (field f32) (field (mut (ref null $0))) (field (mut (ref null $1))))))
  (type $2 (sub (struct (field arrayref) (field arrayref))))
  (type $3 (sub (describes $0) (descriptor $4) (struct (field (mut (ref $4))) (field (mut (ref null $1))) (field (mut f64)))))
  (type $4 (describes $3) (struct (field f32)))
  (type $5 (sub (func (result (ref extern)))))
  (type $6 (sub final $2 (struct (field nullref) (field (ref array)) (field i16) (field (mut (ref null $1))) (field f32))))
 )
 (type $7 (array i8))
 (type $8 (func))
 (type $9 (struct))
 (type $10 (func (param i32)))
 (type $11 (func (param f32 arrayref i64) (result i64)))
 (type $12 (func (param i64)))
 (type $13 (func (param anyref)))
 (type $14 (array (mut i16)))
 (type $15 (func (param (ref null $4) funcref externref i32 (ref null $6)) (result (ref $4))))
 (type $16 (func (result f64 (ref string) f32 f32)))
 (type $17 (func (result i32 nullref)))
 (type $18 (func (param (ref null $6))))
 (type $19 (func (param exnref)))
 (type $20 (func (param f32)))
 (type $21 (func (param f64)))
 (type $22 (func (param v128)))
 (type $23 (func (param funcref)))
 (type $24 (func (param externref)))
 (type $25 (func (param exnref) (result (ref null $1))))
 (type $26 (func (result structref)))
 (type $27 (func (param (ref null $1) (ref $1) (ref $3) (ref array) exnref externref (ref $6)) (result eqref)))
 (type $28 (func (param i32 f32 (ref null $1) f32 (ref $2)) (result i64)))
 (type $29 (func (param i32 funcref v128 structref) (result (ref null $3))))
 (type $30 (func (param funcref f64 f64 f32 i32 i31ref) (result (ref null $4))))
 (type $31 (func (param f64 (ref null $5) (ref null $0)) (result (ref $4))))
 (type $32 (func (param (ref null $5) (ref $0) f64) (result (ref null $2))))
 (type $33 (func (result f32)))
 (type $34 (func (param f32) (result f32)))
 (type $35 (func (param f64) (result f64)))
 (type $36 (func (param v128) (result v128)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_28" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $10) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $10) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $20) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $21) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $22) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $13) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $23) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $24) (param externref)))
 (global $global$0 (mut (ref eq)) (array.new_fixed $7 0))
 (global $global$1 (mut f64) (f64.const 0.274))
 (global $global$2 (mut (ref null $0)) (struct.new_desc $0
  (ref.func $0)
  (struct.new_default $4)
  (struct.new_desc $3
   (struct.new $4
    (f32.const 2147483648)
   )
   (ref.null none)
   (f64.const -1797693134862315708145274e284)
   (struct.new $4
    (f32.const -2147483648)
   )
  )
 ))
 (global $global$3 i64 (i64.const 4))
 (global $global$4 (mut (ref null $0)) (struct.new_desc $0
  (ref.func $0)
  (struct.new $4
   (f32.const 4.7801927285228076e-29)
  )
  (struct.new_desc $3
   (struct.new $4
    (f32.const 135)
   )
   (struct.new_default $1)
   (f64.const -3402823466385288598117041e14)
   (struct.new_default $4)
  )
 ))
 (global $global$5 anyref (array.new_fixed $7 0))
 (global $global$6 i32 (i32.const 126))
 (global $global$7 (mut externref) (global.get $gimport$0))
 (global $global$8 (ref string) (string.const "\ed\a0\80\e2\82\ac\c2\a3"))
 (global $global$9 (ref $2) (struct.new $2
  (array.new_fixed $7 0)
  (array.new_fixed $7 0)
 ))
 (global $global$10 (mut i32) (i32.const 1))
 (global $global$11 (mut i64) (i64.const -430006))
 (global $global$12 (mut externref) (global.get $gimport$0))
 (global $global$13 i64 (i64.const 2147483649))
 (global $global$14 i32 (global.get $global$6))
 (global $global$15 i32 (i32.const 1073741824))
 (global $global$16 i64 (i64.const -60))
 (global $global$17 i64 (i64.const 4294967295))
 (global $global$18 (mut (ref $6)) (struct.new $6
  (ref.null none)
  (array.new_fixed $7 0)
  (i32.const -87)
  (ref.null none)
  (f32.const -0.996999979019165)
 ))
 (global $global$19 (ref $5) (ref.func $0))
 (global $global$20 (mut (ref $6)) (struct.new $6
  (ref.null none)
  (array.new_fixed $7 0)
  (global.get $global$14)
  (struct.new_default $1)
  (f32.const 0)
 ))
 (global $global$21 f64 (f64.const -8))
 (global $global$22 (mut f64) (global.get $global$21))
 (global $global$23 funcref (ref.func $0))
 (global $global$24 (ref null $6) (struct.new $6
  (ref.null none)
  (array.new_fixed $7 0)
  (i32.const -268435456)
  (struct.new $1
   (f64.const 0)
   (global.get $global$15)
   (f32.const 113)
   (struct.new_desc $0
    (ref.func $0)
    (struct.new_default $4)
    (struct.new_desc $3
     (struct.new_default $4)
     (struct.new_default $1)
     (f64.const 0)
     (struct.new_default $4)
    )
   )
   (struct.new $1
    (global.get $global$21)
    (i32.const 65536)
    (f32.const -11)
    (struct.new_desc $0
     (ref.func $0)
     (struct.new $4
      (f32.const 9223372036854775808)
     )
     (struct.new_desc $3
      (struct.new_default $4)
      (struct.new_default $1)
      (f64.const -49)
      (struct.new $4
       (f32.const 0)
      )
     )
    )
    (struct.new_default $1)
   )
  )
  (f32.const 2147483648)
 ))
 (global $global$25 i32 (global.get $global$15))
 (global $global$26 funcref (global.get $global$23))
 (global $global$27 f32 (f32.const 2.765000104904175))
 (global $global$28 i64 (i64.const -1))
 (global $global$29 i32 (global.get $global$15))
 (global $global$30 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 "q\bc{\97")
 (data $1 "\8f\14\8a\ca\0b\de")
 (table $0 18 funcref (ref.null nofunc))
 (table $1 6 exnref)
 (elem $0 (table $0) (i32.const 0) func $1 $1 $1 $3 $3 $3 $3 $4 $9 $11 $12 $15 $26 $31 $32 $32 $32 $32)
 (elem declare func $18 $19 $2 $21 $34 $5 $6 $8 $fimport$0 $fimport$2 $fimport$6)
 (tag $tag$0 (type $18) (param (ref null $6)))
 (tag $tag$1 (type $19) (param exnref))
 (tag $tag$2 (type $8))
 (export "global$_3" (global $global$4))
 (export "global$_4" (global $global$5))
 (export "global$_5" (global $global$6))
 (export "global$_6" (global $global$7))
 (export "global$_11" (global $global$11))
 (export "global$_14" (global $global$14))
 (export "global$_15" (global $global$15))
 (export "global$_17" (global $global$18))
 (export "global$_18" (global $global$19))
 (export "global$_20" (global $global$21))
 (export "tag$" (tag $tag$0))
 (export "func" (func $1))
 (export "func_invoker" (func $2))
 (export "func_13" (func $4))
 (export "func_13_invoker" (func $5))
 (export "func_15_invoker" (func $7))
 (export "func_17" (func $8))
 (export "func_18_invoker" (func $10))
 (export "func_21" (func $12))
 (export "func_21_invoker" (func $13))
 (export "func_24_invoker" (func $16))
 (export "func_26_invoker" (func $18))
 (export "func_28" (func $19))
 (export "func_28_invoker" (func $20))
 (export "func_31" (func $22))
 (export "func_32_invoker" (func $24))
 (export "func_35" (func $26))
 (export "func_35_invoker" (func $27))
 (export "func_37_invoker" (func $29))
 (export "func_41" (func $32))
 (export "func_41_invoker" (func $33))
 (func $0 (type $5) (result (ref extern))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $8)
  (local $0 (ref string))
  (local $1 exnref)
  (local $2 (ref $3))
  (local $3 (ref (exact $4)))
  (local $4 (ref (exact $4)))
  (local $5 v128)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (block $block
   (call $fimport$6
    (try (result (ref (exact $7)))
     (do
      (array.new_fixed $7 0)
     )
     (catch $tag$1
      (local.set $1 (call $__popsink_0 (pop exnref)))
      (call $fimport$6
       (select (result (ref struct))
        (try_table (result (ref $3)) (catch_all $block)
         (try_table (result (ref $3)) (catch_all $block)
          (local.tee $2
           (struct.new_desc $3
            (ref.as_non_null
             (ref.null none)
            )
            (ref.null none)
            (f64.const -29672)
            (local.tee $3
             (local.tee $4
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
         )
        )
        (struct.new $4
         (f32.const -1.18200738086216e-08)
        )
        (global.get $global$29)
       )
      )
      (br $block)
     )
     (catch_all
      (drop
       (br_on_null $block
        (struct.new_default $1)
       )
      )
      (try_table (result (ref (exact $7))) (catch_all $block)
       (array.new_fixed $7 0)
      )
     )
    )
   )
   (call $fimport$0
    (i32.const 0)
   )
  )
 )
 (func $2 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (call $1)
  (call $1)
  (call $1)
  (call $1)
  (call $1)
  (call $1)
 )
 (func $3 (type $11) (param $0 f32) (param $1 arrayref) (param $2 i64) (result i64)
  (local $3 f64)
  (local.set $0
   (call $35
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (block (result i64)
   (call_ref $10
    (global.get $global$10)
    (ref.func $fimport$0)
   )
   (i64.const -517588)
  )
 )
 (func $4 (type $5) (result (ref extern))
  (local $0 (ref struct))
  (local $1 stringref)
  (local $2 (ref null $4))
  (local $3 (ref null $5))
  (local $4 (ref null $2))
  (local $5 (ref null $2))
  (local $6 exnref)
  (local $7 exnref)
  (local $8 exnref)
  (local $9 exnref)
  (local $10 exnref)
  (local $11 (ref array))
  (local $12 (ref null $6))
  (local $13 (ref null $6))
  (local $14 f32)
  (local $15 v128)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (local $19 f64)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (loop $label1 (result i32)
     (if
      (i32.eqz
       (global.get $global$30)
      )
      (then
       (global.set $global$30
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$30
      (i32.sub
       (global.get $global$30)
       (i32.const 1)
      )
     )
     (loop $label (result i32)
      (if
       (i32.eqz
        (global.get $global$30)
       )
       (then
        (global.set $global$30
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$30
       (i32.sub
        (global.get $global$30)
        (i32.const 1)
       )
      )
      (nop)
      (local.set $18
       (local.get $18)
      )
      (drop
       (br_on_null $label
        (array.new_fixed $7 0)
       )
      )
      (drop
       (ref.i31
        (i32.const -134217729)
       )
      )
      (block
       (table.set $0
        (i32.const 8)
        (ref.func $3)
       )
       (br $label1)
      )
      (unreachable)
     )
    )
   )
   (then
    (block $block2
     (if
      (i32.eqz
       (global.get $global$15)
      )
      (then
       (block $block
        (nop)
        (try
         (do
          (f64.store offset=4 align=1
           (i64.and
            (local.get $17)
            (i64.const 15)
           )
           (local.tee $19
            (f64.const -20)
           )
          )
         )
         (catch $tag$1
          (local.set $7 (call_ref $__sinkT_0 (pop exnref) (ref.func $__popsink_0)))
          (memory.fill
           (i64.and
            (i64.trunc_sat_f32_s
             (call $35
              (f32x4.extract_lane 0
               (try (result v128)
                (do
                 (call $37
                  (i16x8.add_sat_s
                   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                   (local.tee $15
                    (v128.const i32x4 0xd4800000 0x41e00000 0x46a87600 0x470b0800)
                   )
                  )
                 )
                )
                (catch $tag$1
                 (throw $tag$1 (pop exnref))
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
               )
              )
             )
            )
            (i64.const 15)
           )
           (i8x16.extract_lane_u 11
            (loop $label2 (result v128)
             (if
              (i32.eqz
               (global.get $global$30)
              )
              (then
               (global.set $global$30
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$30
              (i32.sub
               (global.get $global$30)
               (i32.const 1)
              )
             )
             (nop)
             (call_indirect $0 (type $8)
              (i32.const 0)
             )
             (br_if $label2
              (if (result i32)
               (i32.eqz
                (i32.const -131072)
               )
               (then
                (select
                 (global.get $global$10)
                 (i32.atomic.load offset=4
                  (i64.and
                   (local.tee $17
                    (i64.extend32_s
                     (local.get $17)
                    )
                   )
                   (i64.const 15)
                  )
                 )
                 (global.get $global$10)
                )
               )
               (else
                (block $block1 (result i32)
                 (if
                  (string.measure_wtf16
                   (ref.cast (ref string)
                    (global.get $global$8)
                   )
                  )
                  (then
                   (br_if $block
                    (i32.eqz
                     (try_table (result i32) (catch_all $block)
                      (br_if $block1
                       (i32.const -113)
                       (global.get $global$15)
                      )
                     )
                    )
                   )
                   (block
                    (f32.store offset=2
                     (i64.and
                      (local.get $17)
                      (i64.const 15)
                     )
                     (local.tee $14
                      (local.get $14)
                     )
                    )
                    (br $block)
                   )
                   (unreachable)
                  )
                  (else
                   (br_if $block
                    (local.get $18)
                   )
                  )
                 )
                 (br $block2)
                )
               )
              )
             )
             (local.get $15)
            )
           )
           (i64.and
            (local.get $17)
            (if (result i64)
             (i32.eqz
              (i32.atomic.load8_u offset=22
               (i64.and
                (try_table (result i64) (catch_all $block)
                 (i64.const -78)
                )
                (i64.const 15)
               )
              )
             )
             (then
              (drop
               (struct.new_desc $3
                (struct.new $4
                 (f32.const 57981)
                )
                (struct.new_default $1)
                (select
                 (local.get $19)
                 (loop (result f64)
                  (if
                   (i32.eqz
                    (global.get $global$30)
                   )
                   (then
                    (global.set $global$30
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$30
                   (i32.sub
                    (global.get $global$30)
                    (i32.const 1)
                   )
                  )
                  (f64.const -3142605)
                 )
                 (local.get $18)
                )
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
              (loop $label3
               (if
                (i32.eqz
                 (global.get $global$30)
                )
                (then
                 (global.set $global$30
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$30
                (i32.sub
                 (global.get $global$30)
                 (i32.const 1)
                )
               )
               (block
                (drop
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (drop
                 (ref.null none)
                )
                (block
                 (nop)
                 (br $label3)
                )
                (unreachable)
               )
               (unreachable)
              )
              (unreachable)
             )
             (else
              (nop)
              (i64x2.extract_lane 1
               (call $37
                (v128.load offset=22 align=1
                 (i64.and
                  (loop (result i64)
                   (if
                    (i32.eqz
                     (global.get $global$30)
                    )
                    (then
                     (global.set $global$30
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$30
                    (i32.sub
                     (global.get $global$30)
                     (i32.const 1)
                    )
                   )
                   (block $block3 (result i64)
                    (nop)
                    (br_if $block3
                     (local.tee $17
                      (local.get $17)
                     )
                     (ref.is_null
                      (ref.as_non_null
                       (ref.null none)
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
             )
            )
           )
          )
         )
         (catch $tag$0
          (local.set $12 (select (result (ref null $6)) (pop (ref null $6)) (ref.null none) (i32.const 7)))
          (block
           (call $fimport$7
            (ref.func $2)
           )
           (br $block2)
          )
          (unreachable)
         )
         (catch_all
          (try
           (do
            (nop)
           )
           (catch $tag$1
            (drop (pop exnref))
            (drop
             (i32.atomic.load8_u acqrel offset=22
              (i64.and
               (loop $label4 (result i64)
                (if
                 (i32.eqz
                  (global.get $global$30)
                 )
                 (then
                  (global.set $global$30
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$30
                 (i32.sub
                  (global.get $global$30)
                  (i32.const 1)
                 )
                )
                (try
                 (do
                  (nop)
                 )
                 (catch $tag$0
                  (local.set $13 (select (result (ref null $6)) (pop (ref null $6)) (ref.null none) (i32.const 7)))
                  (drop
                   (call $35
                    (f32.convert_i32_s
                     (select
                      (local.get $18)
                      (local.get $18)
                      (f64.lt
                       (f64.const -9223372036854775808)
                       (f64.const -9223372036854775808)
                      )
                     )
                    )
                   )
                  )
                 )
                 (catch $tag$1
                  (throw $tag$1 (pop exnref))
                  (local.set $1
                   (ref.as_non_null
                    (local.tee $1
                     (ref.as_non_null
                      (local.get $1)
                     )
                    )
                   )
                  )
                 )
                 (catch_all
                  (call_indirect $0 (type $8)
                   (i32.const 0)
                  )
                 )
                )
                (br_if $label4
                 (i32.const -2147483647)
                )
                (i64.trunc_f32_s
                 (local.get $14)
                )
               )
               (i64.const 15)
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
  )
  (return
   (global.get $gimport$1)
  )
 )
 (func $5 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $4)
  )
 )
 (func $6 (type $5) (result (ref extern))
  (local $0 i32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (i32.const 220)
   )
   (then
    (drop
     (struct.new_default $4)
    )
    (call_ref $8
     (ref.func $5)
    )
   )
  )
  (block $block
   (br_table $block $block $block $block $block $block $block $block $block $block
    (local.tee $0
     (i32.const 1044082736)
    )
   )
  )
  (block
   (nop)
   (return
    (global.get $gimport$1)
   )
  )
  (unreachable)
 )
 (func $7 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
 )
 (func $8 (type $5) (result (ref extern))
  (local $0 i32)
  (local $1 v128)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (global.get $gimport$1)
 )
 (@binaryen.js.called)
 (func $9 (type $25) (param $0 exnref) (result (ref null $1))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (ref.cast (ref (exact $1))
   (struct.new $1
    (f64.const -1)
    (i32.const -131072)
    (f32.const 743167365204456488566784)
    (struct.new_desc $0
     (ref.func $4)
     (struct.new_default $4)
     (struct.new_desc $3
      (struct.new_default $4)
      (struct.new_default $1)
      (f64.const 0.819)
      (struct.new_default $4)
     )
    )
    (struct.new $1
     (f64.const 8796093022209)
     (i32.const -65534)
     (f32.const -14566)
     (struct.new_desc $0
      (ref.func $4)
      (struct.new $4
       (f32.const -9223372036854775808)
      )
      (struct.new_desc $3
       (struct.new $4
        (f32.const -58)
       )
       (struct.new $1
        (call $36
         (global.get $global$21)
        )
        (i32.const -32)
        (f32.const -18014398509481984)
        (struct.new_desc $0
         (ref.func $4)
         (struct.new_default $4)
         (struct.new_desc $3
          (ref.as_non_null
           (ref.null none)
          )
          (ref.as_non_null
           (ref.null none)
          )
          (call $36
           (global.get $global$22)
          )
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
        (struct.new $1
         (f64.const -1125899906842623.2)
         (i32.const 262144)
         (f32.const -96)
         (struct.new_desc $0
          (ref.func $8)
          (struct.new_default $4)
          (ref.as_non_null
           (ref.null none)
          )
         )
         (struct.new $1
          (call $36
           (global.get $global$21)
          )
          (global.get $global$15)
          (f32.const -32768)
          (ref.null none)
          (struct.new_default $1)
         )
        )
       )
       (call $36
        (global.get $global$22)
       )
       (struct.new_default $4)
      )
     )
     (struct.new $1
      (call $36
       (global.get $global$22)
      )
      (i32.const -104)
      (f32.const 2)
      (struct.new_desc $0
       (global.get $global$19)
       (struct.new_default $4)
       (struct.new_desc $3
        (struct.new $4
         (f32.const -281474976710656)
        )
        (struct.new_default $1)
        (f64.const 3.768)
        (struct.new $4
         (f32.const -9223372036854775808)
        )
       )
      )
      (struct.new_default $1)
     )
    )
   )
  )
 )
 (func $10 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $9
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (ref.null none)
      )
     )
     (unreachable)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $11 (type $26) (result structref)
  (local $0 (ref $3))
  (local $1 f32)
  (local $2 f32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (nop)
  (drop
   (call $36
    (global.get $global$21)
   )
  )
  (drop
   (i32.const 50805)
  )
  (drop
   (local.tee $1
    (local.tee $2
     (f32.const -2147483648)
    )
   )
  )
  (drop
   (struct.new_desc $0
    (global.get $global$19)
    (struct.new_default $4)
    (struct.new_desc $3
     (struct.new_default $4)
     (ref.null none)
     (call $36
      (global.get $global$21)
     )
     (ref.as_non_null
      (ref.null none)
     )
    )
   )
  )
  (loop
   (if
    (i32.eqz
     (global.get $global$30)
    )
    (then
     (global.set $global$30
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$30
    (i32.sub
     (global.get $global$30)
     (i32.const 1)
    )
   )
   (atomic.fence acqrel)
   (return
    (struct.new_default $9)
   )
  )
  (unreachable)
 )
 (func $12 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (call_indirect $0 (type $8)
   (i32.const 0)
  )
  (block $block
   (br_table $block $block $block $block $block $block $block $block $block $block
    (global.get $global$6)
   )
  )
  (unreachable)
 )
 (func $13 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (call $12)
  (call $12)
  (call $12)
 )
 (func $14 (type $5) (result (ref extern))
  (local $0 (ref struct))
  (local $1 arrayref)
  (local $2 v128)
  (local $3 v128)
  (local $4 f64)
  (local $5 i32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (try_table (result (ref extern))
   (global.get $gimport$1)
  )
 )
 (func $15 (type $27) (param $0 (ref null $1)) (param $1 (ref $1)) (param $2 (ref $3)) (param $3 (ref array)) (param $4 exnref) (param $5 externref) (param $6 (ref $6)) (result eqref)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 v128)
  (local $11 i32)
  (local $12 i31ref)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (return
   (ref.null none)
  )
 )
 (func $16 (type $8)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f32)
  (local $8 f32)
  (local $9 v128)
  (local $10 (ref null $1))
  (local $11 (ref $1))
  (local $12 (ref string))
  (local $13 (ref string))
  (local $14 (ref array))
  (local $15 (ref null $6))
  (local $16 (ref null $6))
  (local $17 (ref (exact $4)))
  (local $18 (ref extern))
  (local $19 (ref i31))
  (local $20 (ref $14))
  (local $21 (ref $14))
  (local $scratch (ref (exact $1)))
  (local $scratch_23 i64)
  (local $scratch_24 f32)
  (local $scratch_25 (ref (exact $7)))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $14
   (array.new_fixed $7 0)
  )
  (local.set $12
   (global.get $global$8)
  )
  (local.set $11
   (struct.new $1
    (f64.const 22)
    (global.get $global$10)
    (f32.const 0)
    (global.get $global$4)
    (struct.new_default $1)
   )
  )
  (drop
   (struct.new_default $1)
  )
  (drop
   (struct.new_default $1)
  )
  (drop
   (struct.new $4
    (f32.const -137438953472)
   )
  )
  (drop
   (loop (result (ref null $1))
    (if
     (i32.eqz
      (global.get $global$30)
     )
     (then
      (global.set $global$30
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$30
     (i32.sub
      (global.get $global$30)
      (i32.const 1)
     )
    )
    (call $fimport$6
     (array.new_fixed $7 0)
    )
    (loop $label
     (if
      (i32.eqz
       (global.get $global$30)
      )
      (then
       (global.set $global$30
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$30
      (i32.sub
       (global.get $global$30)
       (i32.const 1)
      )
     )
     (br $label)
    )
    (local.set $11
     (local.set $12
      (unreachable)
     )
    )
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_23
     (i64.const -4796)
    )
    (drop
     (block (result (ref (exact $1)))
      (local.set $scratch
       (struct.new_default $1)
      )
      (local.set $6
       (f64.const -4611686018427387904)
      )
      (local.get $scratch)
     )
    )
    (local.get $scratch_23)
   )
  )
  (drop
   (select
    (call $36
     (local.get $6)
    )
    (local.tee $5
     (f64.const 9223372036854775808)
    )
    (i16x8.extract_lane_u 5
     (block (result v128)
      (loop $label1
       (if
        (i32.eqz
         (global.get $global$30)
        )
        (then
         (global.set $global$30
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$30
        (i32.sub
         (global.get $global$30)
         (i32.const 1)
        )
       )
       (struct.set $3 0
        (try_table (result (ref (exact $3))) (catch_all $label1)
         (struct.new_desc $3
          (struct.new $4
           (f32.const 1099511627776)
          )
          (local.get $10)
          (call $36
           (global.get $global$21)
          )
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
        (struct.new_default $4)
       )
      )
      (nop)
      (if (result v128)
       (i32.eqz
        (i31.get_s
         (select (result (ref i31))
          (ref.i31
           (i32.const 32767)
          )
          (ref.i31
           (i32.const 65536)
          )
          (local.get $0)
         )
        )
       )
       (then
        (loop $label4
         (if
          (i32.eqz
           (global.get $global$30)
          )
          (then
           (global.set $global$30
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$30
          (i32.sub
           (global.get $global$30)
           (i32.const 1)
          )
         )
         (loop $label2
          (if
           (i32.eqz
            (global.get $global$30)
           )
           (then
            (global.set $global$30
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$30
           (i32.sub
            (global.get $global$30)
            (i32.const 1)
           )
          )
          (struct.set $1 0
           (local.get $11)
           (local.tee $4
            (call $36
             (f64.max
              (select
               (f64.const -34359738368.848)
               (local.get $5)
               (local.get $0)
              )
              (local.get $5)
             )
            )
           )
          )
          (call $5)
          (br_if $label2
           (i32.load offset=4
            (i64.and
             (local.get $3)
             (i64.const 15)
            )
           )
          )
         )
         (atomic.fence acqrel)
         (drop
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (block $block
          (if
           (i32.eqz
            (global.get $global$14)
           )
           (then
            (nop)
           )
           (else
            (nop)
            (br_if $block
             (i32.const -5058)
            )
           )
          )
          (loop $label3
           (if
            (i32.eqz
             (global.get $global$30)
            )
            (then
             (global.set $global$30
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$30
            (i32.sub
             (global.get $global$30)
             (i32.const 1)
            )
           )
           (nop)
           (nop)
           (call_indirect $0 (type $8)
            (i32.const 0)
           )
           (br_if $label3
            (i32.eqz
             (ref.eq
              (loop (result (ref (exact $7)))
               (if
                (i32.eqz
                 (global.get $global$30)
                )
                (then
                 (global.set $global$30
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$30
                (i32.sub
                 (global.get $global$30)
                 (i32.const 1)
                )
               )
               (array.new_fixed $7 0)
              )
              (try (result (ref array))
               (do
                (drop
                 (br_on_null $block
                  (ref.i31
                   (i32.const -65535)
                  )
                 )
                )
                (local.tee $14
                 (array.new_fixed $7 0)
                )
               )
               (catch $tag$0
                (drop (ref.eq (pop (ref null $6)) (ref.null none)))
                (local.get $14)
               )
               (catch_all
                (array.new_fixed $7 0)
               )
              )
             )
            )
           )
          )
          (struct.set $1 1
           (local.get $11)
           (i32.const -20175)
          )
         )
         (if
          (i32.load offset=22 align=1
           (i64.and
            (local.get $3)
            (i64.const 15)
           )
          )
          (then
           (nop)
          )
         )
         (br_if $label4
          (i32.eqz
           (local.get $0)
          )
         )
         (nop)
         (if
          (i8x16.extract_lane_s 10
           (block (result v128)
            (nop)
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
          )
          (then
           (local.set $5
            (call $36
             (f64x2.extract_lane 0
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
            )
           )
           (memory.init $0
            (i64.and
             (global.get $global$11)
             (i64.const 15)
            )
            (i32.const 3)
            (i32.const 0)
           )
          )
         )
         (drop
          (block (result (ref (exact $7)))
           (local.set $scratch_25
            (array.new_fixed $7 0)
           )
           (drop
            (block (result f32)
             (local.set $scratch_24
              (f32.const 288230376151711744)
             )
             (local.set $9
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
             (local.get $scratch_24)
            )
           )
           (local.get $scratch_25)
          )
         )
         (drop
          (call $37
           (local.get $9)
          )
         )
         (block
          (nop)
          (return)
         )
         (unreachable)
        )
        (unreachable)
       )
       (else
        (nop)
        (v128.const i32x4 0x0000007f 0x00000000 0x0000654d 0x00000000)
       )
      )
     )
    )
   )
  )
  (loop $label5
   (if
    (i32.eqz
     (global.get $global$30)
    )
    (then
     (global.set $global$30
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$30
    (i32.sub
     (global.get $global$30)
     (i32.const 1)
    )
   )
   (if
    (i32.eqz
     (global.get $global$6)
    )
    (then
     (try_table (catch_all $label5)
      (call $1)
     )
    )
    (else
     (block $block1
      (local.set $0
       (if (result i32)
        (local.tee $0
         (string.measure_wtf16
          (global.get $global$8)
         )
        )
        (then
         (global.get $global$6)
        )
        (else
         (struct.get_u $6 2
          (ref.as_non_null
           (local.tee $16
            (if (result (ref none))
             (i32.eqz
              (i32.load16_u offset=22
               (i64.and
                (local.tee $3
                 (i64.const -85)
                )
                (i64.const 15)
               )
              )
             )
             (then
              (call $fimport$8
               (if (result (ref extern))
                (local.get $0)
                (then
                 (call_ref $8
                  (ref.func $12)
                 )
                 (local.tee $18
                  (string.const "\ed\a0\80")
                 )
                )
                (else
                 (global.get $gimport$1)
                )
               )
              )
              (br $block1)
             )
             (else
              (call $fimport$0
               (i32.const 128)
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
       )
      )
      (if
       (i32.eqz
        (i32.const -92)
       )
       (then
        (nop)
       )
      )
     )
    )
   )
   (br $label5)
  )
  (local.set $21
   (local.set $20
    (local.set $13
     (local.set $11
      (local.set $19
       (local.set $17
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $17 (type $28) (param $0 i32) (param $1 f32) (param $2 (ref null $1)) (param $3 f32) (param $4 (ref $2)) (result i64)
  (local $5 f32)
  (local $6 f64)
  (local $7 i32)
  (local $8 funcref)
  (local $9 (ref null $3))
  (local.set $1
   (call $35
    (local.get $1)
   )
  )
  (local.set $3
   (call $35
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (block (result i64)
   (nop)
   (i64.const 4294398251)
  )
 )
 (func $18 (type $8)
  (local $0 v128)
  (local $1 v128)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 (ref null $1))
  (local $6 (ref $0))
  (local $scratch (tuple f64 (ref string) f32 f32))
  (local $scratch_8 f32)
  (local $scratch_9 (ref string))
  (local $scratch_10 f64)
  (local $scratch_11 f64)
  (local $scratch_12 i64)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $17
    (i32.const -524288)
    (f32.const 511.135986328125)
    (struct.new $1
     (try_table (result f64)
      (call $36
       (global.get $global$22)
      )
     )
     (i8x16.extract_lane_s 7
      (local.tee $0
       (select
        (local.get $1)
        (call $37
         (v128.load offset=22
          (i64.and
           (i64.const -32767)
           (i64.const 15)
          )
         )
        )
        (global.get $global$15)
       )
      )
     )
     (call $35
      (f32.convert_i64_s
       (i64.rotl
        (local.tee $2
         (loop $label1 (result i64)
          (if
           (i32.eqz
            (global.get $global$30)
           )
           (then
            (global.set $global$30
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$30
           (i32.sub
            (global.get $global$30)
            (i32.const 1)
           )
          )
          (if (result i64)
           (i32.eqz
            (string.measure_wtf16
             (global.get $global$8)
            )
           )
           (then
            (nop)
            (block $block
             (struct.set $1 0
              (struct.new $1
               (f64.const 2.168)
               (i32.const -128)
               (f32.const 2147483648)
               (struct.new_desc $0
                (ref.as_non_null
                 (ref.null nofunc)
                )
                (ref.as_non_null
                 (ref.null none)
                )
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (struct.new_default $1)
              )
              (call $36
               (block (result f64)
                (local.set $scratch_10
                 (tuple.extract 4 0
                  (local.tee $scratch
                   (if (type $16) (result f64 (ref string) f32 f32)
                    (i32.eqz
                     (loop $label (result i32)
                      (if
                       (i32.eqz
                        (global.get $global$30)
                       )
                       (then
                        (global.set $global$30
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$30
                       (i32.sub
                        (global.get $global$30)
                        (i32.const 1)
                       )
                      )
                      (f32.store offset=4 align=1
                       (i64.and
                        (i64.const -127)
                        (i64.const 15)
                       )
                       (f32.const 1364666496)
                      )
                      (br_if $label
                       (local.get $4)
                      )
                      (i32.const -21703)
                     )
                    )
                    (then
                     (table.set $0
                      (i32.const 8)
                      (ref.as_non_null
                       (ref.null nofunc)
                      )
                     )
                     (br $block)
                    )
                    (else
                     (tuple.make 4
                      (f64.const 0)
                      (string.const "\e2\82\ac")
                      (f32.const 44)
                      (f32.const 1048576)
                     )
                    )
                   )
                  )
                 )
                )
                (drop
                 (block (result (ref string))
                  (local.set $scratch_9
                   (tuple.extract 4 1
                    (local.get $scratch)
                   )
                  )
                  (drop
                   (block (result f32)
                    (local.set $scratch_8
                     (tuple.extract 4 2
                      (local.get $scratch)
                     )
                    )
                    (drop
                     (tuple.extract 4 3
                      (local.get $scratch)
                     )
                    )
                    (local.get $scratch_8)
                   )
                  )
                  (local.get $scratch_9)
                 )
                )
                (local.get $scratch_10)
               )
              )
             )
            )
            (local.set $scratch_12
             (i64.const -128)
            )
            (drop
             (block (result f64)
              (local.set $scratch_11
               (f64.const 0)
              )
              (drop
               (i32.const 0)
              )
              (local.get $scratch_11)
             )
            )
            (local.get $scratch_12)
           )
           (else
            (struct.set $1 3
             (ref.as_non_null
              (local.tee $5
               (struct.new_default $1)
              )
             )
             (struct.new_desc $0
              (global.get $global$19)
              (struct.new $4
               (f32.const -2147483648)
              )
              (struct.new_desc $3
               (ref.as_non_null
                (ref.null none)
               )
               (ref.null none)
               (f64.const 0)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (if (result i64)
             (i32.eqz
              (memory.atomic.notify offset=2
               (i64.and
                (local.get $3)
                (i64.const 15)
               )
               (ref.is_null
                (ref.cast (ref $1)
                 (block (result (ref $1))
                  (nop)
                  (ref.as_non_null
                   (local.get $5)
                  )
                 )
                )
               )
              )
             )
             (then
              (i64.atomic.load acqrel offset=22
               (i64.and
                (i64.popcnt
                 (try_table (result i64) (catch_all $label1)
                  (i64.const 65502)
                 )
                )
                (i64.const 15)
               )
              )
             )
             (else
              (global.get $global$3)
             )
            )
           )
          )
         )
        )
        (i64.const 4294966547)
       )
      )
     )
     (local.tee $6
      (struct.new_desc $0
       (ref.func $6)
       (struct.new_default $4)
       (struct.new_desc $3
        (struct.new $4
         (f32.const 0)
        )
        (struct.new $1
         (f64.const 9223372036854775808)
         (local.get $4)
         (f32.const 0)
         (ref.null none)
         (struct.new $1
          (f64.const -2147483646)
          (global.get $global$14)
          (f32.const -1)
          (struct.new_desc $0
           (ref.func $8)
           (struct.new_default $4)
           (struct.new_desc $3
            (ref.as_non_null
             (ref.null none)
            )
            (ref.as_non_null
             (local.get $5)
            )
            (f64.const 0)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (ref.null none)
         )
        )
        (f64.const 4294967181)
        (struct.new_default $4)
       )
      )
     )
     (ref.null none)
    )
    (f32.const -25)
    (struct.new_default $2)
   )
  )
 )
 (func $19 (type $5) (result (ref extern))
  (local $0 v128)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$30)
    )
    (then
     (global.set $global$30
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$30
    (i32.sub
     (global.get $global$30)
     (i32.const 1)
    )
   )
   (block
    (drop
     (i64.const 4353)
    )
    (loop
     (if
      (i32.eqz
       (global.get $global$30)
      )
      (then
       (global.set $global$30
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$30
      (i32.sub
       (global.get $global$30)
       (i32.const 1)
      )
     )
     (call $fimport$6
      (array.new_fixed $7 0)
     )
     (br $label)
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $20 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $19)
  )
  (drop
   (call $19)
  )
  (drop
   (call $19)
  )
 )
 (@binaryen.js.called)
 (func $21 (type $5) (result (ref extern))
  (local $0 structref)
  (local $1 structref)
  (local $2 (ref struct))
  (local $3 (ref $2))
  (local $4 (ref eq))
  (local $5 eqref)
  (local $6 (ref null $0))
  (local $7 (ref null $6))
  (local $8 v128)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f64)
  (local $13 f64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $3
   (global.get $global$9)
  )
  (if
   (i32.eqz
    (string.eq
     (string.const "")
     (global.get $global$8)
    )
   )
   (then
    (call_ref $12
     (local.get $15)
     (ref.func $fimport$2)
    )
    (nop)
    (nop)
   )
   (else
    (nop)
    (call_ref $13
     (local.get $3)
     (ref.func $fimport$6)
    )
   )
  )
  (return
   (string.const "\ed\bd\88")
  )
 )
 (func $22 (type $29) (param $0 i32) (param $1 funcref) (param $2 v128) (param $3 structref) (result (ref null $3))
  (local $4 (ref $6))
  (local $5 (ref null $0))
  (local $6 arrayref)
  (local $7 (ref $5))
  (local $8 (ref $3))
  (local $9 i64)
  (local $10 f32)
  (local.set $2
   (call $37
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $4
   (struct.new $6
    (ref.null none)
    (array.new_fixed $7 0)
    (local.get $0)
    (struct.new_default $1)
    (f32.const 0)
   )
  )
  (block (result (ref $3))
   (call $fimport$2
    (loop $label1 (result i64)
     (if
      (i32.eqz
       (global.get $global$30)
      )
      (then
       (global.set $global$30
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$30
      (i32.sub
       (global.get $global$30)
       (i32.const 1)
      )
     )
     (block $block
      (loop $label
       (if
        (i32.eqz
         (global.get $global$30)
        )
        (then
         (global.set $global$30
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$30
        (i32.sub
         (global.get $global$30)
         (i32.const 1)
        )
       )
       (memory.fill
        (i64.and
         (block (result i64)
          (local.tee $9
           (loop (result i64)
            (if
             (i32.eqz
              (global.get $global$30)
             )
             (then
              (global.set $global$30
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$30
             (i32.sub
              (global.get $global$30)
              (i32.const 1)
             )
            )
            (i64.const -9223372036854775808)
           )
          )
         )
         (i64.const 15)
        )
        (global.get $global$10)
        (block (result i64)
         (drop
          (br_on_null $block
           (local.tee $5
            (ref.cast (ref none)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
         )
         (if (result i64)
          (i32.eqz
           (i32.atomic.load offset=4
            (i64.and
             (local.tee $9
              (call_indirect $0 (type $11)
               (call $35
                (f32.sub
                 (local.get $10)
                 (if (result f32)
                  (local.get $0)
                  (then
                   (local.get $10)
                  )
                  (else
                   (f32.const -8796093022208)
                  )
                 )
                )
               )
               (local.tee $6
                (array.new_fixed $7 0)
               )
               (block (result i64)
                (drop
                 (br_on_null $label
                  (loop (result (ref $6))
                   (if
                    (i32.eqz
                     (global.get $global$30)
                    )
                    (then
                     (global.set $global$30
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$30
                    (i32.sub
                     (global.get $global$30)
                     (i32.const 1)
                    )
                   )
                   (local.get $4)
                  )
                 )
                )
                (i64.div_u
                 (local.get $9)
                 (i64.const -24050)
                )
               )
               (i32.const 3)
              )
             )
             (i64.const 15)
            )
           )
          )
          (then
           (i64.const -126)
          )
          (else
           (nop)
           (br $label1)
          )
         )
        )
       )
       (if
        (i32.eqz
         (global.get $global$30)
        )
        (then
         (global.set $global$30
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$30
        (i32.sub
         (global.get $global$30)
         (i32.const 1)
        )
       )
       (block
        (if
         (i32.eqz
          (global.get $global$30)
         )
         (then
          (global.set $global$30
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$30
         (i32.sub
          (global.get $global$30)
          (i32.const 1)
         )
        )
        (call $fimport$7
         (ref.null nofunc)
        )
        (call $fimport$8
         (select (result (ref extern))
          (if (result (ref string))
           (i32.eqz
            (local.get $0)
           )
           (then
            (drop
             (br_on_null $label
              (block (result (ref $5))
               (nop)
               (local.tee $7
                (ref.as_non_null
                 (ref.null nofunc)
                )
               )
              )
             )
            )
            (string.const "")
           )
           (else
            (call $fimport$2
             (local.tee $9
              (local.get $9)
             )
            )
            (string.const "\ed\a0\80320\ed\a0\80")
           )
          )
          (call $21)
          (ref.eq
           (struct.new_desc $0
            (ref.as_non_null
             (ref.null nofunc)
            )
            (ref.as_non_null
             (ref.null none)
            )
            (ref.as_non_null
             (ref.null none)
            )
           )
           (ref.i31
            (i32.const 32767)
           )
          )
         )
        )
        (block
         (br $block)
        )
        (unreachable)
       )
       (unreachable)
      )
      (local.set $8
       (unreachable)
      )
     )
     (br_if $label1
      (local.get $0)
     )
     (i64.atomic.load offset=22
      (i64.and
       (try_table (result i64) (catch_all $label1)
        (try_table (result i64) (catch_all $label1)
         (i64.atomic.load16_u acqrel offset=3
          (i64.and
           (i64x2.extract_lane 0
            (local.get $2)
           )
           (i64.const 15)
          )
         )
        )
       )
       (i64.const 15)
      )
     )
    )
   )
   (return
    (struct.new_desc $3
     (struct.new_default $4)
     (struct.new $1
      (f64.const 35184372088832)
      (local.get $0)
      (local.get $10)
      (struct.new_desc $0
       (ref.func $19)
       (struct.new_default $4)
       (struct.new_desc $3
        (struct.new_default $4)
        (struct.new $1
         (f64.const 0)
         (global.get $global$10)
         (f32.const 512)
         (struct.new_desc $0
          (global.get $global$19)
          (struct.new $4
           (local.get $10)
          )
          (struct.new_desc $3
           (struct.new $4
            (f32.const -9223372036854775808)
           )
           (struct.new_default $1)
           (f64.const 4290251555)
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
         (struct.new $1
          (f64.const -1)
          (local.get $0)
          (f32.const 0)
          (global.get $global$4)
          (struct.new $1
           (f64.const 0)
           (local.get $0)
           (f32.const 4294955776)
           (local.get $5)
           (struct.new $1
            (f64.const 65487)
            (global.get $global$25)
            (local.get $10)
            (global.get $global$4)
            (struct.new_default $1)
           )
          )
         )
        )
        (f64.const 4294967187)
        (struct.new $4
         (local.get $10)
        )
       )
      )
      (ref.null none)
     )
     (call $36
      (global.get $global$22)
     )
     (struct.new $4
      (f32.const 0)
     )
    )
   )
  )
 )
 (func $23 (type $5) (result (ref extern))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (nop)
  (nop)
  (block $block
   (br_if $block
    (i32.load8_s offset=22
     (i64.and
      (i64.load
       (i64.and
        (i64.const -128)
        (i64.const 15)
       )
      )
      (i64.const 15)
     )
    )
   )
  )
  (throw_ref
   (block $block1 (result (ref exn))
    (try_table (catch_all_ref $block1)
     (throw $tag$2)
    )
    (unreachable)
   )
  )
 )
 (func $24 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $23)
  )
  (drop
   (call $23)
  )
  (drop
   (call $23)
  )
 )
 (@binaryen.js.called)
 (func $25 (type $30) (param $0 funcref) (param $1 f64) (param $2 f64) (param $3 f32) (param $4 i32) (param $5 i31ref) (result (ref null $4))
  (local.set $1
   (call $36
    (local.get $1)
   )
  )
  (local.set $2
   (call $36
    (local.get $2)
   )
  )
  (local.set $3
   (call $35
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $4)))
   (call $fimport$0
    (i32.const -32769)
   )
   (table.set $1
    (i32.const 5)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1
       (ref.null noexn)
      )
     )
     (unreachable)
    )
   )
   (struct.new $4
    (f32.const 217)
   )
  )
 )
 (func $26 (type $5) (result (ref extern))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (string.const "\ed\bd\88")
 )
 (func $27 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $26)
  )
 )
 (func $28 (type $31) (param $0 f64) (param $1 (ref null $5)) (param $2 (ref null $0)) (result (ref $4))
  (local $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 (ref $4))
  (local.set $0
   (call $36
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.tee $6
   (struct.new $4
    (local.tee $4
     (local.get $5)
    )
   )
  )
 )
 (func $29 (type $8)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 (ref string))
  (local $4 (ref none))
  (local $5 (ref null $6))
  (local $6 (ref null $6))
  (local $7 exnref)
  (local $8 structref)
  (local $9 nullref)
  (local $10 (ref $0))
  (local $11 (ref (exact $3)))
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (drop
   (call $28
    (f64.const 0)
    (ref.func $4)
    (struct.new_desc $0
     (ref.func $4)
     (loop $label3 (result (ref (exact $4)))
      (if
       (i32.eqz
        (global.get $global$30)
       )
       (then
        (global.set $global$30
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$30
       (i32.sub
        (global.get $global$30)
        (i32.const 1)
       )
      )
      (if
       (i32.eqz
        (global.get $global$30)
       )
       (then
        (global.set $global$30
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$30
       (i32.sub
        (global.get $global$30)
        (i32.const 1)
       )
      )
      (block $block1
       (try
        (do
         (if
          (i32.eqz
           (i31.get_u
            (ref.cast (ref i31)
             (ref.i31
              (i32.const -4512391)
             )
            )
           )
          )
          (then
           (block $block
            (nop)
            (loop $label
             (if
              (i32.eqz
               (global.get $global$30)
              )
              (then
               (global.set $global$30
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$30
              (i32.sub
               (global.get $global$30)
               (i32.const 1)
              )
             )
             (table.set $0
              (i32.const 5)
              (ref.func $4)
             )
             (br_if $label
              (i32.eqz
               (i32.const -103)
              )
             )
            )
            (block
             (loop $label1
              (if
               (i32.eqz
                (global.get $global$30)
               )
               (then
                (global.set $global$30
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$30
               (i32.sub
                (global.get $global$30)
                (i32.const 1)
               )
              )
              (nop)
              (br_if $label1
               (i32.eqz
                (i32.const -19875)
               )
              )
             )
             (if
              (i32.eqz
               (i32.eq
                (local.tee $0
                 (i31.get_u
                  (ref.i31
                   (i32.const 0)
                  )
                 )
                )
                (local.get $0)
               )
              )
              (then
               (nop)
               (drop
                (block (result i64)
                 (local.set $scratch
                  (i64.const -9223372036854775808)
                 )
                 (drop
                  (i64.const -9)
                 )
                 (local.get $scratch)
                )
               )
              )
              (else
               (local.set $3
                (string.const "")
               )
               (br_if $block
                (if (result i32)
                 (i32.eqz
                  (if (result i32)
                   (i32.lt_u
                    (i32.add
                     (local.tee $1
                      (i32.const -1024)
                     )
                     (local.tee $2
                      (string.measure_wtf16
                       (local.get $3)
                      )
                     )
                    )
                    (array.len
                     (local.tee $4
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                   )
                   (then
                    (string.encode_wtf16_array
                     (local.get $3)
                     (local.get $4)
                     (local.get $1)
                    )
                   )
                   (else
                    (local.get $0)
                   )
                  )
                 )
                 (then
                  (i32.const -67)
                 )
                 (else
                  (i32.const -32767)
                 )
                )
               )
              )
             )
             (br $block)
            )
            (unreachable)
           )
          )
         )
        )
        (catch $tag$0
         (drop (ref.test (ref $6) (pop (ref null $6))))
         (br_if $block1
          (i32.eqz
           (local.get $0)
          )
         )
        )
        (catch $tag$1
         (local.set $7 (ref.as_non_null (pop exnref)))
         (call $fimport$6
          (if (result (ref (exact $0)))
           (ref.test (ref none)
            (array.new_fixed $7 0)
           )
           (then
            (drop
             (br_on_null $block1
              (try (result (ref (exact $9)))
               (do
                (struct.new_default $9)
               )
               (catch $tag$0
                (drop (struct.get $6 0 (pop (ref null $6))))
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (catch_all
                (struct.new_default $9)
               )
              )
             )
            )
            (memory.fill
             (i64.and
              (i64.trunc_f32_s
               (call $35
                (f32.convert_i32_u
                 (local.get $0)
                )
               )
              )
              (i64.const 15)
             )
             (local.tee $0
              (local.get $0)
             )
             (i64.const -55)
            )
            (struct.new_desc $0
             (global.get $global$19)
             (struct.new $4
              (f32.const -0.23800000548362732)
             )
             (struct.new_desc $3
              (struct.new_default $4)
              (struct.new $1
               (f64.const -7923344)
               (global.get $global$29)
               (f32.const 8)
               (ref.null none)
               (ref.null none)
              )
              (f64.const -0.196)
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
           (else
            (call_ref $8
             (ref.func $18)
            )
            (struct.new_desc $0
             (ref.func $19)
             (struct.new $4
              (f32.const 0.12600000202655792)
             )
             (struct.new_desc $3
              (struct.new $4
               (f32.const 24)
              )
              (struct.new_default $1)
              (f64.const 4291516260)
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
       (memory.init $0
        (i64.and
         (loop $label2 (result i64)
          (if
           (i32.eqz
            (global.get $global$30)
           )
           (then
            (global.set $global$30
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$30
           (i32.sub
            (global.get $global$30)
            (i32.const 1)
           )
          )
          (br_if $block1
           (global.get $global$25)
          )
          (br_if $label2
           (ref.eq
            (local.tee $10
             (struct.new_desc $0
              (global.get $global$19)
              (struct.new $4
               (f32.const -4294967296)
              )
              (struct.new_desc $3
               (struct.new_default $4)
               (struct.new $1
                (call $36
                 (global.get $global$22)
                )
                (i32.const -8388607)
                (f32.const -2199023255552)
                (ref.as_non_null
                 (ref.null none)
                )
                (ref.null none)
               )
               (f64.const 50)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (array.new_fixed $7 0)
           )
          )
          (i64.load offset=4 align=1
           (i64.and
            (i64.trunc_sat_f64_u
             (f64.const 0)
            )
            (i64.const 15)
           )
          )
         )
         (i64.const 15)
        )
        (i32.const 1)
        (i32.const 0)
       )
       (nop)
      )
      (br_if $label3
       (string.measure_wtf16
        (string.const "")
       )
      )
      (struct.new $4
       (f32.const 0)
      )
     )
     (local.tee $11
      (struct.new_desc $3
       (struct.new $4
        (f32.const 0)
       )
       (struct.new $1
        (f64.const 0)
        (local.get $0)
        (f32.const 14338)
        (struct.new_desc $0
         (ref.func $4)
         (struct.new $4
          (f32.const 0)
         )
         (struct.new_desc $3
          (struct.new_default $4)
          (struct.new $1
           (f64.const 562949953421312)
           (i32.const -14821)
           (f32.const -2147483648)
           (ref.null none)
           (ref.null none)
          )
          (call $36
           (global.get $global$22)
          )
          (struct.new $4
           (f32.const -4.556043977748582e-17)
          )
         )
        )
        (struct.new $1
         (f64.const 0)
         (local.get $0)
         (f32.const 0)
         (struct.new_desc $0
          (ref.func $21)
          (struct.new_default $4)
          (struct.new_desc $3
           (struct.new_default $4)
           (struct.new_default $1)
           (call $36
            (global.get $global$21)
           )
           (local.get $9)
          )
         )
         (struct.new $1
          (f64.const 4294936416)
          (local.get $0)
          (f32.const -2.6857922220440616e-36)
          (struct.new_desc $0
           (global.get $global$19)
           (struct.new $4
            (f32.const -1)
           )
           (struct.new_desc $3
            (struct.new $4
             (f32.const 0)
            )
            (struct.new $1
             (f64.const 0.607)
             (local.get $0)
             (f32.const -1)
             (global.get $global$4)
             (ref.as_non_null
              (ref.null none)
             )
            )
            (f64.const -134217727.781)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (struct.new_default $1)
         )
        )
       )
       (f64.const 0)
       (struct.new_default $4)
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $30 (type $32) (param $0 (ref null $5)) (param $1 (ref $0)) (param $2 f64) (result (ref null $2))
  (local $3 anyref)
  (local $4 (ref $3))
  (local $5 i31ref)
  (local $6 exnref)
  (local $7 (ref $6))
  (local $8 (ref null $6))
  (local $9 (ref $2))
  (local $10 f32)
  (local.set $2
   (call $36
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $7
   (struct.new $6
    (ref.null none)
    (array.new_fixed $7 0)
    (i32.const -55)
    (struct.new_default $1)
    (f32.const 1.184999942779541)
   )
  )
  (try (result (ref $2))
   (do
    (global.get $global$20)
   )
   (catch $tag$1
    (local.set $6 (call_ref $__sinkT_0 (pop exnref) (ref.func $__popsink_0)))
    (local.tee $7
     (struct.new $6
      (ref.null none)
      (array.new_fixed $7 0)
      (i32.const -97)
      (ref.null none)
      (f32.const 0)
     )
    )
   )
   (catch $tag$0
    (local.set $8 (select (result (ref null $6)) (pop (ref null $6)) (ref.null none) (i32.const 0)))
    (struct.new $2
     (array.new_fixed $7 0)
     (array.new_fixed $7 0)
    )
   )
   (catch_all
    (local.tee $9
     (local.get $7)
    )
   )
  )
 )
 (func $31 (type $33) (result f32)
  (local $0 (ref null $2))
  (local $1 (ref null $2))
  (local $2 (ref null $2))
  (local $3 (ref null $3))
  (local $4 (ref null $3))
  (local $5 (ref null $3))
  (local $6 eqref)
  (local $7 (ref $6))
  (local $8 (ref null $6))
  (local $9 (ref null $6))
  (local $10 structref)
  (local $11 (ref null $4))
  (local $12 arrayref)
  (local $13 exnref)
  (local $14 (ref extern))
  (local $15 (ref i31))
  (local $16 i64)
  (local $17 i64)
  (local $18 f32)
  (local $19 v128)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 i32)
  (local $24 i32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $7
   (struct.new $6
    (ref.null none)
    (array.new_fixed $7 0)
    (global.get $global$10)
    (struct.new_default $1)
    (f32.const -0.7680000066757202)
   )
  )
  (select
   (f32.const 0)
   (f32.const -2.919143764880394e-27)
   (f32.gt
    (select
     (loop (result f32)
      (if
       (i32.eqz
        (global.get $global$30)
       )
       (then
        (global.set $global$30
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$30
       (i32.sub
        (global.get $global$30)
        (i32.const 1)
       )
      )
      (block
       (loop $label
        (if
         (i32.eqz
          (global.get $global$30)
         )
         (then
          (global.set $global$30
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$30
         (i32.sub
          (global.get $global$30)
          (i32.const 1)
         )
        )
        (local.set $20
         (call $36
          (global.get $global$21)
         )
        )
        (br $label)
       )
       (local.set $15
        (local.set $14
         (unreachable)
        )
       )
      )
      (unreachable)
     )
     (call $35
      (struct.get $6 4
       (local.get $7)
      )
     )
     (loop (result i32)
      (if
       (i32.eqz
        (global.get $global$30)
       )
       (then
        (global.set $global$30
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$30
       (i32.sub
        (global.get $global$30)
        (i32.const 1)
       )
      )
      (i32.const -1025)
     )
    )
    (f32.const 4294945536)
   )
  )
 )
 (func $32 (type $8)
  (local $0 f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 anyref)
  (local $4 (ref $5))
  (local $5 (ref $5))
  (local $6 (ref $1))
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $33 (type $8)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (call $32)
 )
 (@binaryen.js.called)
 (func $34 (type $15) (param $0 (ref null $4)) (param $1 funcref) (param $2 externref) (param $3 i32) (param $4 (ref null $6)) (result (ref $4))
  (local $5 i31ref)
  (local $6 (ref null $3))
  (local $7 (ref null $3))
  (local $8 (ref $1))
  (local $9 (ref struct))
  (local $10 eqref)
  (local $11 exnref)
  (local $12 exnref)
  (local $13 exnref)
  (local $14 (ref null $6))
  (local $15 (ref null $6))
  (local $16 (ref (exact $4)))
  (local $17 (ref null $1))
  (local $18 (ref null $1))
  (local $19 (ref null $1))
  (local $20 (ref $4))
  (local $21 f32)
  (local $22 v128)
  (local $23 i32)
  (local $24 i64)
  (local $scratch (tuple i32 nullref))
  (local $scratch_26 i32)
  (if
   (i32.eqz
    (global.get $global$30)
   )
   (then
    (global.set $global$30
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$30
   (i32.sub
    (global.get $global$30)
    (i32.const 1)
   )
  )
  (local.set $15
   (ref.as_non_null
    (local.get $15)
   )
  )
  (local.set $7
   (ref.as_non_null
    (local.get $7)
   )
  )
  (local.set $10
   (ref.as_non_null
    (local.get $10)
   )
  )
  (block $block (result (ref $4))
   (struct.set $1 1
    (local.tee $8
     (if (result (ref $1))
      (i32.eqz
       (if (result i32)
        (local.tee $3
         (i32.const 104)
        )
        (then
         (try_table
          (block
           (call $fimport$8
            (block (result (ref string))
             (if
              (i32.eqz
               (global.get $global$30)
              )
              (then
               (global.set $global$30
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$30
              (i32.sub
               (global.get $global$30)
               (i32.const 1)
              )
             )
             (local.set $3
              (local.get $3)
             )
             (string.const "")
            )
           )
           (return
            (struct.new $4
             (f32.const -83)
            )
           )
          )
          (unreachable)
         )
         (local.set $9
          (unreachable)
         )
        )
        (else
         (data.drop $1)
         (ref.eq
          (try (result (ref eq))
           (do
            (ref.as_non_null
             (local.tee $10
              (struct.new $6
               (ref.null none)
               (array.new_fixed $7 0)
               (global.get $global$10)
               (struct.new $1
                (f64.const -1797693134862315708145274e284)
                (local.get $3)
                (local.get $21)
                (global.get $global$4)
                (struct.new $1
                 (f64.const 0)
                 (local.get $3)
                 (f32.const 0)
                 (struct.new_desc $0
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (struct.new $1
                  (f64.const 0)
                  (global.get $global$14)
                  (local.get $21)
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
               (f32.const 0)
              )
             )
            )
           )
           (catch $tag$1
            (throw $tag$1 (pop exnref))
            (try (result (ref $3))
             (do
              (ref.cast_desc_eq (ref (exact $3))
               (struct.new_desc $3
                (call $34
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (local.get $1)
                 (string.const "\f0\90\8d\88\ed\bd\88")
                 (local.get $3)
                 (ref.null none)
                )
                (ref.null none)
                (try_table (result f64)
                 (call $36
                  (global.get $global$21)
                 )
                )
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (struct.new $4
                (f32.const 18446744073709551615)
               )
              )
             )
             (catch $tag$0
              (drop (ref.test (ref $6) (pop (ref null $6))))
              (br_on_non_null $block
               (ref.as_non_null
                (ref.null none)
               )
              )
              (drop
               (struct.new $4
                (f32.const 2097152)
               )
              )
              (ref.as_non_null
               (local.set $7
                (block ;; (replaces unreachable StructNew we can't emit)
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (drop
                  (unreachable)
                 )
                 (drop
                  (f64.const 0.251)
                 )
                 (drop
                  (local.tee $16
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                 (unreachable)
                )
               )
              )
             )
             (catch $tag$1
              (if (ref.is_null (pop exnref)) (then (nop)) (else (unreachable)))
              (call $fimport$6
               (struct.new_default $1)
              )
              (return
               (struct.new_default $4)
              )
             )
             (catch_all
              (ref.as_non_null
               (local.get $7)
              )
             )
            )
           )
           (catch_all
            (table.set $0
             (i32.const 1)
             (local.tee $1
              (try_table (result (ref (exact $15)))
               (ref.func $34)
              )
             )
            )
            (block (result (ref none))
             (block (result (ref none))
              (call $fimport$3
               (f32.const -23)
              )
              (try (result (ref none))
               (do
                (loop (result (ref none))
                 (if
                  (i32.eqz
                   (global.get $global$30)
                  )
                  (then
                   (global.set $global$30
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$30
                  (i32.sub
                   (global.get $global$30)
                   (i32.const 1)
                  )
                 )
                 (block (result (ref none))
                  (call $fimport$4
                   (f64.const 0)
                  )
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
               (catch $tag$1
                (local.set $13 (ref.as_non_null (pop exnref)))
                (select (result (ref none))
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (block (result i32)
                  (nop)
                  (local.get $3)
                 )
                )
               )
              )
             )
            )
           )
          )
          (loop $label1 (result (ref (exact $4)))
           (if
            (i32.eqz
             (global.get $global$30)
            )
            (then
             (global.set $global$30
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$30
            (i32.sub
             (global.get $global$30)
             (i32.const 1)
            )
           )
           (atomic.fence acqrel)
           (i64.and
            (i32.atomic.rmw.xchg acqrel offset=4
             (i64.and
              (global.get $global$11)
              (i64.const 15)
             )
             (call_indirect $0 (type $11)
              (block (result f32)
               (i64.atomic.store16 offset=1
                (i64.and
                 (loop $label (result i64)
                  (if
                   (i32.eqz
                    (global.get $global$30)
                   )
                   (then
                    (global.set $global$30
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$30
                   (i32.sub
                    (global.get $global$30)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label
                   (i32.eqz
                    (ref.eq
                     (ref.i31
                      (i32.const -1048575)
                     )
                     (local.get $4)
                    )
                   )
                  )
                  (i64.const 255)
                 )
                 (i64.const 15)
                )
                (global.get $global$13)
               )
               (call $35
                (f32x4.extract_lane 0
                 (local.get $22)
                )
               )
              )
              (array.new_fixed $7 0)
              (block
               (nop)
               (return
                (struct.new $4
                 (local.get $21)
                )
               )
              )
              (i32.const 3)
             )
            )
            (i64.const 15)
           )
           (block
            (local.set $23
             (block (result i32)
              (local.set $scratch_26
               (tuple.extract 2 0
                (local.tee $scratch
                 (if (type $17) (result i32 nullref)
                  (i32.eqz
                   (local.get $3)
                  )
                  (then
                   (return
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (else
                   (try_table (type $17) (result i32 nullref) (catch_all $label1)
                    (tuple.make 2
                     (i32.const 32769)
                     (ref.null none)
                    )
                   )
                  )
                 )
                )
               )
              )
              (local.set $17
               (tuple.extract 2 1
                (local.get $scratch)
               )
              )
              (local.get $scratch_26)
             )
            )
            (drop
             (local.get $17)
            )
            (br $label1)
           )
           (unreachable)
          )
         )
        )
       )
      )
      (then
       (i32.store16 offset=4 align=1
        (i64.and
         (local.get $24)
         (i64.const 15)
        )
        (i32.const -8678)
       )
       (drop
        (array.new_fixed $7 0)
       )
       (loop
        (if
         (i32.eqz
          (global.get $global$30)
         )
         (then
          (global.set $global$30
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$30
         (i32.sub
          (global.get $global$30)
          (i32.const 1)
         )
        )
        (call $fimport$7
         (local.get $1)
        )
        (return
         (struct.new_default $4)
        )
       )
       (unreachable)
      )
      (else
       (if (result (ref $1))
        (i32.eqz
         (ref.eq
          (struct.new $1
           (call $36
            (global.get $global$22)
           )
           (local.get $3)
           (local.get $21)
           (global.get $global$4)
           (struct.new_default $1)
          )
          (local.get $18)
         )
        )
        (then
         (ref.as_non_null
          (local.tee $19
           (struct.new_default $1)
          )
         )
        )
        (else
         (call_indirect $0 (type $8)
          (i32.const 15)
         )
         (block (result (ref $1))
          (call $fimport$4
           (call $36
            (global.get $global$22)
           )
          )
          (nop)
          (ref.as_non_null
           (local.get $19)
          )
         )
        )
       )
      )
     )
    )
    (ref.eq
     (ref.i31
      (i32.const -72)
     )
     (if (result (ref eq))
      (i32.eqz
       (struct.get_u $1 1
        (ref.as_non_null
         (local.get $19)
        )
       )
      )
      (then
       (nop)
       (block (result (ref $6))
        (nop)
        (ref.as_non_null
         (local.get $15)
        )
       )
      )
      (else
       (ref.as_non_null
        (local.get $10)
       )
      )
     )
    )
   )
   (local.tee $20
    (ref.as_non_null
     (ref.null none)
    )
   )
  )
 )
 (func $35 (type $34) (param $0 f32) (result f32)
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
 (func $36 (type $35) (param $0 f64) (result f64)
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
 (func $37 (type $36) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param exnref) (result exnref)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
