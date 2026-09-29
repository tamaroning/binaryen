(module
 (type $0 (array i8))
 (type $1 (func))
 (type $2 (struct))
 (type $3 (array (mut i16)))
 (type $4 (func (param i32)))
 (type $5 (func (result f32)))
 (type $6 (func (param i64) (result i64)))
 (type $7 (func (param i64 f32 v128 i31ref) (result i32)))
 (type $8 (func (result eqref)))
 (type $9 (func (param (ref eq)) (result i32)))
 (type $10 (func (param structref i64 (ref array) eqref v128 (ref array) structref v128) (result i64)))
 (type $11 (func (result v128)))
 (type $12 (func (result i64 i64)))
 (type $13 (func (result nullref i64)))
 (type $14 (func (result i64 i64 f32)))
 (type $15 (func (param externref)))
 (type $16 (func (param i32 i32) (result i32)))
 (type $17 (func (result stringref)))
 (type $18 (func (param (ref struct)) (result i64)))
 (type $19 (func (result i64)))
 (type $20 (func (param f32 f64 i32 f64) (result f64)))
 (type $21 (func (param i32) (result eqref)))
 (type $22 (func (result (ref string))))
 (type $23 (func (param i31ref i64 i31ref structref i64) (result i32)))
 (type $24 (func (result arrayref f64)))
 (type $25 (func (result v128 f64 i32 f32 stringref f32)))
 (type $26 (func (result i64 i32)))
 (type $27 (func (param i64)))
 (type $28 (func (param f32)))
 (type $29 (func (param f64)))
 (type $30 (func (param v128)))
 (type $31 (func (param anyref)))
 (type $32 (func (param funcref)))
 (type $33 (func (param i32) (result structref)))
 (type $34 (func (param exnref stringref (ref eq)) (result eqref)))
 (type $35 (func (result (ref struct))))
 (type $36 (func (param i32 arrayref (ref array)) (result i64)))
 (type $37 (func (param (ref array) eqref) (result i32)))
 (type $38 (func (param i32 i32 eqref) (result f64)))
 (type $39 (func (param stringref i32 exnref f32 f64 f32 arrayref) (result (ref array))))
 (type $40 (func (param structref exnref f32 i31ref v128) (result structref i64)))
 (type $41 (func (param structref i32 externref (ref struct)) (result f64)))
 (type $42 (func (param f32 exnref) (result v128)))
 (type $43 (func (param eqref) (result arrayref)))
 (type $44 (func (param arrayref i64 f32 i32) (result i64 i32)))
 (type $45 (func (param arrayref) (result f32 f32 structref arrayref)))
 (type $46 (func (result externref)))
 (type $47 (func (param exnref i64 i32) (result eqref)))
 (type $48 (func (param i31ref i32 externref i32) (result arrayref)))
 (type $49 (func (param i32 (ref array) (ref array) i32) (result v128 structref f64 i64 f32)))
 (type $50 (func (param f64 eqref stringref f32) (result i64)))
 (type $51 (func (param arrayref f64)))
 (type $52 (func (result anyref)))
 (type $53 (func (result i32)))
 (type $54 (func (param i64) (result f64)))
 (type $55 (func (param f64) (result i64 i64)))
 (type $56 (func (param stringref i64 (ref struct)) (result i64)))
 (type $57 (func (param i32 f32 i64 i32) (result anyref i64)))
 (type $58 (func (result structref i64)))
 (type $59 (func (result f32 f32 structref arrayref)))
 (type $60 (func (result v128 (ref (exact $2)) f64 i64 f32)))
 (type $61 (func (result v128 structref f64 i64 f32)))
 (type $62 (func (result v128 f64 i32 f32 (ref string) f32)))
 (type $63 (func (result anyref i64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_15" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $4) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $4) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $27) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $28) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $29) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $30) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $31) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $32) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $15) (param externref)))
 (import "fuzzing-support" "sleep" (func $fimport$9 (type $16) (param i32 i32) (result i32)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $4) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $15) (param externref)))
 (global $global$0 structref (struct.new_default $2))
 (global $global$1 i32 (i32.const -2147483648))
 (global $global$2 i64 (i64.const -109))
 (global $global$3 (mut f64) (f64.const 0.167))
 (global $global$4 (mut i64) (i64.const 65534))
 (global $global$5 (mut f64) (f64.const -nan:0xfffffffffb029))
 (global $global$6 (mut i64) (i64.const -268435457))
 (global $global$7 (mut externref) (global.get $gimport$0))
 (global $global$8 i32 (i32.const 8192))
 (global $global$9 externref (global.get $gimport$0))
 (global $global$10 i64 (global.get $global$2))
 (global $global$11 (ref array) (array.new_fixed $0 0))
 (global $global$12 (mut i64) (i64.const -35184372088831))
 (global $global$13 (mut v128) (v128.const i32x4 0xc0000000 0xffffffbc 0x00000000 0xfffe0000))
 (global $global$14 i32 (global.get $global$1))
 (global $global$15 (ref eq) (ref.i31
  (i32.const -53)
 ))
 (global $global$16 structref (struct.new_default $2))
 (global $global$17 eqref (array.new_fixed $0 0))
 (global $global$18 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 "\f1]\83B\a7\ff\e7N\1f^8\b4@I\90\bfR\"\14\bb")
 (data $1 (i64.const 0) "\86[\8d\b7s\a8\81\a6_\c4\c1_\85@z\04\8dt\d5\1a\cd\0e\a8\ca\dbm\0eB\12")
 (data $2 "C*F\03\c1\ed\t\d60\dcg3\f9\e3\cfZ#[\050\c5b\a4\a4\8e\t\d6s\9e")
 (data $3 (i64.const 29) "\a9\fa\d6v\8cv;\e4\bbLA_\c0\\\d0\bc\c8\9cGSk\9f\99JJ\c2r")
 (table $0 i64 21 21 funcref)
 (table $1 2 exnref)
 (elem $0 (table $0) (i64.const 0) func $1 $11 $11 $13 $15 $16 $16 $19 $19 $23 $32 $32 $38 $39 $47 $68 $70 $78 $80 $80 $80)
 (elem declare func $0 $2 $25 $3 $33 $36 $4 $44 $fimport$1 $fimport$9)
 (tag $tag$0 (type $4) (param i32))
 (tag $tag$1 (type $1))
 (export "global$" (global $global$0))
 (export "global$_6" (global $global$9))
 (export "global$_7" (global $global$10))
 (export "global$_9" (global $global$12))
 (export "global$_11" (global $global$14))
 (export "global$_13" (global $global$16))
 (export "global$_14" (global $global$17))
 (export "tag$" (tag $tag$0))
 (export "jstag" (tag $eimport$1))
 (export "func" (func $0))
 (export "func_11_invoker" (func $2))
 (export "func_15" (func $5))
 (export "func_15_invoker" (func $6))
 (export "func_17" (func $7))
 (export "func_17_invoker" (func $8))
 (export "func_19" (func $9))
 (export "func_19_invoker" (func $10))
 (export "func_21" (func $11))
 (export "func_21_invoker" (func $12))
 (export "func_23_invoker" (func $14))
 (export "func_25" (func $15))
 (export "func_26" (func $16))
 (export "func_27_invoker" (func $18))
 (export "func_29_invoker" (func $20))
 (export "func_31_invoker" (func $22))
 (export "func_33" (func $23))
 (export "func_35_invoker" (func $26))
 (export "func_37_invoker" (func $28))
 (export "func_40_invoker" (func $31))
 (export "func_43_invoker" (func $34))
 (export "func_45" (func $35))
 (export "func_46_invoker" (func $37))
 (export "func_50_invoker" (func $41))
 (export "func_52" (func $42))
 (export "func_52_invoker" (func $43))
 (export "func_54" (func $44))
 (export "func_54_invoker" (func $45))
 (export "func_57_invoker" (func $48))
 (export "func_60" (func $50))
 (export "func_60_invoker" (func $51))
 (export "func_62" (func $52))
 (export "func_62_invoker" (func $53))
 (export "func_64" (func $54))
 (export "func_64_invoker" (func $55))
 (export "func_67" (func $57))
 (export "func_67_invoker" (func $58))
 (export "func_70_invoker" (func $61))
 (export "func_73" (func $63))
 (export "func_73_invoker" (func $64))
 (export "func_75" (func $65))
 (export "func_75_invoker" (func $66))
 (export "func_77" (func $67))
 (export "func_80" (func $70))
 (export "func_80_invoker" (func $71))
 (export "func_82" (func $72))
 (export "func_82_invoker" (func $73))
 (export "func_84_invoker" (func $75))
 (export "func_86_invoker" (func $77))
 (export "func_90_invoker" (func $81))
 (func $0 (type $8) (result eqref)
  (local $0 f64)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 (ref string))
  (local $14 (ref extern))
  (local $scratch (ref (exact $8)))
  (local $scratch_16 f32)
  (local $scratch_17 v128)
  (local $scratch_18 f64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (result (ref eq))
   (try
    (do
     (local.set $3
      (block (result f32)
       (local.set $scratch_16
        (f32.const -nan:0x247d01)
       )
       (drop
        (block (result (ref (exact $8)))
         (local.set $scratch
          (ref.func $0)
         )
         (drop
          (i32.const -2147483648)
         )
         (local.get $scratch)
        )
       )
       (local.get $scratch_16)
      )
     )
    )
    (catch_all
     (try
      (do
       (data.drop $0)
      )
      (catch $tag$0
       (local.set $5 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $5))))
       (block
        (local.set $3
         (local.get $2)
        )
        (call $fimport$2
         (global.get $global$10)
        )
       )
      )
     )
    )
   )
   (loop $label (result (ref eq))
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block $block
     (nop)
     (if
      (i32.eqz
       (local.get $6)
      )
      (then
       (block $block1
        (drop
         (br_on_null $block
          (array.new_fixed $0 0)
         )
        )
        (call $fimport$4
         (f64.const -0.171)
        )
        (br_table $block1 $block1
         (if (result i32)
          (i32.eqz
           (local.get $6)
          )
          (then
           (call $fimport$8
            (global.get $gimport$1)
           )
           (br $block)
          )
          (else
           (string.measure_wtf16
            (if (result (ref string))
             (i32.eqz
              (i32.const -2147483647)
             )
             (then
              (string.const "\f0\90\8d\88\ed\a0\80")
             )
             (else
              (local.tee $13
               (string.const "")
              )
             )
            )
           )
          )
         )
        )
       )
       (return
        (ref.null none)
       )
      )
      (else
       (nop)
       (br $label)
      )
     )
     (unreachable)
    )
    (br_if $label
     (ref.eq
      (ref.cast (ref (exact $2))
       (struct.new_default $2)
      )
      (if (result (ref (exact $2)))
       (i31.get_u
        (loop (result (ref i31))
         (if
          (i32.eqz
           (global.get $global$18)
          )
          (then
           (global.set $global$18
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$18
          (i32.sub
           (global.get $global$18)
           (i32.const 1)
          )
         )
         (block (result (ref i31))
          (block
           (nop)
           (return
            (array.new_fixed $0 0)
           )
          )
          (unreachable)
         )
        )
       )
       (then
        (nop)
        (struct.new_default $2)
       )
       (else
        (call $fimport$1
         (local.get $6)
        )
        (block
         (try
          (do
           (try_table (catch_all $label)
            (nop)
           )
          )
          (catch $tag$0
           (local.set $9 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $9))))
           (if
            (try (result i32)
             (do
              (i32.atomic.load16_u acqrel offset=22
               (i64.and
                (local.get $12)
                (i64.const 15)
               )
              )
             )
             (catch_all
              (local.get $6)
             )
            )
            (then
             (br_if $label
              (memory.atomic.notify offset=22
               (i64.and
                (local.get $12)
                (i64.const 15)
               )
               (call $fimport$9
                (i32.atomic.rmw8.cmpxchg_u acqrel offset=22
                 (i64.and
                  (try (result i64)
                   (do
                    (i64x2.extract_lane 0
                     (v128.const i32x4 0xffffffd2 0xffffffff 0xffffffff 0xffefffff)
                    )
                   )
                   (catch $tag$0
                    (drop (pop i32))
                    (local.tee $12
                     (i64.const -32767)
                    )
                   )
                   (catch_all
                    (i64.atomic.rmw16.cmpxchg_u offset=22
                     (i64.and
                      (local.get $12)
                      (i64.const 15)
                     )
                     (i64.const 4294967277)
                     (loop (result i64)
                      (if
                       (i32.eqz
                        (global.get $global$18)
                       )
                       (then
                        (global.set $global$18
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$18
                       (i32.sub
                        (global.get $global$18)
                        (i32.const 1)
                       )
                      )
                      (i64.const 38170)
                     )
                    )
                   )
                  )
                  (i64.const 15)
                 )
                 (local.tee $6
                  (local.get $6)
                 )
                 (global.get $global$1)
                )
                (loop $label1 (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$18)
                  )
                  (then
                   (global.set $global$18
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$18
                  (i32.sub
                   (global.get $global$18)
                   (i32.const 1)
                  )
                 )
                 (block
                  (call $fimport$8
                   (local.tee $14
                    (global.get $gimport$1)
                   )
                  )
                  (i64.atomic.store32 offset=3
                   (i64.and
                    (i64.const 11553)
                    (i64.const 15)
                   )
                   (local.get $12)
                  )
                 )
                 (br_if $label1
                  (i32.eqz
                   (i32.const -67108864)
                  )
                 )
                 (block (result i32)
                  (call $fimport$0
                   (i32.const 0)
                  )
                  (i32.clz
                   (local.get $6)
                  )
                 )
                )
               )
              )
             )
             (call $fimport$4
              (block (result f64)
               (local.set $scratch_18
                (f64.const -nan:0xfffffffffffe9)
               )
               (drop
                (block (result v128)
                 (local.set $scratch_17
                  (v128.const i32x4 0x4f0b6879 0x43800000 0x5f000000 0x4f7fffa0)
                 )
                 (drop
                  (i64.const 9223372036854775807)
                 )
                 (local.get $scratch_17)
                )
               )
               (local.get $scratch_18)
              )
             )
            )
            (else
             (table.set $0
              (i64.const 1)
              (ref.func $0)
             )
             (i64.store16 offset=1 align=1
              (i64.and
               (i64.const -6824)
               (i64.const 15)
              )
              (local.tee $12
               (local.tee $12
                (local.get $12)
               )
              )
             )
            )
           )
          )
         )
         (br $label)
        )
        (unreachable)
       )
      )
     )
    )
    (global.get $global$15)
   )
  )
 )
 (func $1 (type $17) (result stringref)
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 i32)
  (local $7 v128)
  (local $8 structref)
  (local $9 stringref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.tee $9
   (string.const "946\c2\a3985")
  )
 )
 (func $2 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $1)
  )
  (drop
   (call $1)
  )
 )
 (func $3 (type $9) (param $0 (ref eq)) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 f64)
  (local $7 f32)
  (local $8 (ref eq))
  (local $9 externref)
  (local $10 (ref string))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (global.get $global$14)
 )
 (func $4 (type $18) (param $0 (ref struct)) (result i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$6
    (array.new_fixed $0 0)
   )
   (nop)
   (return
    (i64.const -128)
   )
  )
  (unreachable)
 )
 (func $5 (type $5) (result f32)
  (local $0 v128)
  (local $1 f32)
  (local $2 f32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 f64)
  (local $7 (ref struct))
  (local $8 (ref struct))
  (local $9 structref)
  (local $10 eqref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (f32.const 70368744177664)
 )
 (func $6 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $5)
  )
  (drop
   (call $5)
  )
  (drop
   (call $5)
  )
 )
 (func $7 (type $33) (param $0 i32) (result structref)
  (local $1 v128)
  (local $2 v128)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 eqref)
  (local $9 eqref)
  (local $10 (ref eq))
  (local $11 externref)
  (local $12 funcref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $2)))
   (nop)
   (try_table (result (ref (exact $2)))
    (struct.new_default $2)
   )
  )
 )
 (func $8 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $7
    (i32.const 0)
   )
  )
  (drop
   (call $7
    (i32.const -71)
   )
  )
 )
 (func $9 (type $19) (result i64)
  (local $0 stringref)
  (local $1 stringref)
  (local $2 stringref)
  (local $3 eqref)
  (local $4 funcref)
  (local $5 (ref struct))
  (local $6 structref)
  (local $7 (ref array))
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 f32)
  (local $16 f32)
  (local $17 f64)
  (local $18 f64)
  (local $19 i64)
  (local $scratch i64)
  (local $scratch_21 f32)
  (local $scratch_22 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $2
   (ref.as_non_null
    (local.get $2)
   )
  )
  (block
   (nop)
   (loop $label
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (call $fimport$3
     (if (result f32)
      (i32.eqz
       (ref.eq
        (block (result (ref (exact $0)))
         (array.new_fixed $0 0)
        )
        (global.get $global$11)
       )
      )
      (then
       (call $fimport$8
        (global.get $gimport$0)
       )
       (br $label)
      )
      (else
       (f32.const 4294967296)
      )
     )
    )
    (br_if $label
     (i32.eqz
      (ref.eq
       (struct.new_default $2)
       (ref.cast (ref i31)
        (ref.i31
         (i32.const -110)
        )
       )
      )
     )
    )
    (block
     (drop
      (br_on_null $label
       (if (result (ref none))
        (local.tee $10
         (local.get $11)
        )
        (then
         (ref.cast (ref none)
          (ref.i31
           (i32.const -512)
          )
         )
        )
        (else
         (nop)
         (br $label)
        )
       )
      )
     )
     (block
      (drop
       (block (result i64)
        (local.set $scratch_22
         (i64.const -16777216)
        )
        (drop
         (block (result f32)
          (local.set $scratch_21
           (f32.const 65444)
          )
          (drop
           (block (result i64)
            (local.set $scratch
             (i64.const -254)
            )
            (local.set $14
             (i32.const 32336)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_21)
         )
        )
        (local.get $scratch_22)
       )
      )
      (call $fimport$1
       (local.get $14)
      )
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
 (func $10 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $9)
  )
 )
 (func $11 (type $20) (param $0 f32) (param $1 f64) (param $2 i32) (param $3 f64) (result f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 v128)
  (local $15 v128)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
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
  (local $29 anyref)
  (local $30 funcref)
  (local $31 externref)
  (local $32 externref)
  (local $33 stringref)
  (local $34 arrayref)
  (local $35 exnref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (result f64)
   (block
    (call $fimport$2
     (i64.const 4288101711)
    )
    (return
     (f64.const -2251799813685247.2)
    )
   )
   (unreachable)
  )
 )
 (func $12 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $11
    (f32.const 2147483648)
    (f64.const 1797693134862315708145274e284)
    (i32.const -18)
    (f64.const -1023)
   )
  )
 )
 (func $13 (type $34) (param $0 exnref) (param $1 stringref) (param $2 (ref eq)) (result eqref)
  (local $3 i64)
  (local $4 i32)
  (local $5 f32)
  (local $6 f32)
  (local $7 v128)
  (local $8 externref)
  (local $9 arrayref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (global.get $global$11)
 )
 (func $14 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $13
    (ref.null noexn)
    (string.const "")
    (array.new_fixed $0 0)
   )
  )
 )
 (func $15 (type $21) (param $0 i32) (result eqref)
  (local $1 (ref struct))
  (local $2 i31ref)
  (local $3 arrayref)
  (local $4 funcref)
  (local $5 anyref)
  (local $6 anyref)
  (local $7 (ref (exact $0)))
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $scratch v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (drop
    (block (result v128)
     (local.set $scratch
      (v128.const i32x4 0x1e78fff1 0x00108000 0xffdb3944 0x257fffff)
     )
     (local.set $7
      (array.new_fixed $0 0)
     )
     (local.get $scratch)
    )
   )
   (if
    (ref.eq
     (local.get $7)
     (loop $label (result (ref (exact $0)))
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (block $block
       (nop)
       (br_if $block
        (i32.eqz
         (i32.const -1048576)
        )
       )
      )
      (br_if $label
       (i32.eqz
        (global.get $global$14)
       )
      )
      (array.new_fixed $0 0)
     )
    )
    (then
     (call $fimport$1
      (call_ref $9
       (ref.i31
        (i32.const -2483076)
       )
       (ref.func $3)
      )
     )
     (call $fimport$0
      (i32.const 0)
     )
    )
    (else
     (table.set $1
      (i32.const 0)
      (loop (result (ref exn))
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block (result (ref exn))
        (nop)
        (block $block1 (result (ref exn))
         (try_table (catch_all_ref $block1)
          (throw $tag$1)
         )
         (unreachable)
        )
       )
      )
     )
     (throw $tag$0
      (global.get $global$1)
     )
    )
   )
   (return
    (struct.new_default $2)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $16 (type $1)
  (local $0 stringref)
  (local $1 exnref)
  (local $2 structref)
  (local $3 i31ref)
  (local $4 (ref string))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 f64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$7
    (ref.func $15)
   )
   (loop $label2
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block $block
     (loop $label
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (block
       (call $fimport$1
        (i32.const -118)
       )
       (nop)
      )
      (br_if $label
       (try (result i32)
        (do
         (global.get $global$1)
        )
        (catch_all
         (call_ref $9
          (global.get $global$15)
          (ref.func $3)
         )
        )
       )
      )
      (memory.fill
       (i64.and
        (i64.or
         (local.get $5)
         (i64.atomic.load16_u acqrel offset=22
          (i64.and
           (i64.atomic.load8_u acqrel offset=3
            (i64.and
             (local.get $5)
             (i64.const 15)
            )
           )
           (i64.const 15)
          )
         )
        )
        (i64.const 15)
       )
       (global.get $global$8)
       (loop $label1 (result i64)
        (if
         (i32.eqz
          (global.get $global$18)
         )
         (then
          (global.set $global$18
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$18
         (i32.sub
          (global.get $global$18)
          (i32.const 1)
         )
        )
        (block
         (call $fimport$5
          (i8x16.add_sat_u
           (v128.load offset=22
            (i64.and
             (local.get $5)
             (i64.const 15)
            )
           )
           (global.get $global$13)
          )
         )
         (call $fimport$5
          (v128.const i32x4 0xffffffe7 0xf0000000 0xffffffef 0x0000ffb7)
         )
        )
        (br_if $label1
         (i32.eqz
          (i32.const -128)
         )
        )
        (local.tee $5
         (try (result i64)
          (do
           (i64.trunc_f32_s
            (if (result f32)
             (stringview_wtf16.get_codeunit
              (string.const "\f0\90\8d\88")
              (block (result i32)
               (local.set $11
                (try_table (result i32) (catch_all $block)
                 (if (result i32)
                  (i32.eqz
                   (i32.const -7359)
                  )
                  (then
                   (string.compare
                    (string.const "")
                    (local.tee $4
                     (string.const "\ed\a0\80")
                    )
                   )
                  )
                  (else
                   (i32.const -2140330)
                  )
                 )
                )
               )
               (local.get $11)
              )
             )
             (then
              (nop)
              (unreachable)
             )
             (else
              (f32.const -3402823466385288598117041e14)
             )
            )
           )
          )
          (catch $tag$0
           (local.set $9 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $9))))
           (block (result i64)
            (i64.atomic.store8 offset=4
             (i64.and
              (i64.trunc_sat_f64_u
               (f64.const 4293799289)
              )
              (i64.const 15)
             )
             (i64.add
              (call $9)
              (i64.atomic.load acqrel offset=22
               (i64.and
                (try_table (result i64) (catch_all $label1)
                 (i64.const 0)
                )
                (i64.const 15)
               )
              )
             )
            )
            (local.get $5)
           )
          )
         )
        )
       )
      )
     )
     (call $fimport$5
      (global.get $global$13)
     )
    )
    (br_if $label2
     (i32.eqz
      (local.get $10)
     )
    )
    (loop $label3
     (if
      (i32.eqz
       (global.get $global$18)
      )
      (then
       (global.set $global$18
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$18
      (i32.sub
       (global.get $global$18)
       (i32.const 1)
      )
     )
     (block
      (call $fimport$8
       (string.const "\f0\90\8d\88\f0\90\8d\88")
      )
      (br $label3)
     )
     (unreachable)
    )
    (unreachable)
   )
   (unreachable)
  )
 )
 (func $17 (type $35) (result (ref struct))
  (local $0 (ref string))
  (local $1 arrayref)
  (local $2 anyref)
  (local $3 exnref)
  (local $4 eqref)
  (local $5 funcref)
  (local $6 stringref)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 f64)
  (local $16 f64)
  (local $17 f32)
  (local $18 v128)
  (local $19 v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
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
 (func $18 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $17)
  )
  (drop
   (call $17)
  )
 )
 (func $19 (type $10) (param $0 structref) (param $1 i64) (param $2 (ref array)) (param $3 eqref) (param $4 v128) (param $5 (ref array)) (param $6 structref) (param $7 v128) (result i64)
  (local $8 funcref)
  (local $9 funcref)
  (local $10 stringref)
  (local $11 i31ref)
  (local $12 exnref)
  (local $13 eqref)
  (local $14 externref)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 f32)
  (local $19 f32)
  (local $20 f64)
  (local $21 f64)
  (local $22 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (i64.const 30)
 )
 (func $20 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $19
    (struct.new_default $2)
    (i64.const -26361)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (v128.const i32x4 0xffff8000 0xffffffff 0x0000007f 0x00000000)
    (array.new_fixed $0 0)
    (struct.new_default $2)
    (v128.const i32x4 0xffb5451d 0xffffffff 0xffffe24e 0x423fffff)
   )
  )
 )
 (@binaryen.js.called)
 (func $21 (type $36) (param $0 i32) (param $1 arrayref) (param $2 (ref array)) (result i64)
  (local $3 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (return_call $4
   (struct.new_default $2)
  )
 )
 (func $22 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $21
    (i32.const -66)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
   )
  )
  (drop
   (call $21
    (i32.const -1)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
   )
  )
  (drop
   (call $21
    (i32.const 201)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
   )
  )
 )
 (func $23 (type $6) (param $0 i64) (result i64)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 nullref)
  (local $12 externref)
  (local $13 (ref i31))
  (local $14 (ref string))
  (local $15 (ref none))
  (local $16 (ref array))
  (local $17 (ref exn))
  (local $scratch f32)
  (local $scratch_19 i64)
  (local $scratch_20 (ref (exact $6)))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$8
    (global.get $gimport$0)
   )
   (drop
    (local.tee $0
     (i64.const -9223372036854775807)
    )
   )
   (drop
    (i64.const -1)
   )
   (drop
    (try_table (result i64)
     (try (result i64)
      (do
       (local.get $0)
      )
      (catch $tag$0
       (local.set $9 (i32.eqz (pop i32)))
       (drop
        (block (result (ref (exact $6)))
         (local.set $scratch_20
          (ref.func $23)
         )
         (local.set $10
          (block (result i64)
           (local.set $scratch_19
            (i64.const -33)
           )
           (drop
            (block (result f32)
             (local.set $scratch
              (f32.const -nan:0x7f9d3b)
             )
             (drop
              (f64.const 216)
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
       (local.get $10)
      )
     )
    )
   )
   (loop
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block
     (loop
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (loop $label
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block
        (call $fimport$6
         (local.get $11)
        )
        (br $label)
       )
       (unreachable)
      )
      (unreachable)
     )
     (local.set $13
      (local.set $13
       (unreachable)
      )
     )
    )
    (loop $label1
     (if
      (i32.eqz
       (global.get $global$18)
      )
      (then
       (global.set $global$18
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$18
      (i32.sub
       (global.get $global$18)
       (i32.const 1)
      )
     )
     (block
      (nop)
      (br $label1)
     )
     (unreachable)
    )
    (local.set $17
     (local.set $16
      (local.set $15
       (local.set $14
        (unreachable)
       )
      )
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $24 (type $37) (param $0 (ref array)) (param $1 eqref) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 externref)
  (local $13 externref)
  (local $14 i31ref)
  (local $15 funcref)
  (local $16 (ref eq))
  (local $17 (ref eq))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (return
   (global.get $global$8)
  )
 )
 (func $25 (type $11) (result v128)
  (local $0 externref)
  (local $1 (ref array))
  (local $2 arrayref)
  (local $3 i31ref)
  (local $4 i64)
  (local $5 i64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (return
    (v128.const i32x4 0xffffde70 0xffffffff 0x00000000 0x4058c000)
   )
  )
  (unreachable)
 )
 (func $26 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $25)
  )
 )
 (func $27 (type $38) (param $0 i32) (param $1 i32) (param $2 eqref) (result f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 f32)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (local $22 f32)
  (local $23 f32)
  (local $24 v128)
  (local $25 eqref)
  (local $26 eqref)
  (local $27 structref)
  (local $28 anyref)
  (local $29 anyref)
  (local $30 exnref)
  (local $31 stringref)
  (local $32 (ref array))
  (local $scratch f64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (try_table (result f64)
   (local.set $scratch
    (if (result f64)
     (i32.const -7328)
     (then
      (local.tee $5
       (local.tee $5
        (local.get $5)
       )
      )
     )
     (else
      (loop $label
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block
        (call_indirect $0 (type $1)
         (i64.const 5)
        )
        (br $label)
       )
       (unreachable)
      )
      (unreachable)
     )
    )
   )
   (drop
    (i64.const -2147483648)
   )
   (local.get $scratch)
  )
 )
 (func $28 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $27
    (i32.const 2147483647)
    (i32.const -2147483646)
    (struct.new_default $2)
   )
  )
 )
 (func $29 (type $39) (param $0 stringref) (param $1 i32) (param $2 exnref) (param $3 f32) (param $4 f64) (param $5 f32) (param $6 arrayref) (result (ref array))
  (local $7 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$3
    (f32.const 1.806840338802842e-19)
   )
   (return
    (array.new_fixed $0 0)
   )
  )
  (unreachable)
 )
 (func $30 (type $40) (param $0 structref) (param $1 exnref) (param $2 f32) (param $3 i31ref) (param $4 v128) (result structref i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (type $13) (result nullref i64)
   (atomic.fence)
   (loop (type $13) (result nullref i64)
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block
     (nop)
     (nop)
    )
    (block
     (nop)
     (return
      (tuple.make 2
       (ref.null none)
       (i64.const -9108)
      )
     )
    )
    (unreachable)
   )
  )
 )
 (func $31 (type $1)
  (local $scratch (tuple structref i64))
  (local $scratch_1 structref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result structref)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $30
        (struct.new_default $2)
        (block $block (result (ref exn))
         (try_table (catch_all_ref $block)
          (throw $tag$0
           (loop $label (result i32)
            (if
             (i32.eqz
              (global.get $global$18)
             )
             (then
              (global.set $global$18
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$18
             (i32.sub
              (global.get $global$18)
              (i32.const 1)
             )
            )
            (block (result i32)
             (drop
              (string.const "\ed\a0\80\f0\90\8d\88")
             )
             (i32.trunc_f64_s
              (block (result f64)
               (drop
                (br_on_null $label
                 (block (result (ref i31))
                  (nop)
                  (ref.i31
                   (i32.const -37)
                  )
                 )
                )
               )
               (loop (result f64)
                (if
                 (i32.eqz
                  (global.get $global$18)
                 )
                 (then
                  (global.set $global$18
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$18
                 (i32.sub
                  (global.get $global$18)
                  (i32.const 1)
                 )
                )
                (f64.const -nan:0xfffffffffdb12)
               )
              )
             )
            )
           )
          )
         )
         (unreachable)
        )
        (f32.const -0.16699999570846558)
        (ref.i31
         (i32.const -2097151)
        )
        (v128.const i32x4 0x43958106 0xbfeb6c8b 0xfc000000 0x419fffff)
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
 (func $32 (type $1)
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (block
    (return)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $33 (type $41) (param $0 structref) (param $1 i32) (param $2 externref) (param $3 (ref struct)) (result f64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (result f64)
   (call $fimport$7
    (ref.func $33)
   )
   (loop $label (result f64)
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (br_if $label
     (i32.eqz
      (ref.is_null
       (struct.new_default $2)
      )
     )
    )
    (br_if $label
     (global.get $global$8)
    )
    (f64.const 9223372036854775808)
   )
  )
 )
 (func $34 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $33
    (struct.new_default $2)
    (i32.const -26823)
    (ref.null noextern)
    (struct.new_default $2)
   )
  )
 )
 (func $35 (type $42) (param $0 f32) (param $1 exnref) (result v128)
  (local $2 f32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (v128.const i32x4 0xffe5001c 0x4b540000 0x00007729 0x00500100)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $36 (type $22) (result (ref string))
  (local $0 stringref)
  (local $1 funcref)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f64)
  (local $6 v128)
  (local $7 v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (string.const "262")
 )
 (func $37 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $36)
  )
 )
 (func $38 (type $7) (param $0 i64) (param $1 f32) (param $2 v128) (param $3 i31ref) (result i32)
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (try (result i32)
   (do
    (i31.get_u
     (ref.i31
      (i32.const -2048)
     )
    )
   )
   (catch $tag$0
    (local.set $4 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
    (f64.ge
     (f64.const 1125899906842624)
     (f64.const -2147483648)
    )
   )
   (catch_all
    (i32.const -65536)
   )
  )
 )
 (func $39 (type $5) (result f32)
  (local $0 arrayref)
  (local $1 i31ref)
  (local $2 eqref)
  (local $3 (ref eq))
  (local $4 stringref)
  (local $5 (ref string))
  (local $6 (ref string))
  (local $7 (ref string))
  (local $8 (ref $3))
  (local $9 (ref $3))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 structref)
  (local $13 (ref struct))
  (local $14 (ref array))
  (local $15 (ref i31))
  (local $16 (ref extern))
  (local $17 (ref extern))
  (local $18 v128)
  (local $19 v128)
  (local $20 v128)
  (local $21 v128)
  (local $22 f64)
  (local $23 f64)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i64)
  (local $30 f32)
  (local $31 f32)
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
  (local $scratch (ref string))
  (local $scratch_48 (ref extern))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $16
   (block (result (ref extern))
    (local.set $scratch_48
     (global.get $gimport$1)
    )
    (local.set $17
     (block (result (ref string))
      (local.set $scratch
       (string.const "\ed\bd\88")
      )
      (local.set $23
       (f64.const 99)
      )
      (local.get $scratch)
     )
    )
    (local.get $scratch_48)
   )
  )
  (local.set $13
   (struct.new_default $2)
  )
  (local.set $5
   (string.const "\e2\82\ac\c2\a3\ed\bd\88")
  )
  (local.set $3
   (global.get $global$15)
  )
  (block
   (if
    (block $block (result i32)
     (nop)
     (drop
      (try_table (result i32) (catch $tag$0 $block)
       (local.set $6
        (local.tee $5
         (string.const "\c2\a3\f0\90\8d\88\ed\a0\80")
        )
       )
       (if (result i32)
        (i32.lt_u
         (i32.add
          (local.tee $36
           (ref.test (ref i31)
            (ref.i31
             (i32.const -2147483647)
            )
           )
          )
          (local.tee $37
           (string.measure_wtf16
            (local.get $6)
           )
          )
         )
         (array.len
          (local.tee $8
           (try (result (ref (exact $3)))
            (do
             (array.new_default $3
              (i32.and
               (i32.const 5)
               (i32.const 1023)
              )
             )
            )
            (catch $tag$0
             (local.set $35 (local.tee $35 (pop i32)))
             (block
              (call $2)
              (return
               (f32.const 1125899906842624)
              )
             )
             (unreachable)
            )
           )
          )
         )
        )
        (then
         (string.encode_wtf16_array
          (local.get $6)
          (local.get $8)
          (local.get $36)
         )
        )
        (else
         (i32.const -1021224116)
        )
       )
      )
     )
     (drop
      (if (result nullref)
       (i31.get_s
        (ref.i31
         (i32.const -72)
        )
       )
       (then
        (block $block1 (result nullref)
         (try_table
          (local.set $22
           (call_indirect $0 (type $20)
            (local.tee $31
             (f32.const -4061900)
            )
            (f64.load offset=3 align=2
             (i64.and
              (i64.const -8796093022208)
              (i64.const 15)
             )
            )
            (i32.atomic.load acqrel offset=3
             (i64.and
              (i64.const 67108864)
              (i64.const 15)
             )
            )
            (local.get $22)
            (i64.const 1)
           )
          )
         )
         (br_if $block1
          (ref.null none)
          (if (result i32)
           (ref.eq
            (struct.new_default $2)
            (global.get $global$15)
           )
           (then
            (memory.atomic.notify offset=4
             (i64.and
              (i64.const 4294961719)
              (i64.const 15)
             )
             (if (result i32)
              (i32.eqz
               (i32.const -16777216)
              )
              (then
               (if (result i32)
                (i32.const 187)
                (then
                 (i32.atomic.rmw8.xor_u acqrel offset=3
                  (i64.and
                   (local.tee $29
                    (i64.const -86)
                   )
                   (i64.const 15)
                  )
                  (i32.const -8067)
                 )
                )
                (else
                 (local.get $38)
                )
               )
              )
              (else
               (local.get $38)
              )
             )
            )
           )
           (else
            (call $fimport$6
             (try (result (ref eq))
              (do
               (array.new_fixed $0 0)
              )
              (catch $tag$0
               (throw $tag$0 (pop i32))
               (struct.new_default $2)
              )
             )
            )
            (return
             (f32.const 67)
            )
           )
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
     (loop $label
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (block
       (nop)
       (local.set $22
        (f64.const -nan:0xfffffffe64b6c)
       )
      )
      (drop
       (br_on_null $label
        (global.get $global$15)
       )
      )
      (drop
       (i32.const 0)
      )
      (block
       (nop)
       (br $label)
      )
      (unreachable)
     )
     (unreachable)
    )
    (then
     (block $block2
      (try_table (catch_all $block2)
       (table.set $0
        (i64.const 2)
        (ref.func $39)
       )
      )
      (try
       (do
        (call $fimport$0
         (i32.const 0)
        )
       )
       (catch_all
        (call $fimport$2
         (call_ref $6
          (if (result i64)
           (i32.eqz
            (i8x16.extract_lane_s 13
             (local.tee $18
              (call $35
               (block (result f32)
                (local.set $1
                 (local.get $1)
                )
                (f32.convert_i64_s
                 (call_indirect $0 (type $10)
                  (struct.new_default $2)
                  (loop $label1 (result i64)
                   (if
                    (i32.eqz
                     (global.get $global$18)
                    )
                    (then
                     (global.set $global$18
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$18
                    (i32.sub
                     (global.get $global$18)
                     (i32.const 1)
                    )
                   )
                   (nop)
                   (br_if $label1
                    (i32.const -9)
                   )
                   (local.get $29)
                  )
                  (array.new_fixed $0 0)
                  (ref.i31
                   (i32.const 92)
                  )
                  (v128.const i32x4 0xf0000000 0x80000000 0x00000fff 0x80000000)
                  (array.new_fixed $0 0)
                  (local.get $12)
                  (local.get $18)
                  (i64.const 7)
                 )
                )
               )
               (ref.null noexn)
              )
             )
            )
           )
           (then
            (drop
             (br_on_null $block2
              (loop $label2 (result (ref struct))
               (if
                (i32.eqz
                 (global.get $global$18)
                )
                (then
                 (global.set $global$18
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$18
                (i32.sub
                 (global.get $global$18)
                 (i32.const 1)
                )
               )
               (block
                (call_ref $1
                 (ref.func $16)
                )
                (nop)
               )
               (br_if $label2
                (i32.const -1)
               )
               (try_table (result (ref struct)) (catch_all $label2)
                (local.get $13)
               )
              )
             )
            )
            (i64.const -9223372036854775807)
           )
           (else
            (call_ref $18
             (if (result (ref struct))
              (i32.eqz
               (ref.eq
                (array.new_fixed $0 0)
                (array.new_fixed $0 0)
               )
              )
              (then
               (block $block3 (result (ref struct))
                (block
                 (local.set $38
                  (ref.eq
                   (ref.i31
                    (i32.const 65536)
                   )
                   (ref.i31
                    (i32.const -32769)
                   )
                  )
                 )
                 (loop $label3
                  (if
                   (i32.eqz
                    (global.get $global$18)
                   )
                   (then
                    (global.set $global$18
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$18
                   (i32.sub
                    (global.get $global$18)
                    (i32.const 1)
                   )
                  )
                  (block
                   (v128.store offset=22
                    (i64.and
                     (local.get $29)
                     (i64.const 15)
                    )
                    (v128.const i32x4 0xff8e230e 0xffdb2622 0x4f5d1244 0xffff8e58)
                   )
                   (nop)
                  )
                  (br_if $label3
                   (i32.eqz
                    (global.get $global$1)
                   )
                  )
                  (local.set $0
                   (array.new_fixed $0 0)
                  )
                 )
                )
                (br_if $block3
                 (local.tee $13
                  (local.get $13)
                 )
                 (local.get $38)
                )
               )
              )
              (else
               (i64.store16 offset=4 align=1
                (i64.and
                 (global.get $global$12)
                 (i64.const 15)
                )
                (i64.extend8_s
                 (i64.atomic.rmw8.xor_u acqrel offset=3
                  (i64.and
                   (local.get $29)
                   (i64.const 15)
                  )
                  (local.get $29)
                 )
                )
               )
               (local.get $13)
              )
             )
             (ref.func $4)
            )
           )
          )
          (ref.func $23)
         )
        )
       )
      )
      (call $fimport$4
       (f64.convert_i64_s
        (i64x2.extract_lane 0
         (v128.const i32x4 0xdf800000 0xffffffc2 0x46d0c000 0xc2a20000)
        )
       )
      )
     )
    )
   )
   (loop $label5
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block
     (local.set $29
      (global.get $global$2)
     )
     (loop $label6
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (block
       (i64.atomic.store8 acqrel offset=22
        (i64.and
         (i64.atomic.load32_u acqrel offset=22
          (i64.and
           (select
            (i64.const -22)
            (loop $label4 (result i64)
             (if
              (i32.eqz
               (global.get $global$18)
              )
              (then
               (global.set $global$18
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$18
              (i32.sub
               (global.get $global$18)
               (i32.const 1)
              )
             )
             (nop)
             (br_if $label4
              (i32.eqz
               (loop (result i32)
                (if
                 (i32.eqz
                  (global.get $global$18)
                 )
                 (then
                  (global.set $global$18
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$18
                 (i32.sub
                  (global.get $global$18)
                  (i32.const 1)
                 )
                )
                (i32.const 65535)
               )
              )
             )
             (local.get $29)
            )
            (i32.const 4194304)
           )
           (i64.const 15)
          )
         )
         (i64.const 15)
        )
        (block (result i64)
         (drop
          (br_on_null $label5
           (local.tee $3
            (global.get $global$15)
           )
          )
         )
         (i64.and
          (local.tee $29
           (i64.const -524287)
          )
          (i64.const -71)
         )
        )
       )
       (v128.store offset=4 align=2
        (i64.and
         (i64.const -3)
         (i64.const 15)
        )
        (try_table (result v128) (catch_all $label6)
         (local.tee $18
          (local.tee $18
           (v128.const i32x4 0x00000000 0xc3e00000 0x00000000 0x40682000)
          )
         )
        )
       )
      )
      (br_if $label6
       (call $38
        (i64x2.extract_lane 0
         (if (result v128)
          (i32.eqz
           (loop $label7 (result i32)
            (if
             (i32.eqz
              (global.get $global$18)
             )
             (then
              (global.set $global$18
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$18
             (i32.sub
              (global.get $global$18)
              (i32.const 1)
             )
            )
            (drop
             (br_on_null $label5
              (ref.func $39)
             )
            )
            (br_if $label7
             (local.get $38)
            )
            (i32.const -126)
           )
          )
          (then
           (drop
            (br_on_null $label5
             (struct.new_default $2)
            )
           )
           (local.tee $18
            (try (result v128)
             (do
              (global.get $global$13)
             )
             (catch $tag$0
              (local.set $46 (i32.eqz (pop i32)))
              (local.get $18)
             )
            )
           )
          )
          (else
           (call_indirect $0 (type $1)
            (i64.const 10)
           )
           (br $label6)
          )
         )
        )
        (f32.convert_i32_u
         (local.get $38)
        )
        (block (result v128)
         (drop
          (br_on_null $label5
           (ref.i31
            (i32.const -78)
           )
          )
         )
         (block (result v128)
          (if
           (local.get $38)
           (then
            (local.set $29
             (i64.const -547862251)
            )
           )
           (else
            (nop)
           )
          )
          (local.get $18)
         )
        )
        (ref.cast (ref i31)
         (local.tee $15
          (ref.i31
           (i32.const -8)
          )
         )
        )
       )
      )
      (if
       (local.get $34)
       (then
        (block
         (nop)
         (try
          (do
           (loop
            (if
             (i32.eqz
              (global.get $global$18)
             )
             (then
              (global.set $global$18
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$18
             (i32.sub
              (global.get $global$18)
              (i32.const 1)
             )
            )
            (nop)
           )
          )
          (catch_all
           (nop)
          )
         )
        )
        (br $label5)
       )
       (else
        (call $fimport$4
         (local.tee $22
          (local.get $23)
         )
        )
        (br $label5)
       )
      )
      (unreachable)
     )
     (local.set $14
      (unreachable)
     )
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $40 (type $19) (result i64)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 v128)
  (local $6 funcref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (i64.const -46)
 )
 (func $41 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $40)
  )
  (drop
   (call $40)
  )
  (drop
   (call $40)
  )
 )
 (@binaryen.js.called)
 (func $42 (type $5) (result f32)
  (local $0 f32)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch
     (i64.const 50487)
    )
    (local.set $0
     (f32.const -4294967296)
    )
    (local.get $scratch)
   )
  )
  (local.get $0)
 )
 (func $43 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $42)
  )
  (drop
   (call $42)
  )
 )
 (func $44 (type $43) (param $0 eqref) (result arrayref)
  (local $1 (ref any))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$6
    (local.tee $1
     (array.new_fixed $0 0)
    )
   )
   (return
    (array.new_fixed $0 0)
   )
  )
  (unreachable)
 )
 (func $45 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $44
    (ref.i31
     (i32.const -256)
    )
   )
  )
  (drop
   (call $44
    (ref.i31
     (i32.const -2)
    )
   )
  )
  (drop
   (call $44
    (struct.new_default $2)
   )
  )
  (drop
   (call $44
    (array.new_fixed $0 0)
   )
  )
  (drop
   (call $44
    (struct.new_default $2)
   )
  )
 )
 (func $46 (type $1)
  (local $0 (ref eq))
  (local $1 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block $block
   (atomic.fence acqrel)
   (drop
    (i64.and
     (local.get $1)
     (i64.const 15)
    )
   )
   (block
    (call_indirect $0 (type $1)
     (i64.const 5)
    )
    (br $block)
   )
   (unreachable)
  )
 )
 (@binaryen.js.called)
 (func $47 (type $44) (param $0 arrayref) (param $1 i64) (param $2 f32) (param $3 i32) (result i64 i32)
  (local $4 (ref string))
  (local $5 (ref string))
  (local $6 externref)
  (local $7 exnref)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (try_table (type $26) (result i64 i32)
   (tuple.make 2
    (i64.const -8)
    (i32.const -33)
   )
  )
 )
 (func $48 (type $1)
  (local $scratch (tuple i64 i32))
  (local $scratch_1 i64)
  (local $scratch_2 (tuple i64 i32))
  (local $scratch_3 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $47
        (array.new_fixed $0 0)
        (i64.const 32768)
        (f32.const 2147483648)
        (i32.const -220)
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
   (block (result i64)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $47
        (array.new_fixed $0 0)
        (i64.const -76)
        (f32.const 2147483648)
        (i32.const -82)
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
 (@binaryen.js.called)
 (func $49 (type $45) (param $0 arrayref) (result f32 f32 structref arrayref)
  (local $1 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (throw $tag$0
   (ref.eq
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
   )
  )
 )
 (func $50 (type $21) (param $0 i32) (result eqref)
  (local $1 f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 v128)
  (local $5 (ref struct))
  (local $6 (ref struct))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (loop
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block
     (return
      (ref.i31
       (i32.const 256)
      )
     )
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $51 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $50
    (i32.const -33)
   )
  )
 )
 (func $52 (type $46) (result externref)
  (local $0 (ref extern))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (if (result externref)
   (ref.is_null
    (ref.null none)
   )
   (then
    (nop)
    (local.tee $0
     (string.const "\e2\82\ac\f0\90\8d\88")
    )
   )
   (else
    (block
     (loop
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (block
       (nop)
       (call_ref $1
        (ref.func $2)
       )
      )
     )
     (nop)
     (nop)
    )
    (global.get $gimport$0)
   )
  )
 )
 (func $53 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $52)
  )
 )
 (@binaryen.js.called)
 (func $54 (type $17) (result stringref)
  (local $0 i64)
  (local $1 f64)
  (local $2 v128)
  (local $3 v128)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 exnref)
  (local $10 (ref struct))
  (local $11 anyref)
  (local $12 (ref string))
  (local $13 (ref string))
  (local $14 (ref string))
  (local $15 (ref string))
  (local $16 (ref any))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $14
   (string.const "\ed\bd\88")
  )
  (try_table (result (ref string))
   (select (result (ref string))
    (try (result (ref string))
     (do
      (string.const "")
     )
     (catch $tag$0
      (local.set $5 (i32.xor (pop i32) (i32.const 11)))
      (string.const "\e2\82\ac\ed\bd\881012")
     )
    )
    (local.tee $12
     (block (result (ref string))
      (nop)
      (loop (result (ref string))
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block $block (result (ref string))
        (drop
         (loop $label1 (result f32)
          (if
           (i32.eqz
            (global.get $global$18)
           )
           (then
            (global.set $global$18
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$18
           (i32.sub
            (global.get $global$18)
            (i32.const 1)
           )
          )
          (block
           (call $fimport$4
            (f64.const -nan:0xfffffffffff9e)
           )
           (call $fimport$6
            (loop $label (result (ref (exact $2)))
             (if
              (i32.eqz
               (global.get $global$18)
              )
              (then
               (global.set $global$18
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$18
              (i32.sub
               (global.get $global$18)
               (i32.const 1)
              )
             )
             (block
              (call $fimport$7
               (ref.func $1)
              )
              (loop
               (if
                (i32.eqz
                 (global.get $global$18)
                )
                (then
                 (global.set $global$18
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$18
                (i32.sub
                 (global.get $global$18)
                 (i32.const 1)
                )
               )
               (nop)
              )
             )
             (br_if $label
              (block (result i32)
               (local.set $1
                (if (result f64)
                 (i32.eqz
                  (i32.const -1)
                 )
                 (then
                  (f64.const -4194304.818)
                 )
                 (else
                  (local.get $1)
                 )
                )
               )
               (i32.const 2147483646)
              )
             )
             (struct.new_default $2)
            )
           )
          )
          (br_if $label1
           (i32.eqz
            (string.compare
             (local.tee $13
              (br_on_cast_fail $block (ref string) (ref string)
               (block (result (ref string))
                (local.set $0
                 (local.get $0)
                )
                (local.tee $14
                 (ref.cast (ref string)
                  (local.tee $15
                   (string.const "998\ed\a0\80")
                  )
                 )
                )
               )
              )
             )
             (string.const "\ed\bd\88")
            )
           )
          )
          (f32x4.extract_lane 0
           (local.tee $3
            (loop (result v128)
             (if
              (i32.eqz
               (global.get $global$18)
              )
              (then
               (global.set $global$18
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$18
              (i32.sub
               (global.get $global$18)
               (i32.const 1)
              )
             )
             (local.get $4)
            )
           )
          )
         )
        )
        (drop
         (f64.convert_i64_s
          (i64.const -17)
         )
        )
        (block
         (global.set $global$12
          (local.get $0)
         )
         (return
          (string.const "")
         )
        )
        (local.set $15
         (local.set $15
          (local.set $13
           (local.set $16
            (local.set $10
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
    (i32.const -524287)
   )
  )
 )
 (func $55 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $54)
  )
  (drop
   (call $54)
  )
  (drop
   (call $54)
  )
 )
 (func $56 (type $12) (result i64 i64)
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 i32)
  (local $4 f64)
  (local $5 f64)
  (local $6 eqref)
  (local $7 eqref)
  (local $8 funcref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const -18)
   (i64.const 0)
  )
 )
 (@binaryen.js.called)
 (func $57 (type $11) (result v128)
  (local $0 i31ref)
  (local $1 (ref string))
  (local $2 (ref string))
  (local $3 eqref)
  (local $4 stringref)
  (local $5 i64)
  (local $6 i64)
  (local $7 f32)
  (local $8 f32)
  (local $9 f64)
  (local $10 f64)
  (local $11 v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.tee $11
   (global.get $global$13)
  )
 )
 (func $58 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $57)
  )
 )
 (func $59 (type $47) (param $0 exnref) (param $1 i64) (param $2 i32) (result eqref)
  (local $3 funcref)
  (local $4 (ref struct))
  (local $5 exnref)
  (local $6 exnref)
  (local $7 stringref)
  (local $8 stringref)
  (local $9 arrayref)
  (local $10 eqref)
  (local $11 externref)
  (local $12 anyref)
  (local $13 i31ref)
  (local $14 (ref eq))
  (local $15 structref)
  (local $16 f32)
  (local $17 f32)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.get $10)
 )
 (@binaryen.js.called)
 (func $60 (type $48) (param $0 i31ref) (param $1 i32) (param $2 externref) (param $3 i32) (result arrayref)
  (local $4 (ref eq))
  (local $5 (ref string))
  (local $6 (ref string))
  (local $7 (ref $3))
  (local $8 (ref struct))
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 f32)
  (local $13 f64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $5
   (string.const "\f0\90\8d\88")
  )
  (block
   (loop $label1
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (drop
     (local.get $9)
    )
    (drop
     (br_on_null $label1
      (loop $label (result (ref i31))
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block (result (ref i31))
        (drop
         (local.get $12)
        )
        (block
         (block
          (call $fimport$4
           (try_table (result f64) (catch_all $label)
            (local.tee $13
             (f64.const -36028797018963968)
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
     )
    )
    (local.set $6
     (local.get $5)
    )
    (drop
     (i64.and
      (local.tee $9
       (i64.const 26716)
      )
      (i64.extend_i32_u
       (try (result i32)
        (do
         (local.get $3)
        )
        (catch $tag$0
         (local.set $14 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $14))))
         (ref.test (ref (exact $2))
          (struct.new_default $2)
         )
        )
       )
      )
     )
    )
    (block
     (call $fimport$6
      (loop (result (ref (exact $0)))
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (array.new_fixed $0 0)
      )
     )
     (br $label1)
    )
    (local.set $7
     (unreachable)
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $61 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $60
    (ref.null none)
    (i32.const -10)
    (ref.null noextern)
    (i32.const -17)
   )
  )
 )
 (func $62 (type $49) (param $0 i32) (param $1 (ref array)) (param $2 (ref array)) (param $3 i32) (result v128 structref f64 i64 f32)
  (local $4 structref)
  (local $5 arrayref)
  (local $6 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block (type $60) (result v128 (ref (exact $2)) f64 i64 f32)
   (call $fimport$5
    (if (result v128)
     (i32.eqz
      (local.tee $0
       (local.get $3)
      )
     )
     (then
      (loop $label3
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (loop $label2
        (if
         (i32.eqz
          (global.get $global$18)
         )
         (then
          (global.set $global$18
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$18
         (i32.sub
          (global.get $global$18)
          (i32.const 1)
         )
        )
        (block $block
         (nop)
         (drop
          (i64.and
           (i64.rem_s
            (i64.const 255)
            (i64.sub
             (call_indirect $0 (type $10)
              (struct.new_default $2)
              (i64.trunc_f64_u
               (f64.const 18446744073709551615)
              )
              (array.new_fixed $0 0)
              (global.get $global$15)
              (v128.const i32x4 0x0015fff0 0x00007fff 0x006c0001 0x2b30a922)
              (global.get $global$11)
              (loop $label1 (result (ref struct))
               (if
                (i32.eqz
                 (global.get $global$18)
                )
                (then
                 (global.set $global$18
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$18
                (i32.sub
                 (global.get $global$18)
                 (i32.const 1)
                )
               )
               (loop $label
                (if
                 (i32.eqz
                  (global.get $global$18)
                 )
                 (then
                  (global.set $global$18
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$18
                 (i32.sub
                  (global.get $global$18)
                  (i32.const 1)
                 )
                )
                (local.set $6
                 (i64.const -2147483646)
                )
                (br_if $label
                 (i32.const -128)
                )
                (nop)
               )
               (br_if $label1
                (i32.eqz
                 (local.get $0)
                )
               )
               (ref.as_non_null
                (local.tee $4
                 (ref.as_non_null
                  (local.get $4)
                 )
                )
               )
              )
              (v128.const i32x4 0x00b00000 0x0080a419 0x80010000 0x00000001)
              (i64.const 7)
             )
             (block (result i64)
              (drop
               (br_on_null $label2
                (string.const "")
               )
              )
              (local.tee $6
               (i64.atomic.load8_u acqrel offset=22
                (i64.and
                 (local.get $6)
                 (i64.const 15)
                )
               )
              )
             )
            )
           )
           (i64.const 15)
          )
         )
         (block
          (nop)
          (br $block)
         )
         (unreachable)
        )
       )
       (br_if $label3
        (i32.eqz
         (loop (result i32)
          (if
           (i32.eqz
            (global.get $global$18)
           )
           (then
            (global.set $global$18
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$18
           (i32.sub
            (global.get $global$18)
            (i32.const 1)
           )
          )
          (block (result i32)
           (atomic.fence acqrel)
           (ref.test (ref string)
            (string.const "965")
           )
          )
         )
        )
       )
       (loop
        (if
         (i32.eqz
          (global.get $global$18)
         )
         (then
          (global.set $global$18
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$18
         (i32.sub
          (global.get $global$18)
          (i32.const 1)
         )
        )
        (block
         (call $8)
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
      (v128.const i32x4 0xf824067f 0xead00601 0xdb00ff80 0xbaa8c37f)
     )
    )
   )
   (tuple.make 5
    (v128.const i32x4 0x00000007 0x43000000 0xffffffb3 0xffffffff)
    (struct.new_default $2)
    (f64.const 4294941715)
    (i64.const -9223372036854775808)
    (f32.const -117)
   )
  )
 )
 (@binaryen.js.called)
 (func $63 (type $50) (param $0 f64) (param $1 eqref) (param $2 stringref) (param $3 f32) (result i64)
  (local $4 f64)
  (local $5 i32)
  (local $6 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (try (result i64)
   (do
    (i64.const 262144)
   )
   (catch $tag$0
    (throw $tag$0 (pop i32))
    (i64.const -41)
   )
   (catch_all
    (i64.trunc_sat_f64_u
     (f64.mul
      (f64.sub
       (f64.copysign
        (f64.load offset=4 align=1
         (i64.and
          (block (result i64)
           (local.get $6)
          )
          (i64.const 15)
         )
        )
        (try_table (result f64)
         (f64.const -41)
        )
       )
       (select
        (f64x2.extract_lane 0
         (call_ref $11
          (ref.func $25)
         )
        )
        (local.get $4)
        (i32.const -2)
       )
      )
      (f64.const -2097152.166)
     )
    )
   )
  )
 )
 (func $64 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $63
    (f64.const -23962)
    (ref.null none)
    (ref.null noextern)
    (f32.const -1.2419999837875366)
   )
  )
 )
 (func $65 (type $51) (param $0 arrayref) (param $1 f64)
  (local $2 (ref array))
  (local $3 externref)
  (local $4 f64)
  (local $5 f64)
  (local $6 v128)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 f32)
  (local $11 f32)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$6
    (struct.new_default $2)
   )
   (block
    (call $fimport$8
     (loop (result (ref extern))
      (if
       (i32.eqz
        (global.get $global$18)
       )
       (then
        (global.set $global$18
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$18
       (i32.sub
        (global.get $global$18)
        (i32.const 1)
       )
      )
      (try (result (ref extern))
       (do
        (ref.as_non_null
         (local.tee $3
          (global.get $gimport$1)
         )
        )
       )
       (catch_all
        (ref.as_non_null
         (local.get $3)
        )
       )
      )
     )
    )
    (block
     (nop)
     (call $fimport$2
      (global.get $global$12)
     )
    )
   )
  )
 )
 (func $66 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (call $65
   (array.new_fixed $0 0)
   (f64.const 49)
  )
  (call $65
   (array.new_fixed $0 0)
   (f64.const -nan:0xfffffffce1205)
  )
  (call $65
   (array.new_fixed $0 0)
   (f64.const -76)
  )
  (call $65
   (array.new_fixed $0 0)
   (f64.const 1578131730)
  )
 )
 (func $67 (type $5) (result f32)
  (local $0 f32)
  (local $1 f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 f64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.tee $0
   (f32.const -3402823466385288598117041e14)
  )
 )
 (func $68 (type $23) (param $0 i31ref) (param $1 i64) (param $2 i31ref) (param $3 structref) (param $4 i64) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 funcref)
  (local $10 structref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (if
   (global.get $global$8)
   (then
    (try
     (do
      (nop)
     )
     (catch $tag$0
      (drop (pop i32))
      (block
       (call $61)
      )
     )
    )
    (return
     (i32.const 255)
    )
   )
   (else
    (nop)
    (return
     (i32.const -23499)
    )
   )
  )
  (unreachable)
 )
 (func $69 (type $52) (result anyref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (ref.i31
     (i32.const 14433)
    )
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $70 (type $53) (result i32)
  (local $0 f32)
  (local $1 f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 v128)
  (local $13 eqref)
  (local $14 eqref)
  (local $15 (ref eq))
  (local $16 (ref eq))
  (local $17 structref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (select
   (i32.atomic.load16_u acqrel offset=22
    (i64.and
     (local.tee $8
      (global.get $global$2)
     )
     (i64.const 15)
    )
   )
   (loop $label (result i32)
    (if
     (i32.eqz
      (global.get $global$18)
     )
     (then
      (global.set $global$18
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$18
     (i32.sub
      (global.get $global$18)
      (i32.const 1)
     )
    )
    (block $block
     (drop
      (br_on_null $block
       (ref.func $70)
      )
     )
     (block
      (nop)
      (drop
       (try_table (result v128) (catch_all $block)
        (try_table (result v128) (catch_all $label)
         (if (result v128)
          (call $fimport$9
           (call_ref $23
            (ref.i31
             (i32.const -2147483648)
            )
            (i64.const 45)
            (ref.i31
             (i32.const -2)
            )
            (ref.null none)
            (i64.const 96)
            (ref.func $68)
           )
           (try_table (result i32) (catch_all $block)
            (local.tee $11
             (i32.const 28978)
            )
           )
          )
          (then
           (i32.store16 offset=3 align=1
            (i64.and
             (local.get $8)
             (i64.const 15)
            )
            (local.tee $11
             (i32.const 255)
            )
           )
           (br $label)
          )
          (else
           (call $fimport$3
            (local.get $0)
           )
           (local.tee $12
            (global.get $global$13)
           )
          )
         )
        )
       )
      )
      (loop
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block
        (block
         (nop)
         (nop)
        )
        (br $block)
       )
       (unreachable)
      )
      (unreachable)
     )
     (unreachable)
    )
    (br_if $label
     (i31.get_u
      (ref.i31
       (i32.const -118)
      )
     )
    )
    (drop
     (br_on_null $label
      (string.const "\e2\82\ac\c2\a3")
     )
    )
    (ref.eq
     (local.tee $14
      (ref.i31
       (i32.const -1)
      )
     )
     (ref.i31
      (i32.const 64)
     )
    )
   )
   (global.get $global$1)
  )
 )
 (func $71 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $70)
  )
 )
 (@binaryen.js.called)
 (func $72 (type $54) (param $0 i64) (result f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 f64)
  (local $5 i32)
  (local $6 f32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i31ref)
  (local $12 i31ref)
  (local $13 funcref)
  (local $14 stringref)
  (local $15 stringref)
  (local $16 stringref)
  (local $17 (ref string))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $17
   (string.const "\e2\82\ac\f0\90\8d\88\c2\a3")
  )
  (drop
   (f32.const 4294967296)
  )
  (try_table
   (drop
    (f64.const -9223372036854775808)
   )
   (drop
    (local.tee $6
     (f32.const -nan:0x7fba09)
    )
   )
   (if
    (i32.eqz
     (string.compare
      (ref.as_non_null
       (local.get $15)
      )
      (local.get $17)
     )
    )
    (then
     (call $fimport$7
      (ref.func $32)
     )
     (return
      (f64.const -9007199254740992)
     )
    )
    (else
     (call_indirect $0 (type $1)
      (i64.const 5)
     )
     (return
      (local.get $3)
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $73 (type $1)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (call $72
    (i64.const -65535)
   )
  )
  (drop
   (call $72
    (i64.const 2147483647)
   )
  )
  (drop
   (call $72
    (i64.const -18172)
   )
  )
 )
 (@binaryen.js.called)
 (func $74 (type $55) (param $0 f64) (result i64 i64)
  (local $1 stringref)
  (local $2 stringref)
  (local $3 exnref)
  (local $4 exnref)
  (local $5 arrayref)
  (local $6 funcref)
  (local $7 funcref)
  (local $8 (ref struct))
  (local $9 structref)
  (local $10 (ref i31))
  (local $11 (ref eq))
  (local $12 (ref string))
  (local $13 (ref string))
  (local $14 (ref $3))
  (local $15 (ref $3))
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
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
  (local $31 f32)
  (local $32 f32)
  (local $33 i64)
  (local $34 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (loop $label2
   (if
    (i32.eqz
     (global.get $global$18)
    )
    (then
     (global.set $global$18
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$18
    (i32.sub
     (global.get $global$18)
     (i32.const 1)
    )
   )
   (block
    (call $fimport$5
     (i16x8.gt_u
      (v128.load offset=4 align=1
       (i64.and
        (i64.atomic.rmw8.xchg_u acqrel offset=22
         (i64.and
          (loop (result i64)
           (if
            (i32.eqz
             (global.get $global$18)
            )
            (then
             (global.set $global$18
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$18
            (i32.sub
             (global.get $global$18)
             (i32.const 1)
            )
           )
           (i64x2.extract_lane 0
            (if (result v128)
             (i32.eqz
              (global.get $global$14)
             )
             (then
              (call $fimport$2
               (i64.reinterpret_f64
                (local.get $20)
               )
              )
              (loop $label (result v128)
               (if
                (i32.eqz
                 (global.get $global$18)
                )
                (then
                 (global.set $global$18
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$18
                (i32.sub
                 (global.get $global$18)
                 (i32.const 1)
                )
               )
               (block
                (call $fimport$3
                 (local.get $31)
                )
                (call $fimport$4
                 (f64.load offset=4 align=4
                  (i64.and
                   (i64.const 3070785104)
                   (i64.const 15)
                  )
                 )
                )
               )
               (br_if $label
                (if (result i32)
                 (ref.test (ref none)
                  (local.tee $10
                   (ref.i31
                    (i32.const 19)
                   )
                  )
                 )
                 (then
                  (nop)
                  (ref.test (ref eq)
                   (local.tee $11
                    (array.new_fixed $0 0)
                   )
                  )
                 )
                 (else
                  (call $fimport$7
                   (ref.func $fimport$1)
                  )
                  (local.get $26)
                 )
                )
               )
               (v128.const i32x4 0x0067ffc8 0xfffdffec 0x0000ffff 0x3e308000)
              )
             )
             (else
              (block $block (result v128)
               (call $fimport$4
                (f64.const 1)
               )
               (br_if $block
                (br_if $block
                 (i32x4.extmul_low_i16x8_s
                  (v128.const i32x4 0xc8022f2a 0x54800000 0xcf000000 0xca936a00)
                  (v128.const i32x4 0xffffffb8 0xffffffff 0x0000001b 0x00000000)
                 )
                 (i32.eqz
                  (loop $label1 (result i32)
                   (if
                    (i32.eqz
                     (global.get $global$18)
                    )
                    (then
                     (global.set $global$18
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$18
                    (i32.sub
                     (global.get $global$18)
                     (i32.const 1)
                    )
                   )
                   (table.set $0
                    (i64.const 2)
                    (local.get $7)
                   )
                   (br_if $label1
                    (i32.eqz
                     (i32.const 104)
                    )
                   )
                   (ref.eq
                    (local.get $5)
                    (ref.i31
                     (i32.const 32768)
                    )
                   )
                  )
                 )
                )
                (if (result i32)
                 (i32.eqz
                  (i32.load offset=22 align=1
                   (i64.and
                    (i64.const -8192)
                    (i64.const 15)
                   )
                  )
                 )
                 (then
                  (f32.eq
                   (f32.const 76)
                   (loop (result f32)
                    (if
                     (i32.eqz
                      (global.get $global$18)
                     )
                     (then
                      (global.set $global$18
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$18
                     (i32.sub
                      (global.get $global$18)
                      (i32.const 1)
                     )
                    )
                    (f32.mul
                     (f32x4.extract_lane 0
                      (v128.const i32x4 0x00000000 0x80000000 0xfffffff4 0xffffffff)
                     )
                     (local.get $31)
                    )
                   )
                  )
                 )
                 (else
                  (nop)
                  (local.get $26)
                 )
                )
               )
              )
             )
            )
           )
          )
          (i64.const 15)
         )
         (i64.const 43367)
        )
        (i64.const 15)
       )
      )
      (i16x8.sub_sat_s
       (global.get $global$13)
       (block (result v128)
        (local.set $13
         (local.tee $12
          (try_table (result (ref string)) (catch_all $label2)
           (if (result (ref string))
            (i32.eqz
             (try_table (result i32) (catch_all $label2)
              (string.eq
               (local.get $2)
               (call_ref $22
                (ref.func $36)
               )
              )
             )
            )
            (then
             (nop)
             (br $label2)
            )
            (else
             (loop $label3
              (if
               (i32.eqz
                (global.get $global$18)
               )
               (then
                (global.set $global$18
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$18
               (i32.sub
                (global.get $global$18)
                (i32.const 1)
               )
              )
              (block
               (call $fimport$7
                (local.get $7)
               )
               (call $fimport$3
                (loop (result f32)
                 (if
                  (i32.eqz
                   (global.get $global$18)
                  )
                  (then
                   (global.set $global$18
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$18
                  (i32.sub
                   (global.get $global$18)
                   (i32.const 1)
                  )
                 )
                 (f32.const 9223372036854775808)
                )
               )
              )
              (br_if $label3
               (i32.const -255)
              )
              (call_indirect $0 (type $1)
               (i64.const 10)
              )
             )
             (string.const "")
            )
           )
          )
         )
        )
        (i32x4.splat
         (if (result i32)
          (i32.lt_u
           (i32.add
            (local.tee $29
             (string.measure_wtf16
              (loop $label4 (result (ref string))
               (if
                (i32.eqz
                 (global.get $global$18)
                )
                (then
                 (global.set $global$18
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$18
                (i32.sub
                 (global.get $global$18)
                 (i32.const 1)
                )
               )
               (table.set $0
                (i64.const 1)
                (ref.func $44)
               )
               (br_if $label4
                (i32.eqz
                 (ref.eq
                  (ref.cast (ref i31)
                   (ref.cast (ref i31)
                    (ref.i31
                     (i32.const 1048575)
                    )
                   )
                  )
                  (global.get $global$15)
                 )
                )
               )
               (string.const "")
              )
             )
            )
            (local.tee $30
             (string.measure_wtf16
              (local.get $13)
             )
            )
           )
           (array.len
            (local.tee $15
             (local.tee $14
              (array.new_default $3
               (i32.and
                (i32.const 49)
                (i32.const 1023)
               )
              )
             )
            )
           )
          )
          (then
           (string.encode_wtf16_array
            (local.get $13)
            (local.get $15)
            (local.get $29)
           )
          )
          (else
           (local.get $28)
          )
         )
        )
       )
      )
     )
    )
    (return
     (tuple.make 2
      (i64.const 49950)
      (i64.const -7909)
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $75 (type $1)
  (local $scratch (tuple i64 i64))
  (local $scratch_1 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $74
        (f64.const -576460752303423488)
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
 (func $76 (type $24) (result arrayref f64)
  (local $0 (ref array))
  (local $1 arrayref)
  (local $2 funcref)
  (local $3 i31ref)
  (local $4 i31ref)
  (local $5 (ref string))
  (local $6 (ref string))
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 (ref $3))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 (ref none))
  (local $13 (ref i31))
  (local $14 (ref eq))
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
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i64)
  (local $30 i64)
  (local $31 i64)
  (local $32 i64)
  (local $33 i64)
  (local $34 f32)
  (local $35 f32)
  (local $36 f32)
  (local $37 f32)
  (local $38 v128)
  (local $39 f64)
  (local $scratch i64)
  (local $scratch_41 i64)
  (local $scratch_42 i64)
  (local $scratch_43 (tuple i64 i64 f32))
  (local $scratch_44 i64)
  (local $scratch_45 i64)
  (local $scratch_46 (tuple i64 i64 f32))
  (local $scratch_47 i64)
  (local $scratch_48 i64)
  (local $scratch_49 f32)
  (local $scratch_50 v128)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $0
   (array.new_fixed $0 0)
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$18)
    )
    (then
     (global.set $global$18
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$18
    (i32.sub
     (global.get $global$18)
     (i32.const 1)
    )
   )
   (block
    (f32.store offset=4 align=2
     (i64.and
      (if (result i64)
       (if (result i32)
        (i32.eqz
         (local.get $15)
        )
        (then
         (local.set $5
          (string.const "\e2\82\ac\f0\90\8d\88")
         )
         (if (result i32)
          (i32.lt_u
           (i32.add
            (local.tee $16
             (local.get $15)
            )
            (local.tee $17
             (string.measure_wtf16
              (local.get $5)
             )
            )
           )
           (array.len
            (local.tee $9
             (array.new $3
              (local.get $15)
              (i32.and
               (i32.const 26)
               (i32.const 1023)
              )
             )
            )
           )
          )
          (then
           (string.encode_wtf16_array
            (local.get $5)
            (local.get $9)
            (local.get $16)
           )
          )
          (else
           (i32.lt_s
            (memory.atomic.notify offset=22
             (i64.and
              (try (result i64)
               (do
                (local.get $25)
               )
               (catch $tag$0
                (local.set $18 (i32.mul (pop i32) (i32.const -1)))
                (block
                 (nop)
                 (br $label)
                )
                (unreachable)
               )
               (catch_all
                (drop
                 (br_on_null $label
                  (ref.i31
                   (i32.const -128)
                  )
                 )
                )
                (if (result i64)
                 (i32.eqz
                  (i32.trunc_f64_u
                   (f64.const 87)
                  )
                 )
                 (then
                  (call $fimport$0
                   (i32.const 0)
                  )
                  (local.get $28)
                 )
                 (else
                  (block $block (result i64)
                   (nop)
                   (i64.atomic.rmw16.xor_u offset=4
                    (i64.and
                     (br_if $block
                      (i64.const -22938)
                      (block (result i32)
                       (local.set $7
                        (local.tee $6
                         (string.from_code_point
                          (call_indirect $0 (type $7)
                           (local.get $28)
                           (local.get $34)
                           (local.get $38)
                           (ref.null none)
                           (i64.const 12)
                          )
                         )
                        )
                       )
                       (if (result i32)
                        (i32.lt_u
                         (i32.add
                          (local.tee $19
                           (local.get $15)
                          )
                          (local.tee $20
                           (string.measure_wtf16
                            (local.get $7)
                           )
                          )
                         )
                         (array.len
                          (local.tee $12
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                         )
                        )
                        (then
                         (string.encode_wtf16_array
                          (local.get $7)
                          (local.get $12)
                          (local.get $19)
                         )
                        )
                        (else
                         (f32.eq
                          (f32.const 2751996160)
                          (block (result f32)
                           (drop
                            (block (result i64)
                             (local.set $scratch
                              (i64.const -32767)
                             )
                             (drop
                              (i64.const -2)
                             )
                             (local.get $scratch)
                            )
                           )
                           (f32.const -90)
                          )
                         )
                        )
                       )
                      )
                     )
                     (i64.const 15)
                    )
                    (i64.const 4294959971)
                   )
                  )
                 )
                )
               )
              )
              (i64.const 15)
             )
             (local.get $15)
            )
            (block (result i32)
             (br_if $label
              (if (result i32)
               (i32.eqz
                (block (result i32)
                 (loop
                  (if
                   (i32.eqz
                    (global.get $global$18)
                   )
                   (then
                    (global.set $global$18
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$18
                   (i32.sub
                    (global.get $global$18)
                    (i32.const 1)
                   )
                  )
                  (nop)
                 )
                 (block (result i32)
                  (try
                   (do
                    (nop)
                   )
                   (catch $tag$0
                    (local.set $21 (i32.xor (pop i32) (i32.const 31)))
                    (nop)
                   )
                   (catch_all
                    (call $fimport$7
                     (ref.null nofunc)
                    )
                   )
                  )
                  (local.get $15)
                 )
                )
               )
               (then
                (nop)
                (call_indirect $0 (type $7)
                 (if (result i64)
                  (local.get $15)
                  (then
                   (i64.atomic.load8_u offset=22
                    (i64.and
                     (local.get $25)
                     (i64.const 15)
                    )
                   )
                  )
                  (else
                   (local.get $28)
                  )
                 )
                 (f32.const 137438953472)
                 (v128.load64_splat offset=4 align=1
                  (i64.and
                   (i64.const -36)
                   (i64.const 15)
                  )
                 )
                 (ref.i31
                  (i32.const -7)
                 )
                 (i64.const 12)
                )
               )
               (else
                (ref.is_null
                 (string.const "989987\c2\a3")
                )
               )
              )
             )
             (local.tee $15
              (i32.load8_s offset=22
               (i64.and
                (if (result i64)
                 (select
                  (i32.const -8388609)
                  (local.get $15)
                  (i32.const -32767)
                 )
                 (then
                  (if (result i64)
                   (i32.eqz
                    (i32.const 2147483647)
                   )
                   (then
                    (local.get $25)
                   )
                   (else
                    (local.tee $25
                     (loop $label1 (result i64)
                      (if
                       (i32.eqz
                        (global.get $global$18)
                       )
                       (then
                        (global.set $global$18
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$18
                       (i32.sub
                        (global.get $global$18)
                        (i32.const 1)
                       )
                      )
                      (local.set $2
                       (ref.null nofunc)
                      )
                      (br_if $label1
                       (local.get $15)
                      )
                      (i64.const 128)
                     )
                    )
                   )
                  )
                 )
                 (else
                  (loop
                   (if
                    (i32.eqz
                     (global.get $global$18)
                    )
                    (then
                     (global.set $global$18
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$18
                    (i32.sub
                     (global.get $global$18)
                     (i32.const 1)
                    )
                   )
                   (nop)
                  )
                  (local.get $28)
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
        (else
         (global.get $global$8)
        )
       )
       (then
        (drop
         (br_on_null $label
          (struct.new_default $2)
         )
        )
        (drop
         (block (result i64)
          (local.set $scratch_48
           (tuple.extract 3 0
            (local.tee $scratch_46
             (loop $label2 (type $14) (result i64 i64 f32)
              (if
               (i32.eqz
                (global.get $global$18)
               )
               (then
                (global.set $global$18
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$18
               (i32.sub
                (global.get $global$18)
                (i32.const 1)
               )
              )
              (block
               (block
                (nop)
                (nop)
               )
               (call $fimport$6
                (select (result (ref eq))
                 (array.new_fixed $0 0)
                 (local.tee $13
                  (ref.i31
                   (i32.const 1024)
                  )
                 )
                 (local.get $15)
                )
               )
              )
              (br_if $label2
               (call_ref $16
                (i31.get_u
                 (ref.i31
                  (i32.const -2097152)
                 )
                )
                (if (result i32)
                 (i32.const 262144)
                 (then
                  (local.get $15)
                 )
                 (else
                  (i32.const -2)
                 )
                )
                (ref.func $fimport$9)
               )
              )
              (tuple.make 3
               (local.tee $29
                (block (result i64)
                 (local.set $scratch_45
                  (tuple.extract 3 0
                   (local.tee $scratch_43
                    (try_table (type $14) (result i64 i64 f32) (catch_all $label2)
                     (tuple.make 3
                      (local.tee $31
                       (block (result i64)
                        (local.set $scratch_42
                         (i64.const -32768)
                        )
                        (local.set $32
                         (block (result i64)
                          (local.set $scratch_41
                           (i64.const -31)
                          )
                          (local.set $36
                           (f32.const -nan:0x7fffbd)
                          )
                          (local.get $scratch_41)
                         )
                        )
                        (local.get $scratch_42)
                       )
                      )
                      (local.get $32)
                      (local.get $36)
                     )
                    )
                   )
                  )
                 )
                 (local.set $30
                  (block (result i64)
                   (local.set $scratch_44
                    (tuple.extract 3 1
                     (local.get $scratch_43)
                    )
                   )
                   (local.set $35
                    (tuple.extract 3 2
                     (local.get $scratch_43)
                    )
                   )
                   (local.get $scratch_44)
                  )
                 )
                 (local.get $scratch_45)
                )
               )
               (local.get $30)
               (local.get $35)
              )
             )
            )
           )
          )
          (local.set $33
           (block (result i64)
            (local.set $scratch_47
             (tuple.extract 3 1
              (local.get $scratch_46)
             )
            )
            (drop
             (tuple.extract 3 2
              (local.get $scratch_46)
             )
            )
            (local.get $scratch_47)
           )
          )
          (local.get $scratch_48)
         )
        )
        (i64.atomic.load offset=4
         (i64.and
          (i64.load8_u offset=2
           (i64.and
            (local.tee $28
             (local.get $33)
            )
            (i64.const 15)
           )
          )
          (i64.const 15)
         )
        )
       )
       (else
        (i64.trunc_f32_s
         (block (result f32)
          (try
           (do
            (call $fimport$4
             (try_table (result f64) (catch_all $label)
              (if (result f64)
               (loop $label3 (result i32)
                (if
                 (i32.eqz
                  (global.get $global$18)
                 )
                 (then
                  (global.set $global$18
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$18
                 (i32.sub
                  (global.get $global$18)
                  (i32.const 1)
                 )
                )
                (block $block1 (result i32)
                 (call $fimport$7
                  (ref.func $47)
                 )
                 (drop
                  (br_on_null $label3
                   (ref.null nofunc)
                  )
                 )
                 (call_indirect $0 (type $7)
                  (try_table (result i64) (catch $tag$0 $block1) (catch_all $label)
                   (i64.const -18014398509481984)
                  )
                  (local.get $34)
                  (select
                   (v128.const i32x4 0xffff65e3 0xc24fffff 0xf1c00000 0x41efffff)
                   (global.get $global$13)
                   (i32.const -2147483648)
                  )
                  (ref.i31
                   (i32.const -1961403)
                  )
                  (i64.const 12)
                 )
                )
               )
               (then
                (call_indirect $0 (type $1)
                 (i64.const 10)
                )
                (br $label)
               )
               (else
                (atomic.fence acqrel)
                (f64.const -nan:0xfffffffffff99)
               )
              )
             )
            )
           )
           (catch_all
            (call_indirect $0 (type $1)
             (i64.const 5)
            )
           )
          )
          (f32.sub
           (f32.const 8192)
           (local.tee $34
            (if (result f32)
             (i32.eqz
              (call $24
               (global.get $global$11)
               (ref.i31
                (i32.const -524288)
               )
              )
             )
             (then
              (try
               (do
                (br_if $label
                 (i32.eqz
                  (ref.test (ref eq)
                   (local.tee $14
                    (local.get $0)
                   )
                  )
                 )
                )
               )
               (catch $tag$0
                (local.set $22 (i32.eqz (pop i32)))
                (local.set $38
                 (v128.load32x2_s offset=22 align=2
                  (i64.and
                   (local.get $28)
                   (i64.const 15)
                  )
                 )
                )
               )
               (catch_all
                (drop
                 (local.tee $25
                  (local.get $28)
                 )
                )
               )
              )
              (br $label)
             )
             (else
              (local.set $25
               (global.get $global$12)
              )
              (f32.const 2147483648)
             )
            )
           )
          )
         )
        )
       )
      )
      (i64.const 15)
     )
     (block (result f32)
      (drop
       (block (result v128)
        (local.set $scratch_50
         (v128.const i32x4 0xfffffffe 0xc32fffff 0x00000000 0x40eff180)
        )
        (local.set $37
         (block (result f32)
          (local.set $scratch_49
           (f32.const -15028)
          )
          (drop
           (i32.const 4095)
          )
          (local.get $scratch_49)
         )
        )
        (local.get $scratch_50)
       )
      )
      (local.get $37)
     )
    )
    (br $label)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $77 (type $1)
  (local $scratch (tuple arrayref f64))
  (local $scratch_1 arrayref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result arrayref)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $76)
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
 (func $78 (type $25) (result v128 f64 i32 f32 stringref f32)
  (local $0 (ref string))
  (local $1 (ref array))
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $0
   (string.const "929\ed\bd\88")
  )
  (block (type $62) (result v128 f64 i32 f32 (ref string) f32)
   (nop)
   (tuple.make 6
    (v128.const i32x4 0x0213bd6c 0xffffff80 0x80000010 0x80010080)
    (local.get $2)
    (block (result i32)
     (nop)
     (ref.is_null
      (global.get $global$0)
     )
    )
    (f32.const 562949953421312)
    (string.const "\ed\bd\88\ed\bd\88\c2\a3")
    (loop $label (result f32)
     (if
      (i32.eqz
       (global.get $global$18)
      )
      (then
       (global.set $global$18
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$18
      (i32.sub
       (global.get $global$18)
       (i32.const 1)
      )
     )
     (block
      (loop
       (if
        (i32.eqz
         (global.get $global$18)
        )
        (then
         (global.set $global$18
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$18
        (i32.sub
         (global.get $global$18)
         (i32.const 1)
        )
       )
       (block
        (nop)
        (nop)
       )
      )
      (atomic.fence)
     )
     (drop
      (try (result (ref array))
       (do
        (array.new_fixed $0 0)
       )
       (catch $tag$0
        (local.set $4 (call $__popsink_0 (pop i32)))
        (array.new_fixed $0 0)
       )
       (catch_all
        (select (result (ref array))
         (local.tee $1
          (array.new_fixed $0 0)
         )
         (array.new_fixed $0 0)
         (string.compare
          (local.get $0)
          (string.const "\c2\a3")
         )
        )
       )
      )
     )
     (br_if $label
      (i32.eqz
       (ref.eq
        (block
         (br $label)
        )
        (if (result (ref eq))
         (i32x4.bitmask
          (unreachable)
         )
         (then
          (ref.i31
           (i32.const -223)
          )
         )
         (else
          (array.new_fixed $0 0)
         )
        )
       )
      )
     )
     (f32.load offset=1 align=1
      (i64.and
       (i64.atomic.rmw8.xchg_u offset=22
        (i64.and
         (i64.const -88)
         (i64.const 15)
        )
        (local.get $5)
       )
       (i64.const 15)
      )
     )
    )
   )
  )
 )
 (func $79 (type $56) (param $0 stringref) (param $1 i64) (param $2 (ref struct)) (result i64)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (return
   (global.get $global$12)
  )
 )
 (func $80 (type $57) (param $0 i32) (param $1 f32) (param $2 i64) (param $3 i32) (result anyref i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 i64)
  (local $8 i64)
  (local $9 f32)
  (local $10 f32)
  (local $11 v128)
  (local $12 eqref)
  (local $13 (ref string))
  (local $14 arrayref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (ref.i31
    (i32.const 8)
   )
   (i64.const -17076)
  )
 )
 (func $81 (type $1)
  (local $scratch (tuple anyref i64))
  (local $scratch_1 anyref)
  (local $scratch_2 (tuple anyref i64))
  (local $scratch_3 anyref)
  (local $scratch_4 (tuple anyref i64))
  (local $scratch_5 anyref)
  (local $scratch_6 (tuple anyref i64))
  (local $scratch_7 anyref)
  (local $scratch_8 (tuple anyref i64))
  (local $scratch_9 anyref)
  (local $scratch_10 (tuple anyref i64))
  (local $scratch_11 anyref)
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (drop
   (block (result anyref)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $80
        (i32.const -1073741824)
        (f32.const 58)
        (i64.const -129)
        (i32.const -85)
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
   (block (result anyref)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $80
        (i32.const -99)
        (f32.const 61)
        (i64.const -72458275045091)
        (i32.const -24765)
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
  (drop
   (block (result anyref)
    (local.set $scratch_5
     (tuple.extract 2 0
      (local.tee $scratch_4
       (call $80
        (i32.const 255)
        (f32.const -76)
        (i64.const 8589934592)
        (i32.const -10732)
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_4)
     )
    )
    (local.get $scratch_5)
   )
  )
  (drop
   (block (result anyref)
    (local.set $scratch_7
     (tuple.extract 2 0
      (local.tee $scratch_6
       (call $80
        (i32.const -5025)
        (f32.const -2147483648)
        (i64.const -60)
        (i32.const -19)
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_6)
     )
    )
    (local.get $scratch_7)
   )
  )
  (drop
   (block (result anyref)
    (local.set $scratch_9
     (tuple.extract 2 0
      (local.tee $scratch_8
       (call $80
        (i32.const -33)
        (f32.const -nan:0x7fffd8)
        (i64.const 257)
        (i32.const -16)
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_8)
     )
    )
    (local.get $scratch_9)
   )
  )
  (drop
   (block (result anyref)
    (local.set $scratch_11
     (tuple.extract 2 0
      (local.tee $scratch_10
       (call $80
        (i32.const -2097152)
        (f32.const -nan:0x7fc679)
        (i64.const -32768)
        (i32.const -524288)
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_10)
     )
    )
    (local.get $scratch_11)
   )
  )
 )
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
