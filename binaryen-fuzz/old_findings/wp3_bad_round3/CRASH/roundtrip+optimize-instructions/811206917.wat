(module
 (type $0 (array i8))
 (type $1 (struct))
 (type $2 (func))
 (type $3 (array (mut i16)))
 (type $4 (func (param externref)))
 (type $5 (func (param i32)))
 (type $6 (func (param f64) (result i64)))
 (type $7 (func (result i32)))
 (type $8 (func (result v128)))
 (type $9 (func (param i64)))
 (type $10 (func (param funcref)))
 (type $11 (func (result f64 i31ref f64 funcref i64)))
 (type $12 (func (result f32 f64 f32 v128)))
 (type $13 (func (result f64 i64 arrayref)))
 (type $14 (func (result f32)))
 (type $15 (func (result i64)))
 (type $16 (func (result externref f32)))
 (type $17 (func (result v128 arrayref funcref i32 i64 arrayref)))
 (type $18 (func (result (ref struct))))
 (type $19 (func (param f32)))
 (type $20 (func (param f64)))
 (type $21 (func (param v128)))
 (type $22 (func (param anyref)))
 (type $23 (func (result (ref string))))
 (type $24 (func (param eqref funcref f32 (ref struct)) (result i64 i64)))
 (type $25 (func (param (ref array)) (result arrayref)))
 (type $26 (func (param i32 (ref array) f64) (result eqref)))
 (type $27 (func (param f64 i31ref i32) (result structref anyref i64 f32 i32 f32)))
 (type $28 (func (param (ref string) f64 f64 f32) (result i64)))
 (type $29 (func (param (ref eq) eqref v128 (ref array) f64 f64) (result f32 exnref arrayref)))
 (type $30 (func (param (ref array)) (result i31ref)))
 (type $31 (func (param f64 i64) (result i31ref)))
 (type $32 (func (param eqref) (result i32 eqref arrayref)))
 (type $33 (func (param i32 f32 i31ref) (result externref)))
 (type $34 (func (result i31ref)))
 (type $35 (func (param structref f32 i32 stringref (ref array) (ref struct) f64) (result funcref i32)))
 (type $36 (func (param exnref)))
 (type $37 (func (param i32 (ref string) f64) (result (ref array))))
 (type $38 (func (param (ref array) i32 i64 f32 i32) (result i64)))
 (type $39 (func (result f64)))
 (type $40 (func (param i32 (ref array) i64 f32 (ref array) f64) (result f32 v128 v128)))
 (type $41 (func (param i64 exnref i31ref arrayref (ref array) stringref f64) (result i32)))
 (type $42 (func (param i64) (result f32)))
 (type $43 (func (param arrayref i32 i32 i32) (result anyref)))
 (type $44 (func (param funcref i32 (ref array)) (result f64 externref externref)))
 (type $45 (func (param i64 i64) (result externref)))
 (type $46 (func (param v128) (result i32)))
 (type $47 (func (result arrayref)))
 (type $48 (func (result eqref)))
 (type $49 (func (result (ref eq))))
 (type $50 (func (param i64) (result (ref eq))))
 (type $51 (func (result anyref)))
 (type $52 (func (param f64) (result i64 f64)))
 (type $53 (func (param (ref eq) i32) (result (ref string))))
 (type $54 (func (param f32) (result f32)))
 (type $55 (func (param f64) (result f64)))
 (type $56 (func (param v128) (result v128)))
 (type $57 (func (result i64 i64)))
 (type $58 (func (result structref anyref i64 f32 i32 f32)))
 (type $59 (func (result f32 exnref arrayref)))
 (type $60 (func (result i32 eqref arrayref)))
 (type $61 (func (result funcref i32)))
 (type $62 (func (result f32 v128 v128)))
 (type $63 (func (result f64 externref externref)))
 (type $64 (func (result i64 f64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_10" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $5) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $5) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $9) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $19) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $20) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $21) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $22) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $10) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $4) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $5) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $4) (param externref)))
 (global $global$0 (mut v128) (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$1 (mut i31ref) (ref.i31
  (i32.const -2147483648)
 ))
 (global $global$2 (mut (ref array)) (array.new_fixed $0 0))
 (global $global$3 v128 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$4 i64 (i64.const 256))
 (global $global$5 (mut i64) (i64.const 242))
 (global $global$6 (mut i64) (i64.const -1))
 (global $global$7 i64 (i64.const 4294967240))
 (global $global$8 v128 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$9 funcref (ref.null nofunc))
 (global $global$10 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 (i64.const 0) "")
 (data $1 "\f1\8an\f9\9b\e6\cb\f6*-\99\n\ef\82\1ev|\b3\fe2f\e9\13K\f5 _^b")
 (data $2 (i64.const 0) "\e2Er\e2Q*2\7f \80;{e\93A\19w\f5g\t\c5\c2\c3\c2`\cb")
 (table $0 15 15 funcref (ref.null nofunc))
 (table $1 6 exnref)
 (elem $0 (table $0) (i32.const 0) func $5 $15 $15 $24 $29 $31 $37 $47 $47 $47 $48 $62 $63 $64 $66)
 (elem declare func $21 $22 $3 $4 $42 $43 $6 $69 $7 $9 $fimport$2 $fimport$7 $fimport$8)
 (tag $tag$0 (type $5) (param i32))
 (tag $tag$1 (type $2))
 (export "global$" (global $global$0))
 (export "global$_2" (global $global$2))
 (export "global$_8" (global $global$9))
 (export "wasmtag" (tag $eimport$0))
 (export "func" (func $0))
 (export "func_invoker" (func $1))
 (export "func_11" (func $2))
 (export "func_12_invoker" (func $4))
 (export "func_16" (func $7))
 (export "func_18_invoker" (func $10))
 (export "func_20_invoker" (func $12))
 (export "func_22_invoker" (func $14))
 (export "func_24_invoker" (func $16))
 (export "func_26" (func $17))
 (export "func_27" (func $18))
 (export "func_27_invoker" (func $19))
 (export "func_30_invoker" (func $22))
 (export "func_32" (func $23))
 (export "func_34_invoker" (func $26))
 (export "func_36_invoker" (func $28))
 (export "func_38_invoker" (func $30))
 (export "func_41_invoker" (func $33))
 (export "func_43_invoker" (func $35))
 (export "func_45" (func $36))
 (export "func_46_invoker" (func $38))
 (export "func_48_invoker" (func $40))
 (export "func_50" (func $41))
 (export "func_51" (func $42))
 (export "func_51_invoker" (func $43))
 (export "func_54_invoker" (func $46))
 (export "func_58" (func $49))
 (export "func_58_invoker" (func $50))
 (export "func_60" (func $51))
 (export "func_62" (func $53))
 (export "func_63_invoker" (func $55))
 (export "func_65" (func $56))
 (export "func_66_invoker" (func $58))
 (export "func_69_invoker" (func $61))
 (export "func_71" (func $62))
 (export "func_72" (func $63))
 (export "func_73" (func $64))
 (export "func_74" (func $65))
 (export "func_76_invoker" (func $68))
 (export "func_78" (func $69))
 (func $0 (type $6) (param $0 f64) (result i64)
  (local $1 structref)
  (local $2 externref)
  (local $3 externref)
  (local $4 arrayref)
  (local $5 anyref)
  (local $6 anyref)
  (local $7 v128)
  (local $8 f32)
  (local $9 f32)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local.set $0
   (call $71
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$1
   (ref.eq
    (struct.new_default $1)
    (if (result (ref i31))
     (ref.eq
      (array.new_fixed $0 0)
      (array.new_fixed $0 0)
     )
     (then
      (return
       (global.get $global$7)
      )
     )
     (else
      (block $block1 (result (ref i31))
       (i64.store offset=22 align=2
        (i64.and
         (global.get $global$4)
         (i64.const 15)
        )
        (global.get $global$7)
       )
       (block $block
        (try_table (catch_all $block)
         (drop
          (br_on_cast_fail $block1 (ref i31) (ref i31)
           (ref.i31
            (i32.const -127)
           )
          )
         )
        )
       )
       (if (result (ref i31))
        (i32.const -2147483647)
        (then
         (call $fimport$7
          (ref.func $fimport$8)
         )
         (return
          (global.get $global$7)
         )
        )
        (else
         (ref.i31
          (i32.const -87)
         )
        )
       )
      )
     )
    )
   )
  )
  (return
   (i64.const 35184372088831)
  )
 )
 (func $1 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $0
    (f64.const 0)
   )
  )
  (drop
   (call $0
    (f64.const -8589934592)
   )
  )
  (drop
   (call $0
    (f64.const -562949953421311.2)
   )
  )
  (drop
   (call $0
    (f64.const -17592186044415.55)
   )
  )
 )
 (func $2 (type $23) (result (ref string))
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 v128)
  (local $9 f32)
  (local $10 i31ref)
  (local $11 eqref)
  (local $12 eqref)
  (local $13 arrayref)
  (local $14 (ref i31))
  (local $15 (ref i31))
  (local $16 (ref array))
  (local $17 (ref array))
  (local $18 (ref array))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (local.set $14
   (ref.i31
    (i32.const -3)
   )
  )
  (block $block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$10)
     )
     (then
      (global.set $global$10
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$10
     (i32.sub
      (global.get $global$10)
      (i32.const 1)
     )
    )
    (nop)
    (call $fimport$8
     (string.const "\c2\a3\c2\a3")
    )
    (br_if $label
     (i32.eqz
      (memory.atomic.notify offset=1
       (i64.and
        (local.get $4)
        (i64.const 15)
       )
       (i32.const -1073741824)
      )
     )
    )
    (block
     (if
      (i32.eqz
       (loop (result i32)
        (if
         (i32.eqz
          (global.get $global$10)
         )
         (then
          (global.set $global$10
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$10
         (i32.sub
          (global.get $global$10)
          (i32.const 1)
         )
        )
        (i32.const 65482)
       )
      )
      (then
       (nop)
       (br $block)
      )
      (else
       (if
        (local.get $7)
        (then
         (block $block1
          (nop)
          (br_if $block1
           (i31.get_u
            (local.tee $14
             (ref.cast (ref i31)
              (local.tee $15
               (ref.i31
                (i32.const 126)
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
        (call $71
         (f64.promote_f32
          (f32.const -7677)
         )
        )
       )
       (block
        (br_if $label
         (i32.const -71)
        )
        (br $label)
       )
       (unreachable)
      )
     )
     (unreachable)
    )
    (unreachable)
   )
   (unreachable)
  )
  (return
   (string.const "\e2\82\ac\f0\90\8d\88")
  )
 )
 (func $3 (type $7) (result i32)
  (local $0 i64)
  (local $1 i64)
  (local $2 i32)
  (local $3 (ref array))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$0
   (ref.eq
    (array.new_fixed $0 0)
    (local.tee $3
     (array.new_fixed $0 0)
    )
   )
  )
  (block $block
   (br_table $block $block $block $block $block $block $block $block $block $block
    (loop $label (result i32)
     (if
      (i32.eqz
       (global.get $global$10)
      )
      (then
       (global.set $global$10
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$10
      (i32.sub
       (global.get $global$10)
       (i32.const 1)
      )
     )
     (if
      (i32.eqz
       (global.get $global$10)
      )
      (then
       (global.set $global$10
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$10
      (i32.sub
       (global.get $global$10)
       (i32.const 1)
      )
     )
     (nop)
     (br_if $label
      (i32.eqz
       (try $__t_13 (result i32) (do (try (result i32) (do 
         (i32.const -13734)
        ) (delegate $__t_13))) (catch $tag$0
(local.set $2 (select (pop i32) (local.get $2) (i32.const 7)))
(if (global.get $__rt) (then (rethrow $__t_13)))
(drop
          (ref.i31
           (i32.const 40557)
          )
         )
(try_table (catch_all $label)
          (try_table (catch_all $label)
           (nop)
           (return
            (i32.const -25032)
           )
          )
          (unreachable)
         )
(unreachable)) (catch_all (if (global.get $__rt) (then (rethrow $__t_13)))
(ref.test (ref array)
          (local.tee $3
           (local.tee $3
            (array.new_fixed $0 0)
           )
          )
         )))
      )
     )
     (i32.const -2147483648)
    )
   )
  )
  (return
   (i32.const -2147483648)
  )
 )
 (func $4 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $3)
  )
 )
 (func $5 (type $24) (param $0 eqref) (param $1 funcref) (param $2 f32) (param $3 (ref struct)) (result i64 i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 v128)
  (local $7 f32)
  (local $8 i32)
  (local $9 externref)
  (local.set $2
   (call $70
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i64.const -17)
   (i64.const -110)
  )
 )
 (func $6 (type $25) (param $0 (ref array)) (result arrayref)
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
  (local $12 i64)
  (local $13 f32)
  (local $14 f64)
  (local $15 v128)
  (local $16 (ref string))
  (local $17 (ref string))
  (local $18 (ref func))
  (local $19 (ref $3))
  (local $20 (ref $3))
  (local $21 (ref $3))
  (local $22 exnref)
  (local $23 (ref exn))
  (local $24 eqref)
  (local $25 structref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (local.set $18
   (ref.func $6)
  )
  (try $__t_12  (do (try  (do 
    (i64.store offset=2 align=2
     (i64.and
      (i64.rotr
       (global.get $global$7)
       (if (result i64)
        (if (result i32)
         (i32.eqz
          (i32.const -2147483648)
         )
         (then
          (block $block (result i32)
           (block $block1
            (try_table (catch $tag$0 $block) (catch $tag$0 $block) (catch $tag$0 $block) (catch_all $block1)
             (nop)
             (br $block1)
            )
            (unreachable)
           )
           (i32.const -255)
          )
         )
         (else
          (call_ref $4
           (global.get $gimport$0)
           (ref.func $fimport$8)
          )
          (i32.const 1)
         )
        )
        (then
         (drop
          (i64.and
           (i64.const 8388608)
           (i64.const 15)
          )
         )
         (drop
          (i64.const 53105)
         )
         (loop $label
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (nop)
          (br $label)
         )
         (unreachable)
        )
        (else
         (block $block3 (result i64)
          (v128.store offset=22 align=4
           (i64.and
            (try $__t_11 (result i64) (do
              (global.get $global$4)
             ) (catch $tag$0
              (global.set $global$10 (pop i32))
              (local.get $12)
             ) (catch_all (if (global.get $__rt) (then (rethrow $__t_11)))
(i64.const 0)))
            (i64.const 15)
           )
           (loop (result v128)
            (if
             (i32.eqz
              (global.get $global$10)
             )
             (then
              (global.set $global$10
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$10
             (i32.sub
              (global.get $global$10)
              (i32.const 1)
             )
            )
            (block (result v128)
             (if
              (i32.load offset=4
               (i64.and
                (local.tee $12
                 (local.tee $12
                  (loop $label1 (result i64)
                   (if
                    (i32.eqz
                     (global.get $global$10)
                    )
                    (then
                     (global.set $global$10
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$10
                    (i32.sub
                     (global.get $global$10)
                     (i32.const 1)
                    )
                   )
                   (nop)
                   (br_if $label1
                    (i32.eqz
                     (local.get $1)
                    )
                   )
                   (local.get $12)
                  )
                 )
                )
                (i64.const 15)
               )
              )
              (then
               (if
                (local.get $1)
                (then
                 (block $block2
                  (nop)
                  (drop
                   (br_on_null $block2
                    (loop $label2 (result (ref array))
                     (if
                      (i32.eqz
                       (global.get $global$10)
                      )
                      (then
                       (global.set $global$10
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$10
                      (i32.sub
                       (global.get $global$10)
                       (i32.const 1)
                      )
                     )
                     (nop)
                     (br_if $label2
                      (local.get $1)
                     )
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
                (else
                 (nop)
                 (i64.store32 offset=4 align=2
                  (i64.and
                   (i64.shr_s
                    (local.get $12)
                    (i64.const -32767)
                   )
                   (i64.const 15)
                  )
                  (i64.const -68719476735)
                 )
                 (i32.atomic.store16 offset=22
                  (i64.and
                   (i64.const -3070620)
                   (i64.const 15)
                  )
                  (i32.const -125)
                 )
                )
               )
              )
             )
             (local.tee $15
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
            )
           )
          )
          (br_if $block3
           (i64.load32_s offset=4
            (i64.and
             (try_table (result i64)
              (local.get $12)
             )
             (i64.const 15)
            )
           )
           (if (result i32)
            (i32.load offset=22
             (i64.and
              (local.tee $12
               (i64.const -3734725)
              )
              (i64.const 15)
             )
            )
            (then
             (nop)
             (return
              (array.new_fixed $0 0)
             )
            )
            (else
             (i32.const 134217729)
            )
           )
          )
         )
        )
       )
      )
      (i64.const 15)
     )
     (i64.const 65)
    )
   ) (delegate $__t_12))) (catch $tag$0
    (local.set $7 (i32.xor (pop i32) (i32.const 38)))
    (f32.store offset=22 align=2
     (i64.and
      (i64.const -18)
      (i64.const 15)
     )
     (if (result f32)
      (i32.const -1)
      (then
       (nop)
       (local.tee $13
        (loop $label3 (result f32)
         (if
          (i32.eqz
           (global.get $global$10)
          )
          (then
           (global.set $global$10
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$10
          (i32.sub
           (global.get $global$10)
           (i32.const 1)
          )
         )
         (call_ref $9
          (loop (result i64)
           (if
            (i32.eqz
             (global.get $global$10)
            )
            (then
             (global.set $global$10
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$10
            (i32.sub
             (global.get $global$10)
             (i32.const 1)
            )
           )
           (block (result i64)
            (local.tee $12
             (local.get $12)
            )
           )
          )
          (ref.func $fimport$2)
         )
         (call_ref $10
          (local.get $18)
          (ref.func $fimport$7)
         )
         (br_if $label3
          (i32.eqz
           (block (result i32)
            (loop
             (if
              (i32.eqz
               (global.get $global$10)
              )
              (then
               (global.set $global$10
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$10
              (i32.sub
               (global.get $global$10)
               (i32.const 1)
              )
             )
             (try $__t_10  (do
               (local.set $12
                (local.get $12)
               )
              ) (catch $tag$0
               (throw $tag$0 (pop i32))
               (v128.store offset=2
                (i64.and
                 (i64.extend_i32_s
                  (select
                   (if (result i32)
                    (i32.eqz
                     (ref.eq
                      (ref.i31
                       (i32.const -12937)
                      )
                      (local.tee $25
                       (struct.new_default $1)
                      )
                     )
                    )
                    (then
                     (nop)
                     (i32.const 1)
                    )
                    (else
                     (i32.const -512)
                    )
                   )
                   (i32.const 33554432)
                   (i32.const -134217728)
                  )
                 )
                 (i64.const 15)
                )
                (local.get $15)
               )
              ) (catch_all
               (call_ref $2
                (ref.func $4)
               )
              ))
             (br $label3)
            )
            (unreachable)
           )
          )
         )
         (local.get $13)
        )
       )
      )
      (else
       (nop)
       (return
        (array.new_fixed $0 0)
       )
      )
     )
    )
   ) (catch_all (if (global.get $__rt) (then (rethrow $__t_12)))
(loop $label4
     (if
      (i32.eqz
       (global.get $global$10)
      )
      (then
       (global.set $global$10
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$10
      (i32.sub
       (global.get $global$10)
       (i32.const 1)
      )
     )
     (try $__t_9  (do
       (nop)
       (br $label4)
      ) (catch_all (if (global.get $__rt) (then (rethrow $__t_9)))
(drop
        (i32.const 255)
       )
(drop
        (f64.ge
         (local.get $14)
         (local.tee $14
          (local.get $14)
         )
        )
       )
(block
        (nop)
        (br $label4)
       )
(local.set $18
        (unreachable)
       )))
     (unreachable)
    )
(unreachable)))
  (unreachable)
 )
 (func $7 (type $6) (param $0 f64) (result i64)
  (local $1 i32)
  (local $2 f64)
  (local $3 f64)
  (local $4 i64)
  (local $5 f32)
  (local $6 i31ref)
  (local $7 (ref array))
  (local $8 (ref eq))
  (local.set $0
   (call $71
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$4
   (local.tee $0
    (f64.const 0)
   )
  )
  (return
   (local.get $4)
  )
 )
 (func $8 (type $26) (param $0 i32) (param $1 (ref array)) (param $2 f64) (result eqref)
  (local $3 externref)
  (local $4 (ref string))
  (local $5 arrayref)
  (local $6 (ref eq))
  (local $7 (ref array))
  (local $8 i32)
  (local.set $2
   (call $71
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (return
   (struct.new_default $1)
  )
 )
 (func $9 (type $27) (param $0 f64) (param $1 i31ref) (param $2 i32) (result structref anyref i64 f32 i32 f32)
  (local $3 exnref)
  (local.set $0
   (call $71
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (tuple.make 6
   (struct.new_default $1)
   (array.new_fixed $0 0)
   (i64.const 17592186044416)
   (f32.const 0)
   (i32.const 2147483647)
   (f32.const -536870912)
  )
 )
 (func $10 (type $2)
  (local $scratch (tuple structref anyref i64 f32 i32 f32))
  (local $scratch_1 i32)
  (local $scratch_2 f32)
  (local $scratch_3 i64)
  (local $scratch_4 anyref)
  (local $scratch_5 structref)
  (local $scratch_6 (tuple structref anyref i64 f32 i32 f32))
  (local $scratch_7 i32)
  (local $scratch_8 f32)
  (local $scratch_9 i64)
  (local $scratch_10 anyref)
  (local $scratch_11 structref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result structref)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $9
        (f64.const 0)
        (ref.i31
         (i32.const -113)
        )
        (i32.const -71)
       )
      )
     )
    )
    (drop
     (block (result anyref)
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
         (block (result f32)
          (local.set $scratch_2
           (tuple.extract 6 3
            (local.get $scratch)
           )
          )
          (drop
           (block (result i32)
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
       (call $9
        (f64.const 4294967295.873)
        (ref.i31
         (i32.const 524288)
        )
        (i32.const -2147483647)
       )
      )
     )
    )
    (drop
     (block (result anyref)
      (local.set $scratch_10
       (tuple.extract 6 1
        (local.get $scratch_6)
       )
      )
      (drop
       (block (result i64)
        (local.set $scratch_9
         (tuple.extract 6 2
          (local.get $scratch_6)
         )
        )
        (drop
         (block (result f32)
          (local.set $scratch_8
           (tuple.extract 6 3
            (local.get $scratch_6)
           )
          )
          (drop
           (block (result i32)
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
 )
 (func $11 (type $28) (param $0 (ref string)) (param $1 f64) (param $2 f64) (param $3 f32) (result i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 v128)
  (local $10 f64)
  (local $11 (ref array))
  (local $12 eqref)
  (local.set $1
   (call $71
    (local.get $1)
   )
  )
  (local.set $2
   (call $71
    (local.get $2)
   )
  )
  (local.set $3
   (call $70
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $4)
  (return
   (local.get $5)
  )
 )
 (func $12 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $11
    (string.const "990")
    (f64.const 0)
    (f64.const 0)
    (f32.const 60)
   )
  )
 )
 (func $13 (type $29) (param $0 (ref eq)) (param $1 eqref) (param $2 v128) (param $3 (ref array)) (param $4 f64) (param $5 f64) (result f32 exnref arrayref)
  (local $scratch (ref (exact $1)))
  (local $scratch_7 (ref extern))
  (local $scratch_8 i64)
  (local.set $2
   (call $72
    (local.get $2)
   )
  )
  (local.set $4
   (call $71
    (local.get $4)
   )
  )
  (local.set $5
   (call $71
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (f32.const -111)
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$0
      (i32.atomic.load16_u offset=3
       (i64.and
        (i64.div_u
         (i64.const 38)
         (block (result i64)
          (local.set $scratch_8
           (i64.const -9223372036854775807)
          )
          (drop
           (block (result (ref extern))
            (local.set $scratch_7
             (global.get $gimport$0)
            )
            (drop
             (block (result (ref (exact $1)))
              (local.set $scratch
               (struct.new_default $1)
              )
              (drop
               (ref.null noextern)
              )
              (local.get $scratch)
             )
            )
            (local.get $scratch_7)
           )
          )
          (local.get $scratch_8)
         )
        )
        (i64.const 15)
       )
      )
     )
    )
    (unreachable)
   )
   (array.new_fixed $0 0)
  )
 )
 (func $14 (type $2)
  (local $scratch (tuple f32 exnref arrayref))
  (local $scratch_1 exnref)
  (local $scratch_2 f32)
  (local $scratch_3 (tuple f32 exnref arrayref))
  (local $scratch_4 exnref)
  (local $scratch_5 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result f32)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $13
        (struct.new_default $1)
        (struct.new_default $1)
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (array.new_fixed $0 0)
        (f64.const 0)
        (f64.const 0)
       )
      )
     )
    )
    (drop
     (block (result exnref)
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
  (drop
   (block (result f32)
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $13
        (ref.i31
         (i32.const -32)
        )
        (struct.new_default $1)
        (v128.const i32x4 0x00010700 0xd346008f 0x91ff0195 0x00007180)
        (array.new_fixed $0 0)
        (f64.const -134217728)
        (f64.const -42)
       )
      )
     )
    )
    (drop
     (block (result exnref)
      (local.set $scratch_4
       (tuple.extract 3 1
        (local.get $scratch_3)
       )
      )
      (drop
       (tuple.extract 3 2
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
 (func $15 (type $30) (param $0 (ref array)) (result i31ref)
  (local $1 v128)
  (local $2 f64)
  (local $3 f64)
  (local $4 f64)
  (local $5 f32)
  (local $6 f32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 eqref)
  (local $12 eqref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (return
   (global.get $global$1)
  )
 )
 (func $16 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $15
    (array.new_fixed $0 0)
   )
  )
 )
 (func $17 (type $31) (param $0 f64) (param $1 i64) (result i31ref)
  (local $2 i64)
  (local $3 f32)
  (local $4 externref)
  (local.set $0
   (call $71
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (try_table (result (ref i31))
   (ref.i31
    (i32.const -93)
   )
  )
 )
 (@binaryen.js.called)
 (func $18 (type $32) (param $0 eqref) (result i32 eqref arrayref)
  (local $1 (ref array))
  (local $2 anyref)
  (local $3 eqref)
  (local $4 eqref)
  (local $5 arrayref)
  (local $6 i31ref)
  (local $7 i31ref)
  (local $8 i31ref)
  (local $9 exnref)
  (local $10 exnref)
  (local $11 stringref)
  (local $12 structref)
  (local $13 v128)
  (local $14 f64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (i32.const -32766)
   (ref.i31
    (i32.const 16)
   )
   (array.new_fixed $0 0)
  )
 )
 (func $19 (type $2)
  (local $scratch (tuple i32 eqref arrayref))
  (local $scratch_1 eqref)
  (local $scratch_2 i32)
  (local $scratch_3 (tuple i32 eqref arrayref))
  (local $scratch_4 eqref)
  (local $scratch_5 i32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $18
        (ref.i31
         (i32.const -125)
        )
       )
      )
     )
    )
    (drop
     (block (result eqref)
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
  (drop
   (block (result i32)
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $18
        (array.new_fixed $0 0)
       )
      )
     )
    )
    (drop
     (block (result eqref)
      (local.set $scratch_4
       (tuple.extract 3 1
        (local.get $scratch_3)
       )
      )
      (drop
       (tuple.extract 3 2
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
 (func $20 (type $33) (param $0 i32) (param $1 f32) (param $2 i31ref) (result externref)
  (local $3 funcref)
  (local $4 i64)
  (local.set $1
   (call $70
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (string.const "\c2\a3\f0\90\8d\88")
 )
 (func $21 (type $11) (result f64 i31ref f64 funcref i64)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f64)
  (local $9 f64)
  (local $10 (ref struct))
  (local $11 i31ref)
  (local $12 stringref)
  (local $13 stringref)
  (local $14 exnref)
  (local $15 arrayref)
  (local $16 funcref)
  (local $17 anyref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (tuple.make 5
   (f64.const 0)
   (ref.i31
    (i32.const -2097152)
   )
   (f64.const -66)
   (ref.func $21)
   (i64.const 2147483648)
  )
 )
 (func $22 (type $2)
  (local $scratch (tuple f64 i31ref f64 funcref i64))
  (local $scratch_1 funcref)
  (local $scratch_2 f64)
  (local $scratch_3 i31ref)
  (local $scratch_4 f64)
  (local $scratch_5 (tuple f64 i31ref f64 funcref i64))
  (local $scratch_6 funcref)
  (local $scratch_7 f64)
  (local $scratch_8 i31ref)
  (local $scratch_9 f64)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result f64)
    (local.set $scratch_4
     (tuple.extract 5 0
      (local.tee $scratch
       (call $21)
      )
     )
    )
    (drop
     (block (result i31ref)
      (local.set $scratch_3
       (tuple.extract 5 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result f64)
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
   (block (result f64)
    (local.set $scratch_9
     (tuple.extract 5 0
      (local.tee $scratch_5
       (call $21)
      )
     )
    )
    (drop
     (block (result i31ref)
      (local.set $scratch_8
       (tuple.extract 5 1
        (local.get $scratch_5)
       )
      )
      (drop
       (block (result f64)
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
 )
 (func $23 (type $34) (result i31ref)
  (local $0 i64)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (ref.null none)
 )
 (func $24 (type $12) (result f32 f64 f32 v128)
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 (ref string))
  (local $4 i31ref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$10)
    )
    (then
     (global.set $global$10
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$10
    (i32.sub
     (global.get $global$10)
     (i32.const 1)
    )
   )
   (f32.store offset=1 align=2
    (i64.and
     (i64.const 128)
     (i64.const 15)
    )
    (f32.const 0)
   )
   (nop)
   (br_if $label
    (ref.eq
     (array.new_fixed $0 0)
     (try $__t_8 (result (ref eq)) (do
       (ref.i31
        (i32.const -2971)
       )
      ) (catch $tag$0
(throw $tag$0 (pop i32))
(if (global.get $__rt) (then (rethrow $__t_8)))
(loop (result (ref (exact $0)))
        (if
         (i32.eqz
          (global.get $global$10)
         )
         (then
          (global.set $global$10
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$10
         (i32.sub
          (global.get $global$10)
          (i32.const 1)
         )
        )
        (block (result (ref (exact $0)))
         (call $fimport$0
          (i32.const 0)
         )
         (array.new_fixed $0 0)
        )
       )))
    )
   )
   (if
    (i32.eqz
     (global.get $global$10)
    )
    (then
     (global.set $global$10
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$10
    (i32.sub
     (global.get $global$10)
     (i32.const 1)
    )
   )
   (try_table (catch_all $label)
    (nop)
   )
   (br $label)
  )
  (unreachable)
 )
 (func $25 (type $35) (param $0 structref) (param $1 f32) (param $2 i32) (param $3 stringref) (param $4 (ref array)) (param $5 (ref struct)) (param $6 f64) (result funcref i32)
  (local $7 v128)
  (local $8 i32)
  (local $9 i32)
  (local $10 arrayref)
  (local $11 funcref)
  (local $12 exnref)
  (local $13 externref)
  (local.set $1
   (call $70
    (local.get $1)
   )
  )
  (local.set $6
   (call $71
    (local.get $6)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$4
   (local.get $6)
  )
  (return
   (tuple.make 2
    (ref.null nofunc)
    (i32.const -1)
   )
  )
 )
 (func $26 (type $2)
  (local $scratch (tuple funcref i32))
  (local $scratch_1 funcref)
  (local $scratch_2 (tuple funcref i32))
  (local $scratch_3 funcref)
  (local $scratch_4 (tuple funcref i32))
  (local $scratch_5 funcref)
  (local $scratch_6 (tuple funcref i32))
  (local $scratch_7 funcref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result funcref)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $25
        (struct.new_default $1)
        (f32.const 4294967296)
        (i32.const -1896848)
        (string.const "\ed\a0\80\e2\82\ac\ed\bd\88")
        (array.new_fixed $0 0)
        (struct.new_default $1)
        (f64.const -33)
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
   (block (result funcref)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $25
        (struct.new_default $1)
        (f32.const 4294967296)
        (i32.const -32768)
        (string.const "\c2\a3907")
        (array.new_fixed $0 0)
        (struct.new_default $1)
        (f64.const -0.951)
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
  (drop
   (block (result funcref)
    (local.set $scratch_5
     (tuple.extract 2 0
      (local.tee $scratch_4
       (call $25
        (struct.new_default $1)
        (f32.const 46413)
        (i32.const 134217728)
        (string.const "\c2\a3")
        (array.new_fixed $0 0)
        (struct.new_default $1)
        (f64.const 0)
       )
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
   (block (result funcref)
    (local.set $scratch_7
     (tuple.extract 2 0
      (local.tee $scratch_6
       (call $25
        (struct.new_default $1)
        (f32.const 0)
        (i32.const -5087)
        (string.const "\f0\90\8d\88")
        (array.new_fixed $0 0)
        (struct.new_default $1)
        (f64.const 209)
       )
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
 (@binaryen.js.called)
 (func $27 (type $36) (param $0 exnref)
  (local $1 v128)
  (local $2 i32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f64)
  (local $6 f64)
  (local $7 (ref struct))
  (local $8 (ref struct))
  (local $9 i31ref)
  (local $10 structref)
  (local $11 structref)
  (local $12 exnref)
  (local $13 (ref array))
  (local $14 stringref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$8
   (string.const "")
  )
 )
 (func $28 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $27
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$0
      (i32.load offset=3 align=2
       (i64.and
        (i64.const -2094728)
        (i64.const 15)
       )
      )
     )
    )
    (unreachable)
   )
  )
 )
 (@binaryen.js.called)
 (func $29 (type $37) (param $0 i32) (param $1 (ref string)) (param $2 f64) (result (ref array))
  (local $3 f64)
  (local $4 f32)
  (local $5 structref)
  (local $6 funcref)
  (local $7 (ref string))
  (local.set $2
   (call $71
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (global.get $global$2)
  )
 )
 (func $30 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $29
    (i32.const 257)
    (string.const "")
    (f64.const -524288)
   )
  )
  (drop
   (call $29
    (i32.const 122)
    (string.const "\ed\a0\80")
    (f64.const 2048)
   )
  )
  (drop
   (call $29
    (i32.const -4193783)
    (string.const "\e2\82\ac\ed\a0\80")
    (f64.const 0)
   )
  )
  (drop
   (call $29
    (i32.const 127)
    (string.const "")
    (f64.const -4)
   )
  )
  (drop
   (call $29
    (i32.const -26319)
    (string.const "\c2\a3\c2\a3")
    (f64.const 2147483648)
   )
  )
  (drop
   (call $29
    (i32.const -38)
    (string.const "\ed\a0\80")
    (f64.const -134217727.858)
   )
  )
  (drop
   (call $29
    (i32.const -115)
    (string.const "\c2\a3970\e2\82\ac")
    (f64.const -6524585)
   )
  )
  (drop
   (call $29
    (i32.const -98)
    (string.const "\ed\bd\88\c2\a3\f0\90\8d\88")
    (f64.const 209)
   )
  )
 )
 (@binaryen.js.called)
 (func $31 (type $38) (param $0 (ref array)) (param $1 i32) (param $2 i64) (param $3 f32) (param $4 i32) (result i64)
  (local $5 f32)
  (local $6 f64)
  (local.set $3
   (call $70
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (i32.store offset=2
   (i64.and
    (local.get $2)
    (i64.const 15)
   )
   (call_ref $7
    (ref.func $3)
   )
  )
  (return
   (i64.const -65536)
  )
 )
 (@binaryen.js.called)
 (func $32 (type $39) (result f64)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 v128)
  (local $6 v128)
  (local $7 f32)
  (local $8 i64)
  (local $9 i64)
  (local $10 anyref)
  (local $11 externref)
  (local $12 exnref)
  (local $13 exnref)
  (local $14 exnref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (f64.const 2.89)
 )
 (func $33 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $71
    (call $32)
   )
  )
 )
 (func $34 (type $13) (result f64 i64 arrayref)
  (local $0 f64)
  (local $1 f64)
  (local $2 i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 i64)
  (local $6 i64)
  (local $7 exnref)
  (local $8 anyref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (return
   (tuple.make 3
    (f64.const 26)
    (i64.const 281474976710656)
    (ref.null none)
   )
  )
 )
 (func $35 (type $2)
  (local $scratch (tuple f64 i64 arrayref))
  (local $scratch_1 i64)
  (local $scratch_2 f64)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result f64)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $34)
      )
     )
    )
    (drop
     (block (result i64)
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
 (func $36 (type $14) (result f32)
  (local $0 i64)
  (local $1 f64)
  (local $2 i32)
  (local $3 f32)
  (local $4 arrayref)
  (local $scratch f64)
  (local $scratch_6 i32)
  (local $scratch_7 i64)
  (local $scratch_8 i32)
  (local $scratch_9 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (block
   (block
    (drop
     (block (result f32)
      (local.set $scratch_9
       (f32.const -85)
      )
      (drop
       (block (result i32)
        (local.set $scratch_8
         (i32.const -126)
        )
        (drop
         (block (result i64)
          (local.set $scratch_7
           (i64.const 268435457)
          )
          (drop
           (block (result i32)
            (local.set $scratch_6
             (i32.const 78)
            )
            (drop
             (block (result f64)
              (local.set $scratch
               (f64.const 0)
              )
              (drop
               (ref.null none)
              )
              (local.get $scratch)
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
    (return
     (f32.const -2)
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $37 (type $40) (param $0 i32) (param $1 (ref array)) (param $2 i64) (param $3 f32) (param $4 (ref array)) (param $5 f64) (result f32 v128 v128)
  (local $6 structref)
  (local $7 stringref)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local.set $3
   (call $70
    (local.get $3)
   )
  )
  (local.set $5
   (call $71
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (block
   (try_table
    (block $block
     (drop
      (br_on_null $block
       (ref.i31
        (i32.const -12)
       )
      )
     )
     (nop)
    )
    (return
     (tuple.make 3
      (f32.const -511.7869873046875)
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $38 (type $2)
  (local $scratch (tuple f32 v128 v128))
  (local $scratch_1 v128)
  (local $scratch_2 f32)
  (local $scratch_3 (tuple f32 v128 v128))
  (local $scratch_4 v128)
  (local $scratch_5 f32)
  (local $scratch_6 (tuple f32 v128 v128))
  (local $scratch_7 v128)
  (local $scratch_8 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result f32)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $37
        (i32.const 254)
        (array.new_fixed $0 0)
        (i64.const -13704)
        (f32.const 549755813888)
        (array.new_fixed $0 0)
        (f64.const 137438953472)
       )
      )
     )
    )
    (drop
     (block (result v128)
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
  (drop
   (block (result f32)
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $37
        (i32.const -128)
        (array.new_fixed $0 0)
        (i64.const 65531)
        (f32.const -9223372036854775808)
        (array.new_fixed $0 0)
        (f64.const -0.5409999999999999)
       )
      )
     )
    )
    (drop
     (block (result v128)
      (local.set $scratch_4
       (tuple.extract 3 1
        (local.get $scratch_3)
       )
      )
      (drop
       (tuple.extract 3 2
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
   (block (result f32)
    (local.set $scratch_8
     (tuple.extract 3 0
      (local.tee $scratch_6
       (call $37
        (i32.const 256)
        (array.new_fixed $0 0)
        (i64.const 0)
        (f32.const 4294949120)
        (array.new_fixed $0 0)
        (f64.const 274877906943)
       )
      )
     )
    )
    (drop
     (block (result v128)
      (local.set $scratch_7
       (tuple.extract 3 1
        (local.get $scratch_6)
       )
      )
      (drop
       (tuple.extract 3 2
        (local.get $scratch_6)
       )
      )
      (local.get $scratch_7)
     )
    )
    (local.get $scratch_8)
   )
  )
 )
 (func $39 (type $41) (param $0 i64) (param $1 exnref) (param $2 i31ref) (param $3 arrayref) (param $4 (ref array)) (param $5 stringref) (param $6 f64) (result i32)
  (local $7 f32)
  (local $8 f64)
  (local $9 v128)
  (local $10 i64)
  (local $11 i31ref)
  (local.set $6
   (call $71
    (local.get $6)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (i32.const -4)
 )
 (func $40 (type $2)
  (local $0 i32)
  (local $scratch i64)
  (local $scratch_2 f32)
  (local $scratch_3 i32)
  (local $scratch_4 (ref extern))
  (local $scratch_5 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $39
    (i64.const -58)
    (ref.null noexn)
    (ref.i31
     (i32.const -1017055)
    )
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (string.const "\ed\bd\88")
    (f64.const 25)
   )
  )
  (drop
   (call $39
    (i64.const 4294967295)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (drop
       (block (result f32)
        (local.set $scratch_5
         (f32.const 0)
        )
        (drop
         (block (result (ref extern))
          (local.set $scratch_4
           (global.get $gimport$0)
          )
          (local.set $0
           (block (result i32)
            (local.set $scratch_3
             (i32.const -65536)
            )
            (drop
             (block (result f32)
              (local.set $scratch_2
               (f32.const 65446)
              )
              (drop
               (block (result i64)
                (local.set $scratch
                 (i64.const 32768)
                )
                (drop
                 (i64.const -32768)
                )
                (local.get $scratch)
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
      (throw $tag$0
       (i32.clz
        (local.get $0)
       )
      )
     )
     (unreachable)
    )
    (ref.null none)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (string.const "967\ed\bd\88")
    (f64.const -511.763)
   )
  )
  (drop
   (call $39
    (i64.const -2199023255552)
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$0
       (ref.eq
        (struct.new_default $1)
        (ref.i31
         (i32.const -8049084)
        )
       )
      )
     )
     (unreachable)
    )
    (ref.null none)
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (string.const "")
    (f64.const 0)
   )
  )
 )
 (func $41 (type $42) (param $0 i64) (result f32)
  (local $1 externref)
  (local $2 funcref)
  (local $3 funcref)
  (local $4 (ref array))
  (local $5 (ref exn))
  (local $6 (ref $3))
  (local $7 (ref $3))
  (local $8 (ref string))
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 nullref)
  (local $12 (ref eq))
  (local $13 v128)
  (local $14 v128)
  (local $15 f64)
  (local $16 f64)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 f32)
  (local $21 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (local.set $4
   (array.new_fixed $0 0)
  )
  (call $70
   (f32.load offset=22 align=2
    (i64.and
     (block (result i64)
      (table.set $1
       (i32.const 0)
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$1)
        )
        (unreachable)
       )
      )
      (if
       (i32.eqz
        (i32x4.extract_lane 2
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
       )
       (then
        (call $fimport$7
         (local.tee $3
          (global.get $global$9)
         )
        )
        (return
         (f32.const -2147483648)
        )
       )
       (else
        (drop
         (loop $label2 (result i64)
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (nop)
          (loop $label1
           (if
            (i32.eqz
             (global.get $global$10)
            )
            (then
             (global.set $global$10
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$10
            (i32.sub
             (global.get $global$10)
             (i32.const 1)
            )
           )
           (loop $label
            (if
             (i32.eqz
              (global.get $global$10)
             )
             (then
              (global.set $global$10
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$10
             (i32.sub
              (global.get $global$10)
              (i32.const 1)
             )
            )
            (call $fimport$4
             (call $71
              (f64.min
               (f64.const 8796093022207.872)
               (f64.const -60)
              )
             )
            )
            (table.set $1
             (i32.const 0)
             (block $block2 (result (ref exn))
              (drop
               (br_on_cast_fail $block2 (ref exn) (ref exn)
                (block $block1 (result (ref exn))
                 (try_table (catch_all_ref $block1)
                  (throw $tag$0
                   (i32.const -119)
                  )
                 )
                 (unreachable)
                )
               )
              )
              (br_if $block2
               (local.tee $5
                (block $block3 (result (ref exn))
                 (try_table (catch_all_ref $block3)
                  (throw $tag$0
                   (i32.const -61)
                  )
                 )
                 (unreachable)
                )
               )
               (i32.atomic.load offset=22
                (i64.and
                 (i64.const 4290254428)
                 (i64.const 15)
                )
               )
              )
             )
            )
            (br_if $label
             (local.tee $17
              (i32.const -13487)
             )
            )
           )
           (nop)
           (br_if $label1
            (f32.eq
             (f32.const 0)
             (f32.const 1819755264)
            )
           )
           (drop
            (ref.cast (ref array)
             (local.tee $4
              (local.tee $4
               (local.get $4)
              )
             )
            )
           )
           (drop
            (if (result i32)
             (i32.eqz
              (i32.const -32768)
             )
             (then
              (i32.atomic.load8_u offset=22
               (i64.and
                (i64.load8_u offset=2
                 (i64.and
                  (i64.const -576460752303423488)
                  (i64.const 15)
                 )
                )
                (i64.const 15)
               )
              )
             )
             (else
              (local.tee $17
               (local.get $17)
              )
             )
            )
           )
           (block
            (try_table (catch_all $label2)
             (call $fimport$2
              (i64.const -915)
             )
            )
            (br $label2)
           )
           (unreachable)
          )
          (unreachable)
         )
        )
        (loop $label3
         (if
          (i32.eqz
           (global.get $global$10)
          )
          (then
           (global.set $global$10
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$10
          (i32.sub
           (global.get $global$10)
           (i32.const 1)
          )
         )
         (nop)
         (br $label3)
        )
        (local.set $7
         (local.set $6
          (local.set $8
           (local.set $12
            (local.set $9
             (local.set $10
              (unreachable)
             )
            )
           )
          )
         )
        )
       )
      )
      (unreachable)
     )
     (i64.const 15)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $42 (type $43) (param $0 arrayref) (param $1 i32) (param $2 i32) (param $3 i32) (result anyref)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f32)
  (local $11 v128)
  (local $12 i64)
  (local $13 i31ref)
  (local $14 (ref array))
  (local $15 exnref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (if (result (ref (exact $1)))
   (i32.const -127)
   (then
    (call $fimport$8
     (global.get $gimport$0)
    )
    (if (result (ref (exact $1)))
     (i32.const -23941)
     (then
      (nop)
      (return
       (ref.i31
        (i32.const -107)
       )
      )
     )
     (else
      (call $fimport$7
       (ref.func $42)
      )
      (struct.new_default $1)
     )
    )
   )
   (else
    (try_table (result (ref (exact $1)))
     (struct.new_default $1)
    )
   )
  )
 )
 (func $43 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $42
    (array.new_fixed $0 0)
    (i32.const -78)
    (i32.const -115)
    (i32.const 0)
   )
  )
 )
 (func $44 (type $44) (param $0 funcref) (param $1 i32) (param $2 (ref array)) (result f64 externref externref)
  (local $3 v128)
  (local $4 f64)
  (local $5 i64)
  (local $6 i31ref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 3
    (f64.const 4294967262)
    (string.const "\c2\a3\ed\a0\80")
    (string.const "\ed\bd\88\c2\a3")
   )
  )
 )
 (func $45 (type $45) (param $0 i64) (param $1 i64) (result externref)
  (local $2 f64)
  (local $3 i64)
  (local $4 externref)
  (local $5 (ref eq))
  (local $6 (ref struct))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (block (result (ref extern))
   (nop)
   (global.get $gimport$0)
  )
 )
 (func $46 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $45
    (i64.const -127)
    (i64.const -29)
   )
  )
  (drop
   (call $45
    (i64.const -470986051513)
    (i64.const 257)
   )
  )
  (drop
   (call $45
    (i64.const -31999)
    (i64.const 2147483647)
   )
  )
  (drop
   (call $45
    (i64.const 262144)
    (i64.const -118)
   )
  )
 )
 (func $47 (type $4) (param $0 externref)
  (local $1 i64)
  (local $2 i32)
  (local $3 f32)
  (local $4 i31ref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (block $block
   (drop
    (br_on_null $block
     (string.const "\ed\bd\88\ed\bd\88")
    )
   )
   (block $block2
    (if
     (i32.eqz
      (i32.const 128)
     )
     (then
      (block $block1
       (nop)
       (drop
        (i64.and
         (local.get $1)
         (i64.const 15)
        )
       )
       (drop
        (i64.and
         (i64.const 4182907199)
         (i64.const 15)
        )
       )
       (try_table (catch_all $block1)
        (br $block2)
       )
       (unreachable)
      )
     )
    )
   )
  )
 )
 (func $48 (type $15) (result i64)
  (local $0 i64)
  (local $1 i64)
  (local $2 f32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 f64)
  (local $10 (ref array))
  (local $11 (ref any))
  (local $12 (ref string))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (block $block3 (result i64)
   (call $fimport$8
    (try $__t_7 (result externref) (do
      (global.get $gimport$1)
     ) (catch $tag$0
(local.set $4 (i32.eqz (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_7)))
(string.const "327\f0\90\8d\88\c2\a3")) (catch_all
      (global.get $gimport$1)
     ))
   )
   (loop $label2
    (if
     (i32.eqz
      (global.get $global$10)
     )
     (then
      (global.set $global$10
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$10
     (i32.sub
      (global.get $global$10)
      (i32.const 1)
     )
    )
    (block $block
     (call $fimport$1
      (i32.eq
       (try $__t_6 (result i32) (do (try (result i32) (do 
         (i32x4.extract_lane 3
          (call $72
           (i16x8.extend_high_i8x16_u
            (call $72
             (f32x4.splat
              (call $70
               (f32.load offset=22 align=1
                (i64.and
                 (local.get $0)
                 (i64.const 15)
                )
               )
              )
             )
            )
           )
          )
         )
        ) (delegate $__t_6))) (catch_all (if (global.get $__rt) (then (rethrow $__t_6)))
(i32.atomic.rmw16.cmpxchg_u acqrel offset=3
          (i64.and
           (global.get $global$4)
           (i64.const 15)
          )
          (try_table (result i32) (catch_all $block)
           (i32.const -65536)
          )
          (ref.eq
           (array.new_fixed $0 0)
           (array.new_fixed $0 0)
          )
         )))
       (string.measure_wtf16
        (if (result (ref string))
         (i32.const -78)
         (then
          (if
           (i32.eqz
            (loop $label (result i32)
             (if
              (i32.eqz
               (global.get $global$10)
              )
              (then
               (global.set $global$10
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$10
              (i32.sub
               (global.get $global$10)
               (i32.const 1)
              )
             )
             (nop)
             (br_if $label
              (i32.const 33554432)
             )
             (i32.const -8)
            )
           )
           (then
            (block $block1
             (try_table (catch_all $block1)
              (nop)
             )
             (local.set $2
              (call $70
               (f32.load offset=22 align=2
                (i64.and
                 (i64.const -17179869184)
                 (i64.const 15)
                )
               )
              )
             )
            )
           )
           (else
            (try $__t_5  (do
              (nop)
             ) (catch_all (if (global.get $__rt) (then (rethrow $__t_5)))
(data.drop $0)))
            (call $fimport$1
             (i32.const -268435457)
            )
           )
          )
          (call $fimport$5
           (loop (result v128)
            (if
             (i32.eqz
              (global.get $global$10)
             )
             (then
              (global.set $global$10
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$10
             (i32.sub
              (global.get $global$10)
              (i32.const 1)
             )
            )
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
          )
          (string.const "\ed\a0\80")
         )
         (else
          (block $block2 (result (ref string))
           (call $fimport$2
            (try $__t_4 (result i64) (do
              (local.get $1)
             ) (catch $tag$0
(local.set $5 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_4)))
(drop
               (br_on_cast $block2 (ref string) (ref string)
                (string.const "\e2\82\ac\f0\90\8d\88\c2\a3")
               )
              )
(local.get $0)) (catch_all (if (global.get $__rt) (then (rethrow $__t_4)))
(br_if $block3
               (local.tee $0
                (local.get $1)
               )
               (i32.const -3533739)
              )))
           )
           (try $__t_3 (result (ref string)) (do (try (result (ref string)) (do 
             (string.const "\ed\bd\88\c2\a3916")
            ) (delegate $__t_3))) (catch $tag$0
(local.set $6 (i32.eqz (pop i32)))
(if (global.get $__rt) (then (rethrow $__t_3)))
(string.const "\f0\90\8d\88\ed\a0\80")) (catch_all
             (br_if $block2
              (loop (result (ref string))
               (if
                (i32.eqz
                 (global.get $global$10)
                )
                (then
                 (global.set $global$10
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$10
                (i32.sub
                 (global.get $global$10)
                 (i32.const 1)
                )
               )
               (loop $label1 (result (ref string))
                (if
                 (i32.eqz
                  (global.get $global$10)
                 )
                 (then
                  (global.set $global$10
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$10
                 (i32.sub
                  (global.get $global$10)
                  (i32.const 1)
                 )
                )
                (nop)
                (br_if $label1
                 (local.tee $7
                  (f32.le
                   (f32.const 2147483648)
                   (local.get $3)
                  )
                 )
                )
                (string.const "\e2\82\ac\f0\90\8d\88")
               )
              )
              (i32.eqz
               (i32.const -1048576)
              )
             )
            ))
          )
         )
        )
       )
      )
     )
     (nop)
    )
    (br_if $label2
     (i32.eqz
      (ref.is_null
       (struct.new_default $1)
      )
     )
    )
    (if
     (local.tee $7
      (i32.const 32768)
     )
     (then
      (block
       (if
        (i32.eqz
         (local.get $7)
        )
        (then
         (nop)
        )
       )
       (call $fimport$7
        (ref.func $9)
       )
       (return
        (local.get $0)
       )
      )
      (unreachable)
     )
     (else
      (call $fimport$1
       (ref.eq
        (try_table (result (ref array)) (catch_all $label2)
         (try_table (result (ref array)) (catch_all $label2)
          (global.get $global$2)
         )
        )
        (array.new_fixed $0 0)
       )
      )
      (atomic.fence acqrel)
      (f32.store offset=3 align=1
       (i64.and
        (i64.load32_s offset=22 align=1
         (i64.and
          (call $11
           (local.tee $12
            (string.const "")
           )
           (loop $label3 (result f64)
            (if
             (i32.eqz
              (global.get $global$10)
             )
             (then
              (global.set $global$10
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$10
             (i32.sub
              (global.get $global$10)
              (i32.const 1)
             )
            )
            (local.set $0
             (br_if $block3
              (local.get $1)
              (i32.eqz
               (i32.const 1)
              )
             )
            )
            (br_if $label3
             (i32.const 126)
            )
            (f64.const 41)
           )
           (local.get $9)
           (local.get $2)
          )
          (i64.const 15)
         )
        )
        (i64.const 15)
       )
       (block (result f32)
        (call $fimport$8
         (local.get $12)
        )
        (block (result f32)
         (f64.store offset=3 align=4
          (i64.and
           (i64.const 27194)
           (i64.const 15)
          )
          (f64.const 0)
         )
         (f32.const 15169)
        )
       )
      )
      (br $label2)
     )
    )
    (unreachable)
   )
   (unreachable)
  )
 )
 (@binaryen.js.called)
 (func $49 (type $46) (param $0 v128) (result i32)
  (local $1 f64)
  (local $2 f64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 v128)
  (local $8 v128)
  (local $9 v128)
  (local $10 i32)
  (local $11 i32)
  (local $12 anyref)
  (local $13 anyref)
  (local $14 eqref)
  (local $15 (ref array))
  (local.set $0
   (call $72
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (block $block
   (br_if $block
    (memory.atomic.notify offset=22
     (i64.and
      (i64.const -4294967295)
      (i64.const 15)
     )
     (i32.const -9)
    )
   )
   (i64.store8 offset=4
    (i64.and
     (i64x2.extract_lane 0
      (local.get $8)
     )
     (i64.const 15)
    )
    (i64.atomic.rmw16.xchg_u offset=22
     (i64.and
      (select
       (local.get $6)
       (local.tee $3
        (global.get $global$4)
       )
       (local.tee $10
        (i32.const -116)
       )
      )
      (i64.const 15)
     )
     (local.get $6)
    )
   )
  )
  (return
   (local.get $10)
  )
 )
 (func $50 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $49
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $51 (type $14) (result f32)
  (local $0 exnref)
  (local $1 f64)
  (local $2 v128)
  (local $3 i32)
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (loop (result f32)
   (if
    (i32.eqz
     (global.get $global$10)
    )
    (then
     (global.set $global$10
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$10
    (i32.sub
     (global.get $global$10)
     (i32.const 1)
    )
   )
   (block $block (result f32)
    (call $fimport$8
     (try $__t_2 (result externref) (do (try (result externref) (do 
       (global.get $gimport$1)
      ) (delegate $__t_2))) (catch $tag$0
       (local.set $3 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
       (try $__t_1 (result (ref string)) (do (try (result (ref string)) (do 
         (string.const "\f0\90\8d\88")
        ) (delegate $__t_1))) (catch $tag$0
(local.set $4 (i32.mul (pop i32) (i32.const -1)))
(if (global.get $__rt) (then (rethrow $__t_1)))
(string.const "")))
      ))
    )
    (try $__t_0 (result f32) (do (try (result f32) (do 
      (f32.const 2147483648)
     ) (delegate $__t_0))) (catch_all
      (br_if $block
       (f32.const 0)
       (i32.const 32768)
      )
     ))
   )
  )
 )
 (@binaryen.js.called)
 (func $52 (type $16) (result externref f32)
  (local $0 f64)
  (local $1 f64)
  (local $2 i64)
  (local $3 externref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$5
   (loop $label (result v128)
    (if
     (i32.eqz
      (global.get $global$10)
     )
     (then
      (global.set $global$10
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$10
     (i32.sub
      (global.get $global$10)
      (i32.const 1)
     )
    )
    (nop)
    (nop)
    (br_if $label
     (i32.const -1176503)
    )
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (return
   (tuple.make 2
    (ref.null noextern)
    (f32.const 4294967296)
   )
  )
 )
 (@binaryen.js.called)
 (func $53 (type $47) (result arrayref)
  (local $0 funcref)
  (local $1 eqref)
  (local $2 i31ref)
  (local $3 (ref array))
  (local $4 externref)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 f32)
  (local $10 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (array.new_fixed $0 0)
  )
 )
 (func $54 (type $48) (result eqref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (memory.init $1
   (i64.and
    (global.get $global$7)
    (i64.const 15)
   )
   (i32.const 22)
   (i32.const 5)
  )
  (return
   (struct.new_default $1)
  )
 )
 (func $55 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $54)
  )
 )
 (func $56 (type $8) (result v128)
  (local $0 f32)
  (local $1 f64)
  (local $2 i31ref)
  (local $3 i31ref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call_ref $2
   (ref.func $22)
  )
  (return
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
 )
 (func $57 (type $17) (result v128 arrayref funcref i32 i64 arrayref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (atomic.fence)
  (return
   (tuple.make 6
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (array.new_fixed $0 0)
    (ref.null nofunc)
    (i32.const 1)
    (i64.const 33554433)
    (array.new_fixed $0 0)
   )
  )
 )
 (func $58 (type $2)
  (local $scratch (tuple v128 arrayref funcref i32 i64 arrayref))
  (local $scratch_1 i64)
  (local $scratch_2 i32)
  (local $scratch_3 funcref)
  (local $scratch_4 arrayref)
  (local $scratch_5 v128)
  (local $scratch_6 (tuple v128 arrayref funcref i32 i64 arrayref))
  (local $scratch_7 i64)
  (local $scratch_8 i32)
  (local $scratch_9 funcref)
  (local $scratch_10 arrayref)
  (local $scratch_11 v128)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (block (result v128)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $57)
      )
     )
    )
    (drop
     (block (result arrayref)
      (local.set $scratch_4
       (tuple.extract 6 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result funcref)
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
           (block (result i64)
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
   (block (result v128)
    (local.set $scratch_11
     (tuple.extract 6 0
      (local.tee $scratch_6
       (call $57)
      )
     )
    )
    (drop
     (block (result arrayref)
      (local.set $scratch_10
       (tuple.extract 6 1
        (local.get $scratch_6)
       )
      )
      (drop
       (block (result funcref)
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
           (block (result i64)
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
 )
 (func $59 (type $49) (result (ref eq))
  (local $0 v128)
  (local $1 i31ref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (call $fimport$1
   (call $39
    (i64.const -32768)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (ref.eq
        (ref.null none)
        (array.new_fixed $0 0)
       )
      )
     )
     (unreachable)
    )
    (if (result (ref i31))
     (i32.eqz
      (i16x8.extract_lane_s 2
       (call $72
        (i8x16.min_s
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (local.tee $0
          (v128.const i32x4 0x02816e86 0xf42043c0 0xb8a9bfae 0xe49bffff)
         )
        )
       )
      )
     )
     (then
      (block $block1 (result (ref i31))
       (call $fimport$3
        (call $70
         (f32.load offset=22 align=2
          (i64.and
           (call_indirect $0 (type $15)
            (i32.const 10)
           )
           (i64.const 15)
          )
         )
        )
       )
       (br_on_non_null $block1
        (local.tee $1
         (loop (result (ref i31))
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (ref.i31
           (i32.const 32)
          )
         )
        )
       )
       (ref.i31
        (i32.const -32)
       )
      )
     )
     (else
      (ref.i31
       (i32.const -8)
      )
     )
    )
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (string.const "\ed\bd\88\e2\82\ac\e2\82\ac")
    (select
     (f64.const 11053)
     (f64.const 0)
     (ref.test (ref i31)
      (ref.i31
       (i32.const -39)
      )
     )
    )
   )
  )
  (throw $tag$0
   (i32.const -255)
  )
 )
 (func $60 (type $18) (result (ref struct))
  (local $0 (ref eq))
  (local $1 structref)
  (local $2 structref)
  (local $3 i31ref)
  (local $4 externref)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 v128)
  (local $11 v128)
  (local $12 f64)
  (local $13 f64)
  (local $14 i64)
  (local $15 i64)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (struct.new_default $1)
 )
 (func $61 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $60)
  )
 )
 (@binaryen.js.called)
 (func $62 (type $18) (result (ref struct))
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 f32)
  (local $16 f32)
  (local $17 f32)
  (local $18 f32)
  (local $19 anyref)
  (local $20 exnref)
  (local $21 i31ref)
  (local $22 arrayref)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (struct.new_default $1)
 )
 (func $63 (type $8) (result v128)
  (local $0 i32)
  (local $1 f64)
  (local $2 f64)
  (local $3 i64)
  (local $4 funcref)
  (local $5 externref)
  (local $6 stringref)
  (local $7 (ref eq))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $64 (type $50) (param $0 i64) (result (ref eq))
  (local $1 anyref)
  (local $2 externref)
  (local $3 eqref)
  (local $4 exnref)
  (local $5 (ref string))
  (local $6 arrayref)
  (local $7 (ref i31))
  (local $8 (ref array))
  (local $9 (ref array))
  (local $10 (ref array))
  (local $11 (ref none))
  (local $12 (ref none))
  (local $13 f32)
  (local $14 f32)
  (local $15 f32)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (local.set $7
   (ref.i31
    (i32.const -128)
   )
  )
  (if (result (ref i31))
   (block $block (result i32)
    (try_table (catch $tag$0 $block) (catch $tag$0 $block) (catch $tag$0 $block)
     (nop)
    )
    (drop
     (i64.const -633316541)
    )
    (block
     (nop)
     (loop $label
      (if
       (i32.eqz
        (global.get $global$10)
       )
       (then
        (global.set $global$10
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$10
       (i32.sub
        (global.get $global$10)
        (i32.const 1)
       )
      )
      (v128.store offset=22 align=2
       (i64.and
        (local.get $0)
        (i64.const 15)
       )
       (call $72
        (i64x2.extmul_high_i32x4_s
         (call $72
          (global.get $global$0)
         )
         (call $72
          (call_ref $8
           (ref.func $63)
          )
         )
        )
       )
      )
      (br_if $label
       (i32.eqz
        (local.tee $20
         (string.measure_wtf16
          (string.const "\c2\a3919")
         )
        )
       )
      )
      (block
       (nop)
       (block
        (nop)
        (br $label)
       )
       (unreachable)
      )
      (local.set $7
       (local.set $7
        (local.set $11
         (local.set $12
          (unreachable)
         )
        )
       )
      )
     )
     (unreachable)
    )
    (unreachable)
   )
   (then
    (local.get $7)
   )
   (else
    (local.get $7)
   )
  )
 )
 (func $65 (type $51) (result anyref)
  (local $0 f64)
  (local $1 f64)
  (local $2 v128)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 f32)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (throw_ref
   (ref.null noexn)
  )
 )
 (func $66 (type $52) (param $0 f64) (result i64 f64)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 v128)
  (local $14 (ref any))
  (local $15 (ref array))
  (local $16 (ref array))
  (local $17 (ref array))
  (local $18 (ref func))
  (local $19 arrayref)
  (local $20 (ref eq))
  (local $21 (ref string))
  (local $22 (ref string))
  (local $23 (ref string))
  (local $24 (ref none))
  (local $25 (ref $3))
  (local.set $0
   (call $71
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 2
    (i64.const -34)
    (f64.const 48)
   )
  )
 )
 (func $67 (type $53) (param $0 (ref eq)) (param $1 i32) (result (ref string))
  (local $2 i32)
  (local $3 f64)
  (local $4 anyref)
  (local $5 (ref eq))
  (local $6 funcref)
  (local $7 eqref)
  (local $8 eqref)
  (local $9 (ref struct))
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (string.const "\ed\bd\88")
 )
 (func $68 (type $2)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (drop
   (call $67
    (struct.new_default $1)
    (i32.const -9978)
   )
  )
 )
 (@binaryen.js.called)
 (func $69 (type $7) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 v128)
  (local $16 v128)
  (local $17 f64)
  (local $18 f64)
  (local $19 f32)
  (local $20 (ref eq))
  (local $21 (ref array))
  (local $22 (ref array))
  (local $23 arrayref)
  (local $24 structref)
  (local $25 funcref)
  (local $26 i31ref)
  (local $27 (ref struct))
  (local $28 (ref i31))
  (local $29 (ref string))
  (local $30 (ref string))
  (local $31 (ref string))
  (local $32 (ref none))
  (local $33 (ref $3))
  (local $34 (ref $3))
  (local $scratch i64)
  (local $scratch_36 i32)
  (local $scratch_37 (ref (exact $6)))
  (local $scratch_38 i64)
  (local $scratch_39 (ref (exact $1)))
  (local $scratch_40 i64)
  (local $scratch_41 i64)
  (if
   (i32.eqz
    (global.get $global$10)
   )
   (then
    (global.set $global$10
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$10
   (i32.sub
    (global.get $global$10)
    (i32.const 1)
   )
  )
  (local.set $21
   (array.new_fixed $0 0)
  )
  (if (result i32)
   (loop $label (result i32)
    (if
     (i32.eqz
      (global.get $global$10)
     )
     (then
      (global.set $global$10
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$10
     (i32.sub
      (global.get $global$10)
      (i32.const 1)
     )
    )
    (table.set $1
     (i32.const 1)
     (block $block (result (ref exn))
      (try_table (catch_all_ref $block)
       (block
        (table.set $1
         (i32.const 4)
         (loop (result (ref exn))
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (block $block1 (result (ref exn))
           (try_table (catch_all_ref $block1)
            (throw $tag$1)
           )
           (unreachable)
          )
         )
        )
        (call_indirect $0 (type $4)
         (try_table (result (ref string)) (catch_all $label)
          (string.const "\ed\bd\88")
         )
         (i32.const 7)
        )
        (return
         (local.get $1)
        )
       )
       (unreachable)
      )
      (unreachable)
     )
    )
    (block $block2
     (loop $label3
      (if
       (i32.eqz
        (global.get $global$10)
       )
       (then
        (global.set $global$10
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$10
       (i32.sub
        (global.get $global$10)
        (i32.const 1)
       )
      )
      (drop
       (block (result i64)
        (local.set $scratch
         (i64.const -124)
        )
        (drop
         (i64.const -2)
        )
        (local.get $scratch)
       )
      )
      (v128.store offset=3 align=2
       (i64.and
        (local.get $12)
        (i64.const 15)
       )
       (v128.const i32x4 0x5f000000 0x5f000000 0xc2ba0000 0x4f56312b)
      )
      (br_if $label3
       (i32.eqz
        (loop (result i32)
         (if
          (i32.eqz
           (global.get $global$10)
          )
          (then
           (global.set $global$10
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$10
          (i32.sub
           (global.get $global$10)
           (i32.const 1)
          )
         )
         (nop)
         (loop $label1
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (call_ref $2
           (ref.func $43)
          )
          (nop)
          (br_if $label1
           (i32.eqz
            (local.get $1)
           )
          )
          (loop $label2
           (if
            (i32.eqz
             (global.get $global$10)
            )
            (then
             (global.set $global$10
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$10
            (i32.sub
             (global.get $global$10)
             (i32.const 1)
            )
           )
           (nop)
           (i64.atomic.store8 offset=3
            (i64.and
             (local.get $9)
             (i64.const 15)
            )
            (local.tee $12
             (local.tee $12
              (i64x2.extract_lane 1
               (call $72
                (i16x8.ge_u
                 (local.get $16)
                 (local.get $16)
                )
               )
              )
             )
            )
           )
           (br_if $label2
            (local.tee $2
             (ref.eq
              (local.tee $21
               (local.tee $21
                (local.get $21)
               )
              )
              (block (result arrayref)
               (drop
                (br_on_null $label2
                 (ref.i31
                  (i32.const -2147483648)
                 )
                )
               )
               (drop
                (br_on_null $label1
                 (ref.func $69)
                )
               )
               (local.tee $23
                (local.get $21)
               )
              )
             )
            )
           )
          )
         )
         (block
          (block
           (table.set $0
            (i32.const 3)
            (local.get $25)
           )
           (br $block2)
          )
          (local.set $21
           (unreachable)
          )
         )
         (unreachable)
        )
       )
      )
     )
     (call $fimport$0
      (i32.const -100)
     )
    )
    (br_if $label
     (if (result i32)
      (block (result i32)
       (local.set $scratch_36
        (i32.const 32767)
       )
       (drop
        (i64.const 134)
       )
       (local.get $scratch_36)
      )
      (then
       (call $fimport$0
        (i32.const 0)
       )
       (drop
        (i64.load16_s offset=22
         (i64.and
          (i64.load offset=22 align=1
           (i64.and
            (i64.xor
             (loop (result i64)
              (if
               (i32.eqz
                (global.get $global$10)
               )
               (then
                (global.set $global$10
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$10
               (i32.sub
                (global.get $global$10)
                (i32.const 1)
               )
              )
              (i64.mul
               (if (result i64)
                (i32.eqz
                 (local.get $2)
                )
                (then
                 (i64.const -256)
                )
                (else
                 (i64.const -48)
                )
               )
               (local.get $12)
              )
             )
             (global.get $global$7)
            )
            (i64.const 15)
           )
          )
          (i64.const 15)
         )
        )
       )
       (drop
        (if (result (ref array))
         (f64.le
          (loop $label4 (result f64)
           (if
            (i32.eqz
             (global.get $global$10)
            )
            (then
             (global.set $global$10
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$10
            (i32.sub
             (global.get $global$10)
             (i32.const 1)
            )
           )
           (drop
            (block (result i64)
             (local.set $scratch_41
              (i64.const -1024)
             )
             (drop
              (block (result i64)
               (local.set $scratch_40
                (i64.const 144115188075855872)
               )
               (drop
                (block (result (ref (exact $1)))
                 (local.set $scratch_39
                  (struct.new_default $1)
                 )
                 (drop
                  (block (result i64)
                   (local.set $scratch_38
                    (i64.const -2147483648)
                   )
                   (drop
                    (block (result (ref (exact $6)))
                     (local.set $scratch_37
                      (ref.func $7)
                     )
                     (local.set $31
                      (string.const "\ed\a0\80")
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
               (local.get $scratch_40)
              )
             )
             (local.get $scratch_41)
            )
           )
           (call_indirect $0 (type $4)
            (ref.cast (ref string)
             (local.get $31)
            )
            (i32.const 7)
           )
           (br_if $label4
            (block (result i32)
             (nop)
             (local.get $2)
            )
           )
           (f64.const -2147483646)
          )
          (f64.const 0)
         )
         (then
          (local.set $18
           (local.tee $18
            (f64.const 0)
           )
          )
          (if
           (i32.eqz
            (global.get $global$10)
           )
           (then
            (global.set $global$10
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$10
           (i32.sub
            (global.get $global$10)
            (i32.const 1)
           )
          )
          (br $label)
         )
         (else
          (local.set $9
           (loop (result i64)
            (if
             (i32.eqz
              (global.get $global$10)
             )
             (then
              (global.set $global$10
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$10
             (i32.sub
              (global.get $global$10)
              (i32.const 1)
             )
            )
            (local.get $9)
           )
          )
          (ref.cast (ref array)
           (ref.cast (ref array)
            (local.get $21)
           )
          )
         )
        )
       )
       (drop
        (f32.le
         (f32.const 72057594037927936)
         (call $70
          (f32.load offset=22 align=2
           (i64.and
            (try_table (result i64) (catch_all $label)
             (local.get $10)
            )
            (i64.const 15)
           )
          )
         )
        )
       )
       (drop
        (local.get $12)
       )
       (drop
        (f32.const 4294967296)
       )
       (loop
        (if
         (i32.eqz
          (global.get $global$10)
         )
         (then
          (global.set $global$10
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$10
         (i32.sub
          (global.get $global$10)
          (i32.const 1)
         )
        )
        (br $label)
       )
       (local.set $32
        (local.set $29
         (local.set $28
          (local.set $27
           (unreachable)
          )
         )
        )
       )
      )
      (else
       (nop)
       (if (result i32)
        (i32.eqz
         (i32.const 16777216)
        )
        (then
         (i32.trunc_f32_u
          (f32.const 2199023255552)
         )
        )
        (else
         (i32.const 76)
        )
       )
      )
     )
    )
    (local.get $1)
   )
   (then
    (local.get $1)
   )
   (else
    (i32.const 65535)
   )
  )
 )
 (func $70 (type $54) (param $0 f32) (result f32)
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
 (func $71 (type $55) (param $0 f64) (result f64)
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
 (func $72 (type $56) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param i32) (result i32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
 (global $__rt (mut i32) (i32.const 0))
)
