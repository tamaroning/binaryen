(module
 (rec
  (type $0 (sub (struct (field v128) (field (mut f64)) (field (mut i64)) (field v128) (field v128))))
  (type $1 (sub (func (result (ref null $3)))))
  (type $2 (sub (struct (field (mut (ref null $2))) (field (mut f32)) (field (mut (ref null $5))) (field (ref $6)) (field (ref null $4)) (field (mut i8)))))
  (type $3 (sub (struct)))
  (type $4 (sub (array i8)))
  (type $5 (sub final $4 (array i8)))
  (type $6 (sub final $0 (struct (field v128) (field (mut f64)) (field (mut i64)) (field v128) (field v128))))
  (type $7 (sub $4 (array i8)))
  (type $8 (sub $1 (func (result (ref null $3)))))
  (type $9 (sub (struct (field (ref null $3)) (field (mut i16)) (field (ref null $5)) (field (mut (ref $6))) (field (ref null $9)))))
 )
 (type $10 (func))
 (type $11 (struct))
 (type $12 (array i8))
 (type $13 (func (param i32)))
 (type $14 (func (result (ref null $5) exnref externref)))
 (type $15 (func (param (ref null $6))))
 (type $16 (func (param i64)))
 (type $17 (func (param f32)))
 (type $18 (func (param f64)))
 (type $19 (func (param v128)))
 (type $20 (func (param anyref)))
 (type $21 (func (param funcref)))
 (type $22 (func (param externref)))
 (type $23 (func (param i32 i32)))
 (type $24 (func (param i32) (result i32)))
 (type $25 (func (param funcref i32)))
 (type $26 (func (param funcref) (result i32)))
 (type $27 (func (param f64 i64 i64 (ref null $8) (ref $5)) (result i32 i32)))
 (type $28 (func (param i32) (result f32 stringref i32)))
 (type $29 (func (result (ref null $0))))
 (type $30 (func (result v128)))
 (type $31 (func (result i32 i32)))
 (type $32 (func (result f32 (ref string) i32)))
 (type $33 (func (result f32 stringref i32)))
 (import "__fuzz_import" "global$_20" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $13) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $13) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $16) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $17) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $18) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $19) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $20) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $21) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $22) (param externref)))
 (import "fuzzing-support" "call-export" (func $fimport$9 (type $23) (param i32 i32)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$10 (type $24) (param i32) (result i32)))
 (import "fuzzing-support" "call-ref" (func $fimport$11 (type $25) (param funcref i32)))
 (import "fuzzing-support" "call-ref-catch" (func $fimport$12 (type $26) (param funcref) (result i32)))
 (global $global$0 structref (struct.new_default $11))
 (global $global$1 v128 (v128.const i32x4 0xffe60001 0xfc00fffe 0x00000000 0x0084fdff))
 (global $global$2 (ref null $3) (struct.new_default $3))
 (global $global$3 i64 (i64.const 4294967176))
 (global $global$4 f64 (f64.const -2147483647))
 (global $global$5 f32 (f32.const -71))
 (global $global$6 (mut v128) (v128.const i32x4 0x4f800000 0xffff890e 0xd9800000 0x4f7fff9e))
 (global $global$7 (ref null $3) (struct.new_default $3))
 (global $global$8 f64 (f64.const -nan:0xfffffffffffa5))
 (global $global$9 (ref null $1) (ref.func $0))
 (global $global$10 f64 (f64.const -nan:0xfffffffcb402a))
 (global $global$11 eqref (ref.null none))
 (global $global$12 funcref (ref.func $0))
 (global $global$13 exnref (ref.null noexn))
 (global $global$14 i64 (global.get $global$3))
 (global $global$15 (ref $7) (array.new_default $7
  (i32.const 72)
 ))
 (global $global$16 (mut (ref $5)) (array.new_default $5
  (i32.const 89)
 ))
 (global $global$17 f32 (f32.const 4294967296))
 (global $global$18 (mut i32) (i32.const -81))
 (global $global$19 f64 (f64.const -75))
 (global $global$20 (ref $8) (ref.func $1))
 (global $global$21 f64 (f64.const -0.769))
 (global $global$22 anyref (array.new_fixed $12 0))
 (global $global$23 stringref (ref.null noextern))
 (global $global$24 i32 (i32.const 129))
 (global $global$25 (ref null $1) (ref.null nofunc))
 (global $global$26 v128 (v128.const i32x4 0x5301060d 0x017000ff 0x65a40101 0xff060001))
 (global $global$27 f64 (f64.const 9223372036854775808))
 (global $global$28 i32 (i32.const -37))
 (global $global$29 i64 (i64.const 0))
 (global $global$30 i64 (i64.const 133))
 (global $global$31 (ref $1) (ref.func $0))
 (global $global$32 i32 (global.get $global$24))
 (global $global$33 f64 (global.get $global$19))
 (global $global$34 (ref null $1) (ref.func $0))
 (global $global$35 (mut i64) (i64.const 2147483648))
 (global $global$36 (mut (ref null $0)) (ref.null none))
 (global $global$37 (mut exnref) (ref.null noexn))
 (global $global$38 (ref null $1) (ref.func $1))
 (global $global$39 f32 (f32.const 3.934000015258789))
 (global $global$40 (mut i32) (i32.const 100))
 (memory $0 16 16 shared)
 (data $0 (i32.const 0) "\97\03m3iub\\y\a5&Cy\a6\c3wW\fc]\10\f3_\e1")
 (data $1 "\f8\e2\e8\c5^\8f\ea&\ab`(EB$W")
 (data $2 "2\e0x\f6\df~\8e\a3\a3jT2\t8\ae")
 (data $3 (i32.const 23) "O$\92S\c0\13D\b1\b7\7f\14\03")
 (data $4 "5\fd))T\02\95?79\f5u\84E\95\ab\a5\0e\cb\f2")
 (data $5 (i32.const 35) "\acQ:\f4\db\d3\1b\cfc\ffH\9bf=#z\d6\df\11\cb\1b&U\d2A")
 (table $0 8 8 funcref)
 (table $1 1 exnref)
 (elem $0 (table $0) (i32.const 0) func $3 $9 $10 $11 $16 $16)
 (elem declare func $1)
 (tag $tag$0 (type $15) (param (ref null $6)))
 (tag $tag$1 (type $10))
 (export "global$_3" (global $global$6))
 (export "global$_8" (global $global$15))
 (export "global$_10" (global $global$17))
 (export "global$_12" (global $global$19))
 (export "global$_14" (global $global$21))
 (export "global$_16" (global $global$23))
 (export "global$_17" (global $global$24))
 (export "global$_19" (global $global$30))
 (export "global$_21" (global $global$31))
 (export "global$_26" (global $global$37))
 (export "ref_func_target_1_invoker" (func $2))
 (export "func_invoker" (func $4))
 (export "func_18" (func $5))
 (export "func_19" (func $6))
 (export "func_20_invoker" (func $8))
 (export "func_22" (func $9))
 (export "func_23" (func $10))
 (export "func_24" (func $11))
 (export "func_24_invoker" (func $12))
 (export "func_26_invoker" (func $14))
 (export "func_31" (func $18))
 (start $4)
 (func $0 (type $1) (result (ref null $3))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $8) (result (ref null $3))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $10)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $1)
  )
  (drop
   (call $1)
  )
 )
 (func $3 (type $27) (param $0 f64) (param $1 i64) (param $2 i64) (param $3 (ref null $8)) (param $4 (ref $5)) (result i32 i32)
  (local $5 (ref null $6))
  (local $6 (ref null $9))
  (local $7 f64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (i32.const -2073260)
   (i32.const 524288)
  )
 )
 (func $4 (type $10)
  (local $0 (ref string))
  (local $1 (ref i31))
  (local $2 (ref null $6))
  (local $3 (ref $2))
  (local $4 (ref $2))
  (local $5 (ref $9))
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $scratch (tuple i32 i32))
  (local $scratch_10 i32)
  (local $scratch_11 (tuple i32 i32))
  (local $scratch_12 i32)
  (local $scratch_13 (tuple i32 i32))
  (local $scratch_14 i32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_10
     (tuple.extract 2 0
      (local.tee $scratch
       (call $3
        (f64.const 65421)
        (i64.const -27)
        (i64.const 6)
        (ref.func $1)
        (array.new_default $5
         (i32.and
          (i32.const 57)
          (i32.const 1023)
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
  (drop
   (block (result i32)
    (local.set $scratch_12
     (tuple.extract 2 0
      (local.tee $scratch_11
       (call $3
        (f64.const 9223372036854775808)
        (i64.const -45)
        (i64.const -32769)
        (ref.null nofunc)
        (array.new_default $5
         (i32.and
          (i32.const 54)
          (i32.const 1023)
         )
        )
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_11)
     )
    )
    (local.get $scratch_12)
   )
  )
  (drop
   (block (result i32)
    (local.set $scratch_14
     (tuple.extract 2 0
      (local.tee $scratch_13
       (call $3
        (f64.const -498697666)
        (i64.const -2199023255551)
        (i64.const 4294967227)
        (ref.func $1)
        (array.new $5
         (stringview_wtf16.get_codeunit
          (local.tee $0
           (loop $label (result (ref string))
            (if
             (i32.eqz
              (global.get $global$40)
             )
             (then
              (global.set $global$40
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$40
             (i32.sub
              (global.get $global$40)
              (i32.const 1)
             )
            )
            (block
             (loop
              (if
               (i32.eqz
                (global.get $global$40)
               )
               (then
                (global.set $global$40
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$40
               (i32.sub
                (global.get $global$40)
                (i32.const 1)
               )
              )
              (nop)
             )
             (atomic.fence acqrel)
            )
            (br_if $label
             (i32.eqz
              (string.compare
               (string.const "\c2\a3\f0\90\8d\88")
               (ref.cast (ref string)
                (string.const "\f0\90\8d\88\f0\90\8d\88\e2\82\ac")
               )
              )
             )
            )
            (string.const "\ed\bd\88\ed\bd\88")
           )
          )
          (block (result i32)
           (local.set $8
            (ref.eq
             (array.new_fixed $12 0)
             (if (result (ref i31))
              (i31.get_u
               (local.tee $1
                (try (result (ref i31))
                 (do
                  (ref.i31
                   (i32.const -1422306008)
                  )
                 )
                 (catch $tag$0
                  (local.set $2 (ref.cast (ref $6) (pop (ref null $6))))
                  (if
                   (i32.eqz
                    (stringview_wtf16.get_codeunit
                     (local.get $0)
                     (block (result i32)
                      (local.set $8
                       (ref.eq
                        (ref.as_non_null
                         (ref.null none)
                        )
                        (local.tee $3
                         (local.tee $4
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                       )
                      )
                      (local.get $8)
                     )
                    )
                   )
                   (then
                    (block
                     (loop
                      (if
                       (i32.eqz
                        (global.get $global$40)
                       )
                       (then
                        (global.set $global$40
                         (i32.const 100)
                        )
                        (unreachable)
                       )
                      )
                      (global.set $global$40
                       (i32.sub
                        (global.get $global$40)
                        (i32.const 1)
                       )
                      )
                      (block
                       (call $fimport$9
                        (struct.get_u $9 1
                         (local.tee $5
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                        (i32.const 524288)
                       )
                       (atomic.fence acqrel)
                      )
                     )
                     (nop)
                    )
                    (return)
                   )
                   (else
                    (block
                     (table.set $1
                      (i32.const 0)
                      (block $block (result (ref exn))
                       (try_table (catch_all_ref $block)
                        (throw $tag$0
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                       )
                       (unreachable)
                      )
                     )
                     (if
                      (local.tee $6
                       (local.tee $7
                        (memory.atomic.notify offset=1
                         (i32.and
                          (i32.const 2147483647)
                          (i32.const 15)
                         )
                         (i32.const -33)
                        )
                       )
                      )
                      (then
                       (if
                        (i32.eqz
                         (i32.const -1)
                        )
                        (then
                         (nop)
                        )
                        (else
                         (nop)
                        )
                       )
                      )
                     )
                    )
                    (return)
                   )
                  )
                  (unreachable)
                 )
                )
               )
              )
              (then
               (ref.i31
                (i32.const -127)
               )
              )
              (else
               (nop)
               (ref.i31
                (i32.const -26)
               )
              )
             )
            )
           )
           (local.get $8)
          )
         )
         (i32.and
          (i32.const 52)
          (i32.const 1023)
         )
        )
       )
      )
     )
    )
    (drop
     (tuple.extract 2 1
      (local.get $scratch_13)
     )
    )
    (local.get $scratch_14)
   )
  )
 )
 (func $5 (type $28) (param $0 i32) (result f32 stringref i32)
  (local $1 (ref string))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (type $32) (result f32 (ref string) i32)
   (nop)
   (tuple.make 3
    (f32.const -2727)
    (string.const "\c2\a3")
    (i32.const -2529961)
   )
  )
 )
 (@binaryen.js.called)
 (func $6 (type $8) (result (ref null $3))
  (local $0 funcref)
  (local $1 (ref null $3))
  (local $2 stringref)
  (local $3 i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block
   (return
    (struct.new_default $3)
   )
  )
  (unreachable)
 )
 (func $7 (type $29) (result (ref null $0))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$40)
    )
    (then
     (global.set $global$40
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$40
    (i32.sub
     (global.get $global$40)
     (i32.const 1)
    )
   )
   (block
    (call $fimport$8
     (block $block (result (ref extern))
      (nop)
      (br_on_non_null $block
       (global.get $gimport$1)
      )
      (global.get $gimport$1)
     )
    )
    (br $label)
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $8 (type $10)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $7)
  )
 )
 (func $9 (type $8) (result (ref null $3))
  (local $0 i64)
  (local $1 i64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f64)
  (local $5 v128)
  (local $6 i32)
  (local $7 (ref struct))
  (local $8 (ref $8))
  (local $9 anyref)
  (local $10 (ref null $2))
  (local $11 (ref eq))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (struct.new_default $3)
 )
 (@binaryen.js.called)
 (func $10 (type $8) (result (ref null $3))
  (local $0 (ref $5))
  (local $1 stringref)
  (local $2 anyref)
  (local $3 (ref null $7))
  (local $4 (ref null $3))
  (local $5 (ref null $8))
  (local $6 (ref struct))
  (local $7 (ref null $0))
  (local $8 funcref)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f64)
  (local $16 f32)
  (local $17 i32)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.set $0
   (array.new $5
    (i32.const -29)
    (i32.and
     (i32.const 20)
     (i32.const 1023)
    )
   )
  )
  (block $block (result (ref (exact $3)))
   (local.set $6
    (block (result (ref none))
     (local.set $11
      (block (result i64)
       (local.set $scratch
        (i64.const 4293160006)
       )
       (local.set $12
        (i64.const -3162839548417078002)
       )
       (local.get $scratch)
      )
     )
     (ref.cast (ref none)
      (block (result nullref)
       (block
        (call $fimport$2
         (i64.const -128)
        )
        (call $fimport$6
         (ref.i31
          (i32.const -16)
         )
        )
       )
       (loop $label1 (result nullref)
        (if
         (i32.eqz
          (global.get $global$40)
         )
         (then
          (global.set $global$40
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$40
         (i32.sub
          (global.get $global$40)
          (i32.const 1)
         )
        )
        (block
         (loop $label
          (if
           (i32.eqz
            (global.get $global$40)
           )
           (then
            (global.set $global$40
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$40
           (i32.sub
            (global.get $global$40)
            (i32.const 1)
           )
          )
          (block
           (atomic.fence acqrel)
           (br $label)
          )
          (unreachable)
         )
         (unreachable)
        )
        (br_if $label1
         (i32.eqz
          (ref.eq
           (struct.new_default $3)
           (struct.new_default $11)
          )
         )
        )
        (ref.null none)
       )
      )
     )
    )
   )
   (if
    (i32.load8_u offset=22
     (i32.and
      (global.get $global$32)
      (i32.const 15)
     )
    )
    (then
     (call $fimport$4
      (local.tee $14
       (f64.copysign
        (global.get $global$21)
        (block (result f64)
         (br_on_non_null $block
          (try (result (ref (exact $3)))
           (do
            (struct.new_default $3)
           )
           (catch_all
            (struct.new_default $3)
           )
          )
         )
         (local.tee $13
          (local.get $13)
         )
        )
       )
      )
     )
    )
   )
   (return
    (ref.null none)
   )
  )
 )
 (func $11 (type $30) (result v128)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f32)
  (local $9 v128)
  (local $10 v128)
  (local $11 (ref null $8))
  (local $12 (ref $6))
  (local $13 (ref $6))
  (local $14 (ref $1))
  (local $15 funcref)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.get $10)
 )
 (func $12 (type $10)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (call $11)
  )
 )
 (func $13 (type $14) (result (ref null $5) exnref externref)
  (local $0 (ref $6))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (tuple.make 3
   (array.new_default $5
    (i32.and
     (i32.const 60)
     (i32.const 1023)
    )
   )
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$1)
    )
    (unreachable)
   )
   (global.get $gimport$1)
  )
 )
 (func $14 (type $10)
  (local $scratch (tuple (ref null $5) exnref externref))
  (local $scratch_1 exnref)
  (local $scratch_2 (ref null $5))
  (local $scratch_3 (tuple (ref null $5) exnref externref))
  (local $scratch_4 exnref)
  (local $scratch_5 (ref null $5))
  (local $scratch_6 (tuple (ref null $5) exnref externref))
  (local $scratch_7 exnref)
  (local $scratch_8 (ref null $5))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref null $5))
    (local.set $scratch_2
     (tuple.extract 3 0
      (local.tee $scratch
       (call $13)
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
   (block (result (ref null $5))
    (local.set $scratch_5
     (tuple.extract 3 0
      (local.tee $scratch_3
       (call $13)
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
  (drop
   (block (result (ref null $5))
    (local.set $scratch_8
     (tuple.extract 3 0
      (local.tee $scratch_6
       (call $13)
      )
     )
    )
    (drop
     (block (result exnref)
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
 (func $15 (type $1) (result (ref null $3))
  (local $0 (ref $2))
  (local $1 exnref)
  (local $2 eqref)
  (local $3 (ref string))
  (local $4 (ref null $0))
  (local $5 f32)
  (local $6 f32)
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block
   (nop)
   (return
    (struct.new_default $3)
   )
  )
  (unreachable)
 )
 (func $16 (type $8) (result (ref null $3))
  (local $0 (ref $0))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block
   (atomic.fence acqrel)
   (return
    (struct.new_default $3)
   )
  )
  (unreachable)
 )
 (func $17 (type $1) (result (ref null $3))
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i31ref)
  (local $5 (ref $9))
  (local $6 arrayref)
  (local $7 (ref string))
  (local $8 (ref $3))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (local.tee $8
   (block (result (ref (exact $3)))
    (struct.new_default $3)
   )
  )
 )
 (func $18 (type $1) (result (ref null $3))
  (local $0 i32)
  (local $1 (ref null $6))
  (local $2 (ref $2))
  (local $3 (ref $2))
  (local $4 (ref $2))
  (local $5 (ref null $3))
  (if
   (i32.eqz
    (global.get $global$40)
   )
   (then
    (global.set $global$40
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$40
   (i32.sub
    (global.get $global$40)
    (i32.const 1)
   )
  )
  (block (result (ref null $3))
   (call $fimport$8
    (try (result externref)
     (do
      (global.get $gimport$0)
     )
     (catch $tag$0
      (drop (struct.get $6 0 (pop (ref null $6))))
      (try (result (ref string))
       (do
        (string.const "")
       )
       (catch_all
        (string.const "986")
       )
      )
     )
    )
   )
   (local.get $5)
  )
 )
)
