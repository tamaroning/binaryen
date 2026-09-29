(module
 (type $0 (struct))
 (rec
  (type $1 (sub (array (mut f32))))
  (type $2 (array (mut v128)))
  (type $3 (descriptor $5) (struct (field f64) (field (ref $6))))
  (type $4 (array i32))
  (type $5 (describes $3) (descriptor $6) (struct (field (mut v128)) (field (mut (ref $13)))))
  (type $6 (sub (describes $5) (struct)))
  (type $7 (array (ref any)))
  (type $8 (sub (struct (field (mut i16)) (field f32) (field (mut f64)) (field (mut (ref null $13))) (field (mut (ref $12))))))
  (type $9 (struct (field (mut f64)) (field i8) (field (mut i8)) (field (mut v128)) (field (mut (ref null $9)))))
  (type $10 (sub (array (mut i8))))
  (type $11 (sub (array (mut i16))))
  (type $12 (struct (field (mut i16)) (field (ref struct)) (field f32) (field (mut nullexternref)) (field (ref struct))))
  (type $13 (array (mut i32)))
  (type $14 (sub (struct (field i64))))
 )
 (rec
  (type $15 (sub (func (result (ref null $12)))))
  (type $16 (sub $11 (array (mut i16))))
 )
 (type $17 (func (param i32)))
 (type $18 (func (param externref)))
 (type $19 (func (param v128)))
 (type $20 (func (param i32 i32) (result i32)))
 (type $21 (array i8))
 (type $22 (func (param (ref null $9))))
 (type $23 (func))
 (type $24 (func (param i64)))
 (type $25 (func (param f32)))
 (type $26 (func (param f64)))
 (type $27 (func (param anyref)))
 (type $28 (func (param funcref)))
 (type $29 (func (param funcref i32)))
 (type $30 (func (param funcref) (result i32)))
 (type $31 (func (result externref)))
 (type $32 (func (param f32) (result f32)))
 (type $33 (func (param f64) (result f64)))
 (type $34 (func (param v128) (result v128)))
 (rec
  (type $35 (array v128))
  (type $36 (sub (array (mut (ref null $13)))))
  (type $37 (sub (struct (field (mut f64)) (field i64) (field f32) (field (ref $4)) (field i64))))
  (type $38 (struct (field (ref null $38)) (field (mut f32)) (field i16) (field i8) (field v128)))
 )
 (rec
  (type $39 (sub $10 (array (mut i8))))
  (type $40 (struct (field (mut (ref $9))) (field (mut f64)) (field (mut f32)) (field (ref $12))))
  (type $41 (struct (field i64) (field i32) (field i8) (field (mut v128)) (field (mut (ref null $14)))))
  (type $42 (sub $37 (struct (field (mut f64)) (field i64) (field f32) (field (ref $4)) (field i64) (field i8))))
 )
 (import "__fuzz_import" "global$_9" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $17) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $17) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $24) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $25) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $26) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $19) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $27) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $28) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $18) (param externref)))
 (import "fuzzing-support" "call-ref" (func $fimport$9 (type $29) (param funcref i32)))
 (import "fuzzing-support" "call-ref-catch" (func $fimport$10 (type $30) (param funcref) (result i32)))
 (import "fuzzing-support" "sleep" (func $fimport$11 (type $20) (param i32 i32) (result i32)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $17) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $18) (param externref)))
 (global $global$0 (ref $8) (struct.new $8
  (i32.const 65535)
  (f32.const -53)
  (f64.const 4294967292)
  (ref.null none)
  (struct.new $12
   (i32.const -49)
   (struct.new_default $0)
   (f32.const 126.80999755859375)
   (ref.null noextern)
   (struct.new_default $0)
  )
 ))
 (global $global$1 (mut f64) (f64.const 18446744073709551615))
 (global $global$2 i32 (i32.const -16))
 (global $global$3 externref (ref.null noextern))
 (global $global$4 i32 (i32.const 127))
 (global $global$5 i32 (i32.const -1))
 (global $global$6 f32 (f32.const 65452))
 (global $global$7 i64 (i64.const -21455))
 (global $global$8 (ref struct) (struct.new_default $0))
 (global $global$9 (ref eq) (struct.new_default $0))
 (global $global$10 f64 (f64.const 3402823466385288598117041e14))
 (global $global$11 (ref null $41) (struct.new_default $41))
 (global $global$12 (ref $12) (struct.new $12
  (i32.const -47)
  (struct.new_default $0)
  (f32.const 2305843009213693952)
  (ref.null noextern)
  (global.get $global$8)
 ))
 (global $global$13 (ref array) (array.new_fixed $21 0))
 (global $global$14 funcref (ref.null nofunc))
 (global $global$15 i64 (i64.const -494972849))
 (global $global$16 i64 (i64.const -22998))
 (global $global$17 i64 (i64.const -32768))
 (global $global$18 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 "\96\be\e1\82\e6\fa\ad\90^\93\b5\cc\ea\cc\14\1c~\07F")
 (data $1 "\fe-G\f5\11\f1\e2\d0\afbC!s\e9\16\e3\1b\98U\d7NF\c8\b2 \9d\8bDu0")
 (table $0 7 7 funcref)
 (table $1 2 exnref)
 (elem $0 (table $0) (i32.const 0) func)
 (elem declare func $0 $1 $fimport$11)
 (tag $tag$0 (type $22) (param (ref null $9)))
 (tag $tag$1 (type $19) (param v128))
 (tag $tag$2 (type $23))
 (export "global$_4" (global $global$8))
 (export "global$_5" (global $global$9))
 (export "global$_7" (global $global$12))
 (export "global$_8" (global $global$13))
 (export "global$_10" (global $global$14))
 (export "tag$_1" (tag $tag$1))
 (export "wasmtag" (tag $eimport$0))
 (export "func" (func $2))
 (func $0 (type $15) (result (ref null $12))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $15) (result (ref null $12))
  (local $0 v128)
  (local $1 v128)
  (local $2 v128)
  (local $3 v128)
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
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 f64)
  (local $20 f64)
  (local $21 f32)
  (local $22 (ref eq))
  (local $23 (ref null $9))
  (local $24 (ref null $9))
  (local $25 (ref null $9))
  (local $26 (ref null $9))
  (local $27 (ref null $9))
  (local $28 (ref null $9))
  (local $29 (ref string))
  (local $30 (ref $7))
  (local $31 (ref null $2))
  (local $32 (ref $10))
  (local $33 (ref $10))
  (local $34 (ref none))
  (local $35 (ref none))
  (local $36 (ref $12))
  (local $37 (ref $11))
  (local $38 (ref $11))
  (local $39 eqref)
  (local $40 (ref struct))
  (local $41 (ref $16))
  (local $42 (ref $16))
  (local $43 (ref $41))
  (local $44 (ref $41))
  (local $45 (ref $14))
  (local $46 externref)
  (local $47 (ref $4))
  (local $48 (ref $4))
  (local $49 (ref $13))
  (local $50 (ref $13))
  (local $scratch (ref string))
  (local $scratch_52 (ref i31))
  (local $scratch_53 (ref (exact $12)))
  (if
   (i32.eqz
    (global.get $global$18)
   )
   (then
    (global.set $global$18
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$18
   (i32.sub
    (global.get $global$18)
    (i32.const 1)
   )
  )
  (local.set $36
   (global.get $global$12)
  )
  (local.set $31
   (ref.as_non_null
    (local.get $31)
   )
  )
  (local.set $29
   (string.const "\f0\90\8d\88935\e2\82\ac")
  )
  (block $block (result (ref $12))
   (try $__t_3  (do (try  (do 
     (table.set $1
      (i32.const 0)
      (if (result (ref exn))
       (i32.eqz
        (block $block1 (result i32)
         (call $fimport$7
          (ref.null nofunc)
         )
         (try $__t_2 (result i32) (do
           (i32.const 129)
          ) (catch $tag$0
           (local.set $23 (pop (ref null $9)))
           (drop
            (br_on_cast_fail $block (ref (exact $12)) (ref (exact $12))
             (block (result (ref (exact $12)))
              (block
               (call $fimport$2
                (global.get $global$17)
               )
              )
              (local.set $scratch_53
               (struct.new $12
                (i32.const 33)
                (global.get $global$8)
                (f32.const -35184372088832)
                (ref.null noextern)
                (struct.new_default $0)
               )
              )
              (drop
               (block (result (ref i31))
                (local.set $scratch_52
                 (ref.i31
                  (i32.const -107)
                 )
                )
                (drop
                 (block (result (ref string))
                  (local.set $scratch
                   (string.const "\e2\82\ac")
                  )
                  (drop
                   (i32.const -25795)
                  )
                  (local.get $scratch)
                 )
                )
                (local.get $scratch_52)
               )
              )
              (local.get $scratch_53)
             )
            )
           )
           (br_if $block1
            (i32.popcnt
             (call_ref $20
              (string.compare
               (local.tee $29
                (string.const "\c2\a3")
               )
               (local.get $29)
              )
              (local.get $8)
              (ref.func $fimport$11)
             )
            )
            (i32.eqz
             (i32.const 32768)
            )
           )
          ) (catch_all (if (global.get $__rt) (then (rethrow $__t_2)))
(i32.const -71)))
        )
       )
       (then
        (block $block2 (result (ref exn))
         (try_table (catch_all_ref $block2)
          (throw $tag$2)
         )
         (unreachable)
        )
       )
       (else
        (call $fimport$1
         (local.tee $4
          (ref.eq
           (ref.i31
            (local.tee $7
             (local.tee $8
              (i32.const -5113)
             )
            )
           )
           (struct.new_desc $3
            (f64.const 0)
            (struct.new_default $6)
            (struct.new_desc $5
             (local.get $0)
             (array.new_default $13
              (i32.and
               (i32.const 16)
               (i32.const 1023)
              )
             )
             (ref.as_non_null
              (ref.null none)
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
     )
    ) (delegate $__t_3))) (catch $tag$0
(drop (struct.get $9 0 (pop (ref null $9))))
(if (global.get $__rt) (then (rethrow $__t_3)))
(i64.atomic.store offset=22
      (i64.and
       (try_table (result i64)
        (drop
         (struct.new $14
          (i64.const -127)
         )
        )
        (if (result i64)
         (i32.eqz
          (local.tee $5
           (local.tee $5
            (if (result i32)
             (i32.const -127)
             (then
              (call $fimport$1
               (ref.test (ref (exact $1))
                (array.new $1
                 (f32.const 0)
                 (i32.and
                  (i32.const 3)
                  (i32.const 1023)
                 )
                )
               )
              )
              (return
               (struct.new $12
                (i32.const -128)
                (global.get $global$8)
                (f32.const 117)
                (ref.as_non_null
                 (ref.null noextern)
                )
                (struct.new_default $0)
               )
              )
             )
             (else
              (i32.const 65424)
             )
            )
           )
          )
         )
         (then
          (call $fimport$7
           (ref.null nofunc)
          )
          (i64.extend_i32_s
           (i32.const -6549231)
          )
         )
         (else
          (drop
           (i64x2.extract_lane 1
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
          )
          (block
           (atomic.fence acqrel)
           (if
            (i32.load offset=22 align=1
             (i64.and
              (i64.const -4294967295)
              (i64.const 15)
             )
            )
            (then
             (nop)
             (return
              (struct.new $12
               (local.get $4)
               (struct.new_desc $3
                (call $4
                 (global.get $global$1)
                )
                (struct.new_default $6)
                (struct.new_desc $5
                 (local.get $2)
                 (array.new $13
                  (i32.const 16384)
                  (i32.and
                   (i32.const 62)
                   (i32.const 1023)
                  )
                 )
                 (struct.new_default $6)
                )
               )
               (f32.const -23211)
               (ref.null noextern)
               (struct.new $12
                (local.get $8)
                (global.get $global$8)
                (f32.const 2147483648)
                (ref.null noextern)
                (struct.new_default $0)
               )
              )
             )
            )
            (else
             (call $fimport$7
              (ref.func $1)
             )
             (drop
              (local.tee $6
               (string.measure_wtf16
                (local.tee $29
                 (select (result (ref string))
                  (string.const "")
                  (local.tee $29
                   (try $__t_1 (result (ref string)) (do (try (result (ref string)) (do 
                     (local.get $29)
                    ) (delegate $__t_1))) (catch $tag$0
                     (drop (struct.get $9 0 (pop (ref null $9))))
                     (block (result (ref string))
                      (nop)
                      (loop (result (ref string))
                       (if
                        (i32.eqz
                         (global.get $global$18)
                        )
                        (then
                         (global.set $global$18
                          (i32.const 100)
                         )
                         (unreachable)
                        )
                       )
                       (global.set $global$18
                        (i32.sub
                         (global.get $global$18)
                         (i32.const 1)
                        )
                       )
                       (local.get $29)
                      )
                     )
                    ) (catch $tag$1
(local.set $3
                      (call $5
                       (pop v128)
                      )
                     )
(if (global.get $__rt) (then (rethrow $__t_1)))
(ref.cast (ref string)
                      (string.const "954\ed\bd\88")
                     )))
                  )
                  (if (result i32)
                   (i32.lt_u
                    (local.tee $9
                     (i32.const -32768)
                    )
                    (array.len
                     (local.tee $38
                      (local.tee $37
                       (ref.as_non_null
                        (ref.null none)
                       )
                      )
                     )
                    )
                   )
                   (then
                    (array.get_s $11
                     (local.get $38)
                     (local.get $9)
                    )
                   )
                   (else
                    (i32.const 0)
                   )
                  )
                 )
                )
               )
              )
             )
             (drop
              (ref.i31
               (i32.const -127)
              )
             )
             (block
              (if
               (i32.eqz
                (ref.eq
                 (local.get $36)
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
               (then
                (call $fimport$6
                 (local.tee $39
                  (ref.as_non_null
                   (local.get $31)
                  )
                 )
                )
               )
              )
              (return
               (ref.null none)
              )
             )
             (unreachable)
            )
           )
           (unreachable)
          )
          (unreachable)
         )
        )
       )
       (i64.const 15)
      )
      (local.get $16)
     )) (catch_all (if (global.get $__rt) (then (rethrow $__t_3)))
(call $fimport$7
      (block (result (ref (exact $15)))
       (block $block3
        (call $fimport$2
         (try_table (result i64) (catch_all $block3)
          (if
           (i32.lt_u
            (local.tee $5
             (ref.test nullref
              (ref.null none)
             )
            )
            (array.len
             (ref.as_non_null
              (local.tee $31
               (try_table (result (ref (exact $2))) (catch_all $block3)
                (array.new_default $2
                 (i32.and
                  (i32.const 4)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
            )
           )
           (then
            (array.set $2
             (ref.as_non_null
              (local.get $31)
             )
             (local.get $5)
             (v128.const i32x4 0xa000c195 0xde0007ff 0x02e39900 0xff3d0eff)
            )
           )
          )
          (try_table (result i64) (catch_all $block3)
           (local.get $16)
          )
         )
        )
        (memory.init $0
         (i64.and
          (local.get $16)
          (i64.const 15)
         )
         (i32.const 2)
         (i32.const 7)
        )
       )
       (try $__t_0 (result (ref (exact $15))) (do (try (result (ref (exact $15))) (do 
         (ref.func $0)
        ) (delegate $__t_0))) (catch $tag$0
         (drop (pop (ref null $9)))
         (drop
          (br_on_cast $block (ref none) (ref none)
           (ref.cast (ref none)
            (ref.null none)
           )
          )
         )
         (ref.func $0)
        ) (catch $tag$1
(local.set $2
          (call $5
           (pop v128)
          )
         )
(if (global.get $__rt) (then (rethrow $__t_0)))
(ref.func $0)) (catch_all
         (ref.func $0)
        ))
      )
     )))
   (ref.cast (ref $12)
    (local.tee $36
     (struct.new $12
      (i32.const 32768)
      (struct.new_default $0)
      (local.get $21)
      (ref.null noextern)
      (struct.new_default $6)
     )
    )
   )
  )
 )
 (func $2 (type $31) (result externref)
  (extern.convert_any
   (call $1)
  )
 )
 (func $3 (type $32) (param $0 f32) (result f32)
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
 (func $4 (type $33) (param $0 f64) (result f64)
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
 (func $5 (type $34) (param $0 v128) (result v128)
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
 (global $__rt i32 (i32.const 1))
)
