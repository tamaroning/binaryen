(module
 (rec
  (type $0 (struct (field f32) (field (mut (ref struct))) (field (ref $2)) (field (ref null $0)) (field f32)))
  (type $1 (array i8))
  (type $2 (sub (struct (field (mut f32)))))
  (type $3 (sub (struct)))
 )
 (type $4 (struct))
 (type $5 (array i8))
 (type $6 (array (mut i16)))
 (type $7 (func))
 (type $8 (func (param i32)))
 (type $9 (func (result f32)))
 (type $10 (func (param stringref i32 externref (ref null $3)) (result i64)))
 (type $11 (func (result f32 i64)))
 (type $12 (func (param i64)))
 (type $13 (func (param f64)))
 (type $14 (func (param funcref)))
 (type $15 (func (result i31ref f64)))
 (type $16 (func (param i64 structref)))
 (type $17 (func (param i32) (result funcref)))
 (type $18 (func (param i32 funcref)))
 (type $19 (func (param f32)))
 (type $20 (func (param v128)))
 (type $21 (func (param anyref)))
 (type $22 (func (param externref)))
 (type $23 (func (param f32) (result funcref v128 i32 i31ref)))
 (type $24 (func (param eqref) (result i64)))
 (type $25 (func (param f64) (result eqref)))
 (type $26 (func (result (ref $1))))
 (type $27 (func (param i32 (ref $2)) (result f64 f32 i64 i64 exnref exnref)))
 (type $28 (func (result arrayref)))
 (type $29 (func (param i64 f32 (ref $0)) (result (ref string))))
 (type $30 (func (result (ref null $3))))
 (type $31 (func (param i32 (ref null $3)) (result f32)))
 (type $32 (func (result (ref null $0))))
 (type $33 (func (param (ref null $0) anyref (ref array) (ref null $0) (ref $3) i64 i64 arrayref) (result (ref eq))))
 (type $34 (func (param f32) (result f32)))
 (type $35 (func (param f64) (result f64)))
 (type $36 (func (param v128) (result v128)))
 (type $37 (func (result funcref v128 i32 i31ref)))
 (type $38 (func (result f64 f32 i64 i64 exnref exnref)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $17) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $18) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $8) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $19) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $13) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $20) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $21) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $14) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $22) (param externref)))
 (global $global$0 anyref (struct.new_default $4))
 (global $global$1 i31ref (ref.null none))
 (global $global$2 (mut (ref null $1)) (array.new $1
  (i32.const -2048)
  (i32.const 11)
 ))
 (global $global$3 (mut f32) (f32.const 4294948096))
 (global $global$4 structref (struct.new_default $4))
 (global $global$5 i32 (i32.const 245))
 (global $global$6 (ref null $1) (array.new $1
  (i32.const -116)
  (i32.const 4)
 ))
 (global $global$7 i32 (i32.const -4194305))
 (global $global$8 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 (i64.const 0) "\7f[9\95g\c7V\a8\fe;MB\e0\9f\acJ")
 (data $1 (i64.const 16) "\aa\d5\f0)kh\cfI\e03\95\a6wh5\d4\96\d8")
 (data $2 "^\15;")
 (data $3 (i64.const 34) "\n\9eFx\9d/!")
 (data $4 (i64.const 41) "}\c1\05")
 (data $5 "\d9\'\97\7f\b5\c8\b8\r\eef\b3<\a6H\ef")
 (table $0 16 funcref)
 (table $1 0 exnref)
 (elem $0 (table $0) (i32.const 0) func $0 $3 $5 $5 $5 $9 $9 $9 $10 $13 $13 $14 $14 $18 $19 $19)
 (elem declare func $fimport$0 $fimport$1 $fimport$6 $fimport$9)
 (tag $tag$0 (type $12) (param i64))
 (tag $tag$1 (type $13) (param f64))
 (tag $tag$2 (type $7))
 (export "global$" (global $global$0))
 (export "global$_1" (global $global$1))
 (export "tag$" (tag $tag$0))
 (export "tag$_1" (tag $tag$1))
 (export "table" (table $0))
 (export "func" (func $0))
 (export "func_invoker" (func $1))
 (export "func_13" (func $2))
 (export "func_14" (func $3))
 (export "func_17_invoker" (func $7))
 (export "func_22" (func $11))
 (export "func_22_invoker" (func $12))
 (export "func_24" (func $13))
 (export "func_26_invoker" (func $16))
 (export "func_28" (func $17))
 (export "func_30_invoker" (func $20))
 (func $0 (type $23) (param $0 f32) (result funcref v128 i32 i31ref)
  (local $1 (ref $0))
  (local $2 anyref)
  (local $3 (ref null $0))
  (local $4 (ref $1))
  (local $5 (ref null $2))
  (local $6 externref)
  (local $7 (ref $3))
  (local $8 eqref)
  (local $9 (ref func))
  (local $10 i31ref)
  (local $11 f32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 v128)
  (local $17 v128)
  (local $18 v128)
  (local $19 f64)
  (local $20 f64)
  (local $scratch i32)
  (local $scratch_22 v128)
  (local $scratch_23 (ref $8))
  (local.set $0
   (call $21
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (tuple.make 4
   (local.tee $9
    (block (result (ref $8))
     (local.set $scratch_23
      (ref.func $fimport$0)
     )
     (local.set $18
      (block (result v128)
       (local.set $scratch_22
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
       (local.set $15
        (block (result i32)
         (local.set $scratch
          (i32.const -84)
         )
         (local.set $10
          (ref.null none)
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
   (local.get $18)
   (local.get $15)
   (local.get $10)
  )
 )
 (func $1 (type $7)
  (local $scratch (tuple funcref v128 i32 i31ref))
  (local $scratch_1 i32)
  (local $scratch_2 v128)
  (local $scratch_3 funcref)
  (local $scratch_4 (tuple funcref v128 i32 i31ref))
  (local $scratch_5 i32)
  (local $scratch_6 v128)
  (local $scratch_7 funcref)
  (local $scratch_8 (tuple funcref v128 i32 i31ref))
  (local $scratch_9 i32)
  (local $scratch_10 v128)
  (local $scratch_11 funcref)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (drop
   (block (result funcref)
    (local.set $scratch_3
     (tuple.extract 4 0
      (local.tee $scratch
       (call $0
        (f32.const 134217728)
       )
      )
     )
    )
    (drop
     (block (result v128)
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
   (block (result funcref)
    (local.set $scratch_7
     (tuple.extract 4 0
      (local.tee $scratch_4
       (call $0
        (f32.const 9003)
       )
      )
     )
    )
    (drop
     (block (result v128)
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
   (block (result funcref)
    (local.set $scratch_11
     (tuple.extract 4 0
      (local.tee $scratch_8
       (call $0
        (f32.const 9223372036854775808)
       )
      )
     )
    )
    (drop
     (block (result v128)
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
 )
 (@binaryen.js.called)
 (func $2 (type $24) (param $0 eqref) (result i64)
  (local $1 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (block (result i64)
   (nop)
   (i64.const 70)
  )
 )
 (func $3 (type $25) (param $0 f64) (result eqref)
  (local $1 (ref null $0))
  (local $2 (ref func))
  (local $3 (ref eq))
  (local $4 structref)
  (local $5 i64)
  (local $6 f64)
  (local $7 i32)
  (local.set $0
   (call $22
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (f64.store offset=4 align=1
   (i64.and
    (i64.and
     (i64.const 127)
     (i64.const 15)
    )
    (try_table (result i64)
     (i64.const -5)
    )
   )
   (f64.const 2587)
  )
  (if
   (ref.is_null
    (array.new_default $1
     (i32.and
      (i32.const 7)
      (i32.const 1023)
     )
    )
   )
   (then
    (drop
     (ref.is_null
      (local.get $4)
     )
    )
    (block
     (f64.store offset=4 align=2
      (i64.and
       (i64.and
        (i64.const 4294946060)
        (i64.const 15)
       )
       (i64.const 15)
      )
      (try_table (result f64)
       (local.get $0)
      )
     )
     (return
      (ref.i31
       (i32.const -2147483647)
      )
     )
    )
    (unreachable)
   )
   (else
    (call $fimport$5
     (f32.const -9007199254740992)
    )
    (return
     (array.new_fixed $5 0)
    )
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $4 (type $26) (result (ref $1))
  (local $0 stringref)
  (local $1 (ref $1))
  (local $2 (ref $1))
  (local $3 (ref $1))
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 v128)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (local.set $1
   (array.new $1
    (local.get $8)
    (i32.and
     (i32.const 19)
     (i32.const 1023)
    )
   )
  )
  (block $block2 (result (ref (exact $1)))
   (call $fimport$4
    (i64.const 39801)
   )
   (try (result (ref (exact $1)))
    (do
     (array.new $1
      (i32.const -118)
      (i32.and
       (i32.const 8)
       (i32.const 1023)
      )
     )
    )
    (catch $tag$0
     (local.set $4 (call $__popsink_0 (pop i64)))
     (if (result (ref none))
      (i32.eqz
       (loop $label (result i32)
        (if
         (i32.eqz
          (global.get $global$8)
         )
         (then
          (global.set $global$8
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$8
         (i32.sub
          (global.get $global$8)
          (i32.const 1)
         )
        )
        (nop)
        (call $fimport$0
         (i32.const 0)
        )
        (block $block
         (drop
          (br_on_null $block
           (struct.new_default $4)
          )
         )
         (call $fimport$7
          (local.tee $9
           (call $23
            (v128.load offset=4 align=8
             (i64.and
              (local.get $5)
              (i64.const 15)
             )
            )
           )
          )
         )
        )
        (br_if $label
         (i32.eqz
          (i8x16.extract_lane_u 7
           (local.tee $9
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
          )
         )
        )
        (if (result i32)
         (i32.const -7812)
         (then
          (call $fimport$9
           (ref.func $fimport$6)
          )
          (drop
           (if (result i32)
            (i32.eqz
             (i32.const -127)
            )
            (then
             (block $block1 (result i32)
              (call $fimport$5
               (f32.const -9223372036854775808)
              )
              (br_if $block1
               (br_if $block1
                (if (result i32)
                 (i32.lt_u
                  (local.tee $7
                   (ref.test (ref (exact $3))
                    (struct.new_default $3)
                   )
                  )
                  (array.len
                   (local.tee $3
                    (local.get $1)
                   )
                  )
                 )
                 (then
                  (array.get_s $1
                   (local.get $3)
                   (local.get $7)
                  )
                 )
                 (else
                  (i32.const -82)
                 )
                )
                (i32.eqz
                 (i32.const -40)
                )
               )
               (ref.eq
                (array.new_fixed $5 0)
                (array.new_default $1
                 (i32.and
                  (i32.const 7)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
            )
            (else
             (i32.load16_u offset=4
              (i64.and
               (i64.const -109)
               (i64.const 15)
              )
             )
            )
           )
          )
          (local.get $8)
         )
         (else
          (nop)
          (br $label)
         )
        )
       )
      )
      (then
       (return
        (array.new $1
         (i32.const -131073)
         (i32.and
          (i32.const 17)
          (i32.const 1023)
         )
        )
       )
      )
      (else
       (loop $label1 (result (ref none))
        (if
         (i32.eqz
          (global.get $global$8)
         )
         (then
          (global.set $global$8
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$8
         (i32.sub
          (global.get $global$8)
          (i32.const 1)
         )
        )
        (struct.set $2 0
         (struct.new_default $2)
         (f32.const 17592186044416)
        )
        (nop)
        (nop)
        (br_if $label1
         (i32.eqz
          (local.get $8)
         )
        )
        (ref.cast (ref none)
         (struct.new $0
          (f32.const 5195)
          (struct.new_default $4)
          (struct.new $2
           (f32.const 4)
          )
          (ref.null none)
          (f32.const 0)
         )
        )
       )
      )
     )
    )
    (catch_all
     (br_on_cast_fail $block2 (ref (exact $1)) (ref (exact $1))
      (array.new $1
       (i32.const -107)
       (i32.and
        (i32.const 18)
        (i32.const 1023)
       )
      )
     )
    )
   )
  )
 )
 (func $5 (type $27) (param $0 i32) (param $1 (ref $2)) (result f64 f32 i64 i64 exnref exnref)
  (local $2 (ref null $0))
  (local $3 (ref $1))
  (local $4 (ref null $3))
  (local $5 arrayref)
  (local $6 eqref)
  (local $7 structref)
  (local $8 (ref array))
  (local $9 v128)
  (local $10 i64)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (nop)
  (call_ref $14
   (ref.null nofunc)
   (ref.func $fimport$9)
  )
  (drop
   (ref.null noexn)
  )
  (return
   (tuple.make 6
    (f64.const 0.12)
    (f32.const 0)
    (i64.const -2147483649)
    (i64.const -8589934592)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$2)
     )
     (unreachable)
    )
    (ref.null noexn)
   )
  )
 )
 (func $6 (type $28) (result arrayref)
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (local $3 f32)
  (local $4 f32)
  (local $5 (ref null $2))
  (local $6 (ref null $2))
  (local $7 structref)
  (local $8 (ref null $0))
  (local $9 (ref $1))
  (local $10 (ref array))
  (local $11 (ref $3))
  (local $12 (ref $3))
  (local $13 (ref $2))
  (local $14 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (i32.const -57)
  )
  (return
   (ref.null none)
  )
 )
 (func $7 (type $7)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
  (drop
   (call $6)
  )
 )
 (func $8 (type $15) (result i31ref f64)
  (local $0 (ref $2))
  (local $1 (ref array))
  (local $2 funcref)
  (local $3 funcref)
  (local $4 externref)
  (local $5 externref)
  (local $6 stringref)
  (local $7 stringref)
  (local $8 (ref eq))
  (local $9 (ref $3))
  (local $10 (ref $1))
  (local $11 (ref $1))
  (local $12 (ref struct))
  (local $13 (ref string))
  (local $14 (ref string))
  (local $15 (ref string))
  (local $16 (ref string))
  (local $17 (ref string))
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f32)
  (local $23 f32)
  (local $24 f32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i64)
  (local $29 i64)
  (local $30 i64)
  (local $31 i64)
  (local $32 i64)
  (local $33 v128)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 2
    (ref.null none)
    (f64.const 1)
   )
  )
 )
 (func $9 (type $29) (param $0 i64) (param $1 f32) (param $2 (ref $0)) (result (ref string))
  (local.set $1
   (call $21
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (return
   (string.const "")
  )
 )
 (func $10 (type $30) (result (ref null $3))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (return
   (ref.null none)
  )
 )
 (func $11 (type $31) (param $0 i32) (param $1 (ref null $3)) (result f32)
  (local $2 (ref null $3))
  (local $3 (ref string))
  (local $4 f32)
  (local $5 i64)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (local.get $4)
 )
 (func $12 (type $7)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (drop
   (call $21
    (call $11
     (i32.const 134217728)
     (struct.new_default $3)
    )
   )
  )
 )
 (func $13 (type $9) (result f32)
  (local $0 i64)
  (local $1 i64)
  (local $2 f32)
  (local $3 (ref null $2))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (return_call $11
   (i32.const 102)
   (loop (result (ref (exact $3)))
    (if
     (i32.eqz
      (global.get $global$8)
     )
     (then
      (global.set $global$8
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$8
     (i32.sub
      (global.get $global$8)
      (i32.const 1)
     )
    )
    (struct.new_default $3)
   )
  )
 )
 (func $14 (type $10) (param $0 stringref) (param $1 i32) (param $2 externref) (param $3 (ref null $3)) (result i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f64)
  (local $9 i64)
  (local $10 eqref)
  (local $11 (ref $0))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$8)
    )
    (then
     (global.set $global$8
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$8
    (i32.sub
     (global.get $global$8)
     (i32.const 1)
    )
   )
   (block $block
    (br_if $block
     (i32.const -7251958)
    )
    (table.set $0
     (i32.const 4)
     (ref.func $14)
    )
   )
   (br_if $label
    (i32.eqz
     (i64.eqz
      (i64.const -6291442)
     )
    )
   )
   (if
    (ref.eq
     (struct.new_default $3)
     (ref.i31
      (i32.const -85)
     )
    )
    (then
     (try
      (do
       (call $fimport$4
        (i64.const -46)
       )
      )
      (catch_all
       (call $fimport$4
        (try_table (result i64) (catch_all $label)
         (i64.const 249)
        )
       )
      )
     )
     (br $label)
    )
    (else
     (nop)
     (br $label)
    )
   )
   (local.set $8
    (local.set $11
     (local.set $9
      (unreachable)
     )
    )
   )
  )
  (unreachable)
 )
 (func $15 (type $11) (result f32 i64)
  (local $0 i32)
  (local $1 i32)
  (local $2 f64)
  (local $3 i64)
  (local $4 (ref null $2))
  (local $5 arrayref)
  (local $6 structref)
  (local $7 funcref)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (block (type $11) (result f32 i64)
   (table.set $0
    (i32.const 1)
    (local.get $7)
   )
   (tuple.make 2
    (f32.const 14)
    (i64.const -28601)
   )
  )
 )
 (func $16 (type $7)
  (local $scratch (tuple f32 i64))
  (local $scratch_1 f32)
  (local $scratch_2 (tuple f32 i64))
  (local $scratch_3 f32)
  (local $scratch_4 (tuple f32 i64))
  (local $scratch_5 f32)
  (local $scratch_6 (tuple f32 i64))
  (local $scratch_7 f32)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (drop
   (block (result f32)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $15)
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
       (call $15)
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
   (block (result f32)
    (local.set $scratch_5
     (tuple.extract 2 0
      (local.tee $scratch_4
       (call $15)
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
   (block (result f32)
    (local.set $scratch_7
     (tuple.extract 2 0
      (local.tee $scratch_6
       (call $15)
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
 )
 (func $17 (type $32) (result (ref null $0))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (struct.new $0
   (f32.const 0)
   (struct.new_default $4)
   (struct.new_default $2)
   (struct.new $0
    (f32.const 0)
    (struct.new_default $4)
    (struct.new_default $2)
    (struct.new $0
     (f32.const -18446744073709551615)
     (struct.new_default $4)
     (struct.new $2
      (f32.const -4194304.5)
     )
     (struct.new $0
      (f32.const 4294967296)
      (struct.new $2
       (f32.const 4294967296)
      )
      (struct.new $2
       (f32.const 0)
      )
      (struct.new $0
       (f32.const 256.04400634765625)
       (struct.new_default $4)
       (struct.new_default $2)
       (ref.null none)
       (f32.const -4194304.5)
      )
      (f32.const -83)
     )
     (f32.const 0)
    )
    (f32.const 0)
   )
   (f32.const -4398046511104)
  )
 )
 (func $18 (type $16) (param $0 i64) (param $1 structref)
  (local $2 externref)
  (local $3 (ref null $0))
  (local $4 (ref func))
  (local $5 funcref)
  (local $6 (ref string))
  (local $7 (ref $2))
  (local $8 (ref null $3))
  (local $9 (ref i31))
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i32)
  (local $22 i32)
  (local $23 f32)
  (local $24 f32)
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
  (local $35 v128)
  (local $scratch i32)
  (local $scratch_37 (ref (exact $3)))
  (local $scratch_38 f64)
  (local $scratch_39 i64)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (local.set $7
   (struct.new_default $2)
  )
  (local.set $6
   (string.const "\c2\a3\c2\a3")
  )
  (block $block
   (call $fimport$8
    (ref.cast (ref (exact $0))
     (select (result (ref (exact $0)))
      (struct.new $0
       (local.get $23)
       (struct.new_default $4)
       (struct.new_default $2)
       (struct.new $0
        (local.get $23)
        (struct.new_default $4)
        (struct.new $2
         (f32.const 0)
        )
        (struct.new $0
         (f32.const 0)
         (struct.new_default $2)
         (struct.new $2
          (local.get $23)
         )
         (struct.new $0
          (f32.const -9)
          (struct.new_default $4)
          (struct.new $2
           (f32.const 63.762001037597656)
          )
          (local.get $3)
          (local.get $23)
         )
         (f32.const -17592186044416)
        )
        (f32.const -86.8740005493164)
       )
       (local.get $23)
      )
      (try_table (result (ref (exact $0))) (catch_all $block)
       (struct.new $0
        (f32.const -35184372088832)
        (struct.new_default $4)
        (struct.new $2
         (local.get $23)
        )
        (ref.null none)
        (local.get $23)
       )
      )
      (if (result i32)
       (i32.const -255)
       (then
        (drop
         (if (result i32)
          (i32.eqz
           (i32.const 8256)
          )
          (then
           (call $fimport$9
            (ref.func $18)
           )
           (i32.load offset=22
            (i64.and
             (i64.div_s
              (if (result i64)
               (try (result i32)
                (do
                 (local.get $21)
                )
                (catch_all
                 (string.measure_wtf16
                  (string.const "\f0\90\8d\88")
                 )
                )
               )
               (then
                (return)
               )
               (else
                (i64.popcnt
                 (call_indirect $0 (type $10)
                  (loop (result (ref string))
                   (if
                    (i32.eqz
                     (global.get $global$8)
                    )
                    (then
                     (global.set $global$8
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$8
                    (i32.sub
                     (global.get $global$8)
                     (i32.const 1)
                    )
                   )
                   (block $block1 (result (ref string))
                    (call $fimport$5
                     (local.get $23)
                    )
                    (try (result (ref string))
                     (do
                      (string.const "")
                     )
                     (catch $tag$0
                      (local.set $11 (i64.mul (pop i64) (i64.const -1)))
                      (loop $label (result (ref string))
                       (if
                        (i32.eqz
                         (global.get $global$8)
                        )
                        (then
                         (global.set $global$8
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$8
                        (i32.sub
                         (global.get $global$8)
                         (i32.const 1)
                        )
                       )
                       (drop
                        (br_on_cast $block1 (ref string) (ref string)
                         (string.const "\e2\82\ac")
                        )
                       )
                       (drop
                        (ref.as_non_null
                         (ref.null none)
                        )
                       )
                       (call $fimport$4
                        (local.get $10)
                       )
                       (br_if $label
                        (try (result i32)
                         (do
                          (i32.const -567995830)
                         )
                         (catch $tag$0
                          (local.set $12 (select (pop i64) (local.get $12) (i32.const 0)))
                          (loop (result i32)
                           (if
                            (i32.eqz
                             (global.get $global$8)
                            )
                            (then
                             (global.set $global$8
                              (i32.const 100)
                             )
                             (unreachable)
                            )
                           )
                           (global.set $global$8
                            (i32.sub
                             (global.get $global$8)
                             (i32.const 1)
                            )
                           )
                           (local.tee $21
                            (i32.const -53)
                           )
                          )
                         )
                         (catch $tag$1
                          (local.set $26
                           (call $22
                            (pop f64)
                           )
                          )
                          (i32.atomic.load16_u acqrel offset=22
                           (i64.and
                            (loop (result i64)
                             (if
                              (i32.eqz
                               (global.get $global$8)
                              )
                              (then
                               (global.set $global$8
                                (i32.const 100)
                               )
                               (unreachable)
                              )
                             )
                             (global.set $global$8
                              (i32.sub
                               (global.get $global$8)
                               (i32.const 1)
                              )
                             )
                             (loop (result i64)
                              (if
                               (i32.eqz
                                (global.get $global$8)
                               )
                               (then
                                (global.set $global$8
                                 (i32.const 100)
                                )
                                (unreachable)
                               )
                              )
                              (global.set $global$8
                               (i32.sub
                                (global.get $global$8)
                                (i32.const 1)
                               )
                              )
                              (local.get $0)
                             )
                            )
                            (i64.const 15)
                           )
                          )
                         )
                        )
                       )
                       (string.const "898\c2\a3\c2\a3")
                      )
                     )
                     (catch $tag$1
                      (local.set $27
                       (call $22
                        (pop f64)
                       )
                      )
                      (ref.cast (ref string)
                       (string.const "\ed\a0\80\ed\a0\80")
                      )
                     )
                     (catch_all
                      (string.const "\ed\bd\88\c2\a3\f0\90\8d\88")
                     )
                    )
                   )
                  )
                  (try (result i32)
                   (do
                    (local.get $21)
                   )
                   (catch $tag$0
                    (throw $tag$0 (pop i64))
                    (try (result i32)
                     (do
                      (stringview_wtf16.get_codeunit
                       (string.const "\f0\90\8d\88\f0\90\8d\88\c2\a3")
                       (block (result i32)
                        (local.set $22
                         (i8x16.extract_lane_u 1
                          (call $23
                           (f64x2.splat
                            (f64.const 35184372088831)
                           )
                          )
                         )
                        )
                        (local.get $22)
                       )
                      )
                     )
                     (catch $tag$1
                      (local.set $28
                       (call $22
                        (pop f64)
                       )
                      )
                      (ref.eq
                       (struct.new $0
                        (f32.const -4294967296)
                        (struct.new $0
                         (f32.const 0)
                         (struct.new_default $4)
                         (ref.as_non_null
                          (ref.null none)
                         )
                         (ref.null none)
                         (f32.const 221)
                        )
                        (struct.new $2
                         (f32.const 122)
                        )
                        (local.get $3)
                        (local.get $23)
                       )
                       (struct.new_default $2)
                      )
                     )
                     (catch $tag$0
                      (local.set $14 (local.tee $14 (pop i64)))
                      (i32.const -16777215)
                     )
                     (catch_all
                      (local.tee $21
                       (ref.test (ref none)
                        (loop $label1 (result (ref none))
                         (if
                          (i32.eqz
                           (global.get $global$8)
                          )
                          (then
                           (global.set $global$8
                            (i32.const 100)
                           )
                           (unreachable)
                          )
                         )
                         (global.set $global$8
                          (i32.sub
                           (global.get $global$8)
                           (i32.const 1)
                          )
                         )
                         (call $fimport$6
                          (local.get $29)
                         )
                         (br_if $label1
                          (i32.eqz
                           (local.get $21)
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
                   (catch_all
                    (i31.get_u
                     (try_table (result (ref i31))
                      (ref.i31
                       (i32.const -94)
                      )
                     )
                    )
                   )
                  )
                  (string.const "\e2\82\ac\c2\a3")
                  (struct.new_default $3)
                  (i32.const 11)
                 )
                )
               )
              )
              (i64.atomic.rmw8.cmpxchg_u acqrel offset=22
               (i64.and
                (loop (result i64)
                 (if
                  (i32.eqz
                   (global.get $global$8)
                  )
                  (then
                   (global.set $global$8
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$8
                  (i32.sub
                   (global.get $global$8)
                   (i32.const 1)
                  )
                 )
                 (block (result i64)
                  (drop
                   (array.new $1
                    (local.get $21)
                    (i32.and
                     (i32.const 0)
                     (i32.const 1023)
                    )
                   )
                  )
                  (local.get $0)
                 )
                )
                (i64.const 15)
               )
               (loop $label2 (result i64)
                (if
                 (i32.eqz
                  (global.get $global$8)
                 )
                 (then
                  (global.set $global$8
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$8
                 (i32.sub
                  (global.get $global$8)
                  (i32.const 1)
                 )
                )
                (block $block2 (result i64)
                 (call $fimport$6
                  (loop $label3 (result f64)
                   (if
                    (i32.eqz
                     (global.get $global$8)
                    )
                    (then
                     (global.set $global$8
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$8
                    (i32.sub
                     (global.get $global$8)
                     (i32.const 1)
                    )
                   )
                   (memory.copy
                    (i64.ctz
                     (local.get $10)
                    )
                    (i64.and
                     (i64.const -1099436)
                     (i64.const 15)
                    )
                    (try_table (result i64) (catch $tag$0 $block2) (catch $tag$0 $block2) (catch_all $label2)
                     (i64.atomic.load16_u acqrel offset=4
                      (i64.and
                       (local.get $0)
                       (i64.const 15)
                      )
                     )
                    )
                   )
                   (call $fimport$3
                    (local.tee $21
                     (i32.const -96)
                    )
                   )
                   (br_if $label3
                    (string.encode_wtf16_array
                     (local.tee $6
                      (string.const "\c2\a3\ed\a0\80")
                     )
                     (array.new_default $6
                      (i32.and
                       (i32.const 13)
                       (i32.const 1023)
                      )
                     )
                     (ref.eq
                      (try (result (ref $2))
                       (do
                        (local.tee $7
                         (select (result (ref none))
                          (ref.as_non_null
                           (ref.null none)
                          )
                          (ref.as_non_null
                           (ref.null none)
                          )
                          (i32.const -2147483648)
                         )
                        )
                       )
                       (catch $tag$0
                        (local.set $15 (call_ref $__sinkT_0 (pop i64) (ref.func $__popsink_0)))
                        (block (result (ref $2))
                         (call $fimport$6
                          (local.get $29)
                         )
                         (local.get $7)
                        )
                       )
                       (catch $tag$1
                        (local.set $30
                         (call $22
                          (pop f64)
                         )
                        )
                        (struct.new_default $2)
                       )
                       (catch_all
                        (struct.new_default $2)
                       )
                      )
                      (block (result (ref $2))
                       (drop
                        (br_on_null $label2
                         (local.tee $8
                          (ref.null none)
                         )
                        )
                       )
                       (drop
                        (br_on_null $label3
                         (ref.func $fimport$1)
                        )
                       )
                       (try (result (ref $2))
                        (do
                         (local.get $7)
                        )
                        (catch $tag$0
                         (local.set $16 (local.tee $16 (pop i64)))
                         (local.get $7)
                        )
                        (catch_all
                         (local.get $7)
                        )
                       )
                      )
                     )
                    )
                   )
                   (call $22
                    (f64.mul
                     (block $block3 (result f64)
                      (call $fimport$9
                       (select (result funcref)
                        (ref.null nofunc)
                        (call $fimport$1
                         (block (result i32)
                          (call $fimport$9
                           (ref.null nofunc)
                          )
                          (local.get $21)
                         )
                        )
                        (local.get $21)
                       )
                      )
                      (try
                       (do
                        (br_if $label3
                         (local.get $21)
                        )
                       )
                       (catch $tag$1
                        (local.set $31
                         (call $22
                          (pop f64)
                         )
                        )
                        (call $fimport$9
                         (ref.func $18)
                        )
                       )
                       (catch $tag$0
                        (local.set $17 (local.tee $17 (pop i64)))
                        (call $fimport$7
                         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                        )
                       )
                       (catch_all
                        (call $fimport$3
                         (string.compare
                          (try_table (result (ref string)) (catch_all $label3)
                           (local.get $6)
                          )
                          (local.get $6)
                         )
                        )
                       )
                      )
                      (br_if $block3
                       (local.tee $29
                        (local.get $29)
                       )
                       (i32.eqz
                        (loop (result i32)
                         (if
                          (i32.eqz
                           (global.get $global$8)
                          )
                          (then
                           (global.set $global$8
                            (i32.const 100)
                           )
                           (unreachable)
                          )
                         )
                         (global.set $global$8
                          (i32.sub
                           (global.get $global$8)
                           (i32.const 1)
                          )
                         )
                         (block (result i32)
                          (call $fimport$7
                           (try_table (result v128) (catch $tag$1 $block3) (catch $tag$1 $block3) (catch_all $label3)
                            (local.get $35)
                           )
                          )
                          (local.get $21)
                         )
                        )
                       )
                      )
                     )
                     (f64.const 0)
                    )
                   )
                  )
                 )
                 (br $label2)
                )
               )
               (try (result i64)
                (do
                 (local.tee $10
                  (if (result i64)
                   (i32.eqz
                    (if (result i32)
                     (i32.eqz
                      (local.tee $21
                       (ref.eq
                        (ref.cast (ref none)
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                        (struct.new_default $2)
                       )
                      )
                     )
                     (then
                      (local.get $21)
                     )
                     (else
                      (call $fimport$10
                       (loop $label4 (result externref)
                        (if
                         (i32.eqz
                          (global.get $global$8)
                         )
                         (then
                          (global.set $global$8
                           (i32.const 100)
                          )
                          (unreachable)
                         )
                        )
                        (global.set $global$8
                         (i32.sub
                          (global.get $global$8)
                          (i32.const 1)
                         )
                        )
                        (call $fimport$5
                         (if (result f32)
                          (i32.eqz
                           (i32.const -255)
                          )
                          (then
                           (f32.const 0)
                          )
                          (else
                           (local.get $23)
                          )
                         )
                        )
                        (call $fimport$10
                         (local.tee $2
                          (string.const "\ed\a0\80")
                         )
                        )
                        (drop
                         (local.get $21)
                        )
                        (br $label4)
                       )
                      )
                      (block
                       (return)
                      )
                      (local.set $9
                       (unreachable)
                      )
                     )
                    )
                   )
                   (then
                    (loop $label5
                     (if
                      (i32.eqz
                       (global.get $global$8)
                      )
                      (then
                       (global.set $global$8
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$8
                      (i32.sub
                       (global.get $global$8)
                       (i32.const 1)
                      )
                     )
                     (br $label5)
                    )
                    (unreachable)
                   )
                   (else
                    (block
                     (call $fimport$9
                      (local.get $5)
                     )
                     (drop
                      (string.const "\c2\a3\f0\90\8d\88\c2\a3")
                     )
                     (block
                      (call $fimport$8
                       (local.get $3)
                      )
                      (return)
                     )
                     (unreachable)
                    )
                    (unreachable)
                   )
                  )
                 )
                )
                (catch $tag$0
                 (local.set $18 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $18))))
                 (try (result i64)
                  (do
                   (i64.const 18014398509481984)
                  )
                  (catch $tag$0
                   (local.set $19 (local.tee $19 (pop i64)))
                   (local.get $10)
                  )
                  (catch $tag$1
                   (local.set $33
                    (call $22
                     (pop f64)
                    )
                   )
                   (i64.extend_i32_u
                    (string.measure_wtf16
                     (string.const "")
                    )
                   )
                  )
                 )
                )
                (catch_all
                 (i64.const 1152921504606846977)
                )
               )
              )
             )
             (i64.const 15)
            )
           )
          )
          (else
           (call $fimport$0
            (i32.const -41)
           )
           (br $block)
          )
         )
        )
        (if (result i32)
         (loop $label7 (result i32)
          (if
           (i32.eqz
            (global.get $global$8)
           )
           (then
            (global.set $global$8
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$8
           (i32.sub
            (global.get $global$8)
            (i32.const 1)
           )
          )
          (block $block4
           (drop
            (br_on_null $block4
             (loop $label6 (result (ref (exact $2)))
              (if
               (i32.eqz
                (global.get $global$8)
               )
               (then
                (global.set $global$8
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$8
               (i32.sub
                (global.get $global$8)
                (i32.const 1)
               )
              )
              (call $fimport$10
               (string.const "\f0\90\8d\88")
              )
              (br_if $label6
               (i32.eqz
                (local.tee $21
                 (ref.eq
                  (struct.new_default $3)
                  (struct.new_default $2)
                 )
                )
               )
              )
              (struct.new $2
               (local.get $23)
              )
             )
            )
           )
           (block
            (call $fimport$0
             (i32.const -257)
            )
            (br $block4)
           )
           (unreachable)
          )
          (drop
           (string.const "\f0\90\8d\88\c2\a3\f0\90\8d\88")
          )
          (drop
           (select (result (ref (exact $6)))
            (loop (result (ref (exact $6)))
             (if
              (i32.eqz
               (global.get $global$8)
              )
              (then
               (global.set $global$8
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$8
              (i32.sub
               (global.get $global$8)
               (i32.const 1)
              )
             )
             (block (result (ref (exact $6)))
              (local.set $29
               (local.get $29)
              )
              (array.new $6
               (local.get $21)
               (i32.and
                (i32.const 23)
                (i32.const 1023)
               )
              )
             )
            )
            (array.new_default $6
             (i32.and
              (i32.const 2)
              (i32.const 1023)
             )
            )
            (i32.atomic.load offset=3
             (i64.and
              (i64.const -12197)
              (i64.const 15)
             )
            )
           )
          )
          (drop
           (local.get $21)
          )
          (drop
           (block (result i64)
            (local.set $scratch_39
             (i64.const 32767)
            )
            (drop
             (block (result f64)
              (local.set $scratch_38
               (f64.const -17179869184.845)
              )
              (drop
               (block (result (ref (exact $3)))
                (local.set $scratch_37
                 (struct.new_default $3)
                )
                (local.set $22
                 (block (result i32)
                  (local.set $scratch
                   (i32.const 255)
                  )
                  (drop
                   (f32.const -549755813888)
                  )
                  (local.get $scratch)
                 )
                )
                (local.get $scratch_37)
               )
              )
              (local.get $scratch_38)
             )
            )
            (local.get $scratch_39)
           )
          )
          (drop
           (local.get $22)
          )
          (if
           (if (result i32)
            (stringview_wtf16.get_codeunit
             (local.get $6)
             (block (result i32)
              (local.set $22
               (i32.const -3068397)
              )
              (local.get $22)
             )
            )
            (then
             (call $fimport$6
              (call $22
               (f64.load offset=22 align=2
                (i64.and
                 (local.get $0)
                 (i64.const 15)
                )
               )
              )
             )
             (block
              (call $fimport$6
               (call $22
                (f64.add
                 (try_table (result f64) (catch_all $label7)
                  (f64.const 90)
                 )
                 (local.get $29)
                )
               )
              )
              (br $label7)
             )
             (unreachable)
            )
            (else
             (local.get $21)
            )
           )
           (then
            (call $fimport$9
             (local.tee $5
              (local.get $5)
             )
            )
            (br $label7)
           )
           (else
            (call $fimport$0
             (i32.const 0)
            )
            (br $label7)
           )
          )
          (unreachable)
         )
         (then
          (i32.load offset=4 align=2
           (i64.and
            (i64.const 4294967295)
            (i64.const 15)
           )
          )
         )
         (else
          (call $fimport$6
           (f64.const 1152921504606846976)
          )
          (br $block)
         )
        )
       )
       (else
        (nop)
        (local.get $21)
       )
      )
     )
    )
   )
   (atomic.fence acqrel)
  )
 )
 (func $19 (type $33) (param $0 (ref null $0)) (param $1 anyref) (param $2 (ref array)) (param $3 (ref null $0)) (param $4 (ref $3)) (param $5 i64) (param $6 i64) (param $7 arrayref) (result (ref eq))
  (local $8 (ref null $3))
  (local $9 (ref eq))
  (local $10 (ref $2))
  (local $11 funcref)
  (local $12 externref)
  (local $13 (ref null $0))
  (local $14 i32)
  (local $15 f32)
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (loop (result (ref (exact $4)))
   (if
    (i32.eqz
     (global.get $global$8)
    )
    (then
     (global.set $global$8
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$8
    (i32.sub
     (global.get $global$8)
     (i32.const 1)
    )
   )
   (struct.new_default $4)
  )
 )
 (func $20 (type $7)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 f32)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f64)
  (local $22 f64)
  (local $23 v128)
  (local $24 v128)
  (local $25 (ref null $1))
  (local $26 (ref null $2))
  (local $27 (ref null $3))
  (local $28 (ref $1))
  (local $29 (ref $1))
  (local $30 (ref $1))
  (local $31 (ref $1))
  (local $32 (ref $1))
  (local $33 nullref)
  (local $34 (ref null $0))
  (local $35 (ref $0))
  (local $36 (ref $0))
  (local $37 (ref struct))
  (local $38 (ref string))
  (local $39 (ref i31))
  (if
   (i32.eqz
    (global.get $global$8)
   )
   (then
    (global.set $global$8
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$8
   (i32.sub
    (global.get $global$8)
    (i32.const 1)
   )
  )
  (local.set $36
   (ref.as_non_null
    (local.get $34)
   )
  )
  (local.set $35
   (local.get $36)
  )
  (local.set $34
   (local.get $36)
  )
  (local.set $25
   (ref.as_non_null
    (local.get $25)
   )
  )
  (drop
   (call $19
    (struct.new $0
     (f32.const -9223372036854775808)
     (struct.new $0
      (f32.const -3402823466385288598117041e14)
      (struct.new_default $4)
      (select (result (ref (exact $2)))
       (struct.new $2
        (f32.const 8589934592)
       )
       (struct.new $2
        (f32.const 0)
       )
       (memory.atomic.notify offset=4
        (i64.and
         (select
          (i64x2.extract_lane 1
           (v128.const i32x4 0x47454e00 0xc2d00000 0x473a6600 0xcf000000)
          )
          (local.tee $0
           (i64.load16_s offset=22
            (call_indirect $0 (type $10)
             (string.const "902\ed\bd\88\c2\a3")
             (ref.eq
              (block (result (ref $1))
               (try_table
                (nop)
               )
               (ref.as_non_null
                (local.tee $25
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
             (string.const "\c2\a3")
             (ref.null none)
             (i32.const 11)
            )
           )
          )
          (i32.const -127)
         )
         (i64.const 15)
        )
        (local.get $7)
       )
      )
      (struct.new $0
       (f32.const -1218288128)
       (struct.new_default $4)
       (struct.new_default $2)
       (ref.null none)
       (f32.const 9223372036854775808)
      )
      (local.get $14)
     )
     (if (result (ref $2))
      (local.tee $7
       (local.get $7)
      )
      (then
       (block $block (result (ref $2))
        (call $fimport$0
         (i32.const 0)
        )
        (loop $label
         (if
          (i32.eqz
           (global.get $global$8)
          )
          (then
           (global.set $global$8
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$8
          (i32.sub
           (global.get $global$8)
           (i32.const 1)
          )
         )
         (local.set $14
          (block (result f32)
           (nop)
           (try (result f32)
            (do
             (call $21
              (struct.get $2 0
               (br_on_cast_fail $block (ref (exact $2)) (ref (exact $2))
                (struct.new $2
                 (select
                  (f32.const -0.7849999666213989)
                  (local.get $14)
                  (ref.eq
                   (ref.as_non_null
                    (local.tee $26
                     (try_table (result (ref none)) (catch_all $label)
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                   )
                   (loop (result (ref (exact $5)))
                    (if
                     (i32.eqz
                      (global.get $global$8)
                     )
                     (then
                      (global.set $global$8
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$8
                     (i32.sub
                      (global.get $global$8)
                      (i32.const 1)
                     )
                    )
                    (array.new_fixed $5 0)
                   )
                  )
                 )
                )
               )
              )
             )
            )
            (catch $tag$0
             (local.set $1 (select (pop i64) (local.get $1) (i32.const 1)))
             (drop
              (br_on_cast $block (ref (exact $2)) (ref (exact $2))
               (struct.new $2
                (f32.const -29)
               )
              )
             )
             (call $21
              (f32.div
               (call $21
                (f32.trunc
                 (f32.const -1152921504606846976)
                )
               )
               (try (result f32)
                (do
                 (local.tee $14
                  (call $21
                   (call $13)
                  )
                 )
                )
                (catch $tag$1
                 (local.set $15
                  (call $22
                   (pop f64)
                  )
                 )
                 (call $21
                  (f32.load offset=22 align=1
                   (i64.and
                    (local.get $0)
                    (i64.const 15)
                   )
                  )
                 )
                )
                (catch_all
                 (call $21
                  (f32.abs
                   (local.get $14)
                  )
                 )
                )
               )
              )
             )
            )
            (catch_all
             (if (result f32)
              (ref.eq
               (struct.new_default $2)
               (loop (result (ref $1))
                (if
                 (i32.eqz
                  (global.get $global$8)
                 )
                 (then
                  (global.set $global$8
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$8
                 (i32.sub
                  (global.get $global$8)
                  (i32.const 1)
                 )
                )
                (block $block1 (result (ref $1))
                 (loop $label1
                  (if
                   (i32.eqz
                    (global.get $global$8)
                   )
                   (then
                    (global.set $global$8
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$8
                   (i32.sub
                    (global.get $global$8)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label1
                   (local.get $7)
                  )
                 )
                 (nop)
                 (br_if $block1
                  (ref.as_non_null
                   (local.get $25)
                  )
                  (i32.eqz
                   (local.get $7)
                  )
                 )
                )
               )
              )
              (then
               (drop
                (br_on_null $label
                 (try_table (result (ref (exact $2))) (catch_all $label)
                  (struct.new $2
                   (f32.const 1.1480000019073486)
                  )
                 )
                )
               )
               (br $label)
              )
              (else
               (call $21
                (f32x4.extract_lane 0
                 (local.tee $23
                  (local.get $24)
                 )
                )
               )
              )
             )
            )
           )
          )
         )
         (br_if $label
          (i32.const -104)
         )
        )
        (nop)
        (try (result (ref $2))
         (do
          (ref.as_non_null
           (local.tee $26
            (ref.as_non_null
             (local.get $26)
            )
           )
          )
         )
         (catch $tag$0
          (drop (pop i64))
          (try (result (ref $2))
           (do
            (loop (result (ref (exact $2)))
             (if
              (i32.eqz
               (global.get $global$8)
              )
              (then
               (global.set $global$8
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$8
              (i32.sub
               (global.get $global$8)
               (i32.const 1)
              )
             )
             (block (result (ref (exact $2)))
              (call $fimport$0
               (i32.const -7595)
              )
              (struct.new $2
               (call $21
                (call_indirect $0 (type $9)
                 (i32.const 9)
                )
               )
              )
             )
            )
           )
           (catch $tag$0
            (local.set $3 (i64.xor (pop i64) (i64.const 27)))
            (drop
             (br_on_cast $block (ref $2) (ref $2)
              (ref.as_non_null
               (local.tee $26
                (ref.as_non_null
                 (local.get $26)
                )
               )
              )
             )
            )
            (ref.cast (ref (exact $2))
             (br_if $block
              (if (result (ref (exact $2)))
               (stringview_wtf16.get_codeunit
                (if (result (ref string))
                 (local.tee $7
                  (if (result i32)
                   (i32.lt_u
                    (local.tee $8
                     (local.get $7)
                    )
                    (array.len
                     (local.tee $28
                      (ref.as_non_null
                       (local.get $25)
                      )
                     )
                    )
                   )
                   (then
                    (array.get_u $1
                     (local.get $28)
                     (local.get $8)
                    )
                   )
                   (else
                    (i32.const 16385)
                   )
                  )
                 )
                 (then
                  (string.const "\ed\bd\88")
                 )
                 (else
                  (memory.fill
                   (i64.and
                    (local.get $0)
                    (i64.const 15)
                   )
                   (local.get $7)
                   (i64.trunc_sat_f64_u
                    (f64.const 0.78)
                   )
                  )
                  (return)
                 )
                )
                (block (result i32)
                 (local.set $13
                  (select
                   (local.get $7)
                   (ref.eq
                    (struct.new $0
                     (f32.const 252)
                     (struct.new_default $4)
                     (ref.as_non_null
                      (local.get $26)
                     )
                     (ref.as_non_null
                      (ref.null none)
                     )
                     (local.get $14)
                    )
                    (ref.as_non_null
                     (local.get $25)
                    )
                   )
                   (loop $label2 (result i32)
                    (if
                     (i32.eqz
                      (global.get $global$8)
                     )
                     (then
                      (global.set $global$8
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$8
                     (i32.sub
                      (global.get $global$8)
                      (i32.const 1)
                     )
                    )
                    (call_indirect $0 (type $16)
                     (block (result i64)
                      (nop)
                      (i64.const 63)
                     )
                     (ref.null none)
                     (i32.const 13)
                    )
                    (br_if $label2
                     (i32.eqz
                      (local.get $7)
                     )
                    )
                    (local.get $7)
                   )
                  )
                 )
                 (local.get $13)
                )
               )
               (then
                (nop)
                (struct.new_default $2)
               )
               (else
                (struct.new $2
                 (local.get $14)
                )
               )
              )
              (i32.eqz
               (ref.test (ref $3)
                (ref.as_non_null
                 (local.tee $27
                  (struct.new_default $3)
                 )
                )
               )
              )
             )
            )
           )
           (catch $tag$1
            (local.set $16
             (call $22
              (pop f64)
             )
            )
            (ref.as_non_null
             (local.get $26)
            )
           )
           (catch_all
            (struct.new_default $2)
           )
          )
         )
         (catch $tag$1
          (local.set $17
           (call $22
            (pop f64)
           )
          )
          (struct.new $2
           (f32.const 0)
          )
         )
         (catch_all
          (struct.new_default $2)
         )
        )
       )
      )
      (else
       (select (result (ref (exact $2)))
        (struct.new_default $2)
        (struct.new_default $2)
        (i32.const -5283839)
       )
      )
     )
     (struct.new $0
      (f32.const -8796093022208)
      (struct.new $2
       (local.get $14)
      )
      (struct.new $2
       (f32.const 8388609)
      )
      (struct.new $0
       (local.get $14)
       (struct.new_default $4)
       (struct.new $2
        (f32.const 1)
       )
       (ref.null none)
       (local.get $14)
      )
      (local.get $14)
     )
     (local.tee $14
      (f32.const 16777216)
     )
    )
    (ref.i31
     (i32.const 105)
    )
    (array.new_fixed $5 0)
    (struct.new $0
     (select
      (block (result f32)
       (call $fimport$0
        (i32.const 0)
       )
       (f32.const -2147483648)
      )
      (call $21
       (f32.demote_f64
        (f64.const -1)
       )
      )
      (ref.eq
       (ref.as_non_null
        (local.get $26)
       )
       (ref.cast (ref (exact $2))
        (struct.new $2
         (local.get $14)
        )
       )
      )
     )
     (struct.new_default $4)
     (struct.new_default $2)
     (struct.new $0
      (f32.const 240)
      (struct.new_default $4)
      (struct.new $2
       (f32.const 17592186044416)
      )
      (struct.new $0
       (local.get $14)
       (struct.new_default $4)
       (struct.new_default $2)
       (struct.new $0
        (f32.const 9223372036854775808)
        (struct.new_default $4)
        (ref.as_non_null
         (local.get $26)
        )
        (struct.new $0
         (local.get $14)
         (struct.new_default $4)
         (struct.new $2
          (local.get $14)
         )
         (struct.new $0
          (local.get $14)
          (struct.new_default $4)
          (struct.new_default $2)
          (ref.null none)
          (local.get $14)
         )
         (local.get $14)
        )
        (local.get $14)
       )
       (local.get $14)
      )
      (local.get $14)
     )
     (call $21
      (call_indirect $0 (type $9)
       (i32.const 9)
      )
     )
    )
    (struct.new_default $3)
    (i64.const -65536)
    (i64.const -16022)
    (array.new_fixed $5 0)
   )
  )
  (loop
   (if
    (i32.eqz
     (global.get $global$8)
    )
    (then
     (global.set $global$8
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$8
    (i32.sub
     (global.get $global$8)
     (i32.const 1)
    )
   )
   (nop)
   (return)
  )
  (local.set $32
   (local.set $35
    (local.set $39
     (local.set $31
      (local.set $38
       (local.set $37
        (local.set $35
         (local.set $36
          (local.set $30
           (local.set $29
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
 (func $21 (type $34) (param $0 f32) (result f32)
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
 (func $22 (type $35) (param $0 f64) (result f64)
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
 (func $23 (type $36) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param i64) (result i64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
