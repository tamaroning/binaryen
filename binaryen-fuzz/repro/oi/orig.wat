(module
 (type $0 (array i8))
 (type $1 (struct))
 (type $2 (func))
 (type $3 (func (param v128 f64 f32 f64 stringref i32 v128) (result funcref)))
 (type $4 (func (param i64 f64 exnref) (result i32)))
 (type $5 (func (param i32 f64) (result structref)))
 (type $6 (func (param i32)))
 (type $7 (array (mut i16)))
 (type $8 (func (result f32)))
 (type $9 (func (param externref)))
 (type $10 (func (param f32)))
 (type $11 (func (param v128)))
 (type $12 (func (param i32) (result i32)))
 (type $13 (func (result i64)))
 (type $14 (func (param (ref struct))))
 (type $15 (func (param i64)))
 (type $16 (func (param f64)))
 (type $17 (func (param anyref)))
 (type $18 (func (param funcref)))
 (type $19 (func (param funcref i32)))
 (type $20 (func (param v128) (result externref f64 structref i64 i31ref)))
 (type $21 (func (result funcref)))
 (type $22 (func (param structref (ref struct) i32 i64 f64 eqref arrayref (ref struct)) (result f32)))
 (type $23 (func (result v128)))
 (type $24 (func (param f64 arrayref f32 i64 v128) (result i64 anyref f64 funcref)))
 (type $25 (func (param funcref stringref stringref arrayref i64)))
 (type $26 (func (param exnref) (result i64)))
 (type $27 (func (param i32 f64)))
 (type $28 (func (param f32) (result arrayref)))
 (type $29 (func (param anyref (ref eq) anyref externref arrayref v128 eqref) (result i64)))
 (type $30 (func (result externref v128 externref i64 i64)))
 (type $31 (func (result f64)))
 (type $32 (func (param f64) (result (ref array))))
 (type $33 (func (param i32) (result i64)))
 (type $34 (func (param arrayref arrayref f32) (result f64)))
 (type $35 (func (param f32 stringref)))
 (type $36 (func (param stringref) (result f32)))
 (type $37 (func (result exnref)))
 (type $38 (func (param i64 stringref) (result (ref array))))
 (type $39 (func (result f32 f64 funcref f64)))
 (type $40 (func (param f32) (result f32)))
 (type $41 (func (param f64) (result f64)))
 (type $42 (func (param v128) (result v128)))
 (type $43 (func (result i64 (ref i31) f64 (ref (exact $4)))))
 (type $44 (func (result (ref extern) v128 (ref string) i64 i64)))
 (type $45 (func (result (ref exn) (ref (exact $1)) f64)))
 (type $46 (func (result i64 nullref (ref (exact $5)) i32)))
 (import "__fuzz_import" "extern$" (global $extern$ externref))
 (import "__fuzz_import" "extern$_3" (global $extern$_3 (ref extern)))
 (import "fuzzing-support" "throw" (func $throw (type $6) (param i32)))
 (import "fuzzing-support" "log-i32" (func $log-i32 (type $6) (param i32)))
 (import "fuzzing-support" "log-i64" (func $log-i64 (type $15) (param i64)))
 (import "fuzzing-support" "log-f32" (func $log-f32 (type $10) (param f32)))
 (import "fuzzing-support" "log-f64" (func $log-f64 (type $16) (param f64)))
 (import "fuzzing-support" "log-v128" (func $log-v128 (type $11) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $log-anyref (type $17) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $log-funcref (type $18) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $log-externref (type $9) (param externref)))
 (import "fuzzing-support" "call-export-catch" (func $call-export-catch (type $12) (param i32) (result i32)))
 (import "fuzzing-support" "call-ref" (func $call-ref (type $19) (param funcref i32)))
 (import "fuzzing-support" "wasmtag" (tag $wasmtag (type $6) (param i32)))
 (import "fuzzing-support" "jstag" (tag $jstag (type $9) (param externref)))
 (global $global$ (ref string) (string.const "\ed\a0\80"))
 (global $global$_1 (mut externref) (string.const "\c2\a3\ed\bd\88"))
 (global $hangLimit (mut i32) (i32.const 19))
 (memory $0 i64 16 16 shared)
 (data $0 "\dc")
 (data $1 "\ca\9b0\c4.\15\8d\06dU")
 (data $2 "!")
 (data $3 "\'\c7\de\b9\97\a2j\95\0e")
 (data $4 " \c5\0e\e1z")
 (data $5 "\99M\ff\dd")
 (data $6 "\e7\b3\edFGHV>\96\f7%)\1b\de]")
 (table $fuzzing_table i64 18 18 funcref)
 (table $exnref_table 7 7 exnref)
 (elem $elem$ (table $fuzzing_table) (i64.const 0) func $func_18 $func_18 $func_23 $func_24 $func_24 $func_24 $func_24 $func_24 $func_24 $func_29 $func_34 $func_34 $func_35 $func_35 $func_38 $func_41 $func_48 $func_50)
 (elem declare func $call-ref $func_12_invoker $func_16 $func_16_invoker $func_42 $func_44 $func_51 $log-f32 $log-v128)
 (tag $tag$ (type $14) (param (ref struct)))
 (tag $tag$_1 (type $6) (param i32))
 (tag $tag$_4 (type $2))
 (export "global$" (global $global$))
 (export "tag$" (tag $tag$))
 (export "tag$_1" (tag $tag$_1))
 (export "jstag" (tag $jstag))
 (export "func" (func $func))
 (export "func_12" (func $func_12))
 (export "func_12_invoker" (func $func_12_invoker))
 (export "func_14_invoker" (func $func_14_invoker))
 (export "func_16" (func $func_16))
 (export "func_16_invoker" (func $func_16_invoker))
 (export "func_18" (func $func_18))
 (export "func_18_invoker" (func $func_18_invoker))
 (export "func_20_invoker" (func $func_20_invoker))
 (export "func_23" (func $func_23))
 (export "func_26" (func $func_26))
 (export "func_27_invoker" (func $func_27_invoker))
 (export "func_30_invoker" (func $func_30_invoker))
 (export "func_32" (func $func_32))
 (export "func_32_invoker" (func $func_32_invoker))
 (export "func_35" (func $func_35))
 (export "func_36_invoker" (func $func_36_invoker))
 (export "func_38_invoker" (func $func_38_invoker))
 (export "func_40" (func $func_40))
 (export "func_42" (func $func_42))
 (export "func_44_invoker" (func $func_44_invoker))
 (export "func_46" (func $func_46))
 (export "func_46_invoker" (func $func_46_invoker))
 (export "func_49" (func $func_49))
 (export "func_51" (func $func_51))
 (func $func (type $12) (param $0 i32) (result i32)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (ref.eq
   (ref.cast nullref
    (ref.null none)
   )
   (array.new_fixed $0 0)
  )
 )
 (func $func_12 (type $20) (param $0 v128) (result externref f64 structref i64 i31ref)
  (local $1 f32)
  (local $2 (tuple f64 f64 arrayref))
  (local $3 f32)
  (local $4 f32)
  (local $5 structref)
  (local $6 f64)
  (local $7 i32)
  (local $8 funcref)
  (local.set $0
   (call $deNan128
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 5
    (global.get $extern$)
    (f64.const 93)
    (struct.new_default $1)
    (i64.const 111)
    (ref.null none)
   )
  )
 )
 (func $func_12_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (tuple.drop 5
   (call $func_12
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (tuple.drop 5
   (call $func_12
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $func_14 (type $21) (result funcref)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (ref.null nofunc)
 )
 (func $func_14_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_14)
  )
  (drop
   (call $func_14)
  )
 )
 (func $func_16 (type $3) (param $0 v128) (param $1 f64) (param $2 f32) (param $3 f64) (param $4 stringref) (param $5 i32) (param $6 v128) (result funcref)
  (local $7 f64)
  (local $8 (ref struct))
  (local $9 eqref)
  (local $10 (ref eq))
  (local $11 i64)
  (local $12 i64)
  (local $13 nullref)
  (local $14 i32)
  (local.set $0
   (call $deNan128
    (local.get $0)
   )
  )
  (local.set $1
   (call $deNan64
    (local.get $1)
   )
  )
  (local.set $2
   (call $deNan32
    (local.get $2)
   )
  )
  (local.set $3
   (call $deNan64
    (local.get $3)
   )
  )
  (local.set $6
   (call $deNan128
    (local.get $6)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result (ref (exact $3)))
   (i64.store16 offset=4
    (i64.and
     (i64.const -131072)
     (i64.const 15)
    )
    (i64.atomic.load acqrel offset=22
     (i64.and
      (i32.load offset=22 align=1
       (i64.and
        (i64x2.extract_lane 1
         (if
          (i31.get_s
           (ref.as_non_null
            (ref.null none)
           )
          )
          (then
           (block $label$1
            (nop)
            (block $label$2
             (try
              (do
               (nop)
              )
              (catch $tag$
               (drop (pop (ref struct)))
               (if
                (stringview_wtf16.get_codeunit
                 (block $label$3
                  (call $throw
                   (i32.const 0)
                  )
                  (br $label$2)
                 )
                 (select
                  (i32.load8_s offset=22
                   (i64.and
                    (local.tee $11
                     (local.tee $12
                      (i64.const -32768)
                     )
                    )
                    (i64.const 15)
                   )
                  )
                  (block (result i32)
                   (drop
                    (br_on_null $label$2
                     (struct.new_default $1)
                    )
                   )
                   (i32.const -4996)
                  )
                  (ref.test eqref
                   (local.tee $9
                    (local.tee $10
                     (array.new_fixed $0 0)
                    )
                   )
                  )
                 )
                )
                (then
                 (block $label$4
                  (local.set $5
                   (local.tee $5
                    (local.get $5)
                   )
                  )
                  (table.set $fuzzing_table
                   (i64.const 4)
                   (if
                    (i32.eqz
                     (local.get $5)
                    )
                    (then
                     (block $label$5
                      (call $throw
                       (i32.const -2147483647)
                      )
                      (br $label$2)
                     )
                    )
                    (else
                     (block $label$6
                      (call $log-funcref
                       (ref.func $func_16)
                      )
                      (br $label$4)
                     )
                    )
                   )
                  )
                 )
                )
                (else
                 (block $label$7
                  (drop
                   (br_on_null $label$2
                    (local.tee $13
                     (loop $label$8 (result (ref none))
                      (if
                       (i32.eqz
                        (global.get $hangLimit)
                       )
                       (then
                        (global.set $hangLimit
                         (i32.const 19)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $hangLimit
                       (i32.sub
                        (global.get $hangLimit)
                        (i32.const 1)
                       )
                      )
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                   )
                  )
                  (drop
                   (br_on_cast_fail $label$0 (ref (exact $3)) (ref (exact $3))
                    (if (result (ref (exact $3)))
                     (i32.atomic.load acqrel
                      (i64.const -9813093272037612)
                     )
                     (then
                      (ref.func $func_16)
                     )
                     (else
                      (ref.func $func_16)
                     )
                    )
                   )
                  )
                  (memory.init $1
                   (i64.and
                    (local.get $12)
                    (i64.const 15)
                   )
                   (i32.const 3)
                   (i32.const 1)
                  )
                 )
                )
               )
              )
              (catch $tag$_1
               (local.set $14 (call $__popsink_0 (pop i32)))
               (call $log-anyref
                (select (result (ref eq))
                 (loop $label$9 (result (ref i31))
                  (if
                   (i32.eqz
                    (global.get $hangLimit)
                   )
                   (then
                    (global.set $hangLimit
                     (i32.const 19)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $hangLimit
                   (i32.sub
                    (global.get $hangLimit)
                    (i32.const 1)
                   )
                  )
                  (if
                   (i32.eqz
                    (global.get $hangLimit)
                   )
                   (then
                    (global.set $hangLimit
                     (i32.const 19)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $hangLimit
                   (i32.sub
                    (global.get $hangLimit)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label$9
                   (i32.eqz
                    (local.get $5)
                   )
                  )
                  (ref.i31
                   (i32.const 1048576)
                  )
                 )
                 (struct.new_default $1)
                 (i32.atomic.load8_u offset=22
                  (i64.and
                   (local.get $12)
                   (i64.const 15)
                  )
                 )
                )
               )
              )
              (catch_all
               (nop)
              )
             )
            )
            (return
             (ref.func $func_12_invoker)
            )
           )
          )
          (else
           (block $label$11
            (if
             (i32.eqz
              (global.get $hangLimit)
             )
             (then
              (global.set $hangLimit
               (i32.const 19)
              )
              (unreachable)
             )
            )
            (global.set $hangLimit
             (i32.sub
              (global.get $hangLimit)
              (i32.const 1)
             )
            )
            (nop)
            (return
             (ref.func $func_16)
            )
           )
          )
         )
        )
        (i64.const 15)
       )
      )
      (i64.const 15)
     )
    )
   )
   (ref.func $func_16)
  )
 )
 (func $func_16_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_16
    (v128.const i32x4 0xafe08690 0x2a003e02 0xa407807f 0xc216fffe)
    (f64.const 4194303.921)
    (f32.const 288230376151711744)
    (f64.const 0)
    (string.const "\ed\a0\80\ed\a0\80\ed\a0\80")
    (i32.const -36)
    (v128.const i32x4 0x918b00fe 0x00ad0021 0xb2017788 0x4e0e80eb)
   )
  )
  (drop
   (call $func_16
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (f64.const 0.675)
    (f32.const 0)
    (f64.const -1)
    (string.const "933\ed\a0\80")
    (i32.const -65535)
    (v128.const i32x4 0x40000000 0x00000000 0x20000000 0x00000000)
   )
  )
  (drop
   (call $func_16
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (f64.const -1797693134862315708145274e284)
    (f32.const -7)
    (f64.const 70368744177663)
    (string.const "\ed\bd\88\c2\a3")
    (i32.const -256)
    (v128.const i32x4 0x00010001 0x0001ffff 0x0000b538 0x0000e000)
   )
  )
 )
 (func $func_18 (type $4) (param $0 i64) (param $1 f64) (param $2 exnref) (result i32)
  (local $3 f64)
  (local.set $1
   (call $deNan64
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (ref.test (ref (exact $4))
   (ref.func $func_18)
  )
 )
 (func $func_18_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_18
    (i64.const 4294948967)
    (f64.const 0)
    (block $label$0 (result (ref exn))
     (try_table (catch_all_ref $label$0)
      (throw $tag$
       (struct.new_default $1)
      )
     )
    )
   )
  )
 )
 (func $func_20 (type $22) (param $0 structref) (param $1 (ref struct)) (param $2 i32) (param $3 i64) (param $4 f64) (param $5 eqref) (param $6 arrayref) (param $7 (ref struct)) (result f32)
  (local $8 v128)
  (local $9 i64)
  (local $10 f32)
  (local $11 i32)
  (local.set $4
   (call $deNan64
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $deNan32
   (f32x4.extract_lane 2
    (try (result v128)
     (do
      (loop $label$0 (result v128)
       (if
        (i32.eqz
         (global.get $hangLimit)
        )
        (then
         (global.set $hangLimit
          (i32.const 19)
         )
         (unreachable)
        )
       )
       (global.set $hangLimit
        (i32.sub
         (global.get $hangLimit)
         (i32.const 1)
        )
       )
       (br_if $label$0
        (i32.const -84)
       )
       (nop)
       (call_ref $11
        (call $deNan128
         (v128.load offset=22 align=8
          (i64.and
           (local.get $3)
           (i64.const 15)
          )
         )
        )
        (ref.func $log-v128)
       )
       (br_if $label$0
        (ref.eq
         (loop $label$3 (result (ref i31))
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (block $label$5
           (try_table (catch_all $label$5)
            (throw $tag$_4)
           )
          )
          (call $throw
           (i32.const -65)
          )
          (br_if $label$3
           (i32.const 268435456)
          )
          (ref.i31
           (i32.const 127)
          )
         )
         (block $label$6 (result (ref (exact $0)))
          (nop)
          (array.new_fixed $0 0)
         )
        )
       )
       (v128.const i32x4 0x855c9800 0xb10019fe 0x01015e2a 0x00be3700)
      )
     )
     (catch $tag$_1
      (local.set $11 (i32.mul (pop i32) (i32.const -1)))
      (local.get $8)
     )
     (catch_all
      (local.get $8)
     )
    )
   )
  )
 )
 (func $func_20_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $deNan32
    (call $func_20
     (ref.null none)
     (struct.new_default $1)
     (i32.const -65535)
     (i64.const 1152921504606846977)
     (f64.const 4294967295)
     (struct.new_default $1)
     (array.new_fixed $0 0)
     (struct.new_default $1)
    )
   )
  )
  (drop
   (call $deNan32
    (call $func_20
     (struct.new_default $1)
     (struct.new_default $1)
     (i32.const 65535)
     (i64.const -4294967295)
     (f64.const 65514)
     (array.new_fixed $0 0)
     (array.new_fixed $0 0)
     (struct.new_default $1)
    )
   )
  )
  (drop
   (call $deNan32
    (call $func_20
     (struct.new_default $1)
     (struct.new_default $1)
     (i32.const 22)
     (i64.const 139)
     (f64.const 0)
     (ref.null none)
     (array.new_fixed $0 0)
     (struct.new_default $1)
    )
   )
  )
 )
 (func $func_22 (type $8) (result f32)
  (local $0 (tuple f64 i32))
  (local $1 arrayref)
  (local $2 i32)
  (local $3 (ref array))
  (local $4 i32)
  (local $5 i32)
  (local $6 f64)
  (local $7 exnref)
  (local $8 (ref eq))
  (local $9 (tuple i31ref externref i32 i32))
  (local $10 (ref i31))
  (local $11 structref)
  (local $12 (ref exn))
  (local $13 (ref struct))
  (local $14 i64)
  (local $15 (ref string))
  (local $16 funcref)
  (local $17 (ref string))
  (local $18 (ref $7))
  (local $19 (tuple f64 v128 stringref i64 i32 v128))
  (local $20 (ref struct))
  (local $21 i32)
  (local $22 stringref)
  (local $23 f32)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (local.set $17
   (string.const "")
  )
  (f32.const 24)
 )
 (func $func_23 (type $23) (result v128)
  (local $0 (tuple i32 f64 i32))
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (return
   (v128.const i32x4 0x00100001 0x00000000 0x00000000 0xe0000000)
  )
 )
 (func $func_24 (type $24) (param $0 f64) (param $1 arrayref) (param $2 f32) (param $3 i64) (param $4 v128) (result i64 anyref f64 funcref)
  (local $5 externref)
  (local $6 f64)
  (local $7 i32)
  (local $8 (tuple i64 i64))
  (local $9 (tuple f64 eqref f32 i32))
  (local.set $0
   (call $deNan64
    (local.get $0)
   )
  )
  (local.set $2
   (call $deNan32
    (local.get $2)
   )
  )
  (local.set $4
   (call $deNan128
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (tuple.make 4
   (i64.const -2147483648)
   (ref.i31
    (i32.const 15)
   )
   (f64.const 0)
   (ref.func $func_18)
  )
 )
 (func $func_25 (type $25) (param $0 funcref) (param $1 stringref) (param $2 stringref) (param $3 arrayref) (param $4 i64)
  (local $5 (tuple i64 i64))
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $log-f32
   (f32.const 9223372036854775808)
  )
 )
 (func $func_26 (type $26) (param $0 exnref) (result i64)
  (local $1 (tuple f32 i64 i64))
  (local $2 funcref)
  (local $3 (tuple stringref f64 funcref))
  (local $4 (ref eq))
  (local $5 (tuple f64 f64))
  (local $6 (tuple anyref i64))
  (local $7 i64)
  (local $8 structref)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result i64)
   (nop)
   (i64.const 127)
  )
 )
 (func $func_27 (type $27) (param $0 i32) (param $1 f64)
  (local $2 f32)
  (local $3 v128)
  (local $4 externref)
  (local $5 i64)
  (local $6 i64)
  (local $7 (tuple f64 i64 v128))
  (local $8 v128)
  (local $9 funcref)
  (local $10 (tuple v128 structref i32 i32 i32))
  (local $11 (ref string))
  (local $12 f32)
  (local $13 f32)
  (local $14 exnref)
  (local $15 f32)
  (local.set $1
   (call $deNan64
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $throw
   (i32.const -1)
  )
  (nop)
 )
 (func $func_27_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $func_27
   (i32.const 0)
   (f64.const 2305843009213693952)
  )
  (call $func_27
   (i32.const -65537)
   (f64.const 70368744177664.1)
  )
  (call $func_27
   (i32.const 255)
   (f64.const 4294967252)
  )
  (call $func_27
   (i32.const -107)
   (f64.const -0)
  )
  (call $func_27
   (i32.const 127)
   (f64.const 248)
  )
 )
 (func $func_29 (type $28) (param $0 f32) (result arrayref)
  (local $1 f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 funcref)
  (local $5 v128)
  (local $6 (ref string))
  (local $7 (ref extern))
  (local $8 (ref extern))
  (local $9 i32)
  (local $10 (ref eq))
  (local $11 externref)
  (local $12 externref)
  (local.set $0
   (call $deNan32
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (local.set $6
   (string.const "\e2\82\ac\c2\a3\ed\a0\80")
  )
  (block $label$0 (result (ref (exact $0)))
   (call $log-externref
    (block $label$1 (result externref)
     (br_on_non_null $label$1
      (ref.null noextern)
     )
     (f32.store offset=22 align=2
      (i64.and
       (i64.atomic.rmw32.cmpxchg_u offset=4
        (i64.and
         (local.tee $3
          (i64.trunc_f64_s
           (f64.const 0)
          )
         )
         (i64.const 15)
        )
        (if (result i64)
         (i32.eqz
          (i32.const -2147483648)
         )
         (then
          (block $label$2 (result i64)
           (br_on_non_null $label$1
            (local.tee $7
             (local.tee $8
              (string.const "\e2\82\ac\e2\82\ac")
             )
            )
           )
           (drop
            (array.new_fixed $0 0)
           )
           (call $log-i32
            (ref.eq
             (i64x2.all_true
              (block $label$3
               (call $log-funcref
                (ref.func $func_29)
               )
               (return
                (ref.null none)
               )
              )
             )
             (block $label$4
              (call $log-i64
               (loop $label$5
                (if
                 (i32.eqz
                  (global.get $hangLimit)
                 )
                 (then
                  (global.set $hangLimit
                   (i32.const 19)
                  )
                  (unreachable)
                 )
                )
                (global.set $hangLimit
                 (i32.sub
                  (global.get $hangLimit)
                  (i32.const 1)
                 )
                )
                (return
                 (array.new_fixed $0 0)
                )
               )
              )
              (return
               (array.new_fixed $0 0)
              )
             )
            )
           )
           (i64.const 2147483649)
          )
         )
         (else
          (block $label$7
           (nop)
           (return
            (array.new_fixed $0 0)
           )
          )
         )
        )
        (try_table (result i64)
         (drop
          (br_on_cast $label$1 (ref extern) (ref extern)
           (local.tee $8
            (global.get $extern$_3)
           )
          )
         )
         (local.tee $3
          (i64.shl
           (loop $label$8 (result i64)
            (if
             (i32.eqz
              (global.get $hangLimit)
             )
             (then
              (global.set $hangLimit
               (i32.const 19)
              )
              (unreachable)
             )
            )
            (global.set $hangLimit
             (i32.sub
              (global.get $hangLimit)
              (i32.const 1)
             )
            )
            (block $label$9
             (i64.atomic.store acqrel offset=22
              (i64.and
               (i64.atomic.rmw8.xor_u acqrel offset=22
                (i64.and
                 (i64.extend_i32_s
                  (i32.const 8388608)
                 )
                 (i64.const 15)
                )
                (loop $label$10 (result i64)
                 (if
                  (i32.eqz
                   (global.get $hangLimit)
                  )
                  (then
                   (global.set $hangLimit
                    (i32.const 19)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $hangLimit
                  (i32.sub
                   (global.get $hangLimit)
                   (i32.const 1)
                  )
                 )
                 (call $throw
                  (i32.const -32767)
                 )
                 (br_if $label$10
                  (local.get $9)
                 )
                 (try_table (result i64) (catch_all $label$9)
                  (local.get $3)
                 )
                )
               )
               (i64.const 15)
              )
              (i64.const 8)
             )
             (call $log-v128
              (local.get $5)
             )
            )
            (br_if $label$8
             (i32.eqz
              (local.tee $9
               (local.get $9)
              )
             )
            )
            (drop
             (br_on_cast $label$1 (ref string) (ref string)
              (string.const "\c2\a3")
             )
            )
            (if (result i64)
             (i32.eqz
              (ref.eq
               (ref.i31
                (i32.const 176)
               )
               (ref.i31
                (i32.const 121)
               )
              )
             )
             (then
              (block $label$11 (result i64)
               (call $log-v128
                (if (result v128)
                 (i32.eqz
                  (local.get $9)
                 )
                 (then
                  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                 )
                 (else
                  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                 )
                )
               )
               (i64.const 4290249023)
              )
             )
             (else
              (block $label$12
               (return
                (array.new_fixed $0 0)
               )
              )
             )
            )
           )
           (i64x2.extract_lane 0
            (loop $label$13 (result v128)
             (if
              (i32.eqz
               (global.get $hangLimit)
              )
              (then
               (global.set $hangLimit
                (i32.const 19)
               )
               (unreachable)
              )
             )
             (global.set $hangLimit
              (i32.sub
               (global.get $hangLimit)
               (i32.const 1)
              )
             )
             (nop)
             (call $log-externref
              (block $label$15 (result externref)
               (local.set $9
                (call_indirect $fuzzing_table (type $4)
                 (local.get $3)
                 (f64.const 4294967171)
                 (block $label$16 (result (ref exn))
                  (try_table (catch_all_ref $label$16)
                   (throw $tag$_1
                    (local.get $9)
                   )
                  )
                 )
                 (i64.const 0)
                )
               )
               (local.tee $11
                (local.tee $12
                 (ref.cast (ref string)
                  (local.get $6)
                 )
                )
               )
              )
             )
             (br_if $label$13
              (i32.eqz
               (local.get $9)
              )
             )
             (local.get $5)
            )
           )
          )
         )
        )
       )
       (i64.const 15)
      )
      (call $deNan32
       (f32.reinterpret_i32
        (f64.gt
         (local.tee $1
          (call $deNan64
           (tuple.extract 4 0
            (tuple.make 4
             (f64.const -2.2250738585072014e-308)
             (i64.const -2305843009213693952)
             (string.const "\ed\bd\88\e2\82\ac")
             (i64.const -16383)
            )
           )
          )
         )
         (loop $label$17 (result f64)
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (drop
           (br_on_cast $label$0 (ref (exact $0)) (ref (exact $0))
            (array.new_fixed $0 0)
           )
          )
          (f64.const -1797693134862315708145274e284)
         )
        )
       )
      )
     )
     (call $log-funcref
      (ref.func $call-ref)
     )
     (local.get $12)
    )
   )
   (array.new_fixed $0 0)
  )
 )
 (func $func_30 (type $29) (param $0 anyref) (param $1 (ref eq)) (param $2 anyref) (param $3 externref) (param $4 arrayref) (param $5 v128) (param $6 eqref) (result i64)
  (local $7 i64)
  (local $8 structref)
  (local $9 f32)
  (local.set $5
   (call $deNan128
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (loop $label$0 (result i64)
   (if
    (i32.eqz
     (global.get $hangLimit)
    )
    (then
     (global.set $hangLimit
      (i32.const 19)
     )
     (unreachable)
    )
   )
   (global.set $hangLimit
    (i32.sub
     (global.get $hangLimit)
     (i32.const 1)
    )
   )
   (i64.const -16777215)
  )
 )
 (func $func_30_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_30
    (ref.i31
     (i32.const -16777217)
    )
    (ref.i31
     (i32.const 65475)
    )
    (ref.i31
     (i32.const 65536)
    )
    (ref.null noextern)
    (array.new_fixed $0 0)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (ref.i31
     (i32.const -1)
    )
   )
  )
 )
 (func $func_32 (type $13) (result i64)
  (local $0 i32)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result i64)
   (nop)
   (br_if $label$0
    (i64.const 9223372036854775806)
    (loop $label$1 (result i32)
     (if
      (i32.eqz
       (global.get $hangLimit)
      )
      (then
       (global.set $hangLimit
        (i32.const 19)
       )
       (unreachable)
      )
     )
     (global.set $hangLimit
      (i32.sub
       (global.get $hangLimit)
       (i32.const 1)
      )
     )
     (atomic.fence)
     (nop)
     (br_if $label$1
      (loop $label$3 (result i32)
       (if
        (i32.eqz
         (global.get $hangLimit)
        )
        (then
         (global.set $hangLimit
          (i32.const 19)
         )
         (unreachable)
        )
       )
       (global.set $hangLimit
        (i32.sub
         (global.get $hangLimit)
         (i32.const 1)
        )
       )
       (nop)
       (br_if $label$3
        (local.tee $0
         (i32.eqz
          (i32.const -841679)
         )
        )
       )
       (i32.const 13)
      )
     )
     (drop
      (string.encode_wtf16_array
       (string.const "\ed\bd\88")
       (array.new $7
        (i32.const -30361)
        (i32.and
         (i32.const 13)
         (i32.const 1023)
        )
       )
       (string.encode_wtf16_array
        (string.const "\e2\82\ac55\ed\bd\88")
        (array.new $7
         (i32.const -120)
         (i32.and
          (i32.const 1)
          (i32.const 1023)
         )
        )
        (i32.const -65536)
       )
      )
     )
     (local.get $0)
    )
   )
  )
 )
 (func $func_32_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_32)
  )
 )
 (func $func_34 (type $8) (result f32)
  (local $0 arrayref)
  (local $1 (tuple stringref funcref i32 f64))
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (return
   (f32.const 0)
  )
 )
 (func $func_35 (type $30) (result externref v128 externref i64 i64)
  (local $0 (tuple v128 i32 i32))
  (local $1 exnref)
  (local $2 structref)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (tuple.make 5
   (global.get $extern$_3)
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (string.const "\e2\82\ac66")
   (i64.const 16982)
   (i64.const -4096)
  )
 )
 (func $func_36 (type $31) (result f64)
  (local $0 eqref)
  (local $1 (tuple i32 exnref i64 i31ref f64))
  (local $2 (tuple i64 i64))
  (local $3 (ref eq))
  (local $4 (ref struct))
  (local $5 (ref struct))
  (local $6 i64)
  (local $7 f32)
  (local $8 i32)
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 v128)
  (local $13 f32)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result f64)
   (nop)
   (call $deNan64
    (tuple.extract 3 2
     (try (type $45) (result (ref exn) (ref (exact $1)) f64)
      (do
       (tuple.make 3
        (block $label$1 (result (ref exn))
         (try_table (catch_all_ref $label$1)
          (throw $tag$_1
           (ref.eq
            (struct.new_default $1)
            (array.new_fixed $0 0)
           )
          )
         )
        )
        (struct.new_default $1)
        (f64.const 9223372036854775808)
       )
      )
      (catch_all
       (tuple.make 3
        (block $label$11 (result (ref exn))
         (try_table (catch_all_ref $label$11)
          (throw $tag$_4)
         )
        )
        (struct.new_default $1)
        (f64.const 0)
       )
      )
     )
    )
   )
  )
 )
 (func $func_36_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $deNan64
    (call $func_36)
   )
  )
  (drop
   (call $deNan64
    (call $func_36)
   )
  )
  (drop
   (call $deNan64
    (call $func_36)
   )
  )
 )
 (func $func_38 (type $32) (param $0 f64) (result (ref array))
  (local $1 f64)
  (local $2 (ref string))
  (local $3 i32)
  (local $4 (tuple i32 i32))
  (local $5 i64)
  (local.set $0
   (call $deNan64
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (array.new_fixed $0 0)
 )
 (func $func_38_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_38
    (f64.const -131073)
   )
  )
  (drop
   (call $func_38
    (f64.const 4294967218)
   )
  )
  (drop
   (call $func_38
    (f64.const 0)
   )
  )
  (drop
   (call $func_38
    (f64.const 10)
   )
  )
 )
 (func $func_40 (type $33) (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 v128)
  (local $3 (tuple i31ref f32 f32 stringref))
  (local $4 (tuple i31ref i32))
  (local $5 i32)
  (local $6 i64)
  (local $7 structref)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result i64)
   (i64.const -11744)
  )
 )
 (@binaryen.js.called)
 (func $func_41 (type $34) (param $0 arrayref) (param $1 arrayref) (param $2 f32) (result f64)
  (local $3 f32)
  (local.set $2
   (call $deNan32
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (f64.const 0)
 )
 (func $func_42 (type $35) (param $0 f32) (param $1 stringref)
  (local $2 f32)
  (local $3 (tuple i64 f32))
  (local $4 f64)
  (local $5 externref)
  (local $6 i32)
  (local $7 i64)
  (local.set $0
   (call $deNan32
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $throw
   (i32.const 0)
  )
  (block $label$1
   (drop
    (br_on_null $label$1
     (ref.func $func_42)
    )
   )
   (atomic.fence acqrel)
  )
  (call $log-f64
   (try (result f64)
    (do
     (f64.const -5)
    )
    (catch_all
     (local.get $4)
    )
   )
  )
  (nop)
 )
 (func $func_43 (type $8) (result f32)
  (local $0 externref)
  (local $1 f64)
  (local $2 v128)
  (local $3 (tuple i32 externref externref anyref))
  (local $4 f32)
  (local $5 exnref)
  (local $6 i32)
  (local $7 (tuple structref f32 f64))
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (f32.const -9223372036854775808)
 )
 (func $func_44 (type $5) (param $0 i32) (param $1 f64) (result structref)
  (local $2 eqref)
  (local $3 i32)
  (local $4 (tuple externref v128 v128 f64 f64))
  (local $5 i31ref)
  (local $6 (ref struct))
  (local $7 (ref struct))
  (local $8 (ref struct))
  (local $9 i64)
  (local $10 i64)
  (local $11 (ref struct))
  (local $12 i32)
  (local $13 arrayref)
  (local $14 nullref)
  (local $15 (ref struct))
  (local $16 i32)
  (local $17 (ref i31))
  (local $18 (ref string))
  (local $19 (tuple i64 i31ref (ref func) i32))
  (local $20 (tuple i64 i31ref (ref func) i32))
  (local $21 nullref)
  (local $22 f32)
  (local.set $1
   (call $deNan64
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result structref)
   (drop
    (br_on_cast $label$0 nullref nullref
     (loop $label$1 (result nullref)
      (if
       (i32.eqz
        (global.get $hangLimit)
       )
       (then
        (global.set $hangLimit
         (i32.const 19)
        )
        (unreachable)
       )
      )
      (global.set $hangLimit
       (i32.sub
        (global.get $hangLimit)
        (i32.const 1)
       )
      )
      (nop)
      (nop)
      (br_if $label$1
       (i32.eqz
        (block $label$3 (result i32)
         (loop $label$4
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (nop)
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (nop)
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (i32.atomic.store16 acqrel offset=1
           (i64.and
            (i64.trunc_f64_u
             (call $deNan64
              (f64.reinterpret_i64
               (i64.const -1099511627775)
              )
             )
            )
            (i64.const 15)
           )
           (br_if $label$3
            (ref.eq
             (struct.new_default $1)
             (array.new_fixed $0 0)
            )
            (ref.is_null
             (ref.func $func_44)
            )
           )
          )
          (table.set $exnref_table
           (i32.const 5)
           (block $label$11 (result (ref exn))
            (try_table (catch_all_ref $label$11)
             (throw $tag$
              (select (result (ref struct))
               (local.tee $6
                (local.tee $7
                 (struct.new_default $1)
                )
               )
               (struct.new_default $1)
               (local.get $0)
              )
             )
            )
           )
          )
          (br_if $label$4
           (i32.eqz
            (ref.eq
             (array.new_fixed $0 0)
             (ref.cast (ref (exact $1))
              (struct.new_default $1)
             )
            )
           )
          )
         )
         (nop)
         (br $label$1)
        )
       )
      )
      (select (result nullref)
       (ref.null none)
       (loop $label$32 (result nullref)
        (if
         (i32.eqz
          (global.get $hangLimit)
         )
         (then
          (global.set $hangLimit
           (i32.const 19)
          )
          (unreachable)
         )
        )
        (global.set $hangLimit
         (i32.sub
          (global.get $hangLimit)
          (i32.const 1)
         )
        )
        (block (result nullref)
         (call_ref $2
          (ref.func $func_16_invoker)
         )
         (if
          (i32.eqz
           (global.get $hangLimit)
          )
          (then
           (global.set $hangLimit
            (i32.const 19)
           )
           (unreachable)
          )
         )
         (global.set $hangLimit
          (i32.sub
           (global.get $hangLimit)
           (i32.const 1)
          )
         )
         (block $label$34
          (br_if $label$34
           (ref.eq
            (array.new_fixed $0 0)
            (array.new_fixed $0 0)
           )
          )
          (nop)
          (nop)
          (local.set $5
           (ref.null none)
          )
         )
         (i32.eqz
          (i32.atomic.load acqrel offset=4
           (i64.and
            (block $label$38
             (atomic.fence)
             (return
              (struct.new_default $1)
             )
            )
            (i64.const 15)
           )
          )
         )
         (try_table (result nullref) (catch_all $label$32)
          (local.tee $14
           (loop $label$39 (result nullref)
            (if
             (i32.eqz
              (global.get $hangLimit)
             )
             (then
              (global.set $hangLimit
               (i32.const 19)
              )
              (unreachable)
             )
            )
            (global.set $hangLimit
             (i32.sub
              (global.get $hangLimit)
              (i32.const 1)
             )
            )
            (call $log-funcref
             (loop $label$41 (result (ref (exact $5)))
              (if
               (i32.eqz
                (global.get $hangLimit)
               )
               (then
                (global.set $hangLimit
                 (i32.const 19)
                )
                (unreachable)
               )
              )
              (global.set $hangLimit
               (i32.sub
                (global.get $hangLimit)
                (i32.const 1)
               )
              )
              (try
               (do
                (drop
                 (ref.as_non_null
                  (local.get $13)
                 )
                )
               )
               (catch $tag$
                (local.set $15 (pop (ref struct)))
                (local.set $3
                 (i32.const 65535)
                )
               )
               (catch $tag$_1
                (local.set $16 (i32.eqz (pop i32)))
                (local.set $2
                 (local.get $2)
                )
               )
               (catch_all
                (nop)
               )
              )
              (br_if $label$41
               (i32.eqz
                (ref.eq
                 (local.tee $17
                  (ref.i31
                   (i32.const 128)
                  )
                 )
                 (ref.as_non_null
                  (local.get $13)
                 )
                )
               )
              )
              (ref.func $func_44)
             )
            )
            (local.set $0
             (i32.const 1)
            )
            (br_if $label$39
             (local.tee $3
              (string.measure_wtf16
               (local.tee $18
                (string.const "")
               )
              )
             )
            )
            (if (result nullref)
             (i32.atomic.load offset=2
              (i64.and
               (tuple.extract 4 0
                (local.tee $19
                 (local.tee $20
                  (if (type $46) (result i64 nullref (ref (exact $5)) i32)
                   (i32.eqz
                    (i32.const -33)
                   )
                   (then
                    (tuple.make 4
                     (i64.const 8240491161474198381)
                     (ref.null none)
                     (ref.func $func_44)
                     (i32.const -31)
                    )
                   )
                   (else
                    (tuple.make 4
                     (i64.const -23762)
                     (ref.null none)
                     (ref.func $func_44)
                     (i32.const -32768)
                    )
                   )
                  )
                 )
                )
               )
               (i64.const 15)
              )
             )
             (then
              (block $label$42
               (nop)
               (br $label$39)
              )
             )
             (else
              (block $label$43 (result nullref)
               (if
                (i32.eqz
                 (global.get $hangLimit)
                )
                (then
                 (global.set $hangLimit
                  (i32.const 19)
                 )
                 (unreachable)
                )
               )
               (global.set $hangLimit
                (i32.sub
                 (global.get $hangLimit)
                 (i32.const 1)
                )
               )
               (if
                (i32.eqz
                 (local.get $0)
                )
                (then
                 (local.set $3
                  (i32.const 85)
                 )
                )
                (else
                 (nop)
                )
               )
               (try_table (result nullref) (catch_all $label$39)
                (select (result nullref)
                 (local.tee $21
                  (ref.null none)
                 )
                 (local.get $21)
                 (i32.const -1)
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
        (i32.const -262144)
        (loop $label$25 (result i32)
         (if
          (i32.eqz
           (global.get $hangLimit)
          )
          (then
           (global.set $hangLimit
            (i32.const 19)
           )
           (unreachable)
          )
         )
         (global.set $hangLimit
          (i32.sub
           (global.get $hangLimit)
           (i32.const 1)
          )
         )
         (loop $label$27
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (nop)
          (if
           (i32.eqz
            (global.get $hangLimit)
           )
           (then
            (global.set $hangLimit
             (i32.const 19)
            )
            (unreachable)
           )
          )
          (global.set $hangLimit
           (i32.sub
            (global.get $hangLimit)
            (i32.const 1)
           )
          )
          (atomic.fence acqrel)
          (br_if $label$27
           (local.tee $3
            (i32.load offset=22 align=1
             (i64.const -9661572557990)
            )
           )
          )
         )
         (block $label$26
          (br_if $label$26
           (i32.const -1025)
          )
         )
         (br_if $label$25
          (i32.eqz
           (block $label$31 (result i32)
            (nop)
            (string.measure_wtf16
             (global.get $global$)
            )
           )
          )
         )
         (string.measure_wtf16
          (string.const "")
         )
        )
        (block $label$13 (result i32)
         (if
          (i32.eqz
           (i32.const 1243090977)
          )
          (then
           (block $label$14
            (memory.copy
             (i64.and
              (loop $label$15
               (if
                (i32.eqz
                 (global.get $hangLimit)
                )
                (then
                 (global.set $hangLimit
                  (i32.const 19)
                 )
                 (unreachable)
                )
               )
               (global.set $hangLimit
                (i32.sub
                 (global.get $hangLimit)
                 (i32.const 1)
                )
               )
               (block $label$16
                (memory.fill
                 (i64.const 4611686018427387904)
                 (block $label$17
                  (nop)
                  (br $label$14)
                 )
                 (i64.const -17)
                )
                (if
                 (i32.eqz
                  (global.get $hangLimit)
                 )
                 (then
                  (global.set $hangLimit
                   (i32.const 19)
                  )
                  (unreachable)
                 )
                )
                (global.set $hangLimit
                 (i32.sub
                  (global.get $hangLimit)
                  (i32.const 1)
                 )
                )
                (nop)
                (i64.sub
                 (local.set $9
                  (local.set $10
                   (block $label$20
                    (nop)
                    (br $label$14)
                   )
                  )
                 )
                 (i64.const -32768)
                )
               )
              )
              (i64.const 15)
             )
             (local.get $10)
             (i64.trunc_f64_s
              (local.tee $1
               (local.tee $1
                (f64.const 4294940460)
               )
              )
             )
            )
            (try_table (catch $tag$_1 $label$13) (catch $tag$ $label$0) (catch_all $label$14)
             (call $log-externref
              (if
               (i32.eqz
                (loop $label$21 (result i32)
                 (if
                  (i32.eqz
                   (global.get $hangLimit)
                  )
                  (then
                   (global.set $hangLimit
                    (i32.const 19)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $hangLimit
                  (i32.sub
                   (global.get $hangLimit)
                   (i32.const 1)
                  )
                 )
                 (local.get $3)
                )
               )
               (then
                (block $label$22
                 (try
                  (do
                   (nop)
                  )
                  (catch $tag$
                   (local.set $11 (pop (ref struct)))
                   (nop)
                  )
                  (catch $tag$_1
                   (local.set $12 (local.tee $12 (pop i32)))
                   (nop)
                  )
                 )
                 (br $label$14)
                )
               )
               (else
                (block $label$23
                 (drop
                  (loop $label$24 (result (ref array))
                   (if
                    (i32.eqz
                     (global.get $hangLimit)
                    )
                    (then
                     (global.set $hangLimit
                      (i32.const 19)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $hangLimit
                    (i32.sub
                     (global.get $hangLimit)
                     (i32.const 1)
                    )
                   )
                   (ref.as_non_null
                    (local.tee $13
                     (array.new_fixed $0 0)
                    )
                   )
                  )
                 )
                 (br $label$1)
                )
               )
              )
             )
            )
           )
          )
          (else
           (try_table (catch $tag$_1 $label$13) (catch $tag$ $label$0) (catch $tag$ $label$0)
            (nop)
           )
          )
         )
         (local.get $3)
        )
       )
      )
     )
    )
   )
   (drop
    (local.tee $0
     (i32.atomic.load16_u acqrel offset=22
      (i64.and
       (select
        (local.tee $10
         (i64.extend_i32_s
          (block $label$45 (result i32)
           (try_table
            (atomic.fence)
           )
           (i32.atomic.load16_u acqrel offset=22
            (i64.const -16)
           )
          )
         )
        )
        (local.get $10)
        (f32.gt
         (f32.const 4503599627370496)
         (call $deNan32
          (f32.sub
           (local.tee $22
            (f32.const -72057594037927936)
           )
           (local.get $22)
          )
         )
        )
       )
       (i64.const 15)
      )
     )
    )
   )
   (return
    (struct.new_default $1)
   )
  )
 )
 (func $func_44_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_44
    (i32.const 2147483646)
    (f64.const 49)
   )
  )
  (drop
   (call $func_44
    (i32.const 1480748615)
    (f64.const 1)
   )
  )
  (drop
   (call $func_44
    (i32.const 255)
    (f64.const 10337)
   )
  )
 )
 (@binaryen.js.called)
 (func $func_46 (type $13) (result i64)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (try_table (result i64)
   (i64.const 65536)
  )
 )
 (func $func_46_invoker (type $2)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (drop
   (call $func_46)
  )
 )
 (@binaryen.js.called)
 (func $func_48 (type $36) (param $0 stringref) (result f32)
  (local $1 i32)
  (local $2 (tuple f32 stringref f64))
  (local $3 i64)
  (local $4 (tuple v128 f64 f32 f64 f32 i64))
  (local $5 i32)
  (local $6 exnref)
  (local $7 (ref eq))
  (local $8 v128)
  (local $9 (tuple i64 i64))
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 f64)
  (local $14 v128)
  (local $15 i64)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (return
   (f32.const 65434)
  )
 )
 (func $func_49 (type $37) (result exnref)
  (local $0 (tuple v128 exnref i32))
  (local $1 externref)
  (local $2 i64)
  (local $3 f64)
  (local $4 arrayref)
  (local $5 nullref)
  (local $6 i32)
  (local $7 (ref i31))
  (local $8 (ref string))
  (local $9 (ref string))
  (local $10 (tuple f32 nullref f64 i32))
  (local $11 (ref $7))
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (call $log-anyref
   (ref.cast (ref none)
    (ref.cast nullref
     (ref.null none)
    )
   )
  )
  (return
   (ref.null noexn)
  )
 )
 (func $func_50 (type $38) (param $0 i64) (param $1 stringref) (result (ref array))
  (local $2 (tuple eqref i32 f64 f64 f32 i64))
  (local $3 v128)
  (local $4 f32)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (block $label$0 (result (ref (exact $0)))
   (call_ref $10
    (local.get $4)
    (ref.func $log-f32)
   )
   (call $log-funcref
    (ref.func $func_50)
   )
   (nop)
   (select (result (ref (exact $0)))
    (array.new_fixed $0 0)
    (array.new_fixed $0 0)
    (i32.const -14803)
   )
  )
 )
 (func $func_51 (type $39) (result f32 f64 funcref f64)
  (local $0 eqref)
  (if
   (i32.eqz
    (global.get $hangLimit)
   )
   (then
    (global.set $hangLimit
     (i32.const 19)
    )
    (unreachable)
   )
  )
  (global.set $hangLimit
   (i32.sub
    (global.get $hangLimit)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (tuple.make 4
    (f32.const -131072)
    (f64.const -9223372036854775808)
    (ref.func $func_51)
    (f64.const -4294967295.208)
   )
  )
 )
 (func $deNan32 (type $40) (param $0 f32) (result f32)
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
 (func $deNan64 (type $41) (param $0 f64) (result f64)
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
 (func $deNan128 (type $42) (param $0 v128) (result v128)
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
)
