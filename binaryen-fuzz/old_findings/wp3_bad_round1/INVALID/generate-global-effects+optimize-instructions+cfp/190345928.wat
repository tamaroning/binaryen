(module
 (rec
  (type $0 (sub (func (param v128 i64 i64) (result f64 i64))))
  (type $1 (array i8))
  (type $2 (sub (struct (field i8) (field f64) (field (mut v128)) (field i32) (field (mut i16)))))
  (type $3 (array (ref $13)))
  (type $4 (sub (array (mut v128))))
  (type $5 (sub $2 (struct (field i8) (field f64) (field (mut v128)) (field i32) (field (mut i16)) (field (mut f32)))))
  (type $6 (sub (struct (field (mut (ref $8))) (field (ref $8)) (field f32))))
  (type $7 (sub (array (mut (ref $11)))))
  (type $8 (sub $0 (func (param v128 i64 i64) (result f64 i64))))
  (type $9 (sub (func (param f32 eqref) (result i32))))
  (type $10 (sub (struct (field (mut (ref $12))) (field (mut (ref null $7))) (field (mut i64)) (field (ref null $5)))))
  (type $11 (sub $2 (descriptor $13) (struct (field i8) (field f64) (field (mut v128)) (field i32) (field (mut i16)))))
  (type $12 (sub $2 (struct (field i8) (field f64) (field (mut v128)) (field i32) (field (mut i16)))))
  (type $13 (sub (describes $11) (struct (field externref) (field i16) (field i16))))
  (type $14 (sub final $10 (struct (field (mut (ref $12))) (field (mut (ref null $7))) (field (mut i64)) (field (ref $5)) (field (ref null $8)) (field (ref $12)))))
  (type $15 (struct (field (ref null $12)) (field (mut i32)) (field (ref null $6)) (field i8)))
  (type $16 (sub (func)))
 )
 (type $17 (func))
 (type $18 (array (mut i16)))
 (type $19 (func (result f64 i64)))
 (type $20 (array i8))
 (type $21 (func (param i32)))
 (type $22 (func (param anyref)))
 (type $23 (func (result i32 (ref null $7) i64 i64)))
 (type $24 (func (param (ref $12)) (result i32)))
 (type $25 (func (param (ref null $12))))
 (type $26 (func (param i64)))
 (type $27 (func (param f32)))
 (type $28 (func (param f64)))
 (type $29 (func (param v128)))
 (type $30 (func (param funcref)))
 (type $31 (func (param externref)))
 (type $32 (func (param i32) (result i32)))
 (type $33 (struct))
 (type $34 (func (param f32) (result f32)))
 (type $35 (func (param f64) (result f64)))
 (type $36 (func (param v128) (result v128)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $21) (param i32)))
 (import "fuzzing-support" "log-i32" (func $fimport$1 (type $21) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$2 (type $26) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$3 (type $27) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$4 (type $28) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$5 (type $29) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$6 (type $22) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$7 (type $30) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$8 (type $31) (param externref)))
 (import "fuzzing-support" "call-export-catch" (func $fimport$9 (type $32) (param i32) (result i32)))
 (global $global$0 (mut (ref null $16)) (ref.null nofunc))
 (global $global$1 (mut (ref null $11)) (struct.new_default_desc $11
  (struct.new_default $13)
 ))
 (global $global$2 (mut (ref null $16)) (ref.null nofunc))
 (global $global$3 (mut f32) (f32.const 4398046511104))
 (global $global$4 (mut funcref) (ref.null nofunc))
 (global $global$5 (mut (ref null $10)) (struct.new $10
  (struct.new $12
   (i32.const -48148719)
   (f64.const -2147483648)
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (i32.const -1048576)
   (i32.const 2)
  )
  (array.new $7
   (struct.new_desc $11
    (i32.const -4)
    (f64.const 0)
    (v128.const i32x4 0x27b2a000 0x62ac00f7 0xfe21ff5d 0xff00c23d)
    (i32.const 65441)
    (i32.const 421600633)
    (struct.new $13
     (ref.null noextern)
     (i32.const -28159)
     (i32.const -8245736)
    )
   )
   (i32.const 18)
  )
  (i64.const 4194304)
  (struct.new_default $5)
 ))
 (global $global$6 (mut (ref array)) (array.new_fixed $20 0))
 (global $global$7 (mut f32) (f32.const 0))
 (global $global$8 f64 (f64.const -70368744177663))
 (global $global$9 i32 (i32.const -32767))
 (global $global$10 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 "6g\999\af")
 (data $1 "\b8/\9b\de:H\f5\b8wh\ab\99\ee\80\b3\157\c7\a4d\b1\ad")
 (table $0 8 funcref)
 (table $1 7 7 exnref)
 (elem $0 (table $0) (i32.const 0) func $1)
 (elem declare func $0 $10 $11 $7 $9 $fimport$6)
 (tag $tag$0 (type $25) (param (ref null $12)))
 (export "global$" (global $global$0))
 (export "global$_4" (global $global$8))
 (export "func" (func $0))
 (export "func_11" (func $1))
 (export "func_11_invoker" (func $2))
 (export "func_13" (func $3))
 (export "func_13_invoker" (func $4))
 (export "func_15" (func $5))
 (export "func_17_invoker" (func $8))
 (export "func_20_invoker" (func $11))
 (@binaryen.js.called)
 (func $0 (type $16)
  (local $0 i64)
  (local $scratch i32)
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
   (call $fimport$2
    (if (result i64)
     (ref.test (ref string)
      (if (result (ref string))
       (i32.eqz
        (i32.const 128)
       )
       (then
        (string.const "\f0\90\8d\88")
       )
       (else
        (block $block1
         (try_table (catch_all $block)
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
           (table.set $0
            (i32.const 4)
            (ref.as_non_null
             (ref.null nofunc)
            )
           )
           (br_if $label
            (i32.eqz
             (string.measure_wtf16
              (string.const "\ed\a0\80")
             )
            )
           )
          )
          (br_if $block1
           (i32.const -15279)
          )
          (nop)
          (br $block)
         )
         (unreachable)
        )
        (br $block)
       )
      )
     )
     (then
      (i64x2.extract_lane 0
       (call $14
        (f64x2.splat
         (call $13
          (global.get $global$8)
         )
        )
       )
      )
     )
     (else
      (memory.init $0
       (i64.and
        (i64.atomic.load32_u offset=4
         (i64.and
          (i64.const 129)
          (i64.const 15)
         )
        )
        (i64.const 15)
       )
       (i32.const 2)
       (i32.const 1)
      )
      (br $block)
     )
    )
   )
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
    (call $fimport$5
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (drop
     (block (result i32)
      (local.set $scratch
       (i32.const -49)
      )
      (drop
       (i64.const -34359738368)
      )
      (local.get $scratch)
     )
    )
    (br_if $label1
     (i32.eqz
      (i32.load offset=3
       (i64.and
        (local.tee $0
         (local.get $0)
        )
        (i64.const 15)
       )
      )
     )
    )
   )
   (table.set $0
    (i32.const 2)
    (ref.func $0)
   )
  )
 )
 (@binaryen.js.called)
 (func $1 (type $0) (param $0 v128) (param $1 i64) (param $2 i64) (result f64 i64)
  (local $3 (ref null $7))
  (local $4 (ref $14))
  (local $5 exnref)
  (local $6 externref)
  (local $7 externref)
  (local $8 externref)
  (local $9 anyref)
  (local $10 stringref)
  (local $11 f64)
  (local $12 f64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 f32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local.set $0
   (call $14
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
  (tuple.make 2
   (f64.const 34)
   (i64.const 30525)
  )
 )
 (func $2 (type $17)
  (local $scratch (tuple f64 i64))
  (local $scratch_1 f64)
  (local $scratch_2 (tuple f64 i64))
  (local $scratch_3 f64)
  (local $scratch_4 (tuple f64 i64))
  (local $scratch_5 f64)
  (local $scratch_6 (tuple f64 i64))
  (local $scratch_7 f64)
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
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $1
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (i64.const 65470)
        (i64.const -6)
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
   (block (result f64)
    (local.set $scratch_3
     (tuple.extract 2 0
      (local.tee $scratch_2
       (call $1
        (v128.const i32x4 0x00000000 0xc1300000 0x00000000 0x40652000)
        (i64.const -9)
        (i64.const 65475)
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
   (block (result f64)
    (local.set $scratch_5
     (tuple.extract 2 0
      (local.tee $scratch_4
       (call $1
        (v128.const i32x4 0x990100ff 0x01d5007f 0x5e57b2ed 0xbf1e7e00)
        (i64.const 4294967296)
        (i64.const -70)
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
   (block (result f64)
    (local.set $scratch_7
     (tuple.extract 2 0
      (local.tee $scratch_6
       (call $1
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (i64.const 2147483648)
        (i64.const -9007199254740992)
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
 (func $3 (type $23) (result i32 (ref null $7) i64 i64)
  (local $0 f32)
  (local $1 f32)
  (local $2 f64)
  (local $3 (ref null $6))
  (local $4 (ref null $16))
  (local $5 (ref null $4))
  (local $6 anyref)
  (local $7 funcref)
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
   (tuple.make 4
    (i32.const -4194304)
    (array.new $7
     (struct.new_default_desc $11
      (struct.new_default $13)
     )
     (i32.and
      (i32.const 34)
      (i32.const 1023)
     )
    )
    (i64.const -8589934592)
    (i64.const -77)
   )
  )
 )
 (func $4 (type $17)
  (local $scratch (tuple i32 (ref null $7) i64 i64))
  (local $scratch_1 i64)
  (local $scratch_2 (ref null $7))
  (local $scratch_3 i32)
  (local $scratch_4 (tuple i32 (ref null $7) i64 i64))
  (local $scratch_5 i64)
  (local $scratch_6 (ref null $7))
  (local $scratch_7 i32)
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
    (local.set $scratch_3
     (tuple.extract 4 0
      (local.tee $scratch
       (call $3)
      )
     )
    )
    (drop
     (block (result (ref null $7))
      (local.set $scratch_2
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result i64)
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
  (drop
   (block (result i32)
    (local.set $scratch_7
     (tuple.extract 4 0
      (local.tee $scratch_4
       (call $3)
      )
     )
    )
    (drop
     (block (result (ref null $7))
      (local.set $scratch_6
       (tuple.extract 4 1
        (local.get $scratch_4)
       )
      )
      (drop
       (block (result i64)
        (local.set $scratch_5
         (tuple.extract 4 2
          (local.get $scratch_4)
         )
        )
        (drop
         (tuple.extract 4 3
          (local.get $scratch_4)
         )
        )
        (local.get $scratch_5)
       )
      )
      (local.get $scratch_6)
     )
    )
    (local.get $scratch_7)
   )
  )
 )
 (func $5 (type $17)
  (local $0 f32)
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
 )
 (func $6 (type $8) (param $0 v128) (param $1 i64) (param $2 i64) (result f64 i64)
  (local $3 (ref eq))
  (local $4 arrayref)
  (local $5 externref)
  (local $6 externref)
  (local $7 stringref)
  (local $8 (ref $7))
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 f32)
  (local $13 v128)
  (local $14 v128)
  (local.set $0
   (call $14
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
  (drop
   (ref.null nofunc)
  )
  (return
   (tuple.make 2
    (f64.const 0)
    (i64.const 4294962438)
   )
  )
 )
 (func $7 (type $9) (param $0 f32) (param $1 eqref) (result i32)
  (local.set $0
   (call $12
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
  (return
   (global.get $global$9)
  )
 )
 (func $8 (type $17)
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
   (call $7
    (f32.const -8191)
    (ref.null none)
   )
  )
 )
 (func $9 (type $8) (param $0 v128) (param $1 i64) (param $2 i64) (result f64 i64)
  (local $3 arrayref)
  (local $4 externref)
  (local $5 (ref $12))
  (local $6 i31ref)
  (local $7 (ref string))
  (local $8 (ref string))
  (local $9 (ref $18))
  (local $10 (ref $18))
  (local $11 (ref null $11))
  (local $12 (ref $7))
  (local $13 (ref $7))
  (local $14 (ref $5))
  (local $15 nullexternref)
  (local $16 (ref null $12))
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 f32)
  (local $27 f32)
  (local $28 f64)
  (local.set $0
   (call $14
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
  (local.set $7
   (string.const "")
  )
  (local.set $6
   (ref.as_non_null
    (local.get $6)
   )
  )
  (block $block (type $19) (result f64 i64)
   (nop)
   (br_if $block
    (tuple.make 2
     (f64.const 3402823466385288598117041e14)
     (i64.const 4294967291)
    )
    (if (result i32)
     (i32.eqz
      (i32.const 255)
     )
     (then
      (memory.copy
       (i64.and
        (local.tee $2
         (local.get $2)
        )
        (i64.const 15)
       )
       (i64.and
        (i64x2.extract_lane 1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
        (i64.const 15)
       )
       (i64.trunc_f32_u
        (call $12
         (f32.load offset=22 align=2
          (i64.and
           (local.get $1)
           (i64.const 15)
          )
         )
        )
       )
      )
      (memory.atomic.notify offset=3
       (i64.and
        (i64.atomic.rmw8.and_u acqrel offset=1
         (i64.and
          (try_table (result i64)
           (i64.atomic.load32_u offset=3
            (i64.and
             (if (result i64)
              (i32.const -1423679705)
              (then
               (block
                (memory.init $0
                 (i64.and
                  (block (result i64)
                   (call $fimport$4
                    (call $13
                     (f64.max
                      (f64.const 0)
                      (f64.const 0)
                     )
                    )
                   )
                   (local.get $2)
                  )
                  (i64.const 15)
                 )
                 (i32.const 2)
                 (i32.const 0)
                )
                (return
                 (tuple.make 2
                  (f64.const 1)
                  (i64.const -2147483647)
                 )
                )
               )
               (unreachable)
              )
              (else
               (call $fimport$1
                (i32.const -111)
               )
               (local.get $2)
              )
             )
             (i64.const 15)
            )
           )
          )
          (i64.const 15)
         )
         (block (result i64)
          (call $fimport$0
           (i32.const 0)
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.const 15)
       )
       (i31.get_u
        (ref.as_non_null
         (local.tee $6
          (ref.i31
           (i32.const 20)
          )
         )
        )
       )
      )
     )
     (else
      (drop
       (local.tee $25
        (global.get $global$9)
       )
      )
      (drop
       (i31.get_s
        (ref.as_non_null
         (local.get $6)
        )
       )
      )
      (drop
       (select
        (call $13
         (f64.trunc
          (loop $label (result f64)
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
           (local.set $8
            (local.tee $7
             (string.const "972\e2\82\ac")
            )
           )
           (if
            (i32.eqz
             (if (result i32)
              (i32.lt_u
               (i32.add
                (local.tee $22
                 (i32.const -38)
                )
                (local.tee $23
                 (string.measure_wtf16
                  (local.get $8)
                 )
                )
               )
               (array.len
                (local.tee $10
                 (local.tee $9
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
              )
              (then
               (string.encode_wtf16_array
                (local.get $8)
                (local.get $10)
                (local.get $22)
               )
              )
              (else
               (i32.const -126)
              )
             )
            )
            (then
             (call $fimport$3
              (local.get $27)
             )
             (call $fimport$6
              (local.tee $11
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
           )
           (drop
            (block (result (ref none))
             (nop)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
           (br_if $label
            (unreachable)
           )
           (drop
            (br_on_null $label
             (ref.func $9)
            )
           )
           (local.tee $28
            (f64.const -3402823466385288598117041e14)
           )
          )
         )
        )
        (call $13
         (struct.get $5 1
          (struct.new_default $5)
         )
        )
        (i32.const -1119915499)
       )
      )
      (drop
       (local.get $0)
      )
      (drop
       (i64.and
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
         (table.set $0
          (i32.const 6)
          (ref.func $9)
         )
         (call $fimport$4
          (call $13
           (f64.promote_f32
            (local.tee $27
             (loop $label1 (result f32)
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
                (i32.const -25033)
               )
              )
              (f32.const 4294956544)
             )
            )
           )
          )
         )
         (drop
          (global.get $global$9)
         )
         (block
          (call $fimport$8
           (ref.cast nullexternref
            (local.get $15)
           )
          )
          (return
           (tuple.make 2
            (f64.const 0)
            (i64.const 4294967239)
           )
          )
         )
         (local.set $14
          (local.set $12
           (unreachable)
          )
         )
        )
        (i64.const 15)
       )
      )
      (block
       (call $fimport$7
        (ref.func $7)
       )
       (return
        (tuple.make 2
         (f64.const 0)
         (i64.const -128)
        )
       )
      )
      (local.set $13
       (unreachable)
      )
     )
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $10 (type $24) (param $0 (ref $12)) (result i32)
  (local $1 (ref null $13))
  (local $2 stringref)
  (local $3 (ref null $9))
  (local $4 (ref struct))
  (local $5 f64)
  (local $6 v128)
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
   (i32.const -41)
  )
 )
 (func $11 (type $17)
  (local $0 (ref null $12))
  (local $1 (ref null $12))
  (local $2 (ref null $12))
  (local $3 (ref $7))
  (local $4 (ref $7))
  (local $5 (ref $4))
  (local $6 (ref $4))
  (local $7 (ref $4))
  (local $8 (ref $4))
  (local $9 (ref $1))
  (local $10 (ref $1))
  (local $11 (ref null $1))
  (local $12 (ref string))
  (local $13 (ref string))
  (local $14 (ref string))
  (local $15 nullref)
  (local $16 nullref)
  (local $17 (ref null $7))
  (local $18 (ref null $7))
  (local $19 (ref null $7))
  (local $20 (ref $13))
  (local $21 (ref null $14))
  (local $22 (ref $18))
  (local $23 (ref $18))
  (local $24 (ref $10))
  (local $25 (ref $10))
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
  (local $43 i64)
  (local $44 v128)
  (local $45 v128)
  (local $scratch i64)
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
   (ref.as_non_null
    (local.get $21)
   )
  )
  (local.set $2
   (ref.as_non_null
    (local.get $2)
   )
  )
  (local.set $12
   (string.const "\e2\82\ac")
  )
  (local.set $9
   (ref.as_non_null
    (local.get $11)
   )
  )
  (drop
   (try (result i32)
    (do
     (i32.const -2470)
    )
    (catch $tag$0
     (drop (struct.get_u $12 0 (pop (ref null $12))))
     (if (result i32)
      (ref.test (ref (exact $15))
       (struct.new_default $15)
      )
      (then
       (block $block (result i32)
        (if
         (i32.lt_u
          (i32.add
           (local.tee $29
            (i32.load16_s offset=3
             (i64.and
              (i64.const 24352)
              (i64.const 15)
             )
            )
           )
           (local.tee $30
            (ref.eq
             (array.new_fixed $20 0)
             (struct.new_desc $11
              (i32.const -40)
              (loop $label (result f64)
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
               (if
                (i32.eqz
                 (if (result i32)
                  (i32.const 32768)
                  (then
                   (select
                    (i32.const 65535)
                    (local.get $26)
                    (i32.const -65535)
                   )
                  )
                  (else
                   (ref.test nullref
                    (ref.null none)
                   )
                  )
                 )
                )
                (then
                 (if
                  (i32.lt_u
                   (local.tee $27
                    (i32.const -39)
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
                   (array.set $7
                    (local.get $4)
                    (local.get $27)
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 )
                 (table.set $0
                  (i32.const 0)
                  (ref.func $11)
                 )
                )
                (else
                 (nop)
                 (nop)
                 (f32.store offset=22
                  (i64.and
                   (select
                    (local.get $43)
                    (i64.const -7729545)
                    (local.get $26)
                   )
                   (i64.const 15)
                  )
                  (call $12
                   (f32.floor
                    (f32.const -524288)
                   )
                  )
                 )
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
               (nop)
               (br_if $label
                (i32.eqz
                 (if (result i32)
                  (i32.eqz
                   (global.get $global$9)
                  )
                  (then
                   (nop)
                   (return)
                  )
                  (else
                   (call $4)
                   (br_if $block
                    (local.get $26)
                    (block (result i32)
                     (drop
                      (block (result i64)
                       (local.set $scratch
                        (i64.const 4294958436)
                       )
                       (local.set $42
                        (i32.const 128)
                       )
                       (local.get $scratch)
                      )
                     )
                     (i32.eqz
                      (local.get $42)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (f64.const -16304)
              )
              (if (result v128)
               (i32.lt_u
                (local.tee $28
                 (i32.const -71)
                )
                (array.len
                 (local.tee $5
                  (array.new $4
                   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                   (i32.and
                    (i32.const 10)
                    (i32.const 1023)
                   )
                  )
                 )
                )
               )
               (then
                (call $14
                 (array.get $4
                  (local.get $5)
                  (local.get $28)
                 )
                )
               )
               (else
                (v128.const i32x4 0x80038293 0x8902b1fe 0x27000080 0x80b03f6c)
               )
              )
              (struct.get_s $11 4
               (struct.new_default_desc $11
                (loop (result (ref none))
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
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
              (ref.eq
               (loop (result (ref (exact $6)))
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
                (block (result (ref (exact $6)))
                 (struct.new $6
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                  (ref.as_non_null
                   (ref.null nofunc)
                  )
                  (f32.const 0)
                 )
                )
               )
               (if (result (ref $1))
                (br_if $block
                 (call_ref $24
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (ref.func $10)
                 )
                 (ref.eq
                  (ref.i31
                   (i32.const -9)
                  )
                  (local.tee $9
                   (ref.as_non_null
                    (local.tee $11
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 )
                )
                (then
                 (nop)
                 (return)
                )
                (else
                 (local.get $9)
                )
               )
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
          (array.len
           (local.tee $6
            (array.new_default $4
             (i32.and
              (i32.const 13)
              (i32.const 1023)
             )
            )
           )
          )
         )
         (then
          (drop
           (i32.add
            (local.tee $31
             (ref.eq
              (struct.new_default $33)
              (array.new_default $4
               (i32.const 90)
              )
             )
            )
            (local.tee $32
             (local.get $30)
            )
           )
          )
          (block
           (return)
          )
          (local.set $7
           (unreachable)
          )
         )
        )
        (br_if $block
         (ref.eq
          (if (result (ref null $12))
           (i32.eqz
            (i31.get_u
             (ref.i31
              (i32.const -1)
             )
            )
           )
           (then
            (block $block1 (result (ref null $12))
             (block
              (try_table (catch $tag$0 $block1) (catch $tag$0 $block1)
               (try
                (do
                 (nop)
                )
                (catch $tag$0
                 (local.set $1 (call_ref $__sinkT_0 (pop (ref null $12)) (ref.func $__popsink_0)))
                 (call $fimport$8
                  (local.tee $12
                   (string.const "\f0\90\8d\88")
                  )
                 )
                )
                (catch_all
                 (nop)
                )
               )
              )
              (return)
             )
             (unreachable)
            )
           )
           (else
            (if
             (i32.lt_u
              (local.tee $33
               (select
                (ref.eq
                 (ref.as_non_null
                  (ref.null none)
                 )
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
                (struct.get $12 3
                 (try (result (ref $12))
                  (do
                   (ref.as_non_null
                    (ref.null none)
                   )
                  )
                  (catch_all
                   (ref.as_non_null
                    (local.tee $2
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 )
                )
                (i31.get_u
                 (ref.i31
                  (i32.const 1)
                 )
                )
               )
              )
              (array.len
               (local.tee $15
                (ref.null none)
               )
              )
             )
             (then
              (drop
               (local.get $15)
              )
              (drop
               (local.get $33)
              )
              (drop
               (struct.new_default_desc $11
                (struct.new_default $13)
               )
              )
              (unreachable)
             )
            )
            (return)
           )
          )
          (array.new $3
           (struct.new $13
            (ref.null noextern)
            (local.get $26)
            (local.get $26)
           )
           (i32.and
            (i32.const 6)
            (i32.const 1023)
           )
          )
         )
         (i32.load offset=2 align=1
          (i64.and
           (local.get $43)
           (i64.const 15)
          )
         )
        )
       )
      )
      (else
       (local.tee $26
        (string.eq
         (string.const "")
         (block (result (ref string))
          (call_ref $22
           (array.new_fixed $20 0)
           (ref.func $fimport$6)
          )
          (try_table (result (ref string))
           (string.const "\e2\82\ac852969")
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
   (i32.const 46942)
  )
  (drop
   (local.tee $26
    (call $fimport$9
     (i32.rem_u
      (loop $label1 (result i32)
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
       (block $block2
        (drop
         (br_on_null $block2
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
        (br_if $block2
         (stringview_wtf16.get_codeunit
          (local.tee $12
           (local.tee $12
            (string.const "11304")
           )
          )
          (block (result i32)
           (local.set $42
            (i32.const -42)
           )
           (local.get $42)
          )
         )
        )
        (call $4)
       )
       (drop
        (ref.as_non_null
         (ref.null none)
        )
       )
       (block
        (nop)
        (br $label1)
       )
       (unreachable)
      )
      (i32.const 20)
     )
    )
   )
  )
  (block
   (nop)
   (return)
  )
  (unreachable)
 )
 (func $12 (type $34) (param $0 f32) (result f32)
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
 (func $13 (type $35) (param $0 f64) (result f64)
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
 (func $14 (type $36) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param (ref null $12)) (result (ref null $12))))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
