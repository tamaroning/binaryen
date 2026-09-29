(module
 (rec
  (type $0 (sub (func (result v128))))
  (type $1 (sub $0 (func (result v128))))
 )
 (type $2 (func))
 (type $3 (array i8))
 (type $4 (struct))
 (type $5 (array (mut i16)))
 (type $6 (func (param i32)))
 (type $7 (func (param externref)))
 (type $8 (func (param f64)))
 (type $9 (func (param funcref)))
 (type $10 (func (param funcref arrayref (ref string)) (result v128)))
 (type $11 (func (result v128 i32 (ref (exact $3)) (ref nofunc))))
 (type $12 (func (result i64 i64)))
 (type $13 (func (param f32 v128 (ref null $1) f32 v128)))
 (type $14 (func (param i64)))
 (type $15 (func (param f32)))
 (type $16 (func (param v128)))
 (type $17 (func (param anyref)))
 (type $18 (func (result structref)))
 (type $19 (func (param i32 f32) (result (ref eq))))
 (type $20 (func (param (ref null $0) (ref $1)) (result f64)))
 (type $21 (func (param (ref $0) arrayref (ref $1) (ref null $1) (ref $0) f32) (result i31ref)))
 (type $22 (func (param i64 (ref eq)) (result (ref $1))))
 (type $23 (func (param i64 (ref $0) i31ref (ref null $0) (ref $1) f32) (result f32 i64)))
 (type $24 (func (param (ref $0) (ref null $0) (ref $1)) (result i64 i64)))
 (type $25 (func (result (ref string))))
 (type $26 (func (param eqref v128)))
 (type $27 (func (param (ref $0) (ref $1) (ref $1)) (result (ref null $1))))
 (type $28 (func (param (ref null $0) f64 (ref string) (ref eq) (ref null $0) (ref $1) (ref struct)) (result i32)))
 (type $29 (func (param f32 (ref $1)) (result f32)))
 (type $30 (func (param (ref null $1)) (result f64 anyref i32 v128 i32 f32)))
 (type $31 (func (result f32 i64)))
 (type $32 (func (result f64 anyref i32 v128 i32 f32)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_6" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $6) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $6) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $14) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $15) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $8) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $16) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $17) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $9) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $7) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $6) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $7) (param externref)))
 (global $global$0 (ref $1) (ref.func $0))
 (global $global$1 (mut anyref) (ref.null none))
 (global $global$2 stringref (string.const "\c2\a3\c2\a3923"))
 (global $global$3 f32 (f32.const 4294967296))
 (global $global$4 i32 (i32.const -69))
 (global $global$5 (ref null $0) (ref.null nofunc))
 (global $global$6 i64 (i64.const 1099511627776))
 (global $global$7 (ref null $0) (ref.func $0))
 (global $global$8 funcref (ref.func $0))
 (global $global$9 f64 (f64.const -nan:0xfffffffffff92))
 (global $global$10 externref (string.const "942\e2\82\ac\c2\a3"))
 (global $global$11 (mut i32) (i32.const 100))
 (memory $0 16 16 shared)
 (data $0 "Fb\e5y\aer\df\1b\0e\ee9,k\ec\fd\bc|\c1\d74!")
 (data $1 (i32.const 0) "\d1*")
 (data $2 (i32.const 2) "\e1a\9f\0b[\f7$\df\famM\d8`?{\fd\b2<")
 (table $0 i64 17 17 funcref)
 (table $1 4 exnref)
 (elem $0 (table $0) (i64.const 0) func $2 $2 $6 $6 $6 $10 $13 $19 $24 $26 $26 $26 $28 $28 $34 $44 $44)
 (elem declare func $0 $14 $35 $36 $4 $7 $9 $fimport$7)
 (tag $tag$0 (type $13) (param f32 v128 (ref null $1) f32 v128))
 (tag $tag$1 (type $8) (param f64))
 (export "global$" (global $global$0))
 (export "global$_1" (global $global$1))
 (export "tag$_1" (tag $tag$1))
 (export "jstag" (tag $eimport$1))
 (export "ref_func_target_invoker" (func $1))
 (export "func" (func $2))
 (export "func_12" (func $3))
 (export "func_13" (func $4))
 (export "func_13_invoker" (func $5))
 (export "func_16" (func $7))
 (export "func_16_invoker" (func $8))
 (export "func_19_invoker" (func $11))
 (export "func_23_invoker" (func $15))
 (export "func_25_invoker" (func $17))
 (export "func_27" (func $18))
 (export "func_28_invoker" (func $20))
 (export "func_33" (func $24))
 (export "func_33_invoker" (func $25))
 (export "func_35_invoker" (func $27))
 (export "func_37" (func $28))
 (export "func_37_invoker" (func $29))
 (export "func_39_invoker" (func $31))
 (export "func_43_invoker" (func $35))
 (export "func_45" (func $36))
 (export "func_45_invoker" (func $37))
 (export "func_47_invoker" (func $39))
 (export "func_49_invoker" (func $41))
 (export "func_51_invoker" (func $43))
 (export "func_53" (func $44))
 (start $25)
 (func $0 (type $1) (result v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $0)
  )
  (drop
   (call $0)
  )
 )
 (func $2 (type $18) (result structref)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (return
    (struct.new_default $4)
   )
  )
  (unreachable)
 )
 (func $3 (type $19) (param $0 i32) (param $1 f32) (result (ref eq))
  (local $2 (ref $0))
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (array.new_fixed $3 0)
 )
 (@binaryen.js.called)
 (func $4 (type $0) (result v128)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f64)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 v128)
  (local $9 v128)
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 (ref any))
  (local $13 (ref array))
  (local $14 (ref null $1))
  (local $15 (ref $5))
  (local $16 (ref i31))
  (local $scratch (tuple v128 i32 (ref (exact $3)) (ref nofunc)))
  (local $scratch_18 (ref (exact $3)))
  (local $scratch_19 i32)
  (local $scratch_20 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (local.set $10
   (string.const "\ed\a0\80")
  )
  (block $block
   (call $fimport$2
    (i64.const 9223372036854775807)
   )
   (br_table $block $block $block $block $block $block $block $block $block $block
    (select
     (loop $label2 (result i32)
      (if
       (i32.eqz
        (global.get $global$11)
       )
       (then
        (global.set $global$11
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$11
       (i32.sub
        (global.get $global$11)
        (i32.const 1)
       )
      )
      (call $fimport$6
       (if (result (ref any))
        (try (result i32)
         (do
          (drop
           (i32.extend16_s
            (local.tee $1
             (local.tee $0
              (i64.eqz
               (i64.const -91)
              )
             )
            )
           )
          )
          (block
           (loop $label1
            (if
             (i32.eqz
              (global.get $global$11)
             )
             (then
              (global.set $global$11
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$11
             (i32.sub
              (global.get $global$11)
              (i32.const 1)
             )
            )
            (block
             (call $fimport$5
              (block (result v128)
               (local.set $scratch_20
                (tuple.extract 4 0
                 (local.tee $scratch
                  (loop $label (type $11) (result v128 i32 (ref (exact $3)) (ref nofunc))
                   (if
                    (i32.eqz
                     (global.get $global$11)
                    )
                    (then
                     (global.set $global$11
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$11
                    (i32.sub
                     (global.get $global$11)
                     (i32.const 1)
                    )
                   )
                   (nop)
                   (br_if $label
                    (local.get $1)
                   )
                   (tuple.make 4
                    (v128.const i32x4 0xffffff8d 0xffffff8e 0x00009753 0xffffff81)
                    (i32.const -90)
                    (array.new_fixed $3 0)
                    (ref.as_non_null
                     (ref.null nofunc)
                    )
                   )
                  )
                 )
                )
               )
               (drop
                (block (result i32)
                 (local.set $scratch_19
                  (tuple.extract 4 1
                   (local.get $scratch)
                  )
                 )
                 (drop
                  (block (result (ref (exact $3)))
                   (local.set $scratch_18
                    (tuple.extract 4 2
                     (local.get $scratch)
                    )
                   )
                   (drop
                    (tuple.extract 4 3
                     (local.get $scratch)
                    )
                   )
                   (local.get $scratch_18)
                  )
                 )
                 (local.get $scratch_19)
                )
               )
               (local.get $scratch_20)
              )
             )
             (block
              (nop)
              (call $fimport$7
               (ref.func $4)
              )
             )
            )
            (drop
             (br_on_null $label1
              (ref.null none)
             )
            )
            (br_if $label1
             (i32.load offset=22 align=2
              (i32.and
               (local.get $1)
               (i32.const 15)
              )
             )
            )
            (nop)
           )
           (return
            (v128.const i32x4 0x00000000 0xc3600000 0xfff28106 0x420fffff)
           )
          )
          (unreachable)
         )
         (catch $tag$1
          (local.set $3 (f64.mul (pop f64) (f64.const -1)))
          (i32.const 2147483647)
         )
        )
        (then
         (local.tee $12
          (ref.i31
           (i32.const -255)
          )
         )
        )
        (else
         (nop)
         (br $label2)
        )
       )
      )
      (br_if $label2
       (block (result i32)
        (local.get $0)
       )
      )
      (i31.get_u
       (try_table (result (ref none)) (catch_all $label2)
        (if (result (ref none))
         (i32.eqz
          (i32.const 2147483647)
         )
         (then
          (block
           (nop)
           (call $fimport$3
            (try (result f32)
             (do
              (local.tee $4
               (f32.convert_i64_u
                (i64.atomic.load32_u acqrel offset=22
                 (i32.load8_u offset=3
                  (i32.and
                   (local.get $1)
                   (i32.const 15)
                  )
                 )
                )
               )
              )
             )
             (catch_all
              (if (result f32)
               (i32.eqz
                (local.get $0)
               )
               (then
                (local.get $4)
               )
               (else
                (call $fimport$8
                 (ref.as_non_null
                  (ref.null noextern)
                 )
                )
                (nop)
                (return
                 (v128.const i32x4 0xfe9009ff 0x013cffff 0x0000499a 0x97010057)
                )
               )
              )
             )
            )
           )
          )
          (br $label2)
         )
         (else
          (ref.cast (ref none)
           (try_table (result (ref (exact $4))) (catch_all $label2)
            (struct.new_default $4)
           )
          )
         )
        )
       )
      )
     )
     (string.measure_wtf16
      (local.get $10)
     )
     (i32.const 32768)
    )
   )
  )
  (return
   (v128.const i32x4 0xffffff01 0xffffffff 0x0000007f 0x00000000)
  )
 )
 (func $5 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
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
 (func $6 (type $20) (param $0 (ref null $0)) (param $1 (ref $1)) (result f64)
  (local $2 (ref array))
  (local $3 (ref null $1))
  (local $4 (ref null $0))
  (local $5 i64)
  (local $6 i64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f32)
  (local $11 f32)
  (local $12 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (f64x2.extract_lane 1
   (v128.const i32x4 0xffffff81 0xffe00000 0x00002204 0xffffe876)
  )
 )
 (func $7 (type $0) (result v128)
  (local $0 (ref struct))
  (local $1 (ref null $1))
  (local $2 exnref)
  (local $3 i64)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 v128)
  (local $10 v128)
  (local $11 v128)
  (local $12 f64)
  (local $13 f64)
  (local $scratch (ref exn))
  (local $scratch_15 f32)
  (local $scratch_16 (tuple f32 v128 (ref null $1) f32 v128))
  (local $scratch_17 f32)
  (local $scratch_18 (ref null $1))
  (local $scratch_19 v128)
  (local $scratch_20 f32)
  (local $21 (tuple f32 v128 (ref null $1) f32 v128))
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block $block1 (result v128)
   (call $fimport$1
    (local.tee $8
     (i32.const 262145)
    )
   )
   (br_if $block1
    (if (result v128)
     (i32.eqz
      (local.get $8)
     )
     (then
      (nop)
      (local.set $7
       (block (result f32)
        (local.set $scratch_15
         (f32.const -nan:0x7fe92e)
        )
        (local.set $2
         (block (result (ref exn))
          (local.set $scratch
           (block $block (result (ref exn))
            (try_table (catch_all_ref $block)
             (throw $tag$1
              (f64.load offset=22
               (i32.and
                (try (result i32)
                 (do
                  (local.get $8)
                 )
                 (catch $tag$1
                  (throw $tag$1 (pop f64))
                  (i32.const 39)
                 )
                )
                (i32.const 15)
               )
              )
             )
            )
            (unreachable)
           )
          )
          (local.set $11
           (v128.const i32x4 0x00002913 0x00000000 0xffa27f32 0xffffffff)
          )
          (local.get $scratch)
         )
        )
        (local.get $scratch_15)
       )
      )
      (local.get $11)
     )
     (else
      (call $fimport$6
       (struct.new_default $4)
      )
      (nop)
      (return
       (v128.const i32x4 0x02019b5c 0x00002671 0xffcfffa7 0x0030fff2)
      )
     )
    )
    (i32.eqz
     (try (result i32)
      (do
       (local.get $8)
      )
      (catch $tag$0
       (local.set $21 (pop (tuple f32 v128 (ref null $1) f32 v128)))
       (block (result i32)
        (local.set $5
         (block (result f32)
          (local.set $scratch_20
           (tuple.extract 5 0
            (local.tee $scratch_16
             (local.get $21)
            )
           )
          )
          (local.set $9
           (block (result v128)
            (local.set $scratch_19
             (tuple.extract 5 1
              (local.get $scratch_16)
             )
            )
            (local.set $1
             (block (result (ref null $1))
              (local.set $scratch_18
               (tuple.extract 5 2
                (local.get $scratch_16)
               )
              )
              (local.set $6
               (block (result f32)
                (local.set $scratch_17
                 (tuple.extract 5 3
                  (local.get $scratch_16)
                 )
                )
                (local.set $10
                 (tuple.extract 5 4
                  (local.get $scratch_16)
                 )
                )
                (local.get $scratch_17)
               )
              )
              (local.get $scratch_18)
             )
            )
            (local.get $scratch_19)
           )
          )
          (local.get $scratch_20)
         )
        )
        (local.get $8)
       )
      )
      (catch $tag$1
       (drop (pop f64))
       (i32.wrap_i64
        (i64.rem_s
         (i64.trunc_sat_f64_u
          (f64.load offset=3 align=4
           (i32.and
            (loop $label (result i32)
             (if
              (i32.eqz
               (global.get $global$11)
              )
              (then
               (global.set $global$11
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$11
              (i32.sub
               (global.get $global$11)
               (i32.const 1)
              )
             )
             (nop)
             (br_if $label
              (i32.eqz
               (i32.atomic.load acqrel offset=3
                (local.get $8)
               )
              )
             )
             (local.get $8)
            )
            (i32.const 15)
           )
          )
         )
         (i64.const 86)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $8 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $7)
  )
 )
 (@binaryen.js.called)
 (func $9 (type $0) (result v128)
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 v128)
  (local $9 v128)
  (local $10 v128)
  (local $11 i64)
  (local $12 (ref null $1))
  (local $13 i31ref)
  (local $14 (ref extern))
  (local $15 (ref string))
  (local $scratch (tuple f32 v128 (ref null $1) f32 v128))
  (local $scratch_17 f32)
  (local $scratch_18 (ref null $1))
  (local $scratch_19 v128)
  (local $scratch_20 f32)
  (local $21 (tuple f32 v128 (ref null $1) f32 v128))
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (result v128)
   (call $fimport$8
    (loop $label6 (result (ref extern))
     (if
      (i32.eqz
       (global.get $global$11)
      )
      (then
       (global.set $global$11
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$11
      (i32.sub
       (global.get $global$11)
       (i32.const 1)
      )
     )
     (block (result (ref extern))
      (block $block3
       (drop
        (br_on_null $block3
         (loop $label4 (result (ref (exact $3)))
          (if
           (i32.eqz
            (global.get $global$11)
           )
           (then
            (global.set $global$11
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$11
           (i32.sub
            (global.get $global$11)
            (i32.const 1)
           )
          )
          (block
           (call $fimport$5
            (loop (result v128)
             (if
              (i32.eqz
               (global.get $global$11)
              )
              (then
               (global.set $global$11
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$11
              (i32.sub
               (global.get $global$11)
               (i32.const 1)
              )
             )
             (v128.const i32x4 0xffffffa5 0xffffffff 0xffae1b3d 0xffffffff)
            )
           )
           (drop
            (loop $label1 (result (ref string))
             (if
              (i32.eqz
               (global.get $global$11)
              )
              (then
               (global.set $global$11
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$11
              (i32.sub
               (global.get $global$11)
               (i32.const 1)
              )
             )
             (block $block
              (loop $label
               (if
                (i32.eqz
                 (global.get $global$11)
                )
                (then
                 (global.set $global$11
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$11
                (i32.sub
                 (global.get $global$11)
                 (i32.const 1)
                )
               )
               (block
                (call $fimport$3
                 (f32.convert_i64_u
                  (i64.const -1167)
                 )
                )
                (loop
                 (if
                  (i32.eqz
                   (global.get $global$11)
                  )
                  (then
                   (global.set $global$11
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$11
                  (i32.sub
                   (global.get $global$11)
                   (i32.const 1)
                  )
                 )
                 (if
                  (i32.eqz
                   (local.get $4)
                  )
                  (then
                   (nop)
                  )
                 )
                )
               )
               (br_if $label
                (try (result i32)
                 (do
                  (local.get $4)
                 )
                 (catch $tag$1
                  (local.set $1 (f64.min (pop f64) (f64.const 22)))
                  (ref.eq
                   (ref.null none)
                   (ref.i31
                    (i32.const 1014042121)
                   )
                  )
                 )
                 (catch $tag$0
                  (local.set $21 (pop (tuple f32 v128 (ref null $1) f32 v128)))
                  (block (result i32)
                   (local.set $5
                    (block (result f32)
                     (local.set $scratch_20
                      (tuple.extract 5 0
                       (local.tee $scratch
                        (local.get $21)
                       )
                      )
                     )
                     (local.set $8
                      (block (result v128)
                       (local.set $scratch_19
                        (tuple.extract 5 1
                         (local.get $scratch)
                        )
                       )
                       (local.set $12
                        (block (result (ref null $1))
                         (local.set $scratch_18
                          (tuple.extract 5 2
                           (local.get $scratch)
                          )
                         )
                         (local.set $6
                          (block (result f32)
                           (local.set $scratch_17
                            (tuple.extract 5 3
                             (local.get $scratch)
                            )
                           )
                           (local.set $9
                            (tuple.extract 5 4
                             (local.get $scratch)
                            )
                           )
                           (local.get $scratch_17)
                          )
                         )
                         (local.get $scratch_18)
                        )
                       )
                       (local.get $scratch_19)
                      )
                     )
                     (local.get $scratch_20)
                    )
                   )
                   (if (result i32)
                    (i32.eqz
                     (i32.and
                      (try (result i32)
                       (do
                        (i32.const 32)
                       )
                       (catch_all
                        (drop
                         (ref.func $0)
                        )
                        (local.get $4)
                       )
                      )
                      (i32.const 15)
                     )
                    )
                    (then
                     (i32.const 144)
                    )
                    (else
                     (local.get $4)
                    )
                   )
                  )
                 )
                )
               )
               (drop
                (br_on_null $block
                 (string.const "")
                )
               )
              )
              (call $fimport$7
               (ref.func $9)
              )
             )
             (br_if $label1
              (i32.const -110)
             )
             (loop $label3 (result (ref string))
              (if
               (i32.eqz
                (global.get $global$11)
               )
               (then
                (global.set $global$11
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$11
               (i32.sub
                (global.get $global$11)
                (i32.const 1)
               )
              )
              (if
               (ref.eq
                (local.get $13)
                (struct.new_default $4)
               )
               (then
                (block $block2
                 (loop
                  (if
                   (i32.eqz
                    (global.get $global$11)
                   )
                   (then
                    (global.set $global$11
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$11
                   (i32.sub
                    (global.get $global$11)
                    (i32.const 1)
                   )
                  )
                  (br_if $block2
                   (local.tee $4
                    (loop (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$11)
                      )
                      (then
                       (global.set $global$11
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$11
                      (i32.sub
                       (global.get $global$11)
                       (i32.const 1)
                      )
                     )
                     (block $block1 (result i32)
                      (call $fimport$3
                       (f32.const -nan:0x7ffff1)
                      )
                      (br_if $block1
                       (local.get $4)
                       (i32.eqz
                        (loop $label2 (result i32)
                         (if
                          (i32.eqz
                           (global.get $global$11)
                          )
                          (then
                           (global.set $global$11
                            (i32.const 100)
                           )
                           (unreachable)
                          )
                         )
                         (global.set $global$11
                          (i32.sub
                           (global.get $global$11)
                           (i32.const 1)
                          )
                         )
                         (block
                          (atomic.fence acqrel)
                          (call $fimport$1
                           (local.get $4)
                          )
                         )
                         (br_if $label2
                          (i32.eqz
                           (loop (result i32)
                            (if
                             (i32.eqz
                              (global.get $global$11)
                             )
                             (then
                              (global.set $global$11
                               (i32.const 100)
                              )
                              (unreachable)
                             )
                            )
                            (global.set $global$11
                             (i32.sub
                              (global.get $global$11)
                              (i32.const 1)
                             )
                            )
                            (block (result i32)
                             (call $fimport$1
                              (f32.ge
                               (f32.const -2305843009213693952)
                               (f32.const -nan:0x7fffda)
                              )
                             )
                             (ref.eq
                              (ref.null none)
                              (block (result (ref i31))
                               (ref.i31
                                (i32.const 32767)
                               )
                              )
                             )
                            )
                           )
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
                 (nop)
                )
               )
              )
              (br_if $label3
               (try_table (result i32) (catch_all $block3)
                (local.get $4)
               )
              )
              (string.const "\ed\a0\80\ed\a0\80\ed\a0\80")
             )
            )
           )
           (block
            (nop)
            (br $label4)
           )
           (unreachable)
          )
          (unreachable)
         )
        )
       )
       (nop)
       (try_table (catch_all $block3)
        (br_if $label6
         (loop (result i32)
          (if
           (i32.eqz
            (global.get $global$11)
           )
           (then
            (global.set $global$11
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$11
           (i32.sub
            (global.get $global$11)
            (i32.const 1)
           )
          )
          (block $block4
           (br_if $block4
            (i32.eqz
             (i32.const 1014042121)
            )
           )
           (loop
            (if
             (i32.eqz
              (global.get $global$11)
             )
             (then
              (global.set $global$11
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$11
             (i32.sub
              (global.get $global$11)
              (i32.const 1)
             )
            )
            (block
             (call $fimport$0
              (i32.const 65503)
             )
             (if
              (local.get $4)
              (then
               (v128.store offset=22 align=2
                (i32.and
                 (local.get $4)
                 (i32.const 15)
                )
                (v128.const i32x4 0xffffffa5 0xffffffff 0xffae1b3d 0xffffffff)
               )
              )
             )
            )
           )
          )
          (loop $label5
           (if
            (i32.eqz
             (global.get $global$11)
            )
            (then
             (global.set $global$11
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$11
            (i32.sub
             (global.get $global$11)
             (i32.const 1)
            )
           )
           (block
            (f32.store offset=4 align=1
             (f32.gt
              (f32.const 9223372036854775808)
              (f32.const -nan:0x7fd227)
             )
             (f32.convert_i64_s
              (local.tee $11
               (local.tee $11
                (try (result i64)
                 (do
                  (nop)
                  (i64.const -9223372036854775807)
                 )
                 (catch_all
                  (local.tee $11
                   (local.get $11)
                  )
                 )
                )
               )
              )
             )
            )
            (br $label5)
           )
           (unreachable)
          )
          (unreachable)
         )
        )
       )
      )
      (local.tee $14
       (global.get $gimport$0)
      )
     )
    )
   )
   (nop)
   (if (result v128)
    (i32.const 65412)
    (then
     (if
      (memory.atomic.notify offset=22
       (i32.and
        (local.get $4)
        (i32.const 15)
       )
       (loop (result i32)
        (if
         (i32.eqz
          (global.get $global$11)
         )
         (then
          (global.set $global$11
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$11
         (i32.sub
          (global.get $global$11)
          (i32.const 1)
         )
        )
        (i32.and
         (try (result i32)
          (do
           (ref.eq
            (struct.new_default $4)
            (ref.i31
             (i32.const 1024)
            )
           )
          )
          (catch_all
           (ref.test (ref (exact $1))
            (ref.func $0)
           )
          )
         )
         (i32.const 15)
        )
       )
      )
      (then
       (block $block5
        (nop)
        (call $fimport$3
         (try_table (result f32) (catch_all $block5)
          (f32.const -39)
         )
        )
       )
      )
      (else
       (nop)
       (block
        (nop)
        (nop)
       )
      )
     )
     (f64x2.replace_lane 0
      (v128.const i32x4 0xffffff93 0xffffffff 0x100e0070 0x00000000)
      (local.get $0)
     )
    )
    (else
     (call_ref $9
      (ref.null nofunc)
      (ref.func $fimport$7)
     )
     (block $block6
      (call $1)
      (loop $label7
       (if
        (i32.eqz
         (global.get $global$11)
        )
        (then
         (global.set $global$11
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$11
        (i32.sub
         (global.get $global$11)
         (i32.const 1)
        )
       )
       (block
        (drop
         (br_on_null $label7
          (ref.func $4)
         )
        )
        (memory.fill
         (string.measure_wtf16
          (local.tee $15
           (block (result (ref string))
            (call $fimport$8
             (global.get $gimport$0)
            )
            (select (result (ref string))
             (string.const "")
             (string.const "\c2\a3")
             (local.get $4)
            )
           )
          )
         )
         (ref.eq
          (ref.i31
           (i32.const -110)
          )
          (struct.new_default $4)
         )
         (f32.ge
          (f32.const -1.7392066953281216e-10)
          (f32.const -3402823466385288598117041e14)
         )
        )
        (drop
         (i32.and
          (i32.const 1)
          (i32.const 15)
         )
        )
        (if
         (i32.const 34052)
         (then
          (loop
           (if
            (i32.eqz
             (global.get $global$11)
            )
            (then
             (global.set $global$11
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$11
            (i32.sub
             (global.get $global$11)
             (i32.const 1)
            )
           )
           (block
            (if
             (i32.eqz
              (i64.le_s
               (i64.const 65420)
               (i64.const 65470)
              )
             )
             (then
              (call $fimport$0
               (i32.const -1)
              )
             )
            )
            (br_if $label7
             (i32.eqz
              (i32.const -26273)
             )
            )
           )
          )
          (br $block6)
         )
         (else
          (f64.store offset=22 align=1
           (i32.and
            (i32.const -32768)
            (i32.const 15)
           )
           (try (result f64)
            (do
             (local.get $0)
            )
            (catch $tag$1
             (local.set $3 (pop f64))
             (local.get $0)
            )
            (catch_all
             (drop
              (i64.xor
               (i64.rem_s
                (i64.const -3)
                (local.tee $11
                 (i64.const 134217729)
                )
               )
               (i64.shr_u
                (i64.const -2983405)
                (i64.const 2147483646)
               )
              )
             )
             (br $label7)
            )
           )
          )
          (br $block6)
         )
        )
        (unreachable)
       )
       (unreachable)
      )
      (unreachable)
     )
     (v128.load offset=3 align=2
      (i32.const 30765)
     )
    )
   )
  )
 )
 (func $10 (type $21) (param $0 (ref $0)) (param $1 arrayref) (param $2 (ref $1)) (param $3 (ref null $1)) (param $4 (ref $0)) (param $5 f32) (result i31ref)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 i32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f32)
  (local $15 f32)
  (local $16 f32)
  (local $17 v128)
  (local $18 v128)
  (local $19 v128)
  (local $20 exnref)
  (local $21 anyref)
  (local $22 anyref)
  (local $23 (ref null $1))
  (local $24 arrayref)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (ref.i31
     (i32.const -8192)
    )
   )
  )
  (unreachable)
 )
 (func $11 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $10
    (ref.func $4)
    (array.new_fixed $3 0)
    (ref.func $0)
    (ref.func $0)
    (ref.func $4)
    (f32.const 4287496960)
   )
  )
 )
 (func $12 (type $0) (result v128)
  (local $0 (ref null $0))
  (local $1 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (v128.const i32x4 0x00000000 0xc3a00000 0x17000000 0x41d6041b)
 )
 (func $13 (type $22) (param $0 i64) (param $1 (ref eq)) (result (ref $1))
  (local $2 f64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (ref.func $0)
 )
 (func $14 (type $1) (result v128)
  (local $0 (ref $1))
  (local $1 i32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (if (result v128)
   (i32.eqz
    (i32.eqz
     (f32.le
      (f32.const 4294945024)
      (f32.const -25)
     )
    )
   )
   (then
    (call $fimport$6
     (struct.new_default $4)
    )
    (call $fimport$7
     (ref.func $4)
    )
    (v128.const i32x4 0x03da7d7f 0x01007f68 0x00340d01 0x0000ffe6)
   )
   (else
    (loop
     (if
      (i32.eqz
       (global.get $global$11)
      )
      (then
       (global.set $global$11
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$11
      (i32.sub
       (global.get $global$11)
       (i32.const 1)
      )
     )
     (block
      (return
       (v128.const i32x4 0x0000ff90 0x00000008 0x0000d82b 0x08000000)
      )
     )
     (unreachable)
    )
    (unreachable)
   )
  )
 )
 (func $15 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $14)
  )
 )
 (func $16 (type $0) (result v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (i32.const -49)
   )
   (then
    (return
     (v128.const i32x4 0x00ff000f 0xffa76c0b 0x0000ffe7 0xfff8ffec)
    )
   )
   (else
    (atomic.fence acqrel)
    (return
     (v128.const i32x4 0x00000080 0xffff7fff 0xfffe0000 0xffb7443a)
    )
   )
  )
  (unreachable)
 )
 (func $17 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $16)
  )
  (drop
   (call $16)
  )
  (drop
   (call $16)
  )
 )
 (@binaryen.js.called)
 (func $18 (type $1) (result v128)
  (local $0 (ref $0))
  (local $1 (ref null $0))
  (local $2 (ref $1))
  (local $3 f64)
  (local $4 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (local.get $4)
 )
 (func $19 (type $23) (param $0 i64) (param $1 (ref $0)) (param $2 i31ref) (param $3 (ref null $0)) (param $4 (ref $1)) (param $5 f32) (result f32 i64)
  (local $6 (ref $0))
  (local $7 i64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (throw $tag$1
    (f64.const -12966)
   )
  )
  (unreachable)
 )
 (func $20 (type $2)
  (local $scratch (tuple f32 i64))
  (local $scratch_1 f32)
  (local $scratch_2 (tuple f32 i64))
  (local $scratch_3 f32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (block (result f32)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $19
        (i64.const -3048)
        (ref.func $4)
        (ref.i31
         (i32.const 32766)
        )
        (ref.func $4)
        (ref.func $14)
        (f32.const -nan:0x7fffd0)
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
   (block (result f32)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $19
        (i64.const -27084)
        (ref.func $9)
        (ref.null none)
        (ref.func $7)
        (ref.func $0)
        (f32.const 4294967296)
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
 (func $21 (type $0) (result v128)
  (local $0 (ref null $0))
  (local $1 arrayref)
  (local $2 i31ref)
  (local $3 stringref)
  (local $4 (ref null $1))
  (local $5 v128)
  (local $6 i64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (drop
    (i32.const 43881)
   )
   (return
    (v128.const i32x4 0xffff0000 0x0080e75f 0xffbbfffe 0xff808000)
   )
  )
  (unreachable)
 )
 (func $22 (type $0) (result v128)
  (local $0 (ref $0))
  (local $1 (ref $0))
  (local $2 exnref)
  (local $3 structref)
  (local $4 structref)
  (local $5 (ref $1))
  (local $6 (ref null $0))
  (local $7 (ref i31))
  (local $8 (ref null $1))
  (local $9 v128)
  (local $10 v128)
  (local $11 v128)
  (local $12 i32)
  (local $13 i32)
  (local $14 f32)
  (local $15 f32)
  (local $16 f32)
  (local $17 f64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$11)
    )
    (then
     (global.set $global$11
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$11
    (i32.sub
     (global.get $global$11)
     (i32.const 1)
    )
   )
   (if
    (i32.eqz
     (local.get $13)
    )
    (then
     (nop)
     (br $label)
    )
    (else
     (nop)
     (br $label)
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $23 (type $24) (param $0 (ref $0)) (param $1 (ref null $0)) (param $2 (ref $1)) (result i64 i64)
  (local $3 arrayref)
  (local $4 anyref)
  (local $5 (ref array))
  (local $6 (ref null $1))
  (local $7 (ref null $1))
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref null $0))
  (local $11 exnref)
  (local $12 funcref)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (type $12) (result i64 i64)
   (nop)
   (tuple.make 2
    (local.get $14)
    (local.get $15)
   )
  )
 )
 (func $24 (type $0) (result v128)
  (local $0 eqref)
  (local $1 (ref null $0))
  (local $2 (ref null $0))
  (local $3 arrayref)
  (local $4 (ref null $1))
  (local $5 stringref)
  (local $6 f64)
  (local $7 f32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (result v128)
   (nop)
   (loop (result v128)
    (if
     (i32.eqz
      (global.get $global$11)
     )
     (then
      (global.set $global$11
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$11
     (i32.sub
      (global.get $global$11)
      (i32.const 1)
     )
    )
    (block (result v128)
     (call $fimport$6
      (struct.new_default $4)
     )
     (i8x16.min_s
      (call $16)
      (v128.const i32x4 0xc8ffffdb 0xffc76b70 0xc2340000 0x435b0000)
     )
    )
   )
  )
 )
 (func $25 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $24)
  )
 )
 (func $26 (type $2)
  (local $0 f64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (return)
  )
  (unreachable)
 )
 (func $27 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (call $26)
 )
 (func $28 (type $0) (result v128)
  (local $0 (ref null $1))
  (local $1 (ref null $1))
  (local $2 (ref $0))
  (local $3 exnref)
  (local $4 structref)
  (local $5 (ref eq))
  (local $6 (ref $1))
  (local $7 i32)
  (local $8 i32)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 i64)
  (local $scratch i32)
  (local $scratch_14 (ref i31))
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (result v128)
   (try
    (do
     (block
      (f32.store offset=22
       (local.get $7)
       (block (result f32)
        (local.set $5
         (block (result (ref i31))
          (local.set $scratch_14
           (ref.i31
            (i32.const -85)
           )
          )
          (local.set $8
           (block (result i32)
            (local.set $scratch
             (i32.const -1048576)
            )
            (local.set $6
             (ref.func $0)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_14)
         )
        )
        (if (result f32)
         (i32.eqz
          (local.get $8)
         )
         (then
          (f32.const 65470)
         )
         (else
          (call $15)
          (return
           (v128.const i32x4 0x8a0200fe 0x0000ff36 0x4dff0000 0x01005817)
          )
         )
        )
       )
      )
      (return
       (v128.const i32x4 0x99ff0100 0x00f861ac 0xff00839f 0xff00fe59)
      )
     )
     (unreachable)
    )
    (catch $tag$1
     (local.set $10 (f64.sqrt (pop f64)))
     (nop)
    )
   )
   (try (result v128)
    (do
     (call_indirect $0 (type $0)
      (i64.const -65534)
     )
    )
    (catch $tag$1
     (local.set $11 (select (pop f64) (local.get $11) (i32.const 7)))
     (f64x2.splat
      (local.get $9)
     )
    )
   )
  )
 )
 (func $29 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $28)
  )
 )
 (func $30 (type $25) (result (ref string))
  (local $0 (ref eq))
  (local $1 (ref $0))
  (local $2 (ref null $0))
  (local $3 (ref null $0))
  (local $4 (ref null $0))
  (local $5 (ref null $1))
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 i32)
  (local $10 v128)
  (local $11 i64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$11)
     )
     (then
      (global.set $global$11
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$11
     (i32.sub
      (global.get $global$11)
      (i32.const 1)
     )
    )
    (call $fimport$6
     (ref.i31
      (i32.const 32767)
     )
    )
    (br_if $label
     (i32.eqz
      (local.get $9)
     )
    )
    (drop
     (br_on_null $label
      (ref.i31
       (i32.const -95)
      )
     )
    )
    (block
     (drop
      (br_on_null $label
       (try_table (result (ref (exact $1))) (catch_all $label)
        (try_table (result (ref (exact $1))) (catch_all $label)
         (ref.func $14)
        )
       )
      )
     )
     (drop
      (local.get $10)
     )
     (if
      (memory.atomic.notify offset=22
       (i32.and
        (i32.load16_s offset=4
         (i32.and
          (i32.const -31160)
          (i32.const 15)
         )
        )
        (i32.const 15)
       )
       (local.get $9)
      )
      (then
       (call $fimport$2
        (local.tee $11
         (i64.const -17592186044416)
        )
       )
       (br $label)
      )
      (else
       (try
        (do
         (nop)
        )
        (catch $tag$1
         (local.set $8 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
         (nop)
        )
        (catch_all
         (call $fimport$6
          (array.new_fixed $3 0)
         )
        )
       )
       (br $label)
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
 (func $31 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $30)
  )
 )
 (func $32 (type $26) (param $0 eqref) (param $1 v128)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 structref)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$4
    (f64.const -nan:0xfffffffcd310e)
   )
   (block
    (call $fimport$8
     (string.const "48")
    )
    (atomic.fence acqrel)
   )
  )
 )
 (func $33 (type $27) (param $0 (ref $0)) (param $1 (ref $1)) (param $2 (ref $1)) (result (ref null $1))
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (ref.func $14)
 )
 (func $34 (type $10) (param $0 funcref) (param $1 arrayref) (param $2 (ref string)) (result v128)
  (local $3 (ref $0))
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (v128.load offset=22 align=4
   (i32.and
    (local.get $4)
    (i32.const 15)
   )
  )
 )
 (func $35 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $34
    (ref.func $35)
    (array.new_fixed $3 0)
    (string.const "")
   )
  )
  (drop
   (call $34
    (ref.func $35)
    (array.new_fixed $3 0)
    (string.const "\c2\a3\c2\a3")
   )
  )
 )
 (@binaryen.js.called)
 (func $36 (type $1) (result v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (result v128)
   (nop)
   (call_indirect $0 (type $10)
    (block (result (ref (exact $0)))
     (nop)
     (try_table (result (ref (exact $0)))
      (ref.func $28)
     )
    )
    (ref.as_non_null
     (ref.null none)
    )
    (string.const "46\e2\82\ac995")
    (i64.const 14)
   )
  )
 )
 (func $37 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
  (drop
   (call $36)
  )
 )
 (func $38 (type $28) (param $0 (ref null $0)) (param $1 f64) (param $2 (ref string)) (param $3 (ref eq)) (param $4 (ref null $0)) (param $5 (ref $1)) (param $6 (ref struct)) (result i32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (i32.const 65427)
 )
 (func $39 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $38
    (ref.func $36)
    (f64.const 3402823466385288598117041e14)
    (string.const "\ed\bd\88\e2\82\ac\f0\90\8d\88")
    (ref.i31
     (i32.const -111)
    )
    (ref.func $0)
    (ref.func $0)
    (struct.new_default $4)
   )
  )
 )
 (func $40 (type $1) (result v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block
   (try_table
    (nop)
   )
   (return
    (v128.const i32x4 0x00000000 0x43900000 0x00000000 0x40a00000)
   )
  )
  (unreachable)
 )
 (func $41 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
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
 (func $42 (type $29) (param $0 f32) (param $1 (ref $1)) (result f32)
  (local $2 v128)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (return
   (local.get $0)
  )
 )
 (func $43 (type $2)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (drop
   (call $42
    (f32.const -18446744073709551615)
    (ref.func $14)
   )
  )
  (drop
   (call $42
    (f32.const 3402823466385288598117041e14)
    (ref.func $14)
   )
  )
 )
 (@binaryen.js.called)
 (func $44 (type $30) (param $0 (ref null $1)) (result f64 anyref i32 v128 i32 f32)
  (local $1 (ref struct))
  (local $2 i32)
  (local $3 f64)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (tuple.make 6
   (f64.const -nan:0xffffff94c537e)
   (array.new_fixed $3 0)
   (i32.const 4194303)
   (v128.const i32x4 0x5f000000 0xffffffec 0x50800000 0xc6996a00)
   (i32.const -11449)
   (f32.const -20)
  )
 )
 (@binaryen.js.called)
 (func $45 (type $0) (result v128)
  (local $0 stringref)
  (local $1 (ref $5))
  (local $2 (ref $5))
  (local $3 (ref $5))
  (local $4 (ref string))
  (local $5 v128)
  (local $6 i32)
  (if
   (i32.eqz
    (global.get $global$11)
   )
   (then
    (global.set $global$11
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$11
   (i32.sub
    (global.get $global$11)
    (i32.const 1)
   )
  )
  (block (result v128)
   (call $fimport$3
    (block (result f32)
     (call $fimport$5
      (local.get $5)
     )
     (loop (result f32)
      (if
       (i32.eqz
        (global.get $global$11)
       )
       (then
        (global.set $global$11
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$11
       (i32.sub
        (global.get $global$11)
        (i32.const 1)
       )
      )
      (loop $label2 (result f32)
       (if
        (i32.eqz
         (global.get $global$11)
        )
        (then
         (global.set $global$11
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$11
        (i32.sub
         (global.get $global$11)
         (i32.const 1)
        )
       )
       (block
        (call $fimport$3
         (f32.const -562949953421312)
        )
        (loop $label1
         (if
          (i32.eqz
           (global.get $global$11)
          )
          (then
           (global.set $global$11
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$11
          (i32.sub
           (global.get $global$11)
           (i32.const 1)
          )
         )
         (loop $label
          (if
           (i32.eqz
            (global.get $global$11)
           )
           (then
            (global.set $global$11
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$11
           (i32.sub
            (global.get $global$11)
            (i32.const 1)
           )
          )
          (block
           (nop)
           (call $fimport$3
            (f32.const -3305)
           )
          )
          (br_if $label
           (if (result i32)
            (i32.const -70)
            (then
             (call $8)
             (i32.const -63)
            )
            (else
             (nop)
             (i31.get_s
              (ref.i31
               (i32.const 127)
              )
             )
            )
           )
          )
          (drop
           (f32.const -9223372036854775808)
          )
         )
         (br_if $label1
          (if (result i32)
           (i32.eqz
            (ref.is_null
             (select (result (ref string))
              (local.tee $4
               (string.const "\e2\82\ac")
              )
              (string.const "\ed\a0\80")
              (string.encode_wtf16_array
               (local.get $0)
               (local.tee $1
                (loop (result (ref $5))
                 (if
                  (i32.eqz
                   (global.get $global$11)
                  )
                  (then
                   (global.set $global$11
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$11
                  (i32.sub
                   (global.get $global$11)
                   (i32.const 1)
                  )
                 )
                 (local.tee $2
                  (local.tee $3
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
               )
               (i32.const 857040993)
              )
             )
            )
           )
           (then
            (i32.const -115)
           )
           (else
            (local.tee $6
             (i32.const -62)
            )
           )
          )
         )
         (nop)
        )
       )
       (br_if $label2
        (local.get $6)
       )
       (f32.const -16)
      )
     )
    )
   )
   (local.get $5)
  )
 )
 (type $__sinkT_0 (func (param f64) (result f64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
