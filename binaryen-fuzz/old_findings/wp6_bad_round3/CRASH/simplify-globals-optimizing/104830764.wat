(module
 (type $0 (sub (struct (field (mut (ref eq))) (field i32) (field (mut i8)) (field (ref null $0)))))
 (type $1 (struct (field i8) (field (mut (ref $0))) (field (mut (ref null $1))) (field (ref $0))))
 (type $2 (sub (array (mut i64))))
 (type $3 (array exnref))
 (type $4 (array i8))
 (type $5 (struct))
 (type $6 (func))
 (type $7 (array (mut i16)))
 (type $8 (func (param i32)))
 (type $9 (func (result i32)))
 (type $10 (func (param f64)))
 (type $11 (func (param externref)))
 (type $12 (func (result f64)))
 (type $13 (func (result i64 i64)))
 (type $14 (func (result (ref (exact $3)) (ref string) (ref (exact $2)))))
 (type $15 (func (param i64)))
 (type $16 (func (param f32)))
 (type $17 (func (param v128)))
 (type $18 (func (param anyref)))
 (type $19 (func (param funcref)))
 (type $20 (func (param i32 i32)))
 (type $21 (func (param (ref eq) (ref null $1)) (result i64 (ref null $3))))
 (type $22 (func (param (ref null $3)) (result (ref $1))))
 (type $23 (func (param i32 i64) (result structref i32 (ref null $1) i32 f64 funcref)))
 (type $24 (func (param (ref string) (ref array) (ref null $2) f64) (result i32)))
 (type $25 (func (param (ref $3) f32 (ref eq) exnref arrayref) (result eqref)))
 (type $26 (func (param (ref null $2) i64 (ref $3) v128) (result i31ref)))
 (type $27 (func (result (ref null $0))))
 (type $28 (func (result (ref $1))))
 (type $29 (func (result i64)))
 (type $30 (func (param v128 f32) (result (ref null $3) externref (ref null $2))))
 (type $31 (func (param (ref $3)) (result v128)))
 (type $32 (func (param (ref null $2)) (result i64 i64 (ref null $2) (ref null $3) i31ref f32)))
 (type $33 (func (param (ref null $3) structref (ref $2) (ref null $2) (ref null $2)) (result funcref)))
 (type $34 (func (param externref) (result externref)))
 (type $35 (func (result externref)))
 (type $36 (func (param externref) (result i64 i64 (ref null $2) (ref null $3) i31ref f32)))
 (type $37 (func (result i64 (ref (exact $3)))))
 (type $38 (func (result i64 (ref null $3))))
 (type $39 (func (result structref i32 (ref null $1) i32 f64 funcref)))
 (type $40 (func (result (ref null $3) externref (ref null $2))))
 (type $41 (func (result i64 i64 (ref null $2) (ref null $3) i31ref f32)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_16" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $8) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $15) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $16) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $10) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $17) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $18) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $19) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $11) (param externref)))
 (import "fuzzing-support" "call-export" (func $fimport$9 (type $20) (param i32 i32)))
 (global $global$0 (mut (ref $0)) (struct.new $0
  (ref.i31
   (i32.const 119)
  )
  (i32.const 637750070)
  (i32.const 128)
  (struct.new $0
   (struct.new_default $5)
   (i32.const -126)
   (i32.const -2147483648)
   (struct.new $0
    (ref.i31
     (i32.const -32)
    )
    (i32.const 8388608)
    (i32.const 2147483646)
    (struct.new $0
     (struct.new_default $5)
     (i32.const 65536)
     (i32.const -2049)
     (struct.new $0
      (ref.i31
       (i32.const -89)
      )
      (i32.const 65444)
      (i32.const -131073)
      (struct.new $0
       (ref.i31
        (i32.const 1073741825)
       )
       (i32.const 536870913)
       (i32.const -95)
       (struct.new $0
        (ref.i31
         (i32.const -32767)
        )
        (i32.const 46858)
        (i32.const -32768)
        (struct.new $0
         (array.new_fixed $4 0)
         (i32.const 65434)
         (i32.const 2)
         (struct.new $0
          (ref.i31
           (i32.const -2147483648)
          )
          (i32.const -4095)
          (i32.const -1)
          (struct.new $0
           (ref.i31
            (i32.const -2097153)
           )
           (i32.const -20389)
           (i32.const -32767)
           (struct.new $0
            (struct.new_default $5)
            (i32.const -33554432)
            (i32.const 63)
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
  )
 ))
 (global $global$1 (mut (ref null $2)) (array.new_default $2
  (i32.const 72)
 ))
 (global $global$2 (mut f32) (f32.const 4294946816))
 (global $global$3 f32 (f32.const -512))
 (global $global$4 structref (struct.new_default $5))
 (global $global$5 (ref null $3) (ref.null none))
 (global $global$6 f32 (f32.const 34359738368))
 (global $global$7 (ref null $1) (struct.new $1
  (i32.const 32768)
  (struct.new $0
   (struct.new_default $5)
   (i32.const -4034715)
   (i32.const 44829)
   (struct.new $0
    (ref.i31
     (i32.const -28)
    )
    (i32.const 15424)
    (i32.const -66)
    (struct.new $0
     (array.new_fixed $4 0)
     (i32.const -1)
     (i32.const -664)
     (struct.new $0
      (ref.i31
       (i32.const -65536)
      )
      (i32.const -134217729)
      (i32.const 64)
      (struct.new $0
       (array.new_fixed $4 0)
       (i32.const -103)
       (i32.const -98)
       (ref.null none)
      )
     )
    )
   )
  )
  (struct.new $1
   (i32.const 2147483647)
   (struct.new $0
    (array.new_fixed $4 0)
    (i32.const 536870911)
    (i32.const 512)
    (struct.new $0
     (ref.i31
      (i32.const 221)
     )
     (i32.const -21123)
     (i32.const -78)
     (struct.new $0
      (struct.new_default $5)
      (i32.const -44)
      (i32.const -33)
      (struct.new $0
       (ref.i31
        (i32.const 128)
       )
       (i32.const -2147483647)
       (i32.const 34)
       (struct.new $0
        (struct.new_default $5)
        (i32.const 88)
        (i32.const 33)
        (struct.new $0
         (ref.i31
          (i32.const -65)
         )
         (i32.const 128)
         (i32.const -18)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const -50)
          (i32.const -38)
          (struct.new $0
           (ref.i31
            (i32.const -65535)
           )
           (i32.const 65536)
           (i32.const -28)
           (ref.null none)
          )
         )
        )
       )
      )
     )
    )
   )
   (struct.new $1
    (i32.const -8102046)
    (struct.new $0
     (ref.i31
      (i32.const -46)
     )
     (i32.const 42776)
     (i32.const 32766)
     (ref.null none)
    )
    (ref.null none)
    (struct.new $0
     (array.new_fixed $4 0)
     (i32.const 32768)
     (i32.const 9)
     (struct.new $0
      (array.new_fixed $4 0)
      (i32.const -107)
      (i32.const -1)
      (struct.new $0
       (array.new_fixed $4 0)
       (i32.const -117)
       (i32.const -128)
       (struct.new $0
        (array.new_fixed $4 0)
        (i32.const 128)
        (i32.const -32767)
        (struct.new $0
         (struct.new_default $5)
         (i32.const 65445)
         (i32.const -2048)
         (struct.new $0
          (struct.new_default $5)
          (i32.const -1475662215)
          (i32.const 65430)
          (struct.new $0
           (array.new_fixed $4 0)
           (i32.const -255)
           (i32.const -255)
           (struct.new $0
            (array.new_fixed $4 0)
            (i32.const -65535)
            (i32.const 16384)
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
   (struct.new $0
    (struct.new_default $5)
    (i32.const 8388608)
    (i32.const 1023)
    (ref.null none)
   )
  )
  (struct.new $0
   (ref.i31
    (i32.const -26)
   )
   (i32.const -122)
   (i32.const -57)
   (struct.new $0
    (struct.new_default $5)
    (i32.const -22696)
    (i32.const -2868421)
    (struct.new $0
     (struct.new_default $5)
     (i32.const -16777216)
     (i32.const -27011)
     (struct.new $0
      (ref.i31
       (i32.const -3982060)
      )
      (i32.const -2)
      (i32.const -32768)
      (ref.null none)
     )
    )
   )
  )
 ))
 (global $global$8 (ref null $2) (array.new $2
  (i64.const -32769)
  (i32.const 6)
 ))
 (global $global$9 i32 (i32.const 268435457))
 (global $global$10 (ref struct) (struct.new_default $5))
 (global $global$11 (ref null $3) (array.new_default $3
  (i32.const 79)
 ))
 (global $global$12 (ref null $3) (global.get $global$11))
 (global $global$13 v128 (v128.const i32x4 0xff800051 0x4f770000 0x09170000 0x0000fff1))
 (global $global$14 (ref null $0) (ref.null none))
 (global $global$15 i32 (i32.const -102))
 (global $global$16 f64 (f64.const -nan:0xfffffffffffe3))
 (global $global$17 (mut i64) (i64.const 4503599627370497))
 (global $global$18 (mut v128) (v128.const i32x4 0x00000001 0x00000000 0x000000fe 0x00000000))
 (global $global$19 f32 (f32.const -7593625))
 (global $global$20 i32 (i32.const 8))
 (global $global$21 f32 (f32.const -nan:0x7fffcc))
 (global $global$22 (mut i32) (i32.const 100))
 (memory $0 16 16 shared)
 (data $0 (i32.const 0) "\e99\"\82")
 (table $0 i64 6 6 funcref)
 (table $1 3 exnref)
 (elem $0 (table $0) (i64.const 0) func $0 $0 $12 $17 $17 $21)
 (elem declare func $24 $4 $6 $7 $fimport$1 $fimport$8 $fimport$9)
 (tag $tag$0 (type $10) (param f64))
 (tag $tag$1 (type $6))
 (export "global$_1" (global $global$1))
 (export "global$_2" (global $global$2))
 (export "global$_5" (global $global$8))
 (export "global$_7" (global $global$10))
 (export "global$_9" (global $global$12))
 (export "global$_12" (global $global$17))
 (export "global$_13" (global $global$18))
 (export "tag$" (tag $tag$0))
 (export "func_invoker" (func $1))
 (export "func_12" (func $26))
 (export "func_12_invoker" (func $3))
 (export "func_14_invoker" (func $5))
 (export "func_17_invoker" (func $8))
 (export "func_19_invoker" (func $10))
 (export "func_21" (func $27))
 (export "func_22_invoker" (func $13))
 (export "func_25" (func $15))
 (export "func_25_invoker" (func $16))
 (export "func_27_invoker" (func $18))
 (export "func_31" (func $21))
 (export "func_31_invoker" (func $22))
 (export "func_33" (func $28))
 (export "func_35" (func $25))
 (func $0 (type $21) (param $0 (ref eq)) (param $1 (ref null $1)) (result i64 (ref null $3))
  (local $2 exnref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block (type $37) (result i64 (ref (exact $3)))
   (call $fimport$5
    (global.get $global$18)
   )
   (tuple.make 2
    (i64.const 65535)
    (array.new $3
     (block $block (result (ref exn))
      (try_table (catch_all_ref $block)
       (throw $tag$1)
      )
      (unreachable)
     )
     (i32.and
      (i32.const 17)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $1 (type $6)
  (local $0 f64)
  (local $1 f64)
  (local $2 i32)
  (local $3 i32)
  (local $4 f32)
  (local $5 (ref $2))
  (local $6 (ref string))
  (local $7 nullexternref)
  (local $8 (ref $0))
  (local $scratch (tuple i64 (ref null $3)))
  (local $scratch_10 i64)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_10
     (tuple.extract 2 0
      (local.tee $scratch
       (call $0
        (array.new_fixed $4 0)
        (struct.new $1
         (global.get $global$9)
         (struct.new $0
          (struct.new_default $5)
          (global.get $global$9)
          (global.get $global$9)
          (global.get $global$0)
         )
         (struct.new $1
          (i32.const -4503)
          (loop $label (result (ref $0))
           (if
            (i32.eqz
             (global.get $global$22)
            )
            (then
             (global.set $global$22
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$22
            (i32.sub
             (global.get $global$22)
             (i32.const 1)
            )
           )
           (loop
            (if
             (i32.eqz
              (global.get $global$22)
             )
             (then
              (global.set $global$22
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$22
             (i32.sub
              (global.get $global$22)
              (i32.const 1)
             )
            )
            (block
             (if
              (i32.lt_u
               (local.tee $2
                (i32.const -32768)
               )
               (array.len
                (local.tee $5
                 (select (result (ref (exact $2)))
                  (array.new $2
                   (i64.const 127)
                   (i32.and
                    (i32.const 21)
                    (i32.const 1023)
                   )
                  )
                  (array.new_default $2
                   (i32.and
                    (i32.const 76)
                    (i32.const 1023)
                   )
                  )
                  (i32.shr_u
                   (i32.const -86)
                   (f64.ge
                    (local.tee $0
                     (f64.const -16385)
                    )
                    (f64.load offset=3 align=4
                     (i32.and
                      (i32.const 16)
                      (i32.const 15)
                     )
                    )
                   )
                  )
                 )
                )
               )
              )
              (then
               (array.set $2
                (local.get $5)
                (local.get $2)
                (i64.const 2147483648)
               )
              )
             )
             (if
              (i32.eqz
               (string.compare
                (string.const "")
                (local.tee $6
                 (string.const "944\c2\a3\c2\a3")
                )
               )
              )
              (then
               (call $fimport$8
                (local.tee $7
                 (ref.null noextern)
                )
               )
              )
              (else
               (nop)
              )
             )
            )
           )
           (br_if $label
            (local.get $3)
           )
           (global.get $global$0)
          )
          (struct.new $1
           (local.get $3)
           (struct.new $0
            (array.new_fixed $4 0)
            (i32.const 33554433)
            (i32.const -60)
            (struct.new $0
             (struct.new $1
              (i32.const 64)
              (struct.new $0
               (struct.new $0
                (array.new_fixed $4 0)
                (global.get $global$9)
                (i32.const 33554432)
                (ref.null none)
               )
               (i32.const -1)
               (local.get $3)
               (struct.new $0
                (array.new_fixed $4 0)
                (local.get $3)
                (local.get $3)
                (global.get $global$0)
               )
              )
              (struct.new $1
               (i32.const -120)
               (struct.new $0
                (ref.i31
                 (i32.const -32767)
                )
                (i32.const -256)
                (global.get $global$9)
                (global.get $global$0)
               )
               (struct.new $1
                (local.get $3)
                (struct.new $0
                 (ref.i31
                  (i32.const -4194305)
                 )
                 (global.get $global$9)
                 (global.get $global$9)
                 (global.get $global$0)
                )
                (struct.new $1
                 (global.get $global$9)
                 (global.get $global$0)
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (struct.new $0
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (i32.const -80)
                 (global.get $global$9)
                 (ref.null none)
                )
               )
               (struct.new $0
                (global.get $global$10)
                (i32.const -3)
                (global.get $global$9)
                (global.get $global$0)
               )
              )
              (global.get $global$0)
             )
             (global.get $global$9)
             (local.get $3)
             (ref.null none)
            )
           )
           (struct.new $1
            (local.get $3)
            (struct.new $0
             (struct.new_default $5)
             (local.get $3)
             (global.get $global$9)
             (struct.new $0
              (array.new $3
               (ref.null noexn)
               (i32.and
                (i32.const 51)
                (i32.const 1023)
               )
              )
              (local.get $3)
              (local.get $3)
              (ref.null none)
             )
            )
            (struct.new $1
             (i32.const -41)
             (global.get $global$0)
             (struct.new $1
              (i32.const 128)
              (struct.new $0
               (struct.new_default $5)
               (i32.const 64)
               (global.get $global$9)
               (struct.new $0
                (ref.i31
                 (i32.const 65416)
                )
                (i32.const -29150)
                (global.get $global$9)
                (ref.null none)
               )
              )
              (struct.new $1
               (local.get $3)
               (global.get $global$0)
               (ref.null none)
               (global.get $global$0)
              )
              (struct.new $0
               (ref.i31
                (i32.const 157)
               )
               (local.get $3)
               (local.get $3)
               (struct.new $0
                (array.new $2
                 (global.get $global$17)
                 (i32.and
                  (i32.const 92)
                  (i32.const 1023)
                 )
                )
                (local.get $3)
                (local.get $3)
                (ref.null none)
               )
              )
             )
             (global.get $global$0)
            )
            (global.get $global$0)
           )
           (struct.new $0
            (array.new_fixed $4 0)
            (local.get $3)
            (local.get $3)
            (struct.new $0
             (array.new_default $2
              (i32.and
               (i32.const 60)
               (i32.const 1023)
              )
             )
             (global.get $global$9)
             (local.get $3)
             (global.get $global$0)
            )
           )
          )
          (global.get $global$0)
         )
         (loop $label1 (result (ref $0))
          (if
           (i32.eqz
            (global.get $global$22)
           )
           (then
            (global.set $global$22
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$22
           (i32.sub
            (global.get $global$22)
            (i32.const 1)
           )
          )
          (block
           (call $fimport$4
            (loop (result f64)
             (if
              (i32.eqz
               (global.get $global$22)
              )
              (then
               (global.set $global$22
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$22
              (i32.sub
               (global.get $global$22)
               (i32.const 1)
              )
             )
             (block (result f64)
              (call $fimport$6
               (array.new_default $2
                (i32.and
                 (i32.const 69)
                 (i32.const 1023)
                )
               )
              )
              (global.get $global$16)
             )
            )
           )
           (drop
            (i64.const -9223372036854775807)
           )
          )
          (br_if $label1
           (i64.lt_u
            (global.get $global$17)
            (i64.atomic.rmw8.cmpxchg_u offset=22
             (i32.and
              (local.get $3)
              (i32.const 15)
             )
             (try (result i64)
              (do
               (i64.const -118)
              )
              (catch $tag$0
               (local.set $1 (f64.neg (pop f64)))
               (global.get $global$17)
              )
              (catch_all
               (i64.const -60)
              )
             )
             (i64.reinterpret_f64
              (f64x2.extract_lane 1
               (try_table (result v128) (catch_all $label1)
                (loop $label3 (result v128)
                 (if
                  (i32.eqz
                   (global.get $global$22)
                  )
                  (then
                   (global.set $global$22
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$22
                  (i32.sub
                   (global.get $global$22)
                   (i32.const 1)
                  )
                 )
                 (call $fimport$8
                  (loop $label2 (result (ref string))
                   (if
                    (i32.eqz
                     (global.get $global$22)
                    )
                    (then
                     (global.set $global$22
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$22
                    (i32.sub
                     (global.get $global$22)
                     (i32.const 1)
                    )
                   )
                   (try_table (catch_all $label1)
                    (nop)
                   )
                   (br_if $label2
                    (i32.eqz
                     (local.get $3)
                    )
                   )
                   (string.const "")
                  )
                 )
                 (br_if $label3
                  (i32.eqz
                   (local.get $3)
                  )
                 )
                 (v128.const i32x4 0xffffffa3 0x42da0000 0x42d20000 0xc2300000)
                )
               )
              )
             )
            )
           )
          )
          (local.tee $8
           (global.get $global$0)
          )
         )
        )
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch)
     )
    )
    (local.get $scratch_10)
   )
  )
 )
 (@binaryen.js.called)
 (func $2 (type $22) (param $0 (ref null $3)) (result (ref $1))
  (local $1 i64)
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
  (local $13 f64)
  (local $14 (ref null $0))
  (local $15 (ref null $1))
  (local $16 (ref $3))
  (local $17 (ref $2))
  (local $18 (ref $2))
  (local $19 (ref $2))
  (local $20 (ref $2))
  (local $21 (ref $2))
  (local $22 (ref $2))
  (local $23 (ref i31))
  (local $24 (ref i31))
  (local $25 (ref i31))
  (local $26 (ref string))
  (local $27 anyref)
  (local $scratch nullref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (local.set $26
   (string.const "\ed\a0\80")
  )
  (local.set $23
   (ref.i31
    (i32.const 255)
   )
  )
  (local.set $17
   (array.new $2
    (local.get $1)
    (i32.and
     (i32.const 80)
     (i32.const 1023)
    )
   )
  )
  (local.set $15
   (struct.new $1
    (local.get $3)
    (global.get $global$0)
    (ref.as_non_null
     (local.get $15)
    )
    (ref.as_non_null
     (local.get $14)
    )
   )
  )
  (local.set $14
   (struct.new $0
    (array.new_fixed $4 0)
    (local.get $3)
    (global.get $global$9)
    (struct.new $0
     (array.new $3
      (block $block (result (ref exn))
       (try_table (catch_all_ref $block)
        (throw $tag$1)
       )
       (unreachable)
      )
      (i32.and
       (i32.const 71)
       (i32.const 1023)
      )
     )
     (i32.const 67108864)
     (local.get $3)
     (struct.new $0
      (struct.new $1
       (i32.const -2147483648)
       (global.get $global$0)
       (struct.new $1
        (global.get $global$9)
        (global.get $global$0)
        (struct.new $1
         (local.get $2)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const 128)
          (global.get $global$9)
          (global.get $global$0)
         )
         (struct.new $1
          (i32.const 32767)
          (struct.new $0
           (array.new_default $2
            (i32.and
             (i32.const 1)
             (i32.const 1023)
            )
           )
           (i32.const -32768)
           (global.get $global$9)
           (struct.new $0
            (array.new $3
             (block $block1 (result (ref exn))
              (try_table (catch_all_ref $block1)
               (throw $tag$1)
              )
              (unreachable)
             )
             (i32.and
              (i32.const 2)
              (i32.const 1023)
             )
            )
            (local.get $3)
            (local.get $3)
            (ref.null none)
           )
          )
          (ref.null none)
          (global.get $global$0)
         )
         (struct.new $0
          (ref.as_non_null
           (local.get $15)
          )
          (i32.const 11832)
          (local.get $2)
          (struct.new $0
           (ref.i31
            (i32.const -1)
           )
           (global.get $global$9)
           (global.get $global$9)
           (struct.new $0
            (struct.new $1
             (local.get $3)
             (struct.new $0
              (ref.i31
               (i32.const -14727)
              )
              (local.get $2)
              (global.get $global$9)
              (ref.as_non_null
               (local.get $14)
              )
             )
             (struct.new $1
              (i32.const 134217728)
              (global.get $global$0)
              (ref.null none)
              (ref.as_non_null
               (local.get $14)
              )
             )
             (struct.new $0
              (ref.as_non_null
               (local.get $14)
              )
              (global.get $global$9)
              (local.get $2)
              (ref.null none)
             )
            )
            (global.get $global$9)
            (i32.const -80)
            (struct.new $0
             (array.new $2
              (local.get $1)
              (i32.and
               (i32.const 42)
               (i32.const 1023)
              )
             )
             (i32.const 8)
             (local.get $3)
             (struct.new $0
              (array.new_fixed $4 0)
              (local.get $2)
              (i32.const 131072)
              (global.get $global$0)
             )
            )
           )
          )
         )
        )
        (global.get $global$0)
       )
       (global.get $global$0)
      )
      (local.get $2)
      (i32.const -111)
      (ref.null none)
     )
    )
   )
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$22)
     )
     (then
      (global.set $global$22
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$22
     (i32.sub
      (global.get $global$22)
      (i32.const 1)
     )
    )
    (nop)
    (br_if $label
     (i32.eqz
      (ref.eq
       (ref.null none)
       (array.new $3
        (block $block2 (result (ref exn))
         (try_table (catch_all_ref $block2)
          (throw $tag$1)
         )
         (unreachable)
        )
        (i32.and
         (i32.const 82)
         (i32.const 1023)
        )
       )
      )
     )
    )
    (block $block4
     (if
      (i32.lt_u
       (i32.add
        (local.tee $10
         (struct.get_s $0 2
          (ref.as_non_null
           (local.get $14)
          )
         )
        )
        (local.tee $11
         (ref.eq
          (select (result (ref eq))
           (array.new_fixed $4 0)
           (struct.new_default $5)
           (if (result i32)
            (i32.const -144961237)
            (then
             (i32.const -2)
            )
            (else
             (call_ref $11
              (string.const "\ed\bd\881007")
              (ref.func $fimport$8)
             )
             (local.get $3)
            )
           )
          )
          (struct.new $1
           (i32.atomic.load8_u offset=3
            (i32.and
             (i31.get_s
              (local.get $23)
             )
             (i32.const 15)
            )
           )
           (loop $label1 (result (ref $0))
            (if
             (i32.eqz
              (global.get $global$22)
             )
             (then
              (global.set $global$22
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$22
             (i32.sub
              (global.get $global$22)
              (i32.const 1)
             )
            )
            (block
             (loop
              (if
               (i32.eqz
                (global.get $global$22)
               )
               (then
                (global.set $global$22
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$22
               (i32.sub
                (global.get $global$22)
                (i32.const 1)
               )
              )
              (block
               (loop
                (if
                 (i32.eqz
                  (global.get $global$22)
                 )
                 (then
                  (global.set $global$22
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$22
                 (i32.sub
                  (global.get $global$22)
                  (i32.const 1)
                 )
                )
                (block
                 (drop
                  (i32.const -16)
                 )
                 (table.set $1
                  (i32.const 2)
                  (block $block3 (result (ref exn))
                   (try_table (catch_all_ref $block3)
                    (drop
                     (br_on_null $label1
                      (local.get $17)
                     )
                    )
                    (throw $tag$0
                     (f64.const 18446744073709551615)
                    )
                   )
                   (unreachable)
                  )
                 )
                )
               )
               (loop
                (if
                 (i32.eqz
                  (global.get $global$22)
                 )
                 (then
                  (global.set $global$22
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$22
                 (i32.sub
                  (global.get $global$22)
                  (i32.const 1)
                 )
                )
                (try_table (catch_all $block4)
                 (drop
                  (ref.as_non_null
                   (local.tee $14
                    (ref.as_non_null
                     (local.get $14)
                    )
                   )
                  )
                 )
                )
               )
              )
             )
             (call $fimport$8
              (global.get $gimport$0)
             )
            )
            (drop
             (ref.i31
              (i32.const -127)
             )
            )
            (loop $label2
             (if
              (i32.eqz
               (global.get $global$22)
              )
              (then
               (global.set $global$22
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$22
              (i32.sub
               (global.get $global$22)
               (i32.const 1)
              )
             )
             (if
              (i32.eqz
               (global.get $global$9)
              )
              (then
               (throw $tag$0
                (f64.load offset=22 align=4
                 (i32.and
                  (i32.const -30424)
                  (i32.const 15)
                 )
                )
               )
              )
              (else
               (if
                (i32.lt_u
                 (local.tee $5
                  (i32.const -256)
                 )
                 (array.len
                  (local.tee $19
                   (local.get $17)
                  )
                 )
                )
                (then
                 (array.set $2
                  (local.get $19)
                  (local.get $5)
                  (local.get $1)
                 )
                )
               )
              )
             )
             (br_if $label2
              (i32.eqz
               (local.tee $2
                (global.get $global$9)
               )
              )
             )
             (loop $label3
              (if
               (i32.eqz
                (global.get $global$22)
               )
               (then
                (global.set $global$22
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$22
               (i32.sub
                (global.get $global$22)
                (i32.const 1)
               )
              )
              (if
               (i32.lt_u
                (i32.add
                 (local.tee $6
                  (i32.const -11)
                 )
                 (local.tee $7
                  (i32.const -35)
                 )
                )
                (array.len
                 (local.tee $20
                  (if (result (ref $2))
                   (i32.eqz
                    (i32.const 2147483647)
                   )
                   (then
                    (local.tee $17
                     (local.get $17)
                    )
                   )
                   (else
                    (local.get $17)
                   )
                  )
                 )
                )
               )
               (then
                (if
                 (i32.lt_u
                  (i32.add
                   (local.tee $8
                    (i32.const -2048)
                   )
                   (local.tee $9
                    (local.get $7)
                   )
                  )
                  (array.len
                   (local.tee $21
                    (local.get $17)
                   )
                  )
                 )
                 (then
                  (array.copy $2 $2
                   (local.get $20)
                   (local.get $6)
                   (local.get $21)
                   (local.get $8)
                   (local.get $9)
                  )
                 )
                )
               )
              )
              (br_if $label3
               (local.get $2)
              )
              (block
               (nop)
               (br $label2)
              )
              (unreachable)
             )
             (unreachable)
            )
            (unreachable)
           )
           (block (result (ref (exact $1)))
            (block
             (loop $label4
              (if
               (i32.eqz
                (global.get $global$22)
               )
               (then
                (global.set $global$22
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$22
               (i32.sub
                (global.get $global$22)
                (i32.const 1)
               )
              )
              (block
               (drop
                (i32.and
                 (if (result i32)
                  (i32.const 32767)
                  (then
                   (local.get $3)
                  )
                  (else
                   (local.get $3)
                  )
                 )
                 (i32.const 15)
                )
               )
               (drop
                (i32.and
                 (local.get $2)
                 (i32.const 15)
                )
               )
               (block
                (call $fimport$6
                 (local.tee $27
                  (array.new_fixed $4 0)
                 )
                )
                (br $label4)
               )
               (unreachable)
              )
              (unreachable)
             )
             (unreachable)
            )
            (unreachable)
           )
           (struct.new $0
            (array.new $3
             (ref.null noexn)
             (i32.and
              (i32.const 69)
              (i32.const 1023)
             )
            )
            (local.get $3)
            (global.get $global$9)
            (struct.new $0
             (array.new_fixed $4 0)
             (i32.const -2)
             (global.get $global$9)
             (ref.null none)
            )
           )
          )
         )
        )
       )
       (array.len
        (local.tee $22
         (array.new_default $2
          (i32.and
           (i32.const 49)
           (i32.const 1023)
          )
         )
        )
       )
      )
      (then
       (array.fill $2
        (local.get $22)
        (local.get $10)
        (if (result i64)
         (i32.lt_u
          (local.tee $4
           (f64.eq
            (select
             (f64.const -nan:0xffffffffffff6)
             (block (result f64)
              (drop
               (block (result nullref)
                (local.set $scratch
                 (ref.null none)
                )
                (local.set $13
                 (f64.const -nan:0xfffffffb03620)
                )
                (local.get $scratch)
               )
              )
              (local.get $13)
             )
             (loop (result i32)
              (if
               (i32.eqz
                (global.get $global$22)
               )
               (then
                (global.set $global$22
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$22
               (i32.sub
                (global.get $global$22)
                (i32.const 1)
               )
              )
              (i32.atomic.rmw8.cmpxchg_u acqrel offset=22
               (i32.and
                (ref.eq
                 (struct.new_default $5)
                 (ref.i31
                  (i32.const 32767)
                 )
                )
                (i32.const 15)
               )
               (block (result i32)
                (local.get $3)
               )
               (ref.test nullref
                (ref.null none)
               )
              )
             )
            )
            (f64.min
             (f64.max
              (f64.const -9223372036854775808)
              (f64.load offset=4 align=1
               (i32.and
                (local.get $3)
                (i32.const 15)
               )
              )
             )
             (global.get $global$16)
            )
           )
          )
          (array.len
           (local.tee $18
            (local.tee $17
             (array.new $2
              (loop $label6 (result i64)
               (if
                (i32.eqz
                 (global.get $global$22)
                )
                (then
                 (global.set $global$22
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$22
                (i32.sub
                 (global.get $global$22)
                 (i32.const 1)
                )
               )
               (block $block5
                (global.set $global$2
                 (f32.const -64)
                )
                (drop
                 (i32.const -7648)
                )
                (block
                 (try
                  (do
                   (nop)
                  )
                  (catch_all
                   (nop)
                  )
                 )
                 (br $block5)
                )
                (local.set $23
                 (local.set $24
                  (local.set $25
                   (unreachable)
                  )
                 )
                )
               )
               (br_if $label6
                (stringview_wtf16.get_codeunit
                 (select (result (ref string))
                  (loop $label5 (result (ref string))
                   (if
                    (i32.eqz
                     (global.get $global$22)
                    )
                    (then
                     (global.set $global$22
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$22
                    (i32.sub
                     (global.get $global$22)
                     (i32.const 1)
                    )
                   )
                   (loop $label7
                    (if
                     (i32.eqz
                      (global.get $global$22)
                     )
                     (then
                      (global.set $global$22
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$22
                     (i32.sub
                      (global.get $global$22)
                      (i32.const 1)
                     )
                    )
                    (call_ref $8
                     (stringview_wtf16.get_codeunit
                      (local.tee $26
                       (string.const "\e2\82\ac\ed\bd\88")
                      )
                      (local.get $2)
                     )
                     (ref.func $fimport$1)
                    )
                    (br_if $label7
                     (i32.eqz
                      (try_table (result i32) (catch_all $label5)
                       (drop
                        (br_on_null $label6
                         (struct.new_default $5)
                        )
                       )
                       (local.get $3)
                      )
                     )
                    )
                    (local.set $2
                     (local.get $2)
                    )
                   )
                   (block
                    (nop)
                    (br $block4)
                   )
                   (unreachable)
                  )
                  (local.get $26)
                  (local.get $3)
                 )
                 (block (result i32)
                  (local.set $12
                   (string.compare
                    (string.const "\ed\a0\80\c2\a3")
                    (string.const "\ed\bd\88\f0\90\8d\88")
                   )
                  )
                  (local.get $12)
                 )
                )
               )
               (global.get $global$17)
              )
              (i32.and
               (i32.const 48)
               (i32.const 1023)
              )
             )
            )
           )
          )
         )
         (then
          (array.get $2
           (local.get $18)
           (local.get $4)
          )
         )
         (else
          (i64.const -65535)
         )
        )
        (local.get $11)
       )
      )
     )
     (loop $label8
      (if
       (i32.eqz
        (global.get $global$22)
       )
       (then
        (global.set $global$22
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$22
       (i32.sub
        (global.get $global$22)
        (i32.const 1)
       )
      )
      (table.set $1
       (i32.const 1)
       (ref.null noexn)
      )
      (br_if $label8
       (string.measure_wtf16
        (local.get $26)
       )
      )
      (nop)
     )
     (block $block6
      (drop
       (try_table (result (ref i31)) (catch_all $block6)
        (ref.i31
         (i32.const -127)
        )
       )
      )
      (call $fimport$5
       (i32x4.splat
        (ref.eq
         (loop
          (if
           (i32.eqz
            (global.get $global$22)
           )
           (then
            (global.set $global$22
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$22
           (i32.sub
            (global.get $global$22)
            (i32.const 1)
           )
          )
          (block
           (nop)
           (br $block6)
          )
          (unreachable)
         )
         (unreachable)
        )
       )
      )
      (nop)
     )
    )
   )
   (return
    (struct.new $1
     (i32.const -32766)
     (struct.new $0
      (array.new $2
       (global.get $global$17)
       (i32.and
        (i32.const 26)
        (i32.const 1023)
       )
      )
      (local.get $3)
      (i32.const 262143)
      (global.get $global$0)
     )
     (ref.as_non_null
      (local.get $15)
     )
     (global.get $global$0)
    )
   )
  )
  (unreachable)
 )
 (func $3 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $2
    (array.new_default $3
     (i32.and
      (i32.const 92)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $4 (type $23) (param $0 i32) (param $1 i64) (result structref i32 (ref null $1) i32 f64 funcref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (v128.store offset=4
    (i32.and
     (i32.const -26)
     (i32.const 15)
    )
    (f32x4.splat
     (f32.convert_i64_u
      (local.get $1)
     )
    )
   )
   (return
    (tuple.make 6
     (struct.new_default $5)
     (i32.const -113)
     (struct.new $1
      (local.get $0)
      (global.get $global$0)
      (struct.new $1
       (local.get $0)
       (struct.new $0
        (ref.i31
         (i32.const 8192)
        )
        (i32.const 29958)
        (local.get $0)
        (struct.new $0
         (array.new_fixed $4 0)
         (i32.const -32767)
         (global.get $global$9)
         (global.get $global$0)
        )
       )
       (struct.new $1
        (local.get $0)
        (struct.new $0
         (array.new_fixed $4 0)
         (global.get $global$9)
         (global.get $global$9)
         (struct.new $0
          (struct.new_default $5)
          (local.get $0)
          (local.get $0)
          (global.get $global$0)
         )
        )
        (struct.new $1
         (local.get $0)
         (struct.new $0
          (struct.new_default $5)
          (local.get $0)
          (local.get $0)
          (struct.new $0
           (array.new_default $3
            (i32.and
             (i32.const 57)
             (i32.const 1023)
            )
           )
           (global.get $global$9)
           (global.get $global$9)
           (ref.null none)
          )
         )
         (struct.new $1
          (i32.const -65)
          (struct.new $0
           (struct.new_default $5)
           (global.get $global$9)
           (i32.const -491937)
           (global.get $global$0)
          )
          (struct.new $1
           (local.get $0)
           (struct.new $0
            (array.new_fixed $4 0)
            (i32.const -76)
            (local.get $0)
            (global.get $global$0)
           )
           (struct.new $1
            (global.get $global$9)
            (global.get $global$0)
            (struct.new $1
             (i32.const -7826)
             (struct.new $0
              (struct.new_default $5)
              (local.get $0)
              (local.get $0)
              (struct.new $0
               (struct.new_default $5)
               (global.get $global$9)
               (global.get $global$9)
               (global.get $global$0)
              )
             )
             (struct.new $1
              (global.get $global$9)
              (global.get $global$0)
              (struct.new $1
               (local.get $0)
               (global.get $global$0)
               (struct.new $1
                (local.get $0)
                (global.get $global$0)
                (ref.null none)
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (struct.new $0
                (ref.i31
                 (i32.const -20203)
                )
                (i32.const -2147483648)
                (local.get $0)
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
              (global.get $global$0)
             )
             (global.get $global$0)
            )
            (global.get $global$0)
           )
           (global.get $global$0)
          )
          (struct.new $0
           (array.new_fixed $4 0)
           (i32.const 359627327)
           (i32.const -16)
           (ref.null none)
          )
         )
         (struct.new $0
          (ref.as_non_null
           (ref.null none)
          )
          (global.get $global$9)
          (local.get $0)
          (struct.new $0
           (struct.new_default $5)
           (local.get $0)
           (local.get $0)
           (struct.new $0
            (ref.i31
             (i32.const -116)
            )
            (local.get $0)
            (local.get $0)
            (struct.new $0
             (array.new $3
              (block $block (result (ref exn))
               (try_table (catch_all_ref $block)
                (throw $tag$1)
               )
               (unreachable)
              )
              (i32.and
               (i32.const 83)
               (i32.const 1023)
              )
             )
             (local.get $0)
             (global.get $global$9)
             (struct.new $0
              (ref.i31
               (i32.const 26155)
              )
              (local.get $0)
              (local.get $0)
              (struct.new $0
               (struct.new_default $5)
               (global.get $global$9)
               (local.get $0)
               (global.get $global$0)
              )
             )
            )
           )
          )
         )
        )
        (global.get $global$0)
       )
       (struct.new $0
        (struct.new $0
         (array.new_fixed $4 0)
         (local.get $0)
         (i32.const -15515)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const 63)
          (local.get $0)
          (global.get $global$0)
         )
        )
        (local.get $0)
        (global.get $global$9)
        (struct.new $0
         (array.new_fixed $4 0)
         (local.get $0)
         (local.get $0)
         (ref.null none)
        )
       )
      )
      (struct.new $0
       (array.new_fixed $4 0)
       (global.get $global$9)
       (global.get $global$9)
       (struct.new $0
        (array.new_fixed $4 0)
        (i32.const 0)
        (local.get $0)
        (global.get $global$0)
       )
      )
     )
     (i32.const 46)
     (f64.const -nan:0xfffffffffffd6)
     (ref.func $4)
    )
   )
  )
  (unreachable)
 )
 (func $5 (type $6)
  (local $scratch (tuple structref i32 (ref null $1) i32 f64 funcref))
  (local $scratch_1 f64)
  (local $scratch_2 i32)
  (local $scratch_3 (ref null $1))
  (local $scratch_4 i32)
  (local $scratch_5 structref)
  (local $scratch_6 (tuple structref i32 (ref null $1) i32 f64 funcref))
  (local $scratch_7 f64)
  (local $scratch_8 i32)
  (local $scratch_9 (ref null $1))
  (local $scratch_10 i32)
  (local $scratch_11 structref)
  (local $scratch_12 (tuple structref i32 (ref null $1) i32 f64 funcref))
  (local $scratch_13 f64)
  (local $scratch_14 i32)
  (local $scratch_15 (ref null $1))
  (local $scratch_16 i32)
  (local $scratch_17 structref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (block (result structref)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $4
        (i32.const -93)
        (i64.const -2147483648)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_4
       (tuple.extract 6 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result (ref null $1))
        (local.set $scratch_3
         (tuple.extract 6 2
          (local.get $scratch)
         )
        )
        (drop
         (block (result i32)
          (local.set $scratch_2
           (tuple.extract 6 3
            (local.get $scratch)
           )
          )
          (drop
           (block (result f64)
            (local.set $scratch_1
             (tuple.extract 6 4
              (local.get $scratch)
             )
            )
            (drop
             (tuple.extract 6 5
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
    (local.get $scratch_5)
   )
  )
  (drop
   (block (result structref)
    (local.set $scratch_11
     (tuple.extract 6 0
      (local.tee $scratch_6
       (call $4
        (i32.const 2147483646)
        (i64.const -4503599627370495)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_10
       (tuple.extract 6 1
        (local.get $scratch_6)
       )
      )
      (drop
       (block (result (ref null $1))
        (local.set $scratch_9
         (tuple.extract 6 2
          (local.get $scratch_6)
         )
        )
        (drop
         (block (result i32)
          (local.set $scratch_8
           (tuple.extract 6 3
            (local.get $scratch_6)
           )
          )
          (drop
           (block (result f64)
            (local.set $scratch_7
             (tuple.extract 6 4
              (local.get $scratch_6)
             )
            )
            (drop
             (tuple.extract 6 5
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
      (local.get $scratch_10)
     )
    )
    (local.get $scratch_11)
   )
  )
  (drop
   (block (result structref)
    (local.set $scratch_17
     (tuple.extract 6 0
      (local.tee $scratch_12
       (call $4
        (i32.const 131072)
        (i64.const 4294967175)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_16
       (tuple.extract 6 1
        (local.get $scratch_12)
       )
      )
      (drop
       (block (result (ref null $1))
        (local.set $scratch_15
         (tuple.extract 6 2
          (local.get $scratch_12)
         )
        )
        (drop
         (block (result i32)
          (local.set $scratch_14
           (tuple.extract 6 3
            (local.get $scratch_12)
           )
          )
          (drop
           (block (result f64)
            (local.set $scratch_13
             (tuple.extract 6 4
              (local.get $scratch_12)
             )
            )
            (drop
             (tuple.extract 6 5
              (local.get $scratch_12)
             )
            )
            (local.get $scratch_13)
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
 )
 (func $6 (type $24) (param $0 (ref string)) (param $1 (ref array)) (param $2 (ref null $2)) (param $3 f64) (result i32)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$1
    (string.compare
     (local.tee $0
      (string.const "\f0\90\8d\88")
     )
     (local.get $0)
    )
   )
   (return
    (global.get $global$9)
   )
  )
  (unreachable)
 )
 (func $7 (type $25) (param $0 (ref $3)) (param $1 f32) (param $2 (ref eq)) (param $3 exnref) (param $4 arrayref) (result eqref)
  (local $5 stringref)
  (local $6 (ref struct))
  (local $7 (ref $1))
  (local $8 (ref null $1))
  (local $9 (ref $7))
  (local $10 (ref $7))
  (local $11 (ref string))
  (local $12 (ref null $2))
  (local $13 (ref array))
  (local $14 (ref $2))
  (local $15 (ref $2))
  (local $16 (ref none))
  (local $17 eqref)
  (local $18 externref)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 f64)
  (local $23 f64)
  (local $24 f64)
  (local $25 f64)
  (local $26 i64)
  (local $27 v128)
  (local $28 v128)
  (local $scratch v128)
  (local $scratch_30 nullref)
  (local $scratch_31 i32)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (local.set $15
   (array.new $2
    (i64.const 2047)
    (i32.and
     (i32.const 51)
     (i32.const 1023)
    )
   )
  )
  (local.set $14
   (array.new $2
    (global.get $global$17)
    (i32.and
     (i32.const 55)
     (i32.const 1023)
    )
   )
  )
  (block $block (result eqref)
   (nop)
   (br_on_non_null $block
    (struct.new_default $5)
   )
   (if
    (i32.eqz
     (ref.eq
      (local.tee $7
       (if (result (ref (exact $1)))
        (global.get $global$9)
        (then
         (struct.new $1
          (i32.const -123)
          (global.get $global$0)
          (ref.null none)
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
        (else
         (drop
          (br_on_cast $block (ref null $3) (ref null $3)
           (global.get $global$11)
          )
         )
         (return
          (array.new_fixed $4 0)
         )
        )
       )
      )
      (struct.new $1
       (i32.const -1988)
       (struct.new $0
        (try_table (result (ref eq))
         (local.get $2)
        )
        (try_table (result i32)
         (i32.const 67108864)
        )
        (i32.const -6922151)
        (ref.null none)
       )
       (local.tee $8
        (struct.new $1
         (global.get $global$9)
         (global.get $global$0)
         (local.get $7)
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
       (struct.new $0
        (array.new_fixed $4 0)
        (i32.const -5622147)
        (i32.const -1)
        (ref.null none)
       )
      )
     )
    )
    (then
     (drop
      (local.get $7)
     )
     (block
      (if
       (i32.const -41)
       (then
        (f32.store offset=22
         (i32.and
          (ref.test (ref null $1)
           (if (result (ref null $1))
            (local.tee $19
             (i32.const -828319)
            )
            (then
             (local.get $7)
            )
            (else
             (local.get $8)
            )
           )
          )
          (i32.const 15)
         )
         (f32.convert_i64_u
          (i64.trunc_f64_s
           (f64.const 18446744073709551615)
          )
         )
        )
       )
       (else
        (drop
         (block (result (ref $1))
          (try
           (do
            (call $fimport$9
             (i32.rem_u
              (global.get $global$9)
              (i32.const 12)
             )
             (local.get $19)
            )
           )
           (catch $tag$0
            (local.set $22 (f64.mul (pop f64) (f64.const -1)))
            (call $fimport$1
             (local.get $19)
            )
           )
           (catch_all
            (nop)
           )
          )
          (ref.cast (ref $1)
           (local.get $7)
          )
         )
        )
        (nop)
       )
      )
      (return
       (array.new_fixed $4 0)
      )
     )
     (unreachable)
    )
    (else
     (block
      (nop)
      (call $fimport$1
       (i32.atomic.load offset=22
        (i32.and
         (if (result i32)
          (i32.eqz
           (block (result i32)
            (drop
             (ref.null none)
            )
            (local.set $11
             (string.const "21\c2\a3\f0\90\8d\88")
            )
            (if (result i32)
             (i32.lt_u
              (i32.add
               (local.tee $20
                (i32.const 65535)
               )
               (local.tee $21
                (string.measure_wtf16
                 (local.get $11)
                )
               )
              )
              (array.len
               (local.tee $10
                (local.tee $9
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
             )
             (then
              (string.encode_wtf16_array
               (local.get $11)
               (local.get $10)
               (local.get $20)
              )
             )
             (else
              (local.get $19)
             )
            )
           )
          )
          (then
           (global.get $global$9)
          )
          (else
           (try (result i32)
            (do
             (local.set $scratch_31
              (i32.const -1000784822)
             )
             (drop
              (block (result nullref)
               (local.set $scratch_30
                (ref.null none)
               )
               (drop
                (block (result v128)
                 (local.set $scratch
                  (v128.const i32x4 0xffb50726 0xdf000000 0xfff66a2f 0x6760252d)
                 )
                 (drop
                  (ref.func $7)
                 )
                 (local.get $scratch)
                )
               )
               (local.get $scratch_30)
              )
             )
             (local.get $scratch_31)
            )
            (catch $tag$0
             (drop (pop f64))
             (if (result i32)
              (i32.eqz
               (local.tee $19
                (i32.const -2147483648)
               )
              )
              (then
               (return
                (struct.new_default $5)
               )
              )
              (else
               (i32.const 126)
              )
             )
            )
           )
          )
         )
         (i32.const 15)
        )
       )
      )
     )
     (drop
      (global.get $global$9)
     )
     (drop
      (struct.new $0
       (try_table (result (ref (exact $4)))
        (array.new_fixed $4 0)
       )
       (i32.const 14)
       (local.get $19)
       (ref.cast (ref none)
        (ref.as_non_null
         (ref.null none)
        )
       )
      )
     )
     (block
      (drop
       (ref.as_non_null
        (ref.null none)
       )
      )
      (block
       (local.set $19
        (i32.const -2782)
       )
       (return
        (ref.i31
         (i32.const -1048576)
        )
       )
      )
      (unreachable)
     )
     (unreachable)
    )
   )
   (local.set $16
    (local.set $13
     (local.set $0
      (local.set $14
       (local.set $15
        (local.set $13
         (local.set $6
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
 (func $8 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $7
    (array.new_default $3
     (i32.and
      (i32.const 26)
      (i32.const 1023)
     )
    )
    (f32.const 4398046511104)
    (struct.new_default $5)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (global.get $global$16)
      )
     )
     (unreachable)
    )
    (array.new_fixed $4 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $9 (type $26) (param $0 (ref null $2)) (param $1 i64) (param $2 (ref $3)) (param $3 v128) (result i31ref)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
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
  (local $20 f32)
  (local $21 i64)
  (local $22 (ref null $3))
  (local $23 (ref null $2))
  (local $24 eqref)
  (local $25 (ref $2))
  (local $26 (ref $2))
  (local $27 (ref $2))
  (local $28 (ref $2))
  (local $29 (ref $2))
  (local $30 (ref $2))
  (local $31 (ref string))
  (local $32 (ref null $0))
  (local $33 (ref $0))
  (local $34 (ref $0))
  (local $35 (ref $1))
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (local.set $34
   (global.get $global$0)
  )
  (local.set $25
   (array.new_default $2
    (i32.const 83)
   )
  )
  (block $block2 (result i31ref)
   (block $block1
    (if
     (i32.const -82)
     (then
      (block $block
       (if
        (i32.lt_u
         (i32.add
          (local.tee $11
           (local.get $9)
          )
          (local.tee $12
           (struct.get_u $0 2
            (select (result (ref $0))
             (br_on_null $block
              (block (result (ref $0))
               (loop
                (if
                 (i32.eqz
                  (global.get $global$22)
                 )
                 (then
                  (global.set $global$22
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$22
                 (i32.sub
                  (global.get $global$22)
                  (i32.const 1)
                 )
                )
                (block
                 (block
                  (nop)
                  (call $fimport$0
                   (i32.const -134217728)
                  )
                 )
                 (block
                  (loop $label
                   (if
                    (i32.eqz
                     (global.get $global$22)
                    )
                    (then
                     (global.set $global$22
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$22
                    (i32.sub
                     (global.get $global$22)
                     (i32.const 1)
                    )
                   )
                   (block
                    (local.set $5
                     (local.get $4)
                    )
                   )
                   (br_if $label
                    (local.tee $8
                     (local.get $8)
                    )
                   )
                   (if
                    (i32.lt_u
                     (local.tee $10
                      (local.get $8)
                     )
                     (array.len
                      (local.tee $26
                       (local.get $25)
                      )
                     )
                    )
                    (then
                     (array.set $2
                      (local.get $26)
                      (local.get $10)
                      (local.get $1)
                     )
                    )
                   )
                  )
                  (drop
                   (block (result (ref none))
                    (local.set $21
                     (local.get $1)
                    )
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (drop
                   (global.get $global$0)
                  )
                  (unreachable)
                 )
                )
               )
               (global.get $global$0)
              )
             )
             (select (result (ref $0))
              (struct.new $0
               (array.new_default $3
                (i32.and
                 (i32.const 1)
                 (i32.const 1023)
                )
               )
               (global.get $global$9)
               (global.get $global$9)
               (struct.new $0
                (array.new $3
                 (ref.null noexn)
                 (i32.and
                  (i32.const 40)
                  (i32.const 1023)
                 )
                )
                (local.get $8)
                (local.get $9)
                (ref.null none)
               )
              )
              (ref.as_non_null
               (local.tee $32
                (local.tee $33
                 (local.tee $34
                  (try_table (result (ref none)) (catch_all $block1)
                   (if (result (ref none))
                    (i32.eqz
                     (local.get $9)
                    )
                    (then
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                    (else
                     (block $block3 (result (ref none))
                      (br_on_non_null $block2
                       (ref.i31
                        (i32.const 8)
                       )
                      )
                      (br_if $block3
                       (ref.as_non_null
                        (ref.null none)
                       )
                       (i32.eqz
                        (i32.const 67108865)
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
              (select
               (f64.gt
                (if (result f64)
                 (i32.eqz
                  (string.measure_wtf16
                   (local.tee $31
                    (string.const "")
                   )
                  )
                 )
                 (then
                  (drop
                   (array.new_fixed $4 0)
                  )
                  (br $block)
                 )
                 (else
                  (br_if $block
                   (local.get $8)
                  )
                  (loop $label1 (result f64)
                   (if
                    (i32.eqz
                     (global.get $global$22)
                    )
                    (then
                     (global.set $global$22
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$22
                    (i32.sub
                     (global.get $global$22)
                     (i32.const 1)
                    )
                   )
                   (if
                    (i32.const 134217729)
                    (then
                     (drop
                      (br_on_null $block1
                       (if (result (ref $2))
                        (i32.eqz
                         (local.tee $9
                          (i32.const -1)
                         )
                        )
                        (then
                         (local.get $25)
                        )
                        (else
                         (local.get $25)
                        )
                       )
                      )
                     )
                    )
                   )
                   (br_if $label1
                    (loop (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$22)
                      )
                      (then
                       (global.set $global$22
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$22
                      (i32.sub
                       (global.get $global$22)
                       (i32.const 1)
                      )
                     )
                     (local.tee $9
                      (i32.const -67)
                     )
                    )
                   )
                   (f64x2.extract_lane 1
                    (v128.const i32x4 0x1000ffb7 0xff870e20 0x1f4dff01 0x00005540)
                   )
                  )
                 )
                )
                (global.get $global$16)
               )
               (local.tee $9
                (stringview_wtf16.get_codeunit
                 (local.get $31)
                 (block (result i32)
                  (local.set $19
                   (i64.gt_s
                    (local.tee $1
                     (local.get $1)
                    )
                    (local.get $1)
                   )
                  )
                  (local.get $19)
                 )
                )
               )
               (string.compare
                (string.const "968")
                (block (result (ref string))
                 (table.set $0
                  (i64.const 1)
                  (ref.func $fimport$9)
                 )
                 (try_table (result (ref string)) (catch_all $block)
                  (drop
                   (br_on_null $block1
                    (ref.null none)
                   )
                  )
                  (string.const "\ed\a0\80\ed\a0\80")
                 )
                )
               )
              )
             )
             (block (result i32)
              (drop
               (br_on_null $block
                (array.new $2
                 (local.get $1)
                 (i32.and
                  (i32.const 52)
                  (i32.const 1023)
                 )
                )
               )
              )
              (f32.eq
               (local.tee $20
                (f32x4.extract_lane 2
                 (v128.load offset=4 align=1
                  (i32.and
                   (select
                    (i32.const -65536)
                    (f32.gt
                     (f32.const -nan:0x7fffe2)
                     (f32.load offset=22 align=1
                      (i32.and
                       (local.get $9)
                       (i32.const 15)
                      )
                     )
                    )
                    (local.get $8)
                   )
                   (i32.const 15)
                  )
                 )
                )
               )
               (f32.sub
                (local.get $20)
                (block (result f32)
                 (f32.const -19928)
                )
               )
              )
             )
            )
           )
          )
         )
         (array.len
          (local.tee $27
           (array.new_default $2
            (i32.and
             (i32.const 20)
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
            (local.tee $13
             (string.eq
              (string.const "\c2\a3350")
              (string.from_code_point
               (local.get $9)
              )
             )
            )
            (local.tee $14
             (local.get $12)
            )
           )
           (array.len
            (local.tee $28
             (local.tee $25
              (array.new_default $2
               (i32.and
                (i32.const 11)
                (i32.const 1023)
               )
              )
             )
            )
           )
          )
          (then
           (array.copy $2 $2
            (local.get $27)
            (local.get $11)
            (local.get $28)
            (local.get $13)
            (local.get $14)
           )
          )
         )
        )
       )
       (local.set $20
        (local.tee $20
         (local.get $20)
        )
       )
      )
     )
    )
    (local.set $4
     (f64.const 70368744177663.72)
    )
    (loop $label2
     (if
      (i32.eqz
       (global.get $global$22)
      )
      (then
       (global.set $global$22
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$22
      (i32.sub
       (global.get $global$22)
       (i32.const 1)
      )
     )
     (if
      (local.get $8)
      (then
       (call $fimport$0
        (i32.const 0)
       )
       (block $block4
        (try
         (do
          (nop)
         )
         (catch $tag$0
          (local.set $6 (call_ref $__sinkT_0 (pop f64) (ref.func $__popsink_0)))
          (struct.set $1 2
           (local.tee $35
            (struct.new $1
             (try_table (result i32) (catch_all $block4)
              (i32.trunc_sat_f32_s
               (f32.load offset=3 align=1
                (i32.and
                 (local.get $9)
                 (i32.const 15)
                )
               )
              )
             )
             (ref.as_non_null
              (local.get $32)
             )
             (struct.new $1
              (local.get $9)
              (global.get $global$0)
              (struct.new $1
               (global.get $global$9)
               (global.get $global$0)
               (ref.null none)
               (ref.as_non_null
                (local.get $32)
               )
              )
              (struct.new $0
               (ref.as_non_null
                (ref.null none)
               )
               (local.get $8)
               (global.get $global$9)
               (global.get $global$0)
              )
             )
             (struct.get $1 3
              (struct.new $1
               (local.get $9)
               (ref.as_non_null
                (local.get $32)
               )
               (ref.as_non_null
                (ref.null none)
               )
               (local.get $34)
              )
             )
            )
           )
           (ref.null none)
          )
         )
         (catch_all
          (if
           (i32.lt_u
            (i32.add
             (local.tee $15
              (if (result i32)
               (ref.test (ref none)
                (ref.cast (ref $0)
                 (ref.as_non_null
                  (local.tee $32
                   (local.get $34)
                  )
                 )
                )
               )
               (then
                (nop)
                (struct.get_u $0 2
                 (ref.as_non_null
                  (local.get $32)
                 )
                )
               )
               (else
                (local.get $9)
               )
              )
             )
             (local.tee $16
              (local.tee $9
               (stringview_wtf16.get_codeunit
                (string.const "")
                (local.get $8)
               )
              )
             )
            )
            (array.len
             (local.tee $29
              (local.get $25)
             )
            )
           )
           (then
            (if
             (i32.lt_u
              (i32.add
               (local.tee $17
                (global.get $global$9)
               )
               (local.tee $18
                (local.get $16)
               )
              )
              (array.len
               (local.tee $30
                (local.get $25)
               )
              )
             )
             (then
              (array.copy $2 $2
               (local.get $29)
               (local.get $15)
               (local.get $30)
               (local.get $17)
               (local.get $18)
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
      (else
       (br_if $label2
        (block (result i32)
         (drop
          (br_on_null $block1
           (global.get $global$0)
          )
         )
         (drop
          (local.get $8)
         )
         (block
          (block
           (nop)
           (nop)
          )
          (block
           (local.set $3
            (local.get $3)
           )
           (br $label2)
          )
          (unreachable)
         )
         (local.set $31
          (local.set $2
           (unreachable)
          )
         )
        )
       )
       (i32.store16 offset=2
        (i32.and
         (loop (result i32)
          (if
           (i32.eqz
            (global.get $global$22)
           )
           (then
            (global.set $global$22
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$22
           (i32.sub
            (global.get $global$22)
            (i32.const 1)
           )
          )
          (local.tee $8
           (local.get $8)
          )
         )
         (i32.const 15)
        )
        (local.tee $9
         (local.get $9)
        )
       )
      )
     )
    )
   )
   (try (result i31ref)
    (do
     (ref.i31
      (i32.const -31953)
     )
    )
    (catch_all
     (ref.null none)
    )
   )
  )
 )
 (func $10 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $9
    (array.new_default $2
     (i32.and
      (i32.const 75)
      (i32.const 1023)
     )
    )
    (i64.const -112)
    (array.new_default $3
     (i32.and
      (i32.const 88)
      (i32.const 1023)
     )
    )
    (v128.const i32x4 0x00000080 0x00000000 0x0000007f 0x00000000)
   )
  )
 )
 (func $11 (type $27) (result (ref null $0))
  (local $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 arrayref)
  (local $4 arrayref)
  (local $5 (ref null $3))
  (local $6 externref)
  (local $7 (ref null $2))
  (local $8 (ref string))
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (atomic.fence acqrel)
   (return
    (struct.new $0
     (struct.new_default $5)
     (global.get $global$9)
     (local.get $2)
     (struct.new $0
      (array.new_fixed $4 0)
      (local.get $2)
      (local.get $2)
      (struct.new $0
       (array.new_default $2
        (i32.and
         (i32.const 0)
         (i32.const 1023)
        )
       )
       (local.get $2)
       (local.get $2)
       (struct.new $0
        (array.new_fixed $4 0)
        (local.get $2)
        (local.get $2)
        (struct.new $0
         (struct.new $0
          (ref.i31
           (i32.const -23)
          )
          (local.get $2)
          (local.get $2)
          (struct.new $0
           (array.new_default $2
            (i32.and
             (i32.const 0)
             (i32.const 1023)
            )
           )
           (i32.const -67108864)
           (local.get $2)
           (struct.new $0
            (array.new_fixed $4 0)
            (local.get $2)
            (global.get $global$9)
            (struct.new $0
             (struct.new_default $5)
             (global.get $global$9)
             (i32.const -11)
             (ref.null none)
            )
           )
          )
         )
         (global.get $global$9)
         (global.get $global$9)
         (ref.null none)
        )
       )
      )
     )
    )
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $12 (type $9) (result i32)
  (local $0 i32)
  (local $1 f32)
  (local $2 i64)
  (local $3 v128)
  (local $4 (ref null $3))
  (local $5 arrayref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block (result i32)
   (call $fimport$1
    (local.get $0)
   )
   (global.get $global$9)
  )
 )
 (func $13 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $12)
  )
  (drop
   (call $12)
  )
 )
 (func $14 (type $28) (result (ref $1))
  (local $0 i32)
  (local $1 f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 i64)
  (local $5 eqref)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (struct.new $1
     (i32.const 2147483646)
     (struct.new $0
      (ref.i31
       (i32.const -26818)
      )
      (i32.const -1)
      (i32.const -7369)
      (global.get $global$0)
     )
     (struct.new $1
      (i32.const 32767)
      (global.get $global$0)
      (struct.new $1
       (i32.const 33554431)
       (struct.new $0
        (array.new_fixed $4 0)
        (global.get $global$9)
        (global.get $global$9)
        (struct.new $0
         (struct.new_default $5)
         (i32.const -6202865)
         (i32.const 67108864)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const 0)
          (global.get $global$9)
          (struct.new $0
           (array.new_default $2
            (i32.and
             (i32.const 5)
             (i32.const 1023)
            )
           )
           (i32.const -536870912)
           (i32.const 65498)
           (ref.null none)
          )
         )
        )
       )
       (struct.new $1
        (i32.const -2147483647)
        (struct.new $0
         (array.new_fixed $4 0)
         (i32.const -1567408)
         (i32.const -2675701)
         (struct.new $0
          (struct.new_default $5)
          (i32.const -76)
          (global.get $global$9)
          (struct.new $0
           (ref.i31
            (i32.const -2147483648)
           )
           (i32.const -2)
           (i32.const -129)
           (global.get $global$0)
          )
         )
        )
        (struct.new $1
         (i32.const -65)
         (struct.new $0
          (ref.i31
           (i32.const -65535)
          )
          (i32.const -17903)
          (i32.const 19242)
          (global.get $global$0)
         )
         (ref.null none)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const -7467708)
          (global.get $global$9)
          (struct.new $0
           (struct.new_default $5)
           (i32.const 28690)
           (global.get $global$9)
           (struct.new $0
            (struct.new_default $5)
            (i32.const 32767)
            (i32.const -129)
            (struct.new $0
             (global.get $global$10)
             (i32.const 63)
             (global.get $global$9)
             (struct.new $0
              (array.new_default $2
               (i32.and
                (i32.const 32)
                (i32.const 1023)
               )
              )
              (i32.const -23)
              (i32.const -19450)
              (struct.new $0
               (ref.i31
                (i32.const 32768)
               )
               (i32.const 64)
               (i32.const -84)
               (ref.null none)
              )
             )
            )
           )
          )
         )
        )
        (global.get $global$0)
       )
       (struct.new $0
        (ref.i31
         (i32.const -12016)
        )
        (global.get $global$9)
        (i32.const -107)
        (struct.new $0
         (struct.new $1
          (i32.const -17658)
          (struct.new $0
           (array.new_default $3
            (i32.and
             (i32.const 55)
             (i32.const 1023)
            )
           )
           (i32.const -513)
           (i32.const -85)
           (struct.new $0
            (ref.i31
             (i32.const -65536)
            )
            (i32.const 2097151)
            (i32.const -4564966)
            (struct.new $0
             (struct.new $1
              (i32.const -24231)
              (global.get $global$0)
              (struct.new $1
               (global.get $global$9)
               (global.get $global$0)
               (ref.as_non_null
                (ref.null none)
               )
               (global.get $global$0)
              )
              (struct.new $0
               (ref.i31
                (i32.const -34)
               )
               (global.get $global$9)
               (i32.const -7711146)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
             (i32.const 65534)
             (i32.const 32768)
             (ref.null none)
            )
           )
          )
          (struct.new $1
           (i32.const -48)
           (struct.new $0
            (ref.i31
             (i32.const -83015323)
            )
            (i32.const -129)
            (i32.const 2048)
            (struct.new $0
             (struct.new $1
              (i32.const 39)
              (struct.new $0
               (array.new_fixed $4 0)
               (global.get $global$9)
               (global.get $global$9)
               (ref.null none)
              )
              (ref.null none)
              (struct.new $0
               (ref.i31
                (i32.const 54)
               )
               (i32.const -32767)
               (i32.const 68)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
             (global.get $global$9)
             (global.get $global$9)
             (ref.null none)
            )
           )
           (struct.new $1
            (i32.const -2147483648)
            (struct.new $0
             (struct.new $0
              (array.new_fixed $4 0)
              (global.get $global$9)
              (i32.const -255)
              (struct.new $0
               (ref.i31
                (i32.const 65537)
               )
               (global.get $global$9)
               (i32.const -536870913)
               (ref.null none)
              )
             )
             (i32.const -8246968)
             (i32.const -1715)
             (ref.null none)
            )
            (struct.new $1
             (i32.const -6600177)
             (struct.new $0
              (array.new_fixed $4 0)
              (i32.const 189)
              (i32.const 27)
              (struct.new $0
               (array.new_fixed $4 0)
               (i32.const 2147483647)
               (i32.const -50)
               (ref.null none)
              )
             )
             (struct.new $1
              (i32.const 0)
              (global.get $global$0)
              (struct.new $1
               (global.get $global$9)
               (ref.as_non_null
                (ref.null none)
               )
               (ref.as_non_null
                (ref.null none)
               )
               (ref.as_non_null
                (ref.null none)
               )
              )
              (struct.new $0
               (struct.new_default $5)
               (i32.const 127)
               (i32.const -115)
               (ref.null none)
              )
             )
             (global.get $global$0)
            )
            (struct.new $0
             (array.new $3
              (block $block (result (ref exn))
               (try_table (catch_all_ref $block)
                (throw $tag$1)
               )
               (unreachable)
              )
              (i32.and
               (i32.const 2)
               (i32.const 1023)
              )
             )
             (global.get $global$9)
             (global.get $global$9)
             (struct.new $0
              (array.new_fixed $4 0)
              (i32.const -7589)
              (i32.const -76)
              (struct.new $0
               (ref.as_non_null
                (ref.null none)
               )
               (global.get $global$9)
               (i32.const 13861)
               (global.get $global$0)
              )
             )
            )
           )
           (struct.new $0
            (array.new $2
             (global.get $global$17)
             (i32.and
              (i32.const 82)
              (i32.const 1023)
             )
            )
            (global.get $global$9)
            (i32.const -32767)
            (struct.new $0
             (global.get $global$0)
             (i32.const -2)
             (i32.const -57)
             (struct.new $0
              (array.new_fixed $4 0)
              (i32.const -2030263)
              (global.get $global$9)
              (ref.null none)
             )
            )
           )
          )
          (struct.new $0
           (array.new_fixed $4 0)
           (global.get $global$9)
           (i32.const 8)
           (struct.new $0
            (array.new_default $2
             (i32.and
              (i32.const 75)
              (i32.const 1023)
             )
            )
            (i32.const -38)
            (i32.const -805027272)
            (ref.null none)
           )
          )
         )
         (i32.const -107)
         (i32.const -32768)
         (struct.new $0
          (array.new_fixed $4 0)
          (i32.const -262144)
          (i32.const -25824)
          (struct.new $0
           (struct.new_default $5)
           (i32.const -25589)
           (i32.const -2147483648)
           (struct.new $0
            (array.new_fixed $4 0)
            (i32.const 8193)
            (i32.const -127)
            (global.get $global$0)
           )
          )
         )
        )
       )
      )
      (struct.new $0
       (array.new_fixed $4 0)
       (i32.const 2147483647)
       (global.get $global$9)
       (struct.new $0
        (ref.i31
         (i32.const -8388608)
        )
        (global.get $global$9)
        (i32.const 8388608)
        (ref.null none)
       )
      )
     )
     (struct.new $0
      (array.new_fixed $4 0)
      (i32.const -32768)
      (global.get $global$9)
      (struct.new $0
       (ref.i31
        (i32.const -50)
       )
       (i32.const 55863)
       (i32.const -96)
       (global.get $global$0)
      )
     )
    )
   )
  )
  (unreachable)
 )
 (func $15 (type $12) (result f64)
  (local $0 (ref $3))
  (local $1 (ref null $1))
  (local $2 (ref null $1))
  (local $3 (ref struct))
  (local $4 (ref struct))
  (local $5 exnref)
  (local $6 stringref)
  (local $7 (ref $0))
  (local $8 f64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (local.tee $8
   (f64.const 4398046511103.775)
  )
 )
 (func $16 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $15)
  )
  (drop
   (call $15)
  )
  (drop
   (call $15)
  )
 )
 (func $17 (type $29) (result i64)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (i64.const -36028797018963969)
 )
 (func $18 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $17)
  )
 )
 (func $19 (type $30) (param $0 v128) (param $1 f32) (result (ref null $3) externref (ref null $2))
  (local $2 (ref null $3))
  (local $3 (ref null $3))
  (local $4 funcref)
  (local $5 structref)
  (local $6 (ref null $2))
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 (ref $7))
  (local $10 (ref $2))
  (local $11 (ref $2))
  (local $12 (ref $2))
  (local $13 (ref $2))
  (local $14 (ref eq))
  (local $15 (ref $0))
  (local $16 (ref $3))
  (local $17 (ref $3))
  (local $18 v128)
  (local $19 f32)
  (local $20 f32)
  (local $21 i64)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i32)
  (local $31 i32)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (local.set $16
   (array.new $3
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1)
     )
     (unreachable)
    )
    (i32.and
     (i32.const 72)
     (i32.const 1023)
    )
   )
  )
  (local.set $15
   (struct.new $0
    (struct.new $0
     (array.new_fixed $4 0)
     (local.get $22)
     (i32.const -117)
     (ref.null none)
    )
    (local.get $22)
    (global.get $global$9)
    (global.get $global$0)
   )
  )
  (local.set $6
   (ref.as_non_null
    (local.get $6)
   )
  )
  (loop $label2 (type $14) (result (ref (exact $3)) (ref string) (ref (exact $2)))
   (if
    (i32.eqz
     (global.get $global$22)
    )
    (then
     (global.set $global$22
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$22
    (i32.sub
     (global.get $global$22)
     (i32.const 1)
    )
   )
   (block
    (memory.init $0
     (i32.and
      (i32.eqz
       (ref.eq
        (loop $label (result (ref i31))
         (if
          (i32.eqz
           (global.get $global$22)
          )
          (then
           (global.set $global$22
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$22
          (i32.sub
           (global.get $global$22)
           (i32.const 1)
          )
         )
         (block $block1
          (f32.store offset=22 align=1
           (i32.and
            (global.get $global$9)
            (i32.const 15)
           )
           (local.get $19)
          )
          (block
           (nop)
           (br_if $block1
            (i32.eqz
             (ref.eq
              (array.new $2
               (i64.const -2199023255552)
               (i32.and
                (i32.const 14)
                (i32.const 1023)
               )
              )
              (ref.i31
               (i32.const 511)
              )
             )
            )
           )
          )
         )
         (br_if $label
          (call_indirect $0 (type $9)
           (i64.const 2)
          )
         )
         (ref.i31
          (i32.const 0)
         )
        )
        (loop $label1 (result (ref eq))
         (if
          (i32.eqz
           (global.get $global$22)
          )
          (then
           (global.set $global$22
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$22
          (i32.sub
           (global.get $global$22)
           (i32.const 1)
          )
         )
         (block $block2 (result (ref eq))
          (if
           (i32.lt_u
            (i32.add
             (local.tee $25
              (call_indirect $0 (type $9)
               (i64.const 2)
              )
             )
             (block (result i32)
              (local.set $8
               (local.tee $7
                (string.const "\ed\bd\88\ed\bd\88\f0\90\8d\88")
               )
              )
              (local.tee $26
               (if (result i32)
                (i32.lt_u
                 (i32.add
                  (local.tee $23
                   (local.tee $22
                    (i31.get_u
                     (ref.i31
                      (i32.const -61)
                     )
                    )
                   )
                  )
                  (local.tee $24
                   (string.measure_wtf16
                    (local.get $8)
                   )
                  )
                 )
                 (array.len
                  (local.tee $9
                   (array.new $7
                    (i8x16.extract_lane_u 7
                     (local.tee $0
                      (global.get $global$18)
                     )
                    )
                    (i32.and
                     (i32.const 29)
                     (i32.const 1023)
                    )
                   )
                  )
                 )
                )
                (then
                 (string.encode_wtf16_array
                  (local.get $8)
                  (local.get $9)
                  (local.get $23)
                 )
                )
                (else
                 (local.get $22)
                )
               )
              )
             )
            )
            (array.len
             (local.tee $10
              (ref.as_non_null
               (local.tee $6
                (array.new_default $2
                 (i32.and
                  (i32.const 93)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
            )
           )
           (then
            (array.fill $2
             (local.get $10)
             (local.get $25)
             (block (result i64)
              (try_table (catch_all $label1)
               (call $fimport$0
                (i32.const -1829327)
               )
              )
              (local.get $21)
             )
             (local.get $26)
            )
           )
          )
          (br_if $block2
           (local.tee $14
            (struct.new_default $5)
           )
           (i32.eqz
            (ref.is_null
             (array.new_default $3
              (i32.and
               (i32.const 23)
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
      (i32.const 15)
     )
     (i32.const 0)
     (i32.const 1)
    )
    (block
     (block
      (call $8)
      (drop
       (i32.and
        (local.get $22)
        (i32.const 15)
       )
      )
      (block
       (loop
        (if
         (i32.eqz
          (global.get $global$22)
         )
         (then
          (global.set $global$22
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$22
         (i32.sub
          (global.get $global$22)
          (i32.const 1)
         )
        )
        (block
         (global.set $global$0
          (global.get $global$0)
         )
        )
       )
       (block
        (loop
         (if
          (i32.eqz
           (global.get $global$22)
          )
          (then
           (global.set $global$22
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$22
          (i32.sub
           (global.get $global$22)
           (i32.const 1)
          )
         )
         (block
          (struct.set $1 2
           (struct.new $1
            (local.get $22)
            (ref.as_non_null
             (ref.null none)
            )
            (ref.as_non_null
             (ref.null none)
            )
            (local.tee $15
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
           (ref.null none)
          )
         )
        )
        (br $label2)
       )
       (unreachable)
      )
      (unreachable)
     )
     (unreachable)
    )
   )
   (br_if $label2
    (i32.eqz
     (local.get $22)
    )
   )
   (tuple.make 3
    (array.new $3
     (block $block3 (result (ref exn))
      (try_table (catch_all_ref $block3)
       (throw $tag$1)
      )
      (unreachable)
     )
     (i32.and
      (i32.const 8)
      (i32.const 1023)
     )
    )
    (string.const "\e2\82\ac375\c2\a3")
    (array.new $2
     (local.get $21)
     (i32.and
      (i32.const 14)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $20 (type $31) (param $0 (ref $3)) (result v128)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (return
    (v128.const i32x4 0x2eff4e00 0xec7501bd 0x013a7f46 0x00cb8e59)
   )
  )
  (unreachable)
 )
 (func $21 (type $12) (result f64)
  (local $0 f32)
  (local $1 f32)
  (local $2 f64)
  (local $3 f64)
  (local $4 i64)
  (local $5 i32)
  (local $6 anyref)
  (local $7 (ref null $0))
  (local $8 exnref)
  (local $9 exnref)
  (local $10 (ref $2))
  (local $11 (ref $2))
  (local $12 i31ref)
  (local $13 funcref)
  (local $14 (ref null $3))
  (local $15 (ref string))
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (f64.const -288230376151711744)
 )
 (func $22 (type $6)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (call $21)
  )
 )
 (func $23 (type $32) (param $0 (ref null $2)) (result i64 i64 (ref null $2) (ref null $3) i31ref f32)
  (local $1 (ref string))
  (local $2 (ref string))
  (local $3 (ref null $3))
  (local $4 arrayref)
  (local $5 (ref null $1))
  (local $6 f64)
  (local $7 f64)
  (local $8 i32)
  (local $9 i32)
  (local $10 f32)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (tuple.make 6
   (i64.const 4294967255)
   (i64.const -82)
   (array.new_default $2
    (i32.and
     (i32.const 10)
     (i32.const 1023)
    )
   )
   (array.new $3
    (ref.null noexn)
    (i32.and
     (i32.const 45)
     (i32.const 1023)
    )
   )
   (ref.i31
    (i32.const 3)
   )
   (f32.const -nan:0x7fa614)
  )
 )
 (@binaryen.js.called)
 (func $24 (type $33) (param $0 (ref null $3)) (param $1 structref) (param $2 (ref $2)) (param $3 (ref null $2)) (param $4 (ref null $2)) (result funcref)
  (local $5 f32)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (drop
   (ref.func $6)
  )
  (block
   (call $fimport$3
    (local.get $5)
   )
   (return
    (ref.func $24)
   )
  )
  (unreachable)
 )
 (func $25 (type $13) (result i64 i64)
  (local $0 funcref)
  (local $1 (ref null $0))
  (local $2 (ref null $0))
  (local $3 (ref null $0))
  (local $4 (ref null $3))
  (local $5 (ref null $3))
  (local $6 (ref null $3))
  (local $7 eqref)
  (local $8 eqref)
  (local $9 (ref null $2))
  (local $10 v128)
  (local $11 v128)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 f32)
  (local $16 i64)
  (local $17 i64)
  (local $18 f64)
  (if
   (i32.eqz
    (global.get $global$22)
   )
   (then
    (global.set $global$22
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$22
   (i32.sub
    (global.get $global$22)
    (i32.const 1)
   )
  )
  (block
   (return
    (tuple.make 2
     (i64.const -56)
     (i64.const -1070265027)
    )
   )
  )
  (unreachable)
 )
 (func $26 (type $34) (param $0 externref) (result externref)
  (extern.convert_any
   (call $2
    (ref.cast (ref null $3)
     (any.convert_extern
      (local.get $0)
     )
    )
   )
  )
 )
 (func $27 (type $35) (result externref)
  (extern.convert_any
   (call $11)
  )
 )
 (func $28 (type $36) (param $0 externref) (result i64 i64 (ref null $2) (ref null $3) i31ref f32)
  (call $23
   (ref.cast (ref null $2)
    (any.convert_extern
     (local.get $0)
    )
   )
  )
 )
 (type $__sinkT_0 (func (param f64) (result f64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
