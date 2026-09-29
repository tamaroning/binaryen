(module
 (type $0 (struct (field (mut (ref null $0))) (field f32) (field (ref null $0)) (field (mut i64))))
 (type $1 (sub (func (param (ref null $0) f64 (ref null $0)) (result (ref $1) i32 (ref null $0)))))
 (type $2 (sub $1 (func (param eqref f64 eqref) (result (ref $2) i32 nullref))))
 (type $3 (func (result i64 (ref $2))))
 (type $4 (sub (func (param f64))))
 (type $5 (sub final $4 (func (param f64))))
 (type $6 (array i8))
 (type $7 (array (mut i16)))
 (type $8 (func))
 (type $9 (func (param i32)))
 (type $10 (func (result (ref $1) i32 (ref null $0))))
 (type $11 (func (result (ref $0) (ref $5) v128 i32 i32)))
 (type $12 (func (param i64)))
 (type $13 (func (param f32)))
 (type $14 (struct))
 (type $15 (func (param (ref $0) externref (ref $1))))
 (type $16 (func (result (ref $2) i32 nullref)))
 (type $17 (func (param arrayref)))
 (type $18 (func (param f64)))
 (type $19 (func (param v128)))
 (type $20 (func (param anyref)))
 (type $21 (func (param funcref)))
 (type $22 (func (param externref)))
 (type $23 (func (param (ref $1) (ref $0)) (result i64)))
 (type $24 (func (result (ref struct))))
 (type $25 (func (result i32)))
 (type $26 (func (param structref f32 i64) (result (ref null $4))))
 (type $27 (func (result i64)))
 (type $28 (func (result (ref (exact $5)) f64 f32 v128 i64)))
 (type $29 (func (result i64 (ref (exact $2)))))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $9) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $9) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $12) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $13) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $18) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $19) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $20) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $21) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $22) (param externref)))
 (global $global$0 (ref $1) (ref.func $0))
 (global $global$1 (mut (ref array)) (array.new_fixed $6 0))
 (global $global$2 v128 (v128.const i32x4 0xffffca53 0xffffffff 0xffffff88 0xffffffff))
 (global $global$3 f64 (f64.const 4294967251))
 (global $global$4 v128 (v128.const i32x4 0x00040000 0x00008001 0xffffff01 0xffffb278))
 (global $global$5 i64 (i64.const -2097153))
 (global $global$6 (mut (ref null $0)) (struct.new $0
  (struct.new $0
   (struct.new $0
    (struct.new $0
     (struct.new $0
      (struct.new $0
       (ref.null none)
       (f32.const -7)
       (ref.null none)
       (i64.const -9223372036854775807)
      )
      (f32.const -nan:0x200915)
      (struct.new $0
       (ref.null none)
       (f32.const -nan:0x7e7a3f)
       (struct.new_default $0)
       (i64.const 11557)
      )
      (i64.const -1)
     )
     (f32.const 121)
     (struct.new $0
      (ref.null none)
      (f32.const -nan:0x7fffe8)
      (struct.new $0
       (struct.new_default $0)
       (f32.const 9223372036854775808)
       (struct.new_default $0)
       (i64.const -9223372036854775808)
      )
      (i64.const 9223372036854775807)
     )
     (global.get $global$5)
    )
    (f32.const 3.719876680057592e-26)
    (struct.new_default $0)
    (i64.const -4481)
   )
   (f32.const 8388608)
   (struct.new $0
    (struct.new $0
     (struct.new $0
      (struct.new_default $0)
      (f32.const 4194303)
      (ref.null none)
      (i64.const -70368744177663)
     )
     (f32.const -140737488355328)
     (ref.null none)
     (i64.const 9814)
    )
    (f32.const -nan:0x7fffdd)
    (struct.new_default $0)
    (global.get $global$5)
   )
   (i64.const 34)
  )
  (f32.const -nan:0x7ff119)
  (struct.new_default $0)
  (global.get $global$5)
 ))
 (global $global$7 (ref null $1) (ref.func $0))
 (global $global$8 f64 (f64.const 4294961774))
 (global $global$9 i32 (i32.const -3974281))
 (global $global$10 f64 (f64.const -18446744073709551615))
 (global $global$11 (ref null $2) (ref.func $1))
 (global $global$12 (mut (ref null $1)) (global.get $global$7))
 (global $global$13 i32 (i32.const 3))
 (global $global$14 (mut i32) (i32.const 24))
 (memory $0 16 16 shared)
 (data $0 "\d2`[\e8\18V}\9c\19&4#")
 (table $0 i64 9 funcref)
 (table $1 8 8 exnref)
 (elem $0 (table $0) (i64.const 0) func $4 $4 $4 $8 $9)
 (elem declare func $0 $1 $2 $5 $fimport$2 $fimport$3 $fimport$7)
 (tag $tag$0 (type $9) (param i32))
 (tag $tag$1 (type $17) (param arrayref))
 (tag $tag$2 (type $8))
 (export "global$" (global $global$0))
 (export "global$_1" (global $global$1))
 (export "global$_3" (global $global$5))
 (export "global$_5" (global $global$7))
 (export "tag$" (tag $tag$0))
 (export "tag$_1" (tag $tag$1))
 (export "ref_func_target_invoker" (func $3))
 (export "func_15" (func $6))
 (export "func_15_invoker" (func $7))
 (export "func_18" (func $9))
 (export "func_19" (func $10))
 (export "func_20_invoker" (func $12))
 (export "func_22" (func $13))
 (export "func_22_invoker" (func $14))
 (export "func_25_invoker" (func $17))
 (export "func_27" (func $18))
 (func $0 (type $1) (param $0 (ref null $0)) (param $1 f64) (param $2 (ref null $0)) (result (ref $1) i32 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $2) (param $0 eqref) (param $1 f64) (param $2 eqref) (result (ref $2) i32 nullref)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $5) (param $0 f64)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $3 (type $8)
  (local $0 i32)
  (local $1 i32)
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
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i64)
  (local $21 i64)
  (local $22 v128)
  (local $23 f64)
  (local $24 f64)
  (local $25 f32)
  (local $26 arrayref)
  (local $27 arrayref)
  (local $28 arrayref)
  (local $29 arrayref)
  (local $30 arrayref)
  (local $31 arrayref)
  (local $32 arrayref)
  (local $33 arrayref)
  (local $34 arrayref)
  (local $35 arrayref)
  (local $36 (ref string))
  (local $37 (ref string))
  (local $38 (ref string))
  (local $39 (ref string))
  (local $40 (ref string))
  (local $41 (ref $7))
  (local $42 (ref $7))
  (local $43 (ref $7))
  (local $44 (ref $7))
  (local $45 (ref $0))
  (local $46 (ref $0))
  (local $47 (ref null $0))
  (local $48 (ref i31))
  (local $49 (ref array))
  (local $50 structref)
  (local $scratch (tuple (ref $1) i32 (ref null $0)))
  (local $scratch_52 i32)
  (local $scratch_53 (ref $1))
  (local $scratch_54 f32)
  (local $scratch_55 (ref $0))
  (local $scratch_56 nullref)
  (local $scratch_57 i64)
  (local $scratch_58 i32)
  (local $scratch_59 i32)
  (local $scratch_60 (ref i31))
  (local $scratch_61 (tuple (ref $1) i32 (ref null $0)))
  (local $scratch_62 i32)
  (local $scratch_63 (ref $1))
  (local $scratch_64 (tuple (ref (exact $5)) f64 f32 v128 i64))
  (local $scratch_65 v128)
  (local $scratch_66 f32)
  (local $scratch_67 f64)
  (local $scratch_68 (ref (exact $5)))
  (local $scratch_69 i64)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (local.set $38
   (string.const "\ed\bd\88958\e2\82\ac")
  )
  (local.set $45
   (struct.new $0
    (global.get $global$6)
    (f32.const -nan:0x7fff85)
    (struct.new_default $0)
    (i64.const 9)
   )
  )
  (drop
   (block (result (ref $1))
    (local.set $scratch_53
     (tuple.extract 3 0
      (local.tee $scratch
       (call $0
        (ref.null none)
        (f64.const -82)
        (struct.new $0
         (struct.new $0
          (if (result (ref null $0))
           (i32.eqz
            (i32.const -32475)
           )
           (then
            (call_ref $13
             (try $__t_14 (result f32) (do (try (result f32) (do 
               (f32.const 137438953472)
              ) (delegate $__t_14))) (catch $tag$0
               (local.set $0 (call $__popsink_0 (pop i32)))
               (f32.const 65459)
              ) (catch_all
               (try_table (result f32)
                (f32.const -51)
               )
              ))
             (ref.func $fimport$3)
            )
            (global.get $global$6)
           )
           (else
            (global.get $global$6)
           )
          )
          (f32.const -nan:0x7fffd6)
          (try_table (result (ref (exact $0)))
           (struct.new $0
            (struct.new $0
             (struct.new_default $0)
             (f32.const -nan:0x7fd440)
             (struct.new $0
              (struct.new $0
               (struct.new $0
                (struct.new $0
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (f32.const -nan:0x7f860f)
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (global.get $global$5)
                )
                (f32.const -11)
                (struct.new $0
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (f32.const -nan:0x7fa55c)
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (i64.const 268435456)
                )
                (i64.const -175738374086)
               )
               (f32.const -nan:0x7fff98)
               (struct.new_default $0)
               (i64.const -368808833)
              )
              (f32.const -nan:0x7e6105)
              (struct.new_default $0)
              (global.get $global$5)
             )
             (i64.const -4398046511105)
            )
            (f32.const -nan:0x7f874d)
            (struct.new_default $0)
            (global.get $global$5)
           )
          )
          (i64.const -51)
         )
         (f32.const 127)
         (struct.new_default $0)
         (try $__t_13 (result i64) (do
           (i64.const 288230376151711745)
          ) (catch $tag$1
           (drop (extern.convert_any (pop arrayref)))
           (local.set $36
            (string.const "\f0\90\8d\88\f0\90\8d\88")
           )
           (i64.atomic.load acqrel offset=2
            (i32.and
             (if (result i32)
              (i32.lt_u
               (i32.add
                (local.tee $1
                 (if (result i32)
                  (i32.const -102)
                  (then
                   (block
                    (block
                     (return)
                    )
                    (unreachable)
                   )
                   (unreachable)
                  )
                  (else
                   (nop)
                   (global.get $global$13)
                  )
                 )
                )
                (local.tee $2
                 (string.measure_wtf16
                  (local.get $36)
                 )
                )
               )
               (array.len
                (local.tee $41
                 (if (result (ref (exact $7)))
                  (global.get $global$13)
                  (then
                   (throw_ref
                    (block $block (result (ref exn))
                     (try_table (catch_all_ref $block)
                      (throw $tag$2)
                     )
                     (unreachable)
                    )
                   )
                  )
                  (else
                   (call $fimport$0
                    (i32.const 0)
                   )
                   (array.new_default $7
                    (i32.and
                     (i32.const 50)
                     (i32.const 1023)
                    )
                   )
                  )
                 )
                )
               )
              )
              (then
               (string.encode_wtf16_array
                (local.get $36)
                (local.get $41)
                (local.get $1)
               )
              )
              (else
               (i32.const 1)
              )
             )
             (i32.const 15)
            )
           )
          ) (catch $tag$0
(local.set $3 (i32.load8_u (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_13)))
(global.get $global$5)) (catch_all (if (global.get $__rt) (then (rethrow $__t_13)))
(i64.const -43)))
        )
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_52
       (tuple.extract 3 1
        (local.get $scratch)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch)
       )
      )
      (local.get $scratch_52)
     )
    )
    (local.get $scratch_53)
   )
  )
  (drop
   (block (result (ref $1))
    (local.set $scratch_63
     (tuple.extract 3 0
      (local.tee $scratch_61
       (call $0
        (struct.new_default $0)
        (f64.const -nan:0xffffffff87a5e)
        (struct.new $0
         (block $block1 (result (ref $0))
          (drop
           (i32.and
            (i32.const 536870911)
            (i32.const 15)
           )
          )
          (drop
           (f32.const -nan:0x7fffff)
          )
          (block
           (nop)
           (drop
            (f32.load offset=22
             (i32.and
              (i64.lt_s
               (global.get $global$5)
               (if (result i64)
                (if (result i32)
                 (i32.eqz
                  (select
                   (i32.const -27065)
                   (i32.const -2147483647)
                   (i32.const -23216)
                  )
                 )
                 (then
                  (nop)
                  (local.get $4)
                 )
                 (else
                  (loop
                   (if
                    (i32.eqz
                     (global.get $global$14)
                    )
                    (then
                     (global.set $global$14
                      (i32.const 24)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$14
                    (i32.sub
                     (global.get $global$14)
                     (i32.const 1)
                    )
                   )
                   (nop)
                  )
                  (return)
                 )
                )
                (then
                 (drop
                  (br_on_cast_fail $block1 (ref none) (ref none)
                   (ref.cast (ref none)
                    (br_if $block1
                     (ref.as_non_null
                      (ref.null none)
                     )
                     (i32.const 134217729)
                    )
                   )
                  )
                 )
                 (local.tee $20
                  (global.get $global$5)
                 )
                )
                (else
                 (struct.get $0 3
                  (local.tee $45
                   (ref.as_non_null
                    (ref.null none)
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
           (block
            (block $block2
             (if
              (i32.eqz
               (i32.const -2147483648)
              )
              (then
               (try $__t_12  (do (try  (do 
                 (nop)
                ) (delegate $__t_12))) (catch $tag$0
(throw $tag$0 (pop i32))
(if (global.get $__rt) (then (rethrow $__t_12)))
(nop)) (catch_all (if (global.get $__rt) (then (rethrow $__t_12)))
(nop)))
              )
              (else
               (nop)
               (nop)
              )
             )
             (loop
              (if
               (i32.eqz
                (global.get $global$14)
               )
               (then
                (global.set $global$14
                 (i32.const 24)
                )
                (unreachable)
               )
              )
              (global.set $global$14
               (i32.sub
                (global.get $global$14)
                (i32.const 1)
               )
              )
              (block
               (nop)
               (drop
                (br_on_null $block2
                 (local.get $45)
                )
               )
              )
             )
            )
            (return)
           )
           (unreachable)
          )
          (local.set $45
           (local.set $45
            (unreachable)
           )
          )
         )
         (f32.demote_f64
          (try $__t_11 (result f64) (do
            (nop)
            (f64.const -8796093022207.796)
           ) (catch $tag$1
(local.set $27 (local.tee $27 (pop arrayref)))
(if (global.get $__rt) (then (rethrow $__t_11)))
(try $__t_10 (result f64) (do (try (result f64) (do 
              (select
               (loop $label2 (result f64)
                (if
                 (i32.eqz
                  (global.get $global$14)
                 )
                 (then
                  (global.set $global$14
                   (i32.const 24)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$14
                 (i32.sub
                  (global.get $global$14)
                  (i32.const 1)
                 )
                )
                (block
                 (loop $label
                  (if
                   (i32.eqz
                    (global.get $global$14)
                   )
                   (then
                    (global.set $global$14
                     (i32.const 24)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$14
                   (i32.sub
                    (global.get $global$14)
                    (i32.const 1)
                   )
                  )
                  (block
                   (table.set $1
                    (i32.const 7)
                    (if (result (ref exn))
                     (i32.eqz
                      (ref.eq
                       (ref.i31
                        (i32.const -2539912)
                       )
                       (ref.null none)
                      )
                     )
                     (then
                      (block $block3 (result (ref exn))
                       (try_table (catch_all_ref $block3)
                        (throw $tag$1
                         (array.new_fixed $6 0)
                        )
                       )
                       (unreachable)
                      )
                     )
                     (else
                      (if
                       (i32.eqz
                        (i32.const -3071)
                       )
                       (then
                        (local.set $45
                         (local.get $45)
                        )
                       )
                      )
                      (block $block4 (result (ref exn))
                       (try_table (catch_all_ref $block4)
                        (throw $tag$1
                         (array.new_fixed $6 0)
                        )
                       )
                       (unreachable)
                      )
                     )
                    )
                   )
                   (nop)
                  )
                  (br_if $label
                   (i32.const -7328156)
                  )
                  (loop $label1
                   (if
                    (i32.eqz
                     (global.get $global$14)
                    )
                    (then
                     (global.set $global$14
                      (i32.const 24)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$14
                    (i32.sub
                     (global.get $global$14)
                     (i32.const 1)
                    )
                   )
                   (block
                    (nop)
                    (nop)
                   )
                   (br_if $label1
                    (i32.eqz
                     (local.get $6)
                    )
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
                (unreachable)
               )
               (f64.const -2305843009213693952)
               (global.get $global$13)
              )
             ) (delegate $__t_10))) (catch $tag$1
(local.set $28 (select (result arrayref) (pop arrayref) (ref.null none) (i32.const 0)))
(if (global.get $__rt) (then (rethrow $__t_10)))
(loop $label3 (result f64)
               (if
                (i32.eqz
                 (global.get $global$14)
                )
                (then
                 (global.set $global$14
                  (i32.const 24)
                 )
                 (unreachable)
                )
               )
               (global.set $global$14
                (i32.sub
                 (global.get $global$14)
                 (i32.const 1)
                )
               )
               (block
                (if
                 (i32.eqz
                  (i32.const 249)
                 )
                 (then
                  (if
                   (local.get $4)
                   (then
                    (memory.copy
                     (i32.and
                      (i32.load16_u offset=4
                       (i32.and
                        (i64.le_u
                         (global.get $global$5)
                         (i64x2.extract_lane 0
                          (v128.const i32x4 0x00000000 0xc3e00000 0x00000000 0x43900000)
                         )
                        )
                        (i32.const 15)
                       )
                      )
                      (i32.const 15)
                     )
                     (i32.and
                      (local.get $4)
                      (i32.const 15)
                     )
                     (local.tee $4
                      (try $__t_9 (result i32) (do (try (result i32) (do 
                        (local.get $4)
                       ) (delegate $__t_9))) (catch $tag$0
(local.set $9 (i32.xor (pop i32) (i32.const 2)))
(if (global.get $__rt) (then (rethrow $__t_9)))
(i32.const 24658)) (catch_all
                        (local.get $4)
                       ))
                     )
                    )
                    (drop
                     (block (result i32)
                      (local.set $scratch_58
                       (local.get $4)
                      )
                      (drop
                       (block (result i64)
                        (local.set $scratch_57
                         (i64.const -9223372036854775808)
                        )
                        (drop
                         (block (result nullref)
                          (local.set $scratch_56
                           (ref.null none)
                          )
                          (local.set $46
                           (block (result (ref $0))
                            (local.set $scratch_55
                             (loop (result (ref $0))
                              (if
                               (i32.eqz
                                (global.get $global$14)
                               )
                               (then
                                (global.set $global$14
                                 (i32.const 24)
                                )
                                (unreachable)
                               )
                              )
                              (global.set $global$14
                               (i32.sub
                                (global.get $global$14)
                                (i32.const 1)
                               )
                              )
                              (local.get $45)
                             )
                            )
                            (drop
                             (block (result f32)
                              (local.set $scratch_54
                               (f32.sub
                                (f32.add
                                 (f32.const 9223372036854775808)
                                 (f32.const -85)
                                )
                                (f32.const -107)
                               )
                              )
                              (drop
                               (ref.as_non_null
                                (ref.null nofunc)
                               )
                              )
                              (local.get $scratch_54)
                             )
                            )
                            (local.get $scratch_55)
                           )
                          )
                          (local.get $scratch_56)
                         )
                        )
                        (local.get $scratch_57)
                       )
                      )
                      (local.get $scratch_58)
                     )
                    )
                    (struct.set $0 3
                     (local.get $46)
                     (block $block5 (result i64)
                      (atomic.fence)
                      (br_if $block5
                       (i64.const -29572)
                       (stringview_wtf16.get_codeunit
                        (string.const "\e2\82\ac\f0\90\8d\88")
                        (local.get $4)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (i64.store8 offset=4
                 (i32.and
                  (local.get $4)
                  (i32.const 15)
                 )
                 (local.get $20)
                )
               )
               (br_if $label3
                (ref.is_null
                 (ref.func $1)
                )
               )
               (f64.load offset=4
                (i32.and
                 (global.get $global$13)
                 (i32.const 15)
                )
               )
              )))) (catch $tag$0
            (local.set $10 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
            (f64.const 4294967211)
           ) (catch_all
            (f64.convert_i32_s
             (i32.const -256)
            )
           ))
         )
         (if (result (ref $0))
          (loop $label4 (result i32)
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (try $__t_8 (result i32) (do (try (result i32) (do 
             (local.tee $4
              (ref.test (ref string)
               (if (result (ref string))
                (i32.eqz
                 (ref.is_null
                  (ref.cast (ref none)
                   (ref.null none)
                  )
                 )
                )
                (then
                 (string.const "")
                )
                (else
                 (string.const "\f0\90\8d\88\ed\bd\88\f0\90\8d\88")
                )
               )
              )
             )
            ) (delegate $__t_8))) (catch $tag$1
             (local.set $30 (call_ref $__sinkT_1 (pop arrayref) (ref.func $__popsink_1)))
             (drop
              (br_on_null $label4
               (array.new_fixed $6 0)
              )
             )
             (drop
              (block (result (ref i31))
               (local.set $scratch_60
                (ref.i31
                 (i32.const -44)
                )
               )
               (local.set $19
                (block (result i32)
                 (local.set $scratch_59
                  (i32.const -116)
                 )
                 (drop
                  (struct.new_default $0)
                 )
                 (local.get $scratch_59)
                )
               )
               (local.get $scratch_60)
              )
             )
             (local.get $19)
            ) (catch_all
             (i16x8.extract_lane_s 2
              (try_table (result v128) (catch_all $label4)
               (loop (result v128)
                (if
                 (i32.eqz
                  (global.get $global$14)
                 )
                 (then
                  (global.set $global$14
                   (i32.const 24)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$14
                 (i32.sub
                  (global.get $global$14)
                  (i32.const 1)
                 )
                )
                (block (result v128)
                 (nop)
                 (v128.const i32x4 0xff005800 0xdc01eee1 0x02c02a00 0x0001c038)
                )
               )
              )
             )
            ))
          )
          (then
           (block $block6
            (table.set $1
             (i32.const 3)
             (try_table (result (ref exn)) (catch_all $block6)
              (block $block7 (result (ref exn))
               (try_table (catch_all_ref $block7)
                (throw $tag$1
                 (array.new_fixed $6 0)
                )
               )
               (unreachable)
              )
             )
            )
            (loop $label5
             (if
              (i32.eqz
               (global.get $global$14)
              )
              (then
               (global.set $global$14
                (i32.const 24)
               )
               (unreachable)
              )
             )
             (global.set $global$14
              (i32.sub
               (global.get $global$14)
               (i32.const 1)
              )
             )
             (block
              (br_if $label5
               (i8x16.extract_lane_u 5
                (v128.const i32x4 0x0001ffd5 0x40453e03 0xffffffea 0xb44e8170)
               )
              )
              (nop)
             )
             (br_if $label5
              (local.get $4)
             )
             (block
              (loop
               (if
                (i32.eqz
                 (global.get $global$14)
                )
                (then
                 (global.set $global$14
                  (i32.const 24)
                 )
                 (unreachable)
                )
               )
               (global.set $global$14
                (i32.sub
                 (global.get $global$14)
                 (i32.const 1)
                )
               )
               (try $__t_7  (do
                 (struct.set $0 0
                  (local.get $45)
                  (local.tee $47
                   (local.get $45)
                  )
                 )
                ) (catch $tag$0
                 (drop (pop i32))
                 (br_if $block6
                  (i32.eqz
                   (local.tee $4
                    (i32.const 255)
                   )
                  )
                 )
                ) (catch $tag$1
                 (local.set $31 (call_ref $__sinkT_1 (pop arrayref) (ref.func $__popsink_1)))
                 (nop)
                ))
              )
              (br $block6)
             )
             (unreachable)
            )
            (local.set $48
             (unreachable)
            )
           )
           (return)
          )
          (else
           (nop)
           (local.get $45)
          )
         )
         (local.get $20)
        )
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_62
       (tuple.extract 3 1
        (local.get $scratch_61)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch_61)
       )
      )
      (local.get $scratch_62)
     )
    )
    (local.get $scratch_63)
   )
  )
  (drop
   (struct.new_default $0)
  )
  (drop
   (f64.const -549755813888)
  )
  (drop
   (block $block8 (result (ref (exact $0)))
    (block
     (f64.store offset=3 align=1
      (i32.and
       (global.get $global$13)
       (i32.const 15)
      )
      (block (result f64)
       (drop
        (block (result (ref (exact $5)))
         (local.set $scratch_68
          (tuple.extract 5 0
           (local.tee $scratch_64
            (block (type $28) (result (ref (exact $5)) f64 f32 v128 i64)
             (call_ref $12
              (local.tee $20
               (local.get $20)
              )
              (ref.func $fimport$2)
             )
             (tuple.make 5
              (ref.func $2)
              (f64.const 2119)
              (f32.const -1073741824)
              (v128.const i32x4 0xc7fffffc 0xc1d00000 0xdf000000 0x43610000)
              (i64.const 268435456)
             )
            )
           )
          )
         )
         (local.set $24
          (block (result f64)
           (local.set $scratch_67
            (tuple.extract 5 1
             (local.get $scratch_64)
            )
           )
           (drop
            (block (result f32)
             (local.set $scratch_66
              (tuple.extract 5 2
               (local.get $scratch_64)
              )
             )
             (drop
              (block (result v128)
               (local.set $scratch_65
                (tuple.extract 5 3
                 (local.get $scratch_64)
                )
               )
               (drop
                (tuple.extract 5 4
                 (local.get $scratch_64)
                )
               )
               (local.get $scratch_65)
              )
             )
             (local.get $scratch_66)
            )
           )
           (local.get $scratch_67)
          )
         )
         (local.get $scratch_68)
        )
       )
       (f64.sub
        (local.get $24)
        (f64.const -1797693134862315708145274e284)
       )
      )
     )
     (call $fimport$7
      (ref.func $fimport$7)
     )
    )
    (loop $label6 (result (ref (exact $0)))
     (if
      (i32.eqz
       (global.get $global$14)
      )
      (then
       (global.set $global$14
        (i32.const 24)
       )
       (unreachable)
      )
     )
     (global.set $global$14
      (i32.sub
       (global.get $global$14)
       (i32.const 1)
      )
     )
     (block
      (br_on_non_null $block8
       (struct.new_default $0)
      )
      (drop
       (block (result i64)
        (local.set $scratch_69
         (i64.const -4097)
        )
        (drop
         (i64.const -32767)
        )
        (local.get $scratch_69)
       )
      )
      (nop)
     )
     (local.set $40
      (string.const "\f0\90\8d\88\f0\90\8d\88")
     )
     (br_if $label6
      (i32.eqz
       (local.tee $4
        (if (result i32)
         (i32.lt_u
          (i32.add
           (local.tee $16
            (ref.is_null
             (local.get $45)
            )
           )
           (local.tee $17
            (string.measure_wtf16
             (local.get $40)
            )
           )
          )
          (array.len
           (local.tee $44
            (array.new_default $7
             (i32.and
              (i32.const 62)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (string.encode_wtf16_array
           (local.get $40)
           (local.get $44)
           (local.get $16)
          )
         )
         (else
          (global.get $global$13)
         )
        )
       )
      )
     )
     (try_table (result (ref (exact $0))) (catch_all $label6)
      (struct.new $0
       (local.get $45)
       (f32.const -2147483648)
       (struct.new_default $0)
       (global.get $global$5)
      )
     )
    )
   )
  )
  (drop
   (f32.convert_i64_s
    (i64.atomic.rmw8.cmpxchg_u offset=22
     (i32.and
      (ref.test (ref array)
       (local.tee $49
        (if (result (ref array))
         (i32.eqz
          (stringview_wtf16.get_codeunit
           (local.get $38)
           (block (result i32)
            (local.set $19
             (loop (result i32)
              (if
               (i32.eqz
                (global.get $global$14)
               )
               (then
                (global.set $global$14
                 (i32.const 24)
                )
                (unreachable)
               )
              )
              (global.set $global$14
               (i32.sub
                (global.get $global$14)
                (i32.const 1)
               )
              )
              (string.compare
               (string.const "\f0\90\8d\88")
               (string.const "\e2\82\ac\e2\82\ac942")
              )
             )
            )
            (local.get $19)
           )
          )
         )
         (then
          (global.get $global$1)
         )
         (else
          (array.new_fixed $6 0)
         )
        )
       )
      )
      (i32.const 15)
     )
     (i64.load16_u offset=22
      (i32.and
       (local.get $4)
       (i32.const 15)
      )
     )
     (i64.add
      (i64.extend_i32_s
       (try_table (result i32)
        (i32.trunc_f64_u
         (select
          (f64.const -nan:0xfffff81167d60)
          (if (result f64)
           (i32.eqz
            (i32.or
             (i32.const 16384)
             (local.get $4)
            )
           )
           (then
            (block
             (nop)
             (nop)
            )
            (return)
           )
           (else
            (local.get $23)
           )
          )
          (ref.eq
           (ref.i31
            (i32.const 1)
           )
           (local.get $49)
          )
         )
        )
       )
      )
      (try $__t_6 (result i64) (do
        (try_table (result i64)
         (i64.const 127)
        )
       ) (catch $tag$1
(local.set $34 (local.tee $34 (pop arrayref)))
(if (global.get $__rt) (then (rethrow $__t_6)))
(loop $label8 (result i64)
         (if
          (i32.eqz
           (global.get $global$14)
          )
          (then
           (global.set $global$14
            (i32.const 24)
           )
           (unreachable)
          )
         )
         (global.set $global$14
          (i32.sub
           (global.get $global$14)
           (i32.const 1)
          )
         )
         (block
          (memory.copy
           (i32.and
            (if (result i32)
             (i32.eqz
              (stringview_wtf16.get_codeunit
               (string.const "\e2\82\ac")
               (local.get $4)
              )
             )
             (then
              (block $block9 (result i32)
               (loop $label7
                (if
                 (i32.eqz
                  (global.get $global$14)
                 )
                 (then
                  (global.set $global$14
                   (i32.const 24)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$14
                 (i32.sub
                  (global.get $global$14)
                  (i32.const 1)
                 )
                )
                (block
                 (nop)
                 (if
                  (i32.eqz
                   (br_if $block9
                    (local.get $4)
                    (i32.eqz
                     (local.get $4)
                    )
                   )
                  )
                  (then
                   (nop)
                  )
                 )
                )
                (br_if $label7
                 (ref.eq
                  (local.tee $49
                   (array.new_fixed $6 0)
                  )
                  (local.get $50)
                 )
                )
                (br_if $label8
                 (if (result i32)
                  (i32.eqz
                   (local.get $4)
                  )
                  (then
                   (local.get $4)
                  )
                  (else
                   (br_if $block9
                    (i32.const -97)
                    (local.get $4)
                   )
                  )
                 )
                )
               )
               (br $label8)
              )
             )
             (else
              (block $block10 (result i32)
               (f64.store offset=22
                (i32.and
                 (try_table (result i32) (catch $tag$0 $block10) (catch_all $label8)
                  (global.get $global$13)
                 )
                 (i32.const 15)
                )
                (local.get $23)
               )
               (br $label8)
              )
             )
            )
            (i32.const 15)
           )
           (i32.and
            (i32.const -31)
            (i32.const 15)
           )
           (global.get $global$13)
          )
          (try_table (catch_all $label8)
           (atomic.fence acqrel)
          )
         )
         (drop
          (local.get $45)
         )
         (loop
          (if
           (i32.eqz
            (global.get $global$14)
           )
           (then
            (global.set $global$14
             (i32.const 24)
            )
            (unreachable)
           )
          )
          (global.set $global$14
           (i32.sub
            (global.get $global$14)
            (i32.const 1)
           )
          )
          (block
           (if
            (local.tee $4
             (ref.eq
              (struct.new_default $14)
              (local.get $49)
             )
            )
            (then
             (atomic.fence acqrel)
            )
           )
           (br $label8)
          )
          (unreachable)
         )
         (unreachable)
        )))
     )
    )
   )
  )
  (drop
   (local.get $45)
  )
  (drop
   (try $__t_5 (result f32) (do
     (f32.const 4503599627370496)
    ) (catch $tag$0
(local.set $18 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $18))))
(if (global.get $__rt) (then (rethrow $__t_5)))
(local.get $25)) (catch $tag$1
     (drop (extern.convert_any (pop arrayref)))
     (local.tee $25
      (local.get $25)
     )
    ))
  )
  (block
   (i32.store16 offset=22
    (i32.and
     (local.get $4)
     (i32.const 15)
    )
    (string.measure_wtf16
     (local.get $38)
    )
   )
   (return)
  )
  (unreachable)
 )
 (func $4 (type $23) (param $0 (ref $1)) (param $1 (ref $0)) (result i64)
  (local $2 (ref $4))
  (local $3 (ref $0))
  (local $4 (ref $1))
  (local $5 externref)
  (local $6 (ref null $1))
  (local $7 (ref null $1))
  (local $8 (ref null $0))
  (local $9 (ref array))
  (local $10 eqref)
  (local $11 (ref null $4))
  (local $12 i31ref)
  (local $13 stringref)
  (local $14 f32)
  (local $15 f32)
  (local $16 f32)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 f64)
  (local $22 i32)
  (local $23 i32)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block (result i64)
   (loop (result i64)
    (if
     (i32.eqz
      (global.get $global$14)
     )
     (then
      (global.set $global$14
       (i32.const 24)
      )
      (unreachable)
     )
    )
    (global.set $global$14
     (i32.sub
      (global.get $global$14)
      (i32.const 1)
     )
    )
    (block (result i64)
     (global.get $global$5)
    )
   )
  )
 )
 (func $5 (type $15) (param $0 (ref $0)) (param $1 externref) (param $2 (ref $1))
  (local $3 (ref $5))
  (local $4 (ref eq))
  (local $5 arrayref)
  (local $6 arrayref)
  (local $7 (ref $2))
  (local $8 (ref $2))
  (local $9 (ref $2))
  (local $10 (ref $2))
  (local $11 (ref $2))
  (local $12 (ref string))
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i64)
  (local $20 i64)
  (local $scratch i64)
  (local $scratch_22 i64)
  (local $scratch_23 i64)
  (local $scratch_24 (tuple i64 (ref $2)))
  (local $scratch_25 i64)
  (local $scratch_26 (tuple i64 (ref $2)))
  (local $scratch_27 i64)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (local.set $8
   (ref.func $1)
  )
  (local.set $19
   (block (result i64)
    (local.set $scratch
     (i64.const -262144)
    )
    (local.set $7
     (ref.func $1)
    )
    (local.get $scratch)
   )
  )
  (local.set $3
   (ref.func $2)
  )
  (block $block
   (drop
    (block (result i64)
     (local.set $scratch_27
      (tuple.extract 2 0
       (local.tee $scratch_26
        (if (type $3) (result i64 (ref $2))
         (i32.const -125)
         (then
          (loop $label
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (block
            (drop
             (br_on_null $label
              (local.tee $3
               (ref.func $2)
              )
             )
            )
            (br $label)
           )
           (unreachable)
          )
          (br_if $block
           (i32.eqz
            (unreachable)
           )
          )
          (tuple.make 2
           (i64.const -119)
           (ref.func $1)
          )
         )
         (else
          (nop)
          (try (type $3) (result i64 (ref $2))
           (do
            (try (type $3) (result i64 (ref $2))
             (do
              (tuple.make 2
               (i64.const -2251799813685248)
               (ref.func $1)
              )
             )
             (catch $tag$1
              (if (ref.is_null (pop arrayref)) (then (nop)) (else (unreachable)))
              (tuple.make 2
               (local.get $19)
               (local.get $7)
              )
             )
             (catch $tag$0
              (local.set $14 (i32.load8_u (pop i32)))
              (block (type $29) (result i64 (ref (exact $2)))
               (call $fimport$8
                (string.const "")
               )
               (drop
                (br_on_null $block
                 (local.tee $8
                  (block (result (ref $2))
                   (try $__t_4  (do
                     (loop $label1
                      (if
                       (i32.eqz
                        (global.get $global$14)
                       )
                       (then
                        (global.set $global$14
                         (i32.const 24)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$14
                       (i32.sub
                        (global.get $global$14)
                        (i32.const 1)
                       )
                      )
                      (block
                       (br_if $label1
                        (local.get $13)
                       )
                      )
                     )
                    ) (catch $tag$0
(local.set $15 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_4)))
(nop)))
                   (drop
                    (br_on_null $block
                     (local.get $3)
                    )
                   )
                   (local.tee $9
                    (local.tee $10
                     (local.tee $11
                      (ref.as_non_null
                       (ref.null nofunc)
                      )
                     )
                    )
                   )
                  )
                 )
                )
               )
               (tuple.make 2
                (i64.const -134217728)
                (ref.func $1)
               )
              )
             )
            )
           )
           (catch $tag$0
            (local.set $16 (call $__popsink_0 (pop i32)))
            (tuple.make 2
             (local.tee $19
              (block (result i64)
               (local.set $scratch_22
                (local.get $19)
               )
               (local.set $7
                (local.get $7)
               )
               (local.get $scratch_22)
              )
             )
             (local.get $7)
            )
           )
           (catch_all
            (if (type $3) (result i64 (ref $2))
             (local.tee $13
              (memory.atomic.notify offset=22
               (i32.and
                (i32.const 524288)
                (i32.const 15)
               )
               (string.measure_wtf16
                (loop $label2 (result (ref string))
                 (if
                  (i32.eqz
                   (global.get $global$14)
                  )
                  (then
                   (global.set $global$14
                    (i32.const 24)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$14
                  (i32.sub
                   (global.get $global$14)
                   (i32.const 1)
                  )
                 )
                 (block
                  (nop)
                  (local.set $13
                   (local.get $13)
                  )
                 )
                 (br_if $label2
                  (ref.test (ref $2)
                   (local.tee $10
                    (select (result (ref $2))
                     (ref.cast (ref nofunc)
                      (ref.null nofunc)
                     )
                     (local.get $8)
                     (stringview_wtf16.get_codeunit
                      (try_table (result (ref string)) (catch_all $block)
                       (ref.cast (ref string)
                        (string.const "\c2\a3\c2\a3114")
                       )
                      )
                      (local.get $13)
                     )
                    )
                   )
                  )
                 )
                 (string.const "\c2\a3\f0\90\8d\88")
                )
               )
              )
             )
             (then
              (try (type $3) (result i64 (ref $2))
               (do
                (try_table (type $3) (result i64 (ref $2)) (catch_all $block)
                 (tuple.make 2
                  (local.tee $19
                   (block (result i64)
                    (local.set $scratch_23
                     (i64.const 1)
                    )
                    (local.set $7
                     (ref.func $1)
                    )
                    (local.get $scratch_23)
                   )
                  )
                  (local.get $7)
                 )
                )
               )
               (catch $tag$0
                (local.set $17 (i32.mul (pop i32) (i32.const -1)))
                (loop (type $3) (result i64 (ref $2))
                 (if
                  (i32.eqz
                   (global.get $global$14)
                  )
                  (then
                   (global.set $global$14
                    (i32.const 24)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$14
                  (i32.sub
                   (global.get $global$14)
                   (i32.const 1)
                  )
                 )
                 (tuple.make 2
                  (i64.const -58)
                  (block (result (ref $2))
                   (drop
                    (string.const "\e2\82\ac")
                   )
                   (local.get $8)
                  )
                 )
                )
               )
               (catch $tag$1
                (local.set $6 (pop arrayref))
                (tuple.make 2
                 (local.get $19)
                 (local.get $7)
                )
               )
              )
             )
             (else
              (tuple.make 2
               (local.tee $19
                (block (result i64)
                 (local.set $scratch_25
                  (tuple.extract 2 0
                   (local.tee $scratch_24
                    (try (type $3) (result i64 (ref $2))
                     (do
                      (tuple.make 2
                       (i64.const 16384)
                       (ref.func $1)
                      )
                     )
                     (catch $tag$0
                      (local.set $18 (select (pop i32) (local.get $18) (i32.const 0)))
                      (tuple.make 2
                       (local.get $19)
                       (local.get $7)
                      )
                     )
                     (catch_all
                      (tuple.make 2
                       (local.get $20)
                       (ref.func $1)
                      )
                     )
                    )
                   )
                  )
                 )
                 (local.set $7
                  (tuple.extract 2 1
                   (local.get $scratch_24)
                  )
                 )
                 (local.get $scratch_25)
                )
               )
               (local.get $7)
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
      (tuple.extract 2 1
       (local.get $scratch_26)
      )
     )
     (local.get $scratch_27)
    )
   )
   (nop)
  )
 )
 (func $6 (type $24) (result (ref struct))
  (local $0 (ref null $2))
  (local $1 (ref null $2))
  (local $2 externref)
  (local $3 arrayref)
  (local $4 (ref null $1))
  (local $5 (ref $1))
  (local $6 anyref)
  (local $7 stringref)
  (local $8 (ref $0))
  (local $9 (ref null $4))
  (local $10 eqref)
  (local $11 f64)
  (local $12 f64)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i64)
  (local $17 f32)
  (local $18 f32)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (struct.new_default $14)
   )
  )
  (unreachable)
 )
 (func $7 (type $8)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
  (drop
   (call $6)
  )
  (drop
   (call $6)
  )
  (drop
   (call $6)
  )
  (drop
   (call $6)
  )
 )
 (func $8 (type $1) (param $0 (ref null $0)) (param $1 f64) (param $2 (ref null $0)) (result (ref $1) i32 (ref null $0))
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 i64)
  (local $7 (ref eq))
  (local $8 eqref)
  (local $9 (ref array))
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (ref.func $0)
   (i32.const 102)
   (struct.new_default $0)
  )
 )
 (func $9 (type $25) (result i32)
  (local $0 i32)
  (local $1 i64)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (nop)
   (return
    (local.get $0)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $10 (type $26) (param $0 structref) (param $1 f32) (param $2 i64) (result (ref null $4))
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f32)
  (local $10 anyref)
  (local $11 (ref eq))
  (local $12 (ref struct))
  (local $13 (ref null $2))
  (local $14 (ref null $4))
  (local $15 (ref null $4))
  (local $16 (ref null $1))
  (local $17 i31ref)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $5)))
   (call $fimport$5
    (v128.const i32x4 0xffd9731f 0xffffffff 0x00000000 0xc0480000)
   )
   (ref.func $2)
  )
 )
 (func $11 (type $27) (result i64)
  (local $0 arrayref)
  (local $1 arrayref)
  (local $2 eqref)
  (local $3 (ref array))
  (local $4 i31ref)
  (local $5 (ref null $5))
  (local $6 (ref null $1))
  (local $7 f32)
  (local $8 f32)
  (local $9 i64)
  (local $10 i32)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$1
    (block (result i32)
     (if
      (i32.eqz
       (local.get $10)
      )
      (then
       (call $fimport$0
        (i32.const -1)
       )
      )
      (else
       (nop)
       (nop)
      )
     )
     (ref.eq
      (ref.i31
       (i32.const 3)
      )
      (ref.cast (ref (exact $6))
       (array.new_fixed $6 0)
      )
     )
    )
   )
   (return
    (global.get $global$5)
   )
  )
  (unreachable)
 )
 (func $12 (type $8)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (drop
   (call $11)
  )
 )
 (func $13 (type $1) (param $0 (ref null $0)) (param $1 f64) (param $2 (ref null $0)) (result (ref $1) i32 (ref null $0))
  (local $3 anyref)
  (local $4 stringref)
  (local $5 (ref null $4))
  (local $6 (ref $0))
  (local $7 (ref array))
  (local $8 (ref array))
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$6
    (select (result (ref array))
     (array.new_fixed $6 0)
     (local.tee $7
      (local.tee $8
       (global.get $global$1)
      )
     )
     (i32.const 126)
    )
   )
   (return
    (tuple.make 3
     (ref.func $0)
     (i32.const 4)
     (struct.new $0
      (struct.new_default $0)
      (f32.const -nan:0x7fff91)
      (struct.new $0
       (local.get $2)
       (f32.const 32767)
       (struct.new $0
        (global.get $global$6)
        (f32.const -2.6444716453552246)
        (struct.new $0
         (struct.new $0
          (local.get $0)
          (f32.const 36028797018963968)
          (struct.new $0
           (struct.new_default $0)
           (f32.const -9223372036854775808)
           (struct.new_default $0)
           (i64.const 17179869185)
          )
          (global.get $global$5)
         )
         (f32.const -89)
         (local.get $2)
         (i64.const 65528)
        )
        (i64.const 65534)
       )
       (global.get $global$5)
      )
      (i64.const 29545)
     )
    )
   )
  )
  (unreachable)
 )
 (func $14 (type $8)
  (local $0 (ref array))
  (local $scratch (tuple (ref $1) i32 (ref null $0)))
  (local $scratch_2 i32)
  (local $scratch_3 (ref $1))
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref $1))
    (local.set $scratch_3
     (tuple.extract 3 0
      (local.tee $scratch
       (call $13
        (struct.new $0
         (global.get $global$6)
         (f32.load offset=22
          (i32.and
           (ref.eq
            (global.get $global$1)
            (ref.null none)
           )
           (i32.const 15)
          )
         )
         (struct.new_default $0)
         (i64.load32_u offset=4 align=2
          (i32.and
           (ref.is_null
            (local.tee $0
             (array.new_fixed $6 0)
            )
           )
           (i32.const 15)
          )
         )
        )
        (f64.const -852818407)
        (struct.new_default $0)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_2
       (tuple.extract 3 1
        (local.get $scratch)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch)
       )
      )
      (local.get $scratch_2)
     )
    )
    (local.get $scratch_3)
   )
  )
 )
 (@binaryen.js.called)
 (func $15 (type $4) (param $0 f64)
  (local $1 f64)
  (local $2 i64)
  (local $3 arrayref)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$1
    (i64.gt_u
     (local.get $2)
     (local.get $2)
    )
   )
   (loop
    (if
     (i32.eqz
      (global.get $global$14)
     )
     (then
      (global.set $global$14
       (i32.const 24)
      )
      (unreachable)
     )
    )
    (global.set $global$14
     (i32.sub
      (global.get $global$14)
      (i32.const 1)
     )
    )
    (block
     (try $__t_3  (do
       (call $fimport$0
        (try $__t_2 (result i32) (do
          (loop $label (result i32)
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (block
            (nop)
           )
           (br_if $label
            (ref.test (ref nofunc)
             (ref.func $1)
            )
           )
           (i32.const 0)
          )
         ) (catch $tag$1
          (local.set $3 (select (result arrayref) (pop arrayref) (ref.null none) (i32.const 0)))
          (ref.test (ref (exact $5))
           (ref.func $2)
          )
         ) (catch_all (if (global.get $__rt) (then (rethrow $__t_2)))
(global.get $global$13)))
       )
      ) (catch_all
       (loop $label1
        (if
         (i32.eqz
          (global.get $global$14)
         )
         (then
          (global.set $global$14
           (i32.const 24)
          )
          (unreachable)
         )
        )
        (global.set $global$14
         (i32.sub
          (global.get $global$14)
          (i32.const 1)
         )
        )
        (block
         (nop)
         (nop)
        )
        (br_if $label1
         (i32.eqz
          (i32.const -88)
         )
        )
        (block
         (call $fimport$6
          (array.new_fixed $6 0)
         )
         (call $fimport$2
          (struct.get $0 3
           (struct.new_default $0)
          )
         )
        )
       )
      ))
     (call $fimport$1
      (string.measure_wtf16
       (string.const "\f0\90\8d\88\e2\82\ac")
      )
     )
    )
   )
  )
 )
 (func $16 (type $4) (param $0 f64)
  (local $1 (ref null $1))
  (local $2 (ref null $2))
  (local $3 (ref $2))
  (local $4 externref)
  (local $5 externref)
  (local $6 (ref null $0))
  (local $7 (ref null $0))
  (local $8 (ref array))
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 (ref $7))
  (local $12 (ref $7))
  (local $13 arrayref)
  (local $14 arrayref)
  (local $15 arrayref)
  (local $16 arrayref)
  (local $17 (ref $0))
  (local $18 (ref $0))
  (local $19 (ref null $5))
  (local $20 (ref $5))
  (local $21 f64)
  (local $22 f32)
  (local $23 f32)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
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
  (local $42 v128)
  (local $43 v128)
  (local $scratch i64)
  (local $scratch_45 i32)
  (local $scratch_46 i32)
  (local $scratch_47 v128)
  (local $scratch_48 (ref nofunc))
  (local $scratch_49 (ref $0))
  (local $scratch_50 (tuple (ref $0) (ref $5) v128 i32 i32))
  (local $scratch_51 i32)
  (local $scratch_52 v128)
  (local $scratch_53 (ref $5))
  (local $scratch_54 (ref $0))
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (local.set $6
   (ref.as_non_null
    (local.get $6)
   )
  )
  (local.set $3
   (ref.func $1)
  )
  (block $block
   (drop
    (br_on_null $block
     (struct.new $0
      (local.get $7)
      (f32.const -nan:0x7fffcd)
      (struct.new_default $0)
      (i64.const 144115188075855872)
     )
    )
   )
   (local.set $10
    (local.tee $9
     (string.const "\ed\a0\80\e2\82\ac\c2\a3")
    )
   )
   (loop $label1
    (if
     (i32.eqz
      (global.get $global$14)
     )
     (then
      (global.set $global$14
       (i32.const 24)
      )
      (unreachable)
     )
    )
    (global.set $global$14
     (i32.sub
      (global.get $global$14)
      (i32.const 1)
     )
    )
    (block
     (nop)
     (loop
      (if
       (i32.eqz
        (global.get $global$14)
       )
       (then
        (global.set $global$14
         (i32.const 24)
        )
        (unreachable)
       )
      )
      (global.set $global$14
       (i32.sub
        (global.get $global$14)
        (i32.const 1)
       )
      )
      (block $block1
       (call_ref $15
        (struct.new_default $0)
        (string.const "\e2\82\ac\ed\a0\80")
        (if (result (ref $2))
         (i32.eqz
          (loop $label (result i32)
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (try_table (result i32) (catch_all $label)
            (try $__t_1 (result i32) (do (try (result i32) (do 
              (i32.const 2)
             ) (delegate $__t_1))) (catch $tag$0
              (local.set $32 (i32.eqz (pop i32)))
              (i32.const -2147483648)
             ) (catch $tag$1
              (local.set $13 (select (result arrayref) (pop arrayref) (ref.null none) (i32.const 7)))
              (i32.const 2)
             ))
           )
          )
         )
         (then
          (ref.func $1)
         )
         (else
          (f64.store offset=4 align=2
           (i32.and
            (if (result i32)
             (global.get $global$13)
             (then
              (br_if $block1
               (local.get $28)
              )
              (br $label1)
             )
             (else
              (nop)
              (i32.load16_s offset=22
               (i32.and
                (i32.const -65536)
                (i32.const 15)
               )
              )
             )
            )
            (i32.const 15)
           )
           (f64.abs
            (local.tee $0
             (local.get $0)
            )
           )
          )
          (try_table (result (ref $2)) (catch_all $block1)
           (local.tee $3
            (loop $label2 (result (ref $2))
             (if
              (i32.eqz
               (global.get $global$14)
              )
              (then
               (global.set $global$14
                (i32.const 24)
               )
               (unreachable)
              )
             )
             (global.set $global$14
              (i32.sub
               (global.get $global$14)
               (i32.const 1)
              )
             )
             (atomic.fence acqrel)
             (br_if $label2
              (local.get $28)
             )
             (local.get $3)
            )
           )
          )
         )
        )
        (ref.func $5)
       )
       (try_table (catch_all $label1)
        (if
         (i32.eqz
          (loop $label3 (result i32)
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (block
            (drop
             (i64.const -2305843009213693952)
            )
            (nop)
           )
           (br_if $label3
            (local.get $31)
           )
           (local.get $28)
          )
         )
         (then
          (call $fimport$2
           (global.get $global$5)
          )
          (call $fimport$1
           (local.get $31)
          )
         )
        )
       )
      )
     )
    )
    (drop
     (local.tee $21
      (if (result f64)
       (i32.eqz
        (i32.const 2147483647)
       )
       (then
        (nop)
        (loop $label4 (result f64)
         (if
          (i32.eqz
           (global.get $global$14)
          )
          (then
           (global.set $global$14
            (i32.const 24)
           )
           (unreachable)
          )
         )
         (global.set $global$14
          (i32.sub
           (global.get $global$14)
           (i32.const 1)
          )
         )
         (drop
          (block (result i64)
           (local.set $scratch
            (i64.const 8192)
           )
           (local.set $41
            (i32.const -134217727)
           )
           (local.get $scratch)
          )
         )
         (if
          (i32.eqz
           (local.get $41)
          )
          (then
           (br_if $label4
            (i32.eqz
             (local.get $31)
            )
           )
           (nop)
          )
          (else
           (if
            (i32.eqz
             (try $__t_0 (result i32) (do (try (result i32) (do 
               (local.get $28)
              ) (delegate $__t_0))) (catch $tag$0
(local.set $33 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $33))))
(if (global.get $__rt) (then (rethrow $__t_0)))
(i32.const -111)) (catch $tag$1
(local.set $14 (call $__popsink_1 (pop arrayref)))
(if (global.get $__rt) (then (rethrow $__t_0)))
(local.tee $31
                (local.get $28)
               )) (catch_all (if (global.get $__rt) (then (rethrow $__t_0)))
(i32.const 32766)))
            )
            (then
             (local.set $2
              (local.get $3)
             )
            )
            (else
             (local.set $6
              (ref.as_non_null
               (local.get $6)
              )
             )
            )
           )
          )
         )
         (br_if $label4
          (i32.load8_u offset=22
           (i32.and
            (local.tee $28
             (local.get $28)
            )
            (i32.const 15)
           )
          )
         )
         (f64x2.extract_lane 0
          (loop $label5 (result v128)
           (if
            (i32.eqz
             (global.get $global$14)
            )
            (then
             (global.set $global$14
              (i32.const 24)
             )
             (unreachable)
            )
           )
           (global.set $global$14
            (i32.sub
             (global.get $global$14)
             (i32.const 1)
            )
           )
           (nop)
           (br_if $label5
            (i32.eqz
             (i32.const 131073)
            )
           )
           (local.set $17
            (block (result (ref $0))
             (local.set $scratch_54
              (tuple.extract 5 0
               (local.tee $scratch_50
                (try (type $11) (result (ref $0) (ref $5) v128 i32 i32)
                 (do
                  (if (type $11) (result (ref $0) (ref $5) v128 i32 i32)
                   (i32.eqz
                    (loop (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$14)
                      )
                      (then
                       (global.set $global$14
                        (i32.const 24)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$14
                      (i32.sub
                       (global.get $global$14)
                       (i32.const 1)
                      )
                     )
                     (loop (result i32)
                      (if
                       (i32.eqz
                        (global.get $global$14)
                       )
                       (then
                        (global.set $global$14
                         (i32.const 24)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$14
                       (i32.sub
                        (global.get $global$14)
                        (i32.const 1)
                       )
                      )
                      (local.set $scratch_45
                       (i32.const -32768)
                      )
                      (drop
                       (i64.const 32767)
                      )
                      (local.get $scratch_45)
                     )
                    )
                   )
                   (then
                    (tuple.make 5
                     (ref.as_non_null
                      (local.get $6)
                     )
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                     (v128.const i32x4 0xf8000000 0x00000200 0x421b3359 0xfffffc70)
                     (i32.const -255)
                     (i32.const -61)
                    )
                   )
                   (else
                    (tuple.make 5
                     (local.tee $18
                      (block (result (ref $0))
                       (local.set $scratch_49
                        (ref.as_non_null
                         (local.get $6)
                        )
                       )
                       (local.set $20
                        (block (result (ref nofunc))
                         (local.set $scratch_48
                          (ref.as_non_null
                           (ref.null nofunc)
                          )
                         )
                         (local.set $43
                          (block (result v128)
                           (local.set $scratch_47
                            (v128.const i32x4 0x43010000 0x5f000000 0xda800000 0x4f800000)
                           )
                           (local.set $36
                            (block (result i32)
                             (local.set $scratch_46
                              (i32.const 1073741823)
                             )
                             (local.set $37
                              (i32.const -62)
                             )
                             (local.get $scratch_46)
                            )
                           )
                           (local.get $scratch_47)
                          )
                         )
                         (local.get $scratch_48)
                        )
                       )
                       (local.get $scratch_49)
                      )
                     )
                     (local.get $20)
                     (local.get $43)
                     (local.get $36)
                     (local.get $37)
                    )
                   )
                  )
                 )
                 (catch $tag$0
                  (local.set $38 (call $__popsink_0 (pop i32)))
                  (tuple.make 5
                   (ref.as_non_null
                    (local.get $6)
                   )
                   (ref.as_non_null
                    (ref.null nofunc)
                   )
                   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00001000)
                   (i32.const -32768)
                   (i32.const 33554432)
                  )
                 )
                 (catch_all
                  (tuple.make 5
                   (ref.as_non_null
                    (local.get $6)
                   )
                   (ref.as_non_null
                    (ref.null nofunc)
                   )
                   (v128.const i32x4 0xffffffa7 0x0000ff8e 0x00008001 0xffffffb5)
                   (i32.const 9984)
                   (i32.const -29660)
                  )
                 )
                )
               )
              )
             )
             (local.set $19
              (block (result (ref $5))
               (local.set $scratch_53
                (tuple.extract 5 1
                 (local.get $scratch_50)
                )
               )
               (local.set $42
                (block (result v128)
                 (local.set $scratch_52
                  (tuple.extract 5 2
                   (local.get $scratch_50)
                  )
                 )
                 (local.set $34
                  (block (result i32)
                   (local.set $scratch_51
                    (tuple.extract 5 3
                     (local.get $scratch_50)
                    )
                   )
                   (local.set $35
                    (tuple.extract 5 4
                     (local.get $scratch_50)
                    )
                   )
                   (local.get $scratch_51)
                  )
                 )
                 (local.get $scratch_52)
                )
               )
               (local.get $scratch_53)
              )
             )
             (local.get $scratch_54)
            )
           )
           (local.get $42)
          )
         )
        )
       )
       (else
        (block
         (if
          (i32.eqz
           (local.get $31)
          )
          (then
           (call $fimport$6
            (array.new_fixed $6 0)
           )
          )
          (else
           (nop)
           (memory.init $0
            (i32.and
             (local.get $31)
             (i32.const 15)
            )
            (i32.const 4)
            (i32.const 6)
           )
          )
         )
         (br_if $block
          (local.get $28)
         )
        )
        (f64.convert_i64_s
         (i64.const -16384)
        )
       )
      )
     )
    )
    (if
     (global.get $global$13)
     (then
      (br $block)
     )
     (else
      (struct.set $0 3
       (loop (result (ref $0))
        (if
         (i32.eqz
          (global.get $global$14)
         )
         (then
          (global.set $global$14
           (i32.const 24)
          )
          (unreachable)
         )
        )
        (global.set $global$14
         (i32.sub
          (global.get $global$14)
          (i32.const 1)
         )
        )
        (ref.as_non_null
         (local.get $6)
        )
       )
       (block (result i64)
        (drop
         (br_on_null $label1
          (ref.i31
           (i32.const 6710)
          )
         )
        )
        (i64.const -9223372036854775807)
       )
      )
      (br $label1)
     )
    )
    (unreachable)
   )
   (local.set $12
    (local.set $11
     (unreachable)
    )
   )
  )
 )
 (func $17 (type $8)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (call $16
   (f64.const -121)
  )
  (call $16
   (f64.const 1797693134862315708145274e284)
  )
 )
 (func $18 (type $2) (param $0 eqref) (param $1 f64) (param $2 eqref) (result (ref $2) i32 nullref)
  (local $3 (ref string))
  (local $4 (ref string))
  (local $5 (ref string))
  (local $6 (ref string))
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 arrayref)
  (local $10 (ref null $2))
  (local $11 (ref $7))
  (local $12 (ref $7))
  (local $13 (ref $0))
  (local $14 (ref array))
  (local $15 (ref array))
  (local $16 (ref $2))
  (local $17 nullref)
  (local $18 f32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i64)
  (local $scratch i32)
  (local $scratch_26 (ref $2))
  (local $scratch_27 (ref (exact $0)))
  (local $scratch_28 (ref string))
  (local $scratch_29 i32)
  (if
   (i32.eqz
    (global.get $global$14)
   )
   (then
    (global.set $global$14
     (i32.const 24)
    )
    (unreachable)
   )
  )
  (global.set $global$14
   (i32.sub
    (global.get $global$14)
    (i32.const 1)
   )
  )
  (local.set $16
   (block (result (ref $2))
    (local.set $scratch_26
     (ref.as_non_null
      (local.get $10)
     )
    )
    (local.set $23
     (block (result i32)
      (local.set $scratch
       (i32.const 4194304)
      )
      (local.set $17
       (ref.null none)
      )
      (local.get $scratch)
     )
    )
    (local.get $scratch_26)
   )
  )
  (local.set $10
   (ref.as_non_null
    (local.get $10)
   )
  )
  (drop
   (string.const "\e2\82\ac")
  )
  (drop
   (string.const "\e2\82\ac\ed\bd\88")
  )
  (drop
   (string.const "")
  )
  (drop
   (block (result i32)
    (local.set $scratch_29
     (i32.const -1)
    )
    (local.set $8
     (block (result (ref string))
      (local.set $scratch_28
       (string.const "\c2\a3")
      )
      (drop
       (block (result (ref (exact $0)))
        (local.set $scratch_27
         (struct.new $0
          (struct.new_default $0)
          (f32.const -nan:0x7fb41f)
          (struct.new_default $0)
          (i64.const 131072)
         )
        )
        (drop
         (f32.const -nan:0xb1614)
        )
        (local.get $scratch_27)
       )
      )
      (local.get $scratch_28)
     )
    )
    (local.get $scratch_29)
   )
  )
  (drop
   (local.get $8)
  )
  (drop
   (ref.as_non_null
    (ref.null none)
   )
  )
  (drop
   (local.tee $18
    (f32.const 40)
   )
  )
  (block
   (nop)
   (return
    (tuple.make 3
     (ref.as_non_null
      (ref.null nofunc)
     )
     (i32.const -4650137)
     (ref.null none)
    )
   )
  )
  (local.set $3
   (local.set $14
    (local.set $15
     (local.set $13
      (local.set $12
       (local.set $11
        (local.set $7
         (local.set $4
          (local.set $5
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
  )
 )
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (type $__sinkT_1 (func (param arrayref) (result arrayref)))
 (func $__popsink_1 (type $__sinkT_1) (local.get 0))
 (global $__rt i32 (i32.const 1))
)
