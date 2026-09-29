(module
 (type $0 (array (mut i64)))
 (type $1 (sub (array (mut (ref $0)))))
 (type $2 (sub (struct (field i8) (field (ref $1)) (field i64) (field (mut arrayref)) (field f64))))
 (type $3 (array (mut i16)))
 (type $4 (sub (func (param (ref null $1) f64 (ref null $1) exnref i32 (ref $1)) (result f32))))
 (type $5 (sub final $4 (func (param eqref f64 (ref null $1) exnref i32 (ref any)) (result f32))))
 (type $6 (func))
 (type $7 (array i8))
 (type $8 (struct))
 (type $9 (func (param i32)))
 (type $10 (func (param externref)))
 (type $11 (func (result nullref v128 i32 f64)))
 (type $12 (func (param i64)))
 (type $13 (func (result exnref i32 arrayref)))
 (type $14 (func (result (ref extern) f32)))
 (type $15 (func (param f32)))
 (type $16 (func (param f64)))
 (type $17 (func (param v128)))
 (type $18 (func (param anyref)))
 (type $19 (func (param funcref)))
 (type $20 (func (param i32 eqref) (result (ref null $5))))
 (type $21 (func (param f32 i32)))
 (type $22 (func (param (ref $1) (ref $2) (ref string) (ref $2) externref (ref $2)) (result f64)))
 (type $23 (func (param (ref $5)) (result (ref null $4))))
 (type $24 (func (param i32 i64) (result eqref)))
 (type $25 (func (param stringref stringref v128 f32) (result eqref)))
 (type $26 (func (param i64 (ref $5)) (result (ref string))))
 (type $27 (func (param i32 i32 f32 i32 stringref)))
 (type $28 (func (result stringref)))
 (type $29 (func (result (ref null $1))))
 (type $30 (func (result f32 nullref)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_11" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $9) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $9) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $15) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $16) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $17) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $18) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $19) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $10) (param externref)))
 (global $global$0 (ref null $2) (struct.new $2
  (i32.const 0)
  (array.new $1
   (array.new $0
    (i64.const -46)
    (i32.const 94)
   )
   (i32.const 6)
  )
  (i64.const -3930565)
  (array.new_fixed $7 0)
  (f64.const 70368744177664)
 ))
 (global $global$1 (mut anyref) (ref.null none))
 (global $global$2 (mut externref) (ref.null noextern))
 (global $global$3 (mut i32) (i32.const 798))
 (global $global$4 i32 (i32.const -49))
 (global $global$5 (mut eqref) (array.new_fixed $7 0))
 (global $global$6 i64 (i64.const -88))
 (global $global$7 (mut (ref $2)) (struct.new $2
  (global.get $global$4)
  (array.new $1
   (array.new_default $0
    (i32.const 78)
   )
   (i32.const 66)
  )
  (i64.const 512)
  (array.new_fixed $7 0)
  (f64.const -nan:0xfffffffd0212a)
 ))
 (global $global$8 (mut i64) (i64.const 128))
 (global $global$9 (mut i64) (i64.const -17041))
 (global $global$10 i32 (i32.const 1))
 (global $global$11 externref (global.get $gimport$0))
 (global $global$12 i64 (i64.const -501743))
 (global $global$13 (ref null $2) (struct.new $2
  (global.get $global$4)
  (array.new $1
   (array.new $0
    (global.get $global$6)
    (i32.const 76)
   )
   (i32.const 95)
  )
  (i64.const 1)
  (array.new_fixed $7 0)
  (f64.const -nan:0xfffffff9b0e61)
 ))
 (global $global$14 f64 (f64.const -144115188075855872))
 (global $global$15 (mut (ref $5)) (ref.func $0))
 (global $global$16 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 "W\0c\1b\01\91\f2\04\e7Z\03\d8")
 (data $1 "n6N\da\e5E!\8c\dbA\'\88\d4\e2\8d\a3[fi`{")
 (data $2 (i64.const 0) "\f2,\16\a1]\a6\c9\82I\d1\8f\ad8\d0\f7\b3\9a[\f2\1fpY<*\fd\a6\8b\a4\f4")
 (data $3 "\15d\85-\abF\9fe\99")
 (data $4 "\e7B4")
 (data $5 "r\84\fde\eeu\c9d")
 (table $0 20 20 funcref)
 (table $1 2 2 exnref)
 (elem $0 (table $0) (i32.const 0) func $2 $17 $17 $24 $24 $24 $24 $24 $28 $28 $29 $31 $31 $34 $36 $36 $38 $38 $44 $47)
 (elem declare func $0 $1 $10 $13 $18 $21 $26 $3 $32 $33 $8 $fimport$2 $fimport$8)
 (tag $tag$0 (type $9) (param i32))
 (tag $tag$1 (type $6))
 (export "global$_5" (global $global$7))
 (export "global$_9" (global $global$14))
 (export "global$_10" (global $global$15))
 (export "tag$" (tag $tag$0))
 (export "ref_func_target_invoker" (func $1))
 (export "func_invoker" (func $3))
 (export "func_13" (func $4))
 (export "func_13_invoker" (func $5))
 (export "func_15_invoker" (func $7))
 (export "func_17_invoker" (func $9))
 (export "func_20_invoker" (func $12))
 (export "func_22_invoker" (func $14))
 (export "func_24" (func $15))
 (export "func_24_invoker" (func $16))
 (export "func_29_invoker" (func $21))
 (export "func_31_invoker" (func $23))
 (export "func_33_invoker" (func $25))
 (export "func_35_invoker" (func $27))
 (export "func_38" (func $29))
 (export "func_38_invoker" (func $30))
 (export "func_41_invoker" (func $33))
 (export "func_43_invoker" (func $35))
 (export "func_45_invoker" (func $37))
 (export "func_48_invoker" (func $40))
 (export "func_50_invoker" (func $42))
 (export "func_52" (func $43))
 (export "func_53" (func $44))
 (export "func_53_invoker" (func $45))
 (export "func_56" (func $47))
 (export "func_56_invoker" (func $48))
 (func $0 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $0
    (ref.i31
     (i32.const 131072)
    )
    (f64.const -8388609)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 95)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 52)
      (i32.const 1023)
     )
    )
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i32.const 128)
      )
     )
     (unreachable)
    )
    (i32.const -6747798)
    (struct.new_default $8)
   )
  )
 )
 (func $2 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 structref)
  (local $7 funcref)
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 i64)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (f32.const -128)
 )
 (func $3 (type $6)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i64)
  (local $27 f64)
  (local $28 (ref $2))
  (local $29 (ref string))
  (local $30 (ref string))
  (local $31 (ref string))
  (local $32 (ref string))
  (local $33 stringref)
  (local $34 (ref null $0))
  (local $35 (ref null $0))
  (local $36 (ref $0))
  (local $37 (ref $0))
  (local $38 (ref $0))
  (local $39 (ref $0))
  (local $40 (ref $5))
  (local $41 (ref $1))
  (local $42 (ref $1))
  (local $43 (ref $1))
  (local $44 (ref $3))
  (local $45 (ref $3))
  (local $46 (ref $3))
  (local $47 (ref eq))
  (local $48 (ref eq))
  (local $49 (ref i31))
  (local $50 (ref exn))
  (local $51 (ref exn))
  (local $52 structref)
  (local $53 nullref)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $48
   (array.new_fixed $7 0)
  )
  (local.set $42
   (array.new $1
    (ref.as_non_null
     (local.get $34)
    )
    (i32.and
     (i32.const 95)
     (i32.const 1023)
    )
   )
  )
  (local.set $44
   (array.new $3
    (local.get $1)
    (i32.and
     (i32.const 62)
     (i32.const 1023)
    )
   )
  )
  (local.set $40
   (ref.func $0)
  )
  (local.set $34
   (array.new $0
    (i64.const 64)
    (i32.and
     (i32.const 20)
     (i32.const 1023)
    )
   )
  )
  (local.set $29
   (string.const "\ed\bd\88\ed\bd\88\ed\bd\88")
  )
  (local.set $28
   (global.get $global$7)
  )
  (drop
   (call $2
    (ref.i31
     (i32.const -7706509)
    )
    (f64.const 2147483647)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 93)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 55)
      (i32.const 1023)
     )
    )
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i16x8.extract_lane_s 6
        (v128.const i32x4 0xad4b4993 0x000001be 0xff69ff01 0xed00124b)
       )
      )
     )
     (unreachable)
    )
    (i32.const -29430)
    (ref.i31
     (i32.const 65535)
    )
   )
  )
  (drop
   (struct.new_default $8)
  )
  (drop
   (f64.const 8796093022207.797)
  )
  (loop $label2
   (if
    (i32.eqz
     (global.get $global$16)
    )
    (then
     (global.set $global$16
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$16
    (i32.sub
     (global.get $global$16)
     (i32.const 1)
    )
   )
   (block
    (block
     (loop $label3
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block $block1
       (loop
        (if
         (i32.eqz
          (global.get $global$16)
         )
         (then
          (global.set $global$16
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$16
         (i32.sub
          (global.get $global$16)
          (i32.const 1)
         )
        )
        (block
         (call $fimport$2
          (loop $label (result i64)
           (if
            (i32.eqz
             (global.get $global$16)
            )
            (then
             (global.set $global$16
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$16
            (i32.sub
             (global.get $global$16)
             (i32.const 1)
            )
           )
           (loop
            (if
             (i32.eqz
              (global.get $global$16)
             )
             (then
              (global.set $global$16
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$16
             (i32.sub
              (global.get $global$16)
              (i32.const 1)
             )
            )
            (block
             (if
              (block (result i32)
               (memory.fill
                (i64.and
                 (i64.const -4503599627370496)
                 (i64.const 15)
                )
                (i32.const 32769)
                (i64.const 4294948950)
               )
               (local.tee $0
                (local.tee $1
                 (local.get $2)
                )
               )
              )
              (then
               (if
                (i16x8.extract_lane_u 2
                 (v128.const i32x4 0x8000cd35 0x0000ee5e 0x6743ffdf 0x00002000)
                )
                (then
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (unreachable)
                 (if
                  (i32.eqz
                   (i32.const -62)
                  )
                  (then
                   (nop)
                  )
                 )
                )
               )
              )
             )
            )
           )
           (br_if $label
            (local.get $0)
           )
           (struct.get $2 2
            (local.tee $28
             (ref.cast (ref none)
              (try $__t_22 (result (ref none)) (do (try (result (ref none)) (do 
                (ref.as_non_null
                 (ref.null none)
                )
               ) (delegate $__t_22))) (catch $tag$0
                (throw $tag$0 (pop i32))
                (try $__t_21 (result (ref none)) (do (try (result (ref none)) (do 
                  (ref.as_non_null
                   (ref.null none)
                  )
                 ) (delegate $__t_21))) (catch $tag$0
(local.set $4 (i32.and (pop i32) (i32.const 16)))
(if (global.get $__rt) (then (rethrow $__t_21)))
(ref.as_non_null
                   (ref.null none)
                  )))
               ))
             )
            )
           )
          )
         )
         (nop)
        )
       )
       (br_if $label3
        (i32.eqz
         (ref.test (ref $5)
          (if (result (ref $5))
           (i32.eqz
            (i32.atomic.load offset=2
             (i64.and
              (i64.const -90)
              (i64.const 15)
             )
            )
           )
           (then
            (drop
             (i32.add
              (local.tee $5
               (try_table (result i32) (catch_all $block1)
                (select
                 (ref.is_null
                  (local.get $28)
                 )
                 (string.compare
                  (local.tee $29
                   (ref.as_non_null
                    (local.tee $33
                     (string.const "\ed\bd\88")
                    )
                   )
                  )
                  (string.const "\e2\82\ac")
                 )
                 (block (result i32)
                  (nop)
                  (local.get $2)
                 )
                )
               )
              )
              (local.tee $6
               (try_table (result i32) (catch_all $block1)
                (i32.const -2147483647)
               )
              )
             )
            )
            (block
             (loop $label1
              (if
               (i32.eqz
                (global.get $global$16)
               )
               (then
                (global.set $global$16
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$16
               (i32.sub
                (global.get $global$16)
                (i32.const 1)
               )
              )
              (nop)
              (br_if $label1
               (i32.eqz
                (i32.const 32768)
               )
              )
              (i64.atomic.store32 acqrel offset=4
               (i64.and
                (local.get $26)
                (i64.const 15)
               )
               (i64.const 8388608)
              )
             )
             (br $label2)
            )
            (local.set $36
             (unreachable)
            )
           )
           (else
            (local.tee $40
             (ref.func $2)
            )
           )
          )
         )
        )
       )
      )
      (br_if $label3
       (local.get $1)
      )
      (br_if $label2
       (i32.eqz
        (ref.eq
         (ref.null none)
         (local.tee $28
          (struct.new $2
           (global.get $global$4)
           (array.new $1
            (ref.as_non_null
             (local.get $34)
            )
            (i32.and
             (i32.const 97)
             (i32.const 1023)
            )
           )
           (block (result i64)
            (drop
             (br_on_null $label3
              (block (result (ref (exact $8)))
               (nop)
               (struct.new_default $8)
              )
             )
            )
            (local.tee $26
             (local.get $26)
            )
           )
           (ref.null none)
           (loop $label4 (result f64)
            (if
             (i32.eqz
              (global.get $global$16)
             )
             (then
              (global.set $global$16
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$16
             (i32.sub
              (global.get $global$16)
              (i32.const 1)
             )
            )
            (block
             (local.set $40
              (local.get $40)
             )
            )
            (br_if $label4
             (i32.eqz
              (i32.ctz
               (i32.const -48)
              )
             )
            )
            (global.get $global$14)
           )
          )
         )
        )
       )
      )
     )
     (table.set $1
      (i32.const 1)
      (ref.cast (ref noexn)
       (ref.null noexn)
      )
     )
    )
    (br $label2)
   )
   (unreachable)
  )
  (local.set $32
   (local.set $47
    (local.set $46
     (local.set $40
      (local.set $31
       (local.set $28
        (local.set $29
         (local.set $50
          (local.set $51
           (local.set $49
            (local.set $47
             (local.set $48
              (local.set $28
               (local.set $39
                (local.set $43
                 (local.set $42
                  (local.set $38
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
      )
     )
    )
   )
  )
 )
 (func $4 (type $20) (param $0 i32) (param $1 eqref) (result (ref null $5))
  (local $2 (ref i31))
  (local $3 (ref $3))
  (local $4 (ref $3))
  (local $5 (ref $3))
  (local $6 (ref $3))
  (local $7 (ref $3))
  (local $8 (ref null $5))
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 (ref string))
  (local $13 (ref none))
  (local $14 (ref none))
  (local $15 (ref none))
  (local $16 (ref $1))
  (local $17 (ref $1))
  (local $18 (ref $1))
  (local $19 (ref $0))
  (local $20 (ref $0))
  (local $21 (ref $0))
  (local $22 (ref $5))
  (local $23 anyref)
  (local $24 (ref $2))
  (local $25 nullref)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $32 i32)
  (local $33 i32)
  (local $34 i32)
  (local $35 i32)
  (local $36 i32)
  (local $37 i32)
  (local $38 i32)
  (local $39 i32)
  (local $40 i32)
  (local $41 i32)
  (local $42 i32)
  (local $43 i32)
  (local $44 i32)
  (local $45 i32)
  (local $46 i32)
  (local $47 i32)
  (local $48 i32)
  (local $49 i64)
  (local $50 i64)
  (local $51 i64)
  (local $52 f32)
  (local $53 f32)
  (local $54 f64)
  (local $55 v128)
  (local $56 v128)
  (local $57 v128)
  (local $scratch (ref (exact $0)))
  (local $scratch_59 f32)
  (local $scratch_60 v128)
  (local $scratch_61 i32)
  (local $scratch_62 v128)
  (local $scratch_63 f64)
  (local $scratch_64 i64)
  (local $scratch_65 i64)
  (local $scratch_66 (ref $0))
  (local $scratch_67 f32)
  (local $scratch_68 v128)
  (local $scratch_69 i32)
  (local $scratch_70 (tuple f32 nullref))
  (local $scratch_71 f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $36
   (block (result i32)
    (local.set $scratch_61
     (i32.const -119)
    )
    (local.set $56
     (block (result v128)
      (local.set $scratch_60
       (v128.const i32x4 0xff900081 0xfff4ff75 0xffba6900 0x79000024)
      )
      (local.set $53
       (block (result f32)
        (local.set $scratch_59
         (f32.const 17592186044416)
        )
        (local.set $19
         (block (result (ref (exact $0)))
          (local.set $scratch
           (array.new $0
            (global.get $global$6)
            (i32.and
             (i32.const 86)
             (i32.const 1023)
            )
           )
          )
          (local.set $22
           (ref.func $0)
          )
          (local.get $scratch)
         )
        )
        (local.get $scratch_59)
       )
      )
      (local.get $scratch_60)
     )
    )
    (local.get $scratch_61)
   )
  )
  (local.set $17
   (array.new $1
    (array.new_default $0
     (i32.and
      (i32.const 66)
      (i32.const 1023)
     )
    )
    (i32.and
     (i32.const 34)
     (i32.const 1023)
    )
   )
  )
  (local.set $9
   (string.const "\ed\bd\88\ed\a0\80")
  )
  (local.set $4
   (array.new $3
    (global.get $global$4)
    (i32.and
     (i32.const 97)
     (i32.const 1023)
    )
   )
  )
  (local.set $2
   (ref.i31
    (i32.const -2147483647)
   )
  )
  (block (result (ref null $5))
   (block $block1
    (if
     (i32.lt_u
      (i32.add
       (local.tee $44
        (local.tee $0
         (string.eq
          (string.const "919")
          (string.const "\e2\82\ac")
         )
        )
       )
       (block (result i32)
        (local.set $11
         (string.const "\ed\bd\88\ed\bd\88")
        )
        (local.tee $45
         (if (result i32)
          (i32.lt_u
           (i32.add
            (local.tee $38
             (try $__t_20 (result i32) (do (try (result i32) (do 
               (try $__t_19 (result i32) (do (try (result i32) (do 
                 (drop
                  (block (result i64)
                   (local.set $scratch_65
                    (i64.const 16384)
                   )
                   (drop
                    (block (result i64)
                     (local.set $scratch_64
                      (i64.const -70368744177663)
                     )
                     (drop
                      (block (result f64)
                       (local.set $scratch_63
                        (f64.const -562949953421311.8)
                       )
                       (drop
                        (block (result v128)
                         (local.set $scratch_62
                          (v128.const i32x4 0x00b114ff 0x00df0181 0x3a013491 0xd4df9511)
                         )
                         (local.set $48
                          (i32.const 16383)
                         )
                         (local.get $scratch_62)
                        )
                       )
                       (local.get $scratch_63)
                      )
                     )
                     (local.get $scratch_64)
                    )
                   )
                   (local.get $scratch_65)
                  )
                 )
                 (local.get $48)
                ) (delegate $__t_19))) (catch $tag$0
                 (local.set $33 (pop i32))
                 (string.encode_wtf16_array
                  (string.const "282")
                  (local.get $4)
                  (select
                   (struct.get_u $2 0
                    (loop $label (result (ref (exact $2)))
                     (if
                      (i32.eqz
                       (global.get $global$16)
                      )
                      (then
                       (global.set $global$16
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$16
                      (i32.sub
                       (global.get $global$16)
                       (i32.const 1)
                      )
                     )
                     (br_if $label
                      (i32.clz
                       (ref.eq
                        (local.tee $16
                         (local.tee $17
                          (block (result (ref none))
                           (nop)
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                         )
                        )
                        (ref.as_non_null
                         (ref.null none)
                        )
                       )
                      )
                     )
                     (br_if $label
                      (i32.eqz
                       (try_table (result i32) (catch_all $label)
                        (i32.ge_u
                         (i32.const 32768)
                         (local.get $0)
                        )
                       )
                      )
                     )
                     (struct.new $2
                      (local.get $0)
                      (local.get $17)
                      (local.get $49)
                      (ref.null none)
                      (local.get $54)
                     )
                    )
                   )
                   (i32.load16_s offset=3
                    (i64.and
                     (local.tee $49
                      (local.tee $49
                       (if (result i64)
                        (i32.lt_u
                         (local.tee $34
                          (i32.const 65490)
                         )
                         (array.len
                          (local.tee $14
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                         )
                        )
                        (then
                         (drop
                          (local.get $14)
                         )
                         (drop
                          (local.get $34)
                         )
                         (unreachable)
                        )
                        (else
                         (i64.const -118)
                        )
                       )
                      )
                     )
                     (i64.const 15)
                    )
                   )
                   (loop $label1 (result i32)
                    (if
                     (i32.eqz
                      (global.get $global$16)
                     )
                     (then
                      (global.set $global$16
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$16
                     (i32.sub
                      (global.get $global$16)
                      (i32.const 1)
                     )
                    )
                    (block
                     (v128.store offset=4 align=1
                      (i64.and
                       (local.tee $49
                        (local.get $49)
                       )
                       (i64.const 15)
                      )
                      (local.get $55)
                     )
                     (i64.atomic.store32 offset=22
                      (i64.and
                       (block (result i64)
                        (nop)
                        (local.tee $49
                         (i64.const 9223372036854775807)
                        )
                       )
                       (i64.const 15)
                      )
                      (global.get $global$6)
                     )
                    )
                    (drop
                     (br_on_null $label1
                      (ref.null none)
                     )
                    )
                    (br_if $label1
                     (ref.is_null
                      (string.const "\ed\a0\80")
                     )
                    )
                    (i31.get_s
                     (local.tee $2
                      (ref.i31
                       (i32.const 32768)
                      )
                     )
                    )
                   )
                  )
                 )
                ) (catch_all (if (global.get $__rt) (then (rethrow $__t_19)))
(block $block (result i32)
                  (drop
                   (local.tee $55
                    (f64x2.replace_lane 1
                     (local.get $55)
                     (try_table (result f64) (catch $tag$0 $block)
                      (f64.const -1797693134862315708145274e284)
                     )
                    )
                   )
                  )
                  (drop
                   (br_on_null $block1
                    (if (result (ref $0))
                     (i32.const -33)
                     (then
                      (if (result (ref $0))
                       (i32.lt_u
                        (local.tee $35
                         (i32.const -84)
                        )
                        (array.len
                         (local.tee $18
                          (local.get $17)
                         )
                        )
                       )
                       (then
                        (array.get $1
                         (local.get $18)
                         (local.get $35)
                        )
                       )
                       (else
                        (ref.as_non_null
                         (ref.null none)
                        )
                       )
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
                  (drop
                   (block (result i32)
                    (local.set $scratch_69
                     (local.get $36)
                    )
                    (local.set $57
                     (block (result v128)
                      (local.set $scratch_68
                       (local.get $56)
                      )
                      (drop
                       (block (result f32)
                        (local.set $scratch_67
                         (local.get $53)
                        )
                        (drop
                         (block (result (ref $0))
                          (local.set $scratch_66
                           (local.get $19)
                          )
                          (drop
                           (local.get $22)
                          )
                          (local.get $scratch_66)
                         )
                        )
                        (local.get $scratch_67)
                       )
                      )
                      (local.get $scratch_68)
                     )
                    )
                    (local.get $scratch_69)
                   )
                  )
                  (i16x8.extract_lane_s 5
                   (local.tee $55
                    (local.tee $55
                     (i16x8.relaxed_dot_i8x16_i7x16_s
                      (local.get $57)
                      (local.get $55)
                     )
                    )
                   )
                  )
                 )))
              ) (delegate $__t_20))) (catch $tag$0
(throw $tag$0 (pop i32))
(if (global.get $__rt) (then (rethrow $__t_20)))
(string.measure_wtf16
                (string.const "\ed\bd\88")
               )))
            )
            (local.tee $39
             (string.measure_wtf16
              (local.get $11)
             )
            )
           )
           (array.len
            (local.tee $6
             (local.tee $3
              (if (result (ref $3))
               (i32.wrap_i64
                (struct.get $2 2
                 (struct.new $2
                  (local.tee $0
                   (i32.load16_u offset=4 align=1
                    (i64.and
                     (i64.popcnt
                      (i64.load offset=4 align=2
                       (i64.and
                        (i64.const -24200)
                        (i64.const 15)
                       )
                      )
                     )
                     (i64.const 15)
                    )
                   )
                  )
                  (block (result (ref (exact $1)))
                   (drop
                    (br_on_null $block1
                     (array.new_fixed $7 0)
                    )
                   )
                   (array.new $1
                    (array.new $0
                     (i64.const -128)
                     (i32.and
                      (i32.const 23)
                      (i32.const 1023)
                     )
                    )
                    (i32.and
                     (i32.const 45)
                     (i32.const 1023)
                    )
                   )
                  )
                  (i64.const -9223372036854775808)
                  (select (result nullref)
                   (ref.null none)
                   (select (result nullref)
                    (ref.null none)
                    (loop (result nullref)
                     (if
                      (i32.eqz
                       (global.get $global$16)
                      )
                      (then
                       (global.set $global$16
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$16
                      (i32.sub
                       (global.get $global$16)
                       (i32.const 1)
                      )
                     )
                     (block (result nullref)
                      (call_ref $6
                       (ref.func $3)
                      )
                      (drop
                       (block (result f32)
                        (local.set $scratch_71
                         (tuple.extract 2 0
                          (local.tee $scratch_70
                           (if (type $30) (result f32 nullref)
                            (i32.eqz
                             (i32.const -2147483648)
                            )
                            (then
                             (tuple.make 2
                              (f32.const 1.1629999876022339)
                              (ref.null none)
                             )
                            )
                            (else
                             (tuple.make 2
                              (f32.const -nan:0x7fff9f)
                              (ref.null none)
                             )
                            )
                           )
                          )
                         )
                        )
                        (local.set $25
                         (tuple.extract 2 1
                          (local.get $scratch_70)
                         )
                        )
                        (local.get $scratch_71)
                       )
                      )
                      (local.get $25)
                     )
                    )
                    (local.tee $0
                     (i32.trunc_sat_f32_s
                      (local.tee $52
                       (loop (result f32)
                        (if
                         (i32.eqz
                          (global.get $global$16)
                         )
                         (then
                          (global.set $global$16
                           (i32.const 100)
                          )
                          (unreachable)
                         )
                        )
                        (global.set $global$16
                         (i32.sub
                          (global.get $global$16)
                          (i32.const 1)
                         )
                        )
                        (f32.const -nan:0x7fffd7)
                       )
                      )
                     )
                    )
                   )
                   (i32.load offset=22
                    (i64.and
                     (i64.sub
                      (local.get $49)
                      (i64.const 0)
                     )
                     (i64.const 15)
                    )
                   )
                  )
                  (select
                   (global.get $global$14)
                   (local.tee $54
                    (global.get $global$14)
                   )
                   (global.get $global$4)
                  )
                 )
                )
               )
               (then
                (block $block2 (result (ref none))
                 (local.set $10
                  (string.const "\e2\82\ac")
                 )
                 (drop
                  (i32.add
                   (local.tee $29
                    (local.get $0)
                   )
                   (local.tee $30
                    (string.measure_wtf16
                     (local.get $10)
                    )
                   )
                  )
                 )
                 (drop
                  (local.tee $4
                   (try $__t_18 (result (ref (exact $3))) (do
                     (br_on_non_null $block2
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                     (f64.store offset=22 align=1
                      (i64.and
                       (if (result i64)
                        (i32.eqz
                         (i32.const -2147483648)
                        )
                        (then
                         (local.get $49)
                        )
                        (else
                         (i64.const 4294967295)
                        )
                       )
                       (i64.const 15)
                      )
                      (f64.const -9223372036854775808)
                     )
                     (br $block1)
                    ) (catch $tag$0
(local.set $27 (local.tee $27 (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_18)))
(block
                      (drop
                       (local.get $54)
                      )
                      (br $block1)
                     )
(unreachable)) (catch_all (if (global.get $__rt) (then (rethrow $__t_18)))
(array.new $3
                      (select
                       (try $__t_17 (result i32) (do
                         (local.get $0)
                        ) (catch $tag$0
                         (local.set $28 (call $__popsink_0 (pop i32)))
                         (local.get $0)
                        ) (catch_all (if (global.get $__rt) (then (rethrow $__t_17)))
(i32.const -2147483648)))
                       (string.eq
                        (string.const "\e2\82\ac\ed\a0\80\c2\a3")
                        (local.tee $9
                         (string.const "\ed\bd\88\e2\82\ac926")
                        )
                       )
                       (i32.const -65536)
                      )
                      (i32.and
                       (i32.const 84)
                       (i32.const 1023)
                      )
                     )))
                  )
                 )
                 (drop
                  (local.tee $4
                   (array.new $3
                    (global.get $global$4)
                    (i32.and
                     (i32.const 53)
                     (i32.const 1023)
                    )
                   )
                  )
                 )
                 (drop
                  (select (result (ref i31))
                   (local.get $2)
                   (ref.i31
                    (i32.const 1919888762)
                   )
                   (local.get $0)
                  )
                 )
                 (block
                  (nop)
                  (br $block1)
                 )
                 (local.set $13
                  (local.set $2
                   (local.set $5
                    (unreachable)
                   )
                  )
                 )
                )
               )
               (else
                (block $block3 (result (ref $3))
                 (br_on_non_null $block3
                  (ref.null none)
                 )
                 (local.tee $4
                  (loop (result (ref $3))
                   (if
                    (i32.eqz
                     (global.get $global$16)
                    )
                    (then
                     (global.set $global$16
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$16
                    (i32.sub
                     (global.get $global$16)
                     (i32.const 1)
                    )
                   )
                   (loop (result (ref $3))
                    (if
                     (i32.eqz
                      (global.get $global$16)
                     )
                     (then
                      (global.set $global$16
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$16
                     (i32.sub
                      (global.get $global$16)
                      (i32.const 1)
                     )
                    )
                    (local.tee $4
                     (array.new $3
                      (global.get $global$4)
                      (i32.and
                       (i32.const 35)
                       (i32.const 1023)
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
          (then
           (string.encode_wtf16_array
            (local.get $11)
            (local.get $6)
            (local.get $38)
           )
          )
          (else
           (block
            (block
             (call_ref $12
              (i64.trunc_f32_s
               (local.get $52)
              )
              (ref.func $fimport$2)
             )
             (block
              (block
               (nop)
               (atomic.fence acqrel)
              )
              (br $block1)
             )
             (unreachable)
            )
            (unreachable)
           )
           (local.set $24
            (local.set $7
             (local.set $15
              (local.set $12
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
      (array.len
       (local.tee $20
        (array.new $0
         (i64.const -2344434)
         (i32.and
          (i32.const 59)
          (i32.const 1023)
         )
        )
       )
      )
     )
     (then
      (if
       (i32.lt_u
        (i32.add
         (local.tee $46
          (ref.test (ref (exact $5))
           (ref.func $0)
          )
         )
         (local.tee $47
          (local.get $45)
         )
        )
        (array.len
         (local.tee $21
          (select (result (ref (exact $0)))
           (array.new $0
            (global.get $global$6)
            (i32.and
             (i32.const 74)
             (i32.const 1023)
            )
           )
           (array.new_default $0
            (i32.and
             (i32.const 7)
             (i32.const 1023)
            )
           )
           (ref.eq
            (array.new_fixed $7 0)
            (local.tee $2
             (ref.i31
              (i32.const 1048577)
             )
            )
           )
          )
         )
        )
       )
       (then
        (array.copy $0 $0
         (local.get $20)
         (local.get $44)
         (local.get $21)
         (local.get $46)
         (local.get $47)
        )
       )
      )
     )
    )
    (call_ref $6
     (ref.func $1)
    )
   )
   (local.get $8)
  )
 )
 (func $5 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $4
    (i32.const 2147483647)
    (ref.i31
     (i32.const -65)
    )
   )
  )
  (drop
   (call $4
    (i32.const 256)
    (array.new_fixed $7 0)
   )
  )
 )
 (func $6 (type $13) (result exnref i32 arrayref)
  (local $0 i31ref)
  (local $1 (ref $2))
  (local $2 (ref null $5))
  (local $3 exnref)
  (local $4 f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (local.get $3)
   (ref.test (ref (exact $0))
    (array.new $0
     (i64.const 288230376151711744)
     (i32.and
      (i32.const 25)
      (i32.const 1023)
     )
    )
   )
   (ref.null none)
  )
 )
 (func $7 (type $6)
  (local $scratch (tuple exnref i32 arrayref))
  (local $scratch_1 i32)
  (local $scratch_2 exnref)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (block (result exnref)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $6)
      )
     )
    )
    (drop
     (block (result i32)
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
 )
 (@binaryen.js.called)
 (func $8 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 (ref $4))
  (local $7 anyref)
  (local $8 arrayref)
  (local $9 (ref null $4))
  (local $10 (ref null $4))
  (local $11 structref)
  (local $12 (ref null $1))
  (local $13 i32)
  (local $14 i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$0
    (i32.const 0)
   )
   (return
    (f32.const -2305843009213693952)
   )
  )
  (unreachable)
 )
 (func $9 (type $6)
  (local $0 (ref $2))
  (local $1 (ref $5))
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $8
    (ref.null none)
    (f64.const -2147483647.602)
    (array.new $1
     (block (result (ref (exact $0)))
      (loop $label
       (if
        (i32.eqz
         (global.get $global$16)
        )
        (then
         (global.set $global$16
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$16
        (i32.sub
         (global.get $global$16)
         (i32.const 1)
        )
       )
       (block $block
        (loop
         (if
          (i32.eqz
           (global.get $global$16)
          )
          (then
           (global.set $global$16
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$16
          (i32.sub
           (global.get $global$16)
           (i32.const 1)
          )
         )
         (try_table (catch_all $block)
          (block
           (call $fimport$6
            (local.tee $0
             (global.get $global$7)
            )
           )
           (return)
          )
          (unreachable)
         )
         (unreachable)
        )
        (unreachable)
       )
       (br_if $label
        (string.eq
         (string.const "\c2\a3\c2\a3")
         (string.const "\c2\a3")
        )
       )
       (nop)
      )
      (return)
     )
     (i32.and
      (i32.const 69)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const 256)
    (array.new_fixed $7 0)
   )
  )
  (drop
   (call $8
    (struct.new_default $8)
    (f64.const 4294939398)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 16)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 43)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const 268435455)
    (array.new_fixed $7 0)
   )
  )
 )
 (func $10 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 (ref null $2))
  (local $7 (ref array))
  (local $8 f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block (result f32)
   (call $fimport$5
    (v128.load offset=4
     (i64.and
      (i64.const -4294967294)
      (i64.const 15)
     )
    )
   )
   (f32.add
    (if (result f32)
     (global.get $global$4)
     (then
      (nop)
      (local.get $8)
     )
     (else
      (local.tee $8
       (loop (result f32)
        (if
         (i32.eqz
          (global.get $global$16)
         )
         (then
          (global.set $global$16
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$16
         (i32.sub
          (global.get $global$16)
          (i32.const 1)
         )
        )
        (local.tee $8
         (local.tee $8
          (f32.load offset=22 align=1
           (i64.and
            (i64x2.extract_lane 1
             (v128.const i32x4 0xffffa711 0xffffffff 0xffedba5e 0xc1efffff)
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
    (try $__t_16 (result f32) (do (try (result f32) (do 
      (f32.const -2147483648)
     ) (delegate $__t_16))) (catch_all (if (global.get $__rt) (then (rethrow $__t_16)))
(block
       (nop)
       (return
        (local.get $8)
       )
      )
(unreachable)))
   )
  )
 )
 (func $11 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 v128)
  (local $7 v128)
  (local $8 i32)
  (local $9 i32)
  (local $10 f64)
  (local $11 i64)
  (local $12 i64)
  (local $13 (ref null $4))
  (local $14 (ref $5))
  (local $15 i31ref)
  (local $16 anyref)
  (local $17 (ref $4))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (f32.const 1073741824)
 )
 (func $12 (type $6)
  (local $0 stringref)
  (local $1 (ref i31))
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $11
    (array.new $1
     (try_table (result (ref (exact $0)))
      (array.new $0
       (i64.const -1870983613)
       (i32.and
        (i32.const 62)
        (i32.const 1023)
       )
      )
     )
     (i32.and
      (i32.const 60)
      (i32.const 1023)
     )
    )
    (f64.const -nan:0xffffffffffff5)
    (ref.null none)
    (ref.null noexn)
    (i32.const 47693)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 20)
       (i32.const 1023)
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
   (call $11
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 39)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 80)
      (i32.const 1023)
     )
    )
    (f64.const -2147483647.796)
    (ref.null none)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i32.const -65)
      )
     )
     (unreachable)
    )
    (i32.const -2147483647)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 20)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 32)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $11
    (array.new $1
     (array.new $0
      (i64.const 4294967265)
      (i32.and
       (i32.const 8)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 94)
      (i32.const 1023)
     )
    )
    (f64.const -2048.107)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 16)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 1)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const 65534)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 99)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 37)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $11
    (ref.null none)
    (f64.const 1797693134862315708145274e284)
    (ref.null none)
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$0
       (ref.eq
        (array.new $0
         (i64.atomic.load32_u acqrel offset=4
          (i64.and
           (struct.get $2 2
            (if (result (ref $2))
             (i32.eqz
              (loop $label (result i32)
               (if
                (i32.eqz
                 (global.get $global$16)
                )
                (then
                 (global.set $global$16
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$16
                (i32.sub
                 (global.get $global$16)
                 (i32.const 1)
                )
               )
               (call $fimport$1
                (global.get $global$4)
               )
               (drop
                (br_on_null $label
                 (ref.func $8)
                )
               )
               (br_if $label
                (if (result i32)
                 (i32.const -65535)
                 (then
                  (call $fimport$7
                   (ref.null nofunc)
                  )
                  (i32.const -32768)
                 )
                 (else
                  (br_if $label
                   (if (result i32)
                    (ref.is_null
                     (local.tee $0
                      (string.const "\ed\a0\80\e2\82\ac\ed\a0\80")
                     )
                    )
                    (then
                     (i32.const -6938563)
                    )
                    (else
                     (global.get $global$4)
                    )
                   )
                  )
                  (br $label)
                 )
                )
               )
               (string.measure_wtf16
                (string.const "\f0\90\8d\88")
               )
              )
             )
             (then
              (global.get $global$7)
             )
             (else
              (global.get $global$7)
             )
            )
           )
           (i64.const 15)
          )
         )
         (i32.and
          (i32.const 67)
          (i32.const 1023)
         )
        )
        (try $__t_15 (result (ref i31)) (do (try (result (ref i31)) (do 
          (ref.i31
           (i32.const 2147483647)
          )
         ) (delegate $__t_15))) (catch $tag$0
          (local.set $2 (select (pop i32) (local.get $2) (i32.const 0)))
          (local.tee $1
           (ref.i31
            (i32.const -2147483647)
           )
          )
         ) (catch_all (if (global.get $__rt) (then (rethrow $__t_15)))
(try $__t_14 (result (ref i31)) (do
            (ref.i31
             (i32.const -35)
            )
           ) (catch $tag$0
            (local.set $3 (call $__popsink_0 (pop i32)))
            (ref.i31
             (i32.const 0)
            )
           ))))
       )
      )
     )
     (unreachable)
    )
    (i32.const -128)
    (array.new $1
     (array.new $0
      (i64.trunc_f64_u
       (f64.const 4294967293.241)
      )
      (i32.and
       (i32.const 84)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 89)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $13 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 f32)
  (local $13 v128)
  (local $14 i32)
  (local $15 f64)
  (local $16 f64)
  (local $17 structref)
  (local $18 structref)
  (local $19 i31ref)
  (local $20 i31ref)
  (local $21 arrayref)
  (local $22 (ref null $0))
  (local $23 (ref null $4))
  (local $24 funcref)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (f32.const 35184372088832)
 )
 (func $14 (type $6)
  (local $0 (ref $0))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $13
    (ref.i31
     (i32.const -6)
    )
    (f64.const -nan:0xffffffffffffc)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 45)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 81)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const -28129)
    (struct.new_default $8)
   )
  )
  (drop
   (call $13
    (struct.new_default $8)
    (f64.const 2.2250738585072014e-308)
    (array.new $1
     (local.tee $0
      (array.new_default $0
       (i32.and
        (i32.const 15)
        (i32.const 1023)
       )
      )
     )
     (i32.and
      (i32.const 33)
      (i32.const 1023)
     )
    )
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i32.const -262143)
      )
     )
     (unreachable)
    )
    (i32.const 16)
    (ref.i31
     (i32.const -2147483648)
    )
   )
  )
 )
 (func $15 (type $21) (param $0 f32) (param $1 i32)
  (local $2 v128)
  (local $3 i32)
  (local $4 exnref)
  (local $5 (ref $2))
  (local $6 (ref string))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (if
   (string.measure_wtf16
    (string.const "\e2\82\ac\f0\90\8d\88\c2\a3")
   )
   (then
    (drop
     (ref.func $2)
    )
    (block
     (try $__t_13  (do
       (block
        (block
         (call $fimport$4
          (f64.convert_i32_u
           (global.get $global$4)
          )
         )
         (return)
        )
        (unreachable)
       )
       (unreachable)
      ) (catch $tag$0
       (local.set $3 (local.tee $3 (pop i32)))
       (call $fimport$5
        (local.tee $2
         (v128.const i32x4 0x00ff00f1 0x010000ff 0x0000ff80 0x6f2600ff)
        )
       )
      ))
     (return)
    )
    (local.set $6
     (unreachable)
    )
   )
   (else
    (block $block
     (br_if $block
      (local.get $1)
     )
     (nop)
    )
   )
  )
 )
 (func $16 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (call $15
   (f32.const 244)
   (i32.const -2147483646)
  )
  (call $15
   (f32.const -nan:0x7fffc1)
   (i32.const -1)
  )
 )
 (@binaryen.js.called)
 (func $17 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 i64)
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 v128)
  (local $12 structref)
  (local $13 structref)
  (local $14 structref)
  (local $15 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block (result f32)
   (loop
    (if
     (i32.eqz
      (global.get $global$16)
     )
     (then
      (global.set $global$16
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$16
     (i32.sub
      (global.get $global$16)
      (i32.const 1)
     )
    )
    (call $fimport$1
     (ref.eq
      (ref.i31
       (i32.const 16777215)
      )
      (ref.i31
       (i32.const -1102978)
      )
     )
    )
   )
   (f32.const 11123)
  )
 )
 (func $18 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 i64)
  (local $13 (ref string))
  (local $14 eqref)
  (local $15 (ref null $5))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block (result f32)
   (local.set $4
    (i32.const 128)
   )
   (f32.const -nan:0x7fb73a)
  )
 )
 (func $19 (type $22) (param $0 (ref $1)) (param $1 (ref $2)) (param $2 (ref string)) (param $3 (ref $2)) (param $4 externref) (param $5 (ref $2)) (result f64)
  (local $6 (ref string))
  (local $7 (ref null $2))
  (local $8 eqref)
  (local $9 (ref $5))
  (local $10 (ref null $4))
  (local $11 (ref $0))
  (local $12 (ref $0))
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 f64)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.tee $20
   (f64.min
    (block (result f64)
     (block
      (loop
       (if
        (i32.eqz
         (global.get $global$16)
        )
        (then
         (global.set $global$16
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$16
        (i32.sub
         (global.get $global$16)
         (i32.const 1)
        )
       )
       (block
        (if
         (i32.lt_u
          (i32.add
           (local.tee $15
            (local.get $14)
           )
           (local.tee $16
            (i32.const 32768)
           )
          )
          (array.len
           (local.tee $11
            (array.new_default $0
             (i32.and
              (i32.const 84)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (if
           (i32.lt_u
            (i32.add
             (local.tee $17
              (local.get $13)
             )
             (local.tee $18
              (local.get $16)
             )
            )
            (array.len
             (local.tee $12
              (array.new_default $0
               (i32.and
                (i32.const 36)
                (i32.const 1023)
               )
              )
             )
            )
           )
           (then
            (array.copy $0 $0
             (local.get $11)
             (local.get $15)
             (local.get $12)
             (local.get $17)
             (local.get $18)
            )
           )
          )
         )
        )
        (call $fimport$2
         (global.get $global$6)
        )
       )
      )
      (call $fimport$0
       (i32.const -32422)
      )
     )
     (try $__t_12 (result f64) (do
       (f64.const -3402823466385288598117041e14)
      ) (catch $tag$0
(local.set $19 (local.tee $19 (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_12)))
(local.get $20)))
    )
    (local.get $20)
   )
  )
 )
 (func $20 (type $23) (param $0 (ref $5)) (result (ref null $4))
  (local $1 funcref)
  (local $2 (ref $1))
  (local $3 (ref $1))
  (local $4 i64)
  (local $5 f64)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (ref.null nofunc)
   )
  )
  (unreachable)
 )
 (func $21 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $20
    (ref.func $8)
   )
  )
  (drop
   (call $20
    (ref.func $13)
   )
  )
 )
 (func $22 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 v128)
  (local $15 v128)
  (local $16 stringref)
  (local $17 (ref null $1))
  (local $18 (ref null $5))
  (local $19 (ref string))
  (local $20 (ref string))
  (local $21 (ref string))
  (local $22 i31ref)
  (local $23 (ref $3))
  (local $24 (ref $3))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $19
   (string.const "\e2\82\ac\e2\82\ac\c2\a3")
  )
  (return_call_ref $4
   (array.new $1
    (try_table (result (ref (exact $0)))
     (array.new_default $0
      (i32.and
       (i32.const 80)
       (i32.const 1023)
      )
     )
    )
    (i32.and
     (i32.const 6)
     (i32.const 1023)
    )
   )
   (f64.const -1)
   (local.get $2)
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$0
      (try_table (result i32)
       (try $__t_11 (result i32) (do (try (result i32) (do 
         (global.get $global$4)
        ) (delegate $__t_11))) (catch $tag$0
(local.set $9 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_11)))
(local.tee $4
          (ref.eq
           (struct.new_default $8)
           (ref.i31
            (i32.const -55)
           )
          )
         )) (catch_all
         (select
          (stringview_wtf16.get_codeunit
           (local.tee $19
            (string.const "")
           )
           (local.get $4)
          )
          (block (result i32)
           (local.set $20
            (local.get $19)
           )
           (local.tee $4
            (if (result i32)
             (i32.lt_u
              (i32.add
               (local.tee $10
                (local.get $4)
               )
               (local.tee $11
                (string.measure_wtf16
                 (local.get $20)
                )
               )
              )
              (array.len
               (local.tee $23
                (array.new $3
                 (select
                  (string.measure_wtf16
                   (local.get $19)
                  )
                  (local.tee $4
                   (if (result i32)
                    (if (result i32)
                     (i31.get_s
                      (ref.as_non_null
                       (local.tee $22
                        (ref.i31
                         (i32.const -25)
                        )
                       )
                      )
                     )
                     (then
                      (i32.const -59)
                     )
                     (else
                      (i32.const -5497989)
                     )
                    )
                    (then
                     (local.get $4)
                    )
                    (else
                     (i32.const -12277)
                    )
                   )
                  )
                  (string.compare
                   (local.get $19)
                   (ref.cast (ref string)
                    (string.const "\ed\a0\80")
                   )
                  )
                 )
                 (i32.const 82)
                )
               )
              )
             )
             (then
              (string.encode_wtf16_array
               (local.get $20)
               (local.get $23)
               (local.get $10)
              )
             )
             (else
              (ref.eq
               (loop (result (ref i31))
                (if
                 (i32.eqz
                  (global.get $global$16)
                 )
                 (then
                  (global.set $global$16
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$16
                 (i32.sub
                  (global.get $global$16)
                  (i32.const 1)
                 )
                )
                (ref.as_non_null
                 (local.tee $22
                  (ref.i31
                   (i32.const 3870)
                  )
                 )
                )
               )
               (ref.i31
                (i32.const -103)
               )
              )
             )
            )
           )
          )
          (i32.const 0)
         )
        ))
      )
     )
    )
    (unreachable)
   )
   (block (result i32)
    (local.set $21
     (local.get $19)
    )
    (if (result i32)
     (i32.lt_u
      (i32.add
       (local.tee $12
        (local.get $4)
       )
       (local.tee $13
        (string.measure_wtf16
         (local.get $21)
        )
       )
      )
      (array.len
       (local.tee $24
        (array.new_default $3
         (i32.and
          (i32.const 12)
          (i32.const 1023)
         )
        )
       )
      )
     )
     (then
      (string.encode_wtf16_array
       (local.get $21)
       (local.get $24)
       (local.get $12)
      )
     )
     (else
      (block $block1 (result i32)
       (nop)
       (f64.ge
        (f64.div
         (local.tee $1
          (try_table (result f64) (catch $tag$0 $block1) (catch $tag$0 $block1)
           (global.get $global$14)
          )
         )
         (call $19
          (array.new $1
           (array.new $0
            (i64.const -2002684)
            (i32.and
             (i32.const 30)
             (i32.const 1023)
            )
           )
           (i32.and
            (i32.const 10)
            (i32.const 1023)
           )
          )
          (struct.new $2
           (local.get $4)
           (local.get $5)
           (i64.const -2813)
           (array.new $1
            (array.new $0
             (i64.const -7)
             (i32.and
              (i32.const 8)
              (i32.const 1023)
             )
            )
            (i32.and
             (i32.const 15)
             (i32.const 1023)
            )
           )
           (local.get $1)
          )
          (string.const "")
          (global.get $global$7)
          (loop $label (result nullexternref)
           (if
            (i32.eqz
             (global.get $global$16)
            )
            (then
             (global.set $global$16
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$16
            (i32.sub
             (global.get $global$16)
             (i32.const 1)
            )
           )
           (br_if $label
            (i32.eqz
             (i31.get_s
              (ref.as_non_null
               (local.get $22)
              )
             )
            )
           )
           (br_if $label
            (ref.eq
             (struct.new_default $8)
             (ref.i31
              (i32.const 2147483646)
             )
            )
           )
           (ref.cast nullexternref
            (ref.null noextern)
           )
          )
          (struct.new $2
           (local.get $4)
           (array.new $1
            (array.new $0
             (i64.const 8364933874301228662)
             (i32.and
              (i32.const 6)
              (i32.const 1023)
             )
            )
            (i32.and
             (i32.const 18)
             (i32.const 1023)
            )
           )
           (i64.const -83)
           (array.new_fixed $7 0)
           (global.get $global$14)
          )
         )
        )
        (local.tee $1
         (local.get $1)
        )
       )
      )
     )
    )
   )
   (local.get $5)
   (ref.func $10)
  )
 )
 (func $23 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $22
    (array.new $1
     (array.new $0
      (i64.const -25835)
      (i32.and
       (i32.const 95)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 67)
      (i32.const 1023)
     )
    )
    (f64.const 36028797018963968)
    (ref.null none)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i32.load offset=4 align=1
        (i64.and
         (global.get $global$6)
         (i64.const 15)
        )
       )
      )
     )
     (unreachable)
    )
    (i32.const -16)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 79)
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
 )
 (func $24 (type $24) (param $0 i32) (param $1 i64) (result eqref)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (array.new_fixed $7 0)
   )
  )
  (unreachable)
 )
 (func $25 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $24
    (i32.const 128)
    (i64.const -8358)
   )
  )
 )
 (func $26 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 (ref $1))
  (local $7 (ref $1))
  (local $8 (ref $1))
  (local $9 (ref $1))
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $scratch i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (ref.i31
    (i32.const 2052465982)
   )
  )
  (drop
   (local.tee $4
    (block (result i32)
     (local.set $scratch
      (i32.const -58)
     )
     (drop
      (struct.new $2
       (local.get $4)
       (array.new $1
        (array.new $0
         (i64.const 243)
         (i32.and
          (i32.const 24)
          (i32.const 1023)
         )
        )
        (i32.and
         (i32.const 6)
         (i32.const 1023)
        )
       )
       (i64.const 32767)
       (array.new_fixed $7 0)
       (local.get $1)
      )
     )
     (local.get $scratch)
    )
   )
  )
  (drop
   (loop $label (result (ref (exact $1)))
    (if
     (i32.eqz
      (global.get $global$16)
     )
     (then
      (global.set $global$16
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$16
     (i32.sub
      (global.get $global$16)
      (i32.const 1)
     )
    )
    (block
     (if
      (global.get $global$4)
      (then
       (call $fimport$4
        (global.get $global$14)
       )
       (local.set $4
        (local.get $4)
       )
      )
     )
     (call $fimport$7
      (ref.null nofunc)
     )
    )
    (br_if $label
     (i32.eqz
      (ref.eq
       (array.new $1
        (array.new $0
         (i64.const 89)
         (i32.and
          (i32.const 30)
          (i32.const 1023)
         )
        )
        (i32.and
         (i32.const 29)
         (i32.const 1023)
        )
       )
       (global.get $global$0)
      )
     )
    )
    (array.new $1
     (array.new $0
      (global.get $global$6)
      (i32.and
       (i32.const 93)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 23)
      (i32.const 1023)
     )
    )
   )
  )
  (block
   (call $fimport$3
    (try $__t_10 (result f32) (do (try (result f32) (do 
      (try $__t_9 (result f32) (do (try (result f32) (do 
        (f32.const -nan:0x7fff99)
       ) (delegate $__t_9))) (catch_all
        (f32.demote_f64
         (global.get $global$14)
        )
       ))
     ) (delegate $__t_10))) (catch_all (if (global.get $__rt) (then (rethrow $__t_10)))
(f32.const 4294967296)))
   )
   (return
    (f32.const -nan:0x7fe012)
   )
  )
  (unreachable)
 )
 (func $27 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $26
    (struct.new_default $8)
    (f64.const 62760)
    (array.new $1
     (array.new $0
      (i64.const -65536)
      (i32.and
       (i32.const 25)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 97)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const 64885)
    (struct.new_default $8)
   )
  )
 )
 (func $28 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 exnref)
  (local $7 (ref null $0))
  (local $8 (ref null $0))
  (local $9 arrayref)
  (local $10 funcref)
  (local $11 eqref)
  (local $12 eqref)
  (local $13 (ref null $2))
  (local $14 (ref $0))
  (local $15 (ref $1))
  (local $16 (ref $1))
  (local $17 (ref eq))
  (local $18 f64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i64)
  (local $22 i64)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (local $scratch (tuple (ref extern) f32))
  (local $scratch_33 (ref (exact $0)))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$16)
     )
     (then
      (global.set $global$16
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$16
     (i32.sub
      (global.get $global$16)
      (i32.const 1)
     )
    )
    (drop
     (br_on_null $label
      (array.new_fixed $7 0)
     )
    )
    (br_if $label
     (i32.eqz
      (block $block1 (result i32)
       (if
        (i32.lt_u
         (i32.add
          (local.tee $29
           (local.get $24)
          )
          (local.tee $30
           (ref.is_null
            (block $block (result eqref)
             (loop $label1
              (if
               (i32.eqz
                (global.get $global$16)
               )
               (then
                (global.set $global$16
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$16
               (i32.sub
                (global.get $global$16)
                (i32.const 1)
               )
              )
              (loop
               (if
                (i32.eqz
                 (global.get $global$16)
                )
                (then
                 (global.set $global$16
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$16
                (i32.sub
                 (global.get $global$16)
                 (i32.const 1)
                )
               )
               (block
                (nop)
                (memory.init $3
                 (i64.and
                  (local.get $22)
                  (i64.const 15)
                 )
                 (i32.const 1)
                 (i32.const 7)
                )
               )
              )
              (br_if $label1
               (block $block2 (result i32)
                (f64.store offset=22 align=2
                 (i64.and
                  (local.get $22)
                  (i64.const 15)
                 )
                 (local.get $1)
                )
                (drop
                 (br_on_cast_fail $block (ref eq) (ref $2)
                  (local.tee $17
                   (ref.i31
                    (i32.const 8)
                   )
                  )
                 )
                )
                (i32.load offset=22 align=1
                 (i64.and
                  (if (result i64)
                   (select
                    (local.get $25)
                    (local.get $4)
                    (i32.const 1)
                   )
                   (then
                    (local.tee $22
                     (global.get $global$6)
                    )
                   )
                   (else
                    (block
                     (try $__t_8  (do
                       (nop)
                      ) (catch $tag$0
(local.set $28 (i32.mul (pop i32) (i32.const -1)))
(if (global.get $__rt) (then (rethrow $__t_8)))
(nop)) (catch_all
                       (memory.init $5
                        (i64.and
                         (i64.const -36028797018963968)
                         (i64.const 15)
                        )
                        (i32.const 2)
                        (i32.const 2)
                       )
                      ))
                     (block
                      (local.set $18
                       (local.get $1)
                      )
                      (try_table (catch $tag$0 $block1) (catch $tag$0 $block2) (catch $tag$0 $block2)
                       (local.set $1
                        (select
                         (f64x2.extract_lane 1
                          (v128.const i32x4 0xffffffc0 0xffffffff 0x80000001 0xffffffff)
                         )
                         (local.get $1)
                         (local.get $4)
                        )
                       )
                      )
                     )
                    )
                    (br $label1)
                   )
                  )
                  (i64.const 15)
                 )
                )
               )
              )
              (block
               (nop)
               (nop)
              )
             )
             (struct.get $2 3
              (struct.new $2
               (i32.const -1200018586)
               (array.new $1
                (array.new $0
                 (global.get $global$6)
                 (i32.and
                  (i32.const 76)
                  (i32.const 1023)
                 )
                )
                (i32.and
                 (i32.const 11)
                 (i32.const 1023)
                )
               )
               (global.get $global$6)
               (array.new_fixed $7 0)
               (local.get $18)
              )
             )
            )
           )
          )
         )
         (array.len
          (local.tee $16
           (array.new $1
            (select (result (ref $0))
             (array.new_default $0
              (i32.and
               (i32.const 48)
               (i32.const 1023)
              )
             )
             (local.tee $14
              (if (result (ref $0))
               (i32.eqz
                (i32x4.extract_lane 0
                 (v128.const i32x4 0x0001a100 0x0122ffff 0xffbd0074 0xffb20535)
                )
               )
               (then
                (call_ref $10
                 (tuple.extract 2 0
                  (local.tee $scratch
                   (loop (type $14) (result (ref extern) f32)
                    (if
                     (i32.eqz
                      (global.get $global$16)
                     )
                     (then
                      (global.set $global$16
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$16
                     (i32.sub
                      (global.get $global$16)
                      (i32.const 1)
                     )
                    )
                    (tuple.make 2
                     (global.get $gimport$1)
                     (f32.const 29743)
                    )
                   )
                  )
                 )
                 (block (result (ref $10))
                  (drop
                   (tuple.extract 2 1
                    (local.get $scratch)
                   )
                  )
                  (ref.func $fimport$8)
                 )
                )
                (array.new $0
                 (global.get $global$6)
                 (i32.and
                  (i32.const 30)
                  (i32.const 1023)
                 )
                )
               )
               (else
                (try_table (result (ref $0)) (catch $tag$0 $block1) (catch $tag$0 $block1) (catch $tag$0 $block1)
                 (if (result (ref $0))
                  (i32.lt_u
                   (local.tee $27
                    (local.get $4)
                   )
                   (array.len
                    (local.tee $15
                     (local.get $5)
                    )
                   )
                  )
                  (then
                   (array.get $1
                    (local.get $15)
                    (local.get $27)
                   )
                  )
                  (else
                   (array.new $0
                    (i64.const -47)
                    (i32.and
                     (i32.const 15)
                     (i32.const 1023)
                    )
                   )
                  )
                 )
                )
               )
              )
             )
             (i32.const 32769)
            )
            (i32.and
             (i32.const 94)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (then
         (array.fill $1
          (local.get $16)
          (local.get $29)
          (local.tee $14
           (array.new_default $0
            (i32.and
             (i32.const 68)
             (i32.const 1023)
            )
           )
          )
          (local.get $30)
         )
        )
       )
       (drop
        (block (result (ref (exact $0)))
         (local.set $scratch_33
          (array.new_default $0
           (i32.and
            (i32.const 41)
            (i32.const 1023)
           )
          )
         )
         (local.set $31
          (i32.const 2147483647)
         )
         (local.get $scratch_33)
        )
       )
       (local.get $31)
      )
     )
    )
    (nop)
   )
   (return
    (f32.const -nan:0x7fdc39)
   )
  )
  (unreachable)
 )
 (func $29 (type $25) (param $0 stringref) (param $1 stringref) (param $2 v128) (param $3 f32) (result eqref)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i64)
  (local $28 f64)
  (local $29 (ref i31))
  (local $30 (ref null $3))
  (local $31 (ref string))
  (local $32 (ref string))
  (local $33 (ref string))
  (local $34 (ref string))
  (local $35 (ref string))
  (local $36 (ref $3))
  (local $37 (ref $3))
  (local $38 (ref $3))
  (local $39 (ref $3))
  (local $40 (ref null $0))
  (local $41 (ref null $1))
  (local $42 (ref $0))
  (local $43 nullref)
  (local $44 (ref $1))
  (local $45 (ref $2))
  (local $46 (ref null $2))
  (local $47 (ref null $5))
  (local $48 (ref null $5))
  (local $49 (ref $5))
  (local $scratch i32)
  (local $scratch_51 (ref (exact $0)))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $45
   (global.get $global$7)
  )
  (local.set $44
   (array.new $1
    (ref.as_non_null
     (local.get $40)
    )
    (i32.and
     (i32.const 15)
     (i32.const 1023)
    )
   )
  )
  (local.set $33
   (string.const "\f0\90\8d\88\c2\a3\f0\90\8d\88")
  )
  (local.set $29
   (ref.i31
    (i32.const -17)
   )
  )
  (loop $label (result (ref $0))
   (if
    (i32.eqz
     (global.get $global$16)
    )
    (then
     (global.set $global$16
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$16
    (i32.sub
     (global.get $global$16)
     (i32.const 1)
    )
   )
   (drop
    (block (result (ref (exact $0)))
     (local.set $scratch_51
      (array.new $0
       (global.get $global$6)
       (i32.and
        (i32.const 44)
        (i32.const 1023)
       )
      )
     )
     (local.set $26
      (block (result i32)
       (local.set $scratch
        (i32.const 0)
       )
       (drop
        (f64.const -nan:0xfffffffffffdd)
       )
       (local.get $scratch)
      )
     )
     (local.get $scratch_51)
    )
   )
   (if
    (local.get $26)
    (then
     (drop
      (global.get $global$14)
     )
     (drop
      (block (result (ref none))
       (atomic.fence acqrel)
       (try $__t_7 (result (ref none)) (do (try (result (ref none)) (do 
         (nop)
         (br $label)
        ) (delegate $__t_7))) (catch_all
         (ref.as_non_null
          (ref.null none)
         )
        ))
      )
     )
     (br_if $label
      (f64.ne
       (i64.load offset=2
        (i64.and
         (unreachable)
         (i64.const 15)
        )
       )
       (unreachable)
      )
     )
     (br $label)
    )
    (else
     (loop $label1
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block
       (call_ref $6
        (ref.func $21)
       )
       (nop)
      )
      (local.set $31
       (if (result (ref string))
        (global.get $global$4)
        (then
         (table.set $0
          (i32.const 6)
          (ref.as_non_null
           (ref.null nofunc)
          )
         )
         (br $label)
        )
        (else
         (f64.store offset=22 align=4
          (i64.and
           (i64.atomic.rmw16.cmpxchg_u acqrel offset=22
            (i64.and
             (local.get $27)
             (i64.const 15)
            )
            (local.get $27)
            (local.get $27)
           )
           (i64.const 15)
          )
          (block (result f64)
           (drop
            (br_on_null $label
             (local.tee $29
              (ref.i31
               (i32.const 65437)
              )
             )
            )
           )
           (local.tee $28
            (try $__t_6 (result f64) (do
              (f64.const -64)
             ) (catch_all
              (f64.const -129)
             ))
           )
          )
         )
         (string.const "\f0\90\8d\88843\c2\a3")
        )
       )
      )
      (br_if $label1
       (i32.eqz
        (if (result i32)
         (i32.lt_u
          (i32.add
           (local.tee $5
            (local.get $4)
           )
           (local.tee $6
            (string.measure_wtf16
             (local.get $31)
            )
           )
          )
          (array.len
           (local.tee $36
            (ref.as_non_null
             (local.tee $30
              (array.new_default $3
               (i32.and
                (i32.const 84)
                (i32.const 1023)
               )
              )
             )
            )
           )
          )
         )
         (then
          (string.encode_wtf16_array
           (local.get $31)
           (local.get $36)
           (local.get $5)
          )
         )
         (else
          (drop
           (i64.eq
            (i64.load16_s offset=1 align=1
             (i64.and
              (local.get $27)
              (i64.const 15)
             )
            )
            (i64.const -9007199254740992)
           )
          )
          (select
           (local.get $4)
           (ref.as_non_null
            (ref.null none)
           )
           (if (result i32)
            (i32.eqz
             (unreachable)
            )
            (then
             (drop
              (ref.as_non_null
               (ref.null none)
              )
             )
             (br $label1)
            )
            (else
             (nop)
             (global.get $global$4)
            )
           )
          )
         )
        )
       )
      )
      (drop
       (array.new $1
        (select (result (ref $0))
         (ref.as_non_null
          (local.tee $40
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
         (ref.as_non_null
          (local.get $40)
         )
         (i64.eqz
          (global.get $global$6)
         )
        )
        (i32.and
         (i32.const 18)
         (i32.const 1023)
        )
       )
      )
      (loop $label2
       (if
        (i32.eqz
         (global.get $global$16)
        )
        (then
         (global.set $global$16
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$16
        (i32.sub
         (global.get $global$16)
         (i32.const 1)
        )
       )
       (block
        (table.set $0
         (i32.const 5)
         (ref.func $29)
        )
        (br $label2)
       )
       (unreachable)
      )
      (unreachable)
     )
     (local.set $42
      (local.set $33
       (local.set $37
        (local.set $32
         (unreachable)
        )
       )
      )
     )
    )
   )
   (local.set $49
    (local.set $33
     (local.set $39
      (local.set $35
       (local.set $33
        (local.set $33
         (local.set $45
          (local.set $45
           (local.set $44
            (local.set $44
             (local.set $38
              (local.set $34
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
  )
 )
 (func $30 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $29
    (string.const "\ed\bd\88")
    (string.const "\c2\a3552\c2\a3")
    (v128.const i32x4 0x00d57264 0x7fffffff 0x8000c571 0x01000039)
    (f32.const -nan:0x7fff91)
   )
  )
 )
 (func $31 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 (ref null $4))
  (local $7 f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (i64.store8 offset=22
    (i64.and
     (loop (result i64)
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block (result i64)
       (call $fimport$7
        (global.get $global$15)
       )
       (block
        (loop $label
         (if
          (i32.eqz
           (global.get $global$16)
          )
          (then
           (global.set $global$16
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$16
          (i32.sub
           (global.get $global$16)
           (i32.const 1)
          )
         )
         (block
          (atomic.fence acqrel)
          (br $label)
         )
         (unreachable)
        )
        (unreachable)
       )
       (unreachable)
      )
     )
     (i64.const 15)
    )
    (i64.const 255)
   )
   (return
    (f32.const -nan:0x7f8578)
   )
  )
  (unreachable)
 )
 (func $32 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f64)
  (local $10 f64)
  (local $11 v128)
  (local $12 f32)
  (local $13 (ref $4))
  (local $14 (ref null $1))
  (local $15 anyref)
  (local $16 (ref string))
  (local $17 (ref $5))
  (local $18 (ref $5))
  (local $scratch i64)
  (local $scratch_20 f64)
  (local $scratch_21 i64)
  (local $scratch_22 (tuple nullref v128 i32 f64))
  (local $scratch_23 i32)
  (local $scratch_24 v128)
  (local $scratch_25 nullref)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block (result f32)
   (call $fimport$7
    (ref.func $32)
   )
   (call_ref $4
    (local.get $2)
    (block (result f64)
     (drop
      (block (result i64)
       (local.set $scratch_21
        (i64.const -126)
       )
       (local.set $10
        (block (result f64)
         (local.set $scratch_20
          (f64.const 18446744073709551615)
         )
         (drop
          (block (result i64)
           (local.set $scratch
            (i64.const -102)
           )
           (drop
            (ref.null noexn)
           )
           (local.get $scratch)
          )
         )
         (local.get $scratch_20)
        )
       )
       (local.get $scratch_21)
      )
     )
     (local.get $10)
    )
    (local.get $5)
    (try_table (result (ref exn))
     (block $block (result (ref exn))
      (try_table (catch_all_ref $block)
       (throw $tag$1)
      )
      (unreachable)
     )
    )
    (i32.atomic.load8_u offset=22
     (i64.and
      (loop (result i64)
       (if
        (i32.eqz
         (global.get $global$16)
        )
        (then
         (global.set $global$16
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$16
        (i32.sub
         (global.get $global$16)
         (i32.const 1)
        )
       )
       (block (result i64)
        (call $fimport$4
         (loop (result f64)
          (if
           (i32.eqz
            (global.get $global$16)
           )
           (then
            (global.set $global$16
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$16
           (i32.sub
            (global.get $global$16)
            (i32.const 1)
           )
          )
          (try $__t_5 (result f64) (do (try (result f64) (do 
            (local.get $1)
           ) (delegate $__t_5))) (catch_all (if (global.get $__rt) (then (rethrow $__t_5)))
(f64.const -65536)))
         )
        )
        (global.get $global$6)
       )
      )
      (i64.const 15)
     )
    )
    (loop $label (result (ref (exact $1)))
     (if
      (i32.eqz
       (global.get $global$16)
      )
      (then
       (global.set $global$16
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$16
      (i32.sub
       (global.get $global$16)
       (i32.const 1)
      )
     )
     (block
      (call $fimport$5
       (v128.const i32x4 0x22005de0 0xf5800100 0x0979307e 0x01ff1a40)
      )
      (call $fimport$4
       (f64.mul
        (local.get $1)
        (block (result f64)
         (drop
          (block (result nullref)
           (local.set $scratch_25
            (tuple.extract 4 0
             (local.tee $scratch_22
              (if (type $11) (result nullref v128 i32 f64)
               (i32.eqz
                (stringview_wtf16.get_codeunit
                 (local.tee $16
                  (string.const "")
                 )
                 (block (result i32)
                  (local.set $8
                   (ref.eq
                    (array.new_fixed $7 0)
                    (array.new $0
                     (i64.const 4294967295)
                     (i32.and
                      (i32.const 84)
                      (i32.const 1023)
                     )
                    )
                   )
                  )
                  (local.get $8)
                 )
                )
               )
               (then
                (v128.store offset=22 align=8
                 (i64.and
                  (global.get $global$6)
                  (i64.const 15)
                 )
                 (v128.const i32x4 0xffffff88 0x00000008 0x0000005c 0xffff0000)
                )
                (tuple.make 4
                 (ref.null none)
                 (v128.const i32x4 0x4f7fffa6 0x5e800000 0x53000000 0x7f7fffff)
                 (i32.const 63)
                 (f64.const 1512461162)
                )
               )
               (else
                (call $fimport$8
                 (global.get $gimport$0)
                )
                (tuple.make 4
                 (ref.null none)
                 (v128.const i32x4 0xffde2e62 0xffffff91 0x00010000 0xffffffbf)
                 (i32.const 2)
                 (f64.const -nan:0xfffffffffffff)
                )
               )
              )
             )
            )
           )
           (drop
            (block (result v128)
             (local.set $scratch_24
              (tuple.extract 4 1
               (local.get $scratch_22)
              )
             )
             (drop
              (block (result i32)
               (local.set $scratch_23
                (tuple.extract 4 2
                 (local.get $scratch_22)
                )
               )
               (local.set $10
                (tuple.extract 4 3
                 (local.get $scratch_22)
                )
               )
               (local.get $scratch_23)
              )
             )
             (local.get $scratch_24)
            )
           )
           (local.get $scratch_25)
          )
         )
         (local.get $10)
        )
       )
      )
      (nop)
     )
     (block
      (if
       (i32.eqz
        (ref.eq
         (local.tee $5
          (array.new $1
           (loop $label1 (result (ref none))
            (if
             (i32.eqz
              (global.get $global$16)
             )
             (then
              (global.set $global$16
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$16
             (i32.sub
              (global.get $global$16)
              (i32.const 1)
             )
            )
            (block
             (drop
              (br_on_null $label
               (string.const "\c2\a3")
              )
             )
             (drop
              (br_on_null $label1
               (local.tee $17
                (local.tee $18
                 (global.get $global$15)
                )
               )
              )
             )
            )
            (br_if $label1
             (i32.eqz
              (i64.lt_s
               (i64.const 65502)
               (i64.const -2305843009213693951)
              )
             )
            )
            (ref.as_non_null
             (ref.null none)
            )
           )
           (i32.and
            (i32.const 38)
            (i32.const 1023)
           )
          )
         )
         (loop (result (ref (exact $8)))
          (if
           (i32.eqz
            (global.get $global$16)
           )
           (then
            (global.set $global$16
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$16
           (i32.sub
            (global.get $global$16)
            (i32.const 1)
           )
          )
          (struct.new_default $8)
         )
        )
       )
       (then
        (call $fimport$7
         (ref.func $32)
        )
       )
      )
      (return
       (f32.const -nan:0x7fff8d)
      )
     )
     (unreachable)
    )
    (ref.func $18)
   )
  )
 )
 (func $33 (type $6)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 f32)
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 (ref string))
  (local $13 (ref $1))
  (local $14 (ref $2))
  (local $15 (ref $3))
  (local $16 (ref $3))
  (local $17 (ref $3))
  (local $18 stringref)
  (local $19 (ref i31))
  (local $20 (ref $5))
  (local $21 (ref $5))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $19
   (ref.i31
    (i32.const -2048)
   )
  )
  (drop
   (call $32
    (array.new $1
     (array.new $0
      (i64.const -14)
      (i32.and
       (i32.const 61)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 88)
      (i32.const 1023)
     )
    )
    (f64.const -18014398509481984)
    (array.new $1
     (loop $label (result (ref (exact $0)))
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block
       (data.drop $4)
      )
      (br_if $label
       (i32.eqz
        (local.tee $0
         (i8x16.extract_lane_s 6
          (v128.const i32x4 0xfffffffe 0x432fffff 0x00000000 0x42e00000)
         )
        )
       )
      )
      (ref.cast (ref (exact $0))
       (array.new $0
        (i64.add
         (i64.const 2147483648)
         (global.get $global$6)
        )
        (i32.and
         (i32.const 88)
         (i32.const 1023)
        )
       )
      )
     )
     (i32.and
      (i32.const 84)
      (i32.const 1023)
     )
    )
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (i32.mul
        (global.get $global$4)
        (stringview_wtf16.get_codeunit
         (string.const "\f0\90\8d\88\e2\82\ac")
         (block (result i32)
          (local.set $12
           (local.tee $10
            (block $block1 (result (ref string))
             (if
              (i32.lt_u
               (local.tee $1
                (local.get $0)
               )
               (array.len
                (local.tee $13
                 (loop $label1 (result (ref $1))
                  (if
                   (i32.eqz
                    (global.get $global$16)
                   )
                   (then
                    (global.set $global$16
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$16
                   (i32.sub
                    (global.get $global$16)
                    (i32.const 1)
                   )
                  )
                  (block
                   (nop)
                   (call $fimport$5
                    (try $__t_4 (result v128) (do
                      (v128.const i32x4 0x9817ba0a 0x7f006700 0x00540000 0x1eb90029)
                     ) (catch_all
                      (v128.const i32x4 0x55ed8600 0x3865953c 0xfff70172 0x22bf0000)
                     ))
                   )
                  )
                  (br_if $label1
                   (i32.eqz
                    (try_table (result i32) (catch_all $label1)
                     (local.get $0)
                    )
                   )
                  )
                  (struct.get $2 1
                   (struct.new $2
                    (local.get $0)
                    (array.new $1
                     (array.new $0
                      (i64.const 2909013365)
                      (i32.and
                       (i32.const 4)
                       (i32.const 1023)
                      )
                     )
                     (i32.and
                      (i32.const 89)
                      (i32.const 1023)
                     )
                    )
                    (i64.const -65534)
                    (array.new_fixed $7 0)
                    (f64.const 2305843009213693952)
                   )
                  )
                 )
                )
               )
              )
              (then
               (array.set $1
                (local.get $13)
                (local.get $1)
                (array.new_default $0
                 (i32.and
                  (i32.const 61)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
             (drop
              (ref.as_non_null
               (local.tee $18
                (ref.cast (ref string)
                 (br_if $block1
                  (string.const "\f0\90\8d\88")
                  (local.get $0)
                 )
                )
               )
              )
             )
             (br_if $block1
              (block
               (drop
                (i64.and
                 (global.get $global$6)
                 (i64.const 15)
                )
               )
               (drop
                (if (result i32)
                 (i32.eqz
                  (local.get $0)
                 )
                 (then
                  (loop (result i32)
                   (if
                    (i32.eqz
                     (global.get $global$16)
                    )
                    (then
                     (global.set $global$16
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$16
                    (i32.sub
                     (global.get $global$16)
                     (i32.const 1)
                    )
                   )
                   (local.get $0)
                  )
                 )
                 (else
                  (struct.get_s $2 0
                   (local.tee $14
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                )
               )
               (block
                (nop)
                (return)
               )
               (unreachable)
              )
              (i32.eqz
               (local.set $15
                (local.set $11
                 (unreachable)
                )
               )
              )
             )
            )
           )
          )
          (local.set $7
           (if (result i32)
            (i32.lt_u
             (i32.add
              (local.tee $4
               (f32.le
                (local.get $9)
                (f32.const -4194303)
               )
              )
              (local.tee $5
               (string.measure_wtf16
                (local.get $12)
               )
              )
             )
             (array.len
              (local.tee $17
               (local.tee $16
                (select (result (ref (exact $3)))
                 (array.new $3
                  (local.get $0)
                  (i32.and
                   (i32.const 6)
                   (i32.const 1023)
                  )
                 )
                 (array.new $3
                  (local.get $0)
                  (i32.and
                   (i32.const 13)
                   (i32.const 1023)
                  )
                 )
                 (stringview_wtf16.get_codeunit
                  (ref.cast (ref string)
                   (loop (result (ref string))
                    (if
                     (i32.eqz
                      (global.get $global$16)
                     )
                     (then
                      (global.set $global$16
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$16
                     (i32.sub
                      (global.get $global$16)
                      (i32.const 1)
                     )
                    )
                    (block (result (ref string))
                     (loop $label2
                      (if
                       (i32.eqz
                        (global.get $global$16)
                       )
                       (then
                        (global.set $global$16
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$16
                       (i32.sub
                        (global.get $global$16)
                        (i32.const 1)
                       )
                      )
                      (call $fimport$2
                       (select
                        (i64.trunc_sat_f64_s
                         (f64.const 1)
                        )
                        (try_table (result i64) (catch_all $label2)
                         (local.get $8)
                        )
                        (string.measure_wtf16
                         (ref.as_non_null
                          (local.get $18)
                         )
                        )
                       )
                      )
                     )
                     (local.get $10)
                    )
                   )
                  )
                  (local.get $0)
                 )
                )
               )
              )
             )
            )
            (then
             (string.encode_wtf16_array
              (local.get $12)
              (local.get $17)
              (local.get $4)
             )
            )
            (else
             (ref.eq
              (if (result (ref i31))
               (i32.eqz
                (local.get $0)
               )
               (then
                (call $fimport$8
                 (string.const "")
                )
                (drop
                 (ref.i31
                  (i32.const -5633974)
                 )
                )
                (drop
                 (ref.cast (ref i31)
                  (local.tee $19
                   (ref.i31
                    (i32.const 64)
                   )
                  )
                 )
                )
                (drop
                 (string.eq
                  (string.const "")
                  (ref.as_non_null
                   (local.get $18)
                  )
                 )
                )
                (drop
                 (array.new_fixed $7 0)
                )
                (block
                 (call $fimport$3
                  (try $__t_3 (result f32) (do
                    (local.tee $9
                     (local.get $9)
                    )
                   ) (catch $tag$0
                    (local.set $6 (select (pop i32) (local.get $6) (i32.const 7)))
                    (local.get $9)
                   ) (catch_all (if (global.get $__rt) (then (rethrow $__t_3)))
(local.get $9)))
                 )
                 (return)
                )
                (unreachable)
               )
               (else
                (call $fimport$5
                 (v128.const i32x4 0x80020001 0x00018000 0xffff8001 0xffffffce)
                )
                (local.tee $19
                 (local.get $19)
                )
               )
              )
              (struct.new_default $8)
             )
            )
           )
          )
          (local.get $7)
         )
        )
       )
      )
     )
     (unreachable)
    )
    (i32.const -2147483648)
    (array.new $1
     (array.new $0
      (i64.const 4294967232)
      (i32.and
       (i32.const 25)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 78)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $32
    (array.new $1
     (array.new $0
      (i64.div_s
       (i64.const -34359738368)
       (local.tee $8
        (i64.extend_i32_s
         (i32.const -29864)
        )
       )
      )
      (i32.and
       (i32.const 82)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 62)
      (i32.const 1023)
     )
    )
    (f64.const -nan:0xfffffffffffbc)
    (ref.null none)
    (block $block2 (result (ref exn))
     (try_table (catch_all_ref $block2)
      (throw $tag$0
       (select
        (block (result i32)
         (call $fimport$7
          (ref.func $33)
         )
         (block
          (call $fimport$7
           (ref.cast (ref $5)
            (local.tee $20
             (local.tee $21
              (global.get $global$15)
             )
            )
           )
          )
          (block
           (drop
            (ref.as_non_null
             (local.get $18)
            )
           )
           (return)
          )
          (unreachable)
         )
         (unreachable)
        )
        (ref.is_null
         (array.new $0
          (local.get $8)
          (i32.and
           (i32.const 26)
           (i32.const 1023)
          )
         )
        )
        (local.get $0)
       )
      )
     )
     (unreachable)
    )
    (i32.const -21)
    (array.new $1
     (array.new $0
      (local.get $8)
      (i32.and
       (i32.const 22)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 18)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $34 (type $26) (param $0 i64) (param $1 (ref $5)) (result (ref string))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block (result (ref string))
   (call $fimport$5
    (v128.const i32x4 0xffff867c 0xffffffff 0x00000000 0x00010000)
   )
   (string.const "\e2\82\ac\f0\90\8d\88")
  )
 )
 (func $35 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $34
    (i64.const -115)
    (ref.func $26)
   )
  )
 )
 (@binaryen.js.called)
 (func $36 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 structref)
  (local $7 (ref null $4))
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref eq))
  (local $11 (ref $1))
  (local $12 (ref null $5))
  (local $13 i64)
  (local $14 f64)
  (local $15 f64)
  (local $16 v128)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (f32.const -nan:0x7fff81)
 )
 (func $37 (type $6)
  (local $0 (ref $2))
  (local $1 (ref struct))
  (local $2 (ref string))
  (local $3 (ref string))
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $36
    (array.new $1
     (array.new $0
      (i64.const 4289486166)
      (i32.and
       (i32.const 88)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 27)
      (i32.const 1023)
     )
    )
    (f64.const 18014398509481984)
    (array.new $1
     (array.new $0
      (i64.const 1)
      (i32.and
       (i32.const 44)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 41)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const -129)
    (array.new $1
     (array.new $0
      (i64.const -67)
      (i32.and
       (i32.const 50)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 41)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $36
    (ref.null none)
    (f64.const 135)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 30)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 22)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
    (i32.const -128)
    (array.new $1
     (block $block (result (ref (exact $0)))
      (drop
       (br_on_cast $block (ref none) (ref none)
        (ref.cast (ref none)
         (if (result (ref (exact $1)))
          (i32.const 24415)
          (then
           (call $fimport$0
            (i32.const 536870911)
           )
           (return)
          )
          (else
           (struct.set $2 3
            (local.tee $0
             (struct.new $2
              (i32.const 4194304)
              (array.new $1
               (ref.as_non_null
                (ref.null none)
               )
               (i32.and
                (i32.const 60)
                (i32.const 1023)
               )
              )
              (i64.const -379024)
              (array.new $0
               (i64.const 1)
               (i32.const 86)
              )
              (global.get $global$14)
             )
            )
            (ref.null none)
           )
           (ref.cast (ref (exact $1))
            (if (result (ref (exact $1)))
             (i32.eqz
              (global.get $global$4)
             )
             (then
              (array.new $1
               (ref.as_non_null
                (ref.null none)
               )
               (i32.and
                (i32.const 45)
                (i32.const 1023)
               )
              )
             )
             (else
              (nop)
              (select (result (ref none))
               (ref.as_non_null
                (ref.null none)
               )
               (loop (result (ref none))
                (if
                 (i32.eqz
                  (global.get $global$16)
                 )
                 (then
                  (global.set $global$16
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$16
                 (i32.sub
                  (global.get $global$16)
                  (i32.const 1)
                 )
                )
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (stringview_wtf16.get_codeunit
                (local.tee $2
                 (local.tee $3
                  (string.const "")
                 )
                )
                (local.get $4)
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
       (f32.load offset=22
        (i64.and
         (global.get $global$6)
         (i64.const 15)
        )
       )
      )
      (try_table (result (ref (exact $0)))
       (array.new $0
        (i64.const -100)
        (i32.and
         (i32.const 78)
         (i32.const 1023)
        )
       )
      )
     )
     (i32.and
      (i32.const 46)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $38 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 (ref null $4))
  (local $7 (ref $3))
  (local $8 (ref $3))
  (local $9 (ref $3))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 (ref string))
  (local $13 (ref string))
  (local $14 (ref string))
  (local $15 (ref string))
  (local $16 (ref $0))
  (local $17 (ref null $0))
  (local $18 (ref none))
  (local $19 (ref exn))
  (local $20 (ref exn))
  (local $21 i64)
  (local $22 f32)
  (local $23 f32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $scratch f32)
  (local $scratch_31 nullref)
  (local $scratch_32 f32)
  (local $scratch_33 i32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.set $9
   (array.new_default $3
    (i32.and
     (i32.const 92)
     (i32.const 1023)
    )
   )
  )
  (loop $label (result f32)
   (if
    (i32.eqz
     (global.get $global$16)
    )
    (then
     (global.set $global$16
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$16
    (i32.sub
     (global.get $global$16)
     (i32.const 1)
    )
   )
   (drop
    (br_on_null $label
     (loop (result (ref $5))
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block (result (ref $5))
       (call $fimport$3
        (f32x4.extract_lane 3
         (v128.const i32x4 0xffeeffff 0x00007163 0xff95ff80 0xc9450097)
        )
       )
       (global.get $global$15)
      )
     )
    )
   )
   (call $fimport$4
    (f64.promote_f32
     (f32.convert_i64_s
      (i64.const 1583692607)
     )
    )
   )
   (drop
    (select (result (ref string))
     (string.const "\ed\a0\80\ed\a0\80")
     (string.const "")
     (global.get $global$4)
    )
   )
   (drop
    (global.get $global$7)
   )
   (drop
    (local.get $4)
   )
   (drop
    (array.new $1
     (array.new $0
      (i64.const -4294967295)
      (i32.and
       (i32.const 76)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 79)
      (i32.const 1023)
     )
    )
   )
   (drop
    (loop $label2 (result i64)
     (if
      (i32.eqz
       (global.get $global$16)
      )
      (then
       (global.set $global$16
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$16
      (i32.sub
       (global.get $global$16)
       (i32.const 1)
      )
     )
     (block
      (call $fimport$5
       (v128.const i32x4 0x00400001 0x00000000 0xffffed27 0xffffffff)
      )
      (call $fimport$2
       (block (result i64)
        (call $fimport$2
         (i64.const 8)
        )
        (loop $label1 (result i64)
         (if
          (i32.eqz
           (global.get $global$16)
          )
          (then
           (global.set $global$16
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$16
          (i32.sub
           (global.get $global$16)
           (i32.const 1)
          )
         )
         (local.set $3
          (try_table (result (ref exn)) (catch_all $label)
           (block $block (result (ref exn))
            (try_table (catch_all_ref $block)
             (throw $tag$0
              (local.get $4)
             )
            )
            (unreachable)
           )
          )
         )
         (br_if $label1
          (i32.eqz
           (memory.atomic.notify offset=2
            (i64.and
             (i64.atomic.rmw.xchg offset=3
              (i64.and
               (local.get $21)
               (i64.const 15)
              )
              (local.get $21)
             )
             (i64.const 15)
            )
            (i32.const -128)
           )
          )
         )
         (local.get $21)
        )
       )
      )
     )
     (block
      (br $label2)
     )
     (local.set $10
      (local.set $7
       (local.set $8
        (local.set $9
         (local.set $12
          (unreachable)
         )
        )
       )
      )
     )
    )
   )
   (drop
    (ref.null none)
   )
   (if
    (i32.lt_s
     (ref.eq
      (ref.i31
       (i32.const -12955)
      )
      (ref.i31
       (i32.const -65536)
      )
     )
     (local.get $4)
    )
    (then
     (if
      (i32.lt_u
       (local.tee $27
        (ref.eq
         (ref.as_non_null
          (ref.null none)
         )
         (ref.null none)
        )
       )
       (array.len
        (local.tee $18
         (select (result (ref none))
          (ref.as_non_null
           (ref.null none)
          )
          (ref.cast (ref none)
           (ref.as_non_null
            (ref.null none)
           )
          )
          (if (result i32)
           (i32.eqz
            (string.measure_wtf16
             (local.tee $13
              (local.tee $14
               (string.const "\ed\a0\80\e2\82\ac944")
              )
             )
            )
           )
           (then
            (local.set $scratch_33
             (i32.const 2147483647)
            )
            (drop
             (block (result f32)
              (local.set $scratch_32
               (f32.const 1)
              )
              (drop
               (block (result nullref)
                (local.set $scratch_31
                 (ref.null none)
                )
                (drop
                 (block (result f32)
                  (local.set $scratch
                   (f32.const 288230376151711744)
                  )
                  (drop
                   (i64.const -59498485)
                  )
                  (local.get $scratch)
                 )
                )
                (local.get $scratch_31)
               )
              )
              (local.get $scratch_32)
             )
            )
            (local.get $scratch_33)
           )
           (else
            (local.get $4)
           )
          )
         )
        )
       )
      )
      (then
       (drop
        (local.get $18)
       )
       (drop
        (local.get $27)
       )
       (drop
        (local.tee $16
         (try $__t_2 (result (ref $0)) (do (try (result (ref $0)) (do 
           (ref.as_non_null
            (local.tee $17
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          ) (delegate $__t_2))) (catch $tag$0
(local.set $26 (i32.eqz (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_2)))
(try_table (result (ref none)) (catch_all $label)
            (br_on_null $label
             (ref.as_non_null
              (ref.null none)
             )
            )
           )))
        )
       )
       (unreachable)
      )
     )
     (drop
      (ref.null none)
     )
     (drop
      (f64.convert_i32_s
       (local.get $4)
      )
     )
     (loop
      (if
       (i32.eqz
        (global.get $global$16)
       )
       (then
        (global.set $global$16
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$16
       (i32.sub
        (global.get $global$16)
        (i32.const 1)
       )
      )
      (block
       (call $fimport$1
        (ref.is_null
         (struct.new_default $8)
        )
       )
       (return
        (f32.const -274877906944)
       )
      )
      (unreachable)
     )
     (local.set $19
      (local.set $20
       (local.set $11
        (local.set $15
         (unreachable)
        )
       )
      )
     )
    )
    (else
     (call $fimport$3
      (local.tee $22
       (try_table (result f32) (catch_all $label)
        (f32.const -0.6600000262260437)
       )
      )
     )
     (br $label)
    )
   )
   (unreachable)
  )
 )
 (@binaryen.js.called)
 (func $39 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 (ref null $5))
  (local $7 (ref eq))
  (local $8 f32)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (local.tee $8
   (f32.const -nan:0x7fffbc)
  )
 )
 (func $40 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $39
    (array.new_fixed $7 0)
    (f64.const -nan:0xfffffffffff90)
    (ref.null none)
    (ref.null noexn)
    (i32.const 512)
    (array.new_fixed $7 0)
   )
  )
 )
 (func $41 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 i64)
  (local $14 (ref null $2))
  (local $15 (ref null $5))
  (local $16 (ref null $1))
  (local $17 (ref null $1))
  (local $18 stringref)
  (local $19 eqref)
  (local $20 exnref)
  (local $21 funcref)
  (local $22 anyref)
  (local $23 arrayref)
  (local $24 (ref array))
  (local $25 (ref $5))
  (local $26 (ref $5))
  (local $27 (ref $5))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (f32.const 35184372088832)
 )
 (func $42 (type $6)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 (ref $0))
  (local $7 (ref $0))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $41
    (array.new $1
     (block $block (result (ref (exact $0)))
      (if
       (i32.lt_u
        (i32.add
         (local.tee $2
          (i31.get_s
           (try $__t_1 (result (ref i31)) (do (try (result (ref i31)) (do 
             (ref.i31
              (i32.const -33)
             )
            ) (delegate $__t_1))) (catch $tag$0
             (local.set $0 (pop i32))
             (ref.i31
              (i32.const 343423047)
             )
            ) (catch_all (if (global.get $__rt) (then (rethrow $__t_1)))
(nop)
(return)))
          )
         )
         (local.tee $3
          (i32.load offset=4 align=2
           (i64.and
            (i64.const -77)
            (i64.const 15)
           )
          )
         )
        )
        (array.len
         (local.tee $6
          (try_table (result (ref (exact $0)))
           (br_on_cast $block (ref (exact $0)) (ref (exact $0))
            (try $__t_0 (result (ref (exact $0))) (do (try (result (ref (exact $0))) (do 
              (try_table (result (ref (exact $0)))
               (array.new_default $0
                (i32.and
                 (i32.const 98)
                 (i32.const 1023)
                )
               )
              )
             ) (delegate $__t_0))) (catch $tag$0
              (throw $tag$0 (pop i32))
              (array.new_default $0
               (i32.and
                (i32.const 88)
                (i32.const 1023)
               )
              )
             ))
           )
          )
         )
        )
       )
       (then
        (if
         (i32.lt_u
          (i32.add
           (local.tee $4
            (global.get $global$4)
           )
           (local.tee $5
            (local.get $3)
           )
          )
          (array.len
           (local.tee $7
            (array.new_default $0
             (i32.and
              (i32.const 10)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (array.copy $0 $0
           (local.get $6)
           (local.get $2)
           (local.get $7)
           (local.get $4)
           (local.get $5)
          )
         )
        )
       )
      )
      (return)
     )
     (i32.and
      (i32.const 99)
      (i32.const 1023)
     )
    )
    (f64.const 24)
    (array.new $1
     (array.new_default $0
      (i32.and
       (i32.const 11)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 3)
      (i32.const 1023)
     )
    )
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$0
       (global.get $global$4)
      )
     )
     (unreachable)
    )
    (i32.const -8)
    (array.new $1
     (array.new $0
      (i64.const 22)
      (i32.and
       (i32.const 71)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 49)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $43 (type $27) (param $0 i32) (param $1 i32) (param $2 f32) (param $3 i32) (param $4 stringref)
  (local $5 f32)
  (local $6 i64)
  (local $7 i64)
  (local $8 (ref null $4))
  (local $9 (ref null $5))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (nop)
 )
 (@binaryen.js.called)
 (func $44 (type $28) (result stringref)
  (local $0 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (string.const "54\e2\82\ac")
   )
  )
  (unreachable)
 )
 (func $45 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $44)
  )
 )
 (func $46 (type $5) (param $0 eqref) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref any)) (result f32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 v128)
  (local $12 f64)
  (local $13 f32)
  (local $14 (ref null $2))
  (local $15 funcref)
  (local $16 (ref $5))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (block
    (if
     (i32.eqz
      (stringview_wtf16.get_codeunit
       (string.const "")
       (block (result i32)
        (local.set $10
         (global.get $global$4)
        )
        (local.get $10)
       )
      )
     )
     (then
      (memory.init $5
       (i64.and
        (local.get $8)
        (i64.const 15)
       )
       (i32.const 3)
       (i32.const 4)
      )
      (block
       (call $fimport$2
        (global.get $global$6)
       )
       (call $fimport$1
        (local.get $4)
       )
      )
     )
    )
    (return
     (f32.const -1152921504606846976)
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $47 (type $29) (result (ref null $1))
  (local $0 (ref eq))
  (local $1 (ref null $2))
  (local $2 externref)
  (local $3 (ref $0))
  (local $4 (ref string))
  (local $5 f32)
  (local $6 f32)
  (local $7 v128)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (select (result (ref (exact $1)))
   (array.new $1
    (array.new_default $0
     (i32.and
      (i32.const 23)
      (i32.const 1023)
     )
    )
    (i32.and
     (i32.const 9)
     (i32.const 1023)
    )
   )
   (array.new $1
    (array.new $0
     (global.get $global$6)
     (i32.and
      (i32.const 22)
      (i32.const 1023)
     )
    )
    (i32.and
     (i32.const 87)
     (i32.const 1023)
    )
   )
   (global.get $global$4)
  )
 )
 (func $48 (type $6)
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (drop
   (call $47)
  )
  (drop
   (call $47)
  )
 )
 (func $49 (type $4) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref null $1)) (param $3 exnref) (param $4 i32) (param $5 (ref $1)) (result f32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 v128)
  (local $21 v128)
  (local $22 f32)
  (local $23 (ref $2))
  (local $24 (ref null $0))
  (local $25 (ref $0))
  (local $26 (ref $0))
  (local $27 (ref $1))
  (local $28 (ref $1))
  (local $29 (ref $1))
  (if
   (i32.eqz
    (global.get $global$16)
   )
   (then
    (global.set $global$16
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$16
   (i32.sub
    (global.get $global$16)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (loop $label
    (if
     (i32.eqz
      (global.get $global$16)
     )
     (then
      (global.set $global$16
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$16
     (i32.sub
      (global.get $global$16)
      (i32.const 1)
     )
    )
    (block
     (struct.set $2 3
      (struct.new $2
       (local.tee $4
        (ref.test (ref string)
         (string.const "377")
        )
       )
       (array.new $1
        (array.new_default $0
         (i32.and
          (i32.const 23)
          (i32.const 1023)
         )
        )
        (i32.and
         (i32.const 53)
         (i32.const 1023)
        )
       )
       (i64.trunc_sat_f32_s
        (f32.const -nan:0x4d0854)
       )
       (array.new_fixed $7 0)
       (global.get $global$14)
      )
      (ref.null none)
     )
     (br $label)
    )
    (unreachable)
   )
   (local.set $29
    (local.set $28
     (local.set $27
      (unreachable)
     )
    )
   )
  )
  (unreachable)
 )
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (global $__rt (mut i32) (i32.const 0))
)
