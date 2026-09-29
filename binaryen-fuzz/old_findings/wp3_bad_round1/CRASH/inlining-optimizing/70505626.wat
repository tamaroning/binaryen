(module
 (rec
  (type $0 (array f64))
  (type $1 (func (param (ref $3) f32 i32)))
  (type $2 (sub (array (ref null $6))))
  (type $3 (sub (struct (field (mut i8)) (field (mut f32)) (field f64) (field (mut (ref null $2))))))
  (type $4 (descriptor $5) (struct (field (mut (ref $0))) (field i16)))
  (type $5 (sub (describes $4) (descriptor $6) (struct (field externref) (field (mut (ref null $7))) (field (mut i32)) (field (ref null $9)) (field (mut f64)) (field (mut i64)))))
  (type $6 (describes $5) (struct (field i8)))
  (type $7 (sub (array (mut (ref $5)))))
  (type $8 (sub (func (param (ref $8)))))
  (type $9 (sub (func (param (ref array) (ref $9) v128 (ref $3) f64 (ref null $10)) (result f32))))
  (type $10 (sub final $3 (struct (field (mut i8)) (field (mut f32)) (field f64) (field (mut (ref null $2))))))
  (type $11 (sub final $3 (struct (field (mut i8)) (field (mut f32)) (field f64) (field (mut (ref null $2))) (field i8))))
 )
 (type $12 (func))
 (type $13 (array (mut i16)))
 (type $14 (array i8))
 (type $15 (struct))
 (type $16 (struct (field (mut (ref null $4))) (field (mut i16)) (field (ref null $16))))
 (type $17 (func (param funcref)))
 (type $18 (func (param i64)))
 (type $19 (func (param i32)))
 (type $20 (func (param f64)))
 (type $21 (func (param i32 eqref) (result f32)))
 (type $22 (func (param f32)))
 (type $23 (func (param v128)))
 (type $24 (func (param anyref)))
 (type $25 (func (param externref)))
 (type $26 (func (param (ref null $0) f32) (result (ref null $16))))
 (type $27 (func (param f32 (ref null $10)) (result (ref $3))))
 (type $28 (func (param i31ref (ref $3) v128) (result v128 i32 i31ref f32 i31ref)))
 (type $29 (func (result f32)))
 (type $30 (func (param eqref)))
 (type $31 (func (param f64 funcref f64 i64) (result (ref $0))))
 (type $32 (func (param (ref $8) (ref $7) arrayref) (result f32)))
 (type $33 (func (param eqref i64)))
 (type $34 (func (param f32 (ref null $9) funcref (ref struct) (ref $5) f32 (ref $7)) (result i64)))
 (type $35 (func (param v128) (result (ref $8))))
 (type $36 (func (param i64 exnref stringref anyref (ref null $3)) (result externref i64 f64 i64)))
 (type $37 (func (param (ref null $7) (ref null $6)) (result (ref array))))
 (type $38 (func (param (ref $3)) (result (ref null $16))))
 (type $39 (func (param externref i64) (result (ref null $1))))
 (type $40 (func (result v128 i32 i31ref f32 i31ref)))
 (type $41 (func (result f64 i64 f64 i32 (ref $2) i64)))
 (type $42 (func (result i64 i32)))
 (type $43 (func (result externref i64 f64 i64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_24" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $19) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $19) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $18) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $22) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $20) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $23) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $24) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $17) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $25) (param externref)))
 (global $global$0 (mut v128) (v128.const i32x4 0xffff8001 0x00000002 0x00400001 0xffffef2f))
 (global $global$1 (ref struct) (struct.new_default $15))
 (global $global$2 (ref null $11) (struct.new $11
  (i32.const 1)
  (f32.const -35184372088832)
  (f64.const -nan:0xfffffffb60342)
  (array.new $2
   (struct.new $6
    (i32.const -5751549)
   )
   (i32.const 76)
  )
  (i32.const 131071)
 ))
 (global $global$3 (ref string) (string.const ""))
 (global $global$4 i32 (i32.const -2147483647))
 (global $global$5 stringref (string.const "\c2\a3\c2\a3"))
 (global $global$6 externref (string.const "957"))
 (global $global$7 i64 (i64.const -29))
 (global $global$8 (ref null $8) (ref.null nofunc))
 (global $global$9 v128 (v128.const i32x4 0x005e0107 0xf3ffced5 0x21710100 0x00013a39))
 (global $global$10 (ref null $11) (ref.null none))
 (global $global$11 f64 (f64.const -0.421))
 (global $global$12 i32 (global.get $global$4))
 (global $global$13 (mut (ref null $2)) (ref.null none))
 (global $global$14 funcref (ref.null nofunc))
 (global $global$15 (mut f32) (f32.const -32769))
 (global $global$16 i32 (i32.const -30389))
 (global $global$17 i32 (i32.const -2))
 (global $global$18 (ref string) (global.get $global$3))
 (global $global$19 (mut i64) (i64.const -1745315))
 (global $global$20 (mut i64) (i64.const -65535))
 (global $global$21 (mut f32) (f32.const 9223372036854775808))
 (global $global$22 i32 (i32.const 0))
 (global $global$23 (ref $11) (struct.new $11
  (i32.const -47)
  (f32.const -9223372036854775808)
  (f64.const -33554432.832)
  (array.new_default $2
   (i32.const 12)
  )
  (global.get $global$4)
 ))
 (global $global$24 eqref (ref.i31
  (i32.const -2147483647)
 ))
 (global $global$25 (ref $7) (array.new $7
  (struct.new_desc $5
   (string.const "\ed\bd\88348\e2\82\ac")
   (array.new $7
    (struct.new_desc $5
     (global.get $gimport$0)
     (array.new $7
      (struct.new_default_desc $5
       (struct.new $6
        (global.get $global$22)
       )
      )
      (i32.const 91)
     )
     (global.get $global$22)
     (ref.null nofunc)
     (f64.const -nan:0xffffffffffff8)
     (i64.const -106)
     (struct.new_default $6)
    )
    (i32.const 12)
   )
   (i32.const 0)
   (ref.func $0)
   (f64.const -nan:0xfffffffffffb6)
   (i64.const -68719476736)
   (struct.new $6
    (i32.const 4)
   )
  )
  (i32.const 77)
 ))
 (global $global$26 structref (ref.null none))
 (global $global$27 (ref null $4) (struct.new_desc $4
  (array.new_default $0
   (i32.const 81)
  )
  (global.get $global$4)
  (struct.new_default_desc $5
   (struct.new $6
    (i32.const 22646)
   )
  )
 ))
 (global $global$28 (ref $4) (struct.new_desc $4
  (array.new $0
   (f64.const -4294967294.856)
   (i32.const 78)
  )
  (i32.const 193)
  (struct.new_default_desc $5
   (struct.new_default $6)
  )
 ))
 (global $global$29 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 (i32.const 0) "\d0\a6\17\f46\e6Gw\bc\1b\99\87\e1\8d/*a\ed\d0B\9565\e0\ae56<")
 (data $1 "\a8")
 (table $0 15 funcref (ref.null nofunc))
 (table $1 5 exnref)
 (elem $0 (table $0) (i32.const 0) func $8 $8 $12 $14 $22 $22 $22 $22 $22 $27 $27 $27 $44 $44 $51)
 (elem declare func $0 $15 $16 $20 $23 $32 $33 $35 $4 $40 $43 $55 $7 $fimport$4 $fimport$7)
 (tag $tag$0 (type $18) (param i64))
 (tag $tag$1 (type $12))
 (export "global$_1" (global $global$1))
 (export "global$_4" (global $global$4))
 (export "global$_10" (global $global$14))
 (export "global$_11" (global $global$15))
 (export "global$_13" (global $global$18))
 (export "global$_16" (global $global$22))
 (export "global$_17" (global $global$23))
 (export "global$_18" (global $global$24))
 (export "global$_22" (global $global$27))
 (export "ref_func_target_invoker" (func $1))
 (export "func" (func $2))
 (export "func_invoker" (func $3))
 (export "func_14_invoker" (func $6))
 (export "func_19" (func $10))
 (export "func_19_invoker" (func $11))
 (export "func_21_invoker" (func $13))
 (export "func_25_invoker" (func $17))
 (export "func_27" (func $18))
 (export "func_27_invoker" (func $19))
 (export "func_29_invoker" (func $21))
 (export "func_31_invoker" (func $23))
 (export "func_33" (func $24))
 (export "func_33_invoker" (func $25))
 (export "func_36_invoker" (func $28))
 (export "func_38_invoker" (func $30))
 (export "func_40_invoker" (func $32))
 (export "func_42_invoker" (func $34))
 (export "func_44_invoker" (func $36))
 (export "func_47_invoker" (func $39))
 (export "func_49_invoker" (func $41))
 (export "func_51_invoker" (func $43))
 (export "func_53_invoker" (func $45))
 (export "func_55" (func $46))
 (export "func_56" (func $47))
 (export "func_56_invoker" (func $48))
 (export "func_58_invoker" (func $50))
 (export "func_60_invoker" (func $52))
 (export "func_62" (func $53))
 (export "func_62_invoker" (func $54))
 (func $0 (type $9) (param $0 (ref array)) (param $1 (ref $9)) (param $2 v128) (param $3 (ref $3)) (param $4 f64) (param $5 (ref null $10)) (result f32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $12)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 f64)
  (local $5 f64)
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
  (local $20 i32)
  (local $21 i32)
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
  (local $32 f32)
  (local $33 v128)
  (local $34 v128)
  (local $35 (ref $2))
  (local $36 (ref func))
  (local $37 funcref)
  (local $38 (ref i31))
  (local $39 (ref $7))
  (local $40 (ref $7))
  (local $41 (ref $7))
  (local $42 (ref $7))
  (local $43 (ref $7))
  (local $44 (ref $7))
  (local $45 (ref $7))
  (local $46 (ref $7))
  (local $47 (ref $7))
  (local $48 (ref string))
  (local $49 (ref string))
  (local $50 (ref string))
  (local $51 (ref string))
  (local $52 (ref string))
  (local $53 (ref string))
  (local $54 (ref null $13))
  (local $55 (ref null $13))
  (local $56 (ref $13))
  (local $57 (ref $13))
  (local $58 (ref $13))
  (local $59 (ref $13))
  (local $60 (ref $13))
  (local $61 (ref $5))
  (local $62 (ref $5))
  (local $63 (ref none))
  (local $64 (ref null $10))
  (local $65 (ref $6))
  (local $66 (ref $6))
  (local $67 (ref null $6))
  (local $68 (ref null $0))
  (local $69 (ref $0))
  (local $70 (ref $0))
  (local $scratch (ref (exact $14)))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $68
   (ref.as_non_null
    (local.get $68)
   )
  )
  (local.set $49
   (global.get $global$18)
  )
  (local.set $48
   (string.const "")
  )
  (local.set $39
   (global.get $global$25)
  )
  (local.set $35
   (array.new $2
    (struct.new $6
     (i32.const -128)
    )
    (i32.and
     (i32.const 33)
     (i32.const 1023)
    )
   )
  )
  (drop
   (array.new_fixed $14 0)
  )
  (drop
   (ref.func $0)
  )
  (drop
   (v128.const i32x4 0xffffffed 0xffff9f2b 0xffff977f 0xffffffd8)
  )
  (drop
   (i64.le_s
    (i64.const -1474872493)
    (local.get $0)
   )
  )
  (drop
   (f32.const -549755813888)
  )
  (drop
   (try (result f64)
    (do
     (loop $label (result f64)
      (if
       (i32.eqz
        (global.get $global$29)
       )
       (then
        (global.set $global$29
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$29
       (i32.sub
        (global.get $global$29)
        (i32.const 1)
       )
      )
      (block (result f64)
       (nop)
       (f64.sqrt
        (loop (result f64)
         (if
          (i32.eqz
           (global.get $global$29)
          )
          (then
           (global.set $global$29
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$29
          (i32.sub
           (global.get $global$29)
           (i32.const 1)
          )
         )
         (block (result f64)
          (i64.atomic.store16 acqrel offset=4
           (i32.and
            (ref.eq
             (local.tee $35
              (array.new_default $2
               (i32.and
                (i32.const 66)
                (i32.const 1023)
               )
              )
             )
             (struct.new_desc $4
              (array.new_default $0
               (i32.and
                (i32.const 23)
                (i32.const 1023)
               )
              )
              (i32.const 67108864)
              (struct.new_default_desc $5
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (i32.const 15)
           )
           (try_table (result i64) (catch_all $label)
            (i64.const -536870912)
           )
          )
          (drop
           (block (result (ref (exact $14)))
            (local.set $scratch
             (array.new_fixed $14 0)
            )
            (local.set $5
             (f64.const -3402823466385288598117041e14)
            )
            (local.get $scratch)
           )
          )
          (local.get $5)
         )
        )
       )
      )
     )
    )
    (catch_all
     (f64.copysign
      (local.get $4)
      (local.get $4)
     )
    )
   )
  )
  (block
   (nop)
   (return)
  )
  (local.set $70
   (local.set $66
    (local.set $46
     (local.set $47
      (local.set $48
       (local.set $60
        (local.set $53
         (local.set $69
          (local.set $48
           (local.set $48
            (local.set $49
             (local.set $59
              (local.set $52
               (local.set $65
                (local.set $66
                 (local.set $45
                  (local.set $44
                   (local.set $43
                    (local.set $58
                     (local.set $51
                      (local.set $57
                       (local.set $56
                        (local.set $50
                         (local.set $38
                          (local.set $41
                           (local.set $40
                            (local.set $39
                             (local.set $48
                              (local.set $49
                               (local.set $42
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
 (func $2 (type $26) (param $0 (ref null $0)) (param $1 f32) (result (ref null $16))
  (local $2 i64)
  (local $3 i64)
  (local $4 f64)
  (local $5 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (struct.new $16
     (struct.new_desc $4
      (array.new_default $0
       (i32.and
        (i32.const 65)
        (i32.const 1023)
       )
      )
      (i32.const -3180441)
      (struct.new_desc $5
       (global.get $gimport$0)
       (array.new $7
        (struct.new_default_desc $5
         (struct.new_default $6)
        )
        (i32.and
         (i32.const 29)
         (i32.const 1023)
        )
       )
       (local.get $5)
       (ref.func $0)
       (local.get $4)
       (local.get $3)
       (struct.new $6
        (local.get $5)
       )
      )
     )
     (local.get $5)
     (struct.new_default $16)
    )
   )
  )
  (unreachable)
 )
 (func $3 (type $12)
  (local $0 (ref string))
  (local $1 (ref string))
  (local $2 (ref string))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $2
    (array.new_default $0
     (i32.and
      (i32.const 95)
      (i32.const 1023)
     )
    )
    (f32.const -24781)
   )
  )
  (drop
   (call $2
    (array.new $0
     (block (result f64)
      (block
       (f32.store offset=3 align=2
        (i32.and
         (global.get $global$22)
         (i32.const 15)
        )
        (global.get $global$21)
       )
       (call $fimport$2
        (i64.const 44)
       )
      )
      (try_table
       (block
        (loop
         (if
          (i32.eqz
           (global.get $global$29)
          )
          (then
           (global.set $global$29
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$29
          (i32.sub
           (global.get $global$29)
           (i32.const 1)
          )
         )
         (block
          (nop)
          (block $block
           (loop $label
            (if
             (i32.eqz
              (global.get $global$29)
             )
             (then
              (global.set $global$29
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$29
             (i32.sub
              (global.get $global$29)
              (i32.const 1)
             )
            )
            (block
             (nop)
             (block
              (nop)
              (nop)
             )
            )
            (br_if $label
             (i32.eqz
              (block (result i32)
               (drop
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (i32.const -4096)
              )
             )
            )
            (memory.fill
             (i32.and
              (i32.const 4194304)
              (i32.const 15)
             )
             (string.compare
              (ref.cast (ref string)
               (local.tee $0
                (local.tee $1
                 (local.tee $2
                  (global.get $global$3)
                 )
                )
               )
              )
              (global.get $global$18)
             )
             (ref.eq
              (global.get $global$1)
              (block (result (ref none))
               (nop)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
           )
           (memory.init $0
            (i32.and
             (try_table (result i32) (catch_all $block)
              (i32.const -65535)
             )
             (i32.const 15)
            )
            (i32.const 8)
            (i32.const 2)
           )
          )
         )
        )
        (return)
       )
       (unreachable)
      )
      (unreachable)
     )
     (i32.and
      (i32.const 76)
      (i32.const 1023)
     )
    )
    (f32.const -nan:0x7fffc2)
   )
  )
 )
 (@binaryen.js.called)
 (func $4 (type $8) (param $0 (ref $8))
  (local $1 f32)
  (local $2 f32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (atomic.fence acqrel)
  )
 )
 (func $5 (type $8) (param $0 (ref $8))
  (local $1 f32)
  (local $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 v128)
  (local $6 i64)
  (local $7 f64)
  (local $8 (ref null $4))
  (local $9 (ref $11))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block $block
   (struct.set $11 0
    (local.tee $9
     (global.get $global$23)
    )
    (local.get $4)
   )
   (try_table (catch_all $block)
    (struct.set $5 1
     (struct.new_desc $5
      (ref.null noextern)
      (array.new $7
       (struct.new_default_desc $5
        (ref.null none)
       )
       (i32.and
        (i32.const 97)
        (i32.const 1023)
       )
      )
      (local.get $4)
      (ref.func $0)
      (f64.const -nan:0xfffffffffffe2)
      (i64.const -21)
      (struct.new_default $6)
     )
     (global.get $global$25)
    )
   )
  )
 )
 (func $6 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $5
   (ref.func $4)
  )
 )
 (@binaryen.js.called)
 (func $7 (type $9) (param $0 (ref array)) (param $1 (ref $9)) (param $2 v128) (param $3 (ref $3)) (param $4 f64) (param $5 (ref null $10)) (result f32)
  (local $6 structref)
  (local $7 (ref $9))
  (local $8 (ref null $10))
  (local $9 funcref)
  (local $10 exnref)
  (local $11 exnref)
  (local $12 (ref array))
  (local $13 i64)
  (local $14 i64)
  (local $15 v128)
  (local $16 v128)
  (local $17 f64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block (result f32)
   (data.drop $1)
   (f32.const 17592186044416)
  )
 )
 (func $8 (type $8) (param $0 (ref $8))
  (local $1 (ref null $7))
  (local $2 (ref null $7))
  (local $3 (ref $4))
  (local $4 eqref)
  (local $5 eqref)
  (local $6 (ref null $2))
  (local $7 arrayref)
  (local $8 (ref null $6))
  (local $9 (ref string))
  (local $10 (ref $1))
  (local $11 (ref $5))
  (local $12 f64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $9 (type $1) (param $0 (ref $3)) (param $1 f32) (param $2 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (data.drop $1)
   (call $fimport$0
    (i32.const 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $10 (type $27) (param $0 f32) (param $1 (ref null $10)) (result (ref $3))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (struct.new $3
   (i32.const -72)
   (local.get $0)
   (f64.const 63870)
   (array.new_default $2
    (i32.and
     (i32.const 56)
     (i32.const 1023)
    )
   )
  )
 )
 (func $11 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $10
    (f32.const 62)
    (struct.new_default $10)
   )
  )
 )
 (func $12 (type $1) (param $0 (ref $3)) (param $1 f32) (param $2 i32)
  (local $3 (ref null $9))
  (local $4 (ref null $11))
  (local $5 (ref null $4))
  (local $6 (ref $8))
  (local $7 (ref $0))
  (local $8 (ref $5))
  (local $9 (ref string))
  (local $10 (ref string))
  (local $11 (ref $13))
  (local $12 (ref (exact $5)))
  (local $13 (ref (exact $5)))
  (local $14 (ref (exact $5)))
  (local $15 (ref struct))
  (local $16 i31ref)
  (local $17 (ref i31))
  (local $18 (ref $7))
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 v128)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $14
   (struct.new_default_desc $5
    (struct.new $6
     (global.get $global$4)
    )
   )
  )
  (local.set $9
   (string.const "")
  )
  (local.set $8
   (struct.new_desc $5
    (global.get $gimport$0)
    (global.get $global$25)
    (local.get $19)
    (ref.func $7)
    (f64.const -9223372036854775808)
    (i64.const -7062505)
    (struct.new_default $6)
   )
  )
  (local.set $6
   (ref.func $4)
  )
  (drop
   (local.tee $28
    (block (result v128)
     (if
      (i32.lt_u
       (i32.add
        (local.tee $22
         (local.get $2)
        )
        (local.tee $23
         (block (result i32)
          (struct.set $5 5
           (local.tee $8
            (struct.new_desc $5
             (global.get $gimport$1)
             (array.new $7
              (struct.new_desc $5
               (global.get $gimport$1)
               (ref.null none)
               (global.get $global$22)
               (ref.as_non_null
                (ref.null nofunc)
               )
               (f64.const -36)
               (i64.const -1)
               (ref.as_non_null
                (ref.null none)
               )
              )
              (i32.and
               (i32.const 32)
               (i32.const 1023)
              )
             )
             (global.get $global$4)
             (ref.func $7)
             (f64.const -nan:0xfffffffffffaf)
             (i64.const 255)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
           (i64.const 254)
          )
          (try (result i32)
           (do
            (local.get $19)
           )
           (catch $tag$0
            (global.set $global$19 (pop i64))
            (ref.eq
             (local.tee $15
              (struct.new_desc $4
               (array.new_default $0
                (i32.and
                 (i32.const 14)
                 (i32.const 1023)
                )
               )
               (local.get $19)
               (local.get $14)
              )
             )
             (block $block (result (ref i31))
              (i64.store32 offset=22
               (i32.and
                (global.get $global$4)
                (i32.const 15)
               )
               (i64.const 9223372036854775807)
              )
              (drop
               (br_on_cast $block i31ref (ref i31)
                (local.tee $16
                 (ref.null none)
                )
               )
              )
              (br_on_cast_fail $block (ref i31) (ref i31)
               (local.tee $17
                (ref.i31
                 (i32.const 1)
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
       (array.len
        (local.tee $18
         (ref.cast (ref (exact $7))
          (loop $label (result (ref (exact $7)))
           (if
            (i32.eqz
             (global.get $global$29)
            )
            (then
             (global.set $global$29
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$29
            (i32.sub
             (global.get $global$29)
             (i32.const 1)
            )
           )
           (block $block1
            (call $fimport$7
             (ref.func $12)
            )
            (call $fimport$2
             (i64.trunc_sat_f32_u
              (block (result f32)
               (call_indirect $0 (type $8)
                (try (result (ref $8))
                 (do
                  (drop
                   (local.tee $7
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (drop
                   (ref.i31
                    (i32.const 56)
                   )
                  )
                  (block
                   (block
                    (block
                     (nop)
                     (nop)
                    )
                    (nop)
                   )
                   (br $block1)
                  )
                  (local.set $6
                   (unreachable)
                  )
                 )
                 (catch $tag$0
                  (local.set $26 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $26))))
                  (local.get $6)
                 )
                 (catch_all
                  (local.get $6)
                 )
                )
                (i32.const 1)
               )
               (try (result f32)
                (do
                 (local.tee $1
                  (local.get $1)
                 )
                )
                (catch_all
                 (loop (result f32)
                  (if
                   (i32.eqz
                    (global.get $global$29)
                   )
                   (then
                    (global.set $global$29
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$29
                   (i32.sub
                    (global.get $global$29)
                    (i32.const 1)
                   )
                  )
                  (f32.const 18446744073709551615)
                 )
                )
               )
              )
             )
            )
           )
           (br_if $label
            (i32.eqz
             (i32x4.extract_lane 0
              (v128.const i32x4 0xca7ffffc 0xc7800000 0xffffff9c 0xc27c0000)
             )
            )
           )
           (try (result (ref (exact $7)))
            (do
             (array.new $7
              (local.tee $8
               (ref.as_non_null
                (ref.null none)
               )
              )
              (i32.and
               (i32.const 46)
               (i32.const 1023)
              )
             )
            )
            (catch_all
             (loop (result (ref (exact $7)))
              (if
               (i32.eqz
                (global.get $global$29)
               )
               (then
                (global.set $global$29
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$29
               (i32.sub
                (global.get $global$29)
                (i32.const 1)
               )
              )
              (block
               (loop
                (if
                 (i32.eqz
                  (global.get $global$29)
                 )
                 (then
                  (global.set $global$29
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$29
                 (i32.sub
                  (global.get $global$29)
                  (i32.const 1)
                 )
                )
                (block $block2
                 (block
                  (drop
                   (br_on_null $block2
                    (ref.null none)
                   )
                  )
                  (data.drop $0)
                 )
                 (call $fimport$0
                  (i32.const 0)
                 )
                )
               )
               (call $fimport$5
                (i8x16.splat
                 (local.tee $19
                  (string.eq
                   (local.tee $9
                    (string.const "\ed\a0\80917")
                   )
                   (string.const "\ed\a0\80")
                  )
                 )
                )
               )
              )
              (local.set $10
               (local.get $9)
              )
              (drop
               (i32.add
                (local.tee $20
                 (local.tee $2
                  (try_table (result i32) (catch_all $label)
                   (i32.const 512)
                  )
                 )
                )
                (local.tee $21
                 (string.measure_wtf16
                  (local.get $10)
                 )
                )
               )
              )
              (loop $label1
               (if
                (i32.eqz
                 (global.get $global$29)
                )
                (then
                 (global.set $global$29
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$29
                (i32.sub
                 (global.get $global$29)
                 (i32.const 1)
                )
               )
               (block
                (call $fimport$2
                 (i64.const 108)
                )
                (br $label1)
               )
               (unreachable)
              )
              (local.set $11
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
      (then
       (drop
        (local.get $18)
       )
       (drop
        (local.get $22)
       )
       (drop
        (local.get $8)
       )
       (drop
        (struct.new_default_desc $5
         (struct.new_default $6)
        )
       )
       (block
        (nop)
        (return)
       )
       (local.set $12
        (local.set $13
         (local.set $14
          (unreachable)
         )
        )
       )
      )
     )
     (block (result v128)
      (memory.copy
       (i32.and
        (i31.get_u
         (ref.i31
          (i32.const 65537)
         )
        )
        (i32.const 15)
       )
       (i32.and
        (local.get $19)
        (i32.const 15)
       )
       (ref.eq
        (struct.new_default $15)
        (struct.new_desc $4
         (array.new $0
          (f64.const 1.4065009763114225e-176)
          (i32.and
           (i32.const 38)
           (i32.const 1023)
          )
         )
         (local.get $19)
         (struct.new_default_desc $5
          (struct.new_default $6)
         )
        )
       )
      )
      (v128.const i32x4 0xfff70042 0xffff0000 0x0001fffe 0xff00001c)
     )
    )
   )
  )
 )
 (func $13 (type $12)
  (local $0 f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 f64)
  (local $11 (ref string))
  (local $12 funcref)
  (local $13 (ref i31))
  (local $14 (ref $4))
  (local $15 arrayref)
  (local $16 (ref exn))
  (local $17 (ref exn))
  (local $18 (ref $10))
  (local $19 (ref eq))
  (local $20 (ref $7))
  (local $21 (ref $2))
  (local $scratch i32)
  (local $scratch_23 (ref i31))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $13
   (block (result (ref i31))
    (local.set $scratch_23
     (ref.i31
      (i32.const -5773)
     )
    )
    (local.set $2
     (block (result i32)
      (local.set $scratch
       (i32.const -114)
      )
      (local.set $5
       (i64.const 2147483649)
      )
      (local.get $scratch)
     )
    )
    (local.get $scratch_23)
   )
  )
  (block
   (call $fimport$3
    (try (result f32)
     (do
      (local.get $0)
     )
     (catch_all
      (if
       (i32.const -2147483648)
       (then
        (f32.store offset=3 align=1
         (i32.and
          (i32.const -65535)
          (i32.const 15)
         )
         (f32.const -82)
        )
        (block
         (data.drop $0)
         (return)
        )
        (local.set $11
         (unreachable)
        )
       )
       (else
        (call $fimport$2
         (local.get $5)
        )
        (return)
       )
      )
      (unreachable)
     )
    )
   )
   (return)
  )
  (local.set $21
   (unreachable)
  )
 )
 (func $14 (type $8) (param $0 (ref $8))
  (local $1 (ref $5))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (nop)
 )
 (@binaryen.js.called)
 (func $15 (type $9) (param $0 (ref array)) (param $1 (ref $9)) (param $2 v128) (param $3 (ref $3)) (param $4 f64) (param $5 (ref null $10)) (result f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 v128)
  (local $9 v128)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 (ref null $3))
  (local $14 arrayref)
  (local $15 arrayref)
  (local $16 (ref null $7))
  (local $17 (ref $1))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.get $7)
 )
 (@binaryen.js.called)
 (func $16 (type $8) (param $0 (ref $8))
  (local $1 externref)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 f32)
  (local $6 f32)
  (local $scratch (ref (exact $15)))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (f32.store offset=22 align=2
   (i32.and
    (i32.const 536870912)
    (block (result i32)
     (drop
      (block (result (ref (exact $15)))
       (local.set $scratch
        (struct.new_default $15)
       )
       (drop
        (i64.const -1024)
       )
       (local.get $scratch)
      )
     )
     (i32.const 15)
    )
   )
   (local.get $6)
  )
 )
 (func $17 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $16
   (ref.func $4)
  )
 )
 (func $18 (type $12)
  (local $0 f64)
  (local $1 (ref $5))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (unreachable)
  )
  (unreachable)
 )
 (func $19 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $18)
 )
 (func $20 (type $8) (param $0 (ref $8))
  (local $1 structref)
  (local $2 (ref null $4))
  (local $3 (ref $6))
  (local $4 v128)
  (local $5 i64)
  (local $6 i64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $14
   (local.get $0)
  )
 )
 (func $21 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $20
   (ref.func $4)
  )
  (call $20
   (ref.func $8)
  )
 )
 (func $22 (type $28) (param $0 i31ref) (param $1 (ref $3)) (param $2 v128) (result v128 i32 i31ref f32 i31ref)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (tuple.make 5
   (v128.const i32x4 0x00fe787f 0x000100fa 0x5a222a5d 0x73be9307)
   (i32.const -128)
   (ref.null none)
   (f32.const -nan:0x7fd677)
   (ref.i31
    (i32.const -67108864)
   )
  )
 )
 (func $23 (type $12)
  (local $0 (ref null $11))
  (local $1 (ref struct))
  (local $2 (ref struct))
  (local $3 (ref struct))
  (local $4 (ref $3))
  (local $5 stringref)
  (local $6 stringref)
  (local $7 (ref $13))
  (local $8 (ref $13))
  (local $9 (ref $13))
  (local $10 (ref string))
  (local $11 (ref string))
  (local $12 (ref string))
  (local $13 (ref i31))
  (local $14 (ref null $7))
  (local $15 (ref null $7))
  (local $16 (ref null $7))
  (local $17 (ref null $10))
  (local $18 (ref $7))
  (local $19 (ref $7))
  (local $20 (ref $7))
  (local $21 (ref null $2))
  (local $22 (ref null $2))
  (local $23 (ref none))
  (local $24 (ref none))
  (local $25 (ref $0))
  (local $26 (ref null $6))
  (local $27 i31ref)
  (local $28 (ref $8))
  (local $29 (ref func))
  (local $30 (ref null $1))
  (local $31 nullref)
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
  (local $45 i32)
  (local $46 i32)
  (local $47 i32)
  (local $48 i32)
  (local $49 i32)
  (local $50 i32)
  (local $51 i64)
  (local $52 i64)
  (local $53 i64)
  (local $54 i64)
  (local $55 i64)
  (local $56 i64)
  (local $57 i64)
  (local $58 i64)
  (local $59 i64)
  (local $60 i64)
  (local $61 i64)
  (local $62 i64)
  (local $63 i64)
  (local $64 i64)
  (local $65 i64)
  (local $66 i64)
  (local $67 i64)
  (local $68 v128)
  (local $69 f64)
  (local $70 f64)
  (local $71 f64)
  (local $72 f32)
  (local $73 f32)
  (local $scratch (ref $2))
  (local $scratch_75 i32)
  (local $scratch_76 f64)
  (local $scratch_77 i64)
  (local $scratch_78 f64)
  (local $scratch_79 (tuple v128 i32 i31ref f32 i31ref))
  (local $scratch_80 f32)
  (local $scratch_81 i31ref)
  (local $scratch_82 i32)
  (local $scratch_83 v128)
  (local $scratch_84 (tuple v128 i32 i31ref f32 i31ref))
  (local $scratch_85 f32)
  (local $scratch_86 i31ref)
  (local $scratch_87 i32)
  (local $scratch_88 v128)
  (local $scratch_89 (tuple f64 i64 f64 i32 (ref $2) i64))
  (local $scratch_90 (ref $2))
  (local $scratch_91 i32)
  (local $scratch_92 f64)
  (local $scratch_93 i64)
  (local $scratch_94 f64)
  (local $scratch_95 (tuple v128 i32 i31ref f32 i31ref))
  (local $scratch_96 f32)
  (local $scratch_97 i31ref)
  (local $scratch_98 i32)
  (local $scratch_99 v128)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $70
   (block (result f64)
    (local.set $scratch_78
     (local.get $70)
    )
    (local.set $62
     (block (result i64)
      (local.set $scratch_77
       (local.get $62)
      )
      (local.set $71
       (block (result f64)
        (local.set $scratch_76
         (local.get $71)
        )
        (local.set $41
         (block (result i32)
          (local.set $scratch_75
           (local.get $41)
          )
          (local.set $21
           (block (result (ref $2))
            (local.set $scratch
             (ref.as_non_null
              (local.get $21)
             )
            )
            (local.set $63
             (local.get $63)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_75)
         )
        )
        (local.get $scratch_76)
       )
      )
      (local.get $scratch_77)
     )
    )
    (local.get $scratch_78)
   )
  )
  (local.set $17
   (ref.as_non_null
    (local.get $17)
   )
  )
  (local.set $13
   (ref.i31
    (i32.const -12)
   )
  )
  (local.set $7
   (array.new $13
    (local.get $32)
    (i32.and
     (i32.const 18)
     (i32.const 1023)
    )
   )
  )
  (drop
   (block (result v128)
    (local.set $scratch_83
     (tuple.extract 5 0
      (local.tee $scratch_79
       (call $22
        (ref.i31
         (i32.const 32768)
        )
        (struct.new $3
         (if (result i32)
          (if (result i32)
           (ref.is_null
            (array.new_fixed $14 0)
           )
           (then
            (i32.atomic.rmw.or acqrel offset=22
             (i32.and
              (global.get $global$22)
              (i32.const 15)
             )
             (global.get $global$22)
            )
           )
           (else
            (data.drop $0)
            (i32.const -4436467)
           )
          )
          (then
           (loop $label (result i32)
            (if
             (i32.eqz
              (global.get $global$29)
             )
             (then
              (global.set $global$29
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$29
             (i32.sub
              (global.get $global$29)
              (i32.const 1)
             )
            )
            (block $block
             (call $fimport$6
              (local.get $0)
             )
             (drop
              (i32.add
               (local.tee $37
                (if (result i32)
                 (i32.eqz
                  (block (result i32)
                   (block
                    (block
                     (nop)
                     (nop)
                    )
                    (br $label)
                   )
                   (if
                    (unreachable)
                    (then
                     (call $fimport$6
                      (struct.new_default $15)
                     )
                     (br $label)
                    )
                    (else
                     (nop)
                     (block
                      (loop
                       (if
                        (i32.eqz
                         (global.get $global$29)
                        )
                        (then
                         (global.set $global$29
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$29
                        (i32.sub
                         (global.get $global$29)
                         (i32.const 1)
                        )
                       )
                       (block
                        (global.set $global$21
                         (f32.load offset=22 align=1
                          (i32.and
                           (local.get $32)
                           (i32.const 15)
                          )
                         )
                        )
                        (call_indirect $0 (type $8)
                         (ref.as_non_null
                          (ref.null nofunc)
                         )
                         (i32.const 0)
                        )
                       )
                      )
                      (br $block)
                     )
                     (unreachable)
                    )
                   )
                   (unreachable)
                  )
                 )
                 (then
                  (drop
                   (local.get $32)
                  )
                  (drop
                   (try (result f32)
                    (do
                     (f32.const -117)
                    )
                    (catch $tag$0
                     (throw $tag$0 (pop i64))
                     (drop
                      (br_on_null $label
                       (local.tee $1
                        (local.tee $2
                         (local.tee $3
                          (local.tee $4
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                         )
                        )
                       )
                      )
                     )
                     (drop
                      (v128.const i32x4 0x0000ffd6 0x00000000 0xffffffff 0xffffffff)
                     )
                     (f32x4.extract_lane 2
                      (select
                       (v128.const i32x4 0xffffffbe 0xfffffc00 0xfffbffff 0x00005540)
                       (block
                        (call $fimport$7
                         (ref.as_non_null
                          (ref.null nofunc)
                         )
                        )
                        (br $label)
                       )
                       (local.set $13
                        (local.set $8
                         (local.set $7
                          (local.set $10
                           (unreachable)
                          )
                         )
                        )
                       )
                      )
                     )
                    )
                    (catch_all
                     (global.get $global$21)
                    )
                   )
                  )
                  (drop
                   (try (result f64)
                    (do
                     (f64.const -67108864)
                    )
                    (catch $tag$0
                     (local.set $52 (call $__popsink_0 (pop i64)))
                     (f64.const -nan:0xfffffffffec4c)
                    )
                   )
                  )
                  (block
                   (call $fimport$4
                    (f64.const -nan:0xfffffffff9903)
                   )
                   (br $label)
                  )
                  (unreachable)
                 )
                 (else
                  (try_table (catch_all $label)
                   (if
                    (i32.lt_u
                     (local.tee $36
                      (try (result i32)
                       (do
                        (if (result i32)
                         (i32.eqz
                          (ref.is_null
                           (ref.null none)
                          )
                         )
                         (then
                          (ref.eq
                           (if (result (ref $4))
                            (i32.eqz
                             (i32.const 194)
                            )
                            (then
                             (ref.as_non_null
                              (ref.null none)
                             )
                            )
                            (else
                             (global.get $global$28)
                            )
                           )
                           (struct.new_default $15)
                          )
                         )
                         (else
                          (drop
                           (ref.as_non_null
                            (ref.null none)
                           )
                          )
                          (call $fimport$2
                           (local.set $55
                            (unreachable)
                           )
                          )
                          (br $label)
                         )
                        )
                       )
                       (catch $tag$0
                        (local.set $56 (pop i64))
                        (ref.eq
                         (array.new_fixed $14 0)
                         (array.new $0
                          (f64.const -nan:0xfffffffbc0961)
                          (i32.and
                           (i32.const 98)
                           (i32.const 1023)
                          )
                         )
                        )
                       )
                      )
                     )
                     (block (result i32)
                      (drop
                       (br_on_null $block
                        (select (result (ref struct))
                         (local.tee $3
                          (struct.new_default $15)
                         )
                         (struct.new_default $15)
                         (local.get $32)
                        )
                       )
                      )
                      (array.len
                       (local.tee $15
                        (local.tee $14
                         (loop $label1 (result (ref none))
                          (if
                           (i32.eqz
                            (global.get $global$29)
                           )
                           (then
                            (global.set $global$29
                             (i32.const 100)
                            )
                            (unreachable)
                           )
                          )
                          (global.set $global$29
                           (i32.sub
                            (global.get $global$29)
                            (i32.const 1)
                           )
                          )
                          (block
                           (call $fimport$5
                            (global.get $global$0)
                           )
                           (call $fimport$6
                            (struct.new_default $15)
                           )
                          )
                          (br_if $label1
                           (i32.eqz
                            (local.get $32)
                           )
                          )
                          (block (result (ref none))
                           (call $fimport$2
                            (local.get $55)
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
                    )
                    (then
                     (array.set $7
                      (local.get $15)
                      (local.get $36)
                      (struct.new_default_desc $5
                       (struct.new $6
                        (i32.const 125)
                       )
                      )
                     )
                    )
                   )
                  )
                  (struct.get_u $10 0
                   (ref.as_non_null
                    (local.tee $17
                     (try (result (ref (exact $10)))
                      (do
                       (ref.cast (ref none)
                        (array.new $7
                         (ref.as_non_null
                          (ref.null none)
                         )
                         (i32.and
                          (i32.const 14)
                          (i32.const 1023)
                         )
                        )
                       )
                      )
                      (catch $tag$0
                       (local.set $57 (select (pop i64) (local.get $57) (i32.const 7)))
                       (struct.new_default $10)
                      )
                     )
                    )
                   )
                  )
                 )
                )
               )
               (local.tee $38
                (i32.const -21996)
               )
              )
             )
             (try_table (catch_all $block)
              (call $fimport$6
               (ref.i31
                (i32.const -6001397)
               )
              )
              (br $label)
             )
             (local.set $18
              (unreachable)
             )
            )
            (br_if $label
             (i31.get_u
              (local.get $13)
             )
            )
            (global.get $global$12)
           )
          )
          (else
           (return)
          )
         )
         (f32.load offset=22
          (i32.and
           (local.get $32)
           (i32.const 15)
          )
         )
         (local.get $69)
         (array.new_default $2
          (i32.and
           (i32.const 17)
           (i32.const 1023)
          )
         )
        )
        (v128.const i32x4 0xf77f9e00 0x430100f0 0x6cff017f 0xfb2a6280)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_82
       (tuple.extract 5 1
        (local.get $scratch_79)
       )
      )
      (drop
       (block (result i31ref)
        (local.set $scratch_81
         (tuple.extract 5 2
          (local.get $scratch_79)
         )
        )
        (drop
         (block (result f32)
          (local.set $scratch_80
           (tuple.extract 5 3
            (local.get $scratch_79)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_79)
           )
          )
          (local.get $scratch_80)
         )
        )
        (local.get $scratch_81)
       )
      )
      (local.get $scratch_82)
     )
    )
    (local.get $scratch_83)
   )
  )
  (drop
   (block (result v128)
    (local.set $scratch_88
     (tuple.extract 5 0
      (local.tee $scratch_84
       (call $22
        (ref.null none)
        (struct.new_default $3)
        (v128.const i32x4 0xffff9905 0x00000000 0xfc000000 0x6e054349)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_87
       (tuple.extract 5 1
        (local.get $scratch_84)
       )
      )
      (drop
       (block (result i31ref)
        (local.set $scratch_86
         (tuple.extract 5 2
          (local.get $scratch_84)
         )
        )
        (drop
         (block (result f32)
          (local.set $scratch_85
           (tuple.extract 5 3
            (local.get $scratch_84)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_84)
           )
          )
          (local.get $scratch_85)
         )
        )
        (local.get $scratch_86)
       )
      )
      (local.get $scratch_87)
     )
    )
    (local.get $scratch_88)
   )
  )
  (drop
   (ref.null none)
  )
  (drop
   (string.encode_wtf16_array
    (ref.as_non_null
     (local.get $5)
    )
    (block $block2 (result (ref $13))
     (call $fimport$8
      (ref.null noextern)
     )
     (loop $label2
      (if
       (i32.eqz
        (global.get $global$29)
       )
       (then
        (global.set $global$29
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$29
       (i32.sub
        (global.get $global$29)
        (i32.const 1)
       )
      )
      (block $block1
       (call $fimport$3
        (try (result f32)
         (do
          (local.tee $72
           (try (result f32)
            (do
             (try_table (result f32) (catch_all $label2)
              (local.get $73)
             )
            )
            (catch $tag$0
             (local.set $58 (i64.xor (pop i64) (i64.const 12)))
             (global.get $global$21)
            )
            (catch_all
             (call $fimport$8
              (ref.null noextern)
             )
             (br $block1)
            )
           )
          )
         )
         (catch $tag$0
          (drop (pop i64))
          (drop
           (br_on_cast_fail $block2 (ref (exact $13)) (ref (exact $13))
            (array.new $13
             (i32.const 2147483647)
             (i32.and
              (i32.const 14)
              (i32.const 1023)
             )
            )
           )
          )
          (if (result f32)
           (local.tee $32
            (local.tee $32
             (ref.test (ref string)
              (string.const "")
             )
            )
           )
           (then
            (global.get $global$21)
           )
           (else
            (drop
             (block (result f64)
              (local.set $scratch_94
               (tuple.extract 6 0
                (local.tee $scratch_89
                 (block (type $41) (result f64 i64 f64 i32 (ref $2) i64)
                  (nop)
                  (tuple.make 6
                   (local.get $70)
                   (local.get $62)
                   (local.get $71)
                   (local.get $41)
                   (ref.as_non_null
                    (local.get $21)
                   )
                   (local.get $63)
                  )
                 )
                )
               )
              )
              (drop
               (block (result i64)
                (local.set $scratch_93
                 (tuple.extract 6 1
                  (local.get $scratch_89)
                 )
                )
                (drop
                 (block (result f64)
                  (local.set $scratch_92
                   (tuple.extract 6 2
                    (local.get $scratch_89)
                   )
                  )
                  (local.set $50
                   (block (result i32)
                    (local.set $scratch_91
                     (tuple.extract 6 3
                      (local.get $scratch_89)
                     )
                    )
                    (drop
                     (block (result (ref $2))
                      (local.set $scratch_90
                       (tuple.extract 6 4
                        (local.get $scratch_89)
                       )
                      )
                      (drop
                       (tuple.extract 6 5
                        (local.get $scratch_89)
                       )
                      )
                      (local.get $scratch_90)
                     )
                    )
                    (local.get $scratch_91)
                   )
                  )
                  (local.get $scratch_92)
                 )
                )
                (local.get $scratch_93)
               )
              )
              (local.get $scratch_94)
             )
            )
            (br_if $block1
             (local.get $50)
            )
            (br $block1)
           )
          )
         )
         (catch_all
          (local.tee $72
           (if (result f32)
            (i32.eqz
             (ref.test (ref none)
              (array.new_default $0
               (i32.const 90)
              )
             )
            )
            (then
             (call $fimport$4
              (if (result f64)
               (i32.lt_u
                (local.tee $42
                 (string.eq
                  (string.const "")
                  (string.const "\ed\a0\80\f0\90\8d\88")
                 )
                )
                (array.len
                 (local.tee $23
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
               (then
                (drop
                 (local.get $23)
                )
                (drop
                 (local.get $42)
                )
                (unreachable)
               )
               (else
                (f64.const -2147483648)
               )
              )
             )
             (local.get $73)
            )
            (else
             (br $block1)
            )
           )
          )
         )
        )
       )
       (call $fimport$6
        (struct.new_default $15)
       )
      )
     )
     (local.get $7)
    )
    (global.get $global$22)
   )
  )
  (drop
   (loop $label3 (result f32)
    (if
     (i32.eqz
      (global.get $global$29)
     )
     (then
      (global.set $global$29
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$29
     (i32.sub
      (global.get $global$29)
      (i32.const 1)
     )
    )
    (block
     (try_table (catch_all $label3)
      (block
       (nop)
       (br $label3)
      )
      (local.set $25
       (local.set $13
        (unreachable)
       )
      )
     )
     (unreachable)
    )
    (local.set $28
     (local.set $9
      (local.set $11
       (local.set $24
        (unreachable)
       )
      )
     )
    )
   )
  )
  (drop
   (i32.and
    (i32.const -24)
    (i32.const 15)
   )
  )
  (drop
   (drop
    (drop
     (drop
      (drop
       (call $22
        (block ;; (replaces unreachable StructNew we can't emit)
         (drop
          (f64.convert_i32_u
           (memory.atomic.notify offset=22
            (if
             (if (result i32)
              (ref.eq
               (global.get $global$25)
               (block (result (ref (exact $15)))
                (call $fimport$6
                 (array.new_fixed $14 0)
                )
                (struct.new_default $15)
               )
              )
              (then
               (nop)
               (return)
              )
              (else
               (local.get $32)
              )
             )
             (then
              (call $fimport$1
               (block $block4 (result i32)
                (call $fimport$7
                 (if (result (ref func))
                  (i32.eqz
                   (loop (result i32)
                    (if
                     (i32.eqz
                      (global.get $global$29)
                     )
                     (then
                      (global.set $global$29
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$29
                     (i32.sub
                      (global.get $global$29)
                      (i32.const 1)
                     )
                    )
                    (select
                     (local.get $32)
                     (local.get $32)
                     (i32.const -5824707)
                    )
                   )
                  )
                  (then
                   (block $block3 (result (ref func))
                    (br_on_non_null $block3
                     (ref.func $23)
                    )
                    (call $fimport$1
                     (i32.const 524288)
                    )
                    (local.tee $29
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                    )
                   )
                  )
                  (else
                   (ref.func $23)
                  )
                 )
                )
                (br_if $block4
                 (block (result i32)
                  (call $fimport$7
                   (local.get $30)
                  )
                  (i32.const 32769)
                 )
                 (local.tee $32
                  (local.get $32)
                 )
                )
               )
              )
              (return)
             )
             (else
              (if
               (i32.lt_u
                (local.tee $47
                 (ref.eq
                  (try_table (result (ref (exact $10)))
                   (struct.new $10
                    (local.get $32)
                    (global.get $global$15)
                    (f64.const 0)
                    (local.get $22)
                   )
                  )
                  (array.new_default $0
                   (i32.and
                    (i32.const 92)
                    (i32.const 1023)
                   )
                  )
                 )
                )
                (array.len
                 (local.tee $20
                  (block (result (ref $7))
                   (call $fimport$6
                    (struct.new_default $15)
                   )
                   (ref.as_non_null
                    (local.get $16)
                   )
                  )
                 )
                )
               )
               (then
                (array.set $7
                 (local.get $20)
                 (local.get $47)
                 (struct.new_default_desc $5
                  (struct.new_default $6)
                 )
                )
               )
              )
              (return)
             )
            )
            (local.set $32
             (local.set $12
              (unreachable)
             )
            )
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
          (array.new_default $2
           (i32.and
            (i32.const 24)
            (i32.const 1023)
           )
          )
         )
         (unreachable)
        )
        (unreachable)
        (v128.const i32x4 0x00000001 0xffffffff 0x00000401 0x00000000)
       )
      )
     )
    )
   )
  )
  (drop
   (block (result v128)
    (local.set $scratch_99
     (tuple.extract 5 0
      (local.tee $scratch_95
       (call $22
        (ref.i31
         (i32.const -32767)
        )
        (struct.new_default $3)
        (v128.const i32x4 0xffe9ffb4 0xff8cffd1 0xffaf7fff 0x00ba0000)
       )
      )
     )
    )
    (drop
     (block (result i32)
      (local.set $scratch_98
       (tuple.extract 5 1
        (local.get $scratch_95)
       )
      )
      (drop
       (block (result i31ref)
        (local.set $scratch_97
         (tuple.extract 5 2
          (local.get $scratch_95)
         )
        )
        (drop
         (block (result f32)
          (local.set $scratch_96
           (tuple.extract 5 3
            (local.get $scratch_95)
           )
          )
          (drop
           (tuple.extract 5 4
            (local.get $scratch_95)
           )
          )
          (local.get $scratch_96)
         )
        )
        (local.get $scratch_97)
       )
      )
      (local.get $scratch_98)
     )
    )
    (local.get $scratch_99)
   )
  )
 )
 (func $24 (type $29) (result f32)
  (local $0 stringref)
  (local $1 (ref null $7))
  (local $2 eqref)
  (local $3 (ref $8))
  (local $4 exnref)
  (local $5 (ref $11))
  (local $6 funcref)
  (local $7 (ref array))
  (local $8 (ref struct))
  (local $9 (ref i31))
  (local $10 (ref i31))
  (local $11 f32)
  (local $12 f64)
  (local $13 f64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  (local $17 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (loop $label1 (result f32)
   (if
    (i32.eqz
     (global.get $global$29)
    )
    (then
     (global.set $global$29
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$29
    (i32.sub
     (global.get $global$29)
     (i32.const 1)
    )
   )
   (call $fimport$6
    (ref.i31
     (i32.const -2)
    )
   )
   (br_if $label1
    (i31.get_u
     (local.tee $9
      (loop $label (result (ref i31))
       (if
        (i32.eqz
         (global.get $global$29)
        )
        (then
         (global.set $global$29
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$29
        (i32.sub
         (global.get $global$29)
         (i32.const 1)
        )
       )
       (call $fimport$3
        (global.get $global$21)
       )
       (br_if $label
        (i32.eqz
         (local.tee $16
          (i31.get_u
           (local.tee $10
            (br_on_null $label
             (ref.null none)
            )
           )
          )
         )
        )
       )
       (local.get $10)
      )
     )
    )
   )
   (f32.const -0.9810000061988831)
  )
 )
 (func $25 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $24)
  )
  (drop
   (call $24)
  )
 )
 (func $26 (type $30) (param $0 eqref)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 v128)
  (local $8 f64)
  (local $9 i31ref)
  (local $10 (ref $6))
  (local $11 anyref)
  (local $12 (ref null $0))
  (local $13 (ref null $10))
  (local $14 (ref null $10))
  (local $15 (ref null $3))
  (local $16 (ref string))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $27 (type $8) (param $0 (ref $8))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$2
    (i64.const 68719476736)
   )
  )
 )
 (func $28 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $27
   (ref.func $4)
  )
 )
 (func $29 (type $8) (param $0 (ref $8))
  (local $1 i31ref)
  (local $2 (ref null $8))
  (local $3 (ref null $8))
  (local $4 (ref null $3))
  (local $5 (ref $11))
  (local $6 structref)
  (local $7 (ref array))
  (local $8 eqref)
  (local $9 i32)
  (local $10 i32)
  (local $11 v128)
  (local $12 f32)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (return_call_ref $20
   (f64.const -31.864)
   (ref.func $fimport$4)
  )
 )
 (func $30 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $29
   (ref.func $4)
  )
  (call $29
   (ref.func $20)
  )
 )
 (func $31 (type $31) (param $0 f64) (param $1 funcref) (param $2 f64) (param $3 i64) (result (ref $0))
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 (ref null $6))
  (local $10 (ref array))
  (local $11 (ref $4))
  (local $12 arrayref)
  (local $13 i31ref)
  (local $scratch f32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (drop
    (block (result f32)
     (local.set $scratch
      (f32.const 2147483648)
     )
     (drop
      (ref.null none)
     )
     (local.get $scratch)
    )
   )
   (return
    (array.new $0
     (local.get $2)
     (i32.and
      (i32.const 10)
      (i32.const 1023)
     )
    )
   )
  )
  (unreachable)
 )
 (func $32 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $31
    (f64.const -1)
    (ref.func $32)
    (f64.const 4294967240)
    (i64.const -4398046511105)
   )
  )
  (drop
   (call $31
    (f64.const 187)
    (ref.func $32)
    (f64.const 2147483646.804)
    (i64.const -67108864)
   )
  )
  (drop
   (call $31
    (f64.const 11054)
    (ref.func $32)
    (f64.const 2097151.788)
    (i64.const 32)
   )
  )
  (drop
   (call $31
    (f64.const -nan:0xfffffffffff80)
    (ref.func $32)
    (f64.const -nan:0xfffffffffed31)
    (i64.const 2305843009213693953)
   )
  )
 )
 (func $33 (type $9) (param $0 (ref array)) (param $1 (ref $9)) (param $2 v128) (param $3 (ref $3)) (param $4 f64) (param $5 (ref null $10)) (result f32)
  (local $6 funcref)
  (local $7 (ref $10))
  (local $8 anyref)
  (local $9 anyref)
  (local $10 (ref $4))
  (local $11 (ref null $8))
  (local $12 externref)
  (local $13 i64)
  (local $14 i64)
  (local $15 f32)
  (local $16 f32)
  (local $17 i32)
  (local $18 f64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.get $16)
 )
 (func $34 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $33
    (array.new_fixed $14 0)
    (ref.func $33)
    (v128.const i32x4 0xffffd453 0xffffffff 0x00000000 0x00000004)
    (struct.new_default $3)
    (f64.const -19)
    (ref.null none)
   )
  )
 )
 (func $35 (type $1) (param $0 (ref $3)) (param $1 f32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 v128)
  (local $13 v128)
  (local $14 f32)
  (local $15 f32)
  (local $16 f64)
  (local $17 f64)
  (local $18 eqref)
  (local $19 (ref null $0))
  (local $20 (ref null $2))
  (local $21 (ref null $11))
  (local $22 (ref struct))
  (local $23 (ref null $5))
  (local $24 structref)
  (local $25 (ref null $7))
  (local $26 i31ref)
  (local $27 (ref null $8))
  (local $28 arrayref)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$1
    (local.get $2)
   )
   (call $fimport$5
    (local.get $12)
   )
  )
 )
 (func $36 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $35
   (struct.new_default $3)
   (f32.const -nan:0x14395b)
   (i32.const -69)
  )
  (call $35
   (struct.new_default $3)
   (f32.const -1.1754943508222875e-38)
   (i32.const -7636163)
  )
 )
 (func $37 (type $32) (param $0 (ref $8)) (param $1 (ref $7)) (param $2 arrayref) (result f32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block (result f32)
   (call $fimport$3
    (try (result f32)
     (do
      (global.get $global$15)
     )
     (catch_all
      (f32.const -14512)
     )
    )
   )
   (global.get $global$21)
  )
 )
 (@binaryen.js.called)
 (func $38 (type $33) (param $0 eqref) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 (ref string))
  (local $16 (ref string))
  (local $17 (ref none))
  (local $18 (ref none))
  (local $19 externref)
  (local $20 (ref func))
  (local $21 (ref $7))
  (local $22 (ref $7))
  (local $23 (ref $7))
  (local $24 (ref $7))
  (local $scratch v128)
  (local $scratch_26 (ref (exact $14)))
  (local $scratch_27 f64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $16
   (global.get $global$3)
  )
  (block $block1
   (block $block
    (block
     (call $fimport$6
      (block (result (ref i31))
       (try_table (catch_all $block)
        (memory.init $1
         (i32.and
          (i8x16.extract_lane_u 11
           (v128.const i32x4 0x00013e77 0x42100000 0x00000000 0xc0a00000)
          )
          (i32.const 15)
         )
         (i32.const 0)
         (i32.const 0)
        )
       )
       (block (result (ref i31))
        (nop)
        (ref.i31
         (i32.const -5630161)
        )
       )
      )
     )
     (atomic.fence acqrel)
     (call $25)
    )
    (try_table (catch_all $block1)
     (call $fimport$8
      (block (result (ref string))
       (block
        (block
         (nop)
         (br $block1)
        )
        (local.set $17
         (local.set $15
          (unreachable)
         )
        )
       )
       (local.set $16
        (local.set $16
         (unreachable)
        )
       )
      )
     )
    )
   )
   (call $fimport$7
    (local.tee $20
     (select (result (ref (exact $8)))
      (ref.func $16)
      (ref.func $14)
      (block (result i32)
       (drop
        (block (result f64)
         (local.set $scratch_27
          (f64.const 1125899906842625)
         )
         (drop
          (block (result (ref (exact $14)))
           (local.set $scratch_26
            (array.new_fixed $14 0)
           )
           (drop
            (block (result v128)
             (local.set $scratch
              (v128.const i32x4 0xffffff8c 0xffffff8f 0x02000000 0x9a613e25)
             )
             (local.set $10
              (i32.const 124)
             )
             (local.get $scratch)
            )
           )
           (local.get $scratch_26)
          )
         )
         (local.get $scratch_27)
        )
       )
       (call $26
        (struct.new $3
         (local.get $10)
         (f32.add
          (f32.const 7)
          (global.get $global$15)
         )
         (block (result f64)
          (try
           (do
            (call $fimport$0
             (i32.const 0)
            )
           )
           (catch_all
            (if
             (i32.lt_u
              (i32.add
               (local.tee $6
                (i32.wrap_i64
                 (i64.const -140737488355329)
                )
               )
               (local.tee $7
                (local.get $2)
               )
              )
              (array.len
               (local.tee $18
                (try_table (result (ref none)) (catch_all $block1)
                 (ref.as_non_null
                  (ref.null none)
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
                  (try (result i32)
                   (do
                    (try (result i32)
                     (do
                      (try (result i32)
                       (do
                        (i32.const 256)
                       )
                       (catch $tag$0
                        (drop (pop i64))
                        (i32.const -73)
                       )
                      )
                     )
                     (catch $tag$0
                      (local.set $13 (select (pop i64) (local.get $13) (i32.const 0)))
                      (local.get $3)
                     )
                     (catch_all
                      (i32.const -38)
                     )
                    )
                   )
                   (catch $tag$0
                    (local.set $14 (call $__popsink_0 (pop i64)))
                    (i32.const 678972777)
                   )
                  )
                 )
                 (local.tee $9
                  (local.get $7)
                 )
                )
                (array.len
                 (local.tee $24
                  (select (result (ref $7))
                   (ref.as_non_null
                    (ref.null none)
                   )
                   (local.tee $21
                    (local.tee $22
                     (local.tee $23
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                   )
                   (local.get $2)
                  )
                 )
                )
               )
               (then
                (drop
                 (local.get $18)
                )
                (drop
                 (local.get $6)
                )
                (drop
                 (local.get $24)
                )
                (drop
                 (local.get $8)
                )
                (drop
                 (local.get $9)
                )
                (unreachable)
               )
              )
             )
            )
           )
          )
          (f64.min
           (f64.const -2147483648.214)
           (f64.const -4294967295.194)
          )
         )
         (if (result (ref (exact $2)))
          (i32.eqz
           (i32.const 240)
          )
          (then
           (nop)
           (br $block1)
          )
          (else
           (array.new $2
            (ref.as_non_null
             (ref.null none)
            )
            (i32.and
             (i32.const 76)
             (i32.const 1023)
            )
           )
          )
         )
        )
       )
       (i32.const 1073741823)
      )
     )
    )
   )
  )
 )
 (func $39 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $38
   (struct.new_default $15)
   (i64.const 32768)
  )
 )
 (func $40 (type $9) (param $0 (ref array)) (param $1 (ref $9)) (param $2 v128) (param $3 (ref $3)) (param $4 f64) (param $5 (ref null $10)) (result f32)
  (local $6 (ref $3))
  (local $7 exnref)
  (local $8 (ref $11))
  (local $9 eqref)
  (local $10 eqref)
  (local $11 externref)
  (local $12 (ref null $7))
  (local $13 (ref struct))
  (local $14 arrayref)
  (local $15 (ref null $10))
  (local $16 structref)
  (local $17 f64)
  (local $18 f64)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block
   (call $16
    (ref.func $14)
   )
   (return
    (f32.const -nan:0x7ffff7)
   )
  )
  (unreachable)
 )
 (func $41 (type $12)
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 v128)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 (ref $4))
  (local $9 (ref $11))
  (local $scratch f64)
  (local $scratch_11 (ref (exact $10)))
  (local $scratch_12 (ref (exact $6)))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $40
    (array.new_fixed $14 0)
    (ref.func $33)
    (v128.const i32x4 0xffffff98 0xffffc634 0xff924940 0xc2540000)
    (struct.new_default $3)
    (f64.const -1.189)
    (ref.null none)
   )
  )
  (drop
   (call $40
    (array.new_fixed $14 0)
    (ref.func $15)
    (v128.const i32x4 0x000000fe 0x00000000 0x0000006a 0x00000000)
    (struct.new_default $3)
    (f64.const -nan:0xfffffffffffc7)
    (struct.new $10
     (loop $label (result i32)
      (if
       (i32.eqz
        (global.get $global$29)
       )
       (then
        (global.set $global$29
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$29
       (i32.sub
        (global.get $global$29)
        (i32.const 1)
       )
      )
      (block $block (result i32)
       (call $fimport$1
        (ref.eq
         (array.new $7
          (struct.new_desc $5
           (string.const "914949\ed\a0\80")
           (ref.null none)
           (if (result i32)
            (i32.eqz
             (i32.atomic.load8_u offset=4
              (i32.and
               (stringview_wtf16.get_codeunit
                (string.const "343")
                (block (result i32)
                 (local.set $7
                  (i32.const -1657445618)
                 )
                 (local.get $7)
                )
               )
               (i32.const 15)
              )
             )
            )
            (then
             (call $fimport$2
              (i64.atomic.rmw16.sub_u offset=22
               (i32.and
                (i32.const -62)
                (i32.const 15)
               )
               (i64.const -5307059)
              )
             )
             (br $label)
            )
            (else
             (br_if $block
              (i32.const 32768)
              (i32.eqz
               (i32.const 5)
              )
             )
            )
           )
           (ref.func $7)
           (local.tee $0
            (local.get $1)
           )
           (block (result i64)
            (drop
             (br_on_null $label
              (struct.new_default_desc $5
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (i64.const -2147483648)
           )
           (ref.as_non_null
            (ref.null none)
           )
          )
          (i32.and
           (i32.const 6)
           (i32.const 1023)
          )
         )
         (ref.null none)
        )
       )
       (i32.const -65535)
      )
     )
     (try_table (result f32)
      (global.get $global$21)
     )
     (local.tee $0
      (if (result f64)
       (i32.const 65435)
       (then
        (block $block1 (result f64)
         (call $fimport$2
          (i64.const 1896902522)
         )
         (if (result f64)
          (i32.or
           (ref.eq
            (loop (result (ref (exact $10)))
             (if
              (i32.eqz
               (global.get $global$29)
              )
              (then
               (global.set $global$29
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$29
              (i32.sub
               (global.get $global$29)
               (i32.const 1)
              )
             )
             (block (result (ref (exact $10)))
              (table.set $0
               (i32.const 3)
               (ref.cast (ref nofunc)
                (ref.as_non_null
                 (ref.null nofunc)
                )
               )
              )
              (struct.new $10
               (i32.const -32767)
               (f32.const -nan:0x7fbe17)
               (local.get $0)
               (array.new_default $2
                (i32.and
                 (i32.const 79)
                 (i32.const 1023)
                )
               )
              )
             )
            )
            (if (result (ref (exact $3)))
             (i32.eqz
              (i32.atomic.load8_u acqrel offset=22
               (i32.and
                (f64.eq
                 (local.get $0)
                 (local.get $0)
                )
                (i32.const 15)
               )
              )
             )
             (then
              (nop)
              (return)
             )
             (else
              (struct.new $3
               (f64.ge
                (select
                 (block (result f64)
                  (nop)
                  (f64.const -2097150.802)
                 )
                 (local.get $0)
                 (i16x8.extract_lane_u 2
                  (i64x2.gt_s
                   (block (result v128)
                    (nop)
                    (v128.const i32x4 0xffb54d2f 0x0e09081a 0x00007fff 0xfffff000)
                   )
                   (local.tee $3
                    (v128.const i32x4 0xcf800000 0xbe4dd2f2 0x53000000 0x5f000000)
                   )
                  )
                 )
                )
                (select
                 (local.get $1)
                 (local.get $0)
                 (i32.const 204)
                )
               )
               (global.get $global$21)
               (local.get $1)
               (array.new_default $2
                (i32.and
                 (i32.const 98)
                 (i32.const 1023)
                )
               )
              )
             )
            )
           )
           (i32.const -85)
          )
          (then
           (br_if $block1
            (try (result f64)
             (do
              (drop
               (block (result (ref (exact $6)))
                (local.set $scratch_12
                 (struct.new $6
                  (i32.const -2147483648)
                 )
                )
                (drop
                 (block (result (ref (exact $10)))
                  (local.set $scratch_11
                   (struct.new $10
                    (i32.const -61)
                    (f32.const -0.5809999704360962)
                    (local.get $0)
                    (array.new $2
                     (ref.null none)
                     (i32.and
                      (i32.const 46)
                      (i32.const 1023)
                     )
                    )
                   )
                  )
                  (local.set $2
                   (block (result f64)
                    (local.set $scratch
                     (f64.const -nan:0xfffffffffffb2)
                    )
                    (drop
                     (f32.const -121)
                    )
                    (local.get $scratch)
                   )
                  )
                  (local.get $scratch_11)
                 )
                )
                (local.get $scratch_12)
               )
              )
              (local.get $2)
             )
             (catch $tag$0
              (local.set $4 (select (pop i64) (local.get $4) (i32.const 7)))
              (local.tee $0
               (select
                (local.tee $0
                 (local.tee $1
                  (if (result f64)
                   (i32.const -32767)
                   (then
                    (f64.const 31566)
                   )
                   (else
                    (local.tee $1
                     (f64.const -1024)
                    )
                   )
                  )
                 )
                )
                (f64.const 274877906944)
                (i32.const -8117)
               )
              )
             )
             (catch_all
              (call $fimport$6
               (try_table (result (ref struct))
                (global.get $global$1)
               )
              )
              (return)
             )
            )
            (i32.const 0)
           )
          )
          (else
           (call $41)
           (return)
          )
         )
        )
       )
       (else
        (loop $label1
         (if
          (i32.eqz
           (global.get $global$29)
          )
          (then
           (global.set $global$29
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$29
          (i32.sub
           (global.get $global$29)
           (i32.const 1)
          )
         )
         (block
          (call $fimport$6
           (local.tee $9
            (struct.new_default $11)
           )
          )
          (br $label1)
         )
         (unreachable)
        )
        (unreachable)
       )
      )
     )
     (array.new_default $2
      (i32.and
       (i32.const 87)
       (i32.const 1023)
      )
     )
    )
   )
  )
  (drop
   (call $40
    (array.new_fixed $14 0)
    (ref.func $33)
    (v128.const i32x4 0x00000000 0xb8100000 0x00000d48 0xc2800000)
    (struct.new $3
     (i32.const 110)
     (call_ref $9
      (array.new_fixed $14 0)
      (block (result (ref (exact $9)))
       (call $fimport$2
        (i64.const -38)
       )
       (ref.func $33)
      )
      (local.get $3)
      (try (result (ref $11))
       (do
        (if (result (ref (exact $11)))
         (i32.const -55)
         (then
          (block $block2 (result (ref (exact $11)))
           (call $fimport$6
            (try (result (ref i31))
             (do
              (br_on_non_null $block2
               (ref.null none)
              )
              (ref.i31
               (i32.const -2147483647)
              )
             )
             (catch_all
              (ref.cast (ref i31)
               (ref.i31
                (i32.const 129)
               )
              )
             )
            )
           )
           (struct.new $11
            (i32.const 128)
            (f32.const -nan:0x354024)
            (local.get $0)
            (array.new_default $2
             (i32.and
              (i32.const 15)
              (i32.const 1023)
             )
            )
            (i32.const -255)
           )
          )
         )
         (else
          (call $fimport$4
           (local.get $0)
          )
          (return)
         )
        )
       )
       (catch $tag$0
        (local.set $5 (pop i64))
        (struct.new_default $11)
       )
       (catch_all
        (local.tee $9
         (global.get $global$23)
        )
       )
      )
      (f64x2.extract_lane 1
       (global.get $global$0)
      )
      (struct.new $10
       (i32.const -105)
       (global.get $global$15)
       (f64.const -9375)
       (array.new $2
        (struct.new $6
         (i32.const 128)
        )
        (i32.and
         (i32.const 16)
         (i32.const 1023)
        )
       )
      )
      (ref.func $40)
     )
     (f64.const -2147483645.86)
     (array.new_default $2
      (i32.and
       (i32.const 18)
       (i32.const 1023)
      )
     )
    )
    (f64.const -8192)
    (struct.new $10
     (global.get $global$4)
     (f32.load offset=1 align=1
      (i32.and
       (local.tee $6
        (i32.const -2147483648)
       )
       (i32.const 15)
      )
     )
     (f64.const 3402823466385288598117041e14)
     (global.get $global$13)
    )
   )
  )
 )
 (func $42 (type $34) (param $0 f32) (param $1 (ref null $9)) (param $2 funcref) (param $3 (ref struct)) (param $4 (ref $5)) (param $5 f32) (param $6 (ref $7)) (result i64)
  (local $7 f64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 arrayref)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.tee $10
   (i64.const 70368744177664)
  )
 )
 (func $43 (type $12)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 (ref $10))
  (local $6 (ref (exact $6)))
  (local $7 (ref (exact $6)))
  (local $8 (ref func))
  (local $9 (ref any))
  (local $scratch (ref (exact $14)))
  (local $scratch_11 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $7
   (struct.new $6
    (global.get $global$22)
   )
  )
  (drop
   (call $42
    (f32.const -262145)
    (ref.func $33)
    (ref.func $43)
    (struct.new_default $15)
    (struct.new_desc $5
     (global.get $gimport$1)
     (array.new $7
      (struct.new_default_desc $5
       (struct.new $6
        (i32.const -8)
       )
      )
      (i32.and
       (i32.const 95)
       (i32.const 1023)
      )
     )
     (global.get $global$12)
     (ref.func $7)
     (f64.abs
      (f64.load offset=22 align=1
       (i32.and
        (i32.lt_u
         (string.encode_wtf16_array
          (global.get $global$18)
          (try (result (ref (exact $13)))
           (do
            (array.new $13
             (i32.const 41)
             (i32.and
              (i32.const 23)
              (i32.const 1023)
             )
            )
           )
           (catch $tag$0
            (local.set $0 (i64.mul (pop i64) (i64.const -1)))
            (array.new_default $13
             (i32.and
              (i32.const 25)
              (i32.const 1023)
             )
            )
           )
          )
          (stringview_wtf16.get_codeunit
           (global.get $global$3)
           (block (result i32)
            (local.set $4
             (struct.get_u $10 0
              (local.tee $5
               (struct.new_default $10)
              )
             )
            )
            (local.get $4)
           )
          )
         )
         (string.measure_wtf16
          (string.const "\c2\a3896\f0\90\8d\88")
         )
        )
        (i32.const 15)
       )
      )
     )
     (block (result i64)
      (drop
       (block (result (ref (exact $14)))
        (local.set $scratch
         (array.new_fixed $14 0)
        )
        (local.set $2
         (i64.const -32767)
        )
        (local.get $scratch)
       )
      )
      (local.get $2)
     )
     (local.tee $6
      (if (result (ref (exact $6)))
       (i32.eqz
        (try_table (result i32)
         (loop (result i32)
          (if
           (i32.eqz
            (global.get $global$29)
           )
           (then
            (global.set $global$29
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$29
           (i32.sub
            (global.get $global$29)
            (i32.const 1)
           )
          )
          (block (result i32)
           (call $fimport$6
            (ref.null none)
           )
           (if (result i32)
            (local.get $3)
            (then
             (i64.atomic.store16 acqrel offset=22
              (i32.and
               (local.get $3)
               (i32.const 15)
              )
              (i64.const -34)
             )
             (throw_ref
              (block $block (result (ref exn))
               (try_table (catch_all_ref $block)
                (throw $tag$0
                 (local.get $1)
                )
               )
               (unreachable)
              )
             )
            )
            (else
             (drop
              (ref.as_non_null
               (ref.null none)
              )
             )
             (call $fimport$2
              (unreachable)
             )
             (local.set $scratch_11
              (i32.const 127)
             )
             (drop
              (i32.const -2048)
             )
             (local.get $scratch_11)
            )
           )
          )
         )
        )
       )
       (then
        (call_ref $17
         (local.tee $8
          (ref.func $43)
         )
         (ref.func $fimport$7)
        )
        (local.tee $7
         (struct.new_default $6)
        )
       )
       (else
        (block $block1 (result (ref (exact $6)))
         (br_on_non_null $block1
          (local.tee $7
           (br_on_cast_fail $block1 (ref (exact $6)) (ref (exact $6))
            (local.get $7)
           )
          )
         )
         (block
          (call $fimport$6
           (local.tee $9
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (block
           (call $fimport$2
            (local.get $1)
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
    )
    (f32.const -2147483648)
    (array.new $7
     (struct.new_default_desc $5
      (struct.new $6
       (local.get $3)
      )
     )
     (i32.and
      (i32.const 21)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $44 (type $8) (param $0 (ref $8))
  (local $1 f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
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
  (local $20 (ref $7))
  (local $21 (ref $7))
  (local $22 (ref $7))
  (local $23 (ref $7))
  (local $24 (ref $7))
  (local $25 (ref $7))
  (local $26 (ref string))
  (local $27 (ref string))
  (local $28 (ref $10))
  (local $29 (ref $10))
  (local $30 i31ref)
  (local $scratch (tuple i64 i32))
  (local $scratch_32 i64)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (local.set $20
   (array.new $7
    (struct.new_desc $5
     (string.const "\e2\82\ac")
     (array.new $7
      (struct.new_default_desc $5
       (struct.new_default $6)
      )
      (i32.and
       (i32.const 1)
       (i32.const 1023)
      )
     )
     (i32.const -27)
     (ref.func $33)
     (local.get $1)
     (local.get $5)
     (struct.new_default $6)
    )
    (i32.and
     (i32.const 83)
     (i32.const 1023)
    )
   )
  )
  (block $block1
   (i64.store16 offset=4
    (i32.and
     (i32.const 16)
     (i32.const 15)
    )
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
     (i64.const 2147483648)
    )
   )
   (if
    (i32.const -117)
    (then
     (block
      (nop)
      (br $block1)
     )
     (unreachable)
    )
    (else
     (try
      (do
       (data.drop $1)
      )
      (catch $tag$0
       (local.set $2 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $2))))
       (block
        (drop
         (i64.extend_i32_s
          (block $block2 (result i32)
           (try (result i32)
            (do
             (try
              (do
               (i64.store8 offset=22
                (i32.and
                 (i32.atomic.load8_u acqrel offset=2
                  (i32.and
                   (br_if $block2
                    (i32.const 1073741824)
                    (i32.eqz
                     (local.tee $10
                      (ref.eq
                       (ref.as_non_null
                        (ref.null none)
                       )
                       (ref.as_non_null
                        (ref.null none)
                       )
                      )
                     )
                    )
                   )
                   (i32.const 15)
                  )
                 )
                 (i32.const 15)
                )
                (i64.const 119)
               )
              )
              (catch $tag$0
               (global.set $global$19 (pop i64))
               (if
                (i32.lt_u
                 (local.tee $11
                  (local.get $10)
                 )
                 (array.len
                  (local.tee $21
                   (local.tee $20
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                )
                (then
                 (array.set $7
                  (local.get $21)
                  (local.get $11)
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
              )
             )
             (i32.const 65535)
            )
            (catch_all
             (drop
              (block (result i64)
               (local.set $scratch_32
                (tuple.extract 2 0
                 (local.tee $scratch
                  (block (type $42) (result i64 i32)
                   (nop)
                   (tuple.make 2
                    (local.get $4)
                    (local.get $12)
                   )
                  )
                 )
                )
               )
               (local.set $19
                (tuple.extract 2 1
                 (local.get $scratch)
                )
               )
               (local.get $scratch_32)
              )
             )
             (local.get $19)
            )
           )
          )
         )
        )
        (if
         (i32.atomic.load8_u acqrel offset=4
          (i32.and
           (local.tee $10
            (local.get $10)
           )
           (i32.const 15)
          )
         )
         (then
          (drop
           (i64.const -4294967296)
          )
          (if
           (local.tee $10
            (string.compare
             (string.const "\f0\90\8d\88\c2\a3821")
             (global.get $global$3)
            )
           )
           (then
            (if
             (block (result i32)
              (nop)
              (block (result i32)
               (nop)
               (block (result i32)
                (nop)
                (local.get $10)
               )
              )
             )
             (then
              (if
               (local.get $10)
               (then
                (i64.atomic.store8 acqrel offset=22
                 (i32.and
                  (local.get $10)
                  (i32.const 15)
                 )
                 (i64.const 94)
                )
               )
               (else
                (nop)
               )
              )
              (br $block1)
             )
             (else
              (drop
               (ref.as_non_null
                (ref.null none)
               )
              )
              (if
               (i32.eqz
                (unreachable)
               )
               (then
                (if
                 (i32.lt_u
                  (i32.add
                   (local.tee $13
                    (local.tee $10
                     (string.encode_wtf16_array
                      (local.tee $26
                       (local.tee $27
                        (string.const "")
                       )
                      )
                      (ref.as_non_null
                       (ref.null none)
                      )
                      (i32.const -4194304)
                     )
                    )
                   )
                   (local.tee $14
                    (i32.const -3818)
                   )
                  )
                  (array.len
                   (local.tee $22
                    (local.get $20)
                   )
                  )
                 )
                 (then
                  (if
                   (i32.lt_u
                    (i32.add
                     (local.tee $15
                      (local.tee $10
                       (local.get $10)
                      )
                     )
                     (local.tee $16
                      (local.get $14)
                     )
                    )
                    (array.len
                     (local.tee $23
                      (local.get $20)
                     )
                    )
                   )
                   (then
                    (array.copy $7 $7
                     (local.get $22)
                     (local.get $13)
                     (local.get $23)
                     (local.get $15)
                     (local.get $16)
                    )
                   )
                  )
                 )
                )
               )
               (else
                (br_if $block1
                 (local.get $10)
                )
               )
              )
              (br $block1)
             )
            )
            (unreachable)
           )
           (else
            (nop)
            (br $block1)
           )
          )
          (unreachable)
         )
         (else
          (unreachable)
         )
        )
        (local.set $27
         (local.set $28
          (local.set $29
           (local.set $24
            (unreachable)
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
  )
 )
 (func $45 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (call $44
   (ref.func $8)
  )
 )
 (func $46 (type $35) (param $0 v128) (result (ref $8))
  (local $1 structref)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (ref.func $14)
 )
 (func $47 (type $36) (param $0 i64) (param $1 exnref) (param $2 stringref) (param $3 anyref) (param $4 (ref null $3)) (result externref i64 f64 i64)
  (local $5 (ref null $11))
  (local $6 exnref)
  (local $7 externref)
  (local $8 (ref null $4))
  (local $9 (ref null $2))
  (local $10 (ref null $7))
  (local $11 f64)
  (local $12 f64)
  (local $13 i64)
  (local $14 f32)
  (local $15 i32)
  (local $16 v128)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (tuple.make 4
   (string.const "\f0\90\8d\88")
   (i64.const -30)
   (f64.const -19406)
   (i64.const 65530)
  )
 )
 (func $48 (type $12)
  (local $scratch (tuple externref i64 f64 i64))
  (local $scratch_1 f64)
  (local $scratch_2 i64)
  (local $scratch_3 externref)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (block (result externref)
    (local.set $scratch_3
     (tuple.extract 4 0
      (local.tee $scratch
       (call $47
        (i64.const 8193)
        (ref.null noexn)
        (string.const "\ed\bd\88")
        (struct.new_default $15)
        (ref.null none)
       )
      )
     )
    )
    (drop
     (block (result i64)
      (local.set $scratch_2
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result f64)
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
 )
 (func $49 (type $37) (param $0 (ref null $7)) (param $1 (ref null $6)) (result (ref array))
  (local $2 i64)
  (local $3 i64)
  (local $4 f32)
  (local $5 i31ref)
  (local $6 externref)
  (local $7 (ref null $3))
  (local $8 (ref null $8))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $50 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $49
    (array.new $7
     (struct.new_desc $5
      (string.const "")
      (global.get $global$25)
      (i32.const -262143)
      (ref.func $40)
      (f64.const -69)
      (i64.const 254)
      (struct.new $6
       (i32.const 74)
      )
     )
     (i32.and
      (i32.const 62)
      (i32.const 1023)
     )
    )
    (struct.new_default $6)
   )
  )
  (drop
   (call $49
    (array.new $7
     (try_table (result (ref (exact $5)))
      (struct.new_desc $5
       (string.const "\ed\bd\88553")
       (array.new $7
        (struct.new_desc $5
         (global.get $gimport$1)
         (array.new $7
          (struct.new_desc $5
           (global.get $gimport$1)
           (global.get $global$25)
           (i32.const -37)
           (ref.func $0)
           (f64.const -nan:0xfffffa02e4629)
           (i64.const 18)
           (ref.as_non_null
            (ref.null none)
           )
          )
          (i32.and
           (i32.const 15)
           (i32.const 1023)
          )
         )
         (i32.const -23)
         (ref.func $33)
         (f64.const 135)
         (i64.const 4294967219)
         (ref.null none)
        )
        (i32.and
         (i32.const 68)
         (i32.const 1023)
        )
       )
       (global.get $global$12)
       (ref.func $15)
       (f64.const -2.2250738585072014e-308)
       (i64.const 36028797018963969)
       (struct.new_default $6)
      )
     )
     (i32.and
      (i32.const 65)
      (i32.const 1023)
     )
    )
    (struct.new_default $6)
   )
  )
 )
 (func $51 (type $38) (param $0 (ref $3)) (result (ref null $16))
  (local $1 (ref $7))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $16)))
   (struct.new_default $16)
  )
 )
 (func $52 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $51
    (struct.new_default $3)
   )
  )
 )
 (func $53 (type $39) (param $0 externref) (param $1 i64) (result (ref null $1))
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (ref.cast (ref (exact $1))
   (ref.func $35)
  )
 )
 (func $54 (type $12)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (drop
   (call $53
    (string.const "\ed\a0\80")
    (i64.const -2147483648)
   )
  )
 )
 (@binaryen.js.called)
 (func $55 (type $21) (param $0 i32) (param $1 eqref) (result f32)
  (local $2 externref)
  (local $3 (ref null $9))
  (local $4 (ref string))
  (local $5 (ref i31))
  (local $6 i64)
  (local $7 i32)
  (if
   (i32.eqz
    (global.get $global$29)
   )
   (then
    (global.set $global$29
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$29
   (i32.sub
    (global.get $global$29)
    (i32.const 1)
   )
  )
  (block (result f32)
   (call_ref $17
    (block (result (ref (exact $21)))
     (block $block
      (nop)
      (if
       (stringview_wtf16.get_codeunit
        (global.get $global$3)
        (block (result i32)
         (local.set $7
          (try (result i32)
           (do
            (i32.clz
             (ref.is_null
              (struct.new $6
               (global.get $global$22)
              )
             )
            )
           )
           (catch $tag$0
            (global.set $global$19 (pop i64))
            (drop
             (ref.i31
              (i32.const -5549)
             )
            )
            (drop
             (local.tee $5
              (ref.i31
               (i32.const 127)
              )
             )
            )
            (block
             (local.set $0
              (i32.const 2)
             )
             (br $block)
            )
            (local.set $4
             (unreachable)
            )
           )
          )
         )
         (local.get $7)
        )
       )
       (then
        (br_if $block
         (i32.eqz
          (i32.const 32769)
         )
        )
        (table.set $1
         (i32.const 0)
         (block $block1 (result (ref exn))
          (try_table (catch_all_ref $block1)
           (throw $tag$1)
          )
          (unreachable)
         )
        )
       )
      )
     )
     (ref.func $55)
    )
    (ref.func $fimport$7)
   )
   (f32.const 576460752303423488)
  )
 )
 (type $__sinkT_0 (func (param i64) (result i64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
