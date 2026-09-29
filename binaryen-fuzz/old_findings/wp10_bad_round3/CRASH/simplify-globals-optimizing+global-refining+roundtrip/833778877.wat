(module
 (type $0 (sub (func (param v128) (result (ref $0) structref (ref $0)))))
 (rec
  (type $1 (sub (array (mut i8))))
  (type $2 (sub $0 (func (param v128) (result (ref $2) structref (ref $2)))))
  (type $3 (sub final $1 (array (mut i8))))
 )
 (type $4 (struct))
 (type $5 (func))
 (type $6 (func (result (ref $0) structref (ref $0))))
 (type $7 (func (result (ref $2) structref (ref $2))))
 (type $8 (func (param i32)))
 (type $9 (func (result (ref (exact $2)) (ref (exact $4)) (ref (exact $2)))))
 (type $10 (func (param externref)))
 (type $11 (array (mut i16)))
 (type $12 (func (param f32)))
 (type $13 (func (param v128)))
 (type $14 (array i8))
 (type $15 (func (param i64)))
 (type $16 (func (param f64)))
 (type $17 (func (param anyref)))
 (type $18 (func (param funcref)))
 (type $19 (func (result v128)))
 (type $20 (func (param (ref null $1) (ref null $3) stringref) (result (ref string))))
 (type $21 (func (result (ref struct))))
 (type $22 (func (result f64)))
 (type $23 (func (param (ref $1) f64 (ref $2) i64) (result i32)))
 (type $24 (func (param (ref $1) anyref (ref null $3)) (result exnref)))
 (type $25 (func (result (ref null $3))))
 (type $26 (func (param (ref $3) i32) (result (ref $0))))
 (type $27 (func (result (ref null $2))))
 (type $28 (func (param (ref null $0)) (result f64)))
 (type $29 (func (result (ref null $0))))
 (type $30 (func (param (ref null $1) i64 v128 structref (ref eq)) (result (ref eq))))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $8) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $15) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $12) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $16) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $13) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $17) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $18) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $10) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $8) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $10) (param externref)))
 (global $global$0 (mut i32) (i32.const 25))
 (memory $0 16 17 shared)
 (data $0 (i32.const 0) "n\8c\f5\95\16\a6<a\c4\c8`\a7\ea\af\c7Ot\"\c1\c7\e4$\14\19\89\b0\dd\07")
 (table $0 i64 12 funcref)
 (table $1 7 exnref)
 (elem $0 (table $0) (i64.const 0) func $4 $9 $13 $13 $25 $27 $29 $29 $31 $32 $35 $35)
 (elem declare func $17 $19 $28 $3 $34 $8 $fimport$5 $fimport$8)
 (tag $tag$0 (type $12) (param f32))
 (tag $tag$1 (type $8) (param i32))
 (tag $tag$2 (type $5))
 (export "tag$" (tag $tag$0))
 (export "jstag" (tag $eimport$1))
 (export "func" (func $0))
 (export "func_10" (func $1))
 (export "func_14_invoker" (func $6))
 (export "func_18_invoker" (func $10))
 (export "func_20_invoker" (func $12))
 (export "func_22" (func $13))
 (export "func_22_invoker" (func $14))
 (export "func_24" (func $15))
 (export "func_24_invoker" (func $16))
 (export "func_26_invoker" (func $18))
 (export "func_29_invoker" (func $21))
 (export "func_31" (func $22))
 (export "func_31_invoker" (func $23))
 (export "func_33" (func $24))
 (export "func_34" (func $25))
 (export "func_34_invoker" (func $26))
 (export "func_41_invoker" (func $33))
 (export "func_43" (func $34))
 (export "func_44" (func $35))
 (export "func_44_invoker" (func $36))
 (start $33)
 (func $0 (type $19) (result v128)
  (local $0 funcref)
  (local $1 exnref)
  (local $2 i64)
  (local $3 i64)
  (local $4 f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block (result v128)
   (call $fimport$7
    (ref.null nofunc)
   )
   (v128.const i32x4 0x00000000 0x40676000 0xf4a00000 0x41efffff)
  )
 )
 (func $1 (type $20) (param $0 (ref null $1)) (param $1 (ref null $3)) (param $2 stringref) (result (ref string))
  (local $3 stringref)
  (local $4 stringref)
  (local $5 eqref)
  (local $6 funcref)
  (local $7 (ref struct))
  (local $8 arrayref)
  (local $9 i31ref)
  (local $10 (ref i31))
  (local $11 (ref i31))
  (local $12 (ref i31))
  (local $13 (ref $3))
  (local $14 (ref $3))
  (local $15 (ref $3))
  (local $16 (ref $3))
  (local $17 (ref $3))
  (local $18 (ref $3))
  (local $19 (ref $3))
  (local $20 nullfuncref)
  (local $21 (ref nofunc))
  (local $22 (ref nofunc))
  (local $23 structref)
  (local $24 (ref null $3))
  (local $25 i32)
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
  (local $45 f64)
  (local $46 f64)
  (local $47 i64)
  (local $48 i64)
  (local $49 i64)
  (local $50 i64)
  (local $51 f32)
  (local $52 f32)
  (local $53 f32)
  (local $54 f32)
  (local $scratch i64)
  (local $scratch_56 i64)
  (local $scratch_57 i32)
  (local $scratch_58 (ref (exact $4)))
  (local $scratch_59 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $14
   (array.new_default $3
    (i32.and
     (i32.const 1)
     (i32.const 1023)
    )
   )
  )
  (local.set $13
   (array.new_default $3
    (i32.and
     (i32.const 24)
     (i32.const 1023)
    )
   )
  )
  (local.set $12
   (ref.i31
    (i32.const 512)
   )
  )
  (local.set $4
   (ref.as_non_null
    (local.get $4)
   )
  )
  (block $block4 (result (ref string))
   (drop
    (block $block6 (result i32)
     (block $block5
      (table.set $1
       (i32.const 4)
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$1
          (local.get $27)
         )
        )
        (unreachable)
       )
      )
      (if
       (i32.const 65535)
       (then
        (block $block7
         (block $block3
          (br_on_non_null $block4
           (local.tee $2
            (loop (result (ref string))
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 25)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (block
              (table.set $1
               (i32.const 2)
               (select (result (ref exn))
                (block $block1 (result (ref exn))
                 (try_table (catch_all_ref $block1)
                  (throw $tag$2)
                 )
                 (unreachable)
                )
                (block $block2 (result (ref exn))
                 (try_table (catch_all_ref $block2)
                  (throw $tag$2)
                 )
                 (unreachable)
                )
                (f32.ge
                 (f32.const -nan:0x7fc95b)
                 (f32.const 9223)
                )
               )
              )
              (br_if $block3
               (i32.eqz
                (i32.atomic.rmw8.or_u acqrel offset=22
                 (i32.and
                  (ref.test nullfuncref
                   (ref.null nofunc)
                  )
                  (i32.const 15)
                 )
                 (ref.is_null
                  (local.tee $10
                   (local.tee $11
                    (local.tee $12
                     (ref.i31
                      (i32.const -2211051)
                     )
                    )
                   )
                  )
                 )
                )
               )
              )
             )
             (loop
              (if
               (i32.eqz
                (global.get $global$0)
               )
               (then
                (global.set $global$0
                 (i32.const 25)
                )
                (unreachable)
               )
              )
              (global.set $global$0
               (i32.sub
                (global.get $global$0)
                (i32.const 1)
               )
              )
              (block
               (nop)
               (block
                (nop)
                (br $block3)
               )
               (unreachable)
              )
              (unreachable)
             )
             (local.set $15
              (local.set $13
               (local.set $14
                (unreachable)
               )
              )
             )
            )
           )
          )
          (nop)
         )
         (try $__t_12  (do
           (if
            (local.tee $25
             (block (result i32)
              (loop
               (if
                (i32.eqz
                 (global.get $global$0)
                )
                (then
                 (global.set $global$0
                  (i32.const 25)
                 )
                 (unreachable)
                )
               )
               (global.set $global$0
                (i32.sub
                 (global.get $global$0)
                 (i32.const 1)
                )
               )
               (block
                (drop
                 (br_on_null $block5
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                 )
                )
                (nop)
               )
              )
              (br_if $block6
               (string.measure_wtf16
                (ref.as_non_null
                 (local.get $4)
                )
               )
               (loop $label (result i32)
                (if
                 (i32.eqz
                  (global.get $global$0)
                 )
                 (then
                  (global.set $global$0
                   (i32.const 25)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$0
                 (i32.sub
                  (global.get $global$0)
                  (i32.const 1)
                 )
                )
                (nop)
                (br_if $label
                 (local.get $27)
                )
                (i32.const -13550)
               )
              )
             )
            )
            (then
             (if
              (i32.eqz
               (string.measure_wtf16
                (try $__t_11 (result (ref string)) (do (try (result (ref string)) (do 
                  (ref.as_non_null
                   (local.get $4)
                  )
                 ) (delegate $__t_11))) (catch_all
                  (ref.as_non_null
                   (local.tee $4
                    (ref.as_non_null
                     (local.get $4)
                    )
                   )
                  )
                 ))
               )
              )
              (then
               (nop)
              )
             )
             (local.set $1
              (local.tee $14
               (if (result (ref (exact $3)))
                (i32.eqz
                 (i32.const 2147483647)
                )
                (then
                 (loop $label1
                  (if
                   (i32.eqz
                    (global.get $global$0)
                   )
                   (then
                    (global.set $global$0
                     (i32.const 25)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$0
                   (i32.sub
                    (global.get $global$0)
                    (i32.const 1)
                   )
                  )
                  (block
                   (block
                    (call_ref $13
                     (if (result v128)
                      (local.get $27)
                      (then
                       (f64x2.min
                        (v128.const i32x4 0xff87000f 0xff86dfff 0x9f4effa9 0x75170001)
                        (v128.const i32x4 0x851eb850 0xbfc851eb 0x00000000 0xc13fffff)
                       )
                      )
                      (else
                       (v128.const i32x4 0x0001ffff 0x00000000 0x00000080 0x00000000)
                      )
                     )
                     (ref.func $fimport$5)
                    )
                    (local.set $27
                     (local.get $25)
                    )
                   )
                   (br_if $label1
                    (i32.const 27)
                   )
                  )
                 )
                 (br $block7)
                )
                (else
                 (nop)
                 (array.new $3
                  (i32.const -65)
                  (i32.and
                   (i32.const 13)
                   (i32.const 1023)
                  )
                 )
                )
               )
              )
             )
            )
           )
          ) (catch $tag$1
(local.set $31 (i32.eqz (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_12)))
(loop
            (if
             (i32.eqz
              (global.get $global$0)
             )
             (then
              (global.set $global$0
               (i32.const 25)
              )
              (unreachable)
             )
            )
            (global.set $global$0
             (i32.sub
              (global.get $global$0)
              (i32.const 1)
             )
            )
            (block
             (nop)
             (nop)
            )
            (block
             (block
              (atomic.fence acqrel)
              (local.set $47
               (block (result i64)
                (local.set $scratch_56
                 (local.tee $47
                  (block (result i64)
                   (local.set $scratch
                    (local.get $47)
                   )
                   (local.set $48
                    (local.get $48)
                   )
                   (local.get $scratch)
                  )
                 )
                )
                (local.set $48
                 (local.get $48)
                )
                (local.get $scratch_56)
               )
              )
             )
             (br $block5)
            )
            (local.set $7
             (unreachable)
            )
           )
(unreachable)) (catch_all
           (drop
            (array.new $1
             (local.get $25)
             (i32.and
              (i32.const 27)
              (i32.const 1023)
             )
            )
           )
           (local.set $27
            (if (result i32)
             (i32.eqz
              (i32.trunc_sat_f64_s
               (f64.reinterpret_i64
                (local.tee $50
                 (i64.load offset=4 align=2
                  (i32.and
                   (i32.const -1301640)
                   (i32.const 15)
                  )
                 )
                )
               )
              )
             )
             (then
              (block
               (atomic.fence)
               (nop)
              )
              (br $block5)
             )
             (else
              (ref.eq
               (local.tee $13
                (local.get $14)
               )
               (local.tee $12
                (local.get $12)
               )
              )
             )
            )
           )
          ))
        )
       )
      )
     )
     (loop $label2 (result i32)
      (if
       (i32.eqz
        (global.get $global$0)
       )
       (then
        (global.set $global$0
         (i32.const 25)
        )
        (unreachable)
       )
      )
      (global.set $global$0
       (i32.sub
        (global.get $global$0)
        (i32.const 1)
       )
      )
      (call $fimport$0
       (i32.const 127)
      )
      (br_if $label2
       (if (result i32)
        (local.tee $27
         (ref.is_null
          (struct.new_default $4)
         )
        )
        (then
         (try $__t_10  (do (try  (do 
           (loop $label3
            (if
             (i32.eqz
              (global.get $global$0)
             )
             (then
              (global.set $global$0
               (i32.const 25)
              )
              (unreachable)
             )
            )
            (global.set $global$0
             (i32.sub
              (global.get $global$0)
              (i32.const 1)
             )
            )
            (drop
             (br_on_null $label2
              (struct.new_default $4)
             )
            )
            (memory.init $0
             (i32.and
              (string.eq
               (block (result (ref string))
                (nop)
                (string.const "")
               )
               (select (result (ref string))
                (ref.as_non_null
                 (local.tee $4
                  (ref.as_non_null
                   (local.tee $4
                    (string.const "")
                   )
                  )
                 )
                )
                (ref.as_non_null
                 (local.get $4)
                )
                (i32.const -2147483648)
               )
              )
              (i32.const 15)
             )
             (i32.const 27)
             (i32.const 0)
            )
            (br_if $label3
             (i32.const 67)
            )
            (call_ref $10
             (block (result (ref string))
              (table.set $0
               (i64.const 5)
               (loop (result nullfuncref)
                (if
                 (i32.eqz
                  (global.get $global$0)
                 )
                 (then
                  (global.set $global$0
                   (i32.const 25)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$0
                 (i32.sub
                  (global.get $global$0)
                  (i32.const 1)
                 )
                )
                (local.tee $20
                 (local.tee $21
                  (local.tee $22
                   (try $__t_9 (result (ref nofunc)) (do (try (result (ref nofunc)) (do 
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                    ) (delegate $__t_9))) (catch_all
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                    ))
                  )
                 )
                )
               )
              )
              (if (result (ref string))
               (i32.eqz
                (loop (result i32)
                 (if
                  (i32.eqz
                   (global.get $global$0)
                  )
                  (then
                   (global.set $global$0
                    (i32.const 25)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$0
                  (i32.sub
                   (global.get $global$0)
                   (i32.const 1)
                  )
                 )
                 (block (result i32)
                  (block
                   (local.set $27
                    (i32.const 63275)
                   )
                   (nop)
                  )
                  (string.measure_wtf16
                   (ref.as_non_null
                    (local.get $4)
                   )
                  )
                 )
                )
               )
               (then
                (if
                 (i32.lt_u
                  (i32.add
                   (local.tee $34
                    (i32.const -3023)
                   )
                   (block (result i32)
                    (local.set $23
                     (block (result (ref (exact $4)))
                      (local.set $scratch_58
                       (struct.new_default $4)
                      )
                      (local.set $32
                       (block (result i32)
                        (local.set $scratch_57
                         (i32.const 512)
                        )
                        (local.set $33
                         (i32.const -108)
                        )
                        (local.get $scratch_57)
                       )
                      )
                      (local.get $scratch_58)
                     )
                    )
                    (local.tee $35
                     (local.get $33)
                    )
                   )
                  )
                  (array.len
                   (local.tee $16
                    (local.get $14)
                   )
                  )
                 )
                 (then
                  (if
                   (i32.lt_u
                    (i32.add
                     (local.tee $36
                      (local.get $25)
                     )
                     (local.tee $37
                      (local.get $35)
                     )
                    )
                    (array.len
                     (local.tee $17
                      (local.tee $13
                       (local.get $13)
                      )
                     )
                    )
                   )
                   (then
                    (array.copy $3 $3
                     (local.get $16)
                     (local.get $34)
                     (local.get $17)
                     (local.get $36)
                     (local.get $37)
                    )
                   )
                  )
                 )
                )
                (ref.as_non_null
                 (local.get $4)
                )
               )
               (else
                (string.const "\e2\82\ac\ed\bd\88\f0\90\8d\88")
               )
              )
             )
             (ref.func $fimport$8)
            )
           )
          ) (delegate $__t_10))) (catch $tag$0
(local.set $54 (call $__popsink_0 (pop f32)))
(if (global.get $__rt) (then (rethrow $__t_10)))
(if
            (i32.eqz
             (if (result i32)
              (i32.lt_u
               (local.tee $38
                (local.get $27)
               )
               (array.len
                (local.tee $18
                 (local.get $13)
                )
               )
              )
              (then
               (array.get_s $3
                (local.get $18)
                (local.get $38)
               )
              )
              (else
               (i32.const -9)
              )
             )
            )
            (then
             (block $block8
              (if
               (i32.lt_u
                (i32.add
                 (local.tee $39
                  (local.get $25)
                 )
                 (local.tee $40
                  (i32.const -90)
                 )
                )
                (array.len
                 (local.tee $24
                  (local.get $1)
                 )
                )
               )
               (then
                (array.fill $3
                 (local.get $24)
                 (local.get $39)
                 (loop (result i32)
                  (if
                   (i32.eqz
                    (global.get $global$0)
                   )
                   (then
                    (global.set $global$0
                     (i32.const 25)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$0
                   (i32.sub
                    (global.get $global$0)
                    (i32.const 1)
                   )
                  )
                  (loop (result i32)
                   (if
                    (i32.eqz
                     (global.get $global$0)
                    )
                    (then
                     (global.set $global$0
                      (i32.const 25)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$0
                    (i32.sub
                     (global.get $global$0)
                     (i32.const 1)
                    )
                   )
                   (block (result i32)
                    (br_if $block8
                     (stringview_wtf16.get_codeunit
                      (ref.as_non_null
                       (local.get $4)
                      )
                      (block (result i32)
                       (local.set $44
                        (string.eq
                         (ref.as_non_null
                          (local.get $4)
                         )
                         (string.const "\ed\bd\88")
                        )
                       )
                       (local.get $44)
                      )
                     )
                    )
                    (local.get $27)
                   )
                  )
                 )
                 (local.get $40)
                )
               )
              )
              (try $__t_8  (do (try  (do 
                (nop)
               ) (delegate $__t_8))) (catch $tag$1
                (throw $tag$1 (pop i32))
                (nop)
               ))
             )
            )
           )))
         (br $label2)
        )
        (else
         (if
          (stringview_wtf16.get_codeunit
           (select (result (ref string))
            (string.const "\ed\a0\80")
            (string.const "\c2\a3")
            (ref.eq
             (array.new $1
              (local.get $25)
              (i32.and
               (i32.const 5)
               (i32.const 1023)
              )
             )
             (select (result (ref $3))
              (try $__t_7 (result (ref $3)) (do (try (result (ref $3)) (do 
                (local.get $14)
               ) (delegate $__t_7))) (catch_all
                (local.tee $14
                 (if (result (ref $3))
                  (i32.eqz
                   (local.get $25)
                  )
                  (then
                   (local.get $14)
                  )
                  (else
                   (local.get $13)
                  )
                 )
                )
               ))
              (block (result (ref $3))
               (drop
                (br_on_null $label2
                 (ref.as_non_null
                  (ref.null nofunc)
                 )
                )
               )
               (local.tee $14
                (local.tee $14
                 (loop $label4 (result (ref $3))
                  (if
                   (i32.eqz
                    (global.get $global$0)
                   )
                   (then
                    (global.set $global$0
                     (i32.const 25)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$0
                   (i32.sub
                    (global.get $global$0)
                    (i32.const 1)
                   )
                  )
                  (if
                   (i32.lt_u
                    (i32.add
                     (local.tee $42
                      (local.get $25)
                     )
                     (local.tee $43
                      (i32.const -128)
                     )
                    )
                    (array.len
                     (local.tee $19
                      (local.get $13)
                     )
                    )
                   )
                   (then
                    (array.fill $3
                     (local.get $19)
                     (local.get $42)
                     (local.get $25)
                     (local.get $43)
                    )
                   )
                  )
                  (br_if $label4
                   (i32.eqz
                    (block (result i32)
                     (nop)
                     (i32.const -128)
                    )
                   )
                  )
                  (local.get $13)
                 )
                )
               )
              )
              (if (result i32)
               (local.get $27)
               (then
                (if
                 (i32.eqz
                  (string.eq
                   (string.const "\ed\bd\88")
                   (string.const "")
                  )
                 )
                 (then
                  (nop)
                 )
                )
                (br $label2)
               )
               (else
                (string.measure_wtf16
                 (string.const "1005\e2\82\ac\ed\bd\88")
                )
               )
              )
             )
            )
           )
           (block (result i32)
            (local.set $44
             (ref.eq
              (ref.null none)
              (array.new_fixed $14 0)
             )
            )
            (local.get $44)
           )
          )
          (then
           (br_if $label2
            (local.tee $27
             (string.encode_wtf16_array
              (ref.as_non_null
               (local.get $4)
              )
              (try_table (result (ref (exact $11))) (catch $tag$1 $block6) (catch_all $label2)
               (array.new_default $11
                (i32.and
                 (i32.const 92)
                 (i32.const 1023)
                )
               )
              )
              (i32.const 52)
             )
            )
           )
          )
         )
         (string.measure_wtf16
          (ref.as_non_null
           (local.get $4)
          )
         )
        )
       )
      )
      (if (result i32)
       (local.get $25)
       (then
        (loop $label5
         (if
          (i32.eqz
           (global.get $global$0)
          )
          (then
           (global.set $global$0
            (i32.const 25)
           )
           (unreachable)
          )
         )
         (global.set $global$0
          (i32.sub
           (global.get $global$0)
           (i32.const 1)
          )
         )
         (block
          (br_if $label5
           (i32.load16_s offset=22
            (i32.and
             (i32.const 57)
             (i32.const 15)
            )
           )
          )
          (nop)
         )
        )
        (i32.const -400)
       )
       (else
        (local.tee $27
         (i32.atomic.load8_u offset=22
          (i32.and
           (block (result i32)
            (loop
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 25)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (atomic.fence)
            )
            (stringview_wtf16.get_codeunit
             (local.get $2)
             (block (result i32)
              (local.set $44
               (ref.eq
                (array.new $1
                 (local.get $27)
                 (i32.and
                  (i32.const 21)
                  (i32.const 1023)
                 )
                )
                (ref.null none)
               )
              )
              (local.get $44)
             )
            )
           )
           (i32.const 15)
          )
         )
        )
       )
      )
     )
    )
   )
   (block
    (local.set $47
     (block (result i64)
      (local.set $scratch_59
       (i64.const -1100417)
      )
      (local.set $48
       (i64.const -90)
      )
      (local.get $scratch_59)
     )
    )
    (return
     (string.const "")
    )
   )
   (unreachable)
  )
 )
 (func $2 (type $21) (result (ref struct))
  (local $0 (ref string))
  (local $1 (ref i31))
  (local $2 (ref null $3))
  (local $3 (ref struct))
  (local $4 (ref $3))
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 f64)
  (local $15 f64)
  (local $16 f64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $3
   (struct.new_default $4)
  )
  (local.set $2
   (ref.as_non_null
    (local.get $2)
   )
  )
  (local.set $1
   (ref.i31
    (i32.const -268435456)
   )
  )
  (drop
   (string.const "\e2\82\ac\e2\82\ac")
  )
  (drop
   (array.new $1
    (stringview_wtf16.get_codeunit
     (local.tee $0
      (string.const "382\ed\bd\88")
     )
     (block (result i32)
      (local.set $13
       (try $__t_6 (result i32) (do (try (result i32) (do 
         (call $fimport$5
          (v128.const i32x4 0x09650000 0xffad0001 0xffff0075 0x1e4cfe00)
         )
         (i32.const -25022)
        ) (delegate $__t_6))) (catch $tag$0
         (local.set $5 (f32.mul (pop f32) (f32.const -1)))
         (try $__t_5 (result i32) (do (try (result i32) (do 
           (i32.const 67108864)
          ) (delegate $__t_5))) (catch_all (if (global.get $__rt) (then (rethrow $__t_5)))
(i32.const -65536)))
        ) (catch_all (if (global.get $__rt) (then (rethrow $__t_6)))
(i32.const -19429)))
      )
      (local.get $13)
     )
    )
    (i32.and
     (i32.const 95)
     (i32.const 1023)
    )
   )
  )
  (drop
   (i64.const -262144)
  )
  (drop
   (ref.null none)
  )
  (block
   (call $fimport$5
    (v128.const i32x4 0xffffff89 0x7fffffff 0x00004000 0xcb792c45)
   )
   (block
    (call $fimport$0
     (i32.const 0)
    )
    (return
     (struct.new_default $4)
    )
   )
   (local.set $0
    (unreachable)
   )
  )
  (unreachable)
 )
 (func $3 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $4 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (ref.func $3)
   (struct.new_default $4)
   (ref.func $3)
  )
 )
 (func $5 (type $22) (result f64)
  (local $0 eqref)
  (local $1 (ref null $1))
  (local $2 i31ref)
  (local $3 structref)
  (local $4 (ref null $2))
  (local $5 externref)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 f32)
  (local $15 f32)
  (local $16 f64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f64.const -nan:0xf961914633b40)
   )
  )
  (unreachable)
 )
 (func $6 (type $5)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
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
  (drop
   (call $5)
  )
 )
 (func $7 (type $23) (param $0 (ref $1)) (param $1 f64) (param $2 (ref $2)) (param $3 i64) (result i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 i32)
  (local $8 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block $block (result i32)
   (call $fimport$1
    (i32.const 1182629208)
   )
   (atomic.fence)
   (try $__t_4 (result i32) (do (try (result i32) (do 
     (br_if $block
      (select
       (i32.const -614311842)
       (i32.const 15457)
       (i32.shr_s
        (block (result i32)
         (call $fimport$5
          (v128.const i32x4 0xffee3814 0x00000000 0xffffff8f 0xffffffff)
         )
         (i32.const -57)
        )
        (i16x8.extract_lane_s 6
         (v128.const i32x4 0xffffffc2 0x00000038 0xffffffba 0xc0000000)
        )
       )
      )
      (i32.eqz
       (ref.is_null
        (array.new_default $3
         (i32.and
          (i32.const 45)
          (i32.const 1023)
         )
        )
       )
      )
     )
    ) (delegate $__t_4))) (catch $tag$1
(i32.store8 (pop i32) (i32.const 42))
(if (global.get $__rt) (then (rethrow $__t_4)))
(i32.const 128)) (catch_all
     (i32.const -65535)
    ))
  )
 )
 (func $8 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 i64)
  (local $2 i64)
  (local $3 f64)
  (local $4 f64)
  (local $5 i32)
  (local $6 anyref)
  (local $7 funcref)
  (local $8 externref)
  (local $9 eqref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (ref.func $3)
   (struct.new_default $4)
   (ref.func $3)
  )
 )
 (@binaryen.js.called)
 (func $9 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 f32)
  (local $2 i32)
  (local $3 stringref)
  (local $4 (ref $2))
  (local $5 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (block
    (nop)
    (call $fimport$8
     (ref.null noextern)
    )
   )
   (throw $tag$1
    (try $__t_3 (result i32) (do (try (result i32) (do 
      (i32.const 32768)
     ) (delegate $__t_3))) (catch $tag$1
(throw $tag$1 (pop i32))
(if (global.get $__rt) (then (rethrow $__t_3)))
(i32.const -2147483646)))
   )
  )
  (unreachable)
 )
 (func $10 (type $5)
  (local $scratch (tuple (ref $2) structref (ref $2)))
  (local $scratch_1 structref)
  (local $scratch_2 (ref $2))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $2))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $9
        (v128.const i32x4 0x000400fd 0x00002c56 0x00f8ffa9 0x0000ffb2)
       )
      )
     )
    )
    (drop
     (block (result structref)
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
 (func $11 (type $24) (param $0 (ref $1)) (param $1 anyref) (param $2 (ref null $3)) (result exnref)
  (local $3 stringref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block $block (result (ref exn))
   (try_table (catch_all_ref $block)
    (throw $tag$2)
   )
   (unreachable)
  )
 )
 (func $12 (type $5)
  (local $0 i31ref)
  (local $1 (ref $3))
  (local $2 (ref $3))
  (local $3 (ref $3))
  (local $4 (ref string))
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f32)
  (local $10 i64)
  (local $11 v128)
  (local $12 v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (array.new $1
    (i32.const -68)
    (i32.and
     (i32.const 45)
     (i32.const 1023)
    )
   )
  )
  (drop
   (ref.i31
    (i32.const -3)
   )
  )
  (block
   (loop
    (if
     (i32.eqz
      (global.get $global$0)
     )
     (then
      (global.set $global$0
       (i32.const 25)
      )
      (unreachable)
     )
    )
    (global.set $global$0
     (i32.sub
      (global.get $global$0)
      (i32.const 1)
     )
    )
    (block
     (call $fimport$4
      (f64.const 2147483646.095)
     )
     (call $fimport$7
      (ref.cast (ref (exact $2))
       (ref.func $3)
      )
     )
    )
   )
   (return)
  )
  (local.set $2
   (unreachable)
  )
 )
 (@binaryen.js.called)
 (func $13 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 v128)
  (local $13 exnref)
  (local $14 (ref null $0))
  (local $15 (ref null $1))
  (local $16 (ref null $1))
  (local $17 (ref $3))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block (type $9) (result (ref (exact $2)) (ref (exact $4)) (ref (exact $2)))
   (block $block
    (if
     (i32.lt_u
      (i32.add
       (local.tee $7
        (ref.eq
         (array.new_default $1
          (i32.and
           (i32.const 1)
           (i32.const 1023)
          )
         )
         (block $block1 (result (ref (exact $3)))
          (f64.store offset=3 align=4
           (i32.const -4277)
           (if (result f64)
            (loop $label (result i32)
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 25)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (block
              (call $fimport$5
               (call $0)
              )
              (drop
               (f64.nearest
                (f64.const 33554431)
               )
              )
             )
             (drop
              (br_on_null $label
               (array.new $3
                (i32.const 0)
                (i32.and
                 (i32.const 91)
                 (i32.const 1023)
                )
               )
              )
             )
             (br_if $label
              (i32.eqz
               (ref.eq
                (array.new $1
                 (i32.const 1073741824)
                 (i32.and
                  (i32.const 38)
                  (i32.const 1023)
                 )
                )
                (ref.null none)
               )
              )
             )
             (ref.is_null
              (try_table (result (ref (exact $2))) (catch_all $label)
               (ref.func $3)
              )
             )
            )
            (then
             (drop
              (br_on_null $block
               (array.new_fixed $14 0)
              )
             )
             (drop
              (br_on_null $block
               (string.const "615")
              )
             )
             (br_on_non_null $block1
              (array.new_default $3
               (i32.and
                (i32.const 82)
                (i32.const 1023)
               )
              )
             )
             (f64.load offset=22 align=2
              (i32.and
               (i32.atomic.load8_u acqrel offset=22
                (i32.and
                 (loop $label1 (result i32)
                  (if
                   (i32.eqz
                    (global.get $global$0)
                   )
                   (then
                    (global.set $global$0
                     (i32.const 25)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$0
                   (i32.sub
                    (global.get $global$0)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label1
                   (i32.const 262145)
                  )
                  (drop
                   (br_on_null $label1
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (i32.const -32767)
                 )
                 (i32.const 15)
                )
               )
               (i32.const 15)
              )
             )
            )
            (else
             (loop
              (if
               (i32.eqz
                (global.get $global$0)
               )
               (then
                (global.set $global$0
                 (i32.const 25)
                )
                (unreachable)
               )
              )
              (global.set $global$0
               (i32.sub
                (global.get $global$0)
                (i32.const 1)
               )
              )
              (block
               (block
                (return
                 (tuple.make 3
                  (ref.func $8)
                  (struct.new_default $4)
                  (ref.func $8)
                 )
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
          (block (result (ref (exact $3)))
           (call $fimport$5
            (call $0)
           )
           (array.new_default $3
            (i32.and
             (i32.const 37)
             (i32.const 1023)
            )
           )
          )
         )
        )
       )
       (local.tee $8
        (i32.const -32130)
       )
      )
      (array.len
       (local.tee $17
        (array.new $3
         (local.get $6)
         (i32.and
          (i32.const 58)
          (i32.const 1023)
         )
        )
       )
      )
     )
     (then
      (array.fill $3
       (local.get $17)
       (local.get $7)
       (local.tee $6
        (i32.const 255)
       )
       (local.get $8)
      )
     )
    )
    (call $fimport$3
     (f32.const -1750)
    )
   )
   (tuple.make 3
    (ref.func $3)
    (struct.new_default $4)
    (ref.func $3)
   )
  )
 )
 (func $14 (type $5)
  (local $scratch (tuple (ref $0) structref (ref $0)))
  (local $scratch_1 structref)
  (local $scratch_2 (ref $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $0))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $13
        (v128.const i32x4 0x0000ff8d 0xffffe001 0xfffffff3 0x00000004)
       )
      )
     )
    )
    (drop
     (block (result structref)
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
 (func $15 (type $25) (result (ref null $3))
  (local $0 (ref $3))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.tee $0
   (array.new_default $3
    (i32.and
     (i32.const 15)
     (i32.const 1023)
    )
   )
  )
 )
 (func $16 (type $5)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $15)
  )
 )
 (func $17 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 f64)
  (local $2 f64)
  (local $3 (ref string))
  (local $4 (ref null $1))
  (local $5 (ref null $0))
  (local $6 exnref)
  (local $7 eqref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (ref.func $3)
   (struct.new_default $4)
   (ref.func $3)
  )
 )
 (func $18 (type $5)
  (local $scratch (tuple (ref $2) structref (ref $2)))
  (local $scratch_1 structref)
  (local $scratch_2 (ref $2))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $2))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $17
        (v128.const i32x4 0xfffffff4 0x55800000 0xffffff95 0xfffffff3)
       )
      )
     )
    )
    (drop
     (block (result structref)
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
 (func $19 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 (ref $0))
  (local $2 arrayref)
  (local $3 anyref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (memory.init $0
    (i32.and
     (i32.const -30922)
     (i32.const 15)
    )
    (i32.const 19)
    (i32.const 7)
   )
   (return
    (tuple.make 3
     (ref.func $3)
     (struct.new_default $4)
     (ref.func $17)
    )
   )
  )
  (unreachable)
 )
 (func $20 (type $26) (param $0 (ref $3)) (param $1 i32) (result (ref $0))
  (local $2 i64)
  (local $3 i64)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 (ref $0))
  (local $11 (ref $3))
  (local $12 (ref $3))
  (local $13 (ref string))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.tee $10
   (if (result (ref (exact $2)))
    (local.get $1)
    (then
     (block $block1 (result (ref (exact $2)))
      (loop $label
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 25)
         )
         (unreachable)
        )
       )
       (global.set $global$0
        (i32.sub
         (global.get $global$0)
         (i32.const 1)
        )
       )
       (if
        (i32.eqz
         (i32.const -4557204)
        )
        (then
         (if
          (i32.eqz
           (local.get $1)
          )
          (then
           (nop)
           (call $fimport$4
            (f64x2.extract_lane 1
             (local.tee $4
              (v128.const i32x4 0xffffffef 0xffffffff 0x624dd2f2 0xc0219810)
             )
            )
           )
          )
          (else
           (nop)
          )
         )
         (call $fimport$1
          (local.get $1)
         )
        )
        (else
         (loop
          (if
           (i32.eqz
            (global.get $global$0)
           )
           (then
            (global.set $global$0
             (i32.const 25)
            )
            (unreachable)
           )
          )
          (global.set $global$0
           (i32.sub
            (global.get $global$0)
            (i32.const 1)
           )
          )
          (nop)
          (drop
           (struct.new_default $4)
          )
          (block
           (nop)
           (br $label)
          )
          (unreachable)
         )
         (unreachable)
        )
       )
       (br_if $label
        (i32.eqz
         (i32.const 97)
        )
       )
       (if
        (i32.lt_u
         (i32.add
          (local.tee $5
           (i32.const -52)
          )
          (local.tee $6
           (i32.atomic.load acqrel offset=22
            (i32.and
             (i32.trunc_sat_f64_s
              (f64.const 3402823466385288598117041e14)
             )
             (i32.const 15)
            )
           )
          )
         )
         (array.len
          (local.tee $11
           (local.tee $0
            (array.new_default $3
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
         (if
          (i32.lt_u
           (i32.add
            (local.tee $7
             (local.get $1)
            )
            (local.tee $8
             (local.get $6)
            )
           )
           (array.len
            (local.tee $12
             (local.get $0)
            )
           )
          )
          (then
           (array.copy $3 $3
            (local.get $11)
            (local.get $5)
            (local.get $12)
            (local.get $7)
            (local.get $8)
           )
          )
         )
        )
       )
      )
      (loop $label1 (result (ref (exact $2)))
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 25)
         )
         (unreachable)
        )
       )
       (global.set $global$0
        (i32.sub
         (global.get $global$0)
         (i32.const 1)
        )
       )
       (block
        (block $block
         (block
          (call $fimport$0
           (i32.const 0)
          )
          (br $block)
         )
         (unreachable)
        )
        (drop
         (br_on_cast $block1 (ref (exact $2)) (ref (exact $2))
          (ref.func $9)
         )
        )
       )
       (br_if $label1
        (i32.eqz
         (block $block2 (result i32)
          (try_table (catch $tag$1 $block2) (catch_all $label1)
           (call $fimport$0
            (i32.const -1421302)
           )
          )
          (br $label1)
         )
        )
       )
       (ref.func $3)
      )
     )
    )
    (else
     (nop)
     (return
      (ref.func $17)
     )
    )
   )
  )
 )
 (func $21 (type $5)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $20
    (array.new_default $3
     (i32.and
      (i32.const 92)
      (i32.const 1023)
     )
    )
    (i32.const -2147483647)
   )
  )
  (drop
   (call $20
    (array.new_default $3
     (i32.and
      (i32.const 50)
      (i32.const 1023)
     )
    )
    (i32.const -1456601065)
   )
  )
  (drop
   (call $20
    (array.new_default $3
     (i32.and
      (i32.const 94)
      (i32.const 1023)
     )
    )
    (i32.const 32767)
   )
  )
  (drop
   (call $20
    (array.new_default $3
     (i32.and
      (i32.const 31)
      (i32.const 1023)
     )
    )
    (i32.const -2)
   )
  )
  (drop
   (call $20
    (array.new $3
     (i32.const -3497)
     (i32.and
      (i32.const 23)
      (i32.const 1023)
     )
    )
    (i32.const 32768)
   )
  )
 )
 (func $22 (type $27) (result (ref null $2))
  (local $0 (ref $2))
  (local $1 exnref)
  (local $2 (ref $3))
  (local $3 (ref struct))
  (local $4 (ref null $1))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (ref.func $3)
 )
 (func $23 (type $5)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $22)
  )
  (drop
   (call $22)
  )
 )
 (func $24 (type $28) (param $0 (ref null $0)) (result f64)
  (local $1 anyref)
  (local $2 externref)
  (local $3 f64)
  (local $4 f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$2
    (i64.rem_s
     (i64.const -144115188075855871)
     (i64.const -127)
    )
   )
   (return
    (local.get $3)
   )
  )
  (unreachable)
 )
 (func $25 (type $29) (result (ref null $0))
  (local $0 (ref $3))
  (local $1 (ref $3))
  (local $2 (ref null $0))
  (local $3 (ref string))
  (local $4 i64)
  (local $5 f64)
  (local $6 i32)
  (local $7 i32)
  (local $scratch (ref (exact $2)))
  (local $scratch_9 f64)
  (local $scratch_10 nullfuncref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $0
   (array.new_default $3
    (i32.and
     (i32.const 7)
     (i32.const 1023)
    )
   )
  )
  (block (result (ref (exact $2)))
   (if
    (i32.lt_u
     (local.tee $6
      (stringview_wtf16.get_codeunit
       (string.const "")
       (block (result i32)
        (local.set $7
         (i32.const -5877)
        )
        (local.get $7)
       )
      )
     )
     (array.len
      (local.tee $1
       (local.get $0)
      )
     )
    )
    (then
     (array.set $3
      (local.get $1)
      (local.get $6)
      (i32.const -22159)
     )
    )
   )
   (if
    (string.encode_wtf16_array
     (local.tee $3
      (string.const "")
     )
     (array.new_default $11
      (i32.and
       (i32.const 77)
       (i32.const 1023)
      )
     )
     (i32.const 0)
    )
    (then
     (i64.store32 offset=22
      (i32.and
       (i32.const -346152444)
       (i32.const 15)
      )
      (i64.extend8_s
       (i64.const -68)
      )
     )
    )
    (else
     (drop
      (block (result nullfuncref)
       (local.set $scratch_10
        (ref.null nofunc)
       )
       (drop
        (block (result f64)
         (local.set $scratch_9
          (f64.const -281474976710655)
         )
         (drop
          (block (result (ref (exact $2)))
           (local.set $scratch
            (ref.func $19)
           )
           (drop
            (f64.const 17179869185.599)
           )
           (local.get $scratch)
          )
         )
         (local.get $scratch_9)
        )
       )
       (local.get $scratch_10)
      )
     )
    )
   )
   (ref.func $3)
  )
 )
 (func $26 (type $5)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (call $25)
  )
 )
 (func $27 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 stringref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block (type $9) (result (ref (exact $2)) (ref (exact $4)) (ref (exact $2)))
   (memory.fill
    (i32.and
     (i32.trunc_sat_f32_s
      (try_table (result f32)
       (f32.const -25750)
      )
     )
     (i32.const 15)
    )
    (i32.const -2147483648)
    (i32.const -29165)
   )
   (tuple.make 3
    (ref.func $17)
    (struct.new_default $4)
    (ref.func $3)
   )
  )
 )
 (@binaryen.js.called)
 (func $28 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 eqref)
  (local $2 (ref eq))
  (local $3 f64)
  (local $4 i64)
  (local $5 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (tuple.make 3
     (ref.func $27)
     (struct.new_default $4)
     (ref.func $3)
    )
   )
  )
  (unreachable)
 )
 (func $29 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 v128)
  (local $5 v128)
  (local $6 i64)
  (local $7 i64)
  (local $8 f64)
  (local $9 (ref null $2))
  (local $10 eqref)
  (local $11 externref)
  (local $12 arrayref)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (ref.func $27)
   (struct.new_default $4)
   (ref.func $9)
  )
 )
 (func $30 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 (ref $3))
  (local $2 (ref $3))
  (local $3 (ref $3))
  (local $4 (ref $3))
  (local $5 (ref $3))
  (local $6 (ref string))
  (local $7 (ref none))
  (local $8 (ref $2))
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (tuple.make 3
     (ref.func $3)
     (struct.new_default $4)
     (ref.func $3)
    )
   )
  )
  (unreachable)
 )
 (func $31 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 (ref $0))
  (local $2 anyref)
  (local $3 anyref)
  (local $4 v128)
  (local $5 v128)
  (local $6 v128)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (return_call_ref $0
   (v128.const i32x4 0xffffffc1 0xffffffff 0x00000801 0x00000000)
   (ref.func $28)
  )
 )
 (func $32 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 (ref null $0))
  (local $2 (ref null $0))
  (local $3 (ref null $0))
  (local $4 arrayref)
  (local $5 stringref)
  (local $6 (ref eq))
  (local $7 (ref array))
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (block
   (table.set $1
    (i32.const 4)
    (table.get $1
     (i32.const 3)
    )
   )
   (return
    (tuple.make 3
     (ref.func $3)
     (struct.new_default $4)
     (ref.func $3)
    )
   )
  )
  (unreachable)
 )
 (func $33 (type $5)
  (local $scratch (tuple (ref $0) structref (ref $0)))
  (local $scratch_1 structref)
  (local $scratch_2 (ref $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $0))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $32
        (v128.const i32x4 0xdf800000 0xffffffe4 0xc2c20000 0x5d000000)
       )
      )
     )
    )
    (drop
     (block (result structref)
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
 (func $34 (type $2) (param $0 v128) (result (ref $2) structref (ref $2))
  (local $1 (ref null $2))
  (local $2 (ref null $2))
  (local $3 structref)
  (local $scratch structref)
  (local $scratch_5 (ref $2))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $1
   (block (result (ref $2))
    (local.set $scratch_5
     (ref.as_non_null
      (local.get $1)
     )
    )
    (local.set $3
     (block (result structref)
      (local.set $scratch
       (local.get $3)
      )
      (local.set $2
       (ref.as_non_null
        (local.get $2)
       )
      )
      (local.get $scratch)
     )
    )
    (local.get $scratch_5)
   )
  )
  (tuple.make 3
   (ref.as_non_null
    (local.get $1)
   )
   (local.get $3)
   (ref.as_non_null
    (local.get $2)
   )
  )
 )
 (func $35 (type $0) (param $0 v128) (result (ref $0) structref (ref $0))
  (local $1 eqref)
  (local $2 (ref string))
  (local $3 (ref string))
  (local $4 (ref none))
  (local $5 (ref $3))
  (local $6 f64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 f32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $2
   (string.const "")
  )
  (if (type $9) (result (ref (exact $2)) (ref (exact $4)) (ref (exact $2)))
   (i32.const -2347483)
   (then
    (tuple.make 3
     (ref.func $34)
     (struct.new_default $4)
     (ref.func $17)
    )
   )
   (else
    (try $__t_2  (do (try  (do 
      (if
       (i32.eqz
        (i32.const 1048576)
       )
       (then
        (if
         (i32.lt_u
          (i32.add
           (local.tee $9
            (local.get $7)
           )
           (local.tee $10
            (local.get $7)
           )
          )
          (array.len
           (local.tee $5
            (array.new_default $3
             (i32.and
              (i32.const 31)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (array.fill $3
           (local.get $5)
           (local.get $9)
           (select
            (i32.const -2762)
            (i32.const 1048576)
            (i32.const 255)
           )
           (local.get $10)
          )
         )
        )
        (return
         (tuple.make 3
          (ref.func $9)
          (struct.new_default $4)
          (ref.func $3)
         )
        )
       )
       (else
        (call $fimport$3
         (f32.const 1023)
        )
        (return
         (tuple.make 3
          (ref.func $3)
          (struct.new_default $4)
          (ref.func $3)
         )
        )
       )
      )
      (unreachable)
     ) (delegate $__t_2))) (catch_all (if (global.get $__rt) (then (rethrow $__t_2)))
(try $__t_1  (do (try  (do 
        (call $fimport$6
         (select (result (ref (exact $3)))
          (array.new $3
           (i32.const -2147483648)
           (i32.and
            (i32.const 77)
            (i32.const 1023)
           )
          )
          (array.new $3
           (i32.const 126)
           (i32.and
            (i32.const 0)
            (i32.const 1023)
           )
          )
          (local.get $7)
         )
        )
       ) (delegate $__t_1))) (catch $tag$1
        (local.set $11 (local.tee $11 (pop i32)))
        (loop $label
         (if
          (i32.eqz
           (global.get $global$0)
          )
          (then
           (global.set $global$0
            (i32.const 25)
           )
           (unreachable)
          )
         )
         (global.set $global$0
          (i32.sub
           (global.get $global$0)
           (i32.const 1)
          )
         )
         (call $fimport$1
          (loop (result i32)
           (if
            (i32.eqz
             (global.get $global$0)
            )
            (then
             (global.set $global$0
              (i32.const 25)
             )
             (unreachable)
            )
           )
           (global.set $global$0
            (i32.sub
             (global.get $global$0)
             (i32.const 1)
            )
           )
           (block $block (result i32)
            (try_table (catch $tag$1 $block) (catch_all $label)
             (nop)
            )
            (i32.const -42)
           )
          )
         )
        )
       ) (catch $tag$0
(local.set $13 (call_ref $__sinkT_0 (pop f32) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_1)))
(nop)) (catch_all
        (nop)
       ))))
    (if
     (i32.load8_s offset=4
      (i32.and
       (local.tee $7
        (try_table (result i32)
         (i32.const -81)
        )
       )
       (i32.const 15)
      )
     )
     (then
      (nop)
      (block
       (call $fimport$8
        (ref.null noextern)
       )
      )
     )
    )
    (return
     (tuple.make 3
      (ref.func $3)
      (struct.new_default $4)
      (ref.func $3)
     )
    )
   )
  )
 )
 (func $36 (type $5)
  (local $scratch (tuple (ref $0) structref (ref $0)))
  (local $scratch_1 structref)
  (local $scratch_2 (ref $0))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $0))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $35
        (v128.const i32x4 0x00000000 0x40f00000 0x95000000 0x41de0c01)
       )
      )
     )
    )
    (drop
     (block (result structref)
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
 (func $37 (type $30) (param $0 (ref null $1)) (param $1 i64) (param $2 v128) (param $3 structref) (param $4 (ref eq)) (result (ref eq))
  (local $5 funcref)
  (local $6 (ref null $0))
  (local $7 eqref)
  (local $8 (ref null $3))
  (local $9 (ref $3))
  (local $10 (ref $3))
  (local $11 (ref $3))
  (local $12 (ref struct))
  (local $13 (ref $1))
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 f32)
  (local $23 f32)
  (local $24 f64)
  (local $25 f64)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 25)
    )
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.sub
    (global.get $global$0)
    (i32.const 1)
   )
  )
  (local.set $8
   (ref.as_non_null
    (local.get $8)
   )
  )
  (block $block (result (ref (exact $4)))
   (if
    (i32.lt_u
     (i32.add
      (local.tee $20
       (ref.eq
        (ref.i31
         (i32.const -8388608)
        )
        (if (result (ref eq))
         (f64.eq
          (f64.const 90)
          (f64.const -102)
         )
         (then
          (nop)
          (if (result (ref $3))
           (i32.eqz
            (try $__t_0 (result i32) (do (try (result i32) (do 
              (f32.ge
               (f32.const -2047.760009765625)
               (f32.load offset=2
                (i32.and
                 (i16x8.extract_lane_s 3
                  (local.get $2)
                 )
                 (i32.const 15)
                )
               )
              )
             ) (delegate $__t_0))) (catch $tag$0
(local.set $23 (call $__popsink_0 (pop f32)))
(if (global.get $__rt) (then (rethrow $__t_0)))
(block
               (if
                (i31.get_s
                 (ref.i31
                  (i32.const -65536)
                 )
                )
                (then
                 (if
                  (if (result i32)
                   (i32.lt_u
                    (local.tee $18
                     (local.get $15)
                    )
                    (array.len
                     (local.tee $10
                      (ref.as_non_null
                       (local.get $8)
                      )
                     )
                    )
                   )
                   (then
                    (array.get_u $3
                     (local.get $10)
                     (local.get $18)
                    )
                   )
                   (else
                    (local.get $15)
                   )
                  )
                  (then
                   (call $23)
                   (nop)
                  )
                 )
                 (nop)
                )
               )
               (return
                (ref.i31
                 (i32.const 60)
                )
               )
              )
(unreachable)) (catch $tag$1
              (local.set $19 (i32.and (pop i32) (i32.const 34)))
              (try_table (result i32)
               (i32.const -536870912)
              )
             ))
           )
           (then
            (loop $label1
             (if
              (i32.eqz
               (global.get $global$0)
              )
              (then
               (global.set $global$0
                (i32.const 25)
               )
               (unreachable)
              )
             )
             (global.set $global$0
              (i32.sub
               (global.get $global$0)
               (i32.const 1)
              )
             )
             (block
              (br_on_non_null $block
               (ref.null none)
              )
              (drop
               (loop (result (ref $3))
                (if
                 (i32.eqz
                  (global.get $global$0)
                 )
                 (then
                  (global.set $global$0
                   (i32.const 25)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$0
                 (i32.sub
                  (global.get $global$0)
                  (i32.const 1)
                 )
                )
                (loop $label (result (ref $3))
                 (if
                  (i32.eqz
                   (global.get $global$0)
                  )
                  (then
                   (global.set $global$0
                    (i32.const 25)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$0
                  (i32.sub
                   (global.get $global$0)
                   (i32.const 1)
                  )
                 )
                 (i64.atomic.store32 offset=22
                  (i32.and
                   (local.get $15)
                   (i32.const 15)
                  )
                  (i64.const -43)
                 )
                 (br_if $label
                  (ref.is_null
                   (try_table (result (ref $3)) (catch_all $label)
                    (ref.as_non_null
                     (local.get $8)
                    )
                   )
                  )
                 )
                 (ref.as_non_null
                  (local.get $8)
                 )
                )
               )
              )
              (drop
               (f64.const 108)
              )
              (drop
               (ref.func $34)
              )
              (loop
               (if
                (i32.eqz
                 (global.get $global$0)
                )
                (then
                 (global.set $global$0
                  (i32.const 25)
                 )
                 (unreachable)
                )
               )
               (global.set $global$0
                (i32.sub
                 (global.get $global$0)
                 (i32.const 1)
                )
               )
               (block
                (br $label1)
               )
               (unreachable)
              )
              (unreachable)
             )
             (unreachable)
            )
            (unreachable)
           )
           (else
            (if
             (i32.eqz
              (i16x8.extract_lane_s 4
               (v128.const i32x4 0x00007fff 0x00000000 0x00000000 0x01000000)
              )
             )
             (then
              (data.drop $0)
             )
            )
            (if (result (ref $3))
             (ref.eq
              (local.tee $12
               (struct.new_default $4)
              )
              (local.tee $13
               (ref.as_non_null
                (local.get $8)
               )
              )
             )
             (then
              (ref.as_non_null
               (local.get $8)
              )
             )
             (else
              (ref.as_non_null
               (local.get $8)
              )
             )
            )
           )
          )
         )
         (else
          (ref.as_non_null
           (local.get $8)
          )
         )
        )
       )
      )
      (local.tee $21
       (i32.const 1)
      )
     )
     (array.len
      (local.tee $11
       (ref.as_non_null
        (local.get $8)
       )
      )
     )
    )
    (then
     (array.fill $3
      (local.get $11)
      (local.get $20)
      (local.get $15)
      (local.get $21)
     )
    )
   )
   (struct.new_default $4)
  )
 )
 (type $__sinkT_0 (func (param f32) (result f32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (global $__rt i32 (i32.const 1))
)
