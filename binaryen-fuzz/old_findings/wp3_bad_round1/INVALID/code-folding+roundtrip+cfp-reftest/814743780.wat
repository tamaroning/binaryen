(module
 (rec
  (type $0 (sub (struct (field i32) (field (mut (ref $11))) (field (mut (ref $10))) (field (mut f64)) (field (ref $10)) (field i16))))
  (type $1 (sub (struct)))
  (type $2 (sub (struct (field (mut f32)) (field (mut i64)) (field i8))))
  (type $3 (sub (array f32)))
  (type $4 (sub (descriptor $5) (struct)))
  (type $5 (sub (describes $4) (descriptor $6) (struct)))
  (type $6 (sub (describes $5) (descriptor $8) (struct (field (ref $3)) (field (mut i64)))))
  (type $7 (array (mut (ref $12))))
  (type $8 (sub (describes $6) (descriptor $9) (struct (field (mut v128)) (field (ref $13)) (field i8) (field (mut (ref func))) (field (mut i16)) (field (mut i64)))))
  (type $9 (sub (describes $8) (descriptor $11) (struct (field externref))))
  (type $10 (sub (struct (field i64) (field (mut f32)))))
  (type $11 (sub (describes $9) (struct (field (mut i32)) (field (ref null $7)) (field (mut (ref null $11))) (field i8))))
  (type $12 (sub $1 (struct (field (mut i64)) (field (mut f32)) (field f64))))
  (type $13 (sub (func (param (ref $7)) (result f64))))
 )
 (type $14 (sub final $2 (struct (field (mut f32)) (field (mut i64)) (field i8) (field i64))))
 (rec
  (type $15 (sub final $12 (struct (field (mut i64)) (field (mut f32)) (field f64))))
  (type $16 (func (result (ref null $2))))
 )
 (type $17 (func))
 (rec
  (type $18 (sub $10 (struct (field i64) (field (mut f32)) (field i8) (field f32))))
  (type $19 (sub $13 (func (param (ref eq)) (result f64))))
  (type $20 (sub $19 (func (param (ref any)) (result f64))))
 )
 (type $21 (struct))
 (type $22 (array i8))
 (type $23 (array (mut i16)))
 (type $24 (func (result i32 i64)))
 (type $25 (func (result f64 f32 i32)))
 (type $26 (func (param i32)))
 (type $27 (func (param i32) (result i32)))
 (type $28 (func (param anyref)))
 (type $29 (func (param (ref $15))))
 (type $30 (func (param (ref null $0))))
 (type $31 (func (param i32) (result funcref)))
 (type $32 (func (param i32 funcref)))
 (type $33 (func (param i64)))
 (type $34 (func (param f32)))
 (type $35 (func (param f64)))
 (type $36 (func (param v128)))
 (type $37 (func (param funcref)))
 (type $38 (func (param externref)))
 (type $39 (func (param funcref) (result i32)))
 (type $40 (func (result (ref $5))))
 (type $41 (func (result (ref null $18))))
 (type $42 (func (param (ref null $1) f64 (ref string)) (result (ref $15))))
 (type $43 (func (param eqref (ref null $11) (ref struct) (ref string) structref (ref $0) f64) (result f64)))
 (type $44 (func (param i32 (ref string)) (result (ref null $12))))
 (type $45 (func (param f32) (result (ref null $10))))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_6" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $26) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $31) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $32) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $26) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $33) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $34) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $35) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $36) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $28) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $37) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $38) (param externref)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$11 (type $27) (param i32) (result i32)))
 (import "fuzzing-support" "call-ref-catch" (func $fimport$12 (type $39) (param funcref) (result i32)))
 (global $global$0 (ref $13) (ref.func $0))
 (global $global$1 (mut (ref $6)) (struct.new_desc $6
  (array.new $3
   (f32.const 30814)
   (i32.const 4)
  )
  (i64.const -90)
  (struct.new_desc $8
   (v128.const i32x4 0x00000000 0x00000000 0xffffa255 0xffffffff)
   (ref.func $0)
   (i32.const -25033)
   (ref.func $0)
   (i32.const 22561)
   (i64.const -112)
   (struct.new_desc $9
    (string.const "")
    (struct.new $11
     (i32.const -59)
     (array.new $7
      (struct.new_default $12)
      (i32.const 98)
     )
     (ref.null none)
     (i32.const -64)
    )
   )
  )
 ))
 (global $global$2 (ref null $10) (struct.new $10
  (i64.const -84)
  (f32.const -nan:0x7ffff6)
 ))
 (global $global$3 (ref null $15) (struct.new $15
  (i64.const -16367)
  (f32.const 140737488355328)
  (f64.const 2147483648.142)
 ))
 (global $global$4 (ref null $0) (struct.new $0
  (i32.const 268435456)
  (struct.new_default $11)
  (struct.new $10
   (i64.const -97)
   (f32.const -3402823466385288598117041e14)
  )
  (f64.const -8589934593)
  (struct.new_default $10)
  (i32.const 214)
 ))
 (global $global$5 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 "\d57B\ad\0f")
 (data $1 "\cb\90\f5\tx\14\b5F\cf\e7Y\82\a7\89\19#\f2")
 (data $2 " R\17\08Sa\07\a6@\92\acL/7\bf\1b\91\bc\e6u\1e\e5\bd")
 (data $3 "\97V\95\b7\c0e\dc\83}\a1\fd\1f{\a4\01hj\83\e5\dcG\8e\e3 9g\18\87")
 (data $4 "\88\a0w\c7\13\ba:0\00\dd7%Z\97AN\16B\ff7L\18\b9\80\b2")
 (data $5 "\d8m\1cg\00_0\e8\da\be\fa\a2")
 (data $6 (i64.const 0) "\1fW}\93\te")
 (table $0 6 funcref (ref.null nofunc))
 (table $1 7 7 exnref)
 (elem $0 (table $0) (i32.const 0) func $1 $3 $5 $17 $17 $17)
 (elem declare func $12 $20 $26 $27 $8 $fimport$0 $fimport$11 $fimport$3 $fimport$6 $fimport$8)
 (tag $tag$0 (type $29) (param (ref $15)))
 (tag $tag$1 (type $30) (param (ref null $0)))
 (tag $tag$2 (type $17))
 (export "global$_1" (global $global$1))
 (export "global$_2" (global $global$2))
 (export "tag$" (tag $tag$0))
 (export "tag$_1" (tag $tag$1))
 (export "table" (table $0))
 (export "func_invoker" (func $2))
 (export "func_16_invoker" (func $4))
 (export "func_18_invoker" (func $6))
 (export "func_20" (func $8))
 (export "func_20_invoker" (func $9))
 (export "func_23_invoker" (func $11))
 (export "func_28_invoker" (func $16))
 (export "func_30" (func $17))
 (export "func_31_invoker" (func $19))
 (export "func_33_invoker" (func $21))
 (export "func_35_invoker" (func $23))
 (export "func_39" (func $26))
 (export "func_39_invoker" (func $27))
 (export "func_41_invoker" (func $29))
 (export "func_43_invoker" (func $31))
 (start $2)
 (func $0 (type $13) (param $0 (ref $7)) (result f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $13) (param $0 (ref $7)) (result f64)
  (local $1 (ref eq))
  (local $2 (ref $20))
  (local $3 exnref)
  (local $4 (ref $13))
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 v128)
  (local $9 v128)
  (local $10 f64)
  (local $11 f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.get $11)
 )
 (func $2 (type $17)
  (local $0 f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 (ref $18))
  (local $5 (ref $18))
  (local $6 (ref $0))
  (local $7 (ref $0))
  (local $8 (ref $0))
  (local $9 (ref extern))
  (local $10 (ref extern))
  (local $11 (ref $15))
  (local $12 (ref $7))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $1
    (array.new $7
     (if (result (ref $15))
      (i32.eqz
       (ref.eq
        (array.new $3
         (f32.const -70368744177664)
         (i32.and
          (i32.const 89)
          (i32.const 1023)
         )
        )
        (try_table (result (ref (exact $21)))
         (struct.new_default $21)
        )
       )
      )
      (then
       (nop)
       (drop
        (struct.new_default $15)
       )
       (block
        (call $fimport$8
         (array.new_fixed $22 0)
        )
        (return)
       )
       (local.set $12
        (local.set $11
         (local.set $9
          (local.set $10
           (local.set $6
            (local.set $7
             (local.set $8
              (unreachable)
             )
            )
           )
          )
         )
        )
       )
      )
      (else
       (nop)
       (return)
      )
     )
     (i32.and
      (i32.const 28)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $3 (type $40) (result (ref $5))
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 (ref null $9))
  (local $6 (ref null $1))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (struct.new_default_desc $5
   (struct.new_desc $6
    (array.new_default $3
     (i32.and
      (i32.const 26)
      (i32.const 1023)
     )
    )
    (local.get $3)
    (struct.new_desc $8
     (v128.const i32x4 0x0000ffbe 0x0001b810 0xfffb1001 0x0000ffe5)
     (global.get $global$0)
     (i32.const -2047)
     (ref.func $fimport$11)
     (i32.const -30936)
     (i64.const 2147483647)
     (struct.new_default_desc $9
      (ref.as_non_null
       (ref.null none)
      )
     )
    )
   )
  )
 )
 (func $4 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $3)
  )
 )
 (@binaryen.js.called)
 (func $5 (type $41) (result (ref null $18))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (ref.null none)
   )
  )
  (unreachable)
 )
 (func $6 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $5)
  )
 )
 (func $7 (type $19) (param $0 (ref eq)) (result f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $8 (type $16) (result (ref null $2))
  (local $0 (ref $23))
  (local $1 (ref $23))
  (local $2 (ref $23))
  (local $3 (ref string))
  (local $4 (ref string))
  (local $5 (ref string))
  (local $6 (ref string))
  (local $7 (ref string))
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref null $0))
  (local $11 (ref null $0))
  (local $12 (ref null $0))
  (local $13 (ref $15))
  (local $14 (ref $15))
  (local $15 (ref none))
  (local $16 (ref $12))
  (local $17 (ref null $14))
  (local $18 nullfuncref)
  (local $19 i64)
  (local $20 i64)
  (local $21 i64)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 f64)
  (local $30 f32)
  (local $scratch i64)
  (local $scratch_32 (tuple i32 i64))
  (local $scratch_33 i32)
  (local $scratch_34 i64)
  (local $scratch_35 (ref none))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (return
   (try (result (ref $14))
    (do
     (nop)
     (return
      (struct.new $2
       (f32.const 0.2840000092983246)
       (i64.const -1873465599)
       (i32.const 65423)
      )
     )
    )
    (catch $tag$1
     (local.set $8 (select (result (ref null $0)) (pop (ref null $0)) (ref.null none) (i32.const 1)))
     (if (result (ref $14))
      (ref.is_null
       (ref.i31
        (i32.const -32766)
       )
      )
      (then
       (struct.new_default $14)
      )
      (else
       (block $block5 (result (ref $14))
        (try
         (do
          (memory.copy
           (i64.and
            (i64.const 65534)
            (i64.const 15)
           )
           (i64.and
            (i64.const -11254)
            (i64.const 15)
           )
           (i64.trunc_f64_u
            (try_table (result f64)
             (local.tee $29
              (f64.const 18446744073709551615)
             )
            )
           )
          )
         )
         (catch $tag$1
          (throw $tag$1 (pop (ref null $0)))
          (loop
           (if
            (i32.eqz
             (global.get $global$5)
            )
            (then
             (global.set $global$5
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$5
            (i32.sub
             (global.get $global$5)
             (i32.const 1)
            )
           )
           (block $block
            (drop
             (i64.and
              (local.get $21)
              (i64.const 15)
             )
            )
            (drop
             (local.tee $21
              (block (result i64)
               (local.set $scratch
                (i64.const 0)
               )
               (drop
                (i32.const -32767)
               )
               (local.get $scratch)
              )
             )
            )
            (loop
             (if
              (i32.eqz
               (global.get $global$5)
              )
              (then
               (global.set $global$5
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$5
              (i32.sub
               (global.get $global$5)
               (i32.const 1)
              )
             )
             (block
              (call $fimport$10
               (global.get $gimport$1)
              )
              (br $block)
             )
             (unreachable)
            )
            (unreachable)
           )
          )
         )
         (catch $tag$0
          (struct.set $15 0 (pop (ref $15)) (i64.const 1))
          (block $block1
           (br_if $block1
            (i32.eqz
             (i32.const 30496)
            )
           )
           (if
            (i32.eqz
             (string.eq
              (string.const "")
              (select (result (ref string))
               (string.const "\ed\a0\80")
               (string.const "807\f0\90\8d\88925")
               (block (result i32)
                (local.set $scratch_33
                 (tuple.extract 2 0
                  (local.tee $scratch_32
                   (loop $label (type $24) (result i32 i64)
                    (if
                     (i32.eqz
                      (global.get $global$5)
                     )
                     (then
                      (global.set $global$5
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$5
                     (i32.sub
                      (global.get $global$5)
                      (i32.const 1)
                     )
                    )
                    (block
                     (nop)
                    )
                    (br_if $label
                     (i32.eqz
                      (i32.const -19890)
                     )
                    )
                    (try (type $24) (result i32 i64)
                     (do
                      (nop)
                      (tuple.make 2
                       (i32.const -5888242)
                       (i64.const -17592186044416)
                      )
                     )
                     (catch_all
                      (tuple.make 2
                       (i32.const -8192)
                       (i64.const 4294934815)
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (drop
                 (tuple.extract 2 1
                  (local.get $scratch_32)
                 )
                )
                (local.get $scratch_33)
               )
              )
             )
            )
            (then
             (block $block3
              (if
               (string.compare
                (local.tee $4
                 (string.const "\c2\a3")
                )
                (local.tee $5
                 (local.tee $5
                  (string.const "\c2\a3\f0\90\8d\88\c2\a3")
                 )
                )
               )
               (then
                (local.set $19
                 (block (result i64)
                  (local.set $scratch_34
                   (i64.const -59)
                  )
                  (local.set $20
                   (i64.const -4503599627370496)
                  )
                  (local.get $scratch_34)
                 )
                )
                (loop
                 (if
                  (i32.eqz
                   (global.get $global$5)
                  )
                  (then
                   (global.set $global$5
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$5
                  (i32.sub
                   (global.get $global$5)
                   (i32.const 1)
                  )
                 )
                 (block
                  (if
                   (ref.eq
                    (ref.as_non_null
                     (ref.null none)
                    )
                    (array.new_fixed $22 0)
                   )
                   (then
                    (table.set $0
                     (i32.const 1)
                     (block (result nullfuncref)
                      (drop
                       (block (result (ref none))
                        (local.set $scratch_35
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                        (local.set $18
                         (ref.null nofunc)
                        )
                        (local.get $scratch_35)
                       )
                      )
                      (local.get $18)
                     )
                    )
                   )
                  )
                  (drop
                   (i64.and
                    (i64.load16_u offset=4
                     (i64.and
                      (try_table (result i64) (catch_all $block1)
                       (local.get $21)
                      )
                      (i64.const 15)
                     )
                    )
                    (i64.const 15)
                   )
                  )
                  (loop $label2
                   (if
                    (i32.eqz
                     (global.get $global$5)
                    )
                    (then
                     (global.set $global$5
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$5
                    (i32.sub
                     (global.get $global$5)
                     (i32.const 1)
                    )
                   )
                   (block
                    (loop $label1
                     (if
                      (i32.eqz
                       (global.get $global$5)
                      )
                      (then
                       (global.set $global$5
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$5
                      (i32.sub
                       (global.get $global$5)
                       (i32.const 1)
                      )
                     )
                     (call $fimport$0
                      (i32.const 268435455)
                     )
                     (br_if $label1
                      (i32.eqz
                       (i32.const -6021307)
                      )
                     )
                     (nop)
                    )
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
              )
              (call $fimport$7
               (try (result v128)
                (do
                 (loop $label3 (result v128)
                  (if
                   (i32.eqz
                    (global.get $global$5)
                   )
                   (then
                    (global.set $global$5
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$5
                   (i32.sub
                    (global.get $global$5)
                    (i32.const 1)
                   )
                  )
                  (block $block2
                   (nop)
                   (try
                    (do
                     (if
                      (i32.eqz
                       (i32.const -112)
                      )
                      (then
                       (br_if $block2
                        (i32.eqz
                         (i32.const 32768)
                        )
                       )
                      )
                     )
                    )
                    (catch $tag$0
                     (drop (struct.get $15 0 (pop (ref $15))))
                     (nop)
                    )
                    (catch $tag$1
                     (if (ref.is_null (pop (ref null $0))) (then (nop)) (else (unreachable)))
                     (drop
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                     (drop
                      (local.get $30)
                     )
                     (unreachable)
                    )
                    (catch_all
                     (nop)
                    )
                   )
                  )
                  (br_if $label3
                   (block (result i32)
                    (nop)
                    (local.get $25)
                   )
                  )
                  (v128.const i32x4 0x703cc65b 0x00faff89 0x31300001 0xffefd980)
                 )
                )
                (catch $tag$1
                 (local.set $11 (ref.as_non_null (pop (ref null $0))))
                 (f64x2.splat
                  (f64.const 4294967294.874)
                 )
                )
                (catch_all
                 (loop $label4 (result v128)
                  (if
                   (i32.eqz
                    (global.get $global$5)
                   )
                   (then
                    (global.set $global$5
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$5
                   (i32.sub
                    (global.get $global$5)
                    (i32.const 1)
                   )
                  )
                  (block
                   (call_ref $28
                    (ref.null none)
                    (ref.func $fimport$8)
                   )
                   (try_table (catch_all $block3)
                    (atomic.fence)
                   )
                  )
                  (br_if $label4
                   (ref.is_null
                    (struct.new_default $21)
                   )
                  )
                  (v128.load offset=22 align=4
                   (i64.and
                    (i64.reinterpret_f64
                     (local.get $29)
                    )
                    (i64.const 15)
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
         (catch_all
          (loop $label6
           (if
            (i32.eqz
             (global.get $global$5)
            )
            (then
             (global.set $global$5
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$5
            (i32.sub
             (global.get $global$5)
             (i32.const 1)
            )
           )
           (block
            (memory.fill
             (i64.and
              (i64.const 4097)
              (i64.const 15)
             )
             (select
              (i32.const -128)
              (local.get $25)
              (i32.atomic.rmw16.and_u offset=22
               (i64.and
                (local.get $21)
                (i64.const 15)
               )
               (f32.ne
                (select
                 (if (result f32)
                  (local.get $25)
                  (then
                   (f32.const -137438953472)
                  )
                  (else
                   (f32.const -nan:0x7fffb6)
                  )
                 )
                 (if (result f32)
                  (local.get $24)
                  (then
                   (local.get $30)
                  )
                  (else
                   (f32.const -576460752303423488)
                  )
                 )
                 (if (result i32)
                  (i32.eqz
                   (i32.const 536870912)
                  )
                  (then
                   (i32.const -32767)
                  )
                  (else
                   (local.get $25)
                  )
                 )
                )
                (local.get $30)
               )
              )
             )
             (try (result i64)
              (do
               (local.tee $21
                (select
                 (local.get $21)
                 (if (result i64)
                  (i32.eqz
                   (i32.load16_s offset=22 align=1
                    (i64.and
                     (local.get $21)
                     (i64.const 15)
                    )
                   )
                  )
                  (then
                   (nop)
                   (drop
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                   (i64.extend16_s
                    (unreachable)
                   )
                  )
                  (else
                   (table.set $1
                    (i32.const 0)
                    (block $block4 (result (ref exn))
                     (try_table (catch_all_ref $block4)
                      (throw $tag$2)
                     )
                     (unreachable)
                    )
                   )
                   (i64.atomic.load8_u acqrel offset=3
                    (i64.and
                     (i64.const -262144)
                     (i64.const 15)
                    )
                   )
                  )
                 )
                 (i64.eqz
                  (local.get $21)
                 )
                )
               )
              )
              (catch_all
               (local.get $21)
              )
             )
            )
            (nop)
           )
           (if
            (i32.eqz
             (call $fimport$12
              (ref.func $fimport$6)
             )
            )
            (then
             (memory.copy
              (i64.and
               (loop $label5 (result i64)
                (if
                 (i32.eqz
                  (global.get $global$5)
                 )
                 (then
                  (global.set $global$5
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$5
                 (i32.sub
                  (global.get $global$5)
                  (i32.const 1)
                 )
                )
                (if
                 (i32.lt_u
                  (local.tee $28
                   (local.get $25)
                  )
                  (array.len
                   (local.tee $15
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                 (then
                  (drop
                   (local.get $15)
                  )
                  (drop
                   (local.get $28)
                  )
                  (drop
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                  (unreachable)
                 )
                )
                (br_if $label5
                 (i32.eqz
                  (local.get $25)
                 )
                )
                (i64.extend_i32_s
                 (local.get $24)
                )
               )
               (i64.const 15)
              )
              (i64.and
               (local.get $21)
               (i64.const 15)
              )
              (i64.const 20251)
             )
             (br $label6)
            )
            (else
             (drop
              (br_on_cast_fail $block5 (ref none) (ref none)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
             (if
              (i32.eqz
               (i64.ge_s
                (local.get $21)
                (local.get $21)
               )
              )
              (then
               (call $fimport$2
                (try_table (result i32) (catch_all $label6)
                 (local.get $24)
                )
                (call $fimport$1
                 (f32.lt
                  (if (result f32)
                   (local.get $24)
                   (then
                    (f32.const 2046.845947265625)
                   )
                   (else
                    (f32.const 10)
                   )
                  )
                  (local.get $30)
                 )
                )
               )
               (try
                (do
                 (nop)
                 (atomic.fence)
                )
                (catch $tag$1
                 (local.set $12 (ref.cast (ref $0) (pop (ref null $0))))
                 (block
                  (br_if $label6
                   (i32.const 128)
                  )
                  (call $fimport$8
                   (ref.null none)
                  )
                 )
                )
               )
              )
             )
             (br $label6)
            )
           )
           (local.set $16
            (unreachable)
           )
          )
          (unreachable)
         )
        )
        (ref.as_non_null
         (local.tee $17
          (struct.new $14
           (f32.const -nan:0x7fffa8)
           (i64.const -5)
           (i32.const -513)
           (local.get $21)
          )
         )
        )
       )
      )
     )
    )
    (catch_all
     (ref.as_non_null
      (local.get $17)
     )
    )
   )
  )
 )
 (func $9 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $8)
  )
 )
 (@binaryen.js.called)
 (func $10 (type $20) (param $0 (ref any)) (result f64)
  (local $1 i32)
  (local $2 f64)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (f64.add
   (if (result f64)
    (i32.eqz
     (local.tee $1
      (local.tee $1
       (i32.const -88)
      )
     )
    )
    (then
     (f64.load offset=22
      (i64.and
       (i64.const 128)
       (i64.const 15)
      )
     )
    )
    (else
     (drop
      (block (result i64)
       (local.set $scratch
        (i64.const -2047)
       )
       (local.set $2
        (f64.const 189)
       )
       (local.get $scratch)
      )
     )
     (local.get $2)
    )
   )
   (f64.const -0.267)
  )
 )
 (func $11 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $10
    (array.new_fixed $22 0)
   )
  )
 )
 (@binaryen.js.called)
 (func $12 (type $20) (param $0 (ref any)) (result f64)
  (local $1 i64)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 (ref null $4))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.tee $3
   (block (result f64)
    (nop)
    (f64.promote_f32
     (f32.const -1.1380000114440918)
    )
   )
  )
 )
 (func $13 (type $42) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref string)) (result (ref $15))
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 i64)
  (local $10 f64)
  (local $11 (ref $15))
  (local $12 (ref $15))
  (local $13 (ref $15))
  (local $14 (ref $15))
  (local $15 (ref none))
  (local $16 (ref string))
  (local $17 (ref $23))
  (local $18 nullexternref)
  (local $19 (ref $7))
  (local $20 (ref $13))
  (local $21 (ref $8))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.set $19
   (array.new $7
    (struct.new $12
     (i64.const 65411)
     (f32.const -76)
     (local.get $1)
    )
    (i32.and
     (i32.const 27)
     (i32.const 1023)
    )
   )
  )
  (local.set $13
   (struct.new_default $15)
  )
  (block $block (result (ref $15))
   (try_table (catch $tag$0 $block)
    (local.set $16
     (local.get $2)
    )
    (drop
     (i32.add
      (local.tee $5
       (call_ref $27
        (i32.const -536870912)
        (ref.func $fimport$11)
       )
      )
      (local.tee $6
       (string.measure_wtf16
        (local.get $16)
       )
      )
     )
    )
    (block
     (if
      (i32.lt_u
       (local.tee $4
        (local.get $3)
       )
       (array.len
        (local.tee $15
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
      )
      (then
       (drop
        (local.get $15)
       )
       (drop
        (local.get $4)
       )
       (drop
        (local.tee $11
         (local.tee $12
          (local.tee $13
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
        )
       )
       (unreachable)
      )
     )
     (return
      (struct.new $15
       (i64.const -127)
       (f32.const -3)
       (f64.const -nan:0xfffffffa82d0c)
      )
     )
    )
    (local.set $17
     (unreachable)
    )
   )
   (unreachable)
  )
 )
 (func $14 (type $43) (param $0 eqref) (param $1 (ref null $11)) (param $2 (ref struct)) (param $3 (ref string)) (param $4 structref) (param $5 (ref $0)) (param $6 f64) (result f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.tee $6
   (block (result f64)
    (nop)
    (local.get $6)
   )
  )
 )
 (@binaryen.js.called)
 (func $15 (type $19) (param $0 (ref eq)) (result f64)
  (local $1 eqref)
  (local $2 (ref $3))
  (local $3 (ref $12))
  (local $4 (ref i31))
  (local $5 (ref $8))
  (local $6 (ref $8))
  (local $7 (ref null $18))
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 v128)
  (local $scratch i32)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block (result f64)
   (nop)
   (f64.copysign
    (f64.reinterpret_i64
     (try (result i64)
      (do
       (try_table (result i64)
        (i64.const -42)
       )
      )
      (catch_all
       (i64.trunc_f32_u
        (f32.const 2147483648)
       )
      )
     )
    )
    (f64.sqrt
     (if (result f64)
      (i32.const -268435456)
      (then
       (v128.store offset=1 align=4
        (i64.and
         (i64.const -16777216)
         (i64.const 15)
        )
        (select
         (local.tee $13
          (v128.const i32x4 0x83921b00 0xe12ac800 0x44ff0200 0x70010000)
         )
         (v128.load offset=22 align=4
          (i64.and
           (i64.const -17179869184)
           (i64.const 15)
          )
         )
         (if (result i32)
          (ref.is_null
           (struct.new_default $21)
          )
          (then
           (f32.le
            (f32.add
             (if (result f32)
              (i32.lt_u
               (local.tee $8
                (block (result i32)
                 (local.set $scratch
                  (i32.const 17)
                 )
                 (drop
                  (i64.const -17179869184)
                 )
                 (local.get $scratch)
                )
               )
               (array.len
                (local.tee $2
                 (array.new_default $3
                  (i32.and
                   (i32.const 38)
                   (i32.const 1023)
                  )
                 )
                )
               )
              )
              (then
               (array.get $3
                (local.get $2)
                (local.get $8)
               )
              )
              (else
               (f32.const -16777216)
              )
             )
             (if (result f32)
              (i32.atomic.load offset=22
               (i64.and
                (block (result i64)
                 (nop)
                 (local.tee $11
                  (local.get $12)
                 )
                )
                (i64.const 15)
               )
              )
              (then
               (nop)
               (f32.const -128.69200134277344)
              )
              (else
               (call $fimport$0
                (f32.le
                 (f32.const 157)
                 (f32.const -1)
                )
               )
               (f32.const -2147483648)
              )
             )
            )
            (if (result f32)
             (i32.eqz
              (call $fimport$11
               (i32.rem_u
                (local.tee $9
                 (stringview_wtf16.get_codeunit
                  (string.const "\e2\82\ac")
                  (block (result i32)
                   (local.set $10
                    (i32.const 127)
                   )
                   (local.get $10)
                  )
                 )
                )
                (i32.const 24)
               )
              )
             )
             (then
              (f32.copysign
               (f32.const 144115188075855872)
               (f32x4.extract_lane 1
                (f64x2.splat
                 (f64.const 4294947899)
                )
               )
              )
             )
             (else
              (call $fimport$8
               (ref.i31
                (i32.const 1)
               )
              )
              (f32.const -19)
             )
            )
           )
          )
          (else
           (call_ref $26
            (local.get $9)
            (ref.func $fimport$0)
           )
           (return
            (f64.const 4294967294.83)
           )
          )
         )
        )
       )
       (block
        (loop $label
         (if
          (i32.eqz
           (global.get $global$5)
          )
          (then
           (global.set $global$5
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$5
          (i32.sub
           (global.get $global$5)
           (i32.const 1)
          )
         )
         (block
          (drop
           (i64.and
            (i64.const -127)
            (i64.const 15)
           )
          )
          (loop
           (if
            (i32.eqz
             (global.get $global$5)
            )
            (then
             (global.set $global$5
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$5
            (i32.sub
             (global.get $global$5)
             (i32.const 1)
            )
           )
           (block
            (br $label)
           )
           (unreachable)
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
         (i32.const -23940)
        )
        (then
         (return
          (f64.const 2097152)
         )
        )
        (else
         (loop
          (if
           (i32.eqz
            (global.get $global$5)
           )
           (then
            (global.set $global$5
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$5
           (i32.sub
            (global.get $global$5)
            (i32.const 1)
           )
          )
          (block
           (block
            (nop)
            (return
             (f64.const 112)
            )
           )
           (unreachable)
          )
          (unreachable)
         )
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
 (func $16 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $15
    (array.new_fixed $22 0)
   )
  )
 )
 (func $17 (type $16) (result (ref null $2))
  (local $0 (ref $15))
  (local $1 (ref null $5))
  (local $2 (ref $7))
  (local $3 i32)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (struct.new_default $14)
 )
 (func $18 (type $16) (result (ref null $2))
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f64)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i31ref)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block $block
   (nop)
   (br_table $block $block $block $block $block $block $block $block $block $block
    (block (result i32)
     (try_table
      (call $fimport$7
       (v128.const i32x4 0xd0ffff29 0xfff0a95e 0x9100016e 0xe08d0001)
      )
     )
     (i32.const -11187)
    )
   )
  )
  (return_call_ref $16
   (ref.func $8)
  )
 )
 (func $19 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $18)
  )
  (drop
   (call $18)
  )
 )
 (@binaryen.js.called)
 (func $20 (type $20) (param $0 (ref any)) (result f64)
  (local $1 (ref $12))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$7
    (v128.const i32x4 0xffffffa3 0x00000000 0x00000009 0x00000000)
   )
   (return
    (f64.const 18446744073709551615)
   )
  )
  (unreachable)
 )
 (func $21 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $20
    (array.new_fixed $22 0)
   )
  )
  (drop
   (call $20
    (struct.new_default $21)
   )
  )
  (drop
   (call $20
    (ref.i31
     (i32.const -2048)
    )
   )
  )
 )
 (func $22 (type $44) (param $0 i32) (param $1 (ref string)) (result (ref null $12))
  (local $2 (ref $12))
  (local $3 (ref null $14))
  (local $4 stringref)
  (local $5 (ref null $18))
  (local $6 (ref null $3))
  (local $7 funcref)
  (local $8 (ref $1))
  (local $9 f64)
  (local $10 f64)
  (local $scratch nullref)
  (local $scratch_12 i64)
  (local $scratch_13 i32)
  (local $scratch_14 f32)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $12)))
   (drop
    (block (result f32)
     (local.set $scratch_14
      (f32.const -4294967296)
     )
     (drop
      (block (result i32)
       (local.set $scratch_13
        (i32.const -2048)
       )
       (drop
        (block (result i64)
         (local.set $scratch_12
          (i64.const 0)
         )
         (drop
          (block (result nullref)
           (local.set $scratch
            (ref.null none)
           )
           (drop
            (array.new_fixed $22 0)
           )
           (local.get $scratch)
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
   (if (result (ref (exact $12)))
    (local.tee $0
     (ref.is_null
      (ref.func $12)
     )
    )
    (then
     (if
      (i32.eqz
       (i32.const -23295)
      )
      (then
       (table.set $1
        (i32.const 6)
        (block $block (result (ref exn))
         (try_table (catch_all_ref $block)
          (throw $tag$2)
         )
         (unreachable)
        )
       )
       (nop)
      )
     )
     (struct.new $12
      (i64.const -9223372036854775808)
      (f32.const 18446744073709551615)
      (local.get $10)
     )
    )
    (else
     (struct.new $12
      (i64.const -31876)
      (f32.const 274877906944)
      (local.get $10)
     )
    )
   )
  )
 )
 (func $23 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $22
    (i32.const -524288)
    (string.const "")
   )
  )
  (drop
   (call $22
    (i32.const -536870911)
    (string.const "\f0\90\8d\88999\e2\82\ac")
   )
  )
  (drop
   (call $22
    (i32.const -67108863)
    (string.const "")
   )
  )
  (drop
   (call $22
    (i32.const -33554432)
    (string.const "\f0\90\8d\88\ed\bd\88")
   )
  )
  (drop
   (call $22
    (i32.const -100)
    (string.const "\ed\bd\88\f0\90\8d\88\c2\a3")
   )
  )
 )
 (func $24 (type $13) (param $0 (ref $7)) (result f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f64.const -2147483648.149)
   )
  )
  (unreachable)
 )
 (func $25 (type $20) (param $0 (ref any)) (result f64)
  (local $1 funcref)
  (local $2 exnref)
  (local $3 (ref $6))
  (local $4 i32)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$2
    (local.get $4)
    (call $fimport$1
     (ref.test (ref (exact $12))
      (try_table (result (ref (exact $12)))
       (struct.new $12
        (i64.const -23605242423837127)
        (f32.const 6.574999809265137)
        (f64.const -nan:0xfffffff897d0e)
       )
      )
     )
    )
   )
   (return
    (f64.const -nan:0xfffffffffff9c)
   )
  )
  (unreachable)
 )
 (func $26 (type $16) (result (ref null $2))
  (local $0 f32)
  (local $1 (ref array))
  (local $2 (ref (exact $16)))
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block $block (result (ref (exact $14)))
   (call $fimport$8
    (ref.null none)
   )
   (drop
    (br_on_cast $block (ref (exact $14)) (ref (exact $14))
     (struct.new_default $14)
    )
   )
   (loop $label (result (ref (exact $14)))
    (if
     (i32.eqz
      (global.get $global$5)
     )
     (then
      (global.set $global$5
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$5
     (i32.sub
      (global.get $global$5)
      (i32.const 1)
     )
    )
    (block (result (ref (exact $14)))
     (drop
      (block (result i64)
       (local.set $scratch
        (i64.const -833669)
       )
       (local.set $2
        (ref.func $26)
       )
       (local.get $scratch)
      )
     )
     (br_if $label
      (call $fimport$12
       (local.get $2)
      )
     )
     (nop)
     (struct.new_default $14)
    )
   )
  )
 )
 (func $27 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $26)
  )
  (drop
   (call $26)
  )
 )
 (func $28 (type $13) (param $0 (ref $7)) (result f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (f64.const -nan:0xfffffffffffa8)
   )
  )
  (unreachable)
 )
 (func $29 (type $17)
  (local $0 (ref $12))
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $28
    (array.new $7
     (local.tee $0
      (struct.new $15
       (i64.const 1048577)
       (f32.const 2147483648)
       (f64.const -65535.779)
      )
     )
     (i32.and
      (i32.const 96)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $30 (type $20) (param $0 (ref any)) (result f64)
  (local $1 stringref)
  (local $2 anyref)
  (local $3 (ref null $0))
  (local $4 (ref null $0))
  (local $5 (ref null $0))
  (local $6 (ref null $19))
  (local $7 (ref struct))
  (local $8 (ref $15))
  (local $9 (ref $7))
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i64)
  (local $20 f32)
  (local $21 f32)
  (local $scratch (tuple f64 f32 i32))
  (local $scratch_23 f32)
  (local $scratch_24 f64)
  (local $scratch_25 (tuple f64 f32 i32))
  (local $scratch_26 f32)
  (local $scratch_27 f64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.set $scratch_27
   (tuple.extract 3 0
    (local.tee $scratch_25
     (try (type $25) (result f64 f32 i32)
      (do
       (tuple.make 3
        (f64.const -nan:0xffffffff80919)
        (f32.const -9223372036854775808)
        (i32.const 65537)
       )
      )
      (catch $tag$1
       (local.set $4 (pop (ref null $0)))
       (try_table (type $25) (result f64 f32 i32)
        (tuple.make 3
         (local.tee $12
          (block (result f64)
           (local.set $scratch_24
            (tuple.extract 3 0
             (local.tee $scratch
              (block (type $25) (result f64 f32 i32)
               (if
                (i32.eqz
                 (ref.eq
                  (ref.i31
                   (i32.const -18370)
                  )
                  (array.new_fixed $22 0)
                 )
                )
                (then
                 (block $block
                  (call $fimport$3
                   (i32.const -10656)
                  )
                  (block
                   (block
                    (call_ref $17
                     (ref.func $27)
                    )
                    (try
                     (do
                      (loop $label
                       (if
                        (i32.eqz
                         (global.get $global$5)
                        )
                        (then
                         (global.set $global$5
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$5
                        (i32.sub
                         (global.get $global$5)
                         (i32.const 1)
                        )
                       )
                       (block
                        (block
                         (nop)
                         (nop)
                        )
                        (nop)
                       )
                       (br_if $label
                        (i32.eqz
                         (ref.eq
                          (local.tee $7
                           (struct.new_default $21)
                          )
                          (ref.null none)
                         )
                        )
                       )
                       (call $fimport$0
                        (i32.const 524287)
                       )
                      )
                     )
                     (catch $tag$1
                      (drop (struct.get $0 0 (pop (ref null $0))))
                      (call $fimport$0
                       (i32.const 0)
                      )
                     )
                     (catch $tag$0
                      (drop (pop (ref $15)))
                      (call $fimport$3
                       (i32.const 1)
                      )
                     )
                    )
                   )
                   (if
                    (string.measure_wtf16
                     (try_table (result (ref string)) (catch_all $block)
                      (string.const "\ed\bd\88\ed\a0\80")
                     )
                    )
                    (then
                     (br_if $block
                      (i64.lt_s
                       (i64.load32_u offset=22 align=1
                        (i64.and
                         (i64.const 2147483648)
                         (i64.const 15)
                        )
                       )
                       (loop $label1 (result i64)
                        (if
                         (i32.eqz
                          (global.get $global$5)
                         )
                         (then
                          (global.set $global$5
                           (i32.const 100)
                          )
                          (unreachable)
                         )
                        )
                        (global.set $global$5
                         (i32.sub
                          (global.get $global$5)
                          (i32.const 1)
                         )
                        )
                        (if
                         (i32.eqz
                          (i32.const 200)
                         )
                         (then
                          (nop)
                         )
                         (else
                          (nop)
                         )
                        )
                        (br_if $label1
                         (i32.eqz
                          (if (result i32)
                           (i32.eqz
                            (i32.const -126)
                           )
                           (then
                            (i32.const -65536)
                           )
                           (else
                            (i64.gt_u
                             (i64.const 127)
                             (i64.const 4611686018427387904)
                            )
                           )
                          )
                         )
                        )
                        (i64.const 77)
                       )
                      )
                     )
                    )
                    (else
                     (nop)
                     (if
                      (i32.eqz
                       (i32.const -16383)
                      )
                      (then
                       (call $fimport$8
                        (ref.i31
                         (i32.const -12)
                        )
                       )
                       (table.set $1
                        (i32.const 2)
                        (ref.null noexn)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (else
                 (block $block1
                  (drop
                   (struct.new_default $14)
                  )
                  (block
                   (call $fimport$4
                    (if (result i64)
                     (ref.eq
                      (ref.as_non_null
                       (ref.null none)
                      )
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                     (then
                      (loop $label2
                       (if
                        (i32.eqz
                         (global.get $global$5)
                        )
                        (then
                         (global.set $global$5
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$5
                        (i32.sub
                         (global.get $global$5)
                         (i32.const 1)
                        )
                       )
                       (call $fimport$2
                        (i32.const -32768)
                        (call $fimport$1
                         (loop (result i32)
                          (if
                           (i32.eqz
                            (global.get $global$5)
                           )
                           (then
                            (global.set $global$5
                             (i32.const 100)
                            )
                            (unreachable)
                           )
                          )
                          (global.set $global$5
                           (i32.sub
                            (global.get $global$5)
                            (i32.const 1)
                           )
                          )
                          (local.tee $16
                           (call $fimport$11
                            (i32.rem_u
                             (i32.const 16777216)
                             (i32.const 40)
                            )
                           )
                          )
                         )
                        )
                       )
                       (br_if $label2
                        (i32.eqz
                         (i32.const -32)
                        )
                       )
                       (call $4)
                      )
                      (i64.atomic.rmw16.cmpxchg_u offset=4
                       (i64.and
                        (i64.const -48)
                        (i64.const 15)
                       )
                       (i64.const 4294958607)
                       (i64.const -5092062)
                      )
                     )
                     (else
                      (return_call_indirect $0 (type $13)
                       (ref.as_non_null
                        (ref.null none)
                       )
                       (i32.const 0)
                      )
                     )
                    )
                   )
                   (br $block1)
                  )
                  (local.set $9
                   (unreachable)
                  )
                 )
                )
               )
               (tuple.make 3
                (local.get $13)
                (local.get $21)
                (local.get $18)
               )
              )
             )
            )
           )
           (local.set $20
            (block (result f32)
             (local.set $scratch_23
              (tuple.extract 3 1
               (local.get $scratch)
              )
             )
             (local.set $15
              (tuple.extract 3 2
               (local.get $scratch)
              )
             )
             (local.get $scratch_23)
            )
           )
           (local.get $scratch_24)
          )
         )
         (local.get $20)
         (local.get $15)
        )
       )
      )
     )
    )
   )
  )
  (drop
   (block (result f32)
    (local.set $scratch_26
     (tuple.extract 3 1
      (local.get $scratch_25)
     )
    )
    (drop
     (tuple.extract 3 2
      (local.get $scratch_25)
     )
    )
    (local.get $scratch_26)
   )
  )
  (local.get $scratch_27)
 )
 (func $31 (type $17)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (drop
   (call $30
    (struct.new_default $21)
   )
  )
  (drop
   (call $30
    (struct.new_default $21)
   )
  )
 )
 (func $32 (type $45) (param $0 f32) (result (ref null $10))
  (local $1 f64)
  (local $2 f64)
  (local $3 f32)
  (local $4 f32)
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
  (local $22 i64)
  (local $23 i64)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 v128)
  (local $28 anyref)
  (local $29 (ref null $9))
  (local $30 funcref)
  (local $31 funcref)
  (local $32 (ref null $8))
  (local $33 (ref null $14))
  (local $34 (ref string))
  (local $35 (ref string))
  (local $36 (ref string))
  (local $37 (ref $15))
  (local $38 (ref $15))
  (local $39 (ref $15))
  (local $40 (ref $15))
  (local $41 (ref $15))
  (local $42 (ref null $0))
  (local $43 (ref null $0))
  (local $44 (ref null $0))
  (local $45 (ref $16))
  (local $46 nullref)
  (local $47 (ref $23))
  (local $48 (ref $23))
  (local $49 (ref $8))
  (local $50 (ref $12))
  (local $51 (ref $7))
  (local $52 (ref $7))
  (local $53 (ref $7))
  (local $54 (ref $0))
  (local $55 (ref $3))
  (local $56 (ref i31))
  (local $scratch i32)
  (local $scratch_58 (ref (exact $18)))
  (local $scratch_59 i32)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (local.set $50
   (struct.new_default $12)
  )
  (local.set $39
   (struct.new_default $15)
  )
  (local.set $35
   (string.const "\ed\a0\80\c2\a3")
  )
  (block $block2 (result (ref (exact $18)))
   (if
    (i32.atomic.rmw8.cmpxchg_u acqrel offset=22
     (i64.and
      (i64.const -124)
      (i64.const 15)
     )
     (try (result i32)
      (do
       (string.compare
        (string.const "\e2\82\ac\ed\a0\80\c2\a3")
        (ref.cast (ref string)
         (stringview_wtf16.slice
          (string.const "\f0\90\8d\88")
          (block (result i32)
           (local.set $20
            (block (result i32)
             (local.set $scratch
              (local.get $8)
             )
             (local.set $21
              (string.measure_wtf16
               (local.tee $35
                (ref.cast (ref string)
                 (string.const "")
                )
               )
              )
             )
             (local.get $scratch)
            )
           )
           (local.get $20)
          )
          (local.get $21)
         )
        )
       )
      )
      (catch $tag$0
       (local.set $37 (call $__popsink_0 (pop (ref $15))))
       (local.get $11)
      )
      (catch $tag$1
       (drop (pop (ref null $0)))
       (try (result i32)
        (do
         (string.compare
          (ref.cast (ref string)
           (local.get $35)
          )
          (string.const "357")
         )
        )
        (catch $tag$1
         (throw $tag$1 (pop (ref null $0)))
         (block
          (if
           (if (result i32)
            (i32.eqz
             (ref.eq
              (select (result (ref $14))
               (ref.as_non_null
                (local.get $33)
               )
               (ref.as_non_null
                (local.get $33)
               )
               (local.get $10)
              )
              (select (result (ref i31))
               (ref.i31
                (i32.const -131071)
               )
               (ref.i31
                (i32.const 1880752162)
               )
               (local.get $11)
              )
             )
            )
            (then
             (nop)
             (return
              (ref.null none)
             )
            )
            (else
             (if (result i32)
              (call $fimport$12
               (ref.null nofunc)
              )
              (then
               (call $fimport$6
                (f64.const 18446744073709551615)
               )
               (drop
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (i32.atomic.load acqrel offset=4
                (i64.and
                 (unreachable)
                 (i64.const 15)
                )
               )
              )
              (else
               (call $fimport$8
                (ref.as_non_null
                 (ref.null none)
                )
               )
               (string.compare
                (local.get $35)
                (local.get $35)
               )
              )
             )
            )
           )
           (then
            (block $block
             (atomic.fence acqrel)
             (try_table (catch_all $block)
              (try_table (catch_all $block)
               (i32.store16 offset=3
                (i64.and
                 (i64.const 2147483647)
                 (i64.const 15)
                )
                (i32.const -74)
               )
              )
             )
            )
           )
           (else
            (block $block1
             (call $fimport$9
              (try_table (result (ref $16)) (catch_all $block1)
               (select (result (ref $16))
                (local.tee $45
                 (ref.as_non_null
                  (ref.null nofunc)
                 )
                )
                (ref.as_non_null
                 (ref.null nofunc)
                )
                (i32.const -254130)
               )
              )
             )
             (nop)
            )
           )
          )
          (return
           (struct.new $10
            (i64.const -99)
            (f32.const 4294967296)
           )
          )
         )
         (unreachable)
        )
        (catch $tag$0
         (if (ref.is_null (pop (ref $15))) (then (nop)) (else (unreachable)))
         (local.tee $7
          (block (result i32)
           (local.set $scratch_59
            (i32.const 127)
           )
           (drop
            (block (result (ref (exact $18)))
             (local.set $scratch_58
              (struct.new_default $18)
             )
             (drop
              (f64.const -nan:0xfffffffffff9f)
             )
             (local.get $scratch_58)
            )
           )
           (local.get $scratch_59)
          )
         )
        )
        (catch_all
         (local.get $7)
        )
       )
      )
      (catch_all
       (call_ref $27
        (loop (result i32)
         (if
          (i32.eqz
           (global.get $global$5)
          )
          (then
           (global.set $global$5
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$5
          (i32.sub
           (global.get $global$5)
           (i32.const 1)
          )
         )
         (i32.const 574953333)
        )
        (ref.func $fimport$11)
       )
      )
     )
     (call $fimport$12
      (loop (result (ref (exact $20)))
       (if
        (i32.eqz
         (global.get $global$5)
        )
        (then
         (global.set $global$5
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$5
        (i32.sub
         (global.get $global$5)
         (i32.const 1)
        )
       )
       (ref.func $20)
      )
     )
    )
    (then
     (atomic.fence acqrel)
     (return
      (struct.new $10
       (i64.const -8047868)
       (local.get $4)
      )
     )
    )
    (else
     (try_table
      (call $fimport$8
       (local.tee $46
        (ref.null none)
       )
      )
     )
     (return
      (struct.new_default $10)
     )
    )
   )
   (call $fimport$2
    (local.set $48
     (local.set $47
      (local.set $50
       (local.set $39
        (local.set $51
         (local.set $49
          (local.set $39
           (local.set $54
            (local.set $53
             (local.set $52
              (local.set $41
               (local.set $40
                (local.set $36
                 (local.set $34
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
    (call $fimport$1
     (i32.const 67108865)
    )
   )
   (drop
    (loop $label (result i64)
     (if
      (i32.eqz
       (global.get $global$5)
      )
      (then
       (global.set $global$5
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$5
      (i32.sub
       (global.get $global$5)
       (i32.const 1)
      )
     )
     (block (result i64)
      (nop)
      (call $fimport$9
       (ref.func $fimport$3)
      )
      (drop
       (br_on_cast_fail $block2 (ref (exact $18)) (ref (exact $18))
        (struct.new $18
         (local.get $25)
         (f32.const -nan:0x7ffff2)
         (i32.const -57)
         (f32.const -nan:0x7f803f)
        )
       )
      )
      (select
       (local.tee $25
        (local.tee $25
         (local.get $25)
        )
       )
       (block (result i64)
        (drop
         (br_on_null $label
          (struct.new_default $1)
         )
        )
        (i64.atomic.load acqrel offset=3
         (i64.and
          (local.tee $25
           (i64.rem_s
            (struct.get $18 0
             (struct.new_default $18)
            )
            (i64.atomic.load8_u offset=3
             (i64.and
              (local.get $25)
              (i64.const 15)
             )
            )
           )
          )
          (i64.const 15)
         )
        )
       )
       (local.tee $11
        (ref.eq
         (struct.new $10
          (i64.const 32769)
          (f32.const 65445)
         )
         (try_table (result (ref (exact $7))) (catch_all $label)
          (try_table (result (ref (exact $7))) (catch_all $label)
           (try (result (ref (exact $7)))
            (do
             (array.new $7
              (local.get $39)
              (i32.and
               (i32.const 10)
               (i32.const 1023)
              )
             )
            )
            (catch_all
             (array.new $7
              (local.get $50)
              (i32.and
               (i32.const 86)
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
     )
    )
   )
   (drop
    (local.get $0)
   )
   (block
    (call_ref $17
     (ref.func $27)
    )
    (return
     (ref.null none)
    )
   )
   (unreachable)
  )
 )
 (func $33 (type $20) (param $0 (ref any)) (result f64)
  (local $1 (ref null $14))
  (local $2 (ref $12))
  (local $3 (ref struct))
  (local $4 (ref null $0))
  (local $5 (ref $15))
  (local $6 i32)
  (local $7 i64)
  (if
   (i32.eqz
    (global.get $global$5)
   )
   (then
    (global.set $global$5
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$5
   (i32.sub
    (global.get $global$5)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (f32.store offset=22 align=2
    (i64.and
     (try (result i64)
      (do
       (i64.const -128)
      )
      (catch $tag$1
       (drop (pop (ref null $0)))
       (i64.atomic.rmw8.cmpxchg_u offset=22
        (i64.and
         (i64.const -137438953471)
         (i64.const 15)
        )
        (i64.const -52)
        (local.get $7)
       )
      )
      (catch $tag$0
       (drop (ref.eq (pop (ref $15)) (ref.null none)))
       (i64.extend_i32_s
        (ref.eq
         (array.new_fixed $22 0)
         (struct.new_default $21)
        )
       )
      )
      (catch_all
       (local.get $7)
      )
     )
     (i64.const 15)
    )
    (f32.const -nan:0x7ff439)
   )
   (throw_ref
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$2)
     )
     (unreachable)
    )
   )
  )
  (unreachable)
 )
 (type $__sinkT_0 (func (param (ref $15)) (result (ref $15))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
