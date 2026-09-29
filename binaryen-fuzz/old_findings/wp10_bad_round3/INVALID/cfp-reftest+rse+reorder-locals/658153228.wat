(module
 (rec
  (type $0 (struct (field i64)))
  (type $1 (sub (func (result (ref $6)))))
  (type $2 (sub (struct (field (ref null $6)) (field f32))))
  (type $3 (sub (array i16)))
  (type $4 (sub (func (param i32 f64) (result (ref $0)))))
  (type $5 (sub (struct (field (ref null $0)) (field (mut i8)))))
  (type $6 (func (result (ref $5))))
 )
 (rec
  (type $7 (sub (func (param (ref null $15) f32 (ref func) (ref null $16) f64) (result (ref null $8)))))
  (type $8 (sub (func (param funcref arrayref (ref struct)) (result (ref null $1)))))
  (type $9 (sub (descriptor $12) (struct (field i32) (field (ref null $11)) (field f64) (field (ref $19)) (field (mut f64)))))
  (type $10 (sub (array (ref $11))))
  (type $11 (sub (array (mut i32))))
  (type $12 (sub (describes $9) (struct (field externref) (field (mut (ref null $12))) (field (ref null $2)) (field v128))))
  (type $13 (sub (array (mut (ref $12)))))
  (type $14 (sub $1 (func (result (ref $6)))))
  (type $15 (sub final $10 (array (ref $11))))
  (type $16 (sub $5 (struct (field (ref null $0)) (field (mut i8)) (field (mut (ref $12))) (field f32))))
  (type $17 (sub $13 (array (mut (ref $12)))))
  (type $18 (struct (field (ref null $1)) (field (mut f64)) (field (mut i16)) (field (mut (ref null $14)))))
  (type $19 (sub final $14 (func (result (ref $6)))))
  (type $20 (sub final $2 (struct (field nullfuncref) (field f32))))
 )
 (type $21 (func))
 (type $22 (func (param i32)))
 (type $23 (struct))
 (type $24 (array i8))
 (type $25 (func (param externref)))
 (type $26 (func (param f32 f32 (ref null $15))))
 (type $27 (func (result i64 i32)))
 (type $28 (func (result (ref nofunc) i32 f32)))
 (type $29 (func (param (ref null $0))))
 (type $30 (func (param i64)))
 (type $31 (func (param f32)))
 (type $32 (func (param f64)))
 (type $33 (func (param v128)))
 (type $34 (func (param anyref)))
 (type $35 (func (param funcref)))
 (type $36 (func (param f64 (ref eq) v128) (result (ref null $15))))
 (type $37 (func (param i32 f32 externref stringref f32)))
 (type $38 (func (param i32 (ref eq) i64 i32 v128) (result i64 f32)))
 (type $39 (func (param (ref $5) i32) (result i64 i64)))
 (type $40 (func (param f64 i32 (ref $2)) (result f32)))
 (type $41 (func (result i64 f32)))
 (type $42 (func (result i64 i64)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_21" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $22) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $22) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $30) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $31) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $32) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $33) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $34) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $35) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $25) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $22) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $25) (param externref)))
 (global $global$0 (mut (ref $11)) (array.new_default $11
  (i32.const 41)
 ))
 (global $global$1 (ref $9) (struct.new_desc $9
  (i32.const -62)
  (array.new $11
   (i32.const -13237)
   (i32.const 81)
  )
  (f64.const -nan:0xfffffffffff92)
  (ref.func $0)
  (f64.const -3402823466385288598117041e14)
  (struct.new $12
   (string.const "")
   (struct.new_default $12)
   (struct.new $2
    (ref.null nofunc)
    (f32.const -nan:0x7ffff2)
   )
   (v128.const i32x4 0xa6c400ff 0x004302fa 0x941842af 0x90fda533)
  )
 ))
 (global $global$2 v128 (v128.const i32x4 0xe452fffa 0xffc3ffe2 0x66240b57 0x7c28f31a))
 (global $global$3 (mut i32) (i32.const -512))
 (global $global$4 (ref null $11) (array.new $11
  (i32.const 199)
  (i32.const 8)
 ))
 (global $global$5 (mut (ref null $5)) (struct.new_default $5))
 (global $global$6 arrayref (array.new_fixed $24 0))
 (global $global$7 i64 (i64.const 15))
 (global $global$8 f64 (f64.const -4294967296))
 (global $global$9 (ref null $18) (ref.null none))
 (global $global$10 (mut externref) (global.get $gimport$0))
 (global $global$11 (ref $12) (struct.new $12
  (global.get $gimport$0)
  (struct.new $12
   (global.get $gimport$0)
   (struct.new_default $12)
   (struct.new_default $2)
   (v128.const i32x4 0x0001ffaa 0xaf144175 0x642ea071 0xffff0000)
  )
  (ref.null none)
  (v128.const i32x4 0x4b800000 0x55000000 0x48800000 0xc1e80000)
 ))
 (global $global$12 i32 (i32.const -41))
 (global $global$13 (ref null $6) (ref.func $1))
 (global $global$14 (ref struct) (struct.new_default $23))
 (global $global$15 (mut exnref) (ref.null noexn))
 (global $global$16 (mut i64) (i64.const -3854245))
 (global $global$17 (mut f64) (f64.const 34359738368))
 (global $global$18 (mut (ref struct)) (global.get $global$14))
 (global $global$19 i64 (i64.const 4611686018427387905))
 (global $global$20 i64 (i64.const 32767))
 (global $global$21 (mut i64) (i64.const 37991))
 (global $global$22 (mut i64) (i64.const 9007199254740992))
 (global $global$23 f32 (f32.const 1836595328))
 (global $global$24 (mut f64) (f64.const -0.013000000000000012))
 (global $global$25 (ref $12) (global.get $global$11))
 (global $global$26 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 (i64.const 0) "*j\9bL\88P\e4\fe\9e\dd\92\f9$d\b2Cs")
 (data $1 "\e6T\9a\17}\a8\t\13G)\r\b7\n$\a8\1b\df5\8b")
 (data $2 "\a1U\ff78\e5\95:(\8b\c7\dd .g\b9i\bf\e1P\nS\a8\t")
 (data $3 (i64.const 17) "0a%\eaE\ab\b1\fb\a9g\c6([\8e?\1f\f1\ce")
 (table $0 i64 2 2 funcref)
 (table $1 2 2 exnref)
 (elem $0 (table $0) (i64.const 0) func $13)
 (elem declare func $1 $14 $15 $6 $fimport$1)
 (tag $tag$0 (type $29) (param (ref null $0)))
 (tag $tag$1 (type $21))
 (export "global$" (global $global$0))
 (export "global$_2" (global $global$2))
 (export "global$_3" (global $global$3))
 (export "global$_5" (global $global$5))
 (export "global$_7" (global $global$10))
 (export "global$_9" (global $global$11))
 (export "global$_11" (global $global$13))
 (export "global$_13" (global $global$15))
 (export "global$_15" (global $global$18))
 (export "global$_19" (global $global$24))
 (export "tag$" (tag $tag$0))
 (export "jstag" (tag $eimport$1))
 (export "ref_func_target_invoker" (func $2))
 (export "ref_func_target_1_invoker" (func $3))
 (export "func_invoker" (func $5))
 (export "func_15_invoker" (func $7))
 (export "func_17" (func $8))
 (export "func_20" (func $11))
 (export "func_20_invoker" (func $12))
 (export "func_23" (func $15))
 (export "func_23_invoker" (func $16))
 (func $0 (type $19) (result (ref $6))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $6) (result (ref $5))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $21)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (drop
   (call $0)
  )
 )
 (func $3 (type $21)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (drop
   (call $1)
  )
 )
 (@binaryen.js.called)
 (func $4 (type $36) (param $0 f64) (param $1 (ref eq)) (param $2 v128) (result (ref null $15))
  (local $3 f32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 funcref)
  (local $8 exnref)
  (local $9 i31ref)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $15)))
   (call $fimport$8
    (string.const "\c2\a3")
   )
   (try_table (result (ref (exact $15)))
    (array.new $15
     (array.new $11
      (global.get $global$12)
      (i32.and
       (i32.const 83)
       (i32.const 1023)
      )
     )
     (i32.and
      (i32.const 12)
      (i32.const 1023)
     )
    )
   )
  )
 )
 (func $5 (type $21)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (drop
   (call $4
    (f64.const 9223372036854775808)
    (array.new_fixed $24 0)
    (v128.const i32x4 0x3f800000 0xd6800000 0xfffe452e 0xcf800000)
   )
  )
  (drop
   (call $4
    (f64.const -nan:0xfffffffffff8b)
    (struct.new_default $23)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0xc3e00000)
   )
  )
 )
 (func $6 (type $19) (result (ref $6))
  (local $0 i64)
  (local $1 i64)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (ref.func $1)
 )
 (func $7 (type $21)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (drop
   (call $6)
  )
 )
 (func $8 (type $37) (param $0 i32) (param $1 f32) (param $2 externref) (param $3 stringref) (param $4 f32)
  (local $5 (ref $14))
  (local $6 (ref $11))
  (local $7 (ref $11))
  (local $8 (ref $11))
  (local $9 (ref eq))
  (local $10 (ref $0))
  (local $11 (ref $19))
  (local $12 f64)
  (local $13 f64)
  (local $14 i32)
  (local $15 i32)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block $block
   (call $fimport$5
    (v128.const i32x4 0xffda2d0e 0xc1efffff 0x00000000 0xc0500000)
   )
   (i32.atomic.store16 offset=22
    (i64.and
     (if (result i64)
      (i32.const -524287)
      (then
       (i64.atomic.load8_u offset=2
        (i64.and
         (try_table (result i64) (catch_all $block)
          (i64.const 2147483648)
         )
         (i64.const 15)
        )
       )
      )
      (else
       (i64.const -79)
      )
     )
     (i64.const 15)
    )
    (ref.is_null
     (ref.null none)
    )
   )
  )
 )
 (func $9 (type $38) (param $0 i32) (param $1 (ref eq)) (param $2 i64) (param $3 i32) (param $4 v128) (result i64 f32)
  (local $5 eqref)
  (local $6 (ref null $2))
  (local $7 (ref null $0))
  (local $8 (ref null $0))
  (local $9 (ref null $0))
  (local $10 (ref null $0))
  (local $11 (ref null $0))
  (local $12 (ref $11))
  (local $13 (ref $11))
  (local $14 (ref $11))
  (local $15 (ref $11))
  (local $16 (ref $11))
  (local $17 (ref $11))
  (local $18 (ref null $17))
  (local $19 (ref $17))
  (local $20 (ref $17))
  (local $21 (ref null $18))
  (local $22 (ref $3))
  (local $23 (ref $20))
  (local $24 (ref $20))
  (local $25 (ref $20))
  (local $26 (ref $20))
  (local $27 (ref $9))
  (local $28 (ref $14))
  (local $29 (ref i31))
  (local $30 (ref $5))
  (local $31 f32)
  (local $32 f32)
  (local $33 f32)
  (local $34 f32)
  (local $35 i64)
  (local $36 i64)
  (local $37 f64)
  (local $38 f64)
  (local $39 f64)
  (local $40 f64)
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
  (local $scratch (tuple i64 i32))
  (local $scratch_52 i64)
  (local $scratch_53 (tuple (ref nofunc) i32 f32))
  (local $scratch_54 i32)
  (local $scratch_55 (ref nofunc))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (local.set $23
   (struct.new $20
    (ref.null nofunc)
    (global.get $global$23)
   )
  )
  (local.set $12
   (global.get $global$0)
  )
  (block
   (call $fimport$4
    (global.get $global$24)
   )
   (block
    (call $fimport$3
     (global.get $global$23)
    )
    (table.set $1
     (i32.const 0)
     (block $block (result (ref exn))
      (try_table (catch_all_ref $block)
       (throw $tag$1)
      )
      (unreachable)
     )
    )
   )
   (block
    (v128.store offset=22 align=8
     (i64.const 29455)
     (global.get $global$2)
    )
    (loop $label
     (if
      (i32.eqz
       (global.get $global$26)
      )
      (then
       (global.set $global$26
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$26
      (i32.sub
       (global.get $global$26)
       (i32.const 1)
      )
     )
     (block
      (data.drop $2)
      (loop
       (if
        (i32.eqz
         (global.get $global$26)
        )
        (then
         (global.set $global$26
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$26
        (i32.sub
         (global.get $global$26)
         (i32.const 1)
        )
       )
       (nop)
      )
     )
     (drop
      (block (result i64)
       (local.set $scratch_52
        (tuple.extract 2 0
         (local.tee $scratch
          (if (type $27) (result i64 i32)
           (i32.const -15829)
           (then
            (call $fimport$3
             (local.tee $32
              (f32.ceil
               (local.get $33)
              )
             )
            )
            (br $label)
           )
           (else
            (tuple.make 2
             (i64.const -1558219905)
             (i32.const -26096)
            )
           )
          )
         )
        )
       )
       (local.set $50
        (tuple.extract 2 1
         (local.get $scratch)
        )
       )
       (local.get $scratch_52)
      )
     )
     (br_if $label
      (i32.eqz
       (local.get $50)
      )
     )
     (block
      (if
       (i32.eqz
        (local.get $0)
       )
       (then
        (block $block1
         (br_if $block1
          (i31.get_s
           (ref.i31
            (i32.const -48)
           )
          )
         )
         (block
          (drop
           (local.tee $41
            (i32.load8_s offset=4
             (i64.and
              (i64.const -2147483647)
              (i64.const 15)
             )
            )
           )
          )
          (block
           (nop)
           (return
            (tuple.make 2
             (i64.const -65535)
             (f32.const -8589934592)
            )
           )
          )
          (local.set $19
           (unreachable)
          )
         )
         (unreachable)
        )
       )
       (else
        (if
         (i32.lt_u
          (i32.add
           (local.tee $42
            (string.encode_wtf16_array
             (string.const "\c2\a3\ed\a0\80")
             (if (result (ref none))
              (i32.const -50)
              (then
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
             (i32x4.extract_lane 0
              (local.get $4)
             )
            )
           )
           (block (result i32)
            (drop
             (block (result (ref nofunc))
              (local.set $scratch_55
               (tuple.extract 3 0
                (local.tee $scratch_53
                 (loop (type $28) (result (ref nofunc) i32 f32)
                  (if
                   (i32.eqz
                    (global.get $global$26)
                   )
                   (then
                    (global.set $global$26
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$26
                   (i32.sub
                    (global.get $global$26)
                    (i32.const 1)
                   )
                  )
                  (tuple.make 3
                   (ref.as_non_null
                    (ref.null nofunc)
                   )
                   (i32.const 2147483647)
                   (f32.const -281474976710656)
                  )
                 )
                )
               )
              )
              (local.set $50
               (block (result i32)
                (local.set $scratch_54
                 (tuple.extract 3 1
                  (local.get $scratch_53)
                 )
                )
                (drop
                 (tuple.extract 3 2
                  (local.get $scratch_53)
                 )
                )
                (local.get $scratch_54)
               )
              )
              (local.get $scratch_55)
             )
            )
            (local.tee $43
             (local.get $50)
            )
           )
          )
          (array.len
           (local.tee $13
            (try_table (result (ref $11)) (catch_all $label)
             (try (result (ref $11))
              (do
               (local.get $12)
              )
              (catch $tag$0
               (drop (struct.get $0 0 (pop (ref null $0))))
               (global.get $global$0)
              )
              (catch_all
               (local.get $12)
              )
             )
            )
           )
          )
         )
         (then
          (array.fill $11
           (local.get $13)
           (local.get $42)
           (local.get $3)
           (local.get $43)
          )
         )
        )
       )
      )
      (return
       (tuple.make 2
        (i64.const -10657)
        (f32.const -2147483648)
       )
      )
     )
     (unreachable)
    )
    (local.set $14
     (local.set $12
      (unreachable)
     )
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $10 (type $39) (param $0 (ref $5)) (param $1 i32) (result i64 i64)
  (local $2 (ref null $9))
  (local $3 externref)
  (local $4 structref)
  (local $5 i32)
  (local $6 i32)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block
   (call $fimport$5
    (global.get $global$2)
   )
   (return
    (tuple.make 2
     (i64.const -10)
     (i64.const -30162)
    )
   )
  )
  (unreachable)
 )
 (func $11 (type $1) (result (ref $6))
  (local $0 (ref null $16))
  (local $1 (ref string))
  (local $2 (ref string))
  (local $3 (ref $11))
  (local $4 (ref $11))
  (local $5 (ref $11))
  (local $6 (ref $18))
  (local $7 structref)
  (local $8 (ref $13))
  (local $9 (ref $13))
  (local $10 (ref $17))
  (local $11 (ref $0))
  (local $12 (ref $19))
  (local $13 (ref (exact $12)))
  (local $14 (ref none))
  (local $15 (ref $16))
  (local $16 (ref $16))
  (local $17 (ref i31))
  (local $18 (ref i31))
  (local $19 (ref i31))
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 f32)
  (local $27 i64)
  (local $28 v128)
  (local $29 f64)
  (local $scratch (ref none))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $6)))
   (loop $label2
    (if
     (i32.eqz
      (global.get $global$26)
     )
     (then
      (global.set $global$26
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$26
     (i32.sub
      (global.get $global$26)
      (i32.const 1)
     )
    )
    (block $block4
     (loop $label
      (if
       (i32.eqz
        (global.get $global$26)
       )
       (then
        (global.set $global$26
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$26
       (i32.sub
        (global.get $global$26)
        (i32.const 1)
       )
      )
      (block $block3
       (drop
        (local.tee $23
         (string.compare
          (local.tee $1
           (if (result (ref string))
            (stringview_wtf16.get_codeunit
             (local.tee $2
              (string.const "")
             )
             (block (result i32)
              (local.set $25
               (try_table (result i32) (catch_all $label)
                (local.get $20)
               )
              )
              (local.get $25)
             )
            )
            (then
             (loop $label1 (result (ref string))
              (if
               (i32.eqz
                (global.get $global$26)
               )
               (then
                (global.set $global$26
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$26
               (i32.sub
                (global.get $global$26)
                (i32.const 1)
               )
              )
              (call $fimport$0
               (i32.const 0)
              )
              (br_if $label1
               (i32.eqz
                (i32.const -11743)
               )
              )
              (string.const "\e2\82\ac\c2\a3\ed\bd\88")
             )
            )
            (else
             (block $block (result (ref string))
              (block $block1
               (drop
                (if (result f64)
                 (string.measure_wtf16
                  (br_if $block
                   (string.const "\f0\90\8d\88\e2\82\ac")
                   (local.get $20)
                  )
                 )
                 (then
                  (block
                   (drop
                    (block (result (ref none))
                     (local.set $scratch
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                     (local.set $25
                      (i32.const -1171438)
                     )
                     (local.get $scratch)
                    )
                   )
                   (local.set $20
                    (local.get $25)
                   )
                   (drop
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                  (return
                   (ref.func $1)
                  )
                 )
                 (else
                  (f64.const 18446744073709551615)
                 )
                )
               )
               (if
                (try_table (result i32) (catch_all $block1)
                 (local.get $20)
                )
                (then
                 (block
                  (block
                   (nop)
                   (nop)
                  )
                  (call $fimport$3
                   (local.get $26)
                  )
                 )
                 (loop
                  (if
                   (i32.eqz
                    (global.get $global$26)
                   )
                   (then
                    (global.set $global$26
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$26
                   (i32.sub
                    (global.get $global$26)
                    (i32.const 1)
                   )
                  )
                  (block $block2
                   (drop
                    (i64.and
                     (local.get $27)
                     (i64.const 15)
                    )
                   )
                   (drop
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                   (memory.copy
                    (unreachable)
                    (unreachable)
                    (if (result i64)
                     (i32.const 127)
                     (then
                      (i64.extend32_s
                       (i64.const 4294967222)
                      )
                     )
                     (else
                      (br $block2)
                     )
                    )
                   )
                   (if
                    (i32.eqz
                     (if (result i32)
                      (i32.lt_u
                       (local.tee $21
                        (i32.atomic.load offset=4
                         (i64.and
                          (local.get $27)
                          (i64.const 15)
                         )
                        )
                       )
                       (array.len
                        (local.tee $4
                         (local.tee $3
                          (ref.as_non_null
                           (ref.null none)
                          )
                         )
                        )
                       )
                      )
                      (then
                       (array.get $11
                        (local.get $4)
                        (local.get $21)
                       )
                      )
                      (else
                       (local.get $20)
                      )
                     )
                    )
                    (then
                     (call $fimport$3
                      (local.get $26)
                     )
                    )
                    (else
                     (br_if $block1
                      (local.get $20)
                     )
                     (call $fimport$5
                      (local.tee $28
                       (v128.const i32x4 0xfc827e72 0x00de007c 0x00efe7fe 0x399e00a6)
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (else
                 (block
                  (nop)
                  (br $label2)
                 )
                 (local.set $6
                  (unreachable)
                 )
                )
               )
              )
              (br $block3)
             )
            )
           )
          )
          (local.get $1)
         )
        )
       )
       (drop
        (local.tee $22
         (i32.const -256)
        )
       )
       (loop
        (if
         (i32.eqz
          (global.get $global$26)
         )
         (then
          (global.set $global$26
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$26
         (i32.sub
          (global.get $global$26)
          (i32.const 1)
         )
        )
        (block
         (call $fimport$1
          (local.get $20)
         )
         (block
          (call $fimport$7
           (ref.cast (ref nofunc)
            (ref.cast (ref nofunc)
             (ref.as_non_null
              (ref.null nofunc)
             )
            )
           )
          )
          (return
           (ref.func $1)
          )
         )
         (unreachable)
        )
        (unreachable)
       )
       (local.set $11
        (local.set $10
         (local.set $9
          (local.set $8
           (unreachable)
          )
         )
        )
       )
      )
      (br_if $label
       (global.get $global$3)
      )
      (block
       (drop
        (global.get $global$24)
       )
       (block
        (nop)
        (br $block4)
       )
       (local.set $13
        (local.set $14
         (local.set $12
          (unreachable)
         )
        )
       )
      )
      (unreachable)
     )
     (unreachable)
    )
    (br_if $label2
     (i32.eqz
      (ref.eq
       (struct.new_default $23)
       (global.get $global$14)
      )
     )
    )
    (memory.copy
     (i64.and
      (try (result i64)
       (do
        (local.get $27)
       )
       (catch_all
        (local.tee $27
         (i64.const 65536)
        )
       )
      )
      (i64.const 15)
     )
     (i64.and
      (i64.reinterpret_f64
       (local.get $29)
      )
      (i64.const 15)
     )
     (local.get $27)
    )
   )
   (ref.func $1)
  )
 )
 (func $12 (type $21)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (drop
   (call $11)
  )
  (drop
   (call $11)
  )
 )
 (@binaryen.js.called)
 (func $13 (type $14) (result (ref $6))
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 v128)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  (local $14 f64)
  (local $15 f32)
  (local $16 (ref $13))
  (local $17 (ref null $0))
  (local $18 (ref null $0))
  (local $19 funcref)
  (local $20 (ref null $11))
  (local $21 (ref null $11))
  (local $22 eqref)
  (local $23 (ref struct))
  (local $24 i31ref)
  (local $25 (ref null $14))
  (local $26 (ref null $19))
  (local $27 (ref eq))
  (local $28 externref)
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (try (result (ref (exact $6)))
   (do
    (ref.func $1)
   )
   (catch $tag$0
    (drop (struct.get $0 0 (pop (ref null $0))))
    (ref.func $1)
   )
  )
 )
 (func $14 (type $7) (param $0 (ref null $15)) (param $1 f32) (param $2 (ref func)) (param $3 (ref null $16)) (param $4 f64) (result (ref null $8))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $15 (type $26) (param $0 f32) (param $1 f32) (param $2 (ref null $15))
  (local $3 (ref $18))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block
   (struct.set $18 3
    (local.tee $3
     (loop $label (result (ref (exact $18)))
      (if
       (i32.eqz
        (global.get $global$26)
       )
       (then
        (global.set $global$26
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$26
       (i32.sub
        (global.get $global$26)
        (i32.const 1)
       )
      )
      (call $fimport$7
       (ref.func $14)
      )
      (br_if $label
       (i32.eqz
        (i32.load8_u offset=22
         (i64.and
          (i64.const -2147483647)
          (i64.const 15)
         )
        )
       )
      )
      (struct.new $18
       (ref.func $6)
       (f64.const 65447)
       (i32.const -16)
       (ref.func $13)
      )
     )
    )
    (ref.func $6)
   )
   (return)
  )
  (unreachable)
 )
 (func $16 (type $21)
  (local $0 f64)
  (local $1 i32)
  (local $2 (ref null $0))
  (local $3 (ref null $19))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (call $15
   (f32.const -nan:0x7ffff2)
   (f32.const 0.13099999725818634)
   (array.new $15
    (global.get $global$0)
    (i32.and
     (i32.const 1)
     (i32.const 1023)
    )
   )
  )
  (call $15
   (f32.const -nan:0x7fffbf)
   (f32.const 9223372036854775808)
   (array.new $15
    (array.new_default $11
     (i32.and
      (i32.const 77)
      (i32.const 1023)
     )
    )
    (i32.and
     (i32.const 85)
     (i32.const 1023)
    )
   )
  )
  (call $15
   (f32.const -9223372036854775808)
   (f32.const -nan:0x7fffab)
   (array.new $15
    (if (result (ref $11))
     (i32.eqz
      (i16x8.extract_lane_s 6
       (v128.const i32x4 0x00018000 0x00007052 0xffc5ffff 0x9727ff81)
      )
     )
     (then
      (call $fimport$7
       (block $block (result (ref null $19))
        (call $fimport$4
         (select
          (f64.max
           (f64.mul
            (local.get $0)
            (local.get $0)
           )
           (block (result f64)
            (nop)
            (drop
             (br_on_cast $block (ref null $19) (ref null $19)
              (local.tee $3
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
             )
            )
            (local.tee $0
             (if (result f64)
              (local.get $1)
              (then
               (f64.load offset=3
                (i64.and
                 (i64.const -4294967296)
                 (i64.const 15)
                )
               )
              )
              (else
               (local.tee $0
                (f64.const -nan:0xffffffffffff1)
               )
              )
             )
            )
           )
          )
          (f64.sub
           (local.get $0)
           (f64.const -18446744073709551615)
          )
          (i31.get_u
           (ref.i31
            (i32.const -262143)
           )
          )
         )
        )
        (return)
       )
      )
      (try_table (result (ref $11))
       (global.get $global$0)
      )
     )
     (else
      (block $block1 (result (ref $11))
       (br_on_non_null $block1
        (global.get $global$0)
       )
       (call $fimport$4
        (local.tee $0
         (f64x2.extract_lane 0
          (i8x16.lt_u
           (global.get $global$2)
           (global.get $global$2)
          )
         )
        )
       )
       (return)
      )
     )
    )
    (i32.and
     (i32.const 93)
     (i32.const 1023)
    )
   )
  )
  (call $15
   (f32.const -nan:0x315f54)
   (f32.const 562949953421312)
   (ref.null none)
  )
  (call $15
   (f32.const 16777216)
   (f32.const 4294956032)
   (array.new $15
    (array.new_default $11
     (i32.and
      (i32.const 67)
      (i32.const 1023)
     )
    )
    (i32.and
     (i32.const 46)
     (i32.const 1023)
    )
   )
  )
  (call $15
   (f32.const -0.9210000038146973)
   (f32.const -3402823466385288598117041e14)
   (array.new $15
    (global.get $global$0)
    (i32.and
     (i32.const 20)
     (i32.const 1023)
    )
   )
  )
 )
 (func $17 (type $40) (param $0 f64) (param $1 i32) (param $2 (ref $2)) (result f32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 stringref)
  (local $8 (ref null $16))
  (local $9 (ref null $0))
  (if
   (i32.eqz
    (global.get $global$26)
   )
   (then
    (global.set $global$26
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$26
   (i32.sub
    (global.get $global$26)
    (i32.const 1)
   )
  )
  (block (result f32)
   (memory.copy
    (i64.and
     (i64.const -70368744177665)
     (i64.const 15)
    )
    (i64.and
     (try (result i64)
      (do
       (select
        (i64.const -66)
        (i64.const 274877906943)
        (i32.atomic.rmw16.xor_u acqrel offset=22
         (i64.and
          (loop $label (result i64)
           (if
            (i32.eqz
             (global.get $global$26)
            )
            (then
             (global.set $global$26
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$26
            (i32.sub
             (global.get $global$26)
             (i32.const 1)
            )
           )
           (block
            (call_ref $22
             (i16x8.extract_lane_u 7
              (v128.const i32x4 0xfff70000 0x80017359 0xb76effc0 0xffff0000)
             )
             (ref.func $fimport$1)
            )
            (call_ref $26
             (global.get $global$23)
             (global.get $global$23)
             (array.new $15
              (array.new $11
               (local.get $1)
               (i32.and
                (i32.const 80)
                (i32.const 1023)
               )
              )
              (i32.and
               (i32.const 63)
               (i32.const 1023)
              )
             )
             (ref.func $15)
            )
           )
           (br_if $label
            (ref.eq
             (ref.i31
              (i32.const 14617)
             )
             (local.tee $8
              (ref.null none)
             )
            )
           )
           (i64.const -524288)
          )
          (i64.const 15)
         )
         (local.get $1)
        )
       )
      )
      (catch $tag$0
       (local.set $9 (pop (ref null $0)))
       (local.get $5)
      )
     )
     (i64.const 15)
    )
    (i64.const -80)
   )
   (f32.const 4294935040)
  )
 )
)
