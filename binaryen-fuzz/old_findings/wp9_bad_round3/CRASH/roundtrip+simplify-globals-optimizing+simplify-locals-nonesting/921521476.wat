(module
 (rec
  (type $0 (func))
  (type $1 (sub (func (result (ref null $3)))))
  (type $2 (array (ref null $1)))
  (type $3 (sub (struct (field (mut (ref null $1))) (field (ref null $1)) (field f32) (field (mut i32)) (field (mut v128)))))
 )
 (type $4 (struct (field arrayref) (field (ref null $2)) (field (ref $2)) (field (mut f32)) (field f64)))
 (type $5 (array i8))
 (type $6 (func))
 (type $7 (struct))
 (type $8 (func (param i64)))
 (type $9 (func (param i32)))
 (type $10 (func (result (ref null $1) f64 (ref null $0) funcref (ref null $1))))
 (type $11 (func (param f32)))
 (type $12 (func (param f64)))
 (type $13 (func (param v128)))
 (type $14 (func (param anyref)))
 (type $15 (func (param funcref)))
 (type $16 (func (param externref)))
 (type $17 (func (param arrayref anyref) (result v128)))
 (type $18 (func (param (ref null $4) i32) (result (ref $3))))
 (type $19 (func (param (ref $4) v128) (result stringref)))
 (type $20 (func (param stringref) (result (ref $2))))
 (type $21 (func (result (ref $1))))
 (type $22 (func (param (ref $2)) (result (ref null $1))))
 (type $23 (func (param f32) (result f32)))
 (type $24 (func (param f64) (result f64)))
 (type $25 (func (param v128) (result v128)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_11" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $9) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $9) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $8) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $11) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $12) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $13) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $14) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $15) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $16) (param externref)))
 (global $global$0 (mut v128) (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$1 i32 (i32.const -25))
 (global $global$2 f32 (f32.const 8))
 (global $global$3 (ref null $0) (ref.func $0))
 (global $global$4 (ref $4) (struct.new $4
  (array.new_fixed $5 0)
  (array.new_default $2
   (i32.const 92)
  )
  (array.new $2
   (ref.null nofunc)
   (i32.const 91)
  )
  (f32.const 0)
  (f64.const 0)
 ))
 (global $global$5 (mut i64) (i64.const -32767))
 (global $global$6 i32 (i32.const -67108864))
 (global $global$7 exnref (ref.null noexn))
 (global $global$8 i32 (i32.const -67))
 (global $global$9 f64 (f64.const -18319))
 (global $global$10 (mut externref) (string.const "949925"))
 (global $global$11 i32 (i32.const -256))
 (global $global$12 v128 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$13 i64 (i64.const -17408))
 (global $global$14 (mut structref) (struct.new_default $7))
 (global $global$15 (mut arrayref) (array.new_fixed $5 0))
 (global $global$16 (mut (ref null $3)) (struct.new $3
  (ref.func $1)
  (ref.func $1)
  (f32.const -1023.7860107421875)
  (i32.const 6505)
  (v128.const i32x4 0xfda285f9 0x4a8dffaa 0x000100ff 0x000100ff)
 ))
 (global $global$17 (mut f32) (f32.const 135))
 (global $global$18 (mut i32) (i32.const -27))
 (global $global$19 (mut i32) (i32.const -21126))
 (global $global$20 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 (i64.const 0) "C\a7N\0fL\e9\9a\9f\"3|Ts`!\84")
 (data $1 (i64.const 16) "\1c2\dc\dc\ce\\\00\b9fA\bb\f3\e6\f3u\7f\b6")
 (data $2 "by\a4\c4\e2\e0mU\1d\8d?\f7Y^p\84\c8\ca\b2\aeN\d5\c7\a8\f5")
 (data $3 "\b2M>\f1S\99\1d%\e4\1e\e6\18>\ddW6W\ce\0b_s\be\da\d5\c1\be\d6")
 (data $4 (i64.const 33) "\8d\8d\ef\8f/\ae\12\ed<\c0\8f\9c\bc\94^\ac\f6\ed\90\c6\ed\ba\e2\n3\e6\a0\86\'\e6")
 (data $5 "\0e.\f7")
 (data $6 "\cf\13VD\fb\fb\c9\b7l\f5\08\e7\8d5")
 (table $0 i64 9 9 funcref)
 (table $1 5 exnref)
 (elem $0 (table $0) (i64.const 0) func $3 $5 $6 $10 $18 $18)
 (elem declare func $1 $2)
 (tag $tag$0 (type $8) (param i64))
 (export "global$" (global $global$0))
 (export "global$_3" (global $global$5))
 (export "global$_5" (global $global$10))
 (export "global$_6" (global $global$11))
 (export "tag$" (tag $tag$0))
 (export "ref_func_target_invoker" (func $2))
 (export "func" (func $3))
 (export "func_invoker" (func $4))
 (export "func_15" (func $6))
 (export "func_17_invoker" (func $9))
 (export "func_19" (func $10))
 (export "func_21_invoker" (func $13))
 (export "func_23" (func $14))
 (export "func_24_invoker" (func $16))
 (export "func_27_invoker" (func $19))
 (export "func_29" (func $20))
 (func $0 (type $0)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $1 (type $1) (result (ref null $3))
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $6)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (call $0)
 )
 (@binaryen.js.called)
 (func $3 (type $17) (param $0 arrayref) (param $1 anyref) (result v128)
  (local $2 (ref null $1))
  (local $3 (ref $0))
  (local $4 (ref $4))
  (local $5 (ref $1))
  (local $6 f32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
 )
 (func $4 (type $6)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (drop
   (call $23
    (call $3
     (array.new_fixed $5 0)
     (array.new_fixed $5 0)
    )
   )
  )
  (drop
   (call $23
    (call $3
     (array.new_fixed $5 0)
     (ref.i31
      (i32.const -103)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $5 (type $1) (result (ref null $3))
  (local $0 (ref null $0))
  (local $1 (ref $2))
  (local $2 (ref null $3))
  (local $3 (ref $3))
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f32)
  (local $10 f32)
  (local $11 f64)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (struct.new $3
   (ref.func $1)
   (ref.func $1)
   (local.get $10)
   (local.get $6)
   (local.get $4)
  )
 )
 (func $6 (type $0)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (call $fimport$1
   (ref.eq
    (array.new_fixed $5 0)
    (ref.i31
     (i32.const -63)
    )
   )
  )
  (call $fimport$1
   (i32.const 128)
  )
 )
 (func $7 (type $18) (param $0 (ref null $4)) (param $1 i32) (result (ref $3))
  (local $2 (ref eq))
  (local $3 (ref $4))
  (local $4 (ref null $3))
  (local $5 eqref)
  (local $6 structref)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 i32)
  (local $12 i64)
  (local $13 i64)
  (local $14 f32)
  (local $15 f32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (loop (result (ref (exact $3)))
   (if
    (i32.eqz
     (global.get $global$20)
    )
    (then
     (global.set $global$20
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$20
    (i32.sub
     (global.get $global$20)
     (i32.const 1)
    )
   )
   (struct.new_default $3)
  )
 )
 (func $8 (type $19) (param $0 (ref $4)) (param $1 v128) (result stringref)
  (local $2 i31ref)
  (local.set $1
   (call $23
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (string.const "\e2\82\ac")
  )
 )
 (func $9 (type $6)
  (local $0 (ref null $1))
  (local $1 (ref string))
  (local $2 (ref string))
  (local $3 (ref none))
  (local $4 (ref null $2))
  (local $5 (ref null $2))
  (local $6 (ref array))
  (local $7 funcref)
  (local $8 funcref)
  (local $9 (ref $4))
  (local $10 (ref $4))
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 f64)
  (local $19 f64)
  (local $20 v128)
  (local $21 f32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (drop
   (array.new_fixed $5 0)
  )
  (drop
   (array.new_default $2
    (i32.and
     (i32.const 75)
     (i32.const 1023)
    )
   )
  )
  (drop
   (array.new $2
    (ref.func $5)
    (i32.and
     (i32.const 81)
     (i32.const 1023)
    )
   )
  )
  (drop
   (f32.const -2047.1600341796875)
  )
  (drop
   (call $22
    (f64.convert_i64_s
     (i64.const -32768)
    )
   )
  )
  (block
   (call $fimport$2
    (i64.const 4294967295)
   )
   (return)
  )
  (local.set $9
   (local.set $10
    (local.set $2
     (local.set $6
      (local.set $3
       (local.set $1
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $10 (type $0)
  (local $0 structref)
  (local $1 (ref $3))
  (local $2 (ref extern))
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (block $block1
   (memory.fill
    (i64.and
     (i64.const 9223372036854775807)
     (i64.const 15)
    )
    (loop $label (result i32)
     (if
      (i32.eqz
       (global.get $global$20)
      )
      (then
       (global.set $global$20
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$20
      (i32.sub
       (global.get $global$20)
       (i32.const 1)
      )
     )
     (br_if $label
      (i32.eqz
       (try (result i32)
        (do
         (i32.const 32769)
        )
        (catch $tag$0
         (global.set $global$5 (pop i64))
         (i32.div_s
          (i32.atomic.load8_u offset=22
           (i64.and
            (global.get $global$5)
            (i64.const 15)
           )
          )
          (global.get $global$11)
         )
        )
        (catch_all
         (block
          (br_if $label
           (ref.is_null
            (ref.func $10)
           )
          )
          (br $label)
         )
         (unreachable)
        )
       )
      )
     )
     (block
      (nop)
      (struct.set $3 3
       (local.tee $1
        (struct.new_default $3)
       )
       (i32.load offset=4 align=2
        (i64.and
         (local.get $4)
         (i64.const 15)
        )
       )
      )
      (return)
     )
     (unreachable)
    )
    (local.tee $4
     (select
      (block $block (result i64)
       (loop $label1
        (if
         (i32.eqz
          (global.get $global$20)
         )
         (then
          (global.set $global$20
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$20
         (i32.sub
          (global.get $global$20)
          (i32.const 1)
         )
        )
        (if
         (i32.eqz
          (local.get $5)
         )
         (then
          (if
           (stringview_wtf16.get_codeunit
            (loop $label2 (result (ref string))
             (if
              (i32.eqz
               (global.get $global$20)
              )
              (then
               (global.set $global$20
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$20
              (i32.sub
               (global.get $global$20)
               (i32.const 1)
              )
             )
             (i32.store8 offset=3
              (i64.and
               (br_if $block
                (i64.const -1406855894)
                (i32.eqz
                 (local.get $5)
                )
               )
               (i64.const 15)
              )
              (ref.eq
               (ref.as_non_null
                (ref.null none)
               )
               (array.new_fixed $5 0)
              )
             )
             (try_table (catch $tag$0 $block) (catch $tag$0 $block) (catch_all $label1)
              (nop)
             )
             (br_if $label2
              (i32.eqz
               (i31.get_s
                (ref.i31
                 (i32.const -1073741824)
                )
               )
              )
             )
             (string.const "554")
            )
            (block (result i32)
             (local.set $7
              (ref.eq
               (struct.new $4
                (ref.null none)
                (ref.null none)
                (ref.as_non_null
                 (ref.null none)
                )
                (f32.const 0)
                (f64.const -3402823466385288598117041e14)
               )
               (struct.new_default $7)
              )
             )
             (local.get $7)
            )
           )
           (then
            (call $fimport$0
             (i32.const 0)
            )
           )
          )
          (struct.set $3 4
           (struct.new_default $3)
           (v128.const i32x4 0x1402ffe6 0x0000ff86 0x5d3dfc01 0x00006121)
          )
         )
         (else
          (nop)
         )
        )
        (drop
         (br_on_null $block1
          (struct.new_default $3)
         )
        )
        (block $block2
         (call $fimport$8
          (select (result (ref extern))
           (select (result (ref extern))
            (block (result (ref extern))
             (nop)
             (br_if $block2
              (i32.eqz
               (local.get $6)
              )
             )
             (if (result (ref extern))
              (global.get $global$11)
              (then
               (global.get $gimport$0)
              )
              (else
               (local.tee $2
                (string.const "\e2\82\ac\c2\a3\c2\a3")
               )
              )
             )
            )
            (if (result (ref extern))
             (ref.test (ref none)
              (ref.as_non_null
               (ref.null none)
              )
             )
             (then
              (global.get $gimport$0)
             )
             (else
              (global.get $gimport$0)
             )
            )
            (if (result i32)
             (local.get $6)
             (then
              (call $fimport$7
               (ref.null nofunc)
              )
              (local.tee $6
               (i32.const 2097152)
              )
             )
             (else
              (local.tee $6
               (local.tee $5
                (local.get $6)
               )
              )
             )
            )
           )
           (block (result (ref string))
            (local.set $1
             (struct.new_default $3)
            )
            (br_on_null $label1
             (string.const "\e2\82\ac")
            )
           )
           (loop $label3 (result i32)
            (if
             (i32.eqz
              (global.get $global$20)
             )
             (then
              (global.set $global$20
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$20
             (i32.sub
              (global.get $global$20)
              (i32.const 1)
             )
            )
            (nop)
            (atomic.fence)
            (call $4)
            (br_if $label3
             (struct.get $3 3
              (ref.cast (ref $3)
               (local.get $0)
              )
             )
            )
            (local.get $6)
           )
          )
         )
        )
       )
       (local.get $4)
      )
      (local.get $4)
      (string.measure_wtf16
       (string.const "")
      )
     )
    )
   )
   (call $6)
  )
 )
 (func $11 (type $0)
  (local $0 f32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (nop)
  (f32.store offset=22 align=2
   (i64.and
    (i64.const -47)
    (block (result i64)
     (drop
      (i64.const -11184)
     )
     (i64.const 15)
    )
   )
   (f32.const 1)
  )
 )
 (func $12 (type $0)
  (local $0 v128)
  (local $1 f64)
  (local $2 i64)
  (local $3 eqref)
  (local $4 (ref $2))
  (local $5 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (i32.atomic.store offset=22
   (i64.and
    (block $block1 (result i64)
     (loop $label
      (if
       (i32.eqz
        (global.get $global$20)
       )
       (then
        (global.set $global$20
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$20
       (i32.sub
        (global.get $global$20)
        (i32.const 1)
       )
      )
      (call $fimport$2
       (i64.const -34)
      )
      (block $block
       (struct.set $4 3
        (if (result (ref $4))
         (i32.load8_u offset=22
          (i64.and
           (i64.const 27159)
           (i64.const 15)
          )
         )
         (then
          (call $fimport$2
           (global.get $global$5)
          )
          (nop)
          (global.get $global$4)
         )
         (else
          (if
           (ref.eq
            (struct.new_default $3)
            (local.tee $4
             (array.new $2
              (ref.null nofunc)
              (i32.and
               (i32.const 82)
               (i32.const 1023)
              )
             )
            )
           )
           (then
            (br $label)
           )
           (else
            (nop)
            (drop
             (call $21
              (f32.demote_f64
               (local.get $1)
              )
             )
            )
            (drop
             (f32.const 0)
            )
            (drop
             (call $21
              (f32.reinterpret_i32
               (i32.const 65)
              )
             )
            )
            (block
             (nop)
             (br $block)
            )
            (unreachable)
           )
          )
          (unreachable)
         )
        )
        (f32.const 252)
       )
       (try_table (catch $tag$0 $block1) (catch $tag$0 $block1) (catch $tag$0 $block1)
        (br_if $block
         (i32.eqz
          (i32.const -27)
         )
        )
       )
      )
      (br_if $label
       (i32.eqz
        (ref.eq
         (ref.as_non_null
          (local.get $3)
         )
         (array.new_fixed $5 0)
        )
       )
      )
     )
     (call $fimport$7
      (ref.func $5)
     )
     (global.get $global$5)
    )
    (i64.const 15)
   )
   (i32.const 16777217)
  )
  (return_call_indirect $0 (type $0)
   (i64.const 2)
  )
 )
 (func $13 (type $6)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (call $12)
 )
 (func $14 (type $20) (param $0 stringref) (result (ref $2))
  (local $1 (ref null $1))
  (local $2 stringref)
  (local $3 stringref)
  (local $4 (ref null $4))
  (local $5 (ref struct))
  (local $6 (ref $3))
  (local $7 (ref $4))
  (local $8 v128)
  (local $9 f32)
  (local $10 f64)
  (local $11 f64)
  (local $12 i64)
  (local $13 i64)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (select (result (ref (exact $2)))
   (array.new_default $2
    (i32.and
     (i32.const 84)
     (i32.const 1023)
    )
   )
   (array.new $2
    (loop $label (result (ref (exact $1)))
     (if
      (i32.eqz
       (global.get $global$20)
      )
      (then
       (global.set $global$20
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$20
      (i32.sub
       (global.get $global$20)
       (i32.const 1)
      )
     )
     (nop)
     (nop)
     (br_if $label
      (ref.eq
       (ref.i31
        (i32.const 33554432)
       )
       (loop $label1 (result (ref (exact $7)))
        (if
         (i32.eqz
          (global.get $global$20)
         )
         (then
          (global.set $global$20
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$20
         (i32.sub
          (global.get $global$20)
          (i32.const 1)
         )
        )
        (nop)
        (atomic.fence acqrel)
        (br_if $label1
         (i64.le_s
          (i64.const 4503599627370497)
          (i64.atomic.rmw32.cmpxchg_u offset=3
           (i64.and
            (try_table (result i64) (catch_all $label)
             (if (result i64)
              (i32.eqz
               (loop (result i32)
                (if
                 (i32.eqz
                  (global.get $global$20)
                 )
                 (then
                  (global.set $global$20
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$20
                 (i32.sub
                  (global.get $global$20)
                  (i32.const 1)
                 )
                )
                (i32.const 128)
               )
              )
              (then
               (atomic.fence)
               (br $label1)
              )
              (else
               (i64.const 1)
              )
             )
            )
            (i64.const 15)
           )
           (global.get $global$5)
           (try (result i64)
            (do
             (loop $label2 (result i64)
              (if
               (i32.eqz
                (global.get $global$20)
               )
               (then
                (global.set $global$20
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$20
               (i32.sub
                (global.get $global$20)
                (i32.const 1)
               )
              )
              (call $2)
              (br_if $label2
               (i32.eqz
                (try_table (result i32) (catch_all $label2)
                 (global.get $global$11)
                )
               )
              )
              (global.get $global$5)
             )
            )
            (catch_all
             (if (result i64)
              (i32.wrap_i64
               (global.get $global$5)
              )
              (then
               (nop)
               (loop (result i64)
                (if
                 (i32.eqz
                  (global.get $global$20)
                 )
                 (then
                  (global.set $global$20
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$20
                 (i32.sub
                  (global.get $global$20)
                  (i32.const 1)
                 )
                )
                (global.get $global$5)
               )
              )
              (else
               (nop)
               (br $label)
              )
             )
            )
           )
          )
         )
        )
        (struct.new_default $7)
       )
      )
     )
     (drop
      (br_on_null $label
       (struct.new_default $3)
      )
     )
     (ref.func $1)
    )
    (i32.const 47)
   )
   (i32.const -8388608)
  )
 )
 (@binaryen.js.called)
 (func $15 (type $10) (result (ref null $1) f64 (ref null $0) funcref (ref null $1))
  (local $0 (ref $3))
  (local $1 (ref $3))
  (local $2 (ref $1))
  (local $3 (ref $1))
  (local $4 (ref string))
  (local $5 f64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (local.set $3
   (ref.func $5)
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$20)
    )
    (then
     (global.set $global$20
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$20
    (i32.sub
     (global.get $global$20)
     (i32.const 1)
    )
   )
   (nop)
   (if
    (i32.eqz
     (global.get $global$20)
    )
    (then
     (global.set $global$20
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$20
    (i32.sub
     (global.get $global$20)
     (i32.const 1)
    )
   )
   (call_ref $6
    (ref.func $2)
   )
   (br_if $label
    (global.get $global$11)
   )
   (if
    (i32.const -73)
    (then
     (drop
      (br_on_null $label
       (array.new_default $2
        (i32.and
         (i32.const 15)
         (i32.const 1023)
        )
       )
      )
     )
    )
   )
   (block $block1
    (struct.set $3 0
     (local.tee $0
      (try (result (ref $3))
       (do
        (loop $label1 (result (ref (exact $3)))
         (if
          (i32.eqz
           (global.get $global$20)
          )
          (then
           (global.set $global$20
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$20
          (i32.sub
           (global.get $global$20)
           (i32.const 1)
          )
         )
         (nop)
         (block $block
          (if
           (i32.eqz
            (if (result i32)
             (i32.eqz
              (i32.trunc_f64_s
               (local.tee $5
                (f64.const 4294967226)
               )
              )
             )
             (then
              (i32.atomic.load8_u offset=3
               (i64.and
                (i64.trunc_sat_f64_s
                 (f64.const -12418)
                )
                (i64.const 15)
               )
              )
             )
             (else
              (i32.const -30)
             )
            )
           )
           (then
            (block
             (call $fimport$4
              (local.tee $5
               (call $22
                (f64.load offset=22 align=1
                 (i64.and
                  (i64.const -4383405)
                  (i64.const 15)
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
         (loop $label4
          (if
           (i32.eqz
            (global.get $global$20)
           )
           (then
            (global.set $global$20
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$20
           (i32.sub
            (global.get $global$20)
            (i32.const 1)
           )
          )
          (if
           (ref.eq
            (ref.null none)
            (struct.new $4
             (ref.null none)
             (ref.null none)
             (ref.as_non_null
              (ref.null none)
             )
             (f32.const -1.1754943508222875e-38)
             (f64.const 0)
            )
           )
           (then
            (try
             (do
              (drop
               (br_on_null $block1
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
             )
             (catch $tag$0
              (local.set $7 (i64.mul (pop i64) (i64.const -1)))
              (try_table (catch_all $label1)
               (nop)
              )
             )
             (catch_all
              (i64.store16 offset=4 align=1
               (i64.and
                (local.tee $8
                 (try (result i64)
                  (do
                   (i64.atomic.load acqrel offset=22
                    (i64.and
                     (i64.const 2251799813685248)
                     (i64.const 15)
                    )
                   )
                  )
                  (catch $tag$0
                   (drop (pop i64))
                   (local.get $10)
                  )
                 )
                )
                (i64.const 15)
               )
               (local.get $10)
              )
             )
            )
            (table.set $0
             (i64.const 5)
             (loop $label2 (result (ref $1))
              (if
               (i32.eqz
                (global.get $global$20)
               )
               (then
                (global.set $global$20
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$20
               (i32.sub
                (global.get $global$20)
                (i32.const 1)
               )
              )
              (nop)
              (br_if $label2
               (i32.const 64)
              )
              (local.tee $2
               (local.tee $3
                (ref.as_non_null
                 (ref.null nofunc)
                )
               )
              )
             )
            )
            (nop)
           )
           (else
            (call $12)
            (loop $label3
             (if
              (i32.eqz
               (global.get $global$20)
              )
              (then
               (global.set $global$20
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$20
              (i32.sub
               (global.get $global$20)
               (i32.const 1)
              )
             )
             (local.set $5
              (local.get $5)
             )
             (call $fimport$0
              (i32.const 0)
             )
             (br_if $label3
              (local.get $6)
             )
            )
            (f64.store offset=22
             (i64.and
              (local.get $8)
              (i64.const 15)
             )
             (local.get $5)
            )
            (loop $label5
             (if
              (i32.eqz
               (global.get $global$20)
              )
              (then
               (global.set $global$20
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$20
              (i32.sub
               (global.get $global$20)
               (i32.const 1)
              )
             )
             (br_if $label4
              (local.get $6)
             )
             (nop)
             (try_table (catch_all $label4)
              (i32.atomic.store acqrel offset=4
               (i64.and
                (i64.const -82)
                (i64.const 15)
               )
               (i32.const -77)
              )
             )
             (br_if $block1
              (i32.eqz
               (i32.const 241)
              )
             )
             (if
              (i32.eqz
               (i32.const 2)
              )
              (then
               (nop)
              )
             )
             (br_if $label5
              (string.eq
               (local.tee $4
                (string.const "")
               )
               (local.tee $4
                (string.const "")
               )
              )
             )
            )
            (if
             (i32.eqz
              (global.get $global$20)
             )
             (then
              (global.set $global$20
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$20
             (i32.sub
              (global.get $global$20)
              (i32.const 1)
             )
            )
            (atomic.fence)
           )
          )
          (br $label1)
         )
         (unreachable)
        )
       )
       (catch $tag$0
        (local.set $11 (local.tee $11 (pop i64)))
        (local.tee $1
         (struct.new_default $3)
        )
       )
      )
     )
     (struct.get $3 1
      (local.get $0)
     )
    )
   )
  )
  (throw_ref
   (block $block2 (result (ref exn))
    (try_table (catch_all_ref $block2)
     (throw $tag$0
      (local.get $10)
     )
    )
    (unreachable)
   )
  )
 )
 (func $16 (type $6)
  (local $scratch (tuple (ref null $1) f64 (ref null $0) funcref (ref null $1)))
  (local $scratch_1 funcref)
  (local $scratch_2 (ref null $0))
  (local $scratch_3 f64)
  (local $scratch_4 (ref null $1))
  (local $scratch_5 (tuple (ref null $1) f64 (ref null $0) funcref (ref null $1)))
  (local $scratch_6 funcref)
  (local $scratch_7 (ref null $0))
  (local $scratch_8 f64)
  (local $scratch_9 (ref null $1))
  (local $scratch_10 (tuple (ref null $1) f64 (ref null $0) funcref (ref null $1)))
  (local $scratch_11 funcref)
  (local $scratch_12 (ref null $0))
  (local $scratch_13 f64)
  (local $scratch_14 (ref null $1))
  (local $scratch_15 (tuple (ref null $1) f64 (ref null $0) funcref (ref null $1)))
  (local $scratch_16 funcref)
  (local $scratch_17 (ref null $0))
  (local $scratch_18 f64)
  (local $scratch_19 (ref null $1))
  (local $scratch_20 (tuple (ref null $1) f64 (ref null $0) funcref (ref null $1)))
  (local $scratch_21 funcref)
  (local $scratch_22 (ref null $0))
  (local $scratch_23 f64)
  (local $scratch_24 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_4
     (tuple.extract 5 0
      (local.tee $scratch
       (call $15)
      )
     )
    )
    (drop
     (block (result f64)
      (local.set $scratch_3
       (tuple.extract 5 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result (ref null $0))
        (local.set $scratch_2
         (tuple.extract 5 2
          (local.get $scratch)
         )
        )
        (drop
         (block (result funcref)
          (local.set $scratch_1
           (tuple.extract 5 3
            (local.get $scratch)
           )
          )
          (drop
           (tuple.extract 5 4
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
    (local.get $scratch_4)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_9
     (tuple.extract 5 0
      (local.tee $scratch_5
       (call $15)
      )
     )
    )
    (drop
     (block (result f64)
      (local.set $scratch_8
       (tuple.extract 5 1
        (local.get $scratch_5)
       )
      )
      (drop
       (block (result (ref null $0))
        (local.set $scratch_7
         (tuple.extract 5 2
          (local.get $scratch_5)
         )
        )
        (drop
         (block (result funcref)
          (local.set $scratch_6
           (tuple.extract 5 3
            (local.get $scratch_5)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_5)
           )
          )
          (local.get $scratch_6)
         )
        )
        (local.get $scratch_7)
       )
      )
      (local.get $scratch_8)
     )
    )
    (local.get $scratch_9)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_14
     (tuple.extract 5 0
      (local.tee $scratch_10
       (call $15)
      )
     )
    )
    (drop
     (block (result f64)
      (local.set $scratch_13
       (tuple.extract 5 1
        (local.get $scratch_10)
       )
      )
      (drop
       (block (result (ref null $0))
        (local.set $scratch_12
         (tuple.extract 5 2
          (local.get $scratch_10)
         )
        )
        (drop
         (block (result funcref)
          (local.set $scratch_11
           (tuple.extract 5 3
            (local.get $scratch_10)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_10)
           )
          )
          (local.get $scratch_11)
         )
        )
        (local.get $scratch_12)
       )
      )
      (local.get $scratch_13)
     )
    )
    (local.get $scratch_14)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_19
     (tuple.extract 5 0
      (local.tee $scratch_15
       (call $15)
      )
     )
    )
    (drop
     (block (result f64)
      (local.set $scratch_18
       (tuple.extract 5 1
        (local.get $scratch_15)
       )
      )
      (drop
       (block (result (ref null $0))
        (local.set $scratch_17
         (tuple.extract 5 2
          (local.get $scratch_15)
         )
        )
        (drop
         (block (result funcref)
          (local.set $scratch_16
           (tuple.extract 5 3
            (local.get $scratch_15)
           )
          )
          (drop
           (tuple.extract 5 4
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
    (local.get $scratch_19)
   )
  )
  (drop
   (block (result (ref null $1))
    (local.set $scratch_24
     (tuple.extract 5 0
      (local.tee $scratch_20
       (call $15)
      )
     )
    )
    (drop
     (block (result f64)
      (local.set $scratch_23
       (tuple.extract 5 1
        (local.get $scratch_20)
       )
      )
      (drop
       (block (result (ref null $0))
        (local.set $scratch_22
         (tuple.extract 5 2
          (local.get $scratch_20)
         )
        )
        (drop
         (block (result funcref)
          (local.set $scratch_21
           (tuple.extract 5 3
            (local.get $scratch_20)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_20)
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
    (local.get $scratch_24)
   )
  )
 )
 (@binaryen.js.called)
 (func $17 (type $21) (result (ref $1))
  (local $0 (ref null $1))
  (local $1 (ref null $4))
  (local $2 (ref null $4))
  (local $3 anyref)
  (local $4 anyref)
  (local $5 arrayref)
  (local $6 arrayref)
  (local $7 i31ref)
  (local $8 (ref null $3))
  (local $9 (ref null $2))
  (local $10 (ref null $0))
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 i64)
  (local $19 i64)
  (local $20 v128)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (ref.func $1)
 )
 (@binaryen.js.called)
 (func $18 (type $22) (param $0 (ref $2)) (result (ref null $1))
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (return
   (ref.func $5)
  )
 )
 (func $19 (type $6)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (drop
   (call $18
    (array.new_default $2
     (i32.and
      (i32.const 24)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $18
    (array.new_default $2
     (i32.and
      (i32.const 51)
      (i32.const 1023)
     )
    )
   )
  )
  (drop
   (call $18
    (array.new_default $2
     (i32.and
      (i32.const 8)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $20 (type $0)
  (local $0 (ref null $2))
  (local $1 externref)
  (local $2 (ref null $0))
  (local $3 (ref $1))
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 v128)
  (local $9 v128)
  (local $10 f32)
  (if
   (i32.eqz
    (global.get $global$20)
   )
   (then
    (global.set $global$20
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$20
   (i32.sub
    (global.get $global$20)
    (i32.const 1)
   )
  )
  (struct.set $3 0
   (loop $label (result (ref $3))
    (if
     (i32.eqz
      (global.get $global$20)
     )
     (then
      (global.set $global$20
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$20
     (i32.sub
      (global.get $global$20)
      (i32.const 1)
     )
    )
    (call_indirect $0 (type $0)
     (i64.const 2)
    )
    (nop)
    (br_if $label
     (i32.eqz
      (i32.atomic.load offset=22
       (i64.and
        (global.get $global$5)
        (i64.const 15)
       )
      )
     )
    )
    (call $7
     (ref.null none)
     (local.get $5)
    )
   )
   (local.tee $3
    (ref.as_non_null
     (ref.null nofunc)
    )
   )
  )
  (nop)
 )
 (func $21 (type $23) (param $0 f32) (result f32)
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
 (func $22 (type $24) (param $0 f64) (result f64)
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
 (func $23 (type $25) (param $0 v128) (result v128)
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
)
