(module
 (rec
  (type $0 (sub (descriptor $3) (struct (field (mut (ref null $2))) (field (mut i8)) (field (mut i8)) (field (ref null $1)) (field (mut (ref null $0))) (field i32))))
  (type $1 (sub (struct (field i32) (field (mut structref)) (field (mut (ref null $0))) (field (mut i64)) (field i8) (field (mut (ref null $0))))))
  (type $2 (sub (func (result v128))))
  (type $3 (sub (describes $0) (descriptor $4) (struct (field (mut i8)) (field (mut exnref)) (field (mut i16)) (field (ref $1)))))
  (type $4 (sub (describes $3) (struct (field externref) (field (ref null $4)) (field (ref null $4)) (field (mut (ref null $2))) (field i64) (field (mut (ref null $0))))))
 )
 (type $5 (func (result nullref (ref exn) i32 f32 f64 v128)))
 (rec
  (type $6 (sub (array (mut i16))))
  (type $7 (array i16))
 )
 (rec
  (type $8 (array (mut v128)))
  (type $9 (sub (array (mut i8))))
  (type $10 (struct (field (mut i8)) (field (mut exnref))))
 )
 (rec
  (type $11 (sub (array (mut v128))))
  (type $12 (sub (func (result v128))))
  (type $13 (sub $0 (descriptor $15) (struct (field (mut (ref null $2))) (field (mut i8)) (field (mut i8)) (field (ref null $1)) (field (mut (ref null $0))) (field i32))))
  (type $14 (struct (field (mut v128)) (field (mut exnref)) (field (mut (ref $10))) (field v128) (field (mut (ref null $3))) (field (ref $15))))
  (type $15 (sub $3 (describes $13) (descriptor $16) (struct (field (mut i8)) (field (mut exnref)) (field (mut i16)) (field (ref $1)) (field (mut (ref $16))))))
  (type $16 (sub final $4 (describes $15) (struct (field externref) (field (ref $4)) (field (ref null $16)) (field (mut (ref null $2))) (field i64) (field (mut (ref null $0))))))
 )
 (rec
  (type $17 (sub (struct (field f64) (field (mut (ref $13))))))
  (type $18 (func (param (ref null $21) f64 f32 (ref $10) (ref null $12) v128) (result f32)))
  (type $19 (array i8))
  (type $20 (sub final $6 (array (mut i16))))
  (type $21 (sub (struct (field funcref) (field f64))))
 )
 (type $22 (func (param f32)))
 (type $23 (func))
 (type $24 (func (param i32)))
 (type $25 (func (param f64)))
 (type $26 (func (param i32 i32) (result i32)))
 (type $27 (func (param i64 i64)))
 (type $28 (func (param i64)))
 (type $29 (func (param v128)))
 (type $30 (func (param anyref)))
 (type $31 (func (param funcref)))
 (type $32 (func (param externref)))
 (type $33 (array i8))
 (rec
  (type $34 (func (param (ref i31)) (result (ref $0) i64 (ref $8) i32 i32 i64)))
  (type $35 (sub (struct (field i8) (field (mut i8)))))
  (type $36 (sub (func (result (ref $8)))))
 )
 (import "fuzzing-support" "throw" (func $fimport$0 (type $24) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $24) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $28) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $22) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $25) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $29) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $30) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $31) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $32) (param externref)))
 (import "fuzzing-support" "sleep" (func $fimport$9 (type $26) (param i32 i32) (result i32)))
 (global $global$0 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 "cX9?\07\b7\03")
 (data $1 (i64.const 0) "\d0\a2\17\c8\9d|\e3\e7\12\c9\ef;")
 (data $2 "\a0\a0\d4\bc\0b3\98||\8b\7f\9a\e5\d5\81")
 (data $3 ".ZJ")
 (table $0 3 funcref)
 (table $1 6 exnref)
 (elem $0 (table $0) (i32.const 0) func)
 (elem declare func $0 $1 $fimport$4 $fimport$9)
 (tag $tag$0 (type $22) (param f32))
 (tag $tag$1 (type $27) (param i64 i64))
 (tag $tag$2 (type $23))
 (export "tag$_1" (tag $tag$1))
 (export "func_invoker" (func $3))
 (func $0 (type $2) (result v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
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
 (func $1 (type $12) (result v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
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
 (@binaryen.js.called)
 (func $2 (type $18) (param $0 (ref null $21)) (param $1 f64) (param $2 f32) (param $3 (ref $10)) (param $4 (ref null $12)) (param $5 v128) (result f32)
  (local $6 (ref $34))
  (local $7 (ref $36))
  (local $8 arrayref)
  (local $9 (ref null $11))
  (local $10 (ref null $7))
  (local $11 (ref $19))
  (local $12 (ref $19))
  (local $13 structref)
  (local $14 (ref none))
  (local $15 (ref $17))
  (local $16 (ref (exact $3)))
  (local $17 (ref $21))
  (local $18 (ref $21))
  (local $19 (ref $1))
  (local $20 i31ref)
  (local $21 nullref)
  (local $22 (ref $13))
  (local $23 exnref)
  (local $24 (ref $20))
  (local $25 (ref null $16))
  (local $26 (ref $16))
  (local $27 (ref i31))
  (local $28 (ref array))
  (local $29 eqref)
  (local $30 (ref string))
  (local $31 (ref $12))
  (local $32 f32)
  (local $33 f32)
  (local $34 f32)
  (local $35 f32)
  (local $36 f32)
  (local $37 f32)
  (local $38 i64)
  (local $39 i64)
  (local $40 i64)
  (local $41 i64)
  (local $42 i64)
  (local $43 i64)
  (local $44 i64)
  (local $45 i64)
  (local $46 i64)
  (local $47 i64)
  (local $48 i64)
  (local $49 f64)
  (local $50 i32)
  (local $51 i32)
  (local $52 i32)
  (local $53 i32)
  (local $54 i32)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
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
  (local.set $18
   (struct.new_default $21)
  )
  (local.set $11
   (array.new_default $19
    (i32.and
     (i32.const 6)
     (i32.const 1023)
    )
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$0)
    )
    (then
     (global.set $global$0
      (i32.const 100)
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
   (table.set $1
    (i32.const 2)
    (ref.null noexn)
   )
   (br_if $label
    (i32.const -16054)
   )
   (drop
    (ref.func $0)
   )
   (drop
    (i32.const -3715204)
   )
   (drop
    (if (result i32)
     (i32.lt_u
      (local.tee $51
       (local.get $50)
      )
      (array.len
       (local.tee $14
        (try_table (result (ref none)) (catch_all $label)
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
      )
     )
     (then
      (drop
       (local.get $14)
      )
      (drop
       (local.get $51)
      )
      (unreachable)
     )
     (else
      (local.get $50)
     )
    )
   )
   (drop
    (try (result nullref)
     (do
      (ref.null none)
     )
     (catch_all
      (loop $label1 (result (ref none))
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 100)
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
        (i32.eqz
         (i32.const -255)
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
    (try_table (result (ref none)) (catch_all $label)
     (ref.as_non_null
      (ref.null none)
     )
    )
   )
   (drop
    (if (result i32)
     (local.tee $50
      (local.get $50)
     )
     (then
      (struct.set $17 1
       (local.tee $15
        (ref.as_non_null
         (ref.null none)
        )
       )
       (ref.as_non_null
        (ref.null none)
       )
      )
      (if (result i32)
       (i32.const -65535)
       (then
        (i32.const -1)
       )
       (else
        (select
         (i32.add
          (local.get $50)
          (i32.const 17)
         )
         (i32.const -14316)
         (i32.div_u
          (f64.le
           (f64x2.extract_lane 0
            (local.get $5)
           )
           (f64.const -nan:0xfffffffb11d06)
          )
          (i32.const 35)
         )
        )
       )
      )
     )
     (else
      (block $block (result i32)
       (call $fimport$2
        (i64.const 255)
       )
       (br_if $block
        (i32.const 1)
        (i32.eqz
         (i32.const -8192)
        )
       )
      )
     )
    )
   )
   (block
    (nop)
    (br $label)
   )
   (local.set $16
    (unreachable)
   )
  )
  (local.set $31
   (local.set $30
    (local.set $28
     (local.set $27
      (local.set $12
       (local.set $22
        (local.set $3
         (unreachable)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $3 (type $23)
  (local $0 f32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 f64)
  (local $18 v128)
  (local $19 v128)
  (local $20 funcref)
  (local $21 nullref)
  (local $22 (ref exn))
  (local $23 (ref func))
  (local $24 (ref eq))
  (local $25 (ref $13))
  (local $26 (ref (exact $3)))
  (local $27 (ref (exact $3)))
  (local $28 (ref $7))
  (local $29 (ref $11))
  (local $30 (ref $11))
  (local $31 (ref null $12))
  (local $32 externref)
  (local $33 (ref i31))
  (local $34 (ref i31))
  (local $scratch f64)
  (local $scratch_36 f32)
  (local $scratch_37 i32)
  (local $scratch_38 (ref exn))
  (local $scratch_39 nullref)
  (local $scratch_40 v128)
  (local $scratch_41 (tuple i64 i64))
  (local $scratch_42 i64)
  (local $scratch_43 (tuple i64 i64))
  (local $scratch_44 i64)
  (local $scratch_45 (tuple nullref (ref exn) i32 f32 f64 v128))
  (local $scratch_46 f64)
  (local $scratch_47 f32)
  (local $scratch_48 i32)
  (local $scratch_49 (ref exn))
  (local $scratch_50 nullref)
  (local $51 (tuple i64 i64))
  (local $52 (tuple i64 i64))
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (global.set $global$0
     (i32.const 100)
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
  (local.set $25
   (struct.new_desc $13
    (ref.func $0)
    (i32.const -3)
    (i32.const -1892138449)
    (ref.null none)
    (ref.as_non_null
     (ref.null none)
    )
    (i32.const -7584)
    (ref.as_non_null
     (ref.null none)
    )
   )
  )
  (local.set $21
   (block (result nullref)
    (local.set $scratch_39
     (ref.null none)
    )
    (local.set $22
     (block (result (ref exn))
      (local.set $scratch_38
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$2)
        )
        (unreachable)
       )
      )
      (local.set $11
       (block (result i32)
        (local.set $scratch_37
         (i32.const 129)
        )
        (local.set $1
         (block (result f32)
          (local.set $scratch_36
           (f32.const -nan:0x7ffffb)
          )
          (local.set $17
           (block (result f64)
            (local.set $scratch
             (f64.const -nan:0xfffffffffffa1)
            )
            (local.set $18
             (v128.const i32x4 0xfb414614 0xffffffff 0xfffffff2 0xffffffff)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_36)
         )
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
  (drop
   (call $2
    (struct.new $21
     (try_table (result (ref (exact $2)))
      (loop $label2 (result (ref (exact $2)))
       (if
        (i32.eqz
         (global.get $global$0)
        )
        (then
         (global.set $global$0
          (i32.const 100)
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
       (block $block1
        (memory.fill
         (i64.and
          (try_table (result i64) (catch_all $block1)
           (i64.const 2147483648)
          )
          (i64.const 15)
         )
         (i32.const -20374)
         (i64x2.extract_lane 1
          (f64x2.ceil
           (v128.const i32x4 0x8001ffdd 0xfff7ffe1 0x00010001 0xffb800ff)
          )
         )
        )
        (call $fimport$1
         (if (result i32)
          (i32.const 255)
          (then
           (drop
            (br_on_null $label2
             (loop $label (result (ref string))
              (if
               (i32.eqz
                (global.get $global$0)
               )
               (then
                (global.set $global$0
                 (i32.const 100)
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
               (call $fimport$1
                (try (result i32)
                 (do
                  (select
                   (i32.const -32766)
                   (i32.const -71)
                   (i32.const -120)
                  )
                 )
                 (catch $tag$0
                  (local.set $0 (f32.mul (pop f32) (f32.const -1)))
                  (drop
                   (br_on_null $label
                    (array.new_fixed $33 0)
                   )
                  )
                  (loop $label1 (result i32)
                   (if
                    (i32.eqz
                     (global.get $global$0)
                    )
                    (then
                     (global.set $global$0
                      (i32.const 100)
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
                    (br_on_null $block1
                     (local.get $20)
                    )
                   )
                   (drop
                    (block (result v128)
                     (local.set $scratch_40
                      (v128.const i32x4 0xffff8334 0xffffffff 0x00000000 0x80000000)
                     )
                     (local.set $5
                      (f32.const 36028797018963968)
                     )
                     (local.get $scratch_40)
                    )
                   )
                   (call $fimport$3
                    (local.get $5)
                   )
                   (br_if $label1
                    (i32.eqz
                     (i32.const 410545753)
                    )
                   )
                   (i32.const -7246537)
                  )
                 )
                 (catch $tag$1
                  (throw $tag$1 (pop (tuple i64 i64)))
                  (block (result i32)
                   (local.set $6
                    (block (result i64)
                     (local.set $scratch_42
                      (tuple.extract 2 0
                       (local.tee $scratch_41
                        (local.get $51)
                       )
                      )
                     )
                     (local.set $7
                      (tuple.extract 2 1
                       (local.get $scratch_41)
                      )
                     )
                     (local.get $scratch_42)
                    )
                   )
                   (i32.const -10477)
                  )
                 )
                )
               )
               (call $fimport$7
                (ref.null nofunc)
               )
              )
              (drop
               (block (result nullref)
                (local.set $scratch_50
                 (tuple.extract 6 0
                  (local.tee $scratch_45
                   (try (type $5) (result nullref (ref exn) i32 f32 f64 v128)
                    (do
                     (tuple.make 6
                      (local.get $21)
                      (local.get $22)
                      (local.get $11)
                      (local.get $1)
                      (local.get $17)
                      (local.get $18)
                     )
                    )
                    (catch $tag$0
                     (local.set $2 (call $__popsink_0 (pop f32)))
                     (block (type $5) (result nullref (ref exn) i32 f32 f64 v128)
                      (nop)
                      (tuple.make 6
                       (local.get $21)
                       (local.get $22)
                       (local.get $11)
                       (local.get $1)
                       (local.get $17)
                       (local.get $18)
                      )
                     )
                    )
                    (catch $tag$1
                     (throw $tag$1 (pop (tuple i64 i64)))
                     (block (type $5) (result nullref (ref exn) i32 f32 f64 v128)
                      (local.set $8
                       (block (result i64)
                        (local.set $scratch_44
                         (tuple.extract 2 0
                          (local.tee $scratch_43
                           (local.get $52)
                          )
                         )
                        )
                        (local.set $9
                         (tuple.extract 2 1
                          (local.get $scratch_43)
                         )
                        )
                        (local.get $scratch_44)
                       )
                      )
                      (tuple.make 6
                       (ref.null none)
                       (block $block2 (result (ref exn))
                        (try_table (catch_all_ref $block2)
                         (throw $tag$0
                          (local.tee $3
                           (local.tee $4
                            (f32.const -1)
                           )
                          )
                         )
                        )
                        (unreachable)
                       )
                       (i32.const -63)
                       (f32.const -274877906944)
                       (f64.const -2147483647.12)
                       (v128.const i32x4 0x00000000 0xfff80000 0x00000000 0x00000000)
                      )
                     )
                    )
                    (catch_all
                     (tuple.make 6
                      (local.get $21)
                      (local.get $22)
                      (local.get $11)
                      (local.get $1)
                      (local.get $17)
                      (local.get $18)
                     )
                    )
                   )
                  )
                 )
                )
                (drop
                 (block (result (ref exn))
                  (local.set $scratch_49
                   (tuple.extract 6 1
                    (local.get $scratch_45)
                   )
                  )
                  (local.set $16
                   (block (result i32)
                    (local.set $scratch_48
                     (tuple.extract 6 2
                      (local.get $scratch_45)
                     )
                    )
                    (drop
                     (block (result f32)
                      (local.set $scratch_47
                       (tuple.extract 6 3
                        (local.get $scratch_45)
                       )
                      )
                      (drop
                       (block (result f64)
                        (local.set $scratch_46
                         (tuple.extract 6 4
                          (local.get $scratch_45)
                         )
                        )
                        (drop
                         (tuple.extract 6 5
                          (local.get $scratch_45)
                         )
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
                (local.get $scratch_50)
               )
              )
              (br_if $label
               (i32.eqz
                (local.get $16)
               )
              )
              (string.const "\f0\90\8d\88")
             )
            )
           )
           (call $fimport$7
            (local.tee $23
             (ref.func $fimport$4)
            )
           )
           (br $label2)
          )
          (else
           (i32.const -30)
          )
         )
        )
       )
       (br_if $label2
        (loop $label3 (result i32)
         (if
          (i32.eqz
           (global.get $global$0)
          )
          (then
           (global.set $global$0
            (i32.const 100)
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
          (if
           (i32.eqz
            (call_ref $26
             (i32.const -13227)
             (i32.const -11)
             (ref.func $fimport$9)
            )
           )
           (then
            (block
             (call $fimport$5
              (i16x8.gt_s
               (local.tee $19
                (v128.const i32x4 0xc2b00000 0x5a800000 0x52800000 0xfffffd50)
               )
               (local.get $19)
              )
             )
             (block
              (call_ref $25
               (f64.const 562949953421312.1)
               (ref.func $fimport$4)
              )
              (br $label3)
             )
             (unreachable)
            )
            (unreachable)
           )
          )
          (if (result i32)
           (i32.lt_u
            (local.tee $14
             (i32.const -41)
            )
            (array.len
             (local.tee $28
              (try (result (ref (exact $7)))
               (do
                (array.new_default $7
                 (i32.and
                  (i32.const 7)
                  (i32.const 1023)
                 )
                )
               )
               (catch_all
                (array.new_default $7
                 (i32.and
                  (i32.const 9)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
            )
           )
           (then
            (array.get_u $7
             (local.get $28)
             (local.get $14)
            )
           )
           (else
            (i32.const -50)
           )
          )
         )
        )
       )
       (ref.func $0)
      )
     )
     (f64.add
      (f64.const 17592186044415)
      (f64.const -16777216.634)
     )
    )
    (f64.const 4294967248)
    (f32.const -16777216)
    (struct.new $10
     (i32.const -160298693)
     (block $block3 (result (ref exn))
      (try_table (catch_all_ref $block3)
       (if
        (i32.eqz
         (i32.const -8165)
        )
        (then
         (call $fimport$2
          (local.get $10)
         )
         (drop
          (struct.new_default $21)
         )
         (block
          (call $fimport$2
           (i64.const -1433020)
          )
          (return)
         )
         (unreachable)
        )
        (else
         (call $fimport$8
          (local.tee $32
           (ref.null noextern)
          )
         )
         (block
          (return)
         )
         (unreachable)
        )
       )
       (unreachable)
      )
      (unreachable)
     )
    )
    (ref.func $1)
    (v128.const i32x4 0xffd78001 0xff970000 0x00bfffbf 0xffc4ff80)
   )
  )
 )
 (type $__sinkT_0 (func (param f32) (result f32)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
