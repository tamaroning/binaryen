(module
 (type $0 (func))
 (type $1 (func (result f32 externref i32 exnref f64 i32)))
 (type $2 (func (result f32 stringref i32 exnref f64 i32)))
 (type $3 (func (param f32)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32) (result i32)))
 (type $6 (func (param f32 v128 i64 i64 v128) (result f32)))
 (type $7 (func (result funcref i32 externref)))
 (type $8 (func (param f64)))
 (type $9 (func (param i64)))
 (type $10 (func (param v128)))
 (type $11 (func (param f32) (result v128)))
 (type $12 (func (param f32 f32) (result f64 f64 i32 f32)))
 (type $13 (func (param i32) (result f64)))
 (type $14 (func (param exnref f32 i64 f64) (result f64)))
 (type $15 (func (param f64 f64) (result f64)))
 (type $16 (func (result i32)))
 (type $17 (func (param f64 f32 i64 i32 f32 f64 i32 v128)))
 (type $18 (func (param i64) (result funcref)))
 (type $19 (func (result f64)))
 (type $20 (func (param funcref f32 f64) (result f32)))
 (type $21 (func (param f64) (result f64)))
 (type $22 (func (result f64 f64 i32 f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$0 (param f64)))
 (import "fuzzing-support" "log-f32" (func $fimport$1 (param f32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (param i64)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (param i32)))
 (import "fuzzing-support" "log-v128" (func $fimport$4 (param v128)))
 (import "fuzzing-support" "throw" (func $fimport$5 (param i32)))
 (global $global$0 stringref (string.const "\c2\a3\f0\90\8d\88"))
 (global $global$1 (mut i32) (i32.const 99))
 (memory $0 16 16 shared)
 (data $0 (i32.const 0) "\dc\a1\f6D\daf\bb\faN:\95\93\e04\f4\03*\12x\01[")
 (table $0 i64 9 funcref)
 (table $1 5 5 exnref)
 (elem $0 (table $0) (i64.const 0) func $3 $5 $5 $4 $10 $9 $2 $0 $6)
 (elem declare func $12 $fimport$3)
 (tag $tag$0 (type $3) (param f32))
 (export "func" (func $29))
 (export "func_invoker" (func $28))
 (export "func_8" (func $8))
 (export "func_8_invoker" (func $17))
 (export "func_10_invoker" (func $13))
 (export "func_12" (func $12))
 (export "func_15_invoker" (func $27))
 (export "func_17" (func $10))
 (export "func_17_invoker" (func $26))
 (export "func_19_invoker" (func $24))
 (export "func_21" (func $9))
 (export "func_24_invoker" (func $22))
 (export "func_26" (func $7))
 (export "func_26_invoker" (func $21))
 (export "func_28_invoker" (func $20))
 (export "func_30_invoker" (func $19))
 (export "func_33_invoker" (func $18))
 (export "func_35" (func $6))
 (export "func_35_invoker" (func $16))
 (export "func_37" (func $15))
 (export "func_38" (func $14))
 (func $0 (param $0 f32) (result v128)
  (local $1 i32)
  (local $2 i32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 externref)
  (local $13 externref)
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
  (v128.const i32x4 0x00000000 0x40800000 0xffdbb646 0x41efffff)
 )
 (@binaryen.js.called)
 (func $1 (param $0 f32) (param $1 f32) (result f64 f64 i32 f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 v128)
  (local $5 v128)
  (local $6 i64)
  (local $7 f32)
  (local $8 exnref)
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
  (table.set $1
   (i32.const 2)
   (local.tee $8
    (block $block (result exnref)
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (f32.min
        (local.get $1)
        (local.get $1)
       )
      )
     )
     (unreachable)
    )
   )
  )
  (call $fimport$4
   (i16x8.splat
    (i8x16.extract_lane_u 12
     (i16x8.sub_sat_s
      (v128.const i32x4 0x00010000 0xbc190034 0xffa20080 0x0000fffb)
      (v128.load32x2_s offset=4 align=1
       (i32.and
        (f32.ne
         (local.get $0)
         (f32.const -4503599627370496)
        )
        (i32.const 15)
       )
      )
     )
    )
   )
  )
  (call $fimport$2
   (local.get $6)
  )
  (return
   (tuple.make 4
    (f64.const 256.816)
    (f64.const -nan:0xfffffffffa723)
    (i32.const -94)
    (f32.const -1.968999981880188)
   )
  )
 )
 (func $2 (param $0 i32) (result f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 f32)
  (local $4 f32)
  (local $5 f64)
  (local $6 exnref)
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
   (call $fimport$3
    (local.get $0)
   )
   (block $block
    (if
     (i32.eqz
      (ref.is_null
       (call $9
        (local.get $1)
       )
      )
     )
     (then
      (block $block1
       (call $fimport$1
        (f32.const 2147483648)
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
       (f32.store offset=2 align=2
        (i32.and
         (i32.atomic.load8_u offset=4
          (i32.and
           (i32.const -6)
           (i32.const 15)
          )
         )
         (i32.const 15)
        )
        (f32.const 2251799813685248)
       )
       (if
        (local.get $0)
        (then
         (br $block)
        )
       )
       (br $block1)
      )
     )
     (else
      (local.set $3
       (block $block2 (result f32)
        (if
         (i32.eqz
          (if (result i32)
           (call $7)
           (then
            (call $fimport$3
             (f32.ge
              (f32.const -4194303)
              (local.get $3)
             )
            )
            (select
             (call_indirect $0 (type $5)
              (i32.const -1)
              (i64.const 3)
             )
             (block (result i32)
              (call $fimport$3
               (i32.const 4096)
              )
              (local.set $3
               (f32.const 65495)
              )
              (i32.const 96)
             )
             (i32.load offset=4 align=2
              (i32.and
               (f64.gt
                (f64.const -4294967295.594)
                (f64.const 1)
               )
               (i32.const 15)
              )
             )
            )
           )
           (else
            (try_table (catch $tag$0 $block2) (catch $tag$0 $block2)
             (call_indirect $0 (type $0)
              (i64.const 4)
             )
            )
            (i32.const -20)
           )
          )
         )
         (then
          (return
           (local.get $5)
          )
         )
         (else
          (call_indirect $0 (type $0)
           (i64.const 4)
          )
          (call $fimport$2
           (i64.const -7921)
          )
         )
        )
        (br $label)
       )
      )
     )
    )
    (call $fimport$1
     (f32.load offset=3 align=1
      (i32.and
       (call $7)
       (i32.const 15)
      )
     )
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
   (call $fimport$5
    (i32.const 0)
   )
   (br $label)
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $3 (param $0 f32) (param $1 v128) (param $2 i64) (param $3 i64) (param $4 v128) (result f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (local $22 f32)
  (local $23 f32)
  (local $24 f32)
  (local $25 f32)
  (local $26 f64)
  (local $27 f64)
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 exnref)
  (local $32 exnref)
  (local $33 exnref)
  (local $34 exnref)
  (local $35 exnref)
  (local $36 stringref)
  (local $37 stringref)
  (local $38 stringref)
  (local $39 stringref)
  (local $scratch (tuple f32 stringref i32 exnref f64 i32))
  (local $scratch_41 f64)
  (local $scratch_42 exnref)
  (local $scratch_43 i32)
  (local $scratch_44 stringref)
  (local $scratch_45 f32)
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
  (block $block (result f32)
   (table.set $1
    (i32.const 4)
    (block $block1 (result exnref)
     (call $fimport$0
      (local.get $26)
     )
     (local.set $25
      (local.tee $24
       (block (result f32)
        (local.set $scratch_45
         (tuple.extract 6 0
          (local.tee $scratch
           (try_table (type $2) (result f32 stringref i32 exnref f64 i32) (catch $tag$0 $block) (catch $tag$0 $block) (catch_all_ref $block1)
            (if (type $2) (result f32 stringref i32 exnref f64 i32)
             (i32.lt_s
              (if (result i32)
               (i32.eqz
                (i32.shr_s
                 (i8x16.extract_lane_s 12
                  (v128.const i32x4 0x0b160096 0x06d26056 0x9ca768e7 0x4297db00)
                 )
                 (local.tee $5
                  (local.tee $5
                   (i32.const 0)
                  )
                 )
                )
               )
               (then
                (if
                 (i64.eqz
                  (i64x2.extract_lane 1
                   (f64x2.splat
                    (local.get $26)
                   )
                  )
                 )
                 (then
                  (call $fimport$2
                   (local.get $2)
                  )
                 )
                )
                (if (result i32)
                 (local.get $5)
                 (then
                  (call $fimport$0
                   (if (result f64)
                    (local.tee $7
                     (i32.const -29)
                    )
                    (then
                     (f64.const 204)
                    )
                    (else
                     (f64.const -4503599627370498)
                    )
                   )
                  )
                  (return
                   (f32.const -18)
                  )
                 )
                 (else
                  (call $fimport$5
                   (i32.const -131072)
                  )
                  (i32.const 2147483647)
                 )
                )
               )
               (else
                (call $fimport$3
                 (i32.div_u
                  (local.get $5)
                  (local.get $7)
                 )
                )
                (return
                 (f32.const -98)
                )
               )
              )
              (i32.const 3)
             )
             (then
              (tuple.make 6
               (f32.const -2147483648)
               (ref.null noextern)
               (i32.const -1)
               (ref.null noexn)
               (f64.const -23249)
               (i32.const -2007603107)
              )
             )
             (else
              (table.set $1
               (i32.const 2)
               (ref.null noexn)
              )
              (call $fimport$2
               (local.get $14)
              )
              (i64.store8 offset=2
               (i32.and
                (if (result i32)
                 (i32.eqz
                  (loop $label (result i32)
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
                    (local.get $0)
                   )
                   (br_if $label
                    (i32.const -2598541)
                   )
                   (i32.atomic.load8_u offset=22
                    (i32.and
                     (local.tee $7
                      (local.get $7)
                     )
                     (i32.const 15)
                    )
                   )
                  )
                 )
                 (then
                  (call $fimport$2
                   (i64.const 1801786893)
                  )
                  (if (result i32)
                   (local.tee $7
                    (local.get $5)
                   )
                   (then
                    (local.tee $5
                     (i32.const -13)
                    )
                   )
                   (else
                    (i32.const 128)
                   )
                  )
                 )
                 (else
                  (call $fimport$3
                   (select
                    (if (result i32)
                     (if (result i32)
                      (i32.eqz
                       (local.get $5)
                      )
                      (then
                       (select
                        (local.tee $5
                         (i32.const 4095)
                        )
                        (i32.const -91)
                        (i32.const -16383)
                       )
                      )
                      (else
                       (local.tee $7
                        (local.get $7)
                       )
                      )
                     )
                     (then
                      (i32.const -91)
                     )
                     (else
                      (local.get $7)
                     )
                    )
                    (local.get $7)
                    (local.get $5)
                   )
                  )
                  (return
                   (f32.const 14737656290213888)
                  )
                 )
                )
                (i32.const 15)
               )
               (select
                (local.get $18)
                (i64.const 87)
                (local.tee $5
                 (i32.const -9)
                )
               )
              )
              (tuple.make 6
               (f32.const -nan:0x7fffe5)
               (string.const "\c2\a3\c2\a3957")
               (i32.const -19085)
               (ref.null noexn)
               (f64.const -26776771)
               (i32.const 67108864)
              )
             )
            )
           )
          )
         )
        )
        (local.set $38
         (block (result stringref)
          (local.set $scratch_44
           (tuple.extract 6 1
            (local.get $scratch)
           )
          )
          (local.set $11
           (block (result i32)
            (local.set $scratch_43
             (tuple.extract 6 2
              (local.get $scratch)
             )
            )
            (local.set $34
             (block (result exnref)
              (local.set $scratch_42
               (tuple.extract 6 3
                (local.get $scratch)
               )
              )
              (local.set $29
               (block (result f64)
                (local.set $scratch_41
                 (tuple.extract 6 4
                  (local.get $scratch)
                 )
                )
                (local.set $12
                 (tuple.extract 6 5
                  (local.get $scratch)
                 )
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
          (local.get $scratch_44)
         )
        )
        (local.get $scratch_45)
       )
      )
     )
     (local.set $39
      (local.get $38)
     )
     (local.set $13
      (local.get $11)
     )
     (local.set $35
      (local.get $34)
     )
     (local.set $30
      (local.get $29)
     )
     (local.set $9
      (local.get $12)
     )
     (local.set $27
      (local.get $30)
     )
     (local.set $32
      (local.get $35)
     )
     (local.set $8
      (local.get $13)
     )
     (local.set $36
      (local.get $39)
     )
     (local.set $23
      (local.tee $22
       (local.get $25)
      )
     )
     (local.set $37
      (local.get $36)
     )
     (local.set $10
      (local.get $8)
     )
     (local.set $33
      (local.get $32)
     )
     (local.set $28
      (local.get $27)
     )
     (local.set $31
      (local.get $33)
     )
     (local.get $31)
    )
   )
   (return
    (f32.const -nan:0x7fb053)
   )
  )
 )
 (@binaryen.js.called)
 (func $4 (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 v128)
  (local $14 v128)
  (local $15 v128)
  (local $16 v128)
  (local $17 v128)
  (local $18 f32)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (local $22 f32)
  (local $23 f32)
  (local $24 f32)
  (local $25 f32)
  (local $26 f32)
  (local $27 f32)
  (local $28 f32)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 f64)
  (local $33 f64)
  (local $34 f64)
  (local $35 i32)
  (local $36 i32)
  (local $37 i32)
  (local $38 i32)
  (local $39 i32)
  (local $40 i32)
  (local $41 i32)
  (local $42 exnref)
  (local $43 exnref)
  (local $44 exnref)
  (local $45 exnref)
  (local $46 exnref)
  (local $47 exnref)
  (local $48 exnref)
  (local $49 stringref)
  (local $50 stringref)
  (local $51 stringref)
  (local $52 stringref)
  (local $53 stringref)
  (local $54 stringref)
  (local $55 stringref)
  (local $56 stringref)
  (local $57 stringref)
  (local $58 stringref)
  (local $59 stringref)
  (local $60 stringref)
  (local $61 externref)
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
  (local.set $50
   (global.get $global$0)
  )
  (if (result i32)
   (i32.eqz
    (local.get $35)
   )
   (then
    (ref.is_null
     (local.tee $50
      (local.get $50)
     )
    )
   )
   (else
    (block $block (result i32)
     (local.set $38
      (i32.const 1048575)
     )
     (local.set $8
      (i64.const -57)
     )
     (memory.copy
      (i32.and
       (br_if $block
        (i32.const -36)
        (i32.eqz
         (local.get $38)
        )
       )
       (i32.const 15)
      )
      (i32.and
       (call $4
        (local.tee $0
         (i32.const -36)
        )
       )
       (i32.const 15)
      )
      (i32x4.all_true
       (v128.const i32x4 0x00000004 0x42f00000 0xffff8402 0xffffffff)
      )
     )
     (local.set $50
      (local.get $50)
     )
     (block $block1
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
        (local.get $35)
        (then
         (local.set $15
          (v128.const i32x4 0xffffd24a 0xffffffff 0x00000000 0x80000000)
         )
         (br $label)
        )
        (else
         (br_if $block1
          (i32.eqz
           (i32.const 131072)
          )
         )
        )
       )
      )
      (br $block1)
     )
     (drop
      (i32.eqz
       (local.get $0)
      )
     )
     (return
      (local.get $0)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $5 (param $0 exnref) (param $1 f32) (param $2 i64) (param $3 f64) (result f64)
  (local $4 f32)
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
  (local.set $2
   (i64.rem_u
    (i64.const -45)
    (i64.atomic.load32_u acqrel offset=22
     (i32.and
      (i32.const -536870911)
      (i32.const 15)
     )
    )
   )
  )
  (local.get $3)
 )
 (@binaryen.js.called)
 (func $6 (param $0 f64) (param $1 f64) (result f64)
  (local $2 f64)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
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
  (local $19 i64)
  (local $20 i64)
  (local $21 i64)
  (local $22 i64)
  (local $23 i64)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 v128)
  (local $30 v128)
  (local $31 externref)
  (local $32 stringref)
  (local $33 stringref)
  (local $34 stringref)
  (local $35 stringref)
  (local $36 stringref)
  (local $37 stringref)
  (local $38 stringref)
  (local $39 stringref)
  (local $40 stringref)
  (local $41 stringref)
  (local $42 stringref)
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
  (local.set $9
   (i32.ctz
    (local.get $9)
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
   (block $block
    (local.set $13
     (i32.const 134217728)
    )
    (br_if $block
     (local.get $13)
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
   (return
    (local.get $1)
   )
  )
  (unreachable)
 )
 (func $7 (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f64)
  (local $10 exnref)
  (local $11 exnref)
  (local $12 externref)
  (local $13 stringref)
  (local $14 stringref)
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
  (i32.const -71)
 )
 (func $8 (param $0 f64) (param $1 f32) (param $2 i64) (param $3 i32) (param $4 f32) (param $5 f64) (param $6 i32) (param $7 v128)
  (local $8 v128)
  (local $9 v128)
  (local $10 i32)
  (local $11 f32)
  (local $12 f32)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 f64)
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
  (call $fimport$5
   (i32.const -126)
  )
  (block $block1
   (local.set $14
    (i64.const -114)
   )
   (local.set $13
    (i64.const -144490419)
   )
   (local.set $9
    (v128.const i32x4 0xffdf1a34 0x02000020 0x623100ff 0x477effff)
   )
   (local.set $11
    (f32.const 65515)
   )
   (local.set $8
    (local.get $9)
   )
   (if
    (i32.eqz
     (i16x8.extract_lane_s 3
      (local.get $8)
     )
    )
    (then
     (drop
      (loop $label (result i32)
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
        (br_if $block
         (i32.eqz
          (select
           (local.tee $6
            (local.get $3)
           )
           (i32.wrap_i64
            (local.get $2)
           )
           (block (result i32)
            (local.set $17
             (f64.const 9223372036854775808)
            )
            (local.set $16
             (i64.const 2147483648)
            )
            (local.set $15
             (i64.const -134217729)
            )
            (local.set $12
             (f32.const -255.82200622558594)
            )
            (local.set $10
             (i32.const -20)
            )
            (local.get $10)
           )
          )
         )
        )
       )
       (br_if $label
        (if (result i32)
         (i32.eqz
          (memory.atomic.notify offset=4
           (i32.and
            (local.tee $3
             (local.get $6)
            )
            (i32.const 15)
           )
           (local.get $6)
          )
         )
         (then
          (local.get $3)
         )
         (else
          (i32.const 128)
         )
        )
       )
       (local.get $3)
      )
     )
     (local.set $6
      (i32.load16_s offset=2 align=1
       (i32.and
        (select
         (i32.eq
          (i32.const -2147483646)
          (i32.const 32)
         )
         (i32.const -65536)
         (loop $label1 (result i32)
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
          (br_if $label1
           (i32.eqz
            (local.get $6)
           )
          )
          (local.get $6)
         )
        )
        (i32.const 15)
       )
      )
     )
     (br $block1)
    )
    (else
     (br $block1)
    )
   )
   (unreachable)
  )
  (if
   (local.get $6)
   (then
    (atomic.fence acqrel)
   )
  )
 )
 (func $9 (param $0 i64) (result funcref)
  (local $1 exnref)
  (local $2 f32)
  (local $3 i32)
  (local $4 i32)
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
  (ref.func $fimport$3)
 )
 (@binaryen.js.called)
 (func $10
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
 )
 (func $11 (result f64)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f32)
  (local $7 f32)
  (local $8 exnref)
  (local $9 funcref)
  (local $10 funcref)
  (local $11 funcref)
  (local $12 stringref)
  (local $13 externref)
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
  (memory.copy
   (i32.and
    (i32.const 4194303)
    (i32.const 15)
   )
   (i32.and
    (i32.const 65534)
    (i32.const 15)
   )
   (i32.const 32769)
  )
  (return
   (f64.const -4503599627370497)
  )
 )
 (@binaryen.js.called)
 (func $12 (result funcref i32 externref)
  (local $0 f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 funcref)
  (local $7 funcref)
  (local $8 stringref)
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
  (call $fimport$0
   (f64.const -nan:0xfffffffffaf2f)
  )
  (call $fimport$0
   (if (result f64)
    (i32.eqz
     (local.get $1)
    )
    (then
     (f64.convert_i32_s
      (local.get $1)
     )
    )
    (else
     (try_table
      (call $fimport$0
       (f64.const -134217726.408)
      )
      (return
       (tuple.make 3
        (ref.func $12)
        (i32.const -28106)
        (string.const "\f0\90\8d\88828\c2\a3")
       )
      )
     )
     (unreachable)
    )
   )
  )
  (local.set $7
   (ref.func $12)
  )
  (local.set $4
   (i32.const -2147483648)
  )
  (local.set $8
   (string.const "\f0\90\8d\88\ed\a0\80")
  )
  (local.set $3
   (local.get $4)
  )
  (tuple.make 3
   (local.tee $6
    (local.get $7)
   )
   (local.get $3)
   (local.get $8)
  )
 )
 (func $13
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
   (call $5
    (ref.null noexn)
    (f32.const -49)
    (i64.const 35)
    (f64.const -4611686018427387904)
   )
  )
  (drop
   (call $5
    (ref.null noexn)
    (f32.const 0.10199999809265137)
    (i64.const -437)
    (f64.const 29512)
   )
  )
 )
 (@binaryen.js.called)
 (func $14
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 i64)
  (local $6 i64)
  (local $7 v128)
  (local $8 i32)
  (local $9 i32)
  (local $10 stringref)
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
    (call $fimport$4
     (v128.const i32x4 0x00000000 0xfffe0000 0xffffffff 0x00000000)
    )
   )
   (catch $tag$0
    (local.set $4
     (pop f32)
    )
   )
   (catch_all
    (loop $label1
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
     (memory.copy
      (i32.and
       (local.tee $8
        (i32.atomic.load8_u
         (i32.and
          (select
           (i32.trunc_f64_u
            (f64.const -3402823466385288598117041e14)
           )
           (i32.const 0)
           (local.tee $8
            (i32.const -1)
           )
          )
          (i32.const 15)
         )
        )
       )
       (i32.const 15)
      )
      (i32.and
       (local.get $8)
       (i32.const 15)
      )
      (i32.const 65426)
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
      (br_if $label
       (i32.const -8388608)
      )
     )
     (br $label1)
    )
    (unreachable)
   )
  )
  (memory.copy
   (i32.and
    (i32.const 41)
    (i32.const 15)
   )
   (i32.and
    (i32.const 536870912)
    (i32.const 15)
   )
   (i32x4.extract_lane 2
    (v128.const i32x4 0x8020ebff 0x39000008 0x1d5da200 0x01000101)
   )
  )
 )
 (func $15 (param $0 funcref) (param $1 f32) (param $2 f64) (result f32)
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
   (i32.const -255)
  )
  (return
   (f32.const 9223372036854775808)
  )
 )
 (func $16
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
   (call $6
    (f64.const 4294967237)
    (f64.const 128)
   )
  )
  (drop
   (call $6
    (f64.const -3402823466385288598117041e14)
    (f64.const -9223372036854775808)
   )
  )
 )
 (func $17
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
  (call $8
   (f64.const 1797693134862315708145274e284)
   (f32.const 2147483648)
   (i64.const -120)
   (i32.const -129)
   (f32.const -nan:0x7a4437)
   (f64.const 1797693134862315708145274e284)
   (i32.const -93)
   (v128.const i32x4 0x00000000 0xc2700000 0xb4395810 0x3fbe76c8)
  )
  (call $8
   (f64.const 39)
   (f32.const 1048576)
   (i64.const -32768)
   (i32.const -2677395)
   (f32.const -0.765999972820282)
   (f64.const -3402823466385288598117041e14)
   (i32.const -127)
   (v128.const i32x4 0xffffffb8 0xffffffff 0x00000000 0xc3c00000)
  )
  (call $8
   (f64.const 1797693134862315708145274e284)
   (f32.const 65475)
   (i64.const 1099511627776)
   (i32.const 104929060)
   (f32.const -nan:0x7fffd5)
   (f64.const 43)
   (i32.const 65534)
   (v128.const i32x4 0x0054ff0e 0x01dbc901 0x163fb001 0xff5addd2)
  )
 )
 (func $18
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f64)
  (local $26 f64)
  (local $27 f64)
  (local $28 f64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 f64)
  (local $33 f64)
  (local $34 f64)
  (local $35 f64)
  (local $36 f64)
  (local $37 f64)
  (local $38 f64)
  (local $39 f64)
  (local $40 f64)
  (local $41 f64)
  (local $42 f64)
  (local $43 f64)
  (local $44 f64)
  (local $45 f64)
  (local $46 f64)
  (local $47 f64)
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
  (local $60 i32)
  (local $61 i32)
  (local $62 i32)
  (local $63 i32)
  (local $64 i32)
  (local $65 i32)
  (local $66 i32)
  (local $67 i32)
  (local $68 i32)
  (local $69 i32)
  (local $70 i32)
  (local $71 i32)
  (local $72 f32)
  (local $73 f32)
  (local $74 f32)
  (local $75 f32)
  (local $76 f32)
  (local $77 f32)
  (local $78 f32)
  (local $79 f32)
  (local $80 f32)
  (local $81 f32)
  (local $82 f32)
  (local $83 f32)
  (local $scratch (tuple f64 f64 i32 f32))
  (local $scratch_85 i32)
  (local $scratch_86 f64)
  (local $scratch_87 f64)
  (local $scratch_88 (tuple f64 f64 i32 f32))
  (local $scratch_89 i32)
  (local $scratch_90 f64)
  (local $scratch_91 f64)
  (local $scratch_92 (tuple f64 f64 i32 f32))
  (local $scratch_93 i32)
  (local $scratch_94 f64)
  (local $scratch_95 f64)
  (local $scratch_96 (tuple f64 f64 i32 f32))
  (local $scratch_97 i32)
  (local $scratch_98 f64)
  (local $scratch_99 f64)
  (local $scratch_100 (tuple f64 f64 i32 f32))
  (local $scratch_101 i32)
  (local $scratch_102 f64)
  (local $scratch_103 f64)
  (local $scratch_104 (tuple f64 f64 i32 f32))
  (local $scratch_105 i32)
  (local $scratch_106 f64)
  (local $scratch_107 f64)
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
  (local.set $27
   (local.tee $24
    (block (result f64)
     (local.set $scratch_87
      (tuple.extract 4 0
       (local.tee $scratch
        (call $1
         (f32.const -nan:0x7ffff6)
         (f32.const -3.084835771005601e-05)
        )
       )
      )
     )
     (local.set $25
      (block (result f64)
       (local.set $scratch_86
        (tuple.extract 4 1
         (local.get $scratch)
        )
       )
       (local.set $60
        (block (result i32)
         (local.set $scratch_85
          (tuple.extract 4 2
           (local.get $scratch)
          )
         )
         (local.set $78
          (tuple.extract 4 3
           (local.get $scratch)
          )
         )
         (local.get $scratch_85)
        )
       )
       (local.get $scratch_86)
      )
     )
     (local.get $scratch_87)
    )
   )
  )
  (local.set $26
   (local.get $25)
  )
  (local.set $61
   (local.get $60)
  )
  (local.set $72
   (local.get $78)
  )
  (local.set $48
   (local.get $61)
  )
  (local.set $1
   (local.get $26)
  )
  (local.set $3
   (local.tee $0
    (local.get $27)
   )
  )
  (local.set $2
   (local.get $1)
  )
  (local.set $49
   (local.get $48)
  )
  (local.set $31
   (local.tee $28
    (block (result f64)
     (local.set $scratch_91
      (tuple.extract 4 0
       (local.tee $scratch_88
        (call $1
         (f32.const 2147483648)
         (f32.const 8589934592)
        )
       )
      )
     )
     (local.set $29
      (block (result f64)
       (local.set $scratch_90
        (tuple.extract 4 1
         (local.get $scratch_88)
        )
       )
       (local.set $62
        (block (result i32)
         (local.set $scratch_89
          (tuple.extract 4 2
           (local.get $scratch_88)
          )
         )
         (local.set $79
          (tuple.extract 4 3
           (local.get $scratch_88)
          )
         )
         (local.get $scratch_89)
        )
       )
       (local.get $scratch_90)
      )
     )
     (local.get $scratch_91)
    )
   )
  )
  (local.set $30
   (local.get $29)
  )
  (local.set $63
   (local.get $62)
  )
  (local.set $73
   (local.get $79)
  )
  (local.set $50
   (local.get $63)
  )
  (local.set $5
   (local.get $30)
  )
  (local.set $7
   (local.tee $4
    (local.get $31)
   )
  )
  (local.set $6
   (local.get $5)
  )
  (local.set $51
   (local.get $50)
  )
  (local.set $35
   (local.tee $32
    (block (result f64)
     (local.set $scratch_95
      (tuple.extract 4 0
       (local.tee $scratch_92
        (call $1
         (f32.const 562949953421312)
         (f32.const -nan:0x7fffa3)
        )
       )
      )
     )
     (local.set $33
      (block (result f64)
       (local.set $scratch_94
        (tuple.extract 4 1
         (local.get $scratch_92)
        )
       )
       (local.set $64
        (block (result i32)
         (local.set $scratch_93
          (tuple.extract 4 2
           (local.get $scratch_92)
          )
         )
         (local.set $80
          (tuple.extract 4 3
           (local.get $scratch_92)
          )
         )
         (local.get $scratch_93)
        )
       )
       (local.get $scratch_94)
      )
     )
     (local.get $scratch_95)
    )
   )
  )
  (local.set $34
   (local.get $33)
  )
  (local.set $65
   (local.get $64)
  )
  (local.set $74
   (local.get $80)
  )
  (local.set $52
   (local.get $65)
  )
  (local.set $9
   (local.get $34)
  )
  (local.set $11
   (local.tee $8
    (local.get $35)
   )
  )
  (local.set $10
   (local.get $9)
  )
  (local.set $53
   (local.get $52)
  )
  (local.set $39
   (local.tee $36
    (block (result f64)
     (local.set $scratch_99
      (tuple.extract 4 0
       (local.tee $scratch_96
        (call $1
         (f32.const 0.8679999709129333)
         (f32.const -9223372036854775808)
        )
       )
      )
     )
     (local.set $37
      (block (result f64)
       (local.set $scratch_98
        (tuple.extract 4 1
         (local.get $scratch_96)
        )
       )
       (local.set $66
        (block (result i32)
         (local.set $scratch_97
          (tuple.extract 4 2
           (local.get $scratch_96)
          )
         )
         (local.set $81
          (tuple.extract 4 3
           (local.get $scratch_96)
          )
         )
         (local.get $scratch_97)
        )
       )
       (local.get $scratch_98)
      )
     )
     (local.get $scratch_99)
    )
   )
  )
  (local.set $38
   (local.get $37)
  )
  (local.set $67
   (local.get $66)
  )
  (local.set $75
   (local.get $81)
  )
  (local.set $54
   (local.get $67)
  )
  (local.set $13
   (local.get $38)
  )
  (local.set $15
   (local.tee $12
    (local.get $39)
   )
  )
  (local.set $14
   (local.get $13)
  )
  (local.set $55
   (local.get $54)
  )
  (local.set $43
   (local.tee $40
    (block (result f64)
     (local.set $scratch_103
      (tuple.extract 4 0
       (local.tee $scratch_100
        (call $1
         (f32.const -nan:0x7fae6a)
         (f32.const 9223372036854775808)
        )
       )
      )
     )
     (local.set $41
      (block (result f64)
       (local.set $scratch_102
        (tuple.extract 4 1
         (local.get $scratch_100)
        )
       )
       (local.set $68
        (block (result i32)
         (local.set $scratch_101
          (tuple.extract 4 2
           (local.get $scratch_100)
          )
         )
         (local.set $82
          (tuple.extract 4 3
           (local.get $scratch_100)
          )
         )
         (local.get $scratch_101)
        )
       )
       (local.get $scratch_102)
      )
     )
     (local.get $scratch_103)
    )
   )
  )
  (local.set $42
   (local.get $41)
  )
  (local.set $69
   (local.get $68)
  )
  (local.set $76
   (local.get $82)
  )
  (local.set $56
   (local.get $69)
  )
  (local.set $17
   (local.get $42)
  )
  (local.set $19
   (local.tee $16
    (local.get $43)
   )
  )
  (local.set $18
   (local.get $17)
  )
  (local.set $57
   (local.get $56)
  )
  (local.set $47
   (local.tee $44
    (block (result f64)
     (local.set $scratch_107
      (tuple.extract 4 0
       (local.tee $scratch_104
        (call $1
         (f32.const -131071.765625)
         (f32.const -9223372036854775808)
        )
       )
      )
     )
     (local.set $45
      (block (result f64)
       (local.set $scratch_106
        (tuple.extract 4 1
         (local.get $scratch_104)
        )
       )
       (local.set $70
        (block (result i32)
         (local.set $scratch_105
          (tuple.extract 4 2
           (local.get $scratch_104)
          )
         )
         (local.set $83
          (tuple.extract 4 3
           (local.get $scratch_104)
          )
         )
         (local.get $scratch_105)
        )
       )
       (local.get $scratch_106)
      )
     )
     (local.get $scratch_107)
    )
   )
  )
  (local.set $46
   (local.get $45)
  )
  (local.set $71
   (local.get $70)
  )
  (local.set $77
   (local.get $83)
  )
  (local.set $58
   (local.get $71)
  )
  (local.set $21
   (local.get $46)
  )
  (local.set $23
   (local.tee $20
    (local.get $47)
   )
  )
  (local.set $22
   (local.get $21)
  )
  (local.set $59
   (local.get $58)
  )
 )
 (func $19
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
    (f32.const 4294935040)
   )
  )
  (drop
   (call $0
    (f32.const -4096.80908203125)
   )
  )
  (drop
   (call $0
    (f32.const -89)
   )
  )
  (drop
   (call $0
    (f32.const 9223372036854775808)
   )
  )
  (drop
   (call $0
    (f32.const 72)
   )
  )
  (drop
   (call $0
    (f32.const -0.4570000171661377)
   )
  )
 )
 (func $20
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
   (call $2
    (i32.const 262144)
   )
  )
  (drop
   (call $2
    (i32.const -5262)
   )
  )
  (drop
   (call $2
    (i32.const -128)
   )
  )
  (drop
   (call $2
    (i32.const 4096)
   )
  )
 )
 (func $21
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
   (call $7)
  )
 )
 (func $22
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
   (call $23
    (f64.const -1973329565837994270048539e282)
   )
  )
 )
 (func $23 (param $0 f64) (result f64)
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
  (call $11)
 )
 (func $24
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
  (call $25)
 )
 (func $25
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  (local $11 v128)
  (local $12 stringref)
  (local $13 exnref)
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
  (drop
   (f64.load offset=22 align=1
    (i32.and
     (memory.atomic.notify offset=22
      (i32.and
       (i16x8.extract_lane_s 0
        (v128.const i32x4 0x62001e82 0x4100061a 0x01f21100 0x19bf9a00)
       )
       (i32.const 15)
      )
      (i32.const -256)
     )
     (i32.const 15)
    )
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
  (call $fimport$0
   (local.get $0)
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
   (br $label)
  )
  (unreachable)
 )
 (func $26
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
  (call $10)
 )
 (func $27
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
   (call $11)
  )
 )
 (func $28
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
   (call $3
    (f32.const -722)
    (v128.const i32x4 0x80000001 0x7fffffff 0xfff80000 0xfffffffd)
    (i64.const -549755813889)
    (i64.const -26546)
    (v128.const i32x4 0xf2013500 0x7f01ff2d 0x9f670032 0xffbc6f31)
   )
  )
  (drop
   (call $3
    (f32.const 2147483648)
    (v128.const i32x4 0x3e1cac08 0xffffff8c 0xffffffcc 0xc2380000)
    (i64.const -28)
    (i64.const 1431310930)
    (v128.const i32x4 0xff7fffff 0xffffff95 0xff917fff 0xff010001)
   )
  )
  (drop
   (call $3
    (f32.const -nan:0x7fffdf)
    (v128.const i32x4 0xffff852a 0x00000001 0x00003345 0xfffffff0)
    (i64.const -256)
    (i64.const 65535)
    (v128.const i32x4 0xffffffe6 0x00000000 0x00005437 0x00000000)
   )
  )
 )
 (func $29 (param $0 f32) (param $1 v128) (param $2 i64) (param $3 i64) (param $4 v128) (result f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f64)
  (local $9 f64)
  (local $10 f32)
  (local $11 stringref)
  (local $12 exnref)
  (local $scratch (tuple f32 externref i32 exnref f64 i32))
  (local $scratch_14 f64)
  (local $scratch_15 exnref)
  (local $scratch_16 i32)
  (local $scratch_17 externref)
  (local $scratch_18 f32)
  (local.set $0
   (f32.const 0)
  )
  (local.set $2
   (i64.const 0)
  )
  (block $block (result f32)
   (table.set $1
    (i32.const 4)
    (block $block1 (result exnref)
     (call $fimport$0
      (f64.const 0)
     )
     (local.set $10
      (block (result f32)
       (local.set $scratch_18
        (tuple.extract 6 0
         (local.tee $scratch
          (try_table (type $1) (result f32 externref i32 exnref f64 i32) (catch $tag$0 $block) (catch $tag$0 $block) (catch_all_ref $block1)
           (if
            (i64.eqz
             (i64x2.extract_lane 1
              (f64x2.splat
               (local.get $8)
              )
             )
            )
            (then
             (call $fimport$2
              (local.get $2)
             )
            )
           )
           (if (type $1) (result f32 externref i32 exnref f64 i32)
            (i32.lt_s
             (if (result i32)
              (local.get $5)
              (then
               (call $fimport$0
                (f64.const 204)
               )
               (return
                (f32.const -18)
               )
              )
              (else
               (call $fimport$5
                (i32.const -131072)
               )
               (i32.const 2147483647)
              )
             )
             (i32.const 3)
            )
            (then
             (tuple.make 6
              (f32.const -2147483648)
              (ref.null noextern)
              (i32.const -1)
              (ref.null noexn)
              (f64.const -23249)
              (i32.const -2007603107)
             )
            )
            (else
             (table.set $1
              (i32.const 2)
              (ref.null noexn)
             )
             (call $fimport$2
              (local.get $2)
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
              (call $fimport$1
               (local.get $0)
              )
              (br $label)
             )
             (unreachable)
            )
           )
          )
         )
        )
       )
       (local.set $11
        (block (result externref)
         (local.set $scratch_17
          (tuple.extract 6 1
           (local.get $scratch)
          )
         )
         (local.set $6
          (block (result i32)
           (local.set $scratch_16
            (tuple.extract 6 2
             (local.get $scratch)
            )
           )
           (local.set $12
            (block (result exnref)
             (local.set $scratch_15
              (tuple.extract 6 3
               (local.get $scratch)
              )
             )
             (local.set $9
              (block (result f64)
               (local.set $scratch_14
                (tuple.extract 6 4
                 (local.get $scratch)
                )
               )
               (local.set $7
                (tuple.extract 6 5
                 (local.get $scratch)
                )
               )
               (local.get $scratch_14)
              )
             )
             (local.get $scratch_15)
            )
           )
           (local.get $scratch_16)
          )
         )
         (local.get $scratch_17)
        )
       )
       (local.get $scratch_18)
      )
     )
     (local.get $12)
    )
   )
   (f32.const -nan:0x7fb053)
  )
 )
)

