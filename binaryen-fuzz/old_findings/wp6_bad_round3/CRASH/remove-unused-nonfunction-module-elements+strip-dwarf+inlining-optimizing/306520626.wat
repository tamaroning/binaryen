(module
 (rec
  (type $0 (sub (struct (field (ref $1)) (field funcref))))
  (type $1 (sub (func (param (ref $0) (ref null $0) (ref $1)) (result i31ref))))
 )
 (type $2 (sub $0 (struct (field (ref $1)) (field funcref) (field (mut (ref null $0))) (field (mut i16)))))
 (type $3 (sub (array (mut (ref null $2)))))
 (rec
  (type $4 (sub $1 (func (param (ref null $0) anyref (ref func)) (result nullref))))
  (type $5 (sub $3 (array (mut (ref null $2)))))
  (type $6 (sub $2 (struct (field (ref $1)) (field nullfuncref) (field (mut (ref null $0))) (field (mut i16)) (field (mut i64)))))
  (type $7 (sub (array (mut (ref $2)))))
  (type $8 (sub (array f32)))
 )
 (type $9 (sub $5 (array (mut (ref null $2)))))
 (type $10 (sub (func (param i32 i64 f32) (result (ref struct)))))
 (type $11 (sub $7 (array (mut (ref $2)))))
 (rec
  (type $12 (sub $0 (struct (field (ref $1)) (field (ref $10)) (field (mut (ref $13))))))
  (type $13 (sub $11 (array (mut (ref $2)))))
 )
 (type $14 (sub final $12 (struct (field (ref $4)) (field (ref $10)) (field (mut (ref $13))) (field f32) (field (mut i8)) (field (mut i8)))))
 (type $15 (array i8))
 (type $16 (sub final $7 (array (mut (ref $2)))))
 (type $17 (func))
 (type $18 (struct))
 (type $19 (func (param f64)))
 (rec
  (type $20 (sub (func (param (ref $3) i64) (result i32))))
  (type $21 (sub (func (param (ref $7) (ref $21) f64 f64) (result (ref $3) (ref $3) i64 v128 i32 f64))))
 )
 (type $22 (func (param i32)))
 (type $23 (func (param v128) (result f32)))
 (type $24 (sub final $21 (func (param eqref (ref $21) f64 f64) (result (ref $3) (ref $5) i64 v128 i32 f64))))
 (type $25 (func (result (ref $3) (ref $5) i64 v128 i32 f64)))
 (type $26 (func (result (ref $3) (ref (exact $9)) i64 v128 i32 f64)))
 (type $27 (func (param i64)))
 (type $28 (func (param f32)))
 (type $29 (func (param v128)))
 (type $30 (func (param anyref)))
 (type $31 (func (param funcref)))
 (type $32 (func (param externref)))
 (type $33 (func (result (ref $11))))
 (type $34 (func (param funcref) (result i32 eqref)))
 (type $35 (func (param (ref eq) arrayref i32 i32 (ref $6)) (result stringref)))
 (type $36 (func (result anyref)))
 (type $37 (func (param i32 (ref $11)) (result (ref null $13))))
 (type $38 (func (result i31ref)))
 (type $39 (func (result f32)))
 (type $40 (func (param (ref $1)) (result (ref null $9))))
 (type $41 (func (result i32 eqref)))
 (type $42 (func (result (ref $3) (ref $3) i64 v128 i32 f64)))
 (type $43 (func (result f64 i64 (ref $4))))
 (import "__fuzz_import" "global$_4" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $22) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $22) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $27) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $28) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $19) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $29) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $30) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $31) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $32) (param externref)))
 (global $global$0 (ref $8) (array.new $8
  (f32.const 0.1509999930858612)
  (i32.const 13)
 ))
 (global $global$1 (mut (ref array)) (array.new_fixed $15 0))
 (global $global$2 eqref (ref.null none))
 (global $global$3 (mut f64) (f64.const -nan:0xfffffffffffd7))
 (global $global$4 (mut i32) (i32.const -17584))
 (global $global$5 (mut (ref null $9)) (array.new $9
  (struct.new $2
   (ref.func $0)
   (ref.func $0)
   (struct.new $0
    (ref.func $0)
    (ref.func $0)
   )
   (i32.const -2147483648)
  )
  (i32.const 42)
 ))
 (global $global$6 (ref $9) (array.new_default $9
  (i32.const 6)
 ))
 (global $global$7 v128 (v128.const i32x4 0xffffffd7 0xdf000000 0x51000000 0xc97ffffe))
 (global $global$8 (mut (ref array)) (array.new_fixed $15 0))
 (global $global$9 (ref $10) (ref.func $1))
 (global $global$10 v128 (v128.const i32x4 0x7f00b77b 0xce76c2c3 0x39000701 0x81ff8f66))
 (global $global$11 anyref (ref.i31
  (i32.const -19405)
 ))
 (global $global$12 (ref null $8) (array.new $8
  (f32.const 3557821952)
  (i32.const 97)
 ))
 (global $global$13 i32 (i32.const -129))
 (global $global$14 f64 (f64.const -nan:0xfffffffffffe3))
 (global $global$15 exnref (ref.null noexn))
 (global $global$16 (ref null $14) (struct.new $14
  (ref.func $2)
  (global.get $global$9)
  (array.new $13
   (struct.new $2
    (ref.func $0)
    (ref.func $0)
    (ref.null none)
    (global.get $global$13)
   )
   (i32.const 64)
  )
  (f32.const 4294967296)
  (i32.const 48)
  (i32.const -92)
 ))
 (global $global$17 i64 (i64.const -19898))
 (global $global$18 structref (ref.null none))
 (global $global$19 i32 (i32.const 17))
 (global $global$20 anyref (ref.i31
  (i32.const -16342)
 ))
 (global $global$21 (ref null $8) (array.new $8
  (f32.const -2147483648)
  (i32.const 2)
 ))
 (global $global$22 (ref null $10) (ref.func $1))
 (global $global$23 (ref string) (string.const "\c2\a3\c2\a3347"))
 (global $global$24 v128 (global.get $global$7))
 (global $global$25 f64 (f64.const -nan:0xfffffffffff9b))
 (global $global$26 f64 (f64.const -1))
 (global $global$27 (mut i32) (global.get $global$13))
 (global $global$28 (ref $16) (array.new $16
  (struct.new $2
   (ref.func $2)
   (ref.func $2)
   (struct.new $0
    (ref.func $0)
    (ref.func $2)
   )
   (i32.const 16)
  )
  (i32.const 1)
 ))
 (global $global$29 (mut (ref null $8)) (array.new_default $8
  (i32.const 80)
 ))
 (global $global$30 f64 (global.get $global$25))
 (global $global$31 (mut (ref null $11)) (array.new $11
  (struct.new $2
   (ref.func $0)
   (ref.func $1)
   (struct.new $0
    (ref.func $2)
    (ref.null nofunc)
   )
   (i32.const 30077)
  )
  (i32.const 14)
 ))
 (global $global$32 arrayref (array.new_fixed $15 0))
 (global $global$33 exnref (ref.null noexn))
 (global $global$34 i64 (i64.const 4294967252))
 (global $global$35 i64 (i64.const 35184372088832))
 (global $global$36 v128 (v128.const i32x4 0xffffff80 0xffffffff 0xffffffde 0xffffffff))
 (global $global$37 (mut i32) (i32.const 100))
 (memory $0 16 16 shared)
 (data $0 "\8c\b0\'\b6\02\bb^\8b<\aez\83,\02\a2?\9d\1b\e2\92\e9`\a0a@+\cc\a3\b6")
 (data $1 "\db\t\b0*")
 (table $0 9 funcref (ref.null nofunc))
 (table $1 0 exnref)
 (elem $0 (table $0) (i32.const 0) func $4 $6 $10 $10 $10 $12 $15 $15 $19)
 (elem declare func $0 $1 $11 $14 $17 $2 $21 $25 $3 $5 $fimport$1 $fimport$4)
 (tag $tag$0 (type $19) (param f64))
 (tag $tag$1 (type $19) (param f64))
 (tag $tag$2 (type $17))
 (export "global$_5" (global $global$4))
 (export "global$_7" (global $global$6))
 (export "global$_9" (global $global$8))
 (export "global$_10" (global $global$9))
 (export "global$_17" (global $global$24))
 (export "global$_19" (global $global$26))
 (export "global$_26" (global $global$33))
 (export "global$_28" (global $global$36))
 (export "tag$" (tag $tag$0))
 (export "tag$_1" (tag $tag$1))
 (export "ref_func_target_2_invoker" (func $3))
 (export "func_14_invoker" (func $7))
 (export "func_17" (func $8))
 (export "func_17_invoker" (func $9))
 (export "func_19" (func $10))
 (export "func_19_invoker" (func $11))
 (export "func_21_invoker" (func $13))
 (export "func_24_invoker" (func $16))
 (export "func_26_invoker" (func $18))
 (export "func_28_invoker" (func $21))
 (func $0 (type $1) (param $0 (ref $0)) (param $1 (ref null $0)) (param $2 (ref $1)) (result i31ref)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $10) (param $0 i32) (param $1 i64) (param $2 f32) (result (ref struct))
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $4) (param $0 (ref null $0)) (param $1 anyref) (param $2 (ref func)) (result nullref)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $3 (type $17)
  (local $0 f64)
  (local $1 (ref $4))
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (call $2
    (struct.new $0
     (ref.func $2)
     (try $__t_11 (result (ref $4)) (do (try (result (ref $4)) (do 
       (ref.func $2)
      ) (delegate $__t_11))) (catch $tag$1
(local.set $0 (local.tee $0 (pop f64)))
(if (global.get $__rt) (then (rethrow $__t_11)))
(try_table (result (ref $4))
        (select (result (ref $4))
         (ref.func $2)
         (local.tee $1
          (ref.func $2)
         )
         (global.get $global$4)
        )
       )))
    )
    (ref.i31
     (i32.const 217)
    )
    (ref.func $3)
   )
  )
 )
 (func $4 (type $1) (param $0 (ref $0)) (param $1 (ref null $0)) (param $2 (ref $1)) (result i31ref)
  (local $3 (ref eq))
  (local $4 arrayref)
  (local $5 arrayref)
  (local $6 (ref null $3))
  (local $7 structref)
  (local $8 (ref null $7))
  (local $9 (ref $12))
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 f32)
  (local $15 f64)
  (local $16 i64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (block (result (ref i31))
   (table.set $1
    (i32.const 0)
    (global.get $global$33)
   )
   (ref.i31
    (i32.const 8388609)
   )
  )
 )
 (func $5 (type $24) (param $0 eqref) (param $1 (ref $21)) (param $2 f64) (param $3 f64) (result (ref $3) (ref $5) i64 v128 i32 f64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $6 (type $23) (param $0 v128) (result f32)
  (local $1 i31ref)
  (local $2 i31ref)
  (local $3 arrayref)
  (local $4 funcref)
  (local $5 (ref string))
  (local $6 exnref)
  (local $7 (ref $13))
  (local $8 (ref $2))
  (local $9 (ref $9))
  (local $10 (ref $9))
  (local $11 (ref none))
  (local $12 (ref $7))
  (local $13 (ref $4))
  (local $14 (ref $4))
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 f32)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $scratch f32)
  (local $scratch_32 i32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (local.set $8
   (struct.new $2
    (ref.func $2)
    (local.get $4)
    (struct.new $2
     (ref.func $4)
     (local.get $4)
     (struct.new $12
      (ref.func $2)
      (ref.func $1)
      (array.new $13
       (struct.new $6
        (ref.func $4)
        (ref.null nofunc)
        (struct.new $12
         (ref.func $2)
         (global.get $global$9)
         (array.new $13
          (struct.new $6
           (ref.func $4)
           (ref.null nofunc)
           (ref.null none)
           (global.get $global$13)
           (i64.const -103)
          )
          (i32.and
           (i32.const 86)
           (i32.const 1023)
          )
         )
        )
        (global.get $global$13)
        (i64.const 65535)
       )
       (i32.and
        (i32.const 32)
        (i32.const 1023)
       )
      )
     )
     (global.get $global$4)
    )
    (global.get $global$27)
   )
  )
  (local.set $5
   (string.const "")
  )
  (block $block (result f32)
   (call $fimport$6
    (if (result (ref (exact $8)))
     (f32.ne
      (br_if $block
       (loop (result f32)
        (if
         (i32.eqz
          (global.get $global$37)
         )
         (then
          (global.set $global$37
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$37
         (i32.sub
          (global.get $global$37)
          (i32.const 1)
         )
        )
        (f32.load offset=22
         (local.get $23)
        )
       )
       (i32.eqz
        (string.measure_wtf16
         (local.tee $5
          (select (result (ref string))
           (global.get $global$23)
           (global.get $global$23)
           (i32.const -255)
          )
         )
        )
       )
      )
      (if (result f32)
       (local.get $24)
       (then
        (block $block1
         (if
          (i32.lt_u
           (i32.add
            (global.get $global$13)
            (local.tee $27
             (string.measure_wtf16
              (local.get $5)
             )
            )
           )
           (array.len
            (local.tee $10
             (ref.cast (ref $9)
              (global.get $global$5)
             )
            )
           )
          )
          (then
           (drop
            (i32.add
             (local.tee $28
              (local.get $23)
             )
             (local.tee $29
              (local.get $27)
             )
            )
           )
           (block
            (data.drop $0)
            (br $block1)
           )
           (local.set $12
            (unreachable)
           )
          )
         )
         (nop)
        )
        (local.set $scratch
         (br_if $block
          (local.get $18)
          (i32.eqz
           (string.measure_wtf16
            (local.tee $5
             (select (result (ref string))
              (global.get $global$23)
              (global.get $global$23)
              (i32.const -255)
             )
            )
           )
          )
         )
        )
        (drop
         (array.new $11
          (struct.new $2
           (ref.func $2)
           (ref.func $5)
           (struct.new $12
            (ref.func $2)
            (ref.func $1)
            (array.new $13
             (struct.new $6
              (ref.as_non_null
               (ref.null nofunc)
              )
              (ref.null nofunc)
              (ref.as_non_null
               (ref.null none)
              )
              (local.get $23)
              (local.get $16)
             )
             (i32.and
              (i32.const 91)
              (i32.const 1023)
             )
            )
           )
           (local.get $23)
          )
          (i32.and
           (i32.const 93)
           (i32.const 1023)
          )
         )
        )
        (local.get $scratch)
       )
       (else
        (call $fimport$4
         (select
          (if (result f64)
           (stringview_wtf16.get_codeunit
            (local.get $5)
            (block (result i32)
             (local.set $30
              (i32.lt_u
               (global.get $global$4)
               (block (result i32)
                (drop
                 (global.get $global$4)
                )
                (i32.const 255)
               )
              )
             )
             (local.get $30)
            )
           )
           (then
            (f64.const 9223372036854775808)
           )
           (else
            (f64.const -nan:0xfffffffffb436)
           )
          )
          (f64.reinterpret_i64
           (i64.const 22)
          )
          (local.tee $23
           (i32.load16_u offset=22 align=1
            (i32.and
             (local.tee $23
              (global.get $global$4)
             )
             (global.get $global$4)
            )
           )
          )
         )
        )
        (return
         (f32.const -4294967296)
        )
       )
      )
     )
     (then
      (block $block2 (result (ref (exact $8)))
       (drop
        (br_on_cast $block2 (ref (exact $8)) (ref (exact $8))
         (array.new $8
          (local.get $18)
          (i32.and
           (i32.const 4)
           (i32.const 1023)
          )
         )
        )
       )
       (array.new $8
        (f32.const 43646)
        (i32.and
         (i32.const 67)
         (i32.const 1023)
        )
       )
      )
     )
     (else
      (throw $tag$1
       (f64.const -nan:0xfffffff8f4a09)
      )
     )
    )
   )
   (nop)
   (f32.load offset=22 align=1
    (i32.and
     (i32.atomic.rmw16.add_u acqrel offset=22
      (i32.and
       (ref.eq
        (ref.cast (ref i31)
         (ref.i31
          (i32.const 72)
         )
        )
        (array.new_fixed $15 0)
       )
       (i32.const 15)
      )
      (block (result i32)
       (local.set $scratch_32
        (i32.const -4443848)
       )
       (drop
        (i64.const 3845348887)
       )
       (local.get $scratch_32)
      )
     )
     (i32.const 15)
    )
   )
  )
 )
 (func $7 (type $17)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (call $6
    (v128.const i32x4 0x0002bd53 0xfd5c0080 0xffac0001 0x00290000)
   )
  )
 )
 (@binaryen.js.called)
 (func $8 (type $33) (result (ref $11))
  (local $0 (ref null $10))
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (struct.get $14 2
   (struct.new $14
    (ref.func $2)
    (global.get $global$9)
    (array.new $13
     (struct.new $6
      (ref.func $2)
      (ref.null nofunc)
      (struct.new $2
       (ref.func $2)
       (ref.null nofunc)
       (ref.null none)
       (global.get $global$4)
      )
      (global.get $global$4)
      (i64.const 2147483647)
     )
     (i32.and
      (i32.const 40)
      (i32.const 1023)
     )
    )
    (f32.const -nan:0x7fffdb)
    (i32.const -2189)
    (i32.const -30)
   )
  )
 )
 (func $9 (type $17)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (call $8)
  )
  (drop
   (call $8)
  )
 )
 (func $10 (type $34) (param $0 funcref) (result i32 eqref)
  (local $1 structref)
  (local $2 (ref null $20))
  (local $3 (ref $1))
  (local $4 arrayref)
  (local $5 v128)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (return
   (tuple.make 2
    (i32.const 32767)
    (struct.new_default $18)
   )
  )
 )
 (func $11 (type $17)
  (local $scratch (tuple i32 eqref))
  (local $scratch_1 i32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $10
        (ref.func $11)
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
 (func $12 (type $35) (param $0 (ref eq)) (param $1 arrayref) (param $2 i32) (param $3 i32) (param $4 (ref $6)) (result stringref)
  (local $5 (ref null $16))
  (local $6 (ref null $5))
  (local $7 (ref $16))
  (local $8 (ref $16))
  (local $9 (ref $16))
  (local $10 (ref $1))
  (local $11 (ref $4))
  (local $12 (ref $4))
  (local $13 exnref)
  (local $14 (ref string))
  (local $15 nullref)
  (local $16 (ref i31))
  (local $17 (ref null $0))
  (local $18 (ref null $9))
  (local $19 (ref null $9))
  (local $20 (ref null $9))
  (local $21 structref)
  (local $22 (ref $0))
  (local $23 (ref $14))
  (local $24 (ref $14))
  (local $25 (ref $9))
  (local $26 (ref $9))
  (local $27 (ref $9))
  (local $28 (ref $9))
  (local $29 (ref none))
  (local $30 (ref none))
  (local $31 (ref null $2))
  (local $32 (ref null $6))
  (local $33 (ref $20))
  (local $34 (ref $3))
  (local $35 (ref $5))
  (local $36 eqref)
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
  (local $49 i32)
  (local $50 i32)
  (local $51 i32)
  (local $52 i32)
  (local $53 i32)
  (local $54 i32)
  (local $55 i32)
  (local $56 i32)
  (local $57 f64)
  (local $58 f64)
  (local $59 f64)
  (local $60 f64)
  (local $61 f64)
  (local $62 f64)
  (local $63 f64)
  (local $64 f64)
  (local $65 f64)
  (local $66 f64)
  (local $67 f64)
  (local $68 f64)
  (local $69 f64)
  (local $70 i64)
  (local $scratch (ref (exact $8)))
  (local $scratch_72 i32)
  (local $scratch_73 (ref (exact $6)))
  (local $scratch_74 (ref (exact $11)))
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (local.set $9
   (array.new $16
    (struct.new $6
     (ref.func $0)
     (ref.null nofunc)
     (struct.new $0
      (ref.func $2)
      (ref.func $12)
     )
     (i32.const -32767)
     (i64.const -20)
    )
    (i32.and
     (i32.const 92)
     (i32.const 1023)
    )
   )
  )
  (local.set $20
   (ref.as_non_null
    (local.get $20)
   )
  )
  (local.set $26
   (global.get $global$6)
  )
  (local.set $25
   (global.get $global$6)
  )
  (local.set $16
   (ref.i31
    (i32.const -65536)
   )
  )
  (local.set $14
   (string.const "1013281\ed\a0\80")
  )
  (local.set $12
   (ref.func $2)
  )
  (local.set $11
   (ref.func $2)
  )
  (local.set $10
   (ref.func $0)
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$37)
     )
     (then
      (global.set $global$37
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$37
     (i32.sub
      (global.get $global$37)
      (i32.const 1)
     )
    )
    (nop)
    (br_if $label
     (if (result i32)
      (i32.eqz
       (global.get $global$4)
      )
      (then
       (call $fimport$0
        (i32.const 0)
       )
       (br $label)
      )
      (else
       (loop $label2
        (if
         (i32.eqz
          (global.get $global$37)
         )
         (then
          (global.set $global$37
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$37
         (i32.sub
          (global.get $global$37)
          (i32.const 1)
         )
        )
        (block
         (table.set $1
          (i32.const 0)
          (select (result (ref exn))
           (try $__t_10 (result (ref exn)) (do
             (ref.as_non_null
              (local.tee $13
               (block $block (result (ref exn))
                (try_table (catch_all_ref $block)
                 (throw $tag$2)
                )
                (unreachable)
               )
              )
             )
            ) (catch $tag$1
(throw $tag$1 (pop f64))
(if (global.get $__rt) (then (rethrow $__t_10)))
(block (result (ref exn))
              (drop
               (br_on_null $label
                (array.new $13
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (i32.and
                  (i32.const 94)
                  (i32.const 1023)
                 )
                )
               )
              )
              (ref.as_non_null
               (local.get $13)
              )
             )) (catch $tag$0
(local.set $58 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_10)))
(if (result (ref exn))
              (i32.eqz
               (string.compare
                (string.const "\f0\90\8d\88\ed\bd\88")
                (local.tee $14
                 (string.const "373\ed\a0\80610")
                )
               )
              )
              (then
               (ref.cast (ref exn)
                (block $block1 (result (ref exn))
                 (try_table (catch_all_ref $block1)
                  (throw $tag$2)
                 )
                 (unreachable)
                )
               )
              )
              (else
               (block $block2 (result (ref exn))
                (nop)
                (try_table (result (ref exn)) (catch_all_ref $block2)
                 (block $block3 (result (ref exn))
                  (try_table (catch_all_ref $block3)
                   (throw $tag$0
                    (f64.const -nan:0xffffffffffff2)
                   )
                  )
                  (unreachable)
                 )
                )
               )
              )
             )))
           (block $block4 (result (ref exn))
            (try_table (catch_all_ref $block4)
             (throw $tag$2)
            )
            (unreachable)
           )
           (ref.eq
            (array.new $5
             (loop (result (ref (exact $6)))
              (if
               (i32.eqz
                (global.get $global$37)
               )
               (then
                (global.set $global$37
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$37
               (i32.sub
                (global.get $global$37)
                (i32.const 1)
               )
              )
              (block (result (ref (exact $6)))
               (if
                (i32.lt_u
                 (i32.add
                  (local.tee $37
                   (local.tee $3
                    (i32.const 32769)
                   )
                  )
                  (local.tee $38
                   (i32.const -128)
                  )
                 )
                 (array.len
                  (local.tee $8
                   (local.tee $7
                    (global.get $global$28)
                   )
                  )
                 )
                )
                (then
                 (array.fill $16
                  (local.get $8)
                  (local.get $37)
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (local.get $38)
                 )
                )
               )
               (struct.new $6
                (local.tee $10
                 (local.tee $11
                  (local.tee $12
                   (ref.as_non_null
                    (ref.null nofunc)
                   )
                  )
                 )
                )
                (ref.null nofunc)
                (ref.null none)
                (global.get $global$27)
                (i64.const 30)
               )
              )
             )
             (i32.and
              (i32.const 45)
              (i32.const 1023)
             )
            )
            (local.get $1)
           )
          )
         )
        )
        (br_if $label2
         (memory.atomic.notify offset=22
          (i32.and
           (ref.eq
            (local.get $1)
            (array.new $13
             (loop (result (ref $6))
              (if
               (i32.eqz
                (global.get $global$37)
               )
               (then
                (global.set $global$37
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$37
               (i32.sub
                (global.get $global$37)
                (i32.const 1)
               )
              )
              (loop $label1 (result (ref $6))
               (if
                (i32.eqz
                 (global.get $global$37)
                )
                (then
                 (global.set $global$37
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$37
                (i32.sub
                 (global.get $global$37)
                 (i32.const 1)
                )
               )
               (block (result (ref $6))
                (block
                 (memory.init $1
                  (i32.and
                   (local.get $2)
                   (i32.const 15)
                  )
                  (i32.const 0)
                  (i32.const 2)
                 )
                 (br_if $label1
                  (i32.const 0)
                 )
                )
                (local.get $4)
               )
              )
             )
             (i32.and
              (i32.const 83)
              (i32.const 1023)
             )
            )
           )
           (i32.const 15)
          )
          (local.tee $3
           (string.measure_wtf16
            (local.get $14)
           )
          )
         )
        )
        (loop $label3
         (if
          (i32.eqz
           (global.get $global$37)
          )
          (then
           (global.set $global$37
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$37
          (i32.sub
           (global.get $global$37)
           (i32.const 1)
          )
         )
         (block
          (atomic.fence acqrel)
          (nop)
         )
         (br_if $label3
          (i32.eqz
           (i32.const 5)
          )
         )
         (block
          (drop
           (block (result (ref (exact $11)))
            (local.set $scratch_74
             (array.new $11
              (struct.new $2
               (local.get $11)
               (ref.func $12)
               (ref.null none)
               (global.get $global$4)
              )
              (i32.and
               (i32.const 22)
               (i32.const 1023)
              )
             )
            )
            (drop
             (block (result (ref (exact $6)))
              (local.set $scratch_73
               (struct.new $6
                (ref.func $0)
                (ref.null nofunc)
                (struct.new $12
                 (local.get $12)
                 (global.get $global$9)
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (local.get $2)
                (i64.const 125)
               )
              )
              (local.set $56
               (block (result i32)
                (local.set $scratch_72
                 (i32.const -1)
                )
                (drop
                 (block (result (ref (exact $8)))
                  (local.set $scratch
                   (array.new $8
                    (f32.const -1152921504606846976)
                    (i32.and
                     (i32.const 70)
                     (i32.const 1023)
                    )
                   )
                  )
                  (drop
                   (ref.null none)
                  )
                  (local.get $scratch)
                 )
                )
                (local.get $scratch_72)
               )
              )
              (local.get $scratch_73)
             )
            )
            (local.get $scratch_74)
           )
          )
          (br_if $label2
           (i32.eqz
            (local.get $56)
           )
          )
          (return
           (string.const "269905")
          )
         )
         (unreachable)
        )
        (unreachable)
       )
       (unreachable)
      )
     )
    )
    (drop
     (loop $label5 (result i32)
      (if
       (i32.eqz
        (global.get $global$37)
       )
       (then
        (global.set $global$37
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$37
       (i32.sub
        (global.get $global$37)
        (i32.const 1)
       )
      )
      (block $block9 (result i32)
       (if
        (i32.eqz
         (ref.eq
          (ref.cast (ref (exact $14))
           (struct.new $14
            (ref.func $2)
            (ref.func $1)
            (array.new $13
             (struct.new $6
              (ref.func $2)
              (ref.null nofunc)
              (struct.new $2
               (local.get $10)
               (ref.null nofunc)
               (ref.as_non_null
                (ref.null none)
               )
               (global.get $global$27)
              )
              (i32.const 98)
              (i64.const 17)
             )
             (i32.and
              (i32.const 23)
              (i32.const 1023)
             )
            )
            (f32.const -2147483648)
            (global.get $global$27)
            (local.get $2)
           )
          )
          (struct.new_default $18)
         )
        )
        (then
         (block $block5
          (br_if $block5
           (i32.eqz
            (ref.eq
             (if (result (ref (exact $12)))
              (try $__t_9 (result i32) (do (try (result i32) (do 
                (i32.rotr
                 (ref.eq
                  (ref.null none)
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (local.get $2)
                )
               ) (delegate $__t_9))) (catch $tag$1
(local.set $60 (f64.abs (pop f64)))
(if (global.get $__rt) (then (rethrow $__t_9)))
(local.get $3)) (catch_all (if (global.get $__rt) (then (rethrow $__t_9)))
(local.tee $3
                 (stringview_wtf16.get_codeunit
                  (local.get $14)
                  (block (result i32)
                   (local.set $56
                    (string.measure_wtf16
                     (string.const "\ed\bd\88\ed\a0\80\e2\82\ac")
                    )
                   )
                   (local.get $56)
                  )
                 )
                )))
              (then
               (loop $label4 (result (ref (exact $12)))
                (if
                 (i32.eqz
                  (global.get $global$37)
                 )
                 (then
                  (global.set $global$37
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$37
                 (i32.sub
                  (global.get $global$37)
                  (i32.const 1)
                 )
                )
                (drop
                 (br_on_null $label4
                  (local.tee $16
                   (ref.i31
                    (i32.const -2097151)
                   )
                  )
                 )
                )
                (struct.set $6 2
                 (loop (result (ref $6))
                  (if
                   (i32.eqz
                    (global.get $global$37)
                   )
                   (then
                    (global.set $global$37
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$37
                   (i32.sub
                    (global.get $global$37)
                    (i32.const 1)
                   )
                  )
                  (local.get $4)
                 )
                 (local.get $17)
                )
                (br_if $label4
                 (local.tee $3
                  (ref.is_null
                   (if (result (ref null $9))
                    (i32.eqz
                     (local.get $2)
                    )
                    (then
                     (ref.null none)
                    )
                    (else
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
                (struct.new $12
                 (ref.func $2)
                 (ref.func $1)
                 (array.new $13
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (i32.and
                   (i32.const 88)
                   (i32.const 1023)
                  )
                 )
                )
               )
              )
              (else
               (memory.fill
                (i32.and
                 (local.tee $2
                  (string.measure_wtf16
                   (string.from_code_point
                    (local.get $2)
                   )
                  )
                 )
                 (i32.const 15)
                )
                (i32.const -32768)
                (struct.get_s $14 5
                 (local.tee $23
                  (local.tee $24
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
               )
               (br $label5)
              )
             )
             (block (result (ref i31))
              (br_if $label5
               (local.get $3)
              )
              (ref.i31
               (i32.const -19342)
              )
             )
            )
           )
          )
          (if
           (i32.const 256)
           (then
            (block
             (nop)
             (br $label)
            )
            (unreachable)
           )
           (else
            (br_if $block5
             (i32.eqz
              (global.get $global$13)
             )
            )
            (nop)
           )
          )
         )
        )
        (else
         (block $block8
          (table.set $1
           (i32.const 0)
           (ref.as_non_null
            (local.tee $13
             (ref.as_non_null
              (local.tee $13
               (block $block6 (result (ref exn))
                (try_table (catch_all_ref $block6)
                 (throw $tag$2)
                )
                (unreachable)
               )
              )
             )
            )
           )
          )
          (if
           (block (result i32)
            (try $__t_8  (do
              (memory.init $1
               (i32.and
                (i32.const -49)
                (i32.const 15)
               )
               (i32.const 3)
               (i32.const 0)
              )
             ) (catch $tag$0
(drop (pop f64))
(if (global.get $__rt) (then (rethrow $__t_8)))
(call $fimport$7
               (loop (result (ref $1))
                (if
                 (i32.eqz
                  (global.get $global$37)
                 )
                 (then
                  (global.set $global$37
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$37
                 (i32.sub
                  (global.get $global$37)
                  (i32.const 1)
                 )
                )
                (block (result (ref $1))
                 (drop
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                 )
                 (br_on_null $label
                  (local.tee $10
                   (local.get $12)
                  )
                 )
                )
               )
              )) (catch $tag$1
              (local.set $64 (f64.neg (pop f64)))
              (atomic.fence)
             ) (catch_all
              (loop $label6
               (if
                (i32.eqz
                 (global.get $global$37)
                )
                (then
                 (global.set $global$37
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$37
                (i32.sub
                 (global.get $global$37)
                 (i32.const 1)
                )
               )
               (atomic.fence)
               (br_if $label6
                (local.tee $3
                 (i32.load offset=4 align=1
                  (i32.and
                   (local.get $3)
                   (local.tee $37
                    (local.get $2)
                   )
                  )
                 )
                )
               )
               (loop
                (if
                 (i32.eqz
                  (global.get $global$37)
                 )
                 (then
                  (global.set $global$37
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$37
                 (i32.sub
                  (global.get $global$37)
                  (i32.const 1)
                 )
                )
                (block
                 (br_if $label6
                  (i32.eqz
                   (ref.eq
                    (ref.i31
                     (i32.const 7305)
                    )
                    (struct.new_default $18)
                   )
                  )
                 )
                 (table.set $1
                  (i32.const 0)
                  (ref.null noexn)
                 )
                )
               )
              )
             ))
            (block (result i32)
             (drop
              (br_on_null $label5
               (struct.new $0
                (local.get $12)
                (ref.null nofunc)
               )
              )
             )
             (drop
              (i32.add
               (local.tee $39
                (i32.atomic.load8_u offset=22
                 (i32.and
                  (local.tee $3
                   (i32.const -101)
                  )
                  (i32.const 15)
                 )
                )
               )
               (local.tee $40
                (i31.get_u
                 (local.get $16)
                )
               )
              )
             )
             (throw $tag$0
              (if (result f64)
               (i32.eqz
                (ref.test (ref (exact $15))
                 (array.new_fixed $15 0)
                )
               )
               (then
                (drop
                 (f64.load offset=22
                  (i32.and
                   (i32.load8_u offset=22
                    (i32.and
                     (i32.const -2147483648)
                     (i32.const 15)
                    )
                   )
                   (i32.const 15)
                  )
                 )
                )
                (loop $label7
                 (if
                  (i32.eqz
                   (global.get $global$37)
                  )
                  (then
                   (global.set $global$37
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$37
                  (i32.sub
                   (global.get $global$37)
                   (i32.const 1)
                  )
                 )
                 (block
                  (call $fimport$4
                   (f64x2.extract_lane 1
                    (global.get $global$24)
                   )
                  )
                  (br $label7)
                 )
                 (unreachable)
                )
                (unreachable)
               )
               (else
                (block $block7 (result f64)
                 (call $fimport$6
                  (if (result (ref i31))
                   (ref.eq
                    (if (result (ref (exact $8)))
                     (global.get $global$13)
                     (then
                      (call $fimport$3
                       (call $6
                        (global.get $global$7)
                       )
                      )
                      (block
                       (local.set $6
                        (try_table (result (ref (exact $9))) (catch $tag$1 $block7)
                         (array.new $9
                          (local.tee $32
                           (ref.null none)
                          )
                          (i32.and
                           (i32.const 93)
                           (i32.const 1023)
                          )
                         )
                        )
                       )
                       (block
                        (call $16)
                        (return
                         (string.const "\ed\a0\80\ed\a0\80")
                        )
                       )
                       (unreachable)
                      )
                      (unreachable)
                     )
                     (else
                      (nop)
                      (array.new $8
                       (f32.const -4294967296)
                       (i32.and
                        (i32.const 81)
                        (i32.const 1023)
                       )
                      )
                     )
                    )
                    (ref.null none)
                   )
                   (then
                    (ref.i31
                     (i32.const 53)
                    )
                   )
                   (else
                    (nop)
                    (return
                     (string.const "\ed\bd\88\f0\90\8d\88\c2\a3")
                    )
                   )
                  )
                 )
                 (f64.const 9223372036854775808)
                )
               )
              )
             )
            )
           )
           (then
            (br_if $block8
             (ref.eq
              (struct.new_default $18)
              (ref.null none)
             )
            )
            (nop)
           )
           (else
            (try $__t_7  (do (try  (do 
              (call $fimport$5
               (v128.const i32x4 0xfffffff3 0xffffffff 0xffffffad 0xffffffff)
              )
             ) (delegate $__t_7))) (catch_all (if (global.get $__rt) (then (rethrow $__t_7)))
(call $fimport$0
               (i32.const 0)
              )))
            (call $fimport$0
             (i32.const 0)
            )
           )
          )
         )
        )
       )
       (loop $label10
        (if
         (i32.eqz
          (global.get $global$37)
         )
         (then
          (global.set $global$37
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$37
         (i32.sub
          (global.get $global$37)
          (i32.const 1)
         )
        )
        (br_if $label10
         (i32.eqz
          (loop $label9 (result i32)
           (if
            (i32.eqz
             (global.get $global$37)
            )
            (then
             (global.set $global$37
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$37
            (i32.sub
             (global.get $global$37)
             (i32.const 1)
            )
           )
           (block (result i32)
            (call $fimport$6
             (array.new_fixed $15 0)
            )
            (drop
             (br_on_null $label9
              (loop $label8 (result (ref none))
               (if
                (i32.eqz
                 (global.get $global$37)
                )
                (then
                 (global.set $global$37
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$37
                (i32.sub
                 (global.get $global$37)
                 (i32.const 1)
                )
               )
               (block
                (local.set $11
                 (local.get $12)
                )
                (block
                 (nop)
                 (nop)
                )
               )
               (br_if $label8
                (br_if $block9
                 (local.get $2)
                 (i32.eqz
                  (local.get $2)
                 )
                )
               )
               (if (result (ref none))
                (i32.lt_u
                 (local.tee $43
                  (i32.const -1370793604)
                 )
                 (array.len
                  (local.tee $30
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
                (then
                 (drop
                  (local.get $30)
                 )
                 (drop
                  (local.get $43)
                 )
                 (unreachable)
                )
                (else
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
             )
            )
            (ref.is_null
             (ref.cast (ref $9)
              (ref.as_non_null
               (local.get $19)
              )
             )
            )
           )
          )
         )
        )
        (br_if $label10
         (i32.eqz
          (i32.const 65534)
         )
        )
        (return
         (string.const "")
        )
       )
       (unreachable)
      )
     )
    )
    (drop
     (ref.as_non_null
      (local.get $21)
     )
    )
    (block
     (loop $label11
      (if
       (i32.eqz
        (global.get $global$37)
       )
       (then
        (global.set $global$37
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$37
       (i32.sub
        (global.get $global$37)
        (i32.const 1)
       )
      )
      (block
       (call $fimport$6
        (loop (result (ref (exact $6)))
         (if
          (i32.eqz
           (global.get $global$37)
          )
          (then
           (global.set $global$37
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$37
          (i32.sub
           (global.get $global$37)
           (i32.const 1)
          )
         )
         (block
          (call $fimport$2
           (i64.const -1309846)
          )
          (if
           (i32.eqz
            (global.get $global$4)
           )
           (then
            (nop)
            (unreachable)
           )
           (else
            (local.set $40
             (local.get $2)
            )
            (br $label11)
           )
          )
          (unreachable)
         )
         (unreachable)
        )
       )
      )
     )
     (return
      (string.const "")
     )
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $13 (type $17)
  (local $0 (ref $4))
  (local $1 nullfuncref)
  (local $2 (ref i31))
  (local $3 (ref none))
  (local $4 (ref $14))
  (local $5 (ref $14))
  (local $6 (ref null $9))
  (local $7 (ref $11))
  (local $8 (ref $11))
  (local $9 (ref null $6))
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (local.set $4
   (struct.new $14
    (ref.func $2)
    (global.get $global$9)
    (array.new $13
     (ref.as_non_null
      (local.get $9)
     )
     (i32.and
      (i32.const 90)
      (i32.const 1023)
     )
    )
    (f32.const -1.8569999933242798)
    (i32.const 4)
    (global.get $global$4)
   )
  )
  (local.set $2
   (ref.i31
    (i32.const -67)
   )
  )
  (drop
   (ref.i31
    (i32.const -31)
   )
  )
  (drop
   (array.new_fixed $15 0)
  )
  (drop
   (i32.const 22318)
  )
  (drop
   (i32.const -67108864)
  )
  (block
   (if
    (i32.const 254)
    (then
     (nop)
     (nop)
    )
   )
   (return)
  )
  (local.set $7
   (local.set $8
    (local.set $7
     (local.set $4
      (local.set $5
       (local.set $0
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (func $14 (type $24) (param $0 eqref) (param $1 (ref $21)) (param $2 f64) (param $3 f64) (result (ref $3) (ref $5) i64 v128 i32 f64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 anyref)
  (local $13 (ref $3))
  (local $14 nullfuncref)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (if (type $26) (result (ref $3) (ref (exact $9)) i64 v128 i32 f64)
   (i32.eqz
    (i32.ge_u
     (i32.gt_u
      (i64.lt_u
       (i64.extend_i32_s
        (i32.atomic.load8_u acqrel offset=22
         (i32.and
          (i32.const 0)
          (i32.const 15)
         )
        )
       )
       (i64.const 281474976710655)
      )
      (local.get $5)
     )
     (loop $label (result i32)
      (if
       (i32.eqz
        (global.get $global$37)
       )
       (then
        (global.set $global$37
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$37
       (i32.sub
        (global.get $global$37)
        (i32.const 1)
       )
      )
      (block (result i32)
       (drop
        (br_on_null $label
         (if (result (ref string))
          (i32.eqz
           (local.get $6)
          )
          (then
           (global.get $global$23)
          )
          (else
           (nop)
           (br $label)
          )
         )
        )
       )
       (block
        (nop)
        (br $label)
       )
       (unreachable)
      )
     )
    )
   )
   (then
    (nop)
    (tuple.make 6
     (array.new_default $5
      (i32.and
       (i32.const 73)
       (i32.const 1023)
      )
     )
     (array.new_default $9
      (i32.and
       (i32.const 0)
       (i32.const 1023)
      )
     )
     (i64.const 32)
     (v128.const i32x4 0x9000a345 0x03a72003 0x6405edff 0x0008d001)
     (i32.const -12526)
     (f64.const -nan:0xfffffffffbe2f)
    )
   )
   (else
    (tuple.make 6
     (array.new $3
      (try $__t_6 (result (ref $2)) (do (try (result (ref $2)) (do 
        (block
         (call $fimport$8
          (global.get $gimport$0)
         )
         (return
          (tuple.make 6
           (array.new_default $3
            (i32.and
             (i32.const 23)
             (i32.const 1023)
            )
           )
           (array.new_default $5
            (i32.and
             (i32.const 94)
             (i32.const 1023)
            )
           )
           (i64.const -134217728)
           (v128.const i32x4 0xffffff01 0xffffffff 0x00000000 0x00000000)
           (i32.const 2147483647)
           (f64.const 18446744073709551615)
          )
         )
        )
        (unreachable)
       ) (delegate $__t_6))) (catch $tag$0
(local.set $10 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_6)))
(struct.new $6
         (ref.func $0)
         (ref.null nofunc)
         (struct.new $2
          (ref.func $2)
          (ref.func $14)
          (struct.new $12
           (ref.func $2)
           (global.get $global$9)
           (array.new $13
            (struct.new $6
             (ref.func $2)
             (local.get $14)
             (struct.new $2
              (ref.as_non_null
               (ref.null nofunc)
              )
              (ref.null nofunc)
              (ref.as_non_null
               (ref.null none)
              )
              (local.get $4)
             )
             (global.get $global$27)
             (i64.const -8192)
            )
            (i32.and
             (i32.const 59)
             (i32.const 1023)
            )
           )
          )
          (local.get $4)
         )
         (global.get $global$13)
         (i64.const -34)
        )) (catch $tag$1
(drop (pop f64))
(if (global.get $__rt) (then (rethrow $__t_6)))
(struct.new $6
         (ref.func $2)
         (local.get $14)
         (struct.new $0
          (ref.func $0)
          (ref.func $14)
         )
         (local.get $4)
         (i64.const -18)
        )) (catch_all (if (global.get $__rt) (then (rethrow $__t_6)))
(struct.new $2
         (ref.func $2)
         (ref.null nofunc)
         (struct.new $0
          (ref.func $4)
          (ref.null nofunc)
         )
         (local.get $5)
        )))
      (i32.and
       (i32.const 90)
       (i32.const 1023)
      )
     )
     (array.new $9
      (struct.new $6
       (ref.func $2)
       (local.get $14)
       (struct.new $2
        (ref.func $2)
        (ref.func $5)
        (struct.new $2
         (ref.func $0)
         (local.get $14)
         (struct.new $2
          (ref.func $2)
          (ref.func $4)
          (struct.new $2
           (ref.func $2)
           (ref.func $14)
           (struct.new $12
            (ref.func $2)
            (ref.func $1)
            (array.new $13
             (ref.as_non_null
              (ref.null none)
             )
             (i32.and
              (i32.const 67)
              (i32.const 1023)
             )
            )
           )
           (local.get $4)
          )
          (i32.const -74)
         )
         (local.get $5)
        )
        (global.get $global$13)
       )
       (global.get $global$13)
       (i64.const 549755813888)
      )
      (i32.and
       (i32.const 12)
       (i32.const 1023)
      )
     )
     (i64.const -1152921504606846975)
     (v128.const i32x4 0x4c7b0010 0x27220000 0x00000020 0xffffab7b)
     (i32.const -20673)
     (f64.const 9223372036854775808)
    )
   )
  )
 )
 (func $15 (type $36) (result anyref)
  (local $0 (ref null $5))
  (local $1 (ref null $6))
  (local $2 (ref null $16))
  (local $3 eqref)
  (local $4 f32)
  (local $5 i32)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (struct.new_default $18)
 )
 (func $16 (type $17)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (call $15)
  )
 )
 (func $17 (type $4) (param $0 (ref null $0)) (param $1 anyref) (param $2 (ref func)) (result nullref)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 f64)
  (local $8 exnref)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (ref.null none)
 )
 (func $18 (type $17)
  (local $0 (ref string))
  (local $1 (ref $14))
  (local $2 (ref eq))
  (local $3 (ref $3))
  (local $4 (ref $10))
  (local $5 stringref)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 i32)
  (local $11 i32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (drop
   (call $17
    (struct.new $0
     (ref.func $17)
     (if (result (ref func))
      (i32.eqz
       (i32.gt_s
        (i32.const 12836)
        (string.measure_wtf16
         (local.tee $0
          (global.get $global$23)
         )
        )
       )
      )
      (then
       (drop
        (try $__t_5 (result i32) (do
          (i32.const 9)
         ) (catch $tag$0
(local.set $6 (f64.mul (pop f64) (f64.const 25)))
(if (global.get $__rt) (then (rethrow $__t_5)))
(i32.const 211)))
       )
       (drop
        (try_table (result (ref $4))
         (struct.get $14 0
          (local.tee $1
           (struct.new $14
            (ref.as_non_null
             (ref.null nofunc)
            )
            (ref.as_non_null
             (ref.null nofunc)
            )
            (ref.as_non_null
             (ref.null none)
            )
            (f32.const -33554432)
            (local.get $10)
            (i32.const 114)
           )
          )
         )
        )
       )
       (drop
        (ref.null nofunc)
       )
       (block
        (f64.store offset=22 align=4
         (i32.and
          (try $__t_4 (result i32) (do
            (ref.eq
             (ref.i31
              (i32.const 148)
             )
             (local.tee $2
              (local.tee $3
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
           ) (catch $tag$0
(local.set $7 (pop f64))
(if (global.get $__rt) (then (rethrow $__t_4)))
(ref.eq
             (ref.as_non_null
              (ref.null none)
             )
             (array.new_fixed $15 0)
            )) (catch $tag$1
(local.set $8 (local.tee $8 (pop f64)))
(if (global.get $__rt) (then (rethrow $__t_4)))
(local.get $10)))
          (i32.const 15)
         )
         (block (result f64)
          (atomic.fence)
          (f64.const -nan:0xfffffffeb2434)
         )
        )
        (return)
       )
       (local.set $3
        (local.set $4
         (unreachable)
        )
       )
      )
      (else
       (ref.func $5)
      )
     )
    )
    (ref.null none)
    (ref.func $14)
   )
  )
 )
 (func $19 (type $21) (param $0 (ref $7)) (param $1 (ref $21)) (param $2 f64) (param $3 f64) (result (ref $3) (ref $3) i64 v128 i32 f64)
  (local $4 (ref null $5))
  (local $5 i31ref)
  (local $6 (ref null $4))
  (local $7 i32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (tuple.make 6
   (array.new_default $3
    (i32.and
     (i32.const 35)
     (i32.const 1023)
    )
   )
   (array.new $5
    (struct.new $6
     (ref.func $17)
     (ref.null nofunc)
     (struct.new $2
      (ref.func $17)
      (ref.func $5)
      (struct.new $0
       (ref.func $17)
       (ref.null nofunc)
      )
      (i32.const -8)
     )
     (global.get $global$4)
     (i64.const -22441)
    )
    (i32.and
     (i32.const 7)
     (i32.const 1023)
    )
   )
   (i64.const -77)
   (v128.const i32x4 0xffffffff 0xffffffbf 0x00000020 0x00000000)
   (i32.const -1540076227)
   (f64.const -4314365)
  )
 )
 (func $20 (type $20) (param $0 (ref $3)) (param $1 i64) (result i32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $21 (type $17)
  (local $0 (ref string))
  (local $1 (ref string))
  (local $2 (ref $5))
  (local $3 (ref $5))
  (local $4 (ref struct))
  (local $5 nullfuncref)
  (local $6 nullfuncref)
  (local $7 (ref null $13))
  (local $8 (ref extern))
  (local $9 (ref extern))
  (local $10 (ref extern))
  (local $11 (ref extern))
  (local $12 (ref i31))
  (local $13 (ref $13))
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f32)
  (local $scratch nullref)
  (local $scratch_27 i32)
  (local $scratch_28 nullref)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (local.set $13
   (array.new $13
    (struct.new $6
     (ref.func $17)
     (ref.null nofunc)
     (ref.null none)
     (local.get $14)
     (i64.const 0)
    )
    (i32.and
     (i32.const 23)
     (i32.const 1023)
    )
   )
  )
  (drop
   (if (result (ref (exact $4)))
    (i32.eqz
     (i32.const 8192)
    )
    (then
     (if
      (i32.const -128)
      (then
       (block
        (f32.store offset=22 align=2
         (i32.and
          (i32.const 1)
          (i32.const 15)
         )
         (f32.const -nan:0x55012d)
        )
        (call_ref $22
         (i32.const 208501259)
         (ref.func $fimport$1)
        )
       )
       (call $fimport$7
        (ref.func $15)
       )
      )
      (else
       (block $block
        (drop
         (i32.and
          (local.get $14)
          (i32.const 15)
         )
        )
        (loop $label
         (if
          (i32.eqz
           (global.get $global$37)
          )
          (then
           (global.set $global$37
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$37
          (i32.sub
           (global.get $global$37)
           (i32.const 1)
          )
         )
         (block
          (call $fimport$3
           (loop $label1 (result f32)
            (if
             (i32.eqz
              (global.get $global$37)
             )
             (then
              (global.set $global$37
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$37
             (i32.sub
              (global.get $global$37)
              (i32.const 1)
             )
            )
            (try_table (catch_all $label)
             (try $__t_3  (do
               (drop
                (block (result nullref)
                 (local.set $scratch_28
                  (ref.null none)
                 )
                 (local.set $17
                  (block (result i32)
                   (local.set $scratch_27
                    (i32.const -536870912)
                   )
                   (drop
                    (block (result nullref)
                     (local.set $scratch
                      (ref.null none)
                     )
                     (drop
                      (ref.i31
                       (i32.const 69)
                      )
                     )
                     (local.get $scratch)
                    )
                   )
                   (local.get $scratch_27)
                  )
                 )
                 (local.get $scratch_28)
                )
               )
               (if
                (i32.lt_u
                 (i32.add
                  (local.tee $15
                   (local.get $17)
                  )
                  (local.tee $16
                   (local.get $14)
                  )
                 )
                 (array.len
                  (local.tee $3
                   (local.tee $2
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                )
                (then
                 (array.fill $5
                  (local.get $3)
                  (local.get $15)
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (local.get $16)
                 )
                )
               )
              ) (catch $tag$1
               (local.set $19 (f64.abs (pop f64)))
               (local.set $14
                (local.get $14)
               )
              ) (catch_all (if (global.get $__rt) (then (rethrow $__t_3)))
(nop)))
            )
            (br_if $label1
             (i32.eqz
              (ref.is_null
               (ref.func $21)
              )
             )
            )
            (if (result f32)
             (i32.eqz
              (local.get $14)
             )
             (then
              (nop)
              (f32.demote_f64
               (f64.const 89)
              )
             )
             (else
              (call $fimport$7
               (ref.func $21)
              )
              (br $label)
             )
            )
           )
          )
          (br $block)
         )
         (unreachable)
        )
        (unreachable)
       )
      )
     )
     (call $fimport$3
      (local.get $25)
     )
     (ref.func $2)
    )
    (else
     (nop)
     (try $__t_2  (do (try  (do 
       (call $fimport$6
        (array.new_fixed $15 0)
       )
      ) (delegate $__t_2))) (catch $tag$1
(local.set $22 (pop f64))
(if (global.get $__rt) (then (rethrow $__t_2)))
(try_table
        (try_table
         (block
          (nop)
          (return)
         )
         (unreachable)
        )
        (unreachable)
       )
(unreachable)) (catch $tag$0
(local.set $23 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_2)))
(loop $label2
        (if
         (i32.eqz
          (global.get $global$37)
         )
         (then
          (global.set $global$37
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$37
         (i32.sub
          (global.get $global$37)
          (i32.const 1)
         )
        )
        (block
         (call $fimport$4
          (global.get $global$26)
         )
         (nop)
        )
        (drop
         (br_on_null $label2
          (ref.func $5)
         )
        )
        (br_if $label2
         (local.tee $14
          (local.get $14)
         )
        )
        (if
         (local.get $14)
         (then
          (local.set $25
           (f32.const 32115)
          )
          (call_ref $19
           (global.get $global$30)
           (ref.func $fimport$4)
          )
         )
        )
       )))
     (ref.func $17)
    )
   )
  )
  (drop
   (local.tee $5
    (if (result nullfuncref)
     (string.measure_wtf16
      (string.const "\f0\90\8d\88")
     )
     (then
      (loop $label3
       (if
        (i32.eqz
         (global.get $global$37)
        )
        (then
         (global.set $global$37
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$37
        (i32.sub
         (global.get $global$37)
         (i32.const 1)
        )
       )
       (block
        (drop
         (br_on_null $label3
          (local.tee $7
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
        )
        (call $fimport$3
         (call_indirect $0 (type $23)
          (v128.const i32x4 0x5f19f772 0x0000ff9a 0x0004e749 0xffadfff8)
          (i32.const 1)
         )
        )
        (br $label3)
       )
       (unreachable)
      )
      (unreachable)
     )
     (else
      (local.get $6)
     )
    )
   )
  )
  (drop
   (struct.new $12
    (ref.func $17)
    (ref.func $1)
    (array.new $13
     (struct.new $2
      (ref.func $17)
      (ref.func $21)
      (struct.new $0
       (ref.func $4)
       (ref.func $2)
      )
      (i32.const 65535)
     )
     (i32.and
      (i32.const 77)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (local.get $14)
  )
  (drop
   (call_indirect $0 (type $23)
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (ref.cast (ref none)
    (local.tee $7
     (try $__t_1 (result (ref $13)) (do
       (drop
        (ref.as_non_null
         (ref.null none)
        )
       )
       (local.set $13
        (unreachable)
       )
      ) (catch $tag$1
(local.set $24 (f64.add (pop f64) (f64.const 15)))
(if (global.get $__rt) (then (rethrow $__t_1)))
(local.tee $13
        (local.get $13)
       )))
    )
   )
  )
  (drop
   (drop
    (drop
     (drop
      (drop
       (drop
        (call $19
         (block ;; (replaces unreachable ArrayNew we can't emit)
          (drop
           (block ;; (replaces unreachable StructNew we can't emit)
            (drop
             (i64.trunc_f32_u
              (f32.sub
               (unreachable)
               (unreachable)
              )
             )
            )
            (drop
             (unreachable)
            )
            (drop
             (unreachable)
            )
            (drop
             (unreachable)
            )
            (drop
             (unreachable)
            )
            (unreachable)
           )
          )
          (drop
           (i32.and
            (i32.const 58)
            (i32.const 1023)
           )
          )
          (unreachable)
         )
         (ref.func $14)
         (f64.const -67108863.865)
         (f64.const 18446744073709551615)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $22 (type $37) (param $0 i32) (param $1 (ref $11)) (result (ref null $13))
  (local $2 (ref $14))
  (local $3 (ref $14))
  (local $4 (ref $14))
  (local $5 (ref $8))
  (local $6 (ref $6))
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 (ref none))
  (local $10 (ref none))
  (local $11 (ref $13))
  (local $12 f64)
  (local $13 f64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 v128)
  (local $22 i64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (block
   (call $21)
   (return
    (array.new $13
     (struct.new $6
      (ref.func $17)
      (ref.null nofunc)
      (struct.new $2
       (ref.func $2)
       (ref.func $1)
       (struct.new $12
        (ref.func $17)
        (ref.func $1)
        (array.new $13
         (struct.new $6
          (ref.as_non_null
           (ref.null nofunc)
          )
          (ref.null nofunc)
          (ref.null none)
          (local.get $0)
          (i64.const -6027403)
         )
         (i32.and
          (i32.const 25)
          (i32.const 1023)
         )
        )
       )
       (local.get $0)
      )
      (local.get $0)
      (i64.const -8437)
     )
     (i32.and
      (i32.const 0)
      (i32.const 1023)
     )
    )
   )
  )
  (local.set $5
   (local.set $2
    (local.set $3
     (local.set $4
      (unreachable)
     )
    )
   )
  )
 )
 (func $23 (type $38) (result i31ref)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 f64)
  (local $4 v128)
  (local $5 v128)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 i64)
  (local $10 i64)
  (local $11 (ref null $1))
  (local $12 externref)
  (local $13 funcref)
  (local $14 (ref array))
  (local $15 (ref $10))
  (local $16 arrayref)
  (local $17 (ref struct))
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (block
   (return
    (ref.i31
     (i32.const 32766)
    )
   )
  )
  (unreachable)
 )
 (func $24 (type $39) (result f32)
  (local $0 exnref)
  (local $1 f64)
  (local $2 f32)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (if (result f32)
   (i32.eqz
    (i32.const 255)
   )
   (then
    (local.get $2)
   )
   (else
    (call $fimport$3
     (f32.const -nan:0x465156)
    )
    (f32.const 21317)
   )
  )
 )
 (func $25 (type $40) (param $0 (ref $1)) (result (ref null $9))
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 v128)
  (local $14 v128)
  (local $15 v128)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 (ref $14))
  (local $20 (ref $14))
  (local $21 (ref $5))
  (local $22 (ref null $6))
  (local $23 (ref $6))
  (local $24 (ref any))
  (local $25 (ref $8))
  (local $26 (ref null $4))
  (local $27 (ref null $4))
  (local $28 (ref none))
  (local $29 stringref)
  (local $30 nullref)
  (local $scratch (tuple f64 i64 (ref $4)))
  (local $scratch_32 i64)
  (local $scratch_33 f64)
  (if
   (i32.eqz
    (global.get $global$37)
   )
   (then
    (global.set $global$37
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$37
   (i32.sub
    (global.get $global$37)
    (i32.const 1)
   )
  )
  (local.set $20
   (struct.new $14
    (ref.func $17)
    (ref.func $1)
    (array.new $13
     (struct.new $6
      (ref.func $17)
      (ref.null nofunc)
      (struct.new $12
       (ref.func $0)
       (ref.func $1)
       (array.new $13
        (struct.new $6
         (ref.func $2)
         (ref.null nofunc)
         (struct.new $12
          (ref.func $17)
          (ref.func $1)
          (array.new $13
           (struct.new $6
            (ref.func $17)
            (ref.null nofunc)
            (ref.as_non_null
             (ref.null none)
            )
            (local.get $1)
            (i64.const 32767)
           )
           (i32.and
            (i32.const 95)
            (i32.const 1023)
           )
          )
         )
         (local.get $1)
         (i64.const -96)
        )
        (i32.and
         (i32.const 46)
         (i32.const 1023)
        )
       )
      )
      (i32.const -2049)
      (i64.const -9167)
     )
     (i32.and
      (i32.const 24)
      (i32.const 1023)
     )
    )
    (f32.const 1099511627776)
    (i32.const 16777215)
    (global.get $global$13)
   )
  )
  (block (result (ref (exact $9)))
   (struct.set $6 4
    (struct.new $6
     (ref.func $2)
     (ref.null nofunc)
     (struct.new $12
      (ref.func $4)
      (global.get $global$9)
      (array.new $13
       (struct.new $6
        (ref.func $17)
        (ref.null nofunc)
        (struct.new $2
         (local.get $0)
         (ref.null nofunc)
         (struct.new $0
          (ref.func $17)
          (ref.func $25)
         )
         (i32.const 127)
        )
        (i32.const 9)
        (i64.const -417)
       )
       (i32.and
        (i32.const 0)
        (i32.const 1023)
       )
      )
     )
     (i32.const -13797)
     (i64.const -19187)
    )
    (i64.const -9223372036854775807)
   )
   (block (result (ref (exact $9)))
    (nop)
    (call $fimport$8
     (loop $label (result (ref extern))
      (if
       (i32.eqz
        (global.get $global$37)
       )
       (then
        (global.set $global$37
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$37
       (i32.sub
        (global.get $global$37)
        (i32.const 1)
       )
      )
      (block $block (result (ref extern))
       (try $__t_0  (do (try  (do 
         (br_if $label
          (call $20
           (if (result (ref (exact $3)))
            (i32.eqz
             (ref.eq
              (global.get $global$1)
              (array.new $7
               (struct.new $6
                (ref.as_non_null
                 (ref.null nofunc)
                )
                (ref.null nofunc)
                (ref.as_non_null
                 (ref.null none)
                )
                (i32.const -129)
                (i64.const -549755813887)
               )
               (i32.and
                (i32.const 9)
                (i32.const 1023)
               )
              )
             )
            )
            (then
             (br $label)
            )
            (else
             (drop
              (global.get $gimport$0)
             )
             (array.new_default $3
              (i32.and
               (i32.const 69)
               (i32.const 1023)
              )
             )
            )
           )
           (i64.const -1235355)
          )
         )
        ) (delegate $__t_0))) (catch $tag$0
(local.set $7 (f64.mul (pop f64) (f64.const -1)))
(if (global.get $__rt) (then (rethrow $__t_0)))
(memory.init $0
          (i32.and
           (struct.get_s $14 5
            (local.get $20)
           )
           (i32.const 15)
          )
          (i32.const 26)
          (i32.const 0)
         )) (catch $tag$1
(local.set $8 (local.tee $8 (pop f64)))
(if (global.get $__rt) (then (rethrow $__t_0)))
(nop)) (catch_all (if (global.get $__rt) (then (rethrow $__t_0)))
(block
          (call $fimport$2
           (block (result i64)
            (nop)
            (local.set $9
             (block (result f64)
              (local.set $scratch_33
               (tuple.extract 3 0
                (local.tee $scratch
                 (if (type $43) (result f64 i64 (ref $4))
                  (local.tee $1
                   (i32.const 65512)
                  )
                  (then
                   (tuple.make 3
                    (f64.const 4294966027)
                    (i64.const -7)
                    (ref.as_non_null
                     (ref.null nofunc)
                    )
                   )
                  )
                  (else
                   (tuple.make 3
                    (local.get $10)
                    (local.get $17)
                    (ref.as_non_null
                     (local.get $27)
                    )
                   )
                  )
                 )
                )
               )
              )
              (local.set $16
               (block (result i64)
                (local.set $scratch_32
                 (tuple.extract 3 1
                  (local.get $scratch)
                 )
                )
                (local.set $26
                 (tuple.extract 3 2
                  (local.get $scratch)
                 )
                )
                (local.get $scratch_32)
               )
              )
              (local.get $scratch_33)
             )
            )
            (local.get $16)
           )
          )
          (br $label)
         )
(unreachable)))
       (nop)
       (br_on_non_null $block
        (global.get $gimport$1)
       )
       (block
        (block
         (nop)
         (call $fimport$1
          (local.tee $1
           (global.get $global$4)
          )
         )
        )
        (br $label)
       )
       (unreachable)
      )
     )
    )
    (array.new_default $9
     (i32.and
      (i32.const 68)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (type $__sinkT_0 (func (param f64) (result f64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (global $__rt (mut i32) (i32.const 0))
)
