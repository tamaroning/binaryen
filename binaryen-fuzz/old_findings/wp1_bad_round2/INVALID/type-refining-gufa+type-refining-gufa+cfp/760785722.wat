(module
 (rec
  (type $0 (sub (array (mut (ref $1)))))
  (type $1 (sub (struct (field arrayref))))
 )
 (rec
  (type $2 (sub $1 (struct (field nullref) (field (mut f32)) (field (ref $0)) (field (mut (ref array))) (field (mut i16)))))
  (type $3 (sub $1 (struct (field (ref null $0)) (field anyref) (field i8) (field i32))))
 )
 (type $4 (array i8))
 (type $5 (sub (struct (field i8) (field i32) (field eqref))))
 (type $6 (func))
 (type $7 (struct))
 (type $8 (func (param i32)))
 (type $9 (array (mut i16)))
 (type $10 (func (param externref)))
 (type $11 (func (param anyref)))
 (type $12 (func (result i32)))
 (type $13 (func (result i64 i64)))
 (type $14 (func (param (ref null $2))))
 (type $15 (func (param i64)))
 (type $16 (func (param f32)))
 (type $17 (func (param f64)))
 (type $18 (func (param v128)))
 (type $19 (func (param funcref)))
 (type $20 (func (param f32) (result (ref $1))))
 (type $21 (func (param i32) (result (ref null $2))))
 (type $22 (func (result (ref null $3))))
 (type $23 (func (result f64)))
 (type $24 (func (param i32 (ref null $5)) (result externref)))
 (type $25 (func (param (ref null $3) v128 (ref null $1) funcref f32 (ref null $3)) (result anyref)))
 (type $26 (func (result v128)))
 (type $27 (func (param arrayref) (result (ref null $0) i32)))
 (type $28 (func (param (ref $2)) (result i64 i64)))
 (type $29 (func (param (ref null $3) i31ref i31ref externref (ref $3) (ref $3) arrayref) (result i64 i64)))
 (type $30 (func (param (ref $5) eqref (ref null $1) (ref null $5) f64 i64) (result f32)))
 (type $31 (func (param i64) (result i32 i64 i64 i64 exnref i32)))
 (type $32 (func (param f32) (result externref)))
 (type $33 (func (param i32) (result externref)))
 (type $34 (func (result externref)))
 (type $35 (func (param i32 externref) (result externref)))
 (type $36 (func (param externref v128 externref funcref f32 externref) (result externref)))
 (type $37 (func (param externref) (result (ref null $0) i32)))
 (type $38 (func (param f32) (result f32)))
 (type $39 (func (param f64) (result f64)))
 (type $40 (func (param v128) (result v128)))
 (type $41 (func (result (ref (exact $3)) i32)))
 (type $42 (func (result (ref (exact $0)) i32)))
 (type $43 (func (result (ref null $0) i32)))
 (type $44 (func (result i32 i64 i64 i64 exnref i32)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $8) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $15) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $16) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $17) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $18) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $11) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $19) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $10) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $10) (param externref)))
 (global $global$0 i64 (i64.const -80))
 (global $global$1 (mut (ref null $2)) (ref.null none))
 (global $global$2 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 (i32.const 0) "J\c0\cerm\85\8f\f1\f0\07\ec")
 (data $1 (i32.const 11) "S\ad\92e\a7/}N=_q\e8Z\e5\r\ed\99\'\b4\fa\e73[")
 (data $2 (i32.const 34) "\97\efp\c1@\9d.\10ccL$\e9\b8\9d")
 (data $3 "/G\c7\8e\cc\bb")
 (table $0 7 7 funcref)
 (table $1 9 9 exnref)
 (elem $0 (table $0) (i32.const 0) func $6 $7 $9 $9 $9 $9 $15)
 (elem declare func $4 $fimport$0 $fimport$6)
 (tag $tag$0 (type $14) (param (ref null $2)))
 (tag $tag$1 (type $6))
 (export "tag$" (tag $tag$0))
 (export "func" (func $18))
 (export "func_invoker" (func $1))
 (export "func_11" (func $19))
 (export "func_12" (func $20))
 (export "func_13" (func $4))
 (export "func_13_invoker" (func $5))
 (export "func_16" (func $21))
 (export "func_17" (func $22))
 (export "func_18" (func $9))
 (export "func_18_invoker" (func $10))
 (export "func_20" (func $23))
 (export "func_20_invoker" (func $12))
 (export "func_25_invoker" (func $17))
 (@binaryen.js.called)
 (func $0 (type $20) (param $0 f32) (result (ref $1))
  (local $1 structref)
  (local $2 externref)
  (local $3 (ref string))
  (local $4 arrayref)
  (local $5 (ref extern))
  (local $6 (ref $2))
  (local $7 (ref $5))
  (local $8 (ref array))
  (local $9 (ref $0))
  (local $10 f64)
  (local $11 i64)
  (local $12 i32)
  (local.set $0
   (call $24
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (local.set $3
   (string.const "\e2\82\ac\ed\bd\88617")
  )
  (block
   (call $fimport$4
    (call $25
     (f64.neg
      (f64.const -9223372036854775808)
     )
    )
   )
   (return
    (struct.new $1
     (array.new_fixed $4 0)
    )
   )
  )
  (local.set $5
   (local.set $6
    (local.set $9
     (local.set $7
      (local.set $8
       (local.set $6
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (func $1 (type $6)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (drop
   (call $0
    (f32.const -0.6259999871253967)
   )
  )
 )
 (func $2 (type $21) (param $0 i32) (result (ref null $2))
  (local $1 f32)
  (local $2 f32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 v128)
  (local $8 v128)
  (local $9 f64)
  (local $10 i32)
  (local $11 externref)
  (local $12 funcref)
  (local $13 (ref null $3))
  (local $14 (ref null $3))
  (local $15 stringref)
  (local $16 (ref null $2))
  (local $17 (ref null $2))
  (local $18 (ref null $2))
  (local $19 (ref null $2))
  (local $20 (ref $1))
  (local $21 (ref array))
  (local $22 (ref $0))
  (local $23 (ref $0))
  (local $24 (ref $0))
  (local $25 (ref $9))
  (local $26 i31ref)
  (local $27 (ref i31))
  (local $28 (ref $2))
  (local $29 (ref $3))
  (local $30 (ref string))
  (local $scratch i32)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (local.set $23
   (array.new $0
    (struct.new_default $1)
    (i32.and
     (i32.const 86)
     (i32.const 1023)
    )
   )
  )
  (local.set $22
   (array.new $0
    (struct.new_default $3)
    (i32.and
     (i32.const 69)
     (i32.const 1023)
    )
   )
  )
  (local.set $21
   (array.new_fixed $4 0)
  )
  (call $fimport$3
   (f32.const 242)
  )
  (call $fimport$5
   (call $26
    (v128.load offset=22 align=4
     (i32.and
      (string.measure_wtf16
       (block $block1 (result (ref string))
        (if
         (i32.lt_u
          (local.tee $10
           (block $block (result i32)
            (call $fimport$5
             (call $26
              (i64x2.splat
               (local.tee $4
                (if (result i64)
                 (i32.eqz
                  (br_if $block
                   (try (result i32)
                    (do
                     (ref.eq
                      (ref.as_non_null
                       (ref.null none)
                      )
                      (ref.null none)
                     )
                    )
                    (catch $tag$0
                     (local.set $17 (call $__popsink_0 (pop (ref null $2))))
                     (i32.const -2206642)
                    )
                   )
                   (i32.eqz
                    (ref.eq
                     (local.tee $23
                      (local.get $23)
                     )
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 )
                 (then
                  (i64.atomic.rmw16.cmpxchg_u acqrel offset=22
                   (i32.and
                    (i32.const -4575)
                    (i32.const 15)
                   )
                   (local.get $5)
                   (local.get $5)
                  )
                 )
                 (else
                  (local.get $6)
                 )
                )
               )
              )
             )
            )
            (drop
             (br_on_cast_fail $block1 (ref string) (ref string)
              (string.const "\ed\bd\88918\ed\a0\80")
             )
            )
            (ref.eq
             (struct.new_default $7)
             (global.get $global$1)
            )
           )
          )
          (array.len
           (local.tee $24
            (local.get $22)
           )
          )
         )
         (then
          (drop
           (local.get $24)
          )
          (drop
           (local.get $10)
          )
          (if
           (if (result i32)
            (if (result i32)
             (i32.eqz
              (local.get $0)
             )
             (then
              (call $fimport$5
               (call $26
                (f32x4.splat
                 (f32.const -9223372036854775808)
                )
               )
              )
              (return
               (local.get $16)
              )
             )
             (else
              (block $block2 (result i32)
               (nop)
               (drop
                (i31.get_s
                 (try (result (ref i31))
                  (do
                   (ref.i31
                    (i32.const -2147483648)
                   )
                  )
                  (catch $tag$0
                   (drop (ref.test (ref $2) (pop (ref null $2))))
                   (ref.i31
                    (i32.const -67108864)
                   )
                  )
                  (catch_all
                   (ref.as_non_null
                    (local.tee $26
                     (ref.cast (ref i31)
                      (try (result (ref i31))
                       (do
                        (local.tee $27
                         (ref.i31
                          (i32.const -2147483648)
                         )
                        )
                       )
                       (catch $tag$0
                        (drop (struct.get $2 0 (pop (ref null $2))))
                        (ref.i31
                         (i32.const -33554432)
                        )
                       )
                       (catch_all
                        (ref.i31
                         (i32.const -128)
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
               (drop
                (string.const "\e2\82\ac945\e2\82\ac")
               )
               (drop
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (br_if $block2
                (br_on_non_null $block1
                 (br_if $block1
                  (unreachable)
                  (unreachable)
                 )
                )
                (i32.eqz
                 (local.get $0)
                )
               )
              )
             )
            )
            (then
             (call $fimport$4
              (f64.const 608584267)
             )
             (block (result i32)
              (local.set $0
               (i32.atomic.load16_u offset=3
                (i32.and
                 (local.tee $0
                  (ref.is_null
                   (local.get $22)
                  )
                 )
                 (i32.const 15)
                )
               )
              )
              (local.get $0)
             )
            )
            (else
             (f64.store offset=4 align=2
              (i32.and
               (local.get $0)
               (i32.const 15)
              )
              (f64.const 2147483647)
             )
             (return
              (local.get $16)
             )
            )
           )
           (then
            (nop)
            (return
             (struct.new $2
              (ref.null none)
              (f32.const -127.44200134277344)
              (array.new $0
               (struct.new $2
                (ref.null none)
                (f32.const -67108864)
                (array.new $0
                 (struct.new_default $3)
                 (i32.and
                  (i32.const 69)
                  (i32.const 1023)
                 )
                )
                (array.new_fixed $4 0)
                (local.get $0)
               )
               (i32.and
                (i32.const 7)
                (i32.const 1023)
               )
              )
              (array.new_fixed $4 0)
              (i32.const 53046804)
             )
            )
           )
           (else
            (if
             (i32.eqz
              (local.get $0)
             )
             (then
              (loop $label
               (if
                (i32.eqz
                 (global.get $global$2)
                )
                (then
                 (global.set $global$2
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$2
                (i32.sub
                 (global.get $global$2)
                 (i32.const 1)
                )
               )
               (call_ref $11
                (struct.new_default $3)
                (ref.func $fimport$6)
               )
               (call $fimport$8
                (ref.as_non_null
                 (ref.null noextern)
                )
               )
               (br_if $label
                (i32.eqz
                 (local.get $0)
                )
               )
              )
              (call $fimport$4
               (local.get $9)
              )
              (if
               (i32.eqz
                (global.get $global$2)
               )
               (then
                (global.set $global$2
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$2
               (i32.sub
                (global.get $global$2)
                (i32.const 1)
               )
              )
              (nop)
              (nop)
             )
             (else
              (drop
               (struct.new $2
                (ref.null none)
                (loop (result f32)
                 (if
                  (i32.eqz
                   (global.get $global$2)
                  )
                  (then
                   (global.set $global$2
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$2
                  (i32.sub
                   (global.get $global$2)
                   (i32.const 1)
                  )
                 )
                 (block (result f32)
                  (call $fimport$4
                   (loop $label1 (result f64)
                    (if
                     (i32.eqz
                      (global.get $global$2)
                     )
                     (then
                      (global.set $global$2
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$2
                     (i32.sub
                      (global.get $global$2)
                      (i32.const 1)
                     )
                    )
                    (nop)
                    (br_if $label1
                     (local.get $0)
                    )
                    (if (result f64)
                     (i32.const -127)
                     (then
                      (f64.const 0)
                     )
                     (else
                      (f64.const 1)
                     )
                    )
                   )
                  )
                  (call $24
                   (f32.load offset=3 align=2
                    (i32.and
                     (local.get $0)
                     (i32.const 15)
                    )
                   )
                  )
                 )
                )
                (local.get $23)
                (local.get $21)
                (block (result i32)
                 (local.set $scratch
                  (i32.const -79)
                 )
                 (drop
                  (i64.const 4294967216)
                 )
                 (local.get $scratch)
                )
               )
              )
              (call $fimport$6
               (ref.i31
                (i32.const 65515)
               )
              )
             )
            )
            (block
             (nop)
             (return
              (global.get $global$1)
             )
            )
            (local.set $29
             (local.set $28
              (unreachable)
             )
            )
           )
          )
          (unreachable)
         )
        )
        (local.tee $30
         (string.const "")
        )
       )
      )
      (i32.const 15)
     )
    )
   )
  )
  (block
   (call $fimport$4
    (call $25
     (f64.load offset=22
      (i32.and
       (local.get $0)
       (i32.const 15)
      )
     )
    )
   )
   (call $fimport$6
    (array.new_fixed $4 0)
   )
   (return
    (global.get $global$1)
   )
  )
  (local.set $25
   (local.set $21
    (local.set $22
     (local.set $23
      (local.set $20
       (unreachable)
      )
     )
    )
   )
  )
 )
 (func $3 (type $22) (result (ref null $3))
  (local $0 f64)
  (local $1 v128)
  (local $2 v128)
  (local $3 i31ref)
  (local $4 (ref null $0))
  (local $5 (ref null $0))
  (local $6 (ref array))
  (local $7 (ref $3))
  (local $8 (ref $3))
  (local $9 (ref null $1))
  (local $10 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (drop
   (array.new $0
    (struct.new $1
     (ref.null none)
    )
    (i32.and
     (i32.const 60)
     (i32.const 1023)
    )
   )
  )
  (drop
   (array.new $0
    (struct.new $2
     (ref.null none)
     (f32.const 0)
     (array.new $0
      (struct.new_default $3)
      (i32.and
       (i32.const 46)
       (i32.const 1023)
      )
     )
     (array.new_fixed $4 0)
     (i32.const -3056029)
    )
    (i32.and
     (i32.const 90)
     (i32.const 1023)
    )
   )
  )
  (block
   (call $fimport$6
    (struct.new_default $7)
   )
   (return
    (struct.new $3
     (array.new $0
      (struct.new $2
       (ref.null none)
       (f32.const 0)
       (array.new $0
        (struct.new_default $1)
        (i32.and
         (i32.const 53)
         (i32.const 1023)
        )
       )
       (array.new $0
        (struct.new $3
         (array.new $0
          (struct.new $3
           (ref.as_non_null
            (ref.null none)
           )
           (ref.null none)
           (i32.const 35)
           (i32.const 0)
          )
          (i32.and
           (i32.const 74)
           (i32.const 1023)
          )
         )
         (struct.new_default $7)
         (i32.const 65534)
         (i32.const -2147483648)
        )
        (i32.and
         (i32.const 27)
         (i32.const 1023)
        )
       )
       (i32.const 1799)
      )
      (i32.and
       (i32.const 74)
       (i32.const 1023)
      )
     )
     (array.new_fixed $4 0)
     (i32.const -84)
     (i32.const 4194304)
    )
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $4 (type $12) (result i32)
  (local $0 v128)
  (local $1 v128)
  (local $2 v128)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f64)
  (local $15 f64)
  (local $16 (ref array))
  (local $17 (ref null $0))
  (local $18 (ref null $0))
  (local $19 (ref null $0))
  (local $20 (ref null $2))
  (local $21 (ref null $2))
  (local $22 (ref null $2))
  (local $23 (ref null $2))
  (local $24 (ref null $2))
  (local $25 (ref null $2))
  (local $26 (ref null $2))
  (local $27 (ref null $2))
  (local $28 (ref null $2))
  (local $29 (ref null $2))
  (local $30 (ref null $2))
  (local $31 (ref null $2))
  (local $32 (ref null $2))
  (local $33 (ref null $2))
  (local $34 (ref string))
  (local $35 (ref func))
  (local $36 (ref i31))
  (local $37 (ref $9))
  (local $38 (ref $2))
  (local $39 nullexternref)
  (local $40 (ref null $3))
  (local $41 (ref $3))
  (local $42 (ref $3))
  (local $43 (ref extern))
  (local $44 nullref)
  (local $45 nullref)
  (local $46 nullref)
  (local $47 (ref eq))
  (local $48 funcref)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (local.set $43
   (global.get $gimport$0)
  )
  (local.set $41
   (struct.new_default $3)
  )
  (local.set $38
   (struct.new $2
    (ref.null none)
    (f32.const 4611686018427387904)
    (array.new $0
     (struct.new $3
      (array.new $0
       (struct.new $2
        (ref.null none)
        (local.get $10)
        (array.new $0
         (struct.new $3
          (ref.null none)
          (ref.i31
           (i32.const 65416)
          )
          (i32.const -107)
          (i32.const -15088)
         )
         (i32.and
          (i32.const 64)
          (i32.const 1023)
         )
        )
        (array.new_fixed $4 0)
        (i32.const -26786)
       )
       (i32.and
        (i32.const 65)
        (i32.const 1023)
       )
      )
      (array.new_fixed $4 0)
      (local.get $8)
      (local.get $7)
     )
     (i32.and
      (i32.const 11)
      (i32.const 1023)
     )
    )
    (array.new $0
     (struct.new_default $3)
     (i32.and
      (i32.const 74)
      (i32.const 1023)
     )
    )
    (i32.const 2)
   )
  )
  (local.set $36
   (ref.i31
    (i32.const 65535)
   )
  )
  (local.set $35
   (ref.func $4)
  )
  (local.set $16
   (array.new_fixed $4 0)
  )
  (block (result i32)
   (call $fimport$8
    (try (result (ref extern))
     (do
      (try_table (result (ref extern))
       (global.get $gimport$0)
      )
     )
     (catch_all
      (try (result (ref string))
       (do
        (unreachable)
       )
       (catch $tag$0
        (drop (pop (ref null $2)))
        (string.const "\c2\a367")
       )
      )
     )
    )
   )
   (string.encode_wtf16_array
    (string.const "")
    (local.tee $37
     (array.new $9
      (try_table (result i32)
       (drop
        (local.tee $34
         (string.const "\f0\90\8d\88\ed\a0\80\c2\a3")
        )
       )
       (drop
        (array.new_default $9
         (i32.and
          (i32.const 53)
          (i32.const 1023)
         )
        )
       )
       (drop
        (local.get $7)
       )
       (if (result i32)
        (i31.get_s
         (local.get $36)
        )
        (then
         (drop
          (local.get $7)
         )
         (drop
          (call $4)
         )
         (drop
          (local.get $34)
         )
         (loop $label
          (if
           (i32.eqz
            (global.get $global$2)
           )
           (then
            (global.set $global$2
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$2
           (i32.sub
            (global.get $global$2)
            (i32.const 1)
           )
          )
          (try_table (catch_all $label)
           (try_table (catch_all $label)
            (nop)
           )
          )
          (br $label)
         )
         (unreachable)
        )
        (else
         (block
          (local.set $0
           (call $26
            (i16x8.min_s
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (local.tee $0
              (if (result v128)
               (i32.const -2097152)
               (then
                (local.get $0)
               )
               (else
                (loop $label1
                 (if
                  (i32.eqz
                   (global.get $global$2)
                  )
                  (then
                   (global.set $global$2
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$2
                  (i32.sub
                   (global.get $global$2)
                   (i32.const 1)
                  )
                 )
                 (call $fimport$3
                  (local.get $10)
                 )
                 (br_if $label1
                  (local.get $7)
                 )
                 (block
                  (drop
                   (memory.atomic.notify offset=4
                    (i32.and
                     (loop (result i32)
                      (if
                       (i32.eqz
                        (global.get $global$2)
                       )
                       (then
                        (global.set $global$2
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$2
                       (i32.sub
                        (global.get $global$2)
                        (i32.const 1)
                       )
                      )
                      (block (result i32)
                       (i31.get_u
                        (ref.i31
                         (i32.const 65535)
                        )
                       )
                      )
                     )
                     (i32.const 15)
                    )
                    (local.tee $7
                     (ref.test (ref $3)
                      (local.get $41)
                     )
                    )
                   )
                  )
                  (drop
                   (try_table (result (ref extern))
                    (global.get $gimport$0)
                   )
                  )
                  (drop
                   (global.get $gimport$0)
                  )
                  (drop
                   (i64.eqz
                    (local.tee $5
                     (i64.const 65464)
                    )
                   )
                  )
                  (drop
                   (local.get $7)
                  )
                  (block
                   (nop)
                   (br $label1)
                  )
                  (unreachable)
                 )
                 (local.set $34
                  (unreachable)
                 )
                )
                (unreachable)
               )
              )
             )
            )
           )
          )
          (return
           (select
            (local.get $7)
            (local.get $7)
            (if (result i32)
             (i32.eqz
              (struct.get_s $5 0
               (struct.new $5
                (local.get $7)
                (i32.const -17)
                (struct.new_default $7)
               )
              )
             )
             (then
              (block
               (call $fimport$8
                (string.const "997")
               )
               (return
                (local.get $7)
               )
              )
              (unreachable)
             )
             (else
              (i32.const 2147483646)
             )
            )
           )
          )
         )
         (unreachable)
        )
       )
      )
      (i32.and
       (i64.eqz
        (loop $label3 (result i64)
         (if
          (i32.eqz
           (global.get $global$2)
          )
          (then
           (global.set $global$2
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$2
          (i32.sub
           (global.get $global$2)
           (i32.const 1)
          )
         )
         (block
          (drop
           (loop $label2 (result nullref)
            (if
             (i32.eqz
              (global.get $global$2)
             )
             (then
              (global.set $global$2
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$2
             (i32.sub
              (global.get $global$2)
              (i32.const 1)
             )
            )
            (call $fimport$1
             (local.get $8)
            )
            (br_if $label2
             (i32.eqz
              (ref.test (ref none)
               (local.get $38)
              )
             )
            )
            (ref.null none)
           )
          )
          (loop
           (if
            (i32.eqz
             (global.get $global$2)
            )
            (then
             (global.set $global$2
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$2
            (i32.sub
             (global.get $global$2)
             (i32.const 1)
            )
           )
           (br $label3)
          )
          (unreachable)
         )
         (unreachable)
        )
       )
       (i32.const 1023)
      )
     )
    )
    (i8x16.extract_lane_u 13
     (local.get $0)
    )
   )
  )
 )
 (func $5 (type $6)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
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
 (func $6 (type $23) (result f64)
  (local $0 i31ref)
  (local $1 i31ref)
  (local $2 (ref eq))
  (local $3 (ref null $2))
  (local $4 (ref null $5))
  (local $5 anyref)
  (local $6 stringref)
  (local $7 (ref $5))
  (local $8 f64)
  (local $9 v128)
  (local $10 f32)
  (local $11 i32)
  (local $12 i64)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (f64.const 121)
 )
 (func $7 (type $24) (param $0 i32) (param $1 (ref null $5)) (result externref)
  (local $2 (ref $2))
  (local $3 structref)
  (local $4 arrayref)
  (local $5 externref)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (block (result (ref string))
   (nop)
   (string.const "")
  )
 )
 (func $8 (type $25) (param $0 (ref null $3)) (param $1 v128) (param $2 (ref null $1)) (param $3 funcref) (param $4 f32) (param $5 (ref null $3)) (result anyref)
  (local $6 funcref)
  (local $7 funcref)
  (local $8 (ref null $5))
  (local $9 f32)
  (local.set $1
   (call $26
    (local.get $1)
   )
  )
  (local.set $4
   (call $24
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (block (result nullref)
   (call $fimport$1
    (i32.const 127)
   )
   (ref.null none)
  )
 )
 (func $9 (type $26) (result v128)
  (local $0 i32)
  (local $1 externref)
  (local $2 stringref)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (atomic.fence)
  (drop
   (v128.const i32x4 0x00000080 0x0000007f 0x00000000 0x00007fff)
  )
  (drop
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
  (drop
   (array.new $0
    (struct.new $2
     (ref.null none)
     (f32.const 51)
     (array.new $0
      (struct.new $1
       (ref.null none)
      )
      (i32.and
       (i32.const -63)
       (i32.const 1023)
      )
     )
     (array.new_fixed $4 0)
     (i32.const 16777216)
    )
    (i32.and
     (i32.const 18)
     (i32.const 1023)
    )
   )
  )
  (drop
   (ref.null none)
  )
  (drop
   (f32.const -3402823466385288598117041e14)
  )
  (drop
   (ref.null none)
  )
  (drop
   (f32.const -524288.25)
  )
  (drop
   (struct.new_default $1)
  )
  (block
   (nop)
   (return
    (v128.const i32x4 0x0000fff0 0x00000000 0x0000ffea 0x00000000)
   )
  )
  (unreachable)
 )
 (func $10 (type $6)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (drop
   (call $26
    (call $9)
   )
  )
  (drop
   (call $26
    (call $9)
   )
  )
  (drop
   (call $26
    (call $9)
   )
  )
 )
 (func $11 (type $27) (param $0 arrayref) (result (ref null $0) i32)
  (local $1 (ref $3))
  (local $2 (ref null $2))
  (local $3 (ref null $5))
  (local $4 f32)
  (local $5 f32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $scratch (tuple (ref (exact $3)) i32))
  (local $scratch_11 (ref (exact $3)))
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (local.set $3
   (ref.as_non_null
    (local.get $3)
   )
  )
  (local.set $1
   (struct.new $3
    (array.new $0
     (struct.new_default $1)
     (i32.and
      (i32.const -22)
      (i32.const 1023)
     )
    )
    (struct.new $2
     (ref.null none)
     (local.get $4)
     (array.new $0
      (struct.new $3
       (array.new $0
        (struct.new_default $1)
        (i32.and
         (i32.const 7)
         (i32.const 1023)
        )
       )
       (array.new_fixed $4 0)
       (local.get $8)
       (local.get $8)
      )
      (i32.and
       (i32.const 87)
       (i32.const 1023)
      )
     )
     (array.new_fixed $4 0)
     (i32.const 0)
    )
    (i32.const 8192)
    (i32.const -12)
   )
  )
  (block (type $42) (result (ref (exact $0)) i32)
   (nop)
   (block $block
    (try_table (catch_all $block)
     (struct.set $2 3
      (select (result (ref (exact $2)))
       (struct.new $2
        (ref.null none)
        (f32.const 0)
        (ref.cast (ref none)
         (struct.new_default $7)
        )
        (array.new_fixed $4 0)
        (local.get $8)
       )
       (struct.new $2
        (ref.null none)
        (local.get $4)
        (array.new $0
         (struct.new $3
          (array.new $0
           (struct.new $3
            (ref.as_non_null
             (ref.null none)
            )
            (ref.as_non_null
             (ref.null none)
            )
            (local.get $8)
            (i32.const 36875)
           )
           (i32.and
            (i32.const 23)
            (i32.const 1023)
           )
          )
          (ref.i31
           (i32.const -63)
          )
          (i32.const -27301)
          (i32.const -1339461250)
         )
         (i32.and
          (i32.const 68)
          (i32.const 1023)
         )
        )
        (array.new $0
         (struct.new_default $1)
         (i32.and
          (i32.const 60)
          (i32.const 1023)
         )
        )
        (local.get $8)
       )
       (if (result i32)
        (ref.eq
         (loop (result (ref (exact $3)))
          (if
           (i32.eqz
            (global.get $global$2)
           )
           (then
            (global.set $global$2
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$2
           (i32.sub
            (global.get $global$2)
            (i32.const 1)
           )
          )
          (struct.new_default $3)
         )
         (block (result (ref (exact $2)))
          (drop
           (struct.new_default $7)
          )
          (struct.new $2
           (ref.null none)
           (local.tee $5
            (local.get $5)
           )
           (ref.as_non_null
            (ref.null none)
           )
           (ref.as_non_null
            (ref.null none)
           )
           (ref.eq
            (select (result (ref $3))
             (local.get $1)
             (local.get $1)
             (local.get $8)
            )
            (if (result (ref $5))
             (i32.eqz
              (call_ref $12
               (ref.func $4)
              )
             )
             (then
              (ref.as_non_null
               (local.tee $3
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
             )
             (else
              (if (result (ref $5))
               (i32.eqz
                (i32.const 16)
               )
               (then
                (ref.as_non_null
                 (local.get $3)
                )
               )
               (else
                (ref.as_non_null
                 (local.get $3)
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
         (i32.const -2147483647)
        )
        (else
         (drop
          (block (result (ref (exact $3)))
           (local.set $scratch_11
            (tuple.extract 2 0
             (local.tee $scratch
              (try_table (type $41) (result (ref (exact $3)) i32) (catch_all $block)
               (tuple.make 2
                (struct.new_default $3)
                (i32.const 32767)
               )
              )
             )
            )
           )
           (local.set $9
            (tuple.extract 2 1
             (local.get $scratch)
            )
           )
           (local.get $scratch_11)
          )
         )
         (i32.atomic.load16_u offset=22
          (i32.and
           (local.get $9)
           (i32.const 15)
          )
         )
        )
       )
      )
      (array.new_fixed $4 0)
     )
    )
    (call $fimport$0
     (i32.const 4194305)
    )
   )
   (tuple.make 2
    (array.new $0
     (struct.new_default $1)
     (i32.and
      (i32.const 85)
      (i32.const 1023)
     )
    )
    (i32.const -91)
   )
  )
 )
 (func $12 (type $6)
  (local $scratch (tuple (ref null $0) i32))
  (local $scratch_1 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $0))
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $11
        (array.new_fixed $4 0)
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
 (@binaryen.js.called)
 (func $13 (type $28) (param $0 (ref $2)) (result i64 i64)
  (local $1 f32)
  (local $2 f64)
  (local $3 i32)
  (local $4 v128)
  (local $5 (ref null $5))
  (local $6 exnref)
  (local $7 (ref $2))
  (local $8 anyref)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const -54)
   (i64.const -14551)
  )
 )
 (@binaryen.js.called)
 (func $14 (type $29) (param $0 (ref null $3)) (param $1 i31ref) (param $2 i31ref) (param $3 externref) (param $4 (ref $3)) (param $5 (ref $3)) (param $6 arrayref) (result i64 i64)
  (local $7 i64)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (table.set $0
   (i32.const -1083269)
   (ref.cast (ref $8)
    (try_table (result (ref $8))
     (ref.func $fimport$0)
    )
   )
  )
  (return
   (tuple.make 2
    (i64.const -288230376151711743)
    (local.get $7)
   )
  )
 )
 (@binaryen.js.called)
 (func $15 (type $30) (param $0 (ref $5)) (param $1 eqref) (param $2 (ref null $1)) (param $3 (ref null $5)) (param $4 f64) (param $5 i64) (result f32)
  (local.set $4
   (call $25
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (call $fimport$6
   (ref.null none)
  )
  (return
   (f32.const 0)
  )
 )
 (func $16 (type $31) (param $0 i64) (result i32 i64 i64 i64 exnref i32)
  (local $1 exnref)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 6
    (i32.const 511)
    (i64.const -128)
    (i64.const 1125899906842625)
    (i64.const -104)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$1)
     )
     (unreachable)
    )
    (i32.const 65536)
   )
  )
 )
 (func $17 (type $6)
  (local $scratch (tuple i32 i64 i64 i64 exnref i32))
  (local $scratch_1 exnref)
  (local $scratch_2 i64)
  (local $scratch_3 i64)
  (local $scratch_4 i64)
  (local $scratch_5 i32)
  (if
   (i32.eqz
    (global.get $global$2)
   )
   (then
    (global.set $global$2
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$2
   (i32.sub
    (global.get $global$2)
    (i32.const 1)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $16
        (i64.const 0)
       )
      )
     )
    )
    (drop
     (block (result i64)
      (local.set $scratch_4
       (tuple.extract 6 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result i64)
        (local.set $scratch_3
         (tuple.extract 6 2
          (local.get $scratch)
         )
        )
        (drop
         (block (result i64)
          (local.set $scratch_2
           (tuple.extract 6 3
            (local.get $scratch)
           )
          )
          (drop
           (block (result exnref)
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
 )
 (func $18 (type $32) (param $0 f32) (result externref)
  (local.set $0
   (call $24
    (local.get $0)
   )
  )
  (extern.convert_any
   (call $0
    (local.get $0)
   )
  )
 )
 (func $19 (type $33) (param $0 i32) (result externref)
  (extern.convert_any
   (call $2
    (local.get $0)
   )
  )
 )
 (func $20 (type $34) (result externref)
  (extern.convert_any
   (call $3)
  )
 )
 (func $21 (type $35) (param $0 i32) (param $1 externref) (result externref)
  (call $7
   (local.get $0)
   (ref.cast (ref null $5)
    (any.convert_extern
     (local.get $1)
    )
   )
  )
 )
 (func $22 (type $36) (param $0 externref) (param $1 v128) (param $2 externref) (param $3 funcref) (param $4 f32) (param $5 externref) (result externref)
  (local.set $1
   (call $26
    (local.get $1)
   )
  )
  (local.set $4
   (call $24
    (local.get $4)
   )
  )
  (extern.convert_any
   (call $8
    (ref.cast (ref null $3)
     (any.convert_extern
      (local.get $0)
     )
    )
    (local.get $1)
    (ref.cast (ref null $1)
     (any.convert_extern
      (local.get $2)
     )
    )
    (local.get $3)
    (local.get $4)
    (ref.cast (ref null $3)
     (any.convert_extern
      (local.get $5)
     )
    )
   )
  )
 )
 (func $23 (type $37) (param $0 externref) (result (ref null $0) i32)
  (call $11
   (ref.cast arrayref
    (any.convert_extern
     (local.get $0)
    )
   )
  )
 )
 (func $24 (type $38) (param $0 f32) (result f32)
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
 (func $25 (type $39) (param $0 f64) (result f64)
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
 (func $26 (type $40) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param (ref null $2)) (result (ref null $2))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
