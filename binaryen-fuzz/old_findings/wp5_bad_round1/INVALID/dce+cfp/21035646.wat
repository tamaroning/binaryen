(module
 (rec
  (type $0 (array (ref null $3)))
  (type $1 (sub (array (mut i8))))
  (type $2 (sub (struct (field i8))))
  (type $3 (sub (func (result f64))))
 )
 (rec
  (type $4 (struct))
  (type $5 (sub (array (ref $0))))
 )
 (rec
  (type $6 (sub (array funcref)))
  (type $7 (struct (field f64) (field (mut i31ref))))
 )
 (rec
  (type $8 (sub (struct (field (mut (ref null $7))) (field (ref null $4)) (field (mut f32)) (field (mut i31ref)) (field (mut f64)) (field (ref null $6)))))
  (type $9 (func (result (ref extern))))
  (type $10 (sub (func (param i64 f32) (result i64))))
  (type $11 (struct (field f64) (field i64)))
 )
 (rec
  (type $12 (sub (struct)))
  (type $13 (sub $8 (struct (field (mut (ref null $7))) (field (ref $4)) (field (mut f32)) (field (mut i31ref)) (field (mut f64)) (field nullref))))
  (type $14 (sub $10 (func (param i64 f32) (result i64))))
  (type $15 (sub $6 (array nullfuncref)))
  (type $16 (sub final $2 (struct (field i8) (field f64) (field externref) (field (mut i32)) (field (mut v128)))))
  (type $17 (sub (struct (field (mut (ref array))) (field f32) (field i32) (field (mut (ref $15))) (field i8))))
  (type $18 (sub final $14 (func (param i64 f32) (result i64))))
 )
 (type $19 (func))
 (type $20 (array i8))
 (type $21 (struct))
 (type $22 (func (param i32)))
 (type $23 (func (result (ref null $15) structref i32 f64)))
 (type $24 (array (mut i16)))
 (type $25 (func (result f64 i64 i64)))
 (type $26 (func (result i64)))
 (type $27 (func (param (ref null $17))))
 (type $28 (func (param i64)))
 (type $29 (func (param f32)))
 (type $30 (func (param f64)))
 (type $31 (func (param v128)))
 (type $32 (func (param anyref)))
 (type $33 (func (param funcref)))
 (type $34 (func (param externref)))
 (type $35 (func (param i32) (result i32)))
 (type $36 (func (param funcref i32)))
 (type $37 (func (param stringref i64 arrayref i31ref i64 v128)))
 (type $38 (func (param (ref null $2)) (result stringref)))
 (type $39 (func (param exnref) (result (ref null $15) structref i32 f64)))
 (type $40 (func (result arrayref)))
 (type $41 (func (param (ref eq) i31ref f64 f32) (result (ref $0))))
 (type $42 (func (result (ref $3))))
 (type $43 (func (param i64 v128 v128 f64 f64 i32 (ref $10)) (result (ref null $14))))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_3" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $22) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $22) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $28) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $29) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $30) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $31) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $32) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $33) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $34) (param externref)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$9 (type $35) (param i32) (result i32)))
 (import "fuzzing-support" "call-ref" (func $fimport$10 (type $36) (param funcref i32)))
 (global $global$0 anyref (ref.null none))
 (global $global$1 (mut (ref null $10)) (ref.null nofunc))
 (global $global$2 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 "\afZ\e2\85j\96\83\c5")
 (data $1 (i64.const 0) "b\9e\11\06T\19\15{\7fs\95B\d085\89\b8\8f5&s3\06\b5\9a\'\f42]")
 (data $2 (i64.const 29) "v>\fe1\08\c9D@\a7\bbH\af\98~\bd3?\880\c9\99\c4T\9a\93\b0\16\1f\ed\fc")
 (table $0 i64 8 8 funcref (ref.null nofunc))
 (table $1 6 exnref)
 (elem $0 (table $0) (i64.const 0) func $0 $0 $19 $24 $26 $26)
 (elem declare func $1 $11 $22 $28 $4 $5 $7 $8 $fimport$1)
 (tag $tag$0 (type $27) (param (ref null $17)))
 (export "global$" (global $global$0))
 (export "func" (func $0))
 (export "func_invoker" (func $1))
 (export "func_13_invoker" (func $3))
 (export "func_15" (func $4))
 (export "func_15_invoker" (func $6))
 (export "func_20" (func $9))
 (export "func_20_invoker" (func $10))
 (export "func_23" (func $12))
 (export "func_24" (func $13))
 (export "func_25" (func $14))
 (export "func_25_invoker" (func $15))
 (export "func_27" (func $16))
 (export "func_28_invoker" (func $18))
 (export "func_31" (func $20))
 (export "func_31_invoker" (func $21))
 (export "func_33" (func $22))
 (export "func_33_invoker" (func $23))
 (export "func_35_invoker" (func $25))
 (export "func_37" (func $26))
 (export "func_39" (func $28))
 (export "func_39_invoker" (func $29))
 (func $0 (type $10) (param $0 i64) (param $1 f32) (result i64)
  (local $2 (ref null $13))
  (local $3 arrayref)
  (local $4 arrayref)
  (local $5 (ref array))
  (local $6 (ref null $7))
  (local $7 funcref)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 v128)
  (local $13 f32)
  (local $14 f32)
  (local $15 f64)
  (local $16 f64)
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
   (data.drop $2)
   (return
    (i64.const -1099511627776)
   )
  )
  (unreachable)
 )
 (func $1 (type $19)
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
    (i64.const 2147483648)
    (f32.const -524287)
   )
  )
  (drop
   (call $0
    (i64.const 220)
    (f32.const -6148753)
   )
  )
  (drop
   (call $0
    (i64.const 1125899906842625)
    (f32.const 2147483648)
   )
  )
  (drop
   (call $0
    (i64.const -2)
    (f32.const 3.579240292174705e-29)
   )
  )
  (drop
   (call $0
    (i64.const -33)
    (f32.const -nan:0x7fc620)
   )
  )
  (drop
   (call $0
    (i64.const -2005233)
    (f32.const -9223372036854775808)
   )
  )
  (drop
   (call $0
    (i64.const 2199023255552)
    (f32.const -4611686018427387904)
   )
  )
  (drop
   (call $0
    (i64.const 23887)
    (f32.const 175)
   )
  )
  (drop
   (call $0
    (i64.const 8796093022208)
    (f32.const -1152921504606846976)
   )
  )
 )
 (func $2 (type $37) (param $0 stringref) (param $1 i64) (param $2 arrayref) (param $3 i31ref) (param $4 i64) (param $5 v128)
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
  (local.set $4
   (local.get $4)
  )
 )
 (func $3 (type $19)
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
  (call $2
   (string.const "\ed\bd\88\e2\82\ac")
   (i64.const -9223372036854775808)
   (array.new_fixed $20 0)
   (ref.i31
    (i32.const -65)
   )
   (i64.const -95)
   (v128.const i32x4 0xbf6008cd 0x00003a03 0x7729809d 0x0001c02c)
  )
 )
 (func $4 (type $18) (param $0 i64) (param $1 f32) (result i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
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
  (local $32 i32)
  (local $33 f64)
  (local $34 f32)
  (local $35 (ref null $15))
  (local $36 (ref null $17))
  (local $37 (ref null $17))
  (local $38 (ref null $17))
  (local $39 (ref null $17))
  (local $40 (ref null $17))
  (local $41 (ref null $17))
  (local $42 (ref null $17))
  (local $43 (ref null $17))
  (local $44 (ref null $17))
  (local $45 (ref null $17))
  (local $46 (ref null $17))
  (local $47 (ref null $17))
  (local $48 (ref null $17))
  (local $49 (ref null $17))
  (local $50 (ref null $17))
  (local $51 (ref null $17))
  (local $52 (ref null $17))
  (local $53 (ref null $17))
  (local $54 (ref null $17))
  (local $55 (ref $3))
  (local $56 (ref $3))
  (local $57 (ref $1))
  (local $58 (ref $1))
  (local $59 (ref $1))
  (local $60 (ref $1))
  (local $61 (ref $1))
  (local $62 (ref $1))
  (local $63 (ref $1))
  (local $64 (ref $1))
  (local $65 (ref $1))
  (local $66 (ref $1))
  (local $67 (ref $1))
  (local $68 (ref $1))
  (local $69 (ref $1))
  (local $70 (ref $1))
  (local $71 (ref $1))
  (local $72 (ref $1))
  (local $73 (ref $1))
  (local $74 (ref $11))
  (local $75 (ref $5))
  (local $76 (ref $8))
  (local $77 (ref null $13))
  (local $78 (ref null $13))
  (local $79 (ref $13))
  (local $80 stringref)
  (local $81 stringref)
  (local $82 (ref $4))
  (local $83 (ref $7))
  (local $84 (ref $7))
  (local $85 (ref string))
  (local $86 (ref string))
  (local $87 i31ref)
  (local $88 (ref $15))
  (local $89 (ref $15))
  (local $90 (ref null $3))
  (local $91 (ref struct))
  (local $92 anyref)
  (local $93 (ref null $4))
  (local $94 (ref $16))
  (local $95 externref)
  (local $96 (ref array))
  (local $scratch i64)
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
  (local.set $94
   (struct.new_default $16)
  )
  (local.set $88
   (array.new_default $15
    (i32.and
     (i32.const 36)
     (i32.const 1023)
    )
   )
  )
  (local.set $85
   (string.const "945\ed\a0\80")
  )
  (local.set $74
   (struct.new $11
    (local.get $33)
    (local.get $0)
   )
  )
  (local.set $79
   (struct.new $13
    (ref.null none)
    (struct.new_default $4)
    (f32.const -4294967296)
    (ref.i31
     (i32.const 8388608)
    )
    (f64.const -nan:0xfffffffff9124)
    (ref.as_non_null
     (ref.null none)
    )
   )
  )
  (local.set $57
   (array.new_default $1
    (i32.and
     (i32.const 24)
     (i32.const 1023)
    )
   )
  )
  (local.set $55
   (ref.func $5)
  )
  (block $block3 (result i64)
   (block $block1
    (i64.store32 offset=4 align=1
     (i64.and
      (block (result i64)
       (call $fimport$10
        (ref.func $4)
        (ref.eq
         (local.tee $35
          (loop $label (result (ref (exact $15)))
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
            (br_if $block1
             (i32.eqz
              (loop $label1 (result i32)
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
                (local.set $2
                 (i64.add
                  (local.get $2)
                  (local.get $0)
                 )
                )
                (try
                 (do
                  (i32.store16 offset=22
                   (i64.and
                    (i64.const 8796093022208)
                    (i64.const 15)
                   )
                   (i32.const -32)
                  )
                 )
                 (catch $tag$0
                  (local.set $36 (select (result (ref null $17)) (pop (ref null $17)) (ref.null none) (i32.const 7)))
                  (call_ref $22
                   (i32.const 134217728)
                   (ref.func $fimport$1)
                  )
                 )
                 (catch_all
                  (br_if $label
                   (i32.const -28)
                  )
                 )
                )
               )
               (br_if $label1
                (i32.eqz
                 (i31.get_s
                  (block $block (result (ref i31))
                   (br_if $label
                    (i32.eqz
                     (local.get $5)
                    )
                   )
                   (br_if $block
                    (ref.i31
                     (i32.const -1760962)
                    )
                    (i32.eqz
                     (i32.const 4095)
                    )
                   )
                  )
                 )
                )
               )
               (i32.const -1025)
              )
             )
            )
            (data.drop $0)
           )
           (br_if $label
            (i32.eqz
             (local.get $5)
            )
           )
           (block $block2 (result (ref (exact $15)))
            (data.drop $0)
            (br_if $block2
             (array.new_default $15
              (i32.and
               (i32.const -27)
               (i32.const 1023)
              )
             )
             (i32.atomic.load8_u acqrel offset=22
              (i64.and
               (local.get $2)
               (i64.const 15)
              )
             )
            )
           )
          )
         )
         (ref.cast (ref (exact $11))
          (struct.new_default $11)
         )
        )
       )
       (local.get $0)
      )
      (i64.const 15)
     )
     (i64.rotl
      (call_indirect $0 (type $10)
       (br_if $block3
        (local.get $2)
        (i32.const 65536)
       )
       (local.get $1)
       (i64.const 1)
      )
      (br_if $block3
       (loop (result i64)
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
        (i64.const 16385)
       )
       (i32.const -127)
      )
     )
    )
    (block
     (drop
      (struct.new_default $16)
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
      (block
       (block
        (br $block1)
       )
       (local.set $79
        (local.set $76
         (unreachable)
        )
       )
      )
      (unreachable)
     )
     (local.set $61
      (unreachable)
     )
    )
    (block $block5
     (memory.fill
      (i64.and
       (i64.load32_s offset=22 align=1
        (i64.and
         (local.tee $2
          (loop (result i64)
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
            (if (result (ref $4))
             (local.get $5)
             (then
              (call $fimport$1
               (try (result i32)
                (do
                 (if (result i32)
                  (i32.const -131071)
                  (then
                   (i32.const -128)
                  )
                  (else
                   (local.get $5)
                  )
                 )
                )
                (catch $tag$0
                 (local.set $37 (ref.cast (ref $17) (pop (ref null $17))))
                 (block (result i32)
                  (drop
                   (local.tee $80
                    (local.get $81)
                   )
                  )
                  (string.measure_wtf16
                   (loop $label5 (result (ref string))
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
                    (block $block4
                     (nop)
                     (if
                      (i32.lt_u
                       (i32.add
                        (local.tee $27
                         (struct.get_u $17 4
                          (struct.new $17
                           (local.tee $96
                            (array.new_fixed $20 0)
                           )
                           (local.get $1)
                           (try_table (result i32) (catch_all $block4)
                            (i32.trunc_f32_u
                             (f32.load offset=4
                              (i64.and
                               (select
                                (i64.const -8833)
                                (block (result i64)
                                 (drop
                                  (i32.const 8191)
                                 )
                                 (local.tee $0
                                  (i64.const 2251799813685248)
                                 )
                                )
                                (local.get $7)
                               )
                               (i64.const 15)
                              )
                             )
                            )
                           )
                           (loop (result (ref $15))
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
                            (local.get $88)
                           )
                           (ref.eq
                            (loop $label2 (result (ref (exact $4)))
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
                              (br_on_null $label2
                               (ref.as_non_null
                                (local.get $87)
                               )
                              )
                             )
                             (br_if $label2
                              (ref.test (ref string)
                               (if (result (ref string))
                                (i32.eqz
                                 (i32.const 0)
                                )
                                (then
                                 (unreachable)
                                )
                                (else
                                 (local.get $85)
                                )
                               )
                              )
                             )
                             (struct.new_default $4)
                            )
                            (struct.new_default $2)
                           )
                          )
                         )
                        )
                        (local.tee $28
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
                           (struct.get_s $16 0
                            (local.get $94)
                           )
                          )
                         )
                        )
                       )
                       (array.len
                        (local.tee $71
                         (loop $label4 (result (ref (exact $1)))
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
                            (ref.null none)
                           )
                           (loop $label3
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
                             (nop)
                             (br_if $block4
                              (f64.le
                               (local.tee $33
                                (local.get $33)
                               )
                               (local.tee $33
                                (f64.convert_i64_s
                                 (local.tee $2
                                  (i64.atomic.rmw16.and_u offset=22
                                   (i64.and
                                    (local.tee $0
                                     (local.get $2)
                                    )
                                    (i64.const 15)
                                   )
                                   (try (result i64)
                                    (do
                                     (i64.const -99)
                                    )
                                    (catch $tag$0
                                     (throw $tag$0 (pop (ref null $17)))
                                     (local.get $0)
                                    )
                                   )
                                  )
                                 )
                                )
                               )
                              )
                             )
                            )
                            (br_if $label3
                             (i32.eqz
                              (local.get $5)
                             )
                            )
                            (block
                             (call_ref $19
                              (ref.func $1)
                             )
                            )
                           )
                          )
                          (br_if $label4
                           (i32.eqz
                            (ref.eq
                             (struct.new $2
                              (local.get $7)
                             )
                             (try_table (result (ref (exact $8))) (catch_all $block4)
                              (struct.new_default $8)
                             )
                            )
                           )
                          )
                          (ref.cast (ref (exact $1))
                           (block (result (ref (exact $1)))
                            (nop)
                            (array.new_default $1
                             (i32.and
                              (i32.const 66)
                              (i32.const 1023)
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
                        (br_on_null $block4
                         (struct.new_default $21)
                        )
                       )
                       (drop
                        (i64.and
                         (i64.atomic.load16_u offset=22
                          (i64.and
                           (i64.const -96)
                           (i64.const 15)
                          )
                         )
                         (i64.const 15)
                        )
                       )
                       (drop
                        (i32.const -256)
                       )
                       (drop
                        (array.new_fixed $20 0)
                       )
                       (block
                        (drop
                         (f64.div
                          (local.get $33)
                          (f64.const 4398046511105)
                         )
                        )
                        (br $block4)
                       )
                       (local.set $72
                        (unreachable)
                       )
                      )
                     )
                    )
                    (br_if $label5
                     (select
                      (local.get $10)
                      (ref.eq
                       (struct.new_default $21)
                       (struct.new $17
                        (array.new_fixed $20 0)
                        (local.get $1)
                        (local.get $6)
                        (array.new $15
                         (ref.null nofunc)
                         (i32.and
                          (i32.const 41)
                          (i32.const 1023)
                         )
                        )
                        (i32.const -128)
                       )
                      )
                      (block (result i32)
                       (drop
                        (block (result i64)
                         (local.set $scratch
                          (i64.const 98)
                         )
                         (local.set $32
                          (i32.const -230839)
                         )
                         (local.get $scratch)
                        )
                       )
                       (local.get $32)
                      )
                     )
                    )
                    (string.const "\e2\82\ac904")
                   )
                  )
                 )
                )
                (catch_all
                 (local.get $5)
                )
               )
              )
              (br $block1)
             )
             (else
              (local.tee $82
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
           )
           (drop
            (local.get $79)
           )
           (block
            (nop)
            (br $block1)
           )
           (local.set $83
            (local.set $84
             (unreachable)
            )
           )
          )
         )
         (i64.const 15)
        )
       )
       (i64.const 15)
      )
      (i16x8.extract_lane_s 1
       (v128.const i32x4 0x41200000 0xffffffa1 0xff7fffff 0x5e800000)
      )
      (block (result i64)
       (drop
        (br_on_null $block5
         (array.new_fixed $20 0)
        )
       )
       (local.tee $2
        (i64.const -1048577)
       )
      )
     )
     (block
      (call $fimport$6
       (array.new_fixed $20 0)
      )
      (f32.store offset=22 align=2
       (i64.and
        (i64.extend_i32_s
         (i32.const 15174)
        )
        (i64.const 15)
       )
       (f32.reinterpret_i32
        (if (result i32)
         (i32.lt_u
          (local.tee $13
           (ref.test (ref (exact $16))
            (struct.new_default $16)
           )
          )
          (array.len
           (local.tee $62
            (local.get $57)
           )
          )
         )
         (then
          (array.get_s $1
           (local.get $62)
           (block (result i32)
            (drop
             (local.get $13)
            )
            (i32.const -1268)
           )
          )
         )
         (else
          (i32.const 2147483647)
         )
        )
       )
      )
     )
    )
   )
   (i64.const 137438953473)
  )
 )
 (func $5 (type $3) (result f64)
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
  (unreachable)
 )
 (func $6 (type $19)
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
   (call $4
    (i64.const -17)
    (f32.const -55)
   )
  )
  (drop
   (call $4
    (i64.const -27804)
    (f32.const -2147483648)
   )
  )
 )
 (func $7 (type $38) (param $0 (ref null $2)) (result stringref)
  (local $1 f64)
  (local $2 (ref null $4))
  (local $3 (ref null $5))
  (local $4 structref)
  (local $5 structref)
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
  (string.const "\e2\82\ac")
 )
 (func $8 (type $9) (result (ref extern))
  (local $0 f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i64)
  (local $4 f32)
  (local $5 structref)
  (local $6 structref)
  (local $7 (ref $6))
  (local $8 (ref null $15))
  (local $9 (ref null $3))
  (local $10 stringref)
  (local $11 eqref)
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
  (try_table
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
    (block
     (if
      (i32.ge_s
       (i32.const -4969644)
       (string.measure_wtf16
        (string.const "\e2\82\ac\ed\a0\80940")
       )
      )
      (then
       (call $fimport$7
        (ref.func $5)
       )
       (br $label)
      )
      (else
       (call $fimport$6
        (struct.new_default $21)
       )
       (block
        (call $fimport$7
         (ref.func $8)
        )
        (drop
         (ref.null none)
        )
        (drop
         (struct.new_default $4)
        )
        (drop
         (f32.const 4294967296)
        )
        (drop
         (ref.i31
          (i32.const -255)
         )
        )
        (drop
         (f64.promote_f32
          (try_table (result f32) (catch_all $label)
           (f32.const -0.013000000268220901)
          )
         )
        )
        (block
         (call $fimport$8
          (string.const "")
         )
         (br $label)
        )
        (unreachable)
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
  (unreachable)
 )
 (func $9 (type $3) (result f64)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 (ref $13))
  (local $9 (ref null $14))
  (local $10 funcref)
  (local $11 arrayref)
  (local $12 (ref null $8))
  (local $13 (ref null $17))
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
  (unreachable)
 )
 (func $10 (type $19)
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
   (call $9)
  )
  (drop
   (call $9)
  )
  (drop
   (call $9)
  )
 )
 (func $11 (type $10) (param $0 i64) (param $1 f32) (result i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 f32)
  (local $15 (ref null $4))
  (local $16 funcref)
  (local $17 (ref null $17))
  (local $18 (ref null $17))
  (local $19 (ref null $17))
  (local $20 (ref null $17))
  (local $21 (ref null $17))
  (local $22 (ref $15))
  (local $23 (ref $11))
  (local $24 (ref $13))
  (local $25 (ref i31))
  (local $26 (ref i31))
  (local $27 (ref i31))
  (local $28 (ref i31))
  (local $29 i31ref)
  (local $30 (ref $1))
  (local $31 (ref $1))
  (local $32 (ref string))
  (local $33 anyref)
  (local $34 (ref func))
  (local $35 (ref $24))
  (local $scratch (ref (exact $10)))
  (local $scratch_37 f32)
  (local $scratch_38 f64)
  (local $scratch_39 f64)
  (local $scratch_40 f32)
  (local $scratch_41 i64)
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
  (block (result i64)
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
    (block $block
     (block $block1
      (try_table (catch_all $block)
       (memory.init $2
        (call_indirect $0 (type $10)
         (select
          (i64.const 15)
          (if (result i64)
           (local.get $12)
           (then
            (i64.const 268435455)
           )
           (else
            (i64.const 118)
           )
          )
          (ref.eq
           (loop $label2 (result (ref $15))
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
             (call $fimport$1
              (loop $label1 (result i32)
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
                (br_if $block1
                 (local.get $12)
                )
                (nop)
               )
               (br_if $label1
                (loop $label (result i32)
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
                 (local.set $12
                  (local.get $12)
                 )
                 (br_if $label
                  (call $fimport$9
                   (try (result i32)
                    (do
                     (i32.const -11)
                    )
                    (catch $tag$0
                     (local.set $17 (select (result (ref null $17)) (pop (ref null $17)) (ref.null none) (i32.const 7)))
                     (i32.const 65491)
                    )
                   )
                  )
                 )
                 (i32.const 67108864)
                )
               )
               (local.get $12)
              )
             )
             (call $fimport$5
              (v128.const i32x4 0x00000001 0xffffe000 0xc0000000 0xffffffff)
             )
            )
            (br_if $label2
             (i32.eqz
              (local.tee $12
               (i32.const -2147483646)
              )
             )
            )
            (try_table (result (ref $15)) (catch_all $block)
             (local.tee $22
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
           (array.new $15
            (ref.null nofunc)
            (i32.and
             (i32.const 87)
             (i32.const 1023)
            )
           )
          )
         )
         (f32x4.extract_lane 0
          (v128.const i32x4 0x00000001 0xffffe000 0xc0000000 0xffffffff)
         )
         (i64.const 0)
        )
        (i32.const 21)
        (i32.const 3)
       )
      )
      (drop
       (local.get $0)
      )
      (try_table (catch_all $block)
       (try
        (do
         (array.set $1
          (local.tee $30
           (loop (result (ref $1))
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
            (local.tee $31
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
          (i32.const -134217728)
          (stringview_wtf16.get_codeunit
           (local.tee $32
            (string.const "1018\ed\bd\88\ed\bd\88")
           )
           (block (result i32)
            (local.set $13
             (i32.const -1117582250)
            )
            (local.get $13)
           )
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
          (block
           (br $block1)
          )
          (unreachable)
         )
         (unreachable)
        )
        (catch $tag$0
         (drop (pop (ref null $17)))
         (drop
          (array.new_default $0
           (i32.and
            (i32.const 50)
            (i32.const 1023)
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
      (unreachable)
     )
     (nop)
    )
   )
   (local.tee $0
    (block (result i64)
     (local.set $scratch_41
      (i64.const -55)
     )
     (drop
      (block (result f32)
       (local.set $scratch_40
        (f32.const -nan:0x7fffc2)
       )
       (drop
        (block (result f64)
         (local.set $scratch_39
          (f64.const -nan:0xfffff947d233a)
         )
         (drop
          (struct.new $8
           (ref.null none)
           (struct.new_default $4)
           (if (result f32)
            (try (result i32)
             (do
              (struct.get_u $16 0
               (select (result (ref (exact $16)))
                (block (result (ref (exact $16)))
                 (nop)
                 (struct.new_default $16)
                )
                (struct.new $16
                 (i31.get_s
                  (ref.as_non_null
                   (local.get $29)
                  )
                 )
                 (local.get $8)
                 (ref.null noextern)
                 (i31.get_u
                  (ref.i31
                   (i32.const 32767)
                  )
                 )
                 (v128.const i32x4 0xffffffef 0xffffffff 0xffff8000 0xffffffff)
                )
                (f32.ne
                 (local.tee $1
                  (local.get $1)
                 )
                 (f32.load offset=4 align=2
                  (i64.and
                   (i64.trunc_sat_f32_s
                    (try (result f32)
                     (do
                      (drop
                       (f32.load offset=22
                        (i64.and
                         (i64.load8_u offset=4
                          (i64.and
                           (i64.const 4398046511104)
                           (i64.const 15)
                          )
                         )
                         (i64.const 15)
                        )
                       )
                      )
                      (drop
                       (f32.load offset=4 align=1
                        (i64.and
                         (local.get $7)
                         (i64.const 15)
                        )
                       )
                      )
                      (block
                       (nop)
                       (return
                        (local.get $0)
                       )
                      )
                      (unreachable)
                     )
                     (catch $tag$0
                      (drop (ref.eq (pop (ref null $17)) (ref.null none)))
                      (local.set $scratch_37
                       (f32.const -75)
                      )
                      (drop
                       (block (result (ref (exact $10)))
                        (local.set $scratch
                         (ref.func $11)
                        )
                        (drop
                         (string.const "\c2\a3\ed\a0\80")
                        )
                        (local.get $scratch)
                       )
                      )
                      (local.get $scratch_37)
                     )
                     (catch_all
                      (loop $label7 (result f32)
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
                        (loop $label4
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
                         (block $block2
                          (loop $label3
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
                           (br_if $block2
                            (local.get $12)
                           )
                           (br_if $label3
                            (local.get $12)
                           )
                           (if
                            (local.get $12)
                            (then
                             (call $fimport$6
                              (ref.as_non_null
                               (local.tee $33
                                (struct.new_default $21)
                               )
                              )
                             )
                            )
                            (else
                             (call $fimport$8
                              (ref.null noextern)
                             )
                            )
                           )
                          )
                          (if
                           (i32.eqz
                            (local.get $12)
                           )
                           (then
                            (call $fimport$5
                             (v128.const i32x4 0xffffff8c 0xffffffff 0xff000000 0xffffffff)
                            )
                           )
                           (else
                            (nop)
                           )
                          )
                         )
                         (br_if $label4
                          (i32.eqz
                           (string.encode_wtf16_array
                            (block (result (ref string))
                             (call $fimport$10
                              (local.tee $34
                               (ref.as_non_null
                                (ref.null nofunc)
                               )
                              )
                              (call $fimport$9
                               (i32.rem_u
                                (i32.const 2097153)
                                (i32.const 18)
                               )
                              )
                             )
                             (loop (result (ref string))
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
                              (string.const "\f0\90\8d\88")
                             )
                            )
                            (local.tee $35
                             (ref.as_non_null
                              (ref.null none)
                             )
                            )
                            (i32.const -4582582)
                           )
                          )
                         )
                         (call $fimport$1
                          (i32.const -18050)
                         )
                        )
                        (loop $label6
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
                          (loop $label5
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
                           (br_if $label5
                            (i32.const -15)
                           )
                           (nop)
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
                           (nop)
                          )
                         )
                         (br_if $label6
                          (block (result i32)
                           (atomic.fence acqrel)
                           (i32.const 33649)
                          )
                         )
                         (nop)
                        )
                       )
                       (br_if $label7
                        (i32.eqz
                         (block $block3 (result i32)
                          (i32.atomic.store16 offset=1
                           (i64.and
                            (local.get $7)
                            (i64.const 15)
                           )
                           (i32.const 234)
                          )
                          (br_if $block3
                           (i32.const -3)
                           (i32.const -32768)
                          )
                         )
                        )
                       )
                       (block (result f32)
                        (try_table (catch_all $label7)
                         (nop)
                        )
                        (f32x4.extract_lane 1
                         (v128.const i32x4 0xfffff91c 0x429fffff 0xffffffe5 0xffffffff)
                        )
                       )
                      )
                     )
                    )
                   )
                   (i64.const 15)
                  )
                 )
                )
               )
              )
             )
             (catch_all
              (f64.le
               (f64.mul
                (f64.convert_i32_u
                 (i32.load8_u offset=4
                  (i64.and
                   (struct.get $11 1
                    (loop (result (ref (exact $11)))
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
                     (block (result (ref (exact $11)))
                      (try
                       (do
                        (nop)
                       )
                       (catch $tag$0
                        (throw $tag$0 (pop (ref null $17)))
                        (nop)
                       )
                       (catch_all
                        (atomic.fence acqrel)
                       )
                      )
                      (struct.new_default $11)
                     )
                    )
                   )
                   (i64.const 15)
                  )
                 )
                )
                (local.get $8)
               )
               (loop (result f64)
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
                (local.set $scratch_38
                 (f64.const -26008)
                )
                (drop
                 (i64.const 1)
                )
                (local.get $scratch_38)
               )
              )
             )
            )
            (then
             (f32.demote_f64
              (local.tee $8
               (local.get $8)
              )
             )
            )
            (else
             (block $block4 (result f32)
              (call $fimport$6
               (ref.as_non_null
                (local.get $33)
               )
              )
              (br_if $block4
               (f32.sub
                (f32.const -nan:0x2d4138)
                (f32.load offset=22 align=1
                 (i64.and
                  (i64.const 256)
                  (i64.const 15)
                 )
                )
               )
               (i8x16.extract_lane_u 10
                (v128.load offset=22 align=1
                 (i64.and
                  (local.get $3)
                  (i64.const 15)
                 )
                )
               )
              )
             )
            )
           )
           (ref.i31
            (i32.const -1)
           )
           (local.get $8)
           (array.new_default $6
            (i32.and
             (i32.const 76)
             (i32.const 1023)
            )
           )
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
  )
 )
 (@binaryen.js.called)
 (func $12 (type $39) (param $0 exnref) (result (ref null $15) structref i32 f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 (ref eq))
  (local $4 (ref null $8))
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
  (loop $label (type $23) (result (ref null $15) structref i32 f64)
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
   (call $fimport$8
    (select (result (ref extern))
     (ref.as_non_null
      (ref.null noextern)
     )
     (global.get $gimport$1)
     (i32.const 4096)
    )
   )
   (br_if $label
    (i32.const 255)
   )
   (call $12
    (local.get $0)
   )
  )
 )
 (func $13 (type $9) (result (ref extern))
  (local $0 (ref null $7))
  (local $1 (ref $4))
  (local $2 (ref struct))
  (local $3 (ref null $9))
  (local $4 eqref)
  (local $5 f64)
  (local $6 f64)
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
  (call $8)
 )
 (@binaryen.js.called)
 (func $14 (type $25) (result f64 i64 i64)
  (local $0 (ref $12))
  (local $1 i32)
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
   (if
    (i32.eqz
     (ref.eq
      (ref.i31
       (i32.const 1073741824)
      )
      (local.tee $0
       (struct.new_default $12)
      )
     )
    )
    (then
     (nop)
     (call $fimport$4
      (f64.convert_i32_u
       (local.get $1)
      )
     )
    )
   )
   (return
    (tuple.make 3
     (f64.const -nan:0xfffffffff9d1e)
     (i64.const 140737488355329)
     (i64.const -74)
    )
   )
  )
  (unreachable)
 )
 (func $15 (type $19)
  (local $scratch (tuple f64 i64 i64))
  (local $scratch_1 i64)
  (local $scratch_2 f64)
  (local $scratch_3 (tuple f64 i64 i64))
  (local $scratch_4 i64)
  (local $scratch_5 f64)
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
   (block (result f64)
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $14)
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
  (drop
   (block (result f64)
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $14)
      )
     )
    )
    (drop
     (block (result i64)
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
 (func $16 (type $40) (result arrayref)
  (local $0 v128)
  (local $1 v128)
  (local $2 f64)
  (local $3 (ref array))
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
  (local.tee $3
   (loop (result (ref (exact $15)))
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
    (block (result (ref (exact $15)))
     (nop)
     (array.new $15
      (ref.null nofunc)
      (i32.and
       (i32.const 11)
       (i32.const 1023)
      )
     )
    )
   )
  )
 )
 (func $17 (type $41) (param $0 (ref eq)) (param $1 i31ref) (param $2 f64) (param $3 f32) (result (ref $0))
  (local $4 i64)
  (local $5 i64)
  (local $6 stringref)
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
   (nop)
   (unreachable)
  )
  (unreachable)
 )
 (func $18 (type $19)
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
   (call $17
    (ref.i31
     (i32.const 8)
    )
    (ref.i31
     (i32.const 251)
    )
    (f64.const -0)
    (f32.const -8191.76708984375)
   )
  )
  (drop
   (call $17
    (struct.new_default $21)
    (ref.i31
     (i32.const -127)
    )
    (f64.const 1.1754943508222875e-38)
    (f32.const -2305843009213693952)
   )
  )
  (drop
   (call $17
    (array.new_fixed $20 0)
    (ref.i31
     (i32.const 33554432)
    )
    (f64.const -4294967295)
    (f32.const -9223372036854775808)
   )
  )
  (drop
   (call $17
    (array.new_fixed $20 0)
    (ref.i31
     (i32.const 32767)
    )
    (f64.const 2147483646)
    (f32.const -nan:0x501e5e)
   )
  )
 )
 (@binaryen.js.called)
 (func $19 (type $18) (param $0 i64) (param $1 f32) (result i64)
  (local $2 (ref null $17))
  (local $3 (ref null $17))
  (local $4 (ref $15))
  (local $5 (ref none))
  (local $6 (ref $8))
  (local $7 stringref)
  (local $8 (ref $13))
  (local $9 (ref $13))
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 f64)
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
  (local.set $9
   (struct.new $13
    (ref.null none)
    (struct.new_default $4)
    (f32.const -nan:0x34473)
    (ref.i31
     (i32.const -63)
    )
    (f64.const -nan:0xffffffffffff4)
    (ref.null none)
   )
  )
  (local.set $8
   (struct.new $13
    (struct.new_default $7)
    (struct.new_default $4)
    (local.get $1)
    (ref.i31
     (i32.const 536870912)
    )
    (local.get $13)
    (ref.null none)
   )
  )
  (loop $label (result i64)
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
   (block $block
    (br_if $label
     (i32.eqz
      (i32.const 65535)
     )
    )
    (try_table (catch_all $block)
     (nop)
    )
   )
   (br_if $label
    (i32.const -118)
   )
   (i64.const -31)
  )
 )
 (func $20 (type $3) (result f64)
  (local $0 (ref $9))
  (local $1 anyref)
  (local $2 (ref null $5))
  (local $3 (ref null $13))
  (local $4 (ref null $18))
  (local $5 structref)
  (local $6 (ref null $15))
  (local $7 (ref null $12))
  (local $8 v128)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
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
  (call $20)
 )
 (func $21 (type $19)
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
   (call $20)
  )
  (drop
   (call $20)
  )
  (drop
   (call $20)
  )
  (drop
   (call $20)
  )
 )
 (func $22 (type $26) (result i64)
  (local $0 (ref $2))
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
  (i64.const 33)
 )
 (func $23 (type $19)
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
   (call $22)
  )
 )
 (@binaryen.js.called)
 (func $24 (type $14) (param $0 i64) (param $1 f32) (result i64)
  (local $2 v128)
  (local $3 structref)
  (local $4 (ref $10))
  (local $5 (ref null $8))
  (local $6 stringref)
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
  (local.get $0)
 )
 (func $25 (type $19)
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
   (call $24
    (i64.const -68719476736)
    (f32.const -9223372036854775808)
   )
  )
 )
 (func $26 (type $42) (result (ref $3))
  (local $0 structref)
  (local $1 structref)
  (local $2 (ref null $18))
  (local $3 eqref)
  (local $4 (ref null $8))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 f64)
  (local $10 f64)
  (local $11 i32)
  (local $12 i32)
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
  (ref.func $5)
 )
 (func $27 (type $43) (param $0 i64) (param $1 v128) (param $2 v128) (param $3 f64) (param $4 f64) (param $5 i32) (param $6 (ref $10)) (result (ref null $14))
  (local $7 externref)
  (local $8 externref)
  (local $9 exnref)
  (local $10 (ref null $18))
  (local $11 (ref struct))
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f32)
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
  (block (result (ref (exact $18)))
   (nop)
   (ref.func $4)
  )
 )
 (func $28 (type $18) (param $0 i64) (param $1 f32) (result i64)
  (local $2 f32)
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
  (local $13 v128)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 f64)
  (local $18 stringref)
  (local $19 (ref null $17))
  (local $20 (ref null $17))
  (local $21 (ref null $17))
  (local $22 (ref null $17))
  (local $23 (ref null $17))
  (local $24 (ref null $17))
  (local $25 (ref null $17))
  (local $26 (ref null $17))
  (local $27 (ref null $17))
  (local $28 (ref null $1))
  (local $29 (ref extern))
  (local $30 (ref $1))
  (local $31 (ref $1))
  (local $32 (ref $1))
  (local $33 (ref $1))
  (local $34 (ref null $16))
  (local $35 (ref $16))
  (local $36 (ref $16))
  (local $37 (ref $8))
  (local $38 (ref struct))
  (local $39 (ref array))
  (local $40 (ref array))
  (local $41 (ref $5))
  (local $42 (ref i31))
  (local $43 (ref null $11))
  (local $44 (ref null $13))
  (local $45 (ref null $13))
  (local $46 (ref func))
  (local $47 (ref null $0))
  (local $48 (ref null $0))
  (local $49 i31ref)
  (local $50 i31ref)
  (local $51 funcref)
  (local $52 (ref $24))
  (local $53 (ref $17))
  (local $scratch i64)
  (local $scratch_55 (ref null $0))
  (local $scratch_56 (ref func))
  (local $scratch_57 (ref $13))
  (local $scratch_58 (ref string))
  (local $scratch_59 i64)
  (local $scratch_60 i64)
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
  (local.set $45
   (block (result (ref $13))
    (local.set $scratch_57
     (ref.as_non_null
      (local.get $45)
     )
    )
    (local.set $51
     (block (result (ref func))
      (local.set $scratch_56
       (ref.as_non_null
        (local.get $51)
       )
      )
      (local.set $48
       (block (result (ref null $0))
        (local.set $scratch_55
         (local.get $48)
        )
        (local.set $15
         (block (result i64)
          (local.set $scratch
           (local.get $15)
          )
          (local.set $50
           (local.get $50)
          )
          (local.get $scratch)
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
  (local.set $43
   (ref.as_non_null
    (local.get $43)
   )
  )
  (local.set $31
   (ref.as_non_null
    (local.get $28)
   )
  )
  (local.set $28
   (array.new $1
    (i32.const 16384)
    (i32.and
     (i32.const 29)
     (i32.const 1023)
    )
   )
  )
  (i64.extend_i32_s
   (try (result i32)
    (do
     (string.eq
      (ref.as_non_null
       (local.tee $18
        (string.const "937")
       )
      )
      (string.const "\c2\a3")
     )
    )
    (catch $tag$0
     (local.set $19 (ref.as_non_null (pop (ref null $17))))
     (ref.eq
      (struct.new_default $21)
      (loop $label (result (ref null $16))
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
       (block $block
        (call $fimport$6
         (global.get $global$0)
        )
        (if
         (i32.lt_u
          (i32.add
           (local.tee $5
            (local.get $3)
           )
           (local.tee $6
            (ref.is_null
             (if (result (ref func))
              (ref.eq
               (select (result (ref none))
                (loop (result (ref none))
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
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (ref.cast (ref none)
                 (if (result (ref struct))
                  (i32.eqz
                   (local.get $3)
                  )
                  (then
                   (local.tee $37
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (else
                   (local.tee $38
                    (struct.new_default $21)
                   )
                  )
                 )
                )
                (ref.is_null
                 (ref.cast (ref none)
                  (ref.as_non_null
                   (local.tee $34
                    (local.tee $35
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (array.new_fixed $20 0)
              )
              (then
               (array.copy $1 $1
                (ref.as_non_null
                 (local.get $28)
                )
                (block (result i32)
                 (drop
                  (block (result i64)
                   (local.set $scratch_59
                    (try_table (result i64) (catch_all $label)
                     (local.get $0)
                    )
                   )
                   (drop
                    (block (result (ref string))
                     (local.set $scratch_58
                      (string.const "\e2\82\ac\e2\82\ac\ed\bd\88")
                     )
                     (local.set $12
                      (local.tee $3
                       (local.get $3)
                      )
                     )
                     (local.get $scratch_58)
                    )
                   )
                   (local.get $scratch_59)
                  )
                 )
                 (local.get $12)
                )
                (array.new $1
                 (call $fimport$9
                  (i32.rem_u
                   (i32.const -2147483648)
                   (i32.const 42)
                  )
                 )
                 (i32.and
                  (i32.const 84)
                  (i32.const 1023)
                 )
                )
                (ref.eq
                 (array.new $5
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (i32.and
                   (i32.const 40)
                   (i32.const 1023)
                  )
                 )
                 (array.new_fixed $20 0)
                )
                (if (result i32)
                 (ref.eq
                  (local.tee $39
                   (array.new_fixed $20 0)
                  )
                  (block (result (ref $5))
                   (drop
                    (br_on_null $block
                     (ref.i31
                      (i32.const -64)
                     )
                    )
                   )
                   (select (result (ref $5))
                    (local.tee $41
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                    (local.get $41)
                    (local.get $3)
                   )
                  )
                 )
                 (then
                  (call $fimport$7
                   (ref.func $28)
                  )
                  (i32.atomic.load acqrel offset=3
                   (i64.and
                    (local.get $0)
                    (i64.const 15)
                   )
                  )
                 )
                 (else
                  (call $fimport$2
                   (i64.const -39)
                  )
                  (drop
                   (i31.get_u
                    (try_table (result (ref i31)) (catch_all $block)
                     (ref.i31
                      (i32.const -41)
                     )
                    )
                   )
                  )
                  (i32.trunc_sat_f64_u
                   (select
                    (if (result f64)
                     (i32.const 1)
                     (then
                      (call $fimport$7
                       (select (result (ref func))
                        (select (result (ref (exact $18)))
                         (loop $label1 (result (ref (exact $18)))
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
                           (br_on_null $label1
                            (local.get $41)
                           )
                          )
                          (drop
                           (local.tee $42
                            (if (result (ref i31))
                             (i32.eqz
                              (local.get $5)
                             )
                             (then
                              (ref.i31
                               (i32.const -123)
                              )
                             )
                             (else
                              (ref.i31
                               (i32.const -10)
                              )
                             )
                            )
                           )
                          )
                          (br_if $label1
                           (local.get $5)
                          )
                          (loop (result (ref (exact $18)))
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
                           (ref.func $19)
                          )
                         )
                         (try_table (result (ref (exact $18)))
                          (ref.func $4)
                         )
                         (local.get $7)
                        )
                        (ref.func $8)
                        (if (result i32)
                         (i32.const -8192)
                         (then
                          (call $fimport$8
                           (global.get $gimport$1)
                          )
                          (loop $label2
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
                            (call $fimport$4
                             (f64.const -nan:0xfffff80016736)
                            )
                            (drop
                             (br_on_null $label2
                              (ref.cast (ref none)
                               (ref.null none)
                              )
                             )
                            )
                            (drop
                             (i32.trunc_f64_u
                              (f64.load offset=22 align=4
                               (i64.and
                                (i64.const -57)
                                (i64.const 15)
                               )
                              )
                             )
                            )
                            (drop
                             (i8x16.extract_lane_s 9
                              (loop (result v128)
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
                               (local.get $13)
                              )
                             )
                            )
                            (loop $label3
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
                              (if
                               (local.get $7)
                               (then
                                (local.set $41
                                 (local.get $41)
                                )
                               )
                               (else
                                (local.set $0
                                 (i64.const 262144)
                                )
                               )
                              )
                              (call $fimport$3
                               (f32.const -128)
                              )
                             )
                             (br_if $label3
                              (local.get $8)
                             )
                             (block
                              (nop)
                              (br $label3)
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
                          (call $fimport$1
                           (block (result i32)
                            (call $fimport$6
                             (struct.new_default $7)
                            )
                            (call $fimport$9
                             (i32.rem_u
                              (i16x8.extract_lane_u 7
                               (if (result v128)
                                (i32.eqz
                                 (i32.load8_u offset=4
                                  (i64.and
                                   (i64.const -12240)
                                   (i64.const 15)
                                  )
                                 )
                                )
                                (then
                                 (local.tee $13
                                  (v128.const i32x4 0x00000000 0xc3e00000 0x00000000 0x40e64580)
                                 )
                                )
                                (else
                                 (v128.const i32x4 0x4f000000 0xdb800000 0xbfe4bc6a 0xc82d3938)
                                )
                               )
                              )
                              (i32.const 46)
                             )
                            )
                           )
                          )
                          (i32.const -115)
                         )
                        )
                       )
                      )
                      (f64.add
                       (if (result f64)
                        (i32.load offset=4 align=1
                         (i64.and
                          (i64.atomic.rmw8.sub_u acqrel offset=4
                           (i64.and
                            (call_indirect $0 (type $14)
                             (i64.const -1240525540)
                             (f32.const -2047.1099853515625)
                             (i64.const 3)
                            )
                            (i64.const 15)
                           )
                           (if (result i64)
                            (i32.eqz
                             (i32.const -17)
                            )
                            (then
                             (drop
                              (i64.and
                               (i64.trunc_f32_s
                                (f32.const -nan:0x7ffffa)
                               )
                               (i64.const 15)
                              )
                             )
                             (block
                              (if
                               (i32.eqz
                                (i32.const -3492)
                               )
                               (then
                                (nop)
                               )
                              )
                              (return
                               (i64.const -2147483647)
                              )
                             )
                             (unreachable)
                            )
                            (else
                             (try (result i64)
                              (do
                               (local.tee $0
                                (local.tee $0
                                 (i64.const 9007199254740993)
                                )
                               )
                              )
                              (catch $tag$0
                               (drop (struct.get $17 0 (pop (ref null $17))))
                               (call_ref $26
                                (ref.func $22)
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
                         (call $fimport$6
                          (ref.cast (ref $11)
                           (loop $label4 (result (ref $11))
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
                            (try (result (ref $11))
                             (do
                              (drop
                               (br_on_null $label4
                                (try (result (ref string))
                                 (do
                                  (if (result (ref string))
                                   (local.get $8)
                                   (then
                                    (string.const "")
                                   )
                                   (else
                                    (string.concat
                                     (ref.as_non_null
                                      (local.get $18)
                                     )
                                     (ref.as_non_null
                                      (local.get $18)
                                     )
                                    )
                                   )
                                  )
                                 )
                                 (catch $tag$0
                                  (drop (struct.get $17 0 (pop (ref null $17))))
                                  (string.const "978985")
                                 )
                                )
                               )
                              )
                              (ref.as_non_null
                               (ref.null none)
                              )
                             )
                             (catch $tag$0
                              (drop (ref.test (ref $17) (pop (ref null $17))))
                              (ref.as_non_null
                               (local.tee $43
                                (ref.as_non_null
                                 (ref.null none)
                                )
                               )
                              )
                             )
                             (catch_all
                              (struct.new_default $11)
                             )
                            )
                           )
                          )
                         )
                         (block (result f64)
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
                           (block
                            (atomic.fence acqrel)
                            (return
                             (i64.const -2471)
                            )
                           )
                           (unreachable)
                          )
                          (unreachable)
                         )
                        )
                        (else
                         (f64.const -131072.496)
                        )
                       )
                       (f64.load offset=3 align=2
                        (i64.and
                         (i64.const -67108863)
                         (i64.const 15)
                        )
                       )
                      )
                     )
                     (else
                      (local.set $43
                       (if (result (ref $11))
                        (i32.eqz
                         (i32x4.extract_lane 2
                          (try (result v128)
                           (do
                            (local.get $13)
                           )
                           (catch $tag$0
                            (if (ref.is_null (pop (ref null $17))) (then (nop)) (else (unreachable)))
                            (loop $label5 (result v128)
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
                              (br_on_null $label5
                               (struct.new_default $21)
                              )
                             )
                             (struct.get $16 4
                              (local.get $35)
                             )
                            )
                           )
                           (catch_all
                            (local.get $13)
                           )
                          )
                         )
                        )
                        (then
                         (call $fimport$8
                          (global.get $gimport$1)
                         )
                         (return
                          (i64.const -32767)
                         )
                        )
                        (else
                         (block $block1 (result (ref $11))
                          (nop)
                          (br_on_non_null $block1
                           (ref.as_non_null
                            (local.get $43)
                           )
                          )
                          (block
                           (i32.store8 offset=22
                            (i64.and
                             (call $4
                              (local.get $0)
                              (f32.const 119)
                             )
                             (i64.const 15)
                            )
                            (i32.atomic.rmw8.add_u offset=4
                             (i64.and
                              (i64.atomic.rmw16.and_u acqrel offset=22
                               (i64.and
                                (i64.const 125)
                                (i64.const 15)
                               )
                               (local.get $0)
                              )
                              (i64.const 15)
                             )
                             (block (result i32)
                              (drop
                               (br_on_cast $block1 (ref $11) (ref $11)
                                (ref.as_non_null
                                 (local.get $43)
                                )
                               )
                              )
                              (i32.const 65536)
                             )
                            )
                           )
                           (return
                            (local.get $0)
                           )
                          )
                          (unreachable)
                         )
                        )
                       )
                      )
                      (f64.const -2147483648)
                     )
                    )
                    (f64.const -nan:0xfffd139032377)
                    (local.get $5)
                   )
                  )
                 )
                )
               )
               (ref.func $28)
              )
              (else
               (ref.func $7)
              )
             )
            )
           )
          )
          (local.get $3)
         )
         (then
          (block
           (br $label)
          )
          (local.set $32
           (local.set $30
            (local.set $38
             (local.set $44
              (local.set $46
               (local.set $47
                (local.set $14
                 (local.set $49
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
       )
       (br_if $label
        (local.get $3)
       )
       (drop
        (ref.as_non_null
         (local.tee $34
          (block (result (ref $16))
           (call $fimport$5
            (v128.const i32x4 0xff81ff91 0x00a76f55 0xffff0c37 0x04040001)
           )
           (ref.as_non_null
            (local.get $34)
           )
          )
         )
        )
       )
       (local.get $34)
      )
     )
    )
    (catch_all
     (drop
      (block (result i64)
       (local.set $scratch_60
        (i64.const 1025)
       )
       (local.set $12
        (i32.const 31747)
       )
       (local.get $scratch_60)
      )
     )
     (local.get $12)
    )
   )
  )
 )
 (func $29 (type $19)
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
   (call $28
    (i64.const -65535)
    (f32.const -28)
   )
  )
  (drop
   (call $28
    (i64.const -129)
    (f32.const 0.6710000038146973)
   )
  )
 )
)
