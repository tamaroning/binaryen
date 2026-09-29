(module
 (type $0 (array (mut i16)))
 (rec
  (type $1 (sub (array (ref null $1))))
  (type $2 (func (param i64 i64) (result f64)))
  (type $3 (sub (func (result (ref null $4)))))
  (type $4 (func (param i32 (ref $4))))
 )
 (rec
  (type $5 (sub (struct (field (mut (ref null $1))) (field (ref null $3)) (field (mut f64)) (field (mut f64)) (field (mut f32)))))
  (type $6 (sub (func (result (ref null $6)))))
  (type $7 (array f32))
 )
 (rec
  (type $8 (struct (field f32) (field (mut f32)) (field (ref null $9))))
  (type $9 (struct (field (ref null $14)) (field (mut (ref null $6))) (field externref)))
  (type $10 (sub (func (result v128))))
  (type $11 (struct (field (mut f32)) (field i16) (field (mut f64)) (field i8) (field (mut i8)) (field (ref $9))))
  (type $12 (sub (func (param f64 externref (ref null $22) eqref externref))))
  (type $13 (sub (func (param (ref $4)) (result f64 (ref $10) (ref $21) i64 v128 f32))))
  (type $14 (sub final $13 (func (param (ref $4)) (result f64 (ref $10) (ref $21) i64 v128 f32))))
  (type $15 (sub (func (result (ref i31)))))
  (type $16 (sub $3 (func (result (ref $4)))))
  (type $17 (sub final $13 (func (param (ref null $4)) (result f64 (ref $10) (ref $21) i64 v128 f32))))
  (type $18 (sub (func (param (ref null $13) (ref $3) (ref null $18)) (result (ref array)))))
  (type $19 (array (mut i8)))
  (type $20 (sub $12 (func (param f64 externref (ref null $13) anyref externref))))
  (type $21 (struct (field f64) (field i16) (field nullfuncref) (field v128) (field (mut v128)) (field (ref null $10))))
  (type $22 (sub final $13 (func (param (ref null $4)) (result f64 (ref $10) (ref $21) i64 v128 f32))))
  (type $23 (sub final $5 (struct (field (mut (ref null $1))) (field (ref null $16)) (field (mut f64)) (field (mut f64)) (field (mut f32)))))
 )
 (type $24 (array i8))
 (type $25 (func))
 (type $26 (struct))
 (type $27 (func (param i32)))
 (type $28 (func (result f64 (ref $10) (ref $21) i64 v128 f32)))
 (type $29 (func (param externref)))
 (type $30 (func (param i64)))
 (type $31 (func (param (ref $16))))
 (type $32 (func (param f32)))
 (type $33 (func (param f64)))
 (type $34 (func (param v128)))
 (type $35 (func (param anyref)))
 (type $36 (func (param funcref)))
 (type $37 (func (param (ref $1) (ref null $9) (ref null $10)) (result f32)))
 (type $38 (func (param (ref null $21) exnref i32) (result (ref null $7))))
 (type $39 (func (result (ref struct))))
 (type $40 (func (result (ref null $8))))
 (type $41 (func (param v128) (result stringref)))
 (type $42 (func (param f64 stringref) (result (ref null $7))))
 (type $43 (func (param f32) (result f32)))
 (type $44 (func (param f64) (result f64)))
 (type $45 (func (param v128) (result v128)))
 (import "__fuzz_import" "extern$" (global $gimport$0 (ref extern)))
 (import "__fuzz_import" "extern$_6" (global $gimport$1 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $27) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $27) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $30) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $32) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $33) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $34) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $35) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $36) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $29) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $27) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $29) (param externref)))
 (global $global$0 (ref $6) (ref.func $0))
 (global $global$1 i31ref (ref.i31
  (i32.const -82)
 ))
 (global $global$2 (mut stringref) (string.const "\ed\bd\88\f0\90\8d\88\e2\82\ac"))
 (global $global$3 (mut i64) (i64.const 2147483647))
 (global $global$4 (mut f32) (f32.const 0))
 (global $global$5 (mut i64) (i64.const -68))
 (global $global$6 v128 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000))
 (global $global$7 (mut i32) (i32.const 100))
 (memory $0 16 17 shared)
 (data $0 "p*\98\b2\f9E\1d\9b0\1d/\e7\9b\de")
 (data $1 "(#-\bc\7fv;\dfaa=\e9\b7\1a\ea\e4\d0\ba")
 (data $2 "")
 (data $3 (i32.const 0) "\99\b3\a3\a4\ae\edS\0eq\\\a8\81\cb\e0\cb\dcn\00\dd)\e0\fb\a4\d7\7f[\1a\e7\94")
 (data $4 "V")
 (data $5 "O\16a\1d\98~\f6\11b\19^\91\c8:)\e2o\04l\05\d5\1c\80K\17?6\13")
 (table $0 i64 11 funcref (ref.null nofunc))
 (table $1 3 3 exnref)
 (elem $0 (table $0) (i64.const 0) func $1 $1 $4 $4 $4 $7 $7 $7 $8 $12 $21)
 (elem declare func $0 $14 $16 $17 $19 $2 $3 $5 $6 $9 $fimport$2 $fimport$7)
 (tag $tag$0 (type $27) (param i32))
 (tag $tag$1 (type $31) (param (ref $16)))
 (tag $tag$2 (type $25))
 (export "global$" (global $global$0))
 (export "global$_4" (global $global$6))
 (export "tag$" (tag $tag$0))
 (export "tag$_1" (tag $tag$1))
 (export "jstag" (tag $eimport$1))
 (export "func_invoker" (func $3))
 (export "func_13" (func $4))
 (export "func_13_invoker" (func $5))
 (export "func_15" (func $7))
 (export "func_17_invoker" (func $10))
 (export "func_20" (func $11))
 (export "func_21_invoker" (func $13))
 (export "func_23_invoker" (func $20))
 (export "func_31" (func $22))
 (func $0 (type $6) (result (ref null $6))
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $37) (param $0 (ref $1)) (param $1 (ref null $9)) (param $2 (ref null $10)) (result f32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 f32)
  (local $14 f32)
  (local $15 f32)
  (local $16 v128)
  (local $17 f64)
  (local $18 eqref)
  (local $19 stringref)
  (local $20 stringref)
  (local $21 (ref struct))
  (local $22 (ref null $11))
  (local $23 anyref)
  (local $24 anyref)
  (local $25 (ref null $10))
  (local $26 i31ref)
  (local $27 funcref)
  (local $28 (ref $6))
  (local $29 (ref null $2))
  (local $30 (ref string))
  (local $31 exnref)
  (local $32 (ref $7))
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (block (result f32)
   (call $fimport$5
    (local.tee $16
     (try (result v128)
      (do
       (local.tee $16
        (call $27
         (f32x4.splat
          (if (result f32)
           (i32.lt_u
            (local.tee $12
             (i32.load offset=1
              (i32.and
               (local.tee $10
                (i32x4.extract_lane 2
                 (local.get $16)
                )
               )
               (i32.const 15)
              )
             )
            )
            (array.len
             (local.tee $32
              (array.new_default $7
               (i32.and
                (i32.const 80)
                (i32.const 1023)
               )
              )
             )
            )
           )
           (then
            (call $25
             (array.get $7
              (local.get $32)
              (local.get $12)
             )
            )
           )
           (else
            (f32.const 0)
           )
          )
         )
        )
       )
      )
      (catch_all
       (local.tee $16
        (local.tee $16
         (call $27
          (i8x16.shuffle 31 31 11 27 9 3 17 18 31 2 26 17 28 31 27 27
           (local.tee $16
            (local.get $16)
           )
           (call $27
            (i32x4.max_s
             (call $27
              (i64x2.splat
               (block (result i64)
                (call $fimport$6
                 (ref.i31
                  (i32.const 4096)
                 )
                )
                (i64.load8_s offset=22
                 (i32.and
                  (local.tee $10
                   (local.get $10)
                  )
                  (i32.const 15)
                 )
                )
               )
              )
             )
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
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
   (f32.const 0)
  )
 )
 (func $2 (type $10) (result v128)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $3 (type $25)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (call $25
    (call $1
     (array.new $1
      (array.new_default $1
       (i32.and
        (i32.const 65)
        (i32.const 1023)
       )
      )
      (i32.and
       (i32.const 93)
       (i32.const 1023)
      )
     )
     (struct.new $9
      (ref.null nofunc)
      (block (result (ref (exact $6)))
       (call $fimport$3
        (f32.const 3.7950000762939453)
       )
       (ref.func $0)
      )
      (string.const "")
     )
     (ref.func $2)
    )
   )
  )
 )
 (func $4 (type $38) (param $0 (ref null $21)) (param $1 exnref) (param $2 i32) (result (ref null $7))
  (local $3 eqref)
  (local $4 anyref)
  (local $5 v128)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (call $fimport$7
   (ref.func $3)
  )
  (drop
   (struct.new $23
    (array.new $1
     (array.new $1
      (array.new_default $1
       (i32.and
        (i32.const 96)
        (i32.const 1023)
       )
      )
      (i32.and
       (i32.const 23)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 33)
      (i32.const 1023)
     )
    )
    (ref.null nofunc)
    (f64.const 0)
    (f64.const 0.397)
    (f32.const -0.9229999780654907)
   )
  )
  (return
   (array.new_default $7
    (i32.and
     (i32.const 32)
     (i32.const 1023)
    )
   )
  )
 )
 (func $5 (type $25)
  (local $0 v128)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 (ref $19))
  (local $5 (ref $23))
  (local $6 nullfuncref)
  (local $scratch v128)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (call $4
    (struct.new_default $21)
    (ref.null noexn)
    (i32.const -524288)
   )
  )
  (drop
   (call $26
    (struct.get $23 2
     (if (result (ref $23))
      (i32.const 2097153)
      (then
       (block $block (result (ref (exact $23)))
        (call $fimport$7
         (ref.func $5)
        )
        (br_on_non_null $block
         (struct.new_default $23)
        )
        (struct.new $23
         (array.new $1
          (array.new $1
           (array.new $1
            (ref.as_non_null
             (ref.null none)
            )
            (i32.and
             (i32.const 68)
             (i32.const 1023)
            )
           )
           (i32.and
            (i32.const 17)
            (i32.const 1023)
           )
          )
          (i32.and
           (i32.const 90)
           (i32.const 1023)
          )
         )
         (ref.as_non_null
          (ref.null nofunc)
         )
         (try (result f64)
          (do
           (if (result f64)
            (i32.const -128)
            (then
             (call $fimport$4
              (f64.const 3426)
             )
             (return)
            )
            (else
             (call $fimport$4
              (call $26
               (f64.load
                (i32.and
                 (i16x8.extract_lane_u 2
                  (local.get $0)
                 )
                 (i32.const 15)
                )
               )
              )
             )
             (f64.const -2251799813685248)
            )
           )
          )
          (catch_all
           (loop $label
            (if
             (i32.eqz
              (global.get $global$7)
             )
             (then
              (global.set $global$7
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$7
             (i32.sub
              (global.get $global$7)
              (i32.const 1)
             )
            )
            (br $label)
           )
           (unreachable)
          )
         )
         (if (result f64)
          (i32.eqz
           (stringview_wtf16.get_codeunit
            (string.const "943\e2\82\ac")
            (block (result i32)
             (local.set $3
              (i32.const 8)
             )
             (local.get $3)
            )
           )
          )
          (then
           (f64.const 49748)
          )
          (else
           (block $block1 (result f64)
            (call $fimport$8
             (string.const "\c2\a3")
            )
            (drop
             (br_on_cast_fail $block (ref none) (ref none)
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (br_if $block1
             (f64.const 0)
             (if (result i32)
              (i32.lt_u
               (local.tee $2
                (i16x8.all_true
                 (call $27
                  (v128.load offset=4
                   (i32.and
                    (i32.const -126)
                    (i32.const 15)
                   )
                  )
                 )
                )
               )
               (array.len
                (local.tee $4
                 (ref.cast (ref none)
                  (select (result (ref none))
                   (if (result (ref none))
                    (local.get $1)
                    (then
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                    (else
                     (select (result (ref none))
                      (ref.as_non_null
                       (ref.null none)
                      )
                      (ref.as_non_null
                       (ref.null none)
                      )
                      (if (result i32)
                       (local.get $1)
                       (then
                        (i32.const 107378215)
                       )
                       (else
                        (i32.const 31)
                       )
                      )
                     )
                    )
                   )
                   (ref.as_non_null
                    (ref.null none)
                   )
                   (loop $label1 (result i32)
                    (if
                     (i32.eqz
                      (global.get $global$7)
                     )
                     (then
                      (global.set $global$7
                       (i32.const 100)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$7
                     (i32.sub
                      (global.get $global$7)
                      (i32.const 1)
                     )
                    )
                    (nop)
                    (br_if $label1
                     (local.tee $1
                      (i32.const -16325)
                     )
                    )
                    (local.get $1)
                   )
                  )
                 )
                )
               )
              )
              (then
               (array.get_u $19
                (local.get $4)
                (local.get $2)
               )
              )
              (else
               (i32.const 16777216)
              )
             )
            )
           )
          )
         )
         (call $25
          (f32.mul
           (call $25
            (f32x4.extract_lane 3
             (local.tee $0
              (local.get $0)
             )
            )
           )
           (f32.const 36028797018963968)
          )
         )
        )
       )
      )
      (else
       (local.tee $5
        (struct.new_default $23)
       )
      )
     )
    )
   )
  )
  (drop
   (i31.get_s
    (try_table (result (ref i31))
     (ref.i31
      (i32.const -131072)
     )
    )
   )
  )
  (drop
   (struct.get $21 2
    (struct.new_default $21)
   )
  )
  (drop
   (call $27
    (f32x4.splat
     (f32.const -51)
    )
   )
  )
  (drop
   (call $27
    (block (result v128)
     (local.set $scratch
      (v128.const i32x4 0x0000ffb8 0x4000ffc6 0xca33ff81 0x00000000)
     )
     (drop
      (i32.const 36)
     )
     (local.get $scratch)
    )
   )
  )
  (block
   (nop)
   (return)
  )
  (unreachable)
 )
 (func $6 (type $14) (param $0 (ref $4)) (result f64 (ref $10) (ref $21) i64 v128 f32)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $7 (type $20) (param $0 f64) (param $1 externref) (param $2 (ref null $13)) (param $3 anyref) (param $4 externref)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 f32)
  (local $9 f32)
  (local $scratch i64)
  (local $scratch_11 f32)
  (local $scratch_12 (ref string))
  (local $scratch_13 (ref (exact $9)))
  (local.set $0
   (call $26
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (block (result (ref (exact $9)))
    (local.set $scratch_13
     (struct.new $9
      (ref.func $6)
      (ref.func $0)
      (string.const "\e2\82\ac\c2\a3\f0\90\8d\88")
     )
    )
    (drop
     (block (result (ref string))
      (local.set $scratch_12
       (string.const "\f0\90\8d\88\ed\bd\88")
      )
      (local.set $9
       (block (result f32)
        (local.set $scratch_11
         (f32.const 49177)
        )
        (drop
         (block (result i64)
          (local.set $scratch
           (i64.const 8796093022209)
          )
          (drop
           (struct.new_default $21)
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
    (local.get $scratch_13)
   )
  )
  (call $fimport$3
   (call $25
    (local.get $9)
   )
  )
 )
 (@binaryen.js.called)
 (func $8 (type $13) (param $0 (ref $4)) (result f64 (ref $10) (ref $21) i64 v128 f32)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (tuple.make 6
   (f64.const 0)
   (ref.func $2)
   (struct.new_default $21)
   (i64.const -162984356817)
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (f32.const 17179869184)
  )
 )
 (func $9 (type $4) (param $0 i32) (param $1 (ref $4))
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $10 (type $25)
  (local $scratch (tuple f64 (ref $10) (ref $21) i64 v128 f32))
  (local $scratch_1 v128)
  (local $scratch_2 i64)
  (local $scratch_3 (ref $21))
  (local $scratch_4 (ref $10))
  (local $scratch_5 f64)
  (local $scratch_6 (tuple f64 (ref $10) (ref $21) i64 v128 f32))
  (local $scratch_7 v128)
  (local $scratch_8 i64)
  (local $scratch_9 (ref $21))
  (local $scratch_10 (ref $10))
  (local $scratch_11 f64)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (block (result f64)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $8
        (ref.func $9)
       )
      )
     )
    )
    (drop
     (block (result (ref $10))
      (local.set $scratch_4
       (tuple.extract 6 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result (ref $21))
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
           (block (result v128)
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
   (block (result f64)
    (local.set $scratch_11
     (tuple.extract 6 0
      (local.tee $scratch_6
       (call $8
        (ref.func $9)
       )
      )
     )
    )
    (drop
     (block (result (ref $10))
      (local.set $scratch_10
       (tuple.extract 6 1
        (local.get $scratch_6)
       )
      )
      (drop
       (block (result (ref $21))
        (local.set $scratch_9
         (tuple.extract 6 2
          (local.get $scratch_6)
         )
        )
        (drop
         (block (result i64)
          (local.set $scratch_8
           (tuple.extract 6 3
            (local.get $scratch_6)
           )
          )
          (drop
           (block (result v128)
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
 (@binaryen.js.called)
 (func $11 (type $39) (result (ref struct))
  (local $0 (ref eq))
  (local $1 externref)
  (local $2 f64)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (struct.new_default $26)
  )
 )
 (func $12 (type $40) (result (ref null $8))
  (local $0 arrayref)
  (local $1 (ref struct))
  (local $2 (ref struct))
  (local $3 (ref $11))
  (local $4 (ref $16))
  (local $5 (ref extern))
  (local $6 (ref none))
  (local $7 (ref $3))
  (local $8 (ref $3))
  (local $9 (ref null $8))
  (local $10 (ref $19))
  (local $11 (ref $19))
  (local $12 (ref i31))
  (local $13 (ref i31))
  (local $14 f64)
  (local $15 f32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i64)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $8)))
   (call $fimport$7
    (ref.func $fimport$7)
   )
   (block (result (ref (exact $8)))
    (f64.store offset=22 align=4
     (i32.and
      (i32.const -1048575)
      (i32.const 15)
     )
     (select
      (f64.const 9223372036854775808)
      (try (result f64)
       (do
        (f64.const -8193)
       )
       (catch_all
        (call $26
         (f64.ceil
          (local.get $14)
         )
        )
       )
      )
      (i32.const 129)
     )
    )
    (struct.new $8
     (f32.const 549755813888)
     (f32.const 4.955996943376113e-25)
     (struct.new_default $9)
    )
   )
  )
 )
 (func $13 (type $25)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (call $12)
  )
  (drop
   (call $12)
  )
  (drop
   (call $12)
  )
 )
 (func $14 (type $18) (param $0 (ref null $13)) (param $1 (ref $3)) (param $2 (ref null $18)) (result (ref array))
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $15 (type $22) (param $0 (ref null $4)) (result f64 (ref $10) (ref $21) i64 v128 f32)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $16 (type $16) (result (ref $4))
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $17 (type $17) (param $0 (ref null $4)) (result f64 (ref $10) (ref $21) i64 v128 f32)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $18 (type $2) (param $0 i64) (param $1 i64) (result f64)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $19 (type $41) (param $0 v128) (result stringref)
  (local $1 f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
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
  (local $49 f32)
  (local $50 (ref $18))
  (local $51 i31ref)
  (local $52 nullref)
  (local $53 (ref string))
  (local $54 (ref string))
  (local $55 (ref string))
  (local $56 (ref string))
  (local $57 (ref string))
  (local $58 (ref string))
  (local $59 (ref string))
  (local $60 (ref null $5))
  (local $61 (ref $16))
  (local $62 (ref $16))
  (local $63 (ref $16))
  (local $64 (ref $16))
  (local $65 (ref $16))
  (local $66 (ref $16))
  (local $67 (ref $16))
  (local $68 (ref $16))
  (local $69 (ref $19))
  (local $70 (ref $19))
  (local $71 (ref $19))
  (local $72 (ref $19))
  (local $73 (ref $19))
  (local $74 (ref $19))
  (local $75 (ref $19))
  (local $76 (ref $19))
  (local $77 (ref $19))
  (local $78 (ref $19))
  (local $79 (ref $19))
  (local $80 (ref $19))
  (local $81 (ref $19))
  (local $82 structref)
  (local $83 (ref null $19))
  (local $84 (ref none))
  (local $85 (ref none))
  (local $86 funcref)
  (local $87 (ref $17))
  (local $88 (ref any))
  (local $89 anyref)
  (local $90 (ref null $0))
  (local $91 (ref $0))
  (local $92 (ref $0))
  (local $93 (ref $0))
  (local $94 (ref $0))
  (local $95 (ref $0))
  (local $96 externref)
  (local $97 (ref null $1))
  (local $98 (ref null $21))
  (local $99 (ref $7))
  (local $100 (ref $7))
  (local $101 stringref)
  (local $102 (ref $8))
  (local $103 (ref $11))
  (local $scratch f64)
  (local.set $0
   (call $27
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (local.set $90
   (ref.as_non_null
    (local.get $90)
   )
  )
  (local.set $87
   (ref.func $17)
  )
  (local.set $53
   (string.const "")
  )
  (block $block4 (result stringref)
   (drop
    (i32.and
     (i32.const -30185)
     (i32.const 15)
    )
   )
   (if
    (block $block (result i32)
     (block $block1
      (if
       (i32.lt_u
        (local.tee $22
         (string.eq
          (if (result (ref string))
           (i32.eqz
            (if (result i32)
             (if (result i32)
              (i32.eqz
               (i32.const 536870912)
              )
              (then
               (nop)
               (string.encode_wtf16_array
                (string.const "")
                (array.new_default $0
                 (i32.and
                  (i32.const 92)
                  (i32.const 1023)
                 )
                )
                (string.measure_wtf16
                 (string.const "")
                )
               )
              )
              (else
               (memory.init $4
                (i32.and
                 (i32.const -6568)
                 (i32.const 15)
                )
                (i32.const 0)
                (i32.const 0)
               )
               (nop)
               (nop)
               (return
                (string.const "")
               )
              )
             )
             (then
              (i32.const -128)
             )
             (else
              (try_table (result i32) (catch $tag$0 $block) (catch $tag$0 $block)
               (loop (result i32)
                (if
                 (i32.eqz
                  (global.get $global$7)
                 )
                 (then
                  (global.set $global$7
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$7
                 (i32.sub
                  (global.get $global$7)
                  (i32.const 1)
                 )
                )
                (block (result i32)
                 (drop
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                 (call $fimport$8
                  (unreachable)
                 )
                 (i32.const -8192)
                )
               )
              )
             )
            )
           )
           (then
            (drop
             (i32.load8_u offset=22
              (i32.and
               (loop $label (result i32)
                (if
                 (i32.eqz
                  (global.get $global$7)
                 )
                 (then
                  (global.set $global$7
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$7
                 (i32.sub
                  (global.get $global$7)
                  (i32.const 1)
                 )
                )
                (try_table (catch_all $label)
                 (nop)
                )
                (br_if $label
                 (i32.eqz
                  (ref.test (ref none)
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
                (ref.test (ref none)
                 (ref.as_non_null
                  (local.tee $51
                   (ref.i31
                    (i32.const 2147483647)
                   )
                  )
                 )
                )
               )
               (i32.const 15)
              )
             )
            )
            (if (result (ref string))
             (i32.eqz
              (if (result i32)
               (i32.eqz
                (br_if $block
                 (i32.const 65427)
                 (i32.eqz
                  (if (result i32)
                   (i32.eqz
                    (i32.const -65535)
                   )
                   (then
                    (i32.const -2147483648)
                   )
                   (else
                    (i32.const -1024)
                   )
                  )
                 )
                )
               )
               (then
                (i64.store8 offset=3
                 (i32.and
                  (i32.const 74)
                  (i32.const 15)
                 )
                 (i64.const -5779)
                )
                (br $block1)
               )
               (else
                (br_if $block
                 (local.get $6)
                 (ref.eq
                  (struct.new_default $26)
                  (local.tee $52
                   (select (result nullref)
                    (ref.as_non_null
                     (ref.null none)
                    )
                    (ref.null none)
                    (loop $label1 (result i32)
                     (if
                      (i32.eqz
                       (global.get $global$7)
                      )
                      (then
                       (global.set $global$7
                        (i32.const 100)
                       )
                       (unreachable)
                      )
                     )
                     (global.set $global$7
                      (i32.sub
                       (global.get $global$7)
                       (i32.const 1)
                      )
                     )
                     (nop)
                     (br_if $label1
                      (i32.const -255)
                     )
                     (select
                      (local.get $6)
                      (i32.const -24)
                      (local.tee $6
                       (i32.const -44)
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
             (then
              (drop
               (ref.null nofunc)
              )
              (local.tee $53
               (loop (result (ref string))
                (if
                 (i32.eqz
                  (global.get $global$7)
                 )
                 (then
                  (global.set $global$7
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$7
                 (i32.sub
                  (global.get $global$7)
                  (i32.const 1)
                 )
                )
                (string.const "")
               )
              )
             )
             (else
              (struct.set $5 4
               (ref.as_non_null
                (local.tee $60
                 (struct.new_default $5)
                )
               )
               (f32.const -2147483648)
              )
              (br $block1)
             )
            )
           )
           (else
            (if
             (i32.lt_u
              (local.tee $8
               (string.measure_wtf16
                (string.const "998")
               )
              )
              (array.len
               (local.tee $69
                (try (result (ref none))
                 (do
                  (if (result (ref none))
                   (i32.atomic.rmw16.or_u acqrel offset=4
                    (i32.and
                     (local.get $6)
                     (i32.const 15)
                    )
                    (i32.const -2147483648)
                   )
                   (then
                    (call $fimport$7
                     (ref.func $19)
                    )
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                   (else
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                 (catch $tag$0
                  (drop (pop i32))
                  (ref.cast (ref none)
                   (struct.new_default $26)
                  )
                 )
                 (catch $tag$1
                  (drop (pop (ref $16)))
                  (loop $label2
                   (if
                    (i32.eqz
                     (global.get $global$7)
                    )
                    (then
                     (global.set $global$7
                      (i32.const 100)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$7
                    (i32.sub
                     (global.get $global$7)
                     (i32.const 1)
                    )
                   )
                   (br_if $label2
                    (ref.test (ref nofunc)
                     (ref.as_non_null
                      (ref.null nofunc)
                     )
                    )
                   )
                   (br $label2)
                  )
                  (unreachable)
                 )
                )
               )
              )
             )
             (then
              (array.set $19
               (local.get $69)
               (local.get $8)
               (if (result i32)
                (i32.eqz
                 (i32.const -27290)
                )
                (then
                 (select
                  (i32.const 255)
                  (local.get $6)
                  (stringview_wtf16.get_codeunit
                   (local.get $53)
                   (block (result i32)
                    (local.set $48
                     (try_table (result i32) (catch $tag$0 $block) (catch_all $block1)
                      (local.get $6)
                     )
                    )
                    (local.get $48)
                   )
                  )
                 )
                )
                (else
                 (i32.const 65536)
                )
               )
              )
             )
            )
            (loop $label3
             (if
              (i32.eqz
               (global.get $global$7)
              )
              (then
               (global.set $global$7
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$7
              (i32.sub
               (global.get $global$7)
               (i32.const 1)
              )
             )
             (try_table (catch_all $label3)
              (br_if $label3
               (local.get $6)
              )
             )
            )
            (return
             (string.const "\ed\bd\88\c2\a3\f0\90\8d\88")
            )
           )
          )
          (string.new_wtf16_array
           (array.new $0
            (i32.const 2)
            (i32.and
             (i32.const 22)
             (i32.const 1023)
            )
           )
           (local.get $6)
           (string.compare
            (local.get $53)
            (string.const "\ed\a0\80")
           )
          )
         )
        )
        (array.len
         (local.tee $75
          (array.new_default $19
           (i32.and
            (i32.const 94)
            (i32.const 1023)
           )
          )
         )
        )
       )
       (then
        (array.set $19
         (local.get $75)
         (local.get $22)
         (try (result i32)
          (do
           (br_if $block
            (i32.const -801669309)
            (string.measure_wtf16
             (try_table (result (ref string)) (catch $tag$0 $block) (catch_all $block1)
              (local.get $53)
             )
            )
           )
          )
          (catch $tag$1
           (if (ref.is_null (pop (ref $16))) (then (nop)) (else (unreachable)))
           (block (result i32)
            (atomic.fence)
            (i64.eq
             (global.get $global$5)
             (i64.const -969573363)
            )
           )
          )
          (catch $tag$0
           (local.set $9 (i32.mul (pop i32) (i32.const 15)))
           (drop
            (select (result (ref string))
             (loop $label5 (result (ref string))
              (if
               (i32.eqz
                (global.get $global$7)
               )
               (then
                (global.set $global$7
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$7
               (i32.sub
                (global.get $global$7)
                (i32.const 1)
               )
              )
              (memory.init $2
               (i32.and
                (ref.eq
                 (try (result (ref struct))
                  (do
                   (ref.as_non_null
                    (local.get $60)
                   )
                  )
                  (catch $tag$0
                   (local.set $10 (call_ref $__sinkT_0 (pop i32) (ref.func $__popsink_0)))
                   (ref.as_non_null
                    (local.tee $82
                     (struct.new_default $26)
                    )
                   )
                  )
                  (catch_all
                   (struct.new_default $26)
                  )
                 )
                 (array.new_fixed $24 0)
                )
                (i32.const 15)
               )
               (i32.const 0)
               (i32.const 0)
              )
              (data.drop $3)
              (drop
               (br_on_null $block1
                (ref.i31
                 (i32.const -28062)
                )
               )
              )
              (br_if $label5
               (i32.eqz
                (f64.eq
                 (if (result f64)
                  (i32.eqz
                   (i32.const -29382)
                  )
                  (then
                   (local.get $1)
                  )
                  (else
                   (f64.const -12170)
                  )
                 )
                 (loop $label4 (result f64)
                  (if
                   (i32.eqz
                    (global.get $global$7)
                   )
                   (then
                    (global.set $global$7
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$7
                   (i32.sub
                    (global.get $global$7)
                    (i32.const 1)
                   )
                  )
                  (call_ref $30
                   (local.tee $4
                    (local.tee $5
                     (i64.const -17542)
                    )
                   )
                   (ref.func $fimport$2)
                  )
                  (br_if $label4
                   (i32.eqz
                    (block (result i32)
                     (nop)
                     (i32.const 65)
                    )
                   )
                  )
                  (local.get $1)
                 )
                )
               )
              )
              (string.const "\ed\bd\881009")
             )
             (block (result (ref string))
              (try_table (catch_all $block1)
               (if
                (i32.lt_u
                 (i32.add
                  (local.tee $13
                   (i32.const 1073741824)
                  )
                  (local.tee $14
                   (i32.const -17357)
                  )
                 )
                 (array.len
                  (local.tee $70
                   (ref.as_non_null
                    (local.tee $83
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 )
                )
                (then
                 (local.set $54
                  (string.const "\ed\bd\88\ed\a0\80\e2\82\ac")
                 )
                 (if
                  (i32.lt_u
                   (i32.add
                    (local.tee $15
                     (if (result i32)
                      (i32.lt_u
                       (i32.add
                        (local.tee $11
                         (loop $label6 (result i32)
                          (if
                           (i32.eqz
                            (global.get $global$7)
                           )
                           (then
                            (global.set $global$7
                             (i32.const 100)
                            )
                            (unreachable)
                           )
                          )
                          (global.set $global$7
                           (i32.sub
                            (global.get $global$7)
                            (i32.const 1)
                           )
                          )
                          (nop)
                          (br_if $label6
                           (i32.const 843207482)
                          )
                          (loop (result i32)
                           (if
                            (i32.eqz
                             (global.get $global$7)
                            )
                            (then
                             (global.set $global$7
                              (i32.const 100)
                             )
                             (unreachable)
                            )
                           )
                           (global.set $global$7
                            (i32.sub
                             (global.get $global$7)
                             (i32.const 1)
                            )
                           )
                           (local.get $6)
                          )
                         )
                        )
                        (local.tee $12
                         (string.measure_wtf16
                          (local.get $54)
                         )
                        )
                       )
                       (array.len
                        (local.tee $84
                         (ref.as_non_null
                          (ref.null none)
                         )
                        )
                       )
                      )
                      (then
                       (string.encode_wtf16_array
                        (local.get $54)
                        (local.get $84)
                        (local.get $11)
                       )
                      )
                      (else
                       (i32.const -11699)
                      )
                     )
                    )
                    (local.tee $16
                     (local.get $14)
                    )
                   )
                   (array.len
                    (local.tee $71
                     (ref.as_non_null
                      (local.get $83)
                     )
                    )
                   )
                  )
                  (then
                   (array.copy $19 $19
                    (local.get $70)
                    (local.get $13)
                    (local.get $71)
                    (local.get $15)
                    (local.get $16)
                   )
                  )
                 )
                )
               )
              )
              (loop $label7 (result (ref string))
               (if
                (i32.eqz
                 (global.get $global$7)
                )
                (then
                 (global.set $global$7
                  (i32.const 100)
                 )
                 (unreachable)
                )
               )
               (global.set $global$7
                (i32.sub
                 (global.get $global$7)
                 (i32.const 1)
                )
               )
               (f64.store offset=22
                (i32.and
                 (i32.const -2097153)
                 (i32.const 15)
                )
                (call $26
                 (f64.add
                  (f64.const -3402823466385288598117041e14)
                  (local.get $1)
                 )
                )
               )
               (call $fimport$7
                (local.get $86)
               )
               (br_if $label7
                (i32.eqz
                 (br_if $block
                  (i32.const -7)
                  (i32.eqz
                   (i32.const -1024)
                  )
                 )
                )
               )
               (string.const "\c2\a3\e2\82\ac933")
              )
             )
             (stringview_wtf16.get_codeunit
              (string.const "")
              (local.get $6)
             )
            )
           )
           (block
            (data.drop $1)
            (call_indirect $0 (type $20)
             (f64.const 1797693134862315708145274e284)
             (string.const "\c2\a3\ed\a0\80914")
             (if (result (ref $17))
              (i32.eqz
               (local.get $6)
              )
              (then
               (local.tee $87
                (ref.as_non_null
                 (ref.null nofunc)
                )
               )
              )
              (else
               (try_table (result (ref $17)) (catch $tag$0 $block)
                (local.get $87)
               )
              )
             )
             (loop $label8 (result (ref any))
              (if
               (i32.eqz
                (global.get $global$7)
               )
               (then
                (global.set $global$7
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$7
               (i32.sub
                (global.get $global$7)
                (i32.const 1)
               )
              )
              (nop)
              (br_if $label8
               (i32.eqz
                (i32.const -16385)
               )
              )
              (local.tee $88
               (block (result (ref none))
                (nop)
                (loop $label9 (result (ref none))
                 (if
                  (i32.eqz
                   (global.get $global$7)
                  )
                  (then
                   (global.set $global$7
                    (i32.const 100)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$7
                  (i32.sub
                   (global.get $global$7)
                   (i32.const 1)
                  )
                 )
                 (table.set $1
                  (i32.const 1)
                  (block $block2 (result (ref exn))
                   (try_table (catch_all_ref $block2)
                    (throw $tag$2)
                   )
                   (unreachable)
                  )
                 )
                 (br_if $label9
                  (i32.const -106)
                 )
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
             )
             (string.const "")
             (i64.const 7)
            )
            (return
             (string.const "\e2\82\ac")
            )
           )
           (unreachable)
          )
          (catch_all
           (br_if $block
            (block (result i32)
             (try
              (do
               (loop
                (if
                 (i32.eqz
                  (global.get $global$7)
                 )
                 (then
                  (global.set $global$7
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$7
                 (i32.sub
                  (global.get $global$7)
                  (i32.const 1)
                 )
                )
                (if
                 (i32.lt_u
                  (local.tee $17
                   (i32.const -25333)
                  )
                  (array.len
                   (local.tee $72
                    (ref.as_non_null
                     (local.get $83)
                    )
                   )
                  )
                 )
                 (then
                  (array.set $19
                   (local.get $72)
                   (local.get $17)
                   (local.get $6)
                  )
                 )
                )
                (drop
                 (local.get $89)
                )
               )
              )
              (catch $tag$0
               (local.set $18 (i32.eqz (pop i32)))
               (if
                (i32.lt_u
                 (i32.add
                  (local.tee $20
                   (local.tee $6
                    (i32.const -262145)
                   )
                  )
                  (local.tee $21
                   (i32.const -262144)
                  )
                 )
                 (array.len
                  (local.tee $74
                   (ref.as_non_null
                    (local.get $83)
                   )
                  )
                 )
                )
                (then
                 (array.fill $19
                  (local.get $74)
                  (local.get $20)
                  (if (result i32)
                   (if (result i32)
                    (i32.lt_u
                     (local.tee $19
                      (string.measure_wtf16
                       (local.get $53)
                      )
                     )
                     (array.len
                      (local.tee $73
                       (ref.as_non_null
                        (local.get $83)
                       )
                      )
                     )
                    )
                    (then
                     (array.get_u $19
                      (local.get $73)
                      (local.get $19)
                     )
                    )
                    (else
                     (local.get $6)
                    )
                   )
                   (then
                    (local.get $6)
                   )
                   (else
                    (i32.const 2035748735)
                   )
                  )
                  (local.get $21)
                 )
                )
               )
              )
             )
             (local.tee $6
              (br_if $block
               (local.tee $6
                (local.get $6)
               )
               (i32.eqz
                (i32.atomic.load acqrel offset=4
                 (i32.and
                  (local.get $6)
                  (i32.const 15)
                 )
                )
               )
              )
             )
            )
            (i32.eqz
             (i32.const 242)
            )
           )
          )
         )
        )
       )
      )
      (atomic.fence acqrel)
     )
     (return
      (string.const "\c2\a3")
     )
    )
    (then
     (call $fimport$2
      (global.get $global$5)
     )
     (local.set $55
      (string.const "\ed\a0\80")
     )
     (if
      (if (result i32)
       (i32.lt_u
        (i32.add
         (local.tee $23
          (loop $label10 (result i32)
           (if
            (i32.eqz
             (global.get $global$7)
            )
            (then
             (global.set $global$7
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$7
            (i32.sub
             (global.get $global$7)
             (i32.const 1)
            )
           )
           (table.set $1
            (i32.const 1)
            (block $block3 (result (ref exn))
             (try_table (catch_all_ref $block3)
              (throw $tag$2)
             )
             (unreachable)
            )
           )
           (drop
            (br_on_cast $block4 (ref string) (ref string)
             (loop (result (ref string))
              (if
               (i32.eqz
                (global.get $global$7)
               )
               (then
                (global.set $global$7
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$7
               (i32.sub
                (global.get $global$7)
                (i32.const 1)
               )
              )
              (block (result (ref string))
               (atomic.fence acqrel)
               (string.const "\ed\a0\801008")
              )
             )
            )
           )
           (drop
            (br_on_null $label10
             (ref.func $2)
            )
           )
           (br_if $label10
            (local.get $6)
           )
           (local.get $6)
          )
         )
         (local.tee $24
          (string.measure_wtf16
           (local.get $55)
          )
         )
        )
        (array.len
         (local.tee $91
          (ref.as_non_null
           (local.tee $90
            (try_table (result (ref (exact $0)))
             (array.new_default $0
              (i32.and
               (i32.const 76)
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
        (string.encode_wtf16_array
         (local.get $55)
         (local.get $91)
         (local.get $23)
        )
       )
       (else
        (i32.const 72)
       )
      )
      (then
       (loop
        (if
         (i32.eqz
          (global.get $global$7)
         )
         (then
          (global.set $global$7
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$7
         (i32.sub
          (global.get $global$7)
          (i32.const 1)
         )
        )
        (call_indirect $0 (type $20)
         (call $26
          (f64x2.extract_lane 0
           (local.get $0)
          )
         )
         (string.const "\c2\a3\ed\a0\80\e2\82\ac")
         (ref.null nofunc)
         (struct.new_default $26)
         (ref.as_non_null
          (local.tee $96
           (global.get $gimport$0)
          )
         )
         (i64.const 5)
        )
        (nop)
        (loop $label11
         (if
          (i32.eqz
           (global.get $global$7)
          )
          (then
           (global.set $global$7
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$7
          (i32.sub
           (global.get $global$7)
           (i32.const 1)
          )
         )
         (call_indirect $0 (type $20)
          (call $26
           (block (result f64)
            (local.set $scratch
             (f64.const 1)
            )
            (drop
             (i32.const 15)
            )
            (local.get $scratch)
           )
          )
          (string.const "\e2\82\ac\ed\a0\80")
          (ref.func $6)
          (select (result (ref (exact $23)))
           (struct.new $23
            (local.tee $97
             (ref.as_non_null
              (ref.null none)
             )
            )
            (ref.null nofunc)
            (local.get $1)
            (if (result f64)
             (local.get $6)
             (then
              (f64.const -9223372036854775808)
             )
             (else
              (return
               (string.const "")
              )
             )
            )
            (f32.const -114)
           )
           (struct.new_default $23)
           (i32.extend8_s
            (ref.is_null
             (string.const "\f0\90\8d\88")
            )
           )
          )
          (block (result (ref extern))
           (drop
            (br_on_null $label11
             (array.new_default $1
              (i32.and
               (i32.const 11)
               (i32.const 1023)
              )
             )
            )
           )
           (ref.as_non_null
            (local.get $96)
           )
          )
          (i64.const 7)
         )
         (return
          (string.const "\c2\a3\ed\bd\88")
         )
        )
        (unreachable)
       )
       (unreachable)
      )
      (else
       (i32.atomic.store acqrel offset=4
        (i32.and
         (block $block5 (result i32)
          (memory.init $0
           (i32.and
            (i32.const -65535)
            (i32.const 15)
           )
           (i32.const 0)
           (i32.const 1)
          )
          (select
           (br_if $block5
            (ref.is_null
             (ref.func $14)
            )
            (f64.eq
             (local.tee $1
              (f64.const 9223372036854775808)
             )
             (local.get $1)
            )
           )
           (struct.get_u $11 1
            (struct.new $11
             (f32.const 17592186044416)
             (local.get $6)
             (f64.const 0)
             (local.get $6)
             (i32.const -7)
             (struct.new_default $9)
            )
           )
           (block (result i32)
            (local.set $57
             (string.const "")
            )
            (if (result i32)
             (i32.lt_u
              (i32.add
               (local.tee $28
                (struct.get_s $11 4
                 (struct.new $11
                  (f32.const 17592186044416)
                  (local.get $6)
                  (local.get $1)
                  (local.get $6)
                  (i32.const -6457508)
                  (struct.new_default $9)
                 )
                )
               )
               (local.tee $29
                (string.measure_wtf16
                 (local.get $57)
                )
               )
              )
              (array.len
               (local.tee $93
                (try (result (ref (exact $0)))
                 (do
                  (nop)
                  (return
                   (string.const "\e2\82\ac\e2\82\ac")
                  )
                 )
                 (catch $tag$0
                  (local.set $25 (call $__popsink_0 (pop i32)))
                  (array.new $0
                   (local.get $6)
                   (i32.and
                    (i32.const 65)
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
               (local.get $57)
               (local.get $93)
               (local.get $28)
              )
             )
             (else
              (local.tee $6
               (if (result i32)
                (local.get $6)
                (then
                 (return
                  (string.const "\c2\a3564")
                 )
                )
                (else
                 (try_table (result i32)
                  (if (result i32)
                   (local.get $6)
                   (then
                    (local.get $6)
                   )
                   (else
                    (local.get $6)
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
         (i32.const 15)
        )
        (try_table (result i32)
         (i32.const 1644703338)
        )
       )
       (return
        (string.const "\c2\a3")
       )
      )
     )
     (unreachable)
    )
    (else
     (local.set $6
      (i31.get_u
       (try (result (ref i31))
        (do
         (ref.i31
          (i32.const 128)
         )
        )
        (catch $tag$1
         (throw $tag$1 (pop (ref $16)))
         (ref.as_non_null
          (local.tee $51
           (ref.as_non_null
            (local.get $51)
           )
          )
         )
        )
        (catch $tag$0
         (local.set $30 (if (result i32) (pop i32) (then (i32.const 1)) (else (local.get $30))))
         (drop
          (br_on_cast $block4 (ref string) (ref string)
           (string.const "\e2\82\ac")
          )
         )
         (ref.i31
          (i32.const 52)
         )
        )
       )
      )
     )
     (return
      (string.const "949\ed\a0\80")
     )
    )
   )
   (local.set $95
    (local.set $53
     (local.set $53
      (local.set $103
       (local.set $53
        (local.set $53
         (local.set $53
          (local.set $102
           (local.set $53
            (local.set $81
             (local.set $80
              (local.set $59
               (local.set $68
                (local.set $53
                 (local.set $78
                  (local.set $79
                   (local.set $77
                    (local.set $76
                     (local.set $94
                      (local.set $100
                       (local.set $99
                        (local.set $66
                         (local.set $65
                          (local.set $64
                           (local.set $53
                            (local.set $85
                             (local.set $58
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
 (func $20 (type $25)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (drop
   (call $19
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $21 (type $18) (param $0 (ref null $13)) (param $1 (ref $3)) (param $2 (ref null $18)) (result (ref array))
  (local $3 i31ref)
  (local $4 (ref null $13))
  (local $5 (ref $5))
  (local $6 (ref $5))
  (local $7 (ref $7))
  (local $8 (ref none))
  (local $9 (ref none))
  (local $10 (ref $19))
  (local $11 (ref $19))
  (local $12 (ref $16))
  (local $13 (ref $16))
  (local $14 (ref $16))
  (local $15 (ref $16))
  (local $16 (ref $16))
  (local $17 (ref null $23))
  (local $18 (ref extern))
  (local $19 (ref noextern))
  (local $20 (ref $13))
  (local $21 (ref $0))
  (local $22 (ref $0))
  (local $23 (ref string))
  (local $24 (ref string))
  (local $25 (ref i31))
  (local $26 (ref $4))
  (local $27 v128)
  (local $28 v128)
  (local $29 f32)
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
  (local $45 i64)
  (local $46 i64)
  (local $47 f64)
  (local $48 f64)
  (local $scratch (ref (exact $7)))
  (local $scratch_50 i32)
  (local $scratch_51 i64)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (block $block1 (result (ref array))
   (try
    (do
     (call $fimport$3
      (local.tee $29
       (f32.const 29779)
      )
     )
    )
    (catch $tag$0
     (local.set $30 (call $__popsink_0 (pop i32)))
     (struct.set $5 3
      (local.tee $5
       (local.tee $6
        (struct.new $23
         (if (result (ref none))
          (i32.atomic.load8_u acqrel offset=22
           (i32.and
            (i32.const -268435455)
            (i32.const 15)
           )
          )
          (then
           (block $block (result (ref none))
            (drop
             (br_on_cast $block (ref none) (ref none)
              (if (result (ref none))
               (i32.load8_s offset=4
                (i32.and
                 (f64.ne
                  (f64.const 0)
                  (f64.const -44)
                 )
                 (i32.const 15)
                )
               )
               (then
                (if
                 (i32.eqz
                  (ref.test (ref $7)
                   (local.tee $7
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                 (then
                  (if
                   (i32.eqz
                    (i32.wrap_i64
                     (i64.const -106)
                    )
                   )
                   (then
                    (nop)
                   )
                   (else
                    (nop)
                   )
                  )
                 )
                 (else
                  (nop)
                 )
                )
                (return
                 (local.get $7)
                )
               )
               (else
                (call $fimport$6
                 (ref.null none)
                )
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
             )
            )
            (drop
             (block (result (ref (exact $7)))
              (local.set $scratch
               (array.new_default $7
                (i32.and
                 (i32.const 92)
                 (i32.const 1023)
                )
               )
              )
              (local.set $28
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              )
              (local.get $scratch)
             )
            )
            (call $fimport$5
             (call $27
              (local.get $28)
             )
            )
            (return
             (array.new_fixed $24 0)
            )
           )
          )
          (else
           (drop
            (ref.as_non_null
             (ref.null none)
            )
           )
           (if
            (i32.lt_u
             (local.set $32
              (unreachable)
             )
             (array.len
              (local.tee $9
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (then
             (drop
              (local.get $9)
             )
             (drop
              (local.get $32)
             )
             (drop
              (block (result i32)
               (nop)
               (if (result i32)
                (i32.lt_u
                 (local.tee $31
                  (i32.const -33554432)
                 )
                 (array.len
                  (local.tee $8
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                 )
                )
                (then
                 (drop
                  (local.get $8)
                 )
                 (drop
                  (local.get $31)
                 )
                 (unreachable)
                )
                (else
                 (i32.const -65535)
                )
               )
              )
             )
             (unreachable)
            )
           )
           (return
            (array.new_fixed $24 0)
           )
          )
         )
         (ref.cast (ref (exact $16))
          (ref.func $16)
         )
         (block (result f64)
          (drop
           (br_on_cast_fail $block1 (ref $19) (ref $19)
            (local.tee $10
             (array.new $19
              (i32.const -103)
              (i32.and
               (i32.const 68)
               (i32.const 1023)
              )
             )
            )
           )
          )
          (call $26
           (struct.get $23 3
            (select (result (ref (exact $23)))
             (struct.new_default $23)
             (struct.new $23
              (ref.null none)
              (ref.func $16)
              (f64.const 16777216)
              (f64.const -3402823466385288598117041e14)
              (local.get $29)
             )
             (i32.const 524288)
            )
           )
          )
         )
         (f64.const -70)
         (f32.const -134217728)
        )
       )
      )
      (try (result f64)
       (do
        (call $26
         (f64x2.extract_lane 1
          (local.get $27)
         )
        )
       )
       (catch $tag$1
        (local.set $13 (call_ref $__sinkT_1 (pop (ref $16)) (ref.func $__popsink_1)))
        (f64.const 2199023255552)
       )
       (catch $tag$0
        (local.set $35 (i32.mul (pop i32) (i32.const -1)))
        (try (result f64)
         (do
          (if
           (i32.eqz
            (local.get $33)
           )
           (then
            (global.set $global$5
             (i64.atomic.load8_u offset=22
              (i32.and
               (local.tee $36
                (block (result i32)
                 (local.set $scratch_50
                  (i32.const -16293)
                 )
                 (local.set $45
                  (i64.const 53)
                 )
                 (local.get $scratch_50)
                )
               )
               (i32.const 15)
              )
             )
            )
            (drop
             (local.get $17)
            )
            (try_table
             (loop
              (if
               (i32.eqz
                (global.get $global$7)
               )
               (then
                (global.set $global$7
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$7
               (i32.sub
                (global.get $global$7)
                (i32.const 1)
               )
              )
              (drop
               (ref.null none)
              )
              (return
               (array.new_fixed $24 0)
              )
             )
             (unreachable)
            )
            (unreachable)
           )
           (else
            (drop
             (loop (result f32)
              (if
               (i32.eqz
                (global.get $global$7)
               )
               (then
                (global.set $global$7
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$7
               (i32.sub
                (global.get $global$7)
                (i32.const 1)
               )
              )
              (call $25
               (f32.add
                (f32.const -22)
                (call $25
                 (f32.convert_i64_s
                  (i64.rotl
                   (i64.reinterpret_f64
                    (local.tee $47
                     (call $26
                      (f64.reinterpret_i64
                       (local.get $46)
                      )
                     )
                    )
                   )
                   (i64.load offset=22 align=4
                    (i32.and
                     (local.get $33)
                     (i32.const 15)
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
             (local.get $33)
            )
            (drop
             (local.tee $47
              (local.tee $47
               (block $block2 (result f64)
                (call $fimport$2
                 (local.get $46)
                )
                (local.tee $47
                 (local.tee $47
                  (br_if $block2
                   (local.get $47)
                   (i32.const -104)
                  )
                 )
                )
               )
              )
             )
            )
            (block
             (call $fimport$3
              (select
               (call $25
                (f32.load offset=22
                 (i32.and
                  (local.get $33)
                  (i32.const 15)
                 )
                )
               )
               (local.get $29)
               (local.get $33)
              )
             )
             (return
              (array.new_fixed $24 0)
             )
            )
            (local.set $24
             (local.set $14
              (local.set $22
               (local.set $21
                (local.set $23
                 (local.set $20
                  (local.set $18
                   (local.set $19
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
          (unreachable)
         )
         (catch $tag$0
          (global.set $global$7 (pop i32))
          (local.get $47)
         )
         (catch_all
          (f64.const 34359738367)
         )
        )
       )
      )
     )
    )
   )
   (loop $label (result (ref (exact $24)))
    (if
     (i32.eqz
      (global.get $global$7)
     )
     (then
      (global.set $global$7
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$7
     (i32.sub
      (global.get $global$7)
      (i32.const 1)
     )
    )
    (block $block3
     (if
      (i32.eqz
       (local.get $33)
      )
      (then
       (f64.store offset=22 align=4
        (i32.and
         (local.get $33)
         (i32.const 15)
        )
        (local.tee $47
         (try_table (result f64) (catch_all $block3)
          (f64.const 0)
         )
        )
       )
      )
      (else
       (call $fimport$5
        (local.get $27)
       )
      )
     )
     (call_ref $4
      (if (result i32)
       (i32.eqz
        (i32.const 65491)
       )
       (then
        (loop
         (if
          (i32.eqz
           (global.get $global$7)
          )
          (then
           (global.set $global$7
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$7
          (i32.sub
           (global.get $global$7)
           (i32.const 1)
          )
         )
         (call $fimport$5
          (local.tee $27
           (call $27
            (v128.load offset=22 align=8
             (i32.and
              (stringview_wtf16.get_codeunit
               (string.const "")
               (block (result i32)
                (local.set $44
                 (ref.eq
                  (array.new_fixed $24 0)
                  (if (result (ref i31))
                   (i32.eqz
                    (i32.const 194)
                   )
                   (then
                    (ref.i31
                     (i32.const -30356)
                    )
                   )
                   (else
                    (local.tee $25
                     (ref.i31
                      (i32.const 524288)
                     )
                    )
                   )
                  )
                 )
                )
                (local.get $44)
               )
              )
              (i32.const 15)
             )
            )
           )
          )
         )
         (br $label)
        )
        (unreachable)
       )
       (else
        (drop
         (block (result i64)
          (local.set $scratch_51
           (i64.const 127)
          )
          (local.set $44
           (i32.const -128)
          )
          (local.get $scratch_51)
         )
        )
        (local.get $44)
       )
      )
      (local.tee $26
       (ref.func $9)
      )
      (ref.func $9)
     )
    )
    (br_if $label
     (i32.eqz
      (i32.const -17)
     )
    )
    (array.new_fixed $24 0)
   )
  )
 )
 (func $22 (type $3) (result (ref null $4))
  (local $0 funcref)
  (local $1 (ref null $4))
  (local $2 v128)
  (local $3 v128)
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (local.get $1)
 )
 (func $23 (type $42) (param $0 f64) (param $1 stringref) (result (ref null $7))
  (local $2 i32)
  (local.set $0
   (call $26
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (array.new_default $7
   (i32.and
    (i32.const 89)
    (i32.const 1023)
   )
  )
 )
 (func $24 (type $20) (param $0 f64) (param $1 externref) (param $2 (ref null $13)) (param $3 anyref) (param $4 externref)
  (local $5 (ref $21))
  (local $6 (ref null $4))
  (local $7 (ref null $4))
  (local $8 eqref)
  (local $9 (ref null $22))
  (local $10 stringref)
  (local $11 (ref null $21))
  (local $12 (ref null $16))
  (local $13 (ref $17))
  (local $14 (ref null $12))
  (local $15 externref)
  (local $16 (ref $19))
  (local $17 (ref $19))
  (local $18 (ref $19))
  (local $19 (ref $19))
  (local $20 (ref $19))
  (local $21 (ref $23))
  (local $22 (ref string))
  (local $23 (ref string))
  (local $24 (ref none))
  (local $25 (ref i31))
  (local $26 (ref null $23))
  (local $27 (ref struct))
  (local $28 f32)
  (local $29 f32)
  (local $30 i64)
  (local $31 i64)
  (local $32 i64)
  (local $33 f64)
  (local $34 f64)
  (local $35 f64)
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
  (local.set $0
   (call $26
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (global.get $global$7)
   )
   (then
    (global.set $global$7
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$7
   (i32.sub
    (global.get $global$7)
    (i32.const 1)
   )
  )
  (local.set $26
   (ref.as_non_null
    (local.get $26)
   )
  )
  (if
   (i32.lt_u
    (local.tee $38
     (local.get $37)
    )
    (array.len
     (local.tee $17
      (local.tee $16
       (array.new $19
        (i32.const -33554432)
        (i32.and
         (i32.const 27)
         (i32.const 1023)
        )
       )
      )
     )
    )
   )
   (then
    (array.set $19
     (local.get $17)
     (local.get $38)
     (string.eq
      (string.const "")
      (string.const "\c2\a3284\ed\a0\80")
     )
    )
   )
  )
  (struct.set $23 3
   (local.tee $21
    (select (result (ref $23))
     (ref.as_non_null
      (local.get $26)
     )
     (ref.as_non_null
      (local.get $26)
     )
     (f64.le
      (try (result f64)
       (do
        (f64.const 65443)
       )
       (catch_all
        (local.get $0)
       )
      )
      (f64.const 2)
     )
    )
   )
   (local.get $35)
  )
  (nop)
 )
 (func $25 (type $43) (param $0 f32) (result f32)
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
 (func $26 (type $44) (param $0 f64) (result f64)
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
 (func $27 (type $45) (param $0 v128) (result v128)
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
 (type $__sinkT_1 (func (param (ref $16)) (result (ref $16))))
 (func $__popsink_1 (type $__sinkT_1) (local.get 0))
)
