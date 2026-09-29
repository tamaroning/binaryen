(module
 (rec
  (type $0 (array f64))
  (type $1 (sub (struct (field nullexternref) (field (mut (ref null $1))) (field f32) (field (ref $0)) (field (ref $0)))))
 )
 (rec
  (type $2 (sub (struct (field (mut (ref null $3))) (field (mut anyref)))))
  (type $3 (sub $2 (struct (field (mut (ref null $3))) (field (mut anyref)) (field i32) (field (mut v128)))))
  (type $4 (sub (struct (field i16) (field f64) (field f64) (field (mut i64)) (field i64))))
  (type $5 (sub $1 (struct (field nullexternref) (field (mut (ref null $1))) (field f32) (field (ref $0)) (field (ref $0)))))
 )
 (type $6 (func (result i32 f32)))
 (type $7 (func (result (ref i31) f64 f64 i64 (ref func))))
 (type $8 (struct))
 (type $9 (array (mut i16)))
 (type $10 (func (param i32)))
 (type $11 (func (result (ref (exact $4)) f64 f32)))
 (type $12 (func (result i32 f64)))
 (type $13 (func (param (ref $1))))
 (type $14 (func (param i64)))
 (type $15 (func (param f32)))
 (type $16 (func (param f64)))
 (type $17 (func (param v128)))
 (type $18 (func (param anyref)))
 (type $19 (func (param funcref)))
 (type $20 (func (param externref)))
 (type $21 (func (param i32 i32)))
 (type $22 (func (param i32) (result i32)))
 (type $23 (func (param i32 i32) (result i32)))
 (type $24 (func (param exnref (ref null $3) (ref $3) i32 f32 i32 externref f64) (result structref (ref null $2) i32 (ref null $5))))
 (type $25 (func (param (ref $1) i64 f64) (result (ref null $4) f64 f32)))
 (type $26 (func))
 (type $27 (func (param eqref) (result (ref null $1))))
 (type $28 (func (param (ref $4) (ref null $0) (ref null $1) (ref $3) f32 f64) (result i32 f64)))
 (type $29 (func (result (ref $1))))
 (type $30 (func (param f32) (result f32)))
 (type $31 (func (param f64) (result f64)))
 (type $32 (func (param v128) (result v128)))
 (type $33 (func (result structref (ref null $2) i32 (ref null $5))))
 (type $34 (func (result (ref null $4) f64 f32)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $10) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $10) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $14) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $15) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $16) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $17) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $18) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $19) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $20) (param externref)))
 (import "fuzzing-support" "call-export" (func $fimport$9 (type $21) (param i32 i32)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$10 (type $22) (param i32) (result i32)))
 (import "fuzzing-support" "sleep" (func $fimport$11 (type $23) (param i32 i32) (result i32)))
 (global $global$0 i32 (i32.const 536870912))
 (global $global$1 f32 (f32.const 0))
 (global $global$2 (mut i64) (i64.const 2))
 (global $global$3 (mut i64) (i64.const 4294967295))
 (global $global$4 (mut f32) (global.get $global$1))
 (global $global$5 (mut (ref null $1)) (struct.new $1
  (ref.null noextern)
  (struct.new $1
   (ref.null noextern)
   (struct.new $1
    (ref.null noextern)
    (ref.null none)
    (f32.const -1025)
    (array.new $0
     (f64.const 68719476735.807)
     (i32.const 45)
    )
    (array.new_default $0
     (i32.const 56)
    )
   )
   (global.get $global$1)
   (array.new $0
    (f64.const 0)
    (i32.const 29)
   )
   (array.new_default $0
    (i32.const 31)
   )
  )
  (f32.const -70368744177664)
  (array.new $0
   (f64.const -9223372036854775808)
   (i32.const 84)
  )
  (array.new $0
   (f64.const 4096)
   (i32.const 19)
  )
 ))
 (global $global$6 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 (i64.const 0) "\0e,\a3")
 (data $1 (i64.const 3) "F\87\04Qi\fe\b5/\c7\fdo\c8\1e}\8a")
 (data $2 (i64.const 18) "\95d")
 (table $0 i64 9 funcref (ref.null nofunc))
 (table $1 6 exnref)
 (elem $0 (table $0) (i64.const 0) func $0 $1)
 (elem declare func $5 $fimport$6)
 (tag $tag$0 (type $13) (param (ref $1)))
 (export "global$_3" (global $global$4))
 (export "global$_4" (global $global$5))
 (export "tag$" (tag $tag$0))
 (export "func_13_invoker" (func $2))
 (export "func_15" (func $3))
 (export "func_17" (func $5))
 (func $0 (type $24) (param $0 exnref) (param $1 (ref null $3)) (param $2 (ref $3)) (param $3 i32) (param $4 f32) (param $5 i32) (param $6 externref) (param $7 f64) (result structref (ref null $2) i32 (ref null $5))
  (local $8 f32)
  (local $9 f64)
  (local $10 (ref null $0))
  (local $11 stringref)
  (local $12 (ref $2))
  (local.set $4
   (call $6
    (local.get $4)
   )
  )
  (local.set $7
   (call $7
    (local.get $7)
   )
  )
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (tuple.make 4
   (struct.new $3
    (struct.new $3
     (local.get $1)
     (struct.new_default $8)
     (local.get $3)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (local.get $10)
    (local.get $5)
    (v128.const i32x4 0x4f000000 0x42c60000 0x4f7fff9f 0xcf800000)
   )
   (struct.new $2
    (local.get $1)
    (struct.new_default $8)
   )
   (i32.const -33)
   (struct.new $5
    (ref.null noextern)
    (struct.new $5
     (ref.null noextern)
     (struct.new $5
      (ref.null noextern)
      (struct.new $1
       (ref.null noextern)
       (ref.null none)
       (local.get $8)
       (array.new_default $0
        (i32.and
         (i32.const 73)
         (i32.const 1023)
        )
       )
       (array.new_default $0
        (i32.and
         (i32.const 35)
         (i32.const 1023)
        )
       )
      )
      (local.get $8)
      (array.new $0
       (f64.const 40)
       (i32.and
        (i32.const 80)
        (i32.const 1023)
       )
      )
      (array.new_default $0
       (i32.and
        (i32.const 90)
        (i32.const 1023)
       )
      )
     )
     (call $6
      (global.get $global$4)
     )
     (array.new_default $0
      (i32.and
       (i32.const 56)
       (i32.const 1023)
      )
     )
     (array.new $0
      (local.get $7)
      (i32.and
       (i32.const 17)
       (i32.const 1023)
      )
     )
    )
    (local.get $8)
    (array.new_default $0
     (i32.and
      (i32.const 29)
      (i32.const 1023)
     )
    )
    (array.new_default $0
     (i32.and
      (i32.const 17)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $1 (type $25) (param $0 (ref $1)) (param $1 i64) (param $2 f64) (result (ref null $4) f64 f32)
  (local $3 i64)
  (local $scratch f32)
  (local $scratch_5 i32)
  (local.set $2
   (call $7
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (block (type $11) (result (ref (exact $4)) f64 f32)
   (drop
    (block (result i32)
     (local.set $scratch_5
      (i32.const -2)
     )
     (drop
      (block (result f32)
       (local.set $scratch
        (f32.const 0)
       )
       (local.set $3
        (i64.const -39)
       )
       (local.get $scratch)
      )
     )
     (local.get $scratch_5)
    )
   )
   (local.set $1
    (local.get $3)
   )
   (call $fimport$0
    (i32.const -75)
   )
   (try_table (type $11) (result (ref (exact $4)) f64 f32)
    (tuple.make 3
     (struct.new_default $4)
     (f64.const 38)
     (f32.const 323563360)
    )
   )
  )
 )
 (func $2 (type $26)
  (local $0 (ref $1))
  (local $1 (ref $1))
  (local $2 nullexternref)
  (local $3 nullexternref)
  (local $4 (ref $0))
  (local $5 (ref $0))
  (local $6 (ref $2))
  (local $7 (ref $3))
  (local $8 (ref i31))
  (local $9 (ref string))
  (local $10 (ref any))
  (local $11 anyref)
  (local $12 (ref null $3))
  (local $13 (ref $4))
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 v128)
  (local $23 f64)
  (local $24 f64)
  (local $scratch (ref (exact $0)))
  (local $scratch_26 nullexternref)
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (local.set $5
   (block (result (ref (exact $0)))
    (local.set $scratch
     (array.new_default $0
      (i32.and
       (i32.const 79)
       (i32.const 1023)
      )
     )
    )
    (local.set $19
     (i32.const 1)
    )
    (local.get $scratch)
   )
  )
  (local.set $9
   (string.const "260360")
  )
  (local.set $7
   (struct.new_default $3)
  )
  (local.set $6
   (struct.new $2
    (struct.new $3
     (struct.new_default $3)
     (struct.new_default $8)
     (local.get $17)
     (local.get $22)
    )
    (struct.new $2
     (local.get $12)
     (ref.i31
      (i32.const -32768)
     )
    )
   )
  )
  (drop
   (try (result nullexternref)
    (do
     (ref.null noextern)
    )
    (catch $tag$0
     (drop (struct.get $1 0 (pop (ref $1))))
     (ref.null noextern)
    )
   )
  )
  (drop
   (ref.null noextern)
  )
  (drop
   (local.tee $2
    (block (result nullexternref)
     (local.set $scratch_26
      (ref.null noextern)
     )
     (local.set $14
      (i64.const -127)
     )
     (local.get $scratch_26)
    )
   )
  )
  (drop
   (local.get $3)
  )
  (block
   (call $fimport$5
    (call $8
     (v128.load offset=4 align=2
      (i64.and
       (i64.rotl
        (local.get $15)
        (i64.const 9223372036854775807)
       )
       (i64.const 15)
      )
     )
    )
   )
   (return)
  )
  (local.set $4
   (local.set $13
    (local.set $7
     (local.set $7
      (local.set $8
       (local.set $8
        (local.set $10
         (local.set $18
          (local.set $9
           (local.set $8
            (local.set $4
             (local.set $1
              (local.set $4
               (local.set $6
                (local.set $7
                 (local.set $4
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
 (func $3 (type $27) (param $0 eqref) (result (ref null $1))
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 v128)
  (local $8 f32)
  (local $9 f32)
  (local $10 f64)
  (local $11 f64)
  (local $12 (ref null $5))
  (local $13 (ref $3))
  (local $14 (ref $5))
  (local $15 eqref)
  (local $16 funcref)
  (local $17 (ref $1))
  (local $18 (ref $1))
  (local $19 (ref struct))
  (local $20 (ref struct))
  (local $21 (ref null $2))
  (local $22 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (local.tee $22
   (loop $label (result (ref (exact $5)))
    (if
     (i32.eqz
      (global.get $global$6)
     )
     (then
      (global.set $global$6
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$6
     (i32.sub
      (global.get $global$6)
      (i32.const 1)
     )
    )
    (call $fimport$7
     (local.tee $16
      (local.get $16)
     )
    )
    (br_if $label
     (i32.eqz
      (ref.eq
       (struct.new_default $3)
       (struct.new_default $3)
      )
     )
    )
    (if (result (ref (exact $5)))
     (try_table (result i32) (catch_all $label)
      (global.get $global$0)
     )
     (then
      (atomic.fence acqrel)
      (br $label)
     )
     (else
      (block $block (result (ref (exact $5)))
       (nop)
       (drop
        (br_on_cast_fail $block (ref (exact $5)) (ref (exact $5))
         (struct.new $5
          (ref.null noextern)
          (struct.new $5
           (ref.null noextern)
           (local.get $12)
           (call $6
            (global.get $global$1)
           )
           (array.new $0
            (f64.const 0)
            (i32.and
             (i32.const 36)
             (i32.const 1023)
            )
           )
           (array.new_default $0
            (i32.and
             (i32.const 74)
             (i32.const 1023)
            )
           )
          )
          (f32.const 128)
          (array.new_default $0
           (i32.and
            (i32.const 10)
            (i32.const 1023)
           )
          )
          (array.new_default $0
           (i32.and
            (i32.const 78)
            (i32.const 1023)
           )
          )
         )
        )
       )
       (br $label)
      )
     )
    )
   )
  )
 )
 (func $4 (type $28) (param $0 (ref $4)) (param $1 (ref null $0)) (param $2 (ref null $1)) (param $3 (ref $3)) (param $4 f32) (param $5 f64) (result i32 f64)
  (local.set $4
   (call $6
    (local.get $4)
   )
  )
  (local.set $5
   (call $7
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (block (type $12) (result i32 f64)
   (nop)
   (tuple.make 2
    (i32.const 32767)
    (f64.const 0)
   )
  )
 )
 (func $5 (type $29) (result (ref $1))
  (local $0 (ref null $3))
  (local $1 (ref null $3))
  (local $2 (ref null $0))
  (local $3 (ref null $0))
  (local $4 exnref)
  (local $5 stringref)
  (local $6 anyref)
  (local $7 (ref $4))
  (local $8 (ref $9))
  (local $9 i31ref)
  (local $10 funcref)
  (local $11 (ref func))
  (local $12 f32)
  (local $13 f32)
  (local $14 v128)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 f64)
  (local $23 f64)
  (local $scratch i64)
  (local $scratch_25 f64)
  (local $scratch_26 f64)
  (local $scratch_27 (ref i31))
  (local $scratch_28 i32)
  (local $scratch_29 (tuple i32 f32))
  (local $scratch_30 i32)
  (local $scratch_31 (tuple (ref i31) f64 f64 i64 (ref func)))
  (local $scratch_32 i64)
  (local $scratch_33 f64)
  (local $scratch_34 f64)
  (local $scratch_35 (ref i31))
  (if
   (i32.eqz
    (global.get $global$6)
   )
   (then
    (global.set $global$6
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$6
   (i32.sub
    (global.get $global$6)
    (i32.const 1)
   )
  )
  (local.set $9
   (block (result (ref i31))
    (local.set $scratch_27
     (ref.as_non_null
      (local.get $9)
     )
    )
    (local.set $22
     (block (result f64)
      (local.set $scratch_26
       (call $7
        (local.get $22)
       )
      )
      (local.set $23
       (block (result f64)
        (local.set $scratch_25
         (call $7
          (local.get $23)
         )
        )
        (local.set $18
         (block (result i64)
          (local.set $scratch
           (local.get $18)
          )
          (local.set $10
           (ref.as_non_null
            (local.get $10)
           )
          )
          (local.get $scratch)
         )
        )
        (local.get $scratch_25)
       )
      )
      (local.get $scratch_26)
     )
    )
    (local.get $scratch_27)
   )
  )
  (local.set $0
   (ref.as_non_null
    (local.get $0)
   )
  )
  (block $block (result (ref $1))
   (call $fimport$7
    (loop $label2 (result (ref func))
     (if
      (i32.eqz
       (global.get $global$6)
      )
      (then
       (global.set $global$6
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$6
      (i32.sub
       (global.get $global$6)
       (i32.const 1)
      )
     )
     (drop
      (block (result (ref i31))
       (local.set $scratch_35
        (tuple.extract 5 0
         (local.tee $scratch_31
          (block (type $7) (result (ref i31) f64 f64 i64 (ref func))
           (if
            (string.encode_wtf16_array
             (string.const "")
             (block (result (ref (exact $9)))
              (if
               (loop $label (result i32)
                (if
                 (i32.eqz
                  (global.get $global$6)
                 )
                 (then
                  (global.set $global$6
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$6
                 (i32.sub
                  (global.get $global$6)
                  (i32.const 1)
                 )
                )
                (call $fimport$5
                 (local.get $14)
                )
                (br_if $label
                 (i32.eqz
                  (global.get $global$0)
                 )
                )
                (local.get $19)
               )
               (then
                (call $fimport$5
                 (loop (result v128)
                  (if
                   (i32.eqz
                    (global.get $global$6)
                   )
                   (then
                    (global.set $global$6
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$6
                   (i32.sub
                    (global.get $global$6)
                    (i32.const 1)
                   )
                  )
                  (local.tee $14
                   (v128.const i32x4 0x447fc000 0xc6662000 0x47077400 0x4f7fffef)
                  )
                 )
                )
                (call $fimport$5
                 (local.tee $14
                  (call $8
                   (struct.get $3 3
                    (ref.as_non_null
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
               )
              )
              (array.new $9
               (stringview_wtf16.get_codeunit
                (string.const "78\ed\a0\80")
                (block (result i32)
                 (local.set $21
                  (global.get $global$0)
                 )
                 (local.get $21)
                )
               )
               (i32.and
                (i32.const 2)
                (i32.const 1023)
               )
              )
             )
             (call $fimport$11
              (local.get $19)
              (local.tee $19
               (local.tee $19
                (local.tee $19
                 (i32.atomic.load acqrel offset=22
                  (i64.and
                   (i64.const -17592186044416)
                   (i64.const 15)
                  )
                 )
                )
               )
              )
             )
            )
            (then
             (br_if $label2
              (ref.test (ref null (exact $4))
               (if (result (ref null (exact $4)))
                (global.get $global$0)
                (then
                 (call $fimport$3
                  (local.get $12)
                 )
                 (struct.new_default $4)
                )
                (else
                 (loop $label1
                  (if
                   (i32.eqz
                    (global.get $global$6)
                   )
                   (then
                    (global.set $global$6
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$6
                   (i32.sub
                    (global.get $global$6)
                    (i32.const 1)
                   )
                  )
                  (call $fimport$9
                   (i32.rem_u
                    (local.get $19)
                    (i32.const 5)
                   )
                   (local.get $19)
                  )
                  (br $label1)
                 )
                 (unreachable)
                )
               )
              )
             )
            )
            (else
             (call $fimport$2
              (i64.const -1125899906842624)
             )
            )
           )
           (try (type $7) (result (ref i31) f64 f64 i64 (ref func))
            (do
             (drop
              (br_on_cast $block (ref none) (ref none)
               (try (result (ref none))
                (do
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (catch_all
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
             )
             (if (type $7) (result (ref i31) f64 f64 i64 (ref func))
              (block (result i32)
               (local.set $scratch_30
                (tuple.extract 2 0
                 (local.tee $scratch_29
                  (if (type $6) (result i32 f32)
                   (if (result i32)
                    (i32.sub
                     (i32.const 32767)
                     (i32.const 256)
                    )
                    (then
                     (call $fimport$6
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                     (br $label2)
                    )
                    (else
                     (i64.le_u
                      (block (result i64)
                       (local.set $14
                        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                       )
                       (local.get $17)
                      )
                      (i64.atomic.load32_u acqrel offset=22
                       (i64.and
                        (i64.const -64)
                        (i64.const 15)
                       )
                      )
                     )
                    )
                   )
                   (then
                    (call $fimport$3
                     (call $6
                      (f32x4.extract_lane 1
                       (call $8
                        (i16x8.ge_u
                         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                         (call $8
                          (v128.and
                           (local.get $14)
                           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                          )
                         )
                        )
                       )
                      )
                     )
                    )
                    (if (type $6) (result i32 f32)
                     (stringview_wtf16.get_codeunit
                      (string.const "\f0\90\8d\88\f0\90\8d\88")
                      (local.get $19)
                     )
                     (then
                      (block $block1 (type $6) (result i32 f32)
                       (call $fimport$5
                        (local.tee $14
                         (v128.const i32x4 0xfaff20d1 0x00b8f07f 0x583a015f 0x00c7a07f)
                        )
                       )
                       (br_on_non_null $block
                        (ref.as_non_null
                         (ref.null none)
                        )
                       )
                       (br_if $block1
                        (loop $label3 (type $6) (result i32 f32)
                         (if
                          (i32.eqz
                           (global.get $global$6)
                          )
                          (then
                           (global.set $global$6
                            (i32.const 100)
                           )
                           (unreachable)
                          )
                         )
                         (global.set $global$6
                          (i32.sub
                           (global.get $global$6)
                           (i32.const 1)
                          )
                         )
                         (nop)
                         (br_if $label3
                          (i32.eqz
                           (string.encode_wtf16_array
                            (string.const "")
                            (local.tee $8
                             (ref.as_non_null
                              (ref.null none)
                             )
                            )
                            (local.get $19)
                           )
                          )
                         )
                         (tuple.make 2
                          (i32.const -1922)
                          (f32.const 25878)
                         )
                        )
                        (i32.eqz
                         (ref.eq
                          (ref.as_non_null
                           (ref.null none)
                          )
                          (ref.i31
                           (i32.const 8192)
                          )
                         )
                        )
                       )
                      )
                     )
                     (else
                      (br_if $label2
                       (try_table (result i32) (catch $tag$0 $block) (catch $tag$0 $block) (catch $tag$0 $block)
                        (local.get $19)
                       )
                      )
                      (loop $label4 (type $6) (result i32 f32)
                       (if
                        (i32.eqz
                         (global.get $global$6)
                        )
                        (then
                         (global.set $global$6
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$6
                        (i32.sub
                         (global.get $global$6)
                         (i32.const 1)
                        )
                       )
                       (call $fimport$0
                        (i32.const 0)
                       )
                       (br_if $label4
                        (i32.eqz
                         (local.get $19)
                        )
                       )
                       (tuple.make 2
                        (local.tee $20
                         (block (result i32)
                          (local.set $scratch_28
                           (i32.const -52)
                          )
                          (local.set $13
                           (f32.const 8)
                          )
                          (local.get $scratch_28)
                         )
                        )
                        (local.get $13)
                       )
                      )
                     )
                    )
                   )
                   (else
                    (nop)
                    (br $label2)
                   )
                  )
                 )
                )
               )
               (drop
                (tuple.extract 2 1
                 (local.get $scratch_29)
                )
               )
               (local.get $scratch_30)
              )
              (then
               (tuple.make 5
                (ref.as_non_null
                 (local.get $9)
                )
                (call $7
                 (local.get $22)
                )
                (call $7
                 (local.get $23)
                )
                (local.get $18)
                (ref.as_non_null
                 (local.get $10)
                )
               )
              )
              (else
               (tuple.make 5
                (ref.i31
                 (i32.const -67108865)
                )
                (f64.const -66)
                (f64.const 4294967293.784)
                (i64.const 65517)
                (ref.func $5)
               )
              )
             )
            )
            (catch_all
             (tuple.make 5
              (ref.i31
               (i32.const 0)
              )
              (f64.const -117)
              (f64.const 43024)
              (i64.const 255)
              (ref.func $fimport$6)
             )
            )
           )
          )
         )
        )
       )
       (drop
        (block (result f64)
         (local.set $scratch_34
          (tuple.extract 5 1
           (local.get $scratch_31)
          )
         )
         (drop
          (block (result f64)
           (local.set $scratch_33
            (tuple.extract 5 2
             (local.get $scratch_31)
            )
           )
           (drop
            (block (result i64)
             (local.set $scratch_32
              (tuple.extract 5 3
               (local.get $scratch_31)
              )
             )
             (local.set $11
              (tuple.extract 5 4
               (local.get $scratch_31)
              )
             )
             (local.get $scratch_32)
            )
           )
           (local.get $scratch_33)
          )
         )
         (local.get $scratch_34)
        )
       )
       (local.get $scratch_35)
      )
     )
     (local.get $11)
    )
   )
   (ref.as_non_null
    (ref.null none)
   )
  )
 )
 (func $6 (type $30) (param $0 f32) (result f32)
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
 (func $7 (type $31) (param $0 f64) (result f64)
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
 (func $8 (type $32) (param $0 v128) (result v128)
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
