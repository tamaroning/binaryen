(module
 (rec
  (type $0 (sub (func)))
  (type $1 (sub (struct (field (mut f32)) (field v128))))
  (type $2 (array (mut i31ref)))
  (type $3 (sub (struct (field (ref null $0)))))
  (type $4 (sub (func (param (ref eq) (ref null $1) f32 (ref null $1) (ref null $2) exnref) (result exnref))))
 )
 (rec
  (type $5 (sub (func (param i32) (result (ref $15) (ref $10) (ref null $7) f64 f64 f64))))
  (type $6 (sub $3 (struct (field (ref null $15)) (field (ref $3)) (field (mut f64)) (field (mut f64)) (field (mut (ref $9))))))
  (type $7 (sub final $1 (descriptor $8) (struct (field (mut f32)) (field v128))))
  (type $8 (sub (describes $7) (descriptor $9) (struct (field (mut i31ref)) (field (mut (ref null $7))) (field externref) (field (mut (ref null $11))))))
  (type $9 (describes $8) (descriptor $10) (struct (field f32)))
  (type $10 (describes $9) (descriptor $11) (struct (field i8)))
  (type $11 (describes $10) (struct (field externref)))
  (type $12 (sub (func (param (ref null $1) f64 (ref $12) (ref null $12)) (result i32))))
  (type $13 (sub (func)))
  (type $14 (sub $4 (func (param (ref any) anyref f32 anyref eqref exnref) (result exnref))))
  (type $15 (sub $0 (func)))
 )
 (rec
  (type $16 (sub final $6 (struct (field (ref null $15)) (field (ref $3)) (field (mut f64)) (field (mut f64)) (field (mut (ref $9))))))
  (type $17 (array (mut i8)))
  (type $18 (sub $1 (struct (field (mut f32)) (field v128) (field (mut i32)))))
  (type $19 (sub final $14 (func (param (ref any) anyref f32 anyref eqref exnref) (result exnref))))
  (type $20 (sub (struct (field (mut (ref $0))) (field (ref $4)) (field (mut v128)) (field (mut i8)))))
 )
 (type $21 (struct))
 (type $22 (array i8))
 (type $23 (func))
 (type $24 (func (result (ref (exact $15)) (ref (exact $10)) (ref (exact $7)) f64 f64 f64)))
 (type $25 (array (mut i16)))
 (type $26 (func (param i64)))
 (type $27 (func (param i32)))
 (type $28 (func (param anyref)))
 (type $29 (func (result (ref $15) (ref $10) (ref null $7) f64 f64 f64)))
 (type $30 (func (param i32) (result funcref)))
 (type $31 (func (param i32 funcref)))
 (type $32 (func (param f32)))
 (type $33 (func (param f64)))
 (type $34 (func (param v128)))
 (type $35 (func (param funcref)))
 (type $36 (func (param externref)))
 (type $37 (func (param (ref null $2)) (result (ref $8))))
 (type $38 (func (result i64)))
 (type $39 (func (result (ref $7))))
 (type $40 (func (param i32) (result f32 (ref null $18))))
 (type $41 (func (param (ref null $11)) (result (ref eq))))
 (type $42 (func (param (ref $12) eqref structref (ref $13)) (result (ref null $11))))
 (type $43 (func (result (ref string))))
 (type $44 (func (param (ref null $18) v128) (result (ref null $5))))
 (type $45 (func (result (ref null $6))))
 (type $46 (func (param f32) (result f32)))
 (type $47 (func (param f64) (result f64)))
 (type $48 (func (param v128) (result v128)))
 (type $49 (func (result v128 (ref (exact $7)) nullref)))
 (type $50 (func (result f32 (ref null $18))))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_30" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $27) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $30) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $31) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $27) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $26) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $32) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $33) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $34) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $28) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $35) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $36) (param externref)))
 (global $global$0 (mut externref) (string.const "1007\e2\82\ac"))
 (global $global$1 (ref $5) (ref.func $0))
 (global $global$2 anyref (struct.new_default $21))
 (global $global$3 i32 (i32.const -385470630))
 (global $global$4 (ref $15) (ref.func $1))
 (global $global$5 f32 (f32.const 0))
 (global $global$6 (ref null $18) (struct.new $18
  (global.get $global$5)
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  (global.get $global$3)
 ))
 (global $global$7 (ref null $4) (ref.func $2))
 (global $global$8 f64 (f64.const 0))
 (global $global$9 (mut i32) (global.get $global$3))
 (global $global$10 (mut (ref null $5)) (ref.func $0))
 (global $global$11 (mut i32) (i32.const -122))
 (global $global$12 (mut i64) (i64.const -9223372036854775808))
 (global $global$13 (mut eqref) (ref.null none))
 (global $global$14 (mut stringref) (string.const ""))
 (global $global$15 arrayref (array.new_fixed $22 0))
 (global $global$16 (ref $18) (struct.new $18
  (f32.const -9007199254740992)
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  (global.get $global$3)
 ))
 (global $global$17 (ref $19) (ref.func $3))
 (global $global$18 (mut (ref null $12)) (ref.func $4))
 (global $global$19 f64 (f64.const 4294967294.773))
 (global $global$20 arrayref (ref.null none))
 (global $global$21 (mut (ref $0)) (ref.func $1))
 (global $global$22 i31ref (ref.i31
  (i32.const -15)
 ))
 (global $global$23 i64 (i64.const -77))
 (global $global$24 (mut arrayref) (global.get $global$15))
 (global $global$25 (mut f64) (f64.const 0.808))
 (global $global$26 (mut f32) (f32.const 4294967296))
 (global $global$27 (mut i32) (i32.const 44))
 (global $global$28 (mut eqref) (struct.new_default $21))
 (global $global$29 (mut i32) (i32.const -9))
 (global $global$30 (ref null $11) (struct.new $11
  (string.const "\ed\bd\88")
 ))
 (global $global$31 (ref $5) (global.get $global$1))
 (global $global$32 f64 (f64.const 0))
 (global $global$33 f32 (f32.const -85))
 (global $global$34 exnref (ref.null noexn))
 (global $global$35 (ref null $20) (struct.new $20
  (ref.func $1)
  (ref.func $2)
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  (global.get $global$3)
 ))
 (global $global$36 f64 (f64.const 524287.819))
 (global $global$37 (ref null $7) (struct.new_desc $7
  (global.get $global$5)
  (v128.const i32x4 0x00000000 0xc3e00000 0x00000000 0x404d0000)
  (struct.new_desc $8
   (global.get $global$22)
   (struct.new_desc $7
    (f32.const -17)
    (v128.const i32x4 0x46a09c00 0x5d000000 0xc1600000 0x431f0000)
    (struct.new_desc $8
     (global.get $global$22)
     (struct.new_default_desc $7
      (struct.new_default_desc $8
       (struct.new_desc $9
        (f32.const 1048575.875)
        (struct.new_desc $10
         (global.get $global$3)
         (struct.new_default $11)
        )
       )
      )
     )
     (global.get $gimport$0)
     (ref.null none)
     (struct.new_desc $9
      (global.get $global$5)
      (struct.new_default_desc $10
       (struct.new_default $11)
      )
     )
    )
   )
   (global.get $gimport$0)
   (global.get $global$30)
   (struct.new_default_desc $9
    (struct.new_desc $10
     (global.get $global$3)
     (struct.new $11
      (global.get $gimport$0)
     )
    )
   )
  )
 ))
 (global $global$38 f32 (global.get $global$5))
 (global $global$39 (mut (ref $2)) (array.new_default $2
  (i32.const 44)
 ))
 (global $global$40 (ref null $12) (ref.null nofunc))
 (global $global$41 i64 (i64.const 134217728))
 (global $global$42 (ref null $5) (ref.func $0))
 (global $global$43 (mut i32) (i32.const 100))
 (memory $0 i64 16 17 shared)
 (data $0 (i64.const 0) "P\be\0c")
 (table $0 10 funcref)
 (table $1 5 5 exnref)
 (elem $0 (table $0) (i32.const 0) func $9 $16 $19 $20 $20 $21 $26 $27 $27 $30)
 (elem declare func $1 $13 $3 $4 $7 $fimport$8)
 (tag $tag$0 (type $26) (param i64))
 (tag $tag$1 (type $23))
 (export "global$" (global $global$0))
 (export "global$_1" (global $global$1))
 (export "global$_2" (global $global$2))
 (export "global$_3" (global $global$3))
 (export "global$_8" (global $global$9))
 (export "global$_14" (global $global$19))
 (export "global$_15" (global $global$20))
 (export "global$_17" (global $global$22))
 (export "global$_21" (global $global$30))
 (export "global$_27" (global $global$38))
 (export "global$_28" (global $global$39))
 (export "table" (table $0))
 (export "ref_func_target_1_invoker" (func $5))
 (export "ref_func_target_2_invoker" (func $6))
 (export "func_invoker" (func $8))
 (export "func_20_invoker" (func $10))
 (export "func_22_invoker" (func $12))
 (export "func_25_invoker" (func $15))
 (export "func_27" (func $16))
 (export "func_28" (func $17))
 (export "func_28_invoker" (func $18))
 (export "func_30" (func $19))
 (export "func_33" (func $22))
 (export "func_35" (func $24))
 (export "func_35_invoker" (func $25))
 (export "func_38" (func $27))
 (export "func_39_invoker" (func $29))
 (export "func_41_invoker" (func $31))
 (export "func_43" (func $32))
 (func $0 (type $5) (param $0 i32) (result (ref $15) (ref $10) (ref null $7) f64 f64 f64)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $15)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $2 (type $4) (param $0 (ref eq)) (param $1 (ref null $1)) (param $2 f32) (param $3 (ref null $1)) (param $4 (ref null $2)) (param $5 exnref) (result exnref)
  (local.set $2
   (call $33
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $3 (type $19) (param $0 (ref any)) (param $1 anyref) (param $2 f32) (param $3 anyref) (param $4 eqref) (param $5 exnref) (result exnref)
  (local.set $2
   (call $33
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $4 (type $12) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref $12)) (param $3 (ref null $12)) (result i32)
  (local.set $1
   (call $34
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $5 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $1)
 )
 (func $6 (type $23)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
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
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 f32)
  (local $22 f32)
  (local $23 f32)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i64)
  (local $30 v128)
  (local $31 f64)
  (local $32 (ref $17))
  (local $33 (ref $17))
  (local $34 (ref $17))
  (local $35 (ref $17))
  (local $36 (ref $17))
  (local $37 (ref $17))
  (local $38 (ref $17))
  (local $39 (ref $17))
  (local $40 (ref $17))
  (local $41 (ref $17))
  (local $42 (ref array))
  (local $43 (ref null $17))
  (local $44 (ref string))
  (local $45 (ref string))
  (local $46 (ref string))
  (local $47 (ref none))
  (local $48 (ref none))
  (local $49 (ref $8))
  (local $50 (ref null $20))
  (local $51 (ref null $7))
  (local $52 externref)
  (local $53 (ref extern))
  (local $54 (ref (exact $9)))
  (local $55 (ref (exact $9)))
  (local $56 (ref (exact $9)))
  (local $57 (ref i31))
  (local $58 (ref null $12))
  (local $59 (ref $2))
  (local $60 (ref $2))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (local.set $57
   (ref.i31
    (i32.const -1134949101)
   )
  )
  (local.set $54
   (struct.new_default_desc $9
    (struct.new_default_desc $10
     (struct.new_default $11)
    )
   )
  )
  (local.set $44
   (string.const "\ed\bd\88\ed\bd\88")
  )
  (local.set $33
   (array.new_default $17
    (i32.and
     (i32.const 34)
     (i32.const 1023)
    )
   )
  )
  (drop
   (call $2
    (array.new_fixed $22 0)
    (struct.new $1
     (call $33
      (f32x4.extract_lane 0
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
      )
     )
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (f32.const -15)
    (struct.new_default $1)
    (array.new_default $2
     (i32.and
      (i32.const 81)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
   )
  )
  (drop
   (call $2
    (struct.new_default $21)
    (struct.new $1
     (loop $label1 (result f32)
      (if
       (i32.eqz
        (global.get $global$43)
       )
       (then
        (global.set $global$43
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$43
       (i32.sub
        (global.get $global$43)
        (i32.const 1)
       )
      )
      (nop)
      (block $block
       (drop
        (block (result i64)
         (atomic.fence)
         (global.get $global$23)
        )
       )
       (block
        (nop)
        (br $block)
       )
       (unreachable)
      )
      (block
       (loop $label
        (if
         (i32.eqz
          (global.get $global$43)
         )
         (then
          (global.set $global$43
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$43
         (i32.sub
          (global.get $global$43)
          (i32.const 1)
         )
        )
        (call $fimport$0
         (i32.const -8388608)
        )
        (try_table (catch_all $label)
         (call $fimport$0
          (i32.const 0)
         )
        )
       )
       (br $label1)
      )
      (local.set $44
       (local.set $60
        (local.set $41
         (local.set $44
          (local.set $40
           (local.set $39
            (local.set $38
             (local.set $48
              (local.set $46
               (local.set $59
                (local.set $37
                 (local.set $36
                  (local.set $57
                   (local.set $35
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
     (try_table (result v128)
      (local.get $30)
     )
    )
    (f32.const -2147483648)
    (struct.new_default $1)
    (array.new $2
     (local.get $57)
     (i32.and
      (i32.const 64)
      (i32.const 1023)
     )
    )
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$0
       (global.get $global$23)
      )
     )
     (unreachable)
    )
   )
  )
 )
 (func $7 (type $4) (param $0 (ref eq)) (param $1 (ref null $1)) (param $2 f32) (param $3 (ref null $1)) (param $4 (ref null $2)) (param $5 exnref) (result exnref)
  (local $6 f64)
  (local $7 i64)
  (local $8 v128)
  (local $9 v128)
  (local $10 i32)
  (local $11 i32)
  (local $12 (ref $2))
  (local.set $2
   (call $33
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (memory.fill
   (i64.and
    (i64.const 99)
    (i64.const 15)
   )
   (i16x8.extract_lane_s 2
    (select
     (local.tee $8
      (try (result v128)
       (do
        (v128.const i32x4 0xa96eda33 0x6827ffad 0x0074ff9d 0xd9554353)
       )
       (catch_all
        (loop $label
         (if
          (i32.eqz
           (global.get $global$43)
          )
          (then
           (global.set $global$43
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$43
          (i32.sub
           (global.get $global$43)
           (i32.const 1)
          )
         )
         (if
          (i32.lt_u
           (i32.add
            (local.tee $10
             (global.get $global$9)
            )
            (local.tee $11
             (global.get $global$3)
            )
           )
           (array.len
            (local.tee $12
             (loop (result (ref $2))
              (if
               (i32.eqz
                (global.get $global$43)
               )
               (then
                (global.set $global$43
                 (i32.const 100)
                )
                (unreachable)
               )
              )
              (global.set $global$43
               (i32.sub
                (global.get $global$43)
                (i32.const 1)
               )
              )
              (global.get $global$39)
             )
            )
           )
          )
          (then
           (array.fill $2
            (local.get $12)
            (local.get $10)
            (ref.i31
             (i32.const -57)
            )
            (local.get $11)
           )
          )
         )
         (loop
          (if
           (i32.eqz
            (global.get $global$43)
           )
           (then
            (global.set $global$43
             (i32.const 100)
            )
            (unreachable)
           )
          )
          (global.set $global$43
           (i32.sub
            (global.get $global$43)
            (i32.const 1)
           )
          )
          (nop)
          (br $label)
         )
         (unreachable)
        )
        (unreachable)
       )
      )
     )
     (call $35
      (f64x2.replace_lane 1
       (local.get $9)
       (local.get $6)
      )
     )
     (i32.load8_s offset=4
      (i64.and
       (loop (result i64)
        (if
         (i32.eqz
          (global.get $global$43)
         )
         (then
          (global.set $global$43
           (i32.const 100)
          )
          (unreachable)
         )
        )
        (global.set $global$43
         (i32.sub
          (global.get $global$43)
          (i32.const 1)
         )
        )
        (block (result i64)
         (nop)
         (i64x2.extract_lane 0
          (call $35
           (v128.load64_splat offset=2 align=2
            (i64.and
             (local.tee $7
              (global.get $global$23)
             )
             (i64.const 15)
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
   (local.tee $7
    (global.get $global$23)
   )
  )
  (return
   (block $block (result (ref exn))
    (try_table (catch_all_ref $block)
     (throw $tag$1)
    )
    (unreachable)
   )
  )
 )
 (func $8 (type $23)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
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
  (local $13 i32)
  (local $14 i32)
  (local $15 f32)
  (local $16 v128)
  (local $17 v128)
  (local $18 f64)
  (local $19 nullref)
  (local $20 nullref)
  (local $21 (ref string))
  (local $22 (ref string))
  (local $23 (ref string))
  (local $24 (ref $17))
  (local $25 (ref $17))
  (local $26 (ref $17))
  (local $27 (ref i31))
  (local $28 (ref $6))
  (local $29 (ref $25))
  (local $30 (ref $25))
  (local $31 (ref func))
  (local $32 (ref $20))
  (local $33 (ref $2))
  (local $34 (ref $18))
  (local $35 (ref $16))
  (local $scratch f32)
  (local $scratch_37 (ref (exact $20)))
  (local $scratch_38 (ref (exact $4)))
  (local $scratch_39 v128)
  (local $scratch_40 (tuple v128 (ref (exact $7)) nullref))
  (local $scratch_41 (ref (exact $7)))
  (local $scratch_42 v128)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (drop
   (call $7
    (array.new_fixed $22 0)
    (struct.new $1
     (call $33
      (f32.load offset=22 align=2
       (i64.and
        (if (result i64)
         (ref.test (ref i31)
          (ref.i31
           (i32.const 1)
          )
         )
         (then
          (call $fimport$4
           (i64.extend_i32_u
            (i32.const 343156503)
           )
          )
          (return)
         )
         (else
          (i64.const -32)
         )
        )
        (i64.const 15)
       )
      )
     )
     (v128.const i32x4 0x15c30124 0xdf002fa7 0x0000d801 0x92269d02)
    )
    (f32.const 42)
    (struct.new $1
     (call $33
      (global.get $global$5)
     )
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (array.new_default $2
     (i32.and
      (i32.const 28)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
   )
  )
  (drop
   (call $7
    (array.new_fixed $22 0)
    (struct.new $1
     (f32.const 536870912)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (f32.const 4095.993896484375)
    (struct.new $1
     (try (result f32)
      (do
       (call $33
        (global.get $global$5)
       )
      )
      (catch $tag$0
       (local.set $0 (call_ref $__sinkT_0 (pop i64) (ref.func $__popsink_0)))
       (try_table (result f32)
        (nop)
        (call_ref $28
         (block (result (ref (exact $11)))
          (atomic.fence acqrel)
          (loop $label (result (ref (exact $11)))
           (if
            (i32.eqz
             (global.get $global$43)
            )
            (then
             (global.set $global$43
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$43
            (i32.sub
             (global.get $global$43)
             (i32.const 1)
            )
           )
           (nop)
           (br_if $label
            (i32.eqz
             (local.get $8)
            )
           )
           (struct.new_default $11)
          )
         )
         (ref.func $fimport$8)
        )
        (f32.const 9223372036854775808)
       )
      )
     )
     (call $35
      (v128.load offset=22 align=1
       (i64.and
        (i64.const 70368744177664)
        (i64.const 15)
       )
      )
     )
    )
    (array.new $2
     (ref.i31
      (i32.const -2147483648)
     )
     (i32.and
      (i32.const 57)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
   )
  )
  (drop
   (call $7
    (ref.i31
     (i32.const -1973)
    )
    (struct.new $1
     (f32.const 96)
     (v128.const i32x4 0x00000002 0x00000000 0x00000000 0xfc000000)
    )
    (f32.const -4.352809779284428e-11)
    (struct.new_default $1)
    (array.new $2
     (ref.cast nullref
      (local.tee $19
       (ref.null none)
      )
     )
     (i32.and
      (i32.const 33)
      (i32.const 1023)
     )
    )
    (ref.null noexn)
   )
  )
  (drop
   (call $7
    (struct.new_default $21)
    (struct.new_default $1)
    (f32.const 16)
    (ref.null none)
    (array.new $2
     (try (result i31ref)
      (do
       (ref.i31
        (i32.const -5027)
       )
      )
      (catch $tag$0
       (local.set $1 (i64.mul (pop i64) (i64.const -1)))
       (ref.null none)
      )
      (catch_all
       (ref.i31
        (i32.const 37)
       )
      )
     )
     (i32.and
      (i32.const 20)
      (i32.const 1023)
     )
    )
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$0
       (local.tee $2
        (select
         (i64.mul
          (i64.const 2147483647)
          (i64.const 65445)
         )
         (i64.load32_u offset=4 align=1
          (i64.and
           (i64.const -80155637658)
           (i64.const 15)
          )
         )
         (struct.get $18 2
          (struct.new $18
           (f32.const 65431)
           (v128.const i32x4 0xf95df42a 0x440000ff 0xb70000d0 0x50d400ff)
           (global.get $global$3)
          )
         )
        )
       )
      )
     )
     (unreachable)
    )
   )
  )
  (drop
   (call $7
    (struct.new_default $21)
    (struct.new $1
     (local.get $15)
     (v128.const i32x4 0xc2f60000 0x41e80000 0xc7800000 0xd5000000)
    )
    (f32.const -15350)
    (struct.new $1
     (select
      (call $33
       (global.get $global$38)
      )
      (call $33
       (global.get $global$38)
      )
      (f32.le
       (local.get $15)
       (call $33
        (global.get $global$5)
       )
      )
     )
     (call $35
      (f64x2.min
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (call $35
        (block (result v128)
         (local.set $scratch_39
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (drop
          (block (result (ref (exact $4)))
           (local.set $scratch_38
            (ref.func $7)
           )
           (drop
            (block (result (ref (exact $20)))
             (local.set $scratch_37
              (struct.new $20
               (global.get $global$21)
               (ref.func $3)
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               (i32.const -83)
              )
             )
             (drop
              (block (result f32)
               (local.set $scratch
                (f32.const 562949953421312)
               )
               (drop
                (i32.const -2147483647)
               )
               (local.get $scratch)
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
      )
     )
    )
    (block (result (ref (exact $2)))
     (drop
      (block (result v128)
       (local.set $scratch_42
        (tuple.extract 3 0
         (local.tee $scratch_40
          (try_table (type $49) (result v128 (ref (exact $7)) nullref)
           (tuple.make 3
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            (struct.new_desc $7
             (local.get $15)
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (struct.new_desc $8
              (ref.i31
               (i32.const -32767)
              )
              (struct.new_default_desc $7
               (struct.new_default_desc $8
                (struct.new_desc $9
                 (f32.const -17.797000885009766)
                 (struct.new_default_desc $10
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
              )
              (global.get $gimport$0)
              (struct.new_default $11)
              (struct.new_desc $9
               (local.get $15)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (ref.null none)
           )
          )
         )
        )
       )
       (drop
        (block (result (ref (exact $7)))
         (local.set $scratch_41
          (tuple.extract 3 1
           (local.get $scratch_40)
          )
         )
         (local.set $20
          (tuple.extract 3 2
           (local.get $scratch_40)
          )
         )
         (local.get $scratch_41)
        )
       )
       (local.get $scratch_42)
      )
     )
     (array.new $2
      (local.get $20)
      (i32.and
       (i32.const 39)
       (i32.const 1023)
      )
     )
    )
    (block $block1 (result (ref exn))
     (try_table (catch_all_ref $block1)
      (throw $tag$0
       (local.tee $2
        (local.get $2)
       )
      )
     )
     (unreachable)
    )
   )
  )
  (drop
   (array.new_fixed $22 0)
  )
  (drop
   (call $33
    (struct.get $18 0
     (global.get $global$16)
    )
   )
  )
  (if
   (string.measure_wtf16
    (local.tee $21
     (local.tee $22
      (string.const "")
     )
    )
   )
   (then
    (block
     (return)
    )
    (local.set $25
     (local.set $24
      (local.set $27
       (local.set $26
        (unreachable)
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
  (local.set $35
   (local.set $34
    (local.set $33
     (unreachable)
    )
   )
  )
 )
 (@binaryen.js.called)
 (func $9 (type $13)
  (local $0 (ref eq))
  (local $1 (ref string))
  (local $2 (ref $18))
  (local $3 funcref)
  (local $4 nullref)
  (local $5 nullref)
  (local $6 (ref func))
  (local $7 (ref $17))
  (local $8 (ref $17))
  (local $9 (ref $16))
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 f64)
  (local $18 v128)
  (local $19 f32)
  (local $scratch i64)
  (local $scratch_21 f32)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (local.set $1
   (string.const "\f0\90\8d\88\f0\90\8d\88")
  )
  (block $block
   (if
    (select
     (try (result i32)
      (do
       (local.tee $10
        (try (result i32)
         (do
          (drop
           (block (result i64)
            (local.set $scratch
             (i64.const 2147483648)
            )
            (local.set $13
             (i32.const 8388608)
            )
            (local.get $scratch)
           )
          )
          (if
           (if (result i32)
            (local.get $13)
            (then
             (string.measure_wtf16
              (local.tee $1
               (string.const "")
              )
             )
            )
            (else
             (ref.eq
              (array.new_default $17
               (i32.and
                (i32.const 62)
                (i32.const 1023)
               )
              )
              (global.get $global$16)
             )
            )
           )
           (then
            (call $fimport$8
             (ref.null none)
            )
            (br $block)
           )
           (else
            (nop)
            (br $block)
           )
          )
          (unreachable)
         )
         (catch_all
          (local.get $11)
         )
        )
       )
      )
      (catch_all
       (if (result i32)
        (i32.lt_u
         (local.tee $12
          (i32.load8_s offset=22
           (i64.and
            (i64.const -1152921504606846977)
            (block (result i64)
             (drop
              (block (result f32)
               (local.set $scratch_21
                (f32.const 0)
               )
               (drop
                (ref.null none)
               )
               (local.get $scratch_21)
              )
             )
             (i64.const 15)
            )
           )
          )
         )
         (array.len
          (local.tee $8
           (local.tee $7
            (array.new $17
             (local.get $11)
             (i32.and
              (i32.const 1)
              (i32.const 1023)
             )
            )
           )
          )
         )
        )
        (then
         (array.get_s $17
          (local.get $8)
          (local.get $12)
         )
        )
        (else
         (i32.const -1424989162)
        )
       )
      )
     )
     (i32.const -18880)
     (try_table (result i32) (catch_all $block)
      (i32.const 31)
     )
    )
    (then
     (call $fimport$8
      (struct.new_default $21)
     )
     (local.set $18
      (local.get $18)
     )
     (nop)
    )
    (else
     (struct.set $16 4
      (local.tee $9
       (struct.new $16
        (ref.func $1)
        (struct.new $6
         (ref.func $1)
         (struct.new $6
          (ref.func $1)
          (struct.new $6
           (ref.func $1)
           (struct.new $6
            (ref.func $1)
            (struct.new $6
             (ref.func $1)
             (struct.new $3
              (ref.func $1)
             )
             (local.get $17)
             (local.get $17)
             (struct.new_desc $9
              (f32.const -2046.85205078125)
              (struct.new_desc $10
               (i32.const 120)
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
            )
            (local.get $17)
            (local.get $17)
            (struct.new_desc $9
             (f32.const 0)
             (struct.new_default_desc $10
              (struct.new $11
               (string.const "\ed\bd\88")
              )
             )
            )
           )
           (call $34
            (global.get $global$19)
           )
           (call $34
            (global.get $global$19)
           )
           (struct.new_desc $9
            (f32.const 0)
            (struct.new_default_desc $10
             (struct.new $11
              (ref.null noextern)
             )
            )
           )
          )
          (f64.const -3402823466385288598117041e14)
          (local.get $17)
          (struct.new_default_desc $9
           (struct.new_desc $10
            (global.get $global$9)
            (struct.new $11
             (string.const "\ed\bd\88\f0\90\8d\88")
            )
           )
          )
         )
         (call $34
          (global.get $global$19)
         )
         (call $34
          (global.get $global$19)
         )
         (struct.new_default_desc $9
          (struct.new_default_desc $10
           (struct.new $11
            (global.get $gimport$0)
           )
          )
         )
        )
        (local.get $17)
        (call $34
         (global.get $global$19)
        )
        (struct.new_default_desc $9
         (struct.new_default_desc $10
          (struct.new $11
           (ref.null noextern)
          )
         )
        )
       )
      )
      (struct.new_default_desc $9
       (struct.new_desc $10
        (global.get $global$3)
        (struct.new_default $11)
       )
      )
     )
     (block
      (local.set $18
       (call $35
        (i64x2.splat
         (local.get $15)
        )
       )
      )
      (br $block)
     )
     (unreachable)
    )
   )
   (drop
    (i64.and
     (i64.const 1)
     (i64.const 15)
    )
   )
   (if
    (ref.eq
     (ref.i31
      (i32.const -127)
     )
     (loop (result (ref (exact $21)))
      (if
       (i32.eqz
        (global.get $global$43)
       )
       (then
        (global.set $global$43
         (i32.const 100)
        )
        (unreachable)
       )
      )
      (global.set $global$43
       (i32.sub
        (global.get $global$43)
        (i32.const 1)
       )
      )
      (block (result (ref (exact $21)))
       (local.set $10
        (local.get $11)
       )
       (struct.new_default $21)
      )
     )
    )
    (then
     (nop)
     (block
      (nop)
      (call $fimport$9
       (ref.func $9)
      )
      (br $block)
     )
     (unreachable)
    )
    (else
     (return)
    )
   )
   (unreachable)
  )
 )
 (func $10 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $9)
 )
 (func $11 (type $13)
  (local $0 eqref)
  (local $1 externref)
  (local $2 externref)
  (local $3 exnref)
  (local $4 funcref)
  (local $5 funcref)
  (local $6 anyref)
  (local $7 (ref array))
  (local $8 (ref string))
  (local $9 structref)
  (local $10 arrayref)
  (local $11 (ref $5))
  (local $12 i31ref)
  (local $13 (ref null $20))
  (local $14 (ref null $16))
  (local $15 (ref $6))
  (local $16 f64)
  (local $17 f64)
  (local $18 f32)
  (local $19 f32)
  (local $20 i64)
  (local $21 i64)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 v128)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $12 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $11)
 )
 (func $13 (type $12) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref $12)) (param $3 (ref null $12)) (result i32)
  (local.set $1
   (call $34
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (memory.atomic.notify offset=22
   (i64.and
    (global.get $global$23)
    (i64.const 15)
   )
   (global.get $global$3)
  )
 )
 (func $14 (type $13)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 (ref $9))
  (local $7 (ref eq))
  (local $8 (ref $17))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (block $block
   (if
    (i32.lt_u
     (local.tee $2
      (local.get $1)
     )
     (array.len
      (local.tee $8
       (array.new_default $17
        (i32.and
         (i32.const 82)
         (i32.const 1023)
        )
       )
      )
     )
    )
    (then
     (drop
      (local.get $8)
     )
     (drop
      (local.get $2)
     )
     (block
      (br $block)
     )
     (unreachable)
    )
   )
   (call $fimport$5
    (call $33
     (f32.load offset=4
      (i64.and
       (i64.const 512)
       (i64.const 15)
      )
     )
    )
   )
  )
 )
 (func $15 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $14)
 )
 (@binaryen.js.called)
 (func $16 (type $37) (param $0 (ref null $2)) (result (ref $8))
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 f64)
  (local $6 (ref $19))
  (local $7 (ref null $19))
  (local $8 (ref eq))
  (local $9 (ref $18))
  (local $10 (ref $18))
  (local $11 (ref $18))
  (local $12 (ref $18))
  (local $13 (ref $2))
  (local $14 (ref (exact $9)))
  (local $scratch (ref (exact $16)))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (local.set $13
   (array.new $2
    (ref.i31
     (i32.const -1048575)
    )
    (i32.and
     (i32.const 83)
     (i32.const 1023)
    )
   )
  )
  (block $block2 (result (ref (exact $8)))
   (block $block1
    (call $fimport$6
     (call $34
      (f64.load offset=22 align=2
       (i64.and
        (if (result i64)
         (global.get $global$3)
         (then
          (block $block (result i64)
           (drop
            (block (result (ref (exact $16)))
             (local.set $scratch
              (struct.new $16
               (ref.func $1)
               (struct.new_default $3)
               (f64.const 27)
               (call $34
                (global.get $global$19)
               )
               (struct.new_desc $9
                (call $33
                 (global.get $global$38)
                )
                (struct.new_default_desc $10
                 (struct.new $11
                  (string.const "\e2\82\ac\e2\82\ac\ed\bd\88")
                 )
                )
               )
              )
             )
             (local.set $14
              (struct.new_default_desc $9
               (struct.new_desc $10
                (i32.const -16777216)
                (struct.new_default $11)
               )
              )
             )
             (local.get $scratch)
            )
           )
           (call $fimport$8
            (local.get $14)
           )
           (i64.atomic.load16_u acqrel offset=22
            (i64.and
             (i64.clz
              (i64.div_s
               (i64.atomic.rmw8.sub_u offset=22
                (i64.and
                 (loop $label (result i64)
                  (if
                   (i32.eqz
                    (global.get $global$43)
                   )
                   (then
                    (global.set $global$43
                     (i32.const 100)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$43
                   (i32.sub
                    (global.get $global$43)
                    (i32.const 1)
                   )
                  )
                  (call $fimport$10
                   (select (result (ref extern))
                    (global.get $gimport$1)
                    (global.get $gimport$1)
                    (i32.lt_u
                     (i32.const -23)
                     (i32.atomic.load16_u acqrel offset=22
                      (i64.and
                       (i64.const -19)
                       (i64.const 15)
                      )
                     )
                    )
                   )
                  )
                  (call $fimport$4
                   (global.get $global$23)
                  )
                  (br_if $label
                   (i32.eqz
                    (local.tee $1
                     (i32.load offset=22 align=2
                      (i64.and
                       (i64.const 35184372088831)
                       (i64.const 15)
                      )
                     )
                    )
                   )
                  )
                  (i64.shr_s
                   (br_if $block
                    (local.tee $3
                     (i64.const 9007199254740992)
                    )
                    (i32.const -114)
                   )
                   (local.get $4)
                  )
                 )
                 (i64.const 15)
                )
                (try_table (result i64) (catch $tag$0 $block) (catch_all $block1)
                 (select
                  (local.get $3)
                  (if (result i64)
                   (i32.eqz
                    (local.get $1)
                   )
                   (then
                    (local.tee $3
                     (local.get $3)
                    )
                   )
                   (else
                    (i64.const 576460752303423487)
                   )
                  )
                  (block (result i32)
                   (drop
                    (br_on_null $block1
                     (local.tee $6
                      (ref.as_non_null
                       (local.tee $7
                        (ref.as_non_null
                         (ref.null nofunc)
                        )
                       )
                      )
                     )
                    )
                   )
                   (f64.ge
                    (call $34
                     (global.get $global$19)
                    )
                    (local.get $5)
                   )
                  )
                 )
                )
               )
               (local.get $3)
              )
             )
             (i64.const 15)
            )
           )
          )
         )
         (else
          (br_on_non_null $block2
           (struct.new_desc $8
            (ref.null none)
            (struct.new_desc $7
             (f32.const 0)
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (struct.new_desc $8
              (ref.i31
               (i32.const -2097153)
              )
              (ref.null none)
              (global.get $gimport$0)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (global.get $gimport$1)
            (global.get $global$30)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (local.set $1
           (block (result i32)
            (try
             (do
              (table.set $0
               (i32.const 0)
               (ref.func $16)
              )
             )
             (catch_all
              (i64.atomic.store16 acqrel offset=22
               (i64.and
                (i64.const -3733247)
                (i64.const 15)
               )
               (i64x2.extract_lane 0
                (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               )
              )
             )
            )
            (try_table (result i32) (catch_all $block1)
             (ref.eq
              (local.tee $8
               (array.new_fixed $22 0)
              )
              (block (result (ref $2))
               (drop
                (br_on_null $block1
                 (ref.as_non_null
                  (local.get $7)
                 )
                )
               )
               (if (result (ref $2))
                (i32.eqz
                 (ref.is_null
                  (local.tee $9
                   (local.tee $10
                    (local.tee $11
                     (local.tee $12
                      (ref.as_non_null
                       (ref.null none)
                      )
                     )
                    )
                   )
                  )
                 )
                )
                (then
                 (local.tee $13
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
                (else
                 (local.get $13)
                )
               )
              )
             )
            )
           )
          )
          (throw_ref
           (block $block3 (result (ref exn))
            (try_table (catch_all_ref $block3)
             (throw $tag$1)
            )
            (unreachable)
           )
          )
         )
        )
        (i64.const 15)
       )
      )
     )
    )
    (br_if $block1
     (i32.const -32766)
    )
   )
   (return
    (struct.new_default_desc $8
     (struct.new_desc $9
      (call $33
       (global.get $global$38)
      )
      (struct.new_desc $10
       (local.get $1)
       (struct.new $11
        (global.get $gimport$0)
       )
      )
     )
    )
   )
  )
 )
 (func $17 (type $38) (result i64)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $17)
 )
 (func $18 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (drop
   (call $17)
  )
  (drop
   (call $17)
  )
 )
 (func $19 (type $5) (param $0 i32) (result (ref $15) (ref $10) (ref null $7) f64 f64 f64)
  (local $1 i31ref)
  (local $2 (ref $0))
  (local $3 (ref $15))
  (local $4 (ref $10))
  (local $5 (ref null $7))
  (local $6 (ref $8))
  (local $7 (ref $8))
  (local $8 (ref i31))
  (local $9 (ref $25))
  (local $10 (ref $25))
  (local $11 (ref string))
  (local $12 (ref $2))
  (local $13 (ref $17))
  (local $14 (ref $17))
  (local $15 (ref $17))
  (local $16 (ref $17))
  (local $17 nullref)
  (local $18 (ref null $16))
  (local $19 i64)
  (local $20 i64)
  (local $21 i64)
  (local $22 i64)
  (local $23 i64)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 f64)
  (local $30 f64)
  (local $31 f64)
  (local $32 f64)
  (local $33 i32)
  (local $34 i32)
  (local $35 i32)
  (local $36 i32)
  (local $37 i32)
  (local $38 i32)
  (local $39 f32)
  (local $40 v128)
  (local $scratch (ref (exact $22)))
  (local $scratch_42 f32)
  (local $scratch_43 (tuple (ref (exact $15)) (ref (exact $10)) (ref (exact $7)) f64 f64 f64))
  (local $scratch_44 f64)
  (local $scratch_45 f64)
  (local $scratch_46 (ref (exact $7)))
  (local $scratch_47 (ref (exact $10)))
  (local $scratch_48 (ref (exact $15)))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (local.set $13
   (array.new $17
    (local.get $0)
    (i32.and
     (i32.const 18)
     (i32.const 1023)
    )
   )
  )
  (local.set $12
   (global.get $global$39)
  )
  (local.set $8
   (ref.i31
    (i32.const 224)
   )
  )
  (local.set $7
   (struct.new_desc $8
    (local.get $1)
    (struct.new_default_desc $7
     (struct.new_default_desc $8
      (struct.new_default_desc $9
       (struct.new_default_desc $10
        (struct.new $11
         (global.get $gimport$0)
        )
       )
      )
     )
    )
    (global.get $gimport$0)
    (struct.new $11
     (global.get $gimport$0)
    )
    (struct.new_desc $9
     (f32.const 0)
     (struct.new_default_desc $10
      (struct.new $11
       (global.get $gimport$0)
      )
     )
    )
   )
  )
  (local.set $2
   (ref.func $1)
  )
  (if
   (call_ref $12
    (global.get $global$37)
    (select
     (call $34
      (f64.load offset=22
       (i64.and
        (loop $label3 (result i64)
         (if
          (i32.eqz
           (global.get $global$43)
          )
          (then
           (global.set $global$43
            (i32.const 100)
           )
           (unreachable)
          )
         )
         (global.set $global$43
          (i32.sub
           (global.get $global$43)
           (i32.const 1)
          )
         )
         (try
          (do
           (nop)
          )
          (catch $tag$0
           (local.set $22 (local.tee $22 (pop i64)))
           (if
            (ref.eq
             (global.get $global$15)
             (block (result (ref (exact $21)))
              (struct.new_default $21)
             )
            )
            (then
             (call_indirect $0 (type $13)
              (i32.const 0)
             )
            )
           )
          )
         )
         (br_if $label3
          (loop $label (result i32)
           (if
            (i32.eqz
             (global.get $global$43)
            )
            (then
             (global.set $global$43
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$43
            (i32.sub
             (global.get $global$43)
             (i32.const 1)
            )
           )
           (atomic.fence)
           (br_if $label
            (i32.eqz
             (local.get $0)
            )
           )
           (br_if $label
            (i32.eqz
             (local.tee $0
              (global.get $global$9)
             )
            )
           )
           (loop $label1 (result i32)
            (if
             (i32.eqz
              (global.get $global$43)
             )
             (then
              (global.set $global$43
               (i32.const 100)
              )
              (unreachable)
             )
            )
            (global.set $global$43
             (i32.sub
              (global.get $global$43)
              (i32.const 1)
             )
            )
            (call_indirect $0 (type $13)
             (i32.const 0)
            )
            (br_if $label1
             (i32.const -524288)
            )
            (br_if $label1
             (i32.gt_u
              (ref.eq
               (ref.i31
                (i32.const -65535)
               )
               (ref.null none)
              )
              (string.measure_wtf16
               (loop $label2 (result (ref string))
                (if
                 (i32.eqz
                  (global.get $global$43)
                 )
                 (then
                  (global.set $global$43
                   (i32.const 100)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$43
                 (i32.sub
                  (global.get $global$43)
                  (i32.const 1)
                 )
                )
                (nop)
                (br_if $label2
                 (local.get $0)
                )
                (string.const "\f0\90\8d\88")
               )
              )
             )
            )
            (memory.atomic.notify offset=4
             (i64.and
              (if (result i64)
               (if (result i32)
                (i32.const -536870913)
                (then
                 (i32.const -2097152)
                )
                (else
                 (i32.const 255)
                )
               )
               (then
                (br $label)
               )
               (else
                (memory.fill
                 (i64.and
                  (local.get $19)
                  (i64.const 15)
                 )
                 (local.get $0)
                 (i64.const -81)
                )
                (local.tee $19
                 (local.tee $19
                  (local.get $19)
                 )
                )
               )
              )
              (i64.const 15)
             )
             (select
              (ref.eq
               (ref.as_non_null
                (ref.null none)
               )
               (local.tee $6
                (local.tee $7
                 (ref.as_non_null
                  (ref.null none)
                 )
                )
               )
              )
              (i31.get_u
               (local.tee $8
                (ref.i31
                 (i32.const -27)
                )
               )
              )
              (ref.eq
               (array.new_fixed $22 0)
               (array.new_fixed $22 0)
              )
             )
            )
           )
          )
         )
         (local.get $19)
        )
        (i64.const 15)
       )
      )
     )
     (f64.const 0)
     (i32.const 1617035623)
    )
    (ref.func $4)
    (if (result (ref null $12))
     (i32.atomic.load offset=22
      (i64.and
       (global.get $global$23)
       (i64.const 15)
      )
     )
     (then
      (global.get $global$18)
     )
     (else
      (loop $label4 (result (ref (exact $12)))
       (if
        (i32.eqz
         (global.get $global$43)
        )
        (then
         (global.set $global$43
          (i32.const 100)
         )
         (unreachable)
        )
       )
       (global.set $global$43
        (i32.sub
         (global.get $global$43)
         (i32.const 1)
        )
       )
       (block $block
        (try
         (do
          (drop
           (try (result i64)
            (do
             (i64.rotr
              (i64.atomic.load16_u acqrel offset=3
               (i64.and
                (i64.const -32767)
                (i64.const 15)
               )
              )
              (try_table (result i64) (catch_all $block)
               (global.get $global$23)
              )
             )
            )
            (catch $tag$0
             (local.set $23 (pop i64))
             (local.tee $19
              (block (result i64)
               (nop)
               (i64.const -128)
              )
             )
            )
           )
          )
          (block
           (local.set $19
            (i64.const -7141)
           )
           (br $label4)
          )
          (local.set $14
           (local.set $13
            (local.set $12
             (unreachable)
            )
           )
          )
         )
         (catch_all
          (drop
           (array.new_default $17
            (i32.and
             (i32.const 87)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (table.set $0
         (i32.const 0)
         (local.tee $2
          (global.get $global$4)
         )
        )
       )
       (drop
        (i64.const -2)
       )
       (drop
        (block (result f32)
         (local.set $scratch_42
          (f32.const -4294967296)
         )
         (drop
          (block (result (ref (exact $22)))
           (local.set $scratch
            (array.new_fixed $22 0)
           )
           (drop
            (f64.const -46)
           )
           (local.get $scratch)
          )
         )
         (local.get $scratch_42)
        )
       )
       (block
        (nop)
        (br $label4)
       )
       (unreachable)
      )
     )
    )
    (ref.func $4)
   )
   (then
    (return
     (tuple.make 6
      (ref.func $1)
      (struct.new_default_desc $10
       (struct.new $11
        (string.const "\e2\82\ac")
       )
      )
      (ref.null none)
      (f64.const 262144)
      (f64.const 9223372036854775808)
      (f64.const -1)
     )
    )
   )
   (else
    (memory.copy
     (i64.and
      (local.tee $19
       (local.get $19)
      )
      (i64.const 15)
     )
     (i64.and
      (global.get $global$23)
      (i64.const 15)
     )
     (i64.const 1)
    )
    (loop $label5
     (if
      (i32.eqz
       (global.get $global$43)
      )
      (then
       (global.set $global$43
        (i32.const 100)
       )
       (unreachable)
      )
     )
     (global.set $global$43
      (i32.sub
       (global.get $global$43)
       (i32.const 1)
      )
     )
     (nop)
     (block $block2
      (struct.set $20 2
       (struct.new $20
        (global.get $global$4)
        (ref.func $3)
        (v128.const i32x4 0xc0005601 0x0000ffa7 0xc001feff 0x0001ffca)
        (global.get $global$3)
       )
       (try (result v128)
        (do
         (drop
          (br_on_null $label5
           (array.new_fixed $22 0)
          )
         )
         (table.set $1
          (i32.const 1)
          (block $block1 (result (ref exn))
           (try_table (catch_all_ref $block1)
            (throw $tag$0
             (try_table (result i64) (catch_all $block2)
              (if (result i64)
               (local.tee $0
                (i32.const -14784)
               )
               (then
                (local.get $19)
               )
               (else
                (try_table (result i64) (catch_all $block2)
                 (local.get $19)
                )
               )
              )
             )
            )
           )
           (unreachable)
          )
         )
         (br $label5)
        )
        (catch $tag$0
         (local.set $26 (call_ref $__sinkT_0 (pop i64) (ref.func $__popsink_0)))
         (block (result v128)
          (drop
           (br_on_null $block2
            (struct.new_desc $7
             (local.get $39)
             (v128.const i32x4 0x0003270f 0x80008001 0x0001ffff 0x00010000)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
          (drop
           (br_on_null $block2
            (struct.new $20
             (local.get $2)
             (ref.as_non_null
              (ref.null nofunc)
             )
             (if (result v128)
              (i32.const 128)
              (then
               (v128.const i32x4 0x7201ff01 0x0180907b 0x00ff8089 0x00ff016b)
              )
              (else
               (local.get $40)
              )
             )
             (local.get $0)
            )
           )
          )
          (drop
           (local.get $39)
          )
          (loop $label7 (result v128)
           (if
            (i32.eqz
             (global.get $global$43)
            )
            (then
             (global.set $global$43
              (i32.const 100)
             )
             (unreachable)
            )
           )
           (global.set $global$43
            (i32.sub
             (global.get $global$43)
             (i32.const 1)
            )
           )
           (i32.store offset=4
            (i64.and
             (i64.const -72057594037927937)
             (i64.const 15)
            )
            (loop $label6 (result i32)
             (if
              (i32.eqz
               (global.get $global$43)
              )
              (then
               (global.set $global$43
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$43
              (i32.sub
               (global.get $global$43)
               (i32.const 1)
              )
             )
             (nop)
             (br_if $label6
              (i32.eqz
               (i31.get_s
                (local.get $8)
               )
              )
             )
             (local.get $0)
            )
           )
           (memory.fill
            (i64.and
             (block $block3 (result i64)
              (br_if $block3
               (local.get $19)
               (i32.eqz
                (i32.const -31)
               )
              )
             )
             (i64.const 15)
            )
            (i32.load offset=22
             (i64.and
              (local.tee $19
               (local.get $19)
              )
              (i64.const 15)
             )
            )
            (i64.shr_s
             (global.get $global$23)
             (i64.const 254)
            )
           )
           (block
            (drop
             (i64.and
              (i64x2.extract_lane 0
               (call $35
                (i16x8.ge_s
                 (v128.const i32x4 0x00000000 0x5c800000 0xc2be0000 0xd3000000)
                 (local.get $40)
                )
               )
              )
              (i64.const 15)
             )
            )
            (loop
             (if
              (i32.eqz
               (global.get $global$43)
              )
              (then
               (global.set $global$43
                (i32.const 100)
               )
               (unreachable)
              )
             )
             (global.set $global$43
              (i32.sub
               (global.get $global$43)
               (i32.const 1)
              )
             )
             (nop)
             (nop)
             (nop)
             (br $label7)
            )
            (unreachable)
           )
           (unreachable)
          )
         )
        )
       )
      )
     )
     (br_if $label5
      (ref.is_null
       (struct.new_default $21)
      )
     )
     (drop
      (block (result (ref (exact $15)))
       (local.set $scratch_48
        (tuple.extract 6 0
         (local.tee $scratch_43
          (try_table (type $24) (result (ref (exact $15)) (ref (exact $10)) (ref (exact $7)) f64 f64 f64) (catch_all $label5)
           (try (type $24) (result (ref (exact $15)) (ref (exact $10)) (ref (exact $7)) f64 f64 f64)
            (do
             (drop
              (ref.func $1)
             )
             (drop
              (struct.new_default_desc $10
               (struct.new_default $11)
              )
             )
             (block
              (if
               (i32.eqz
                (ref.eq
                 (local.tee $18
                  (ref.null none)
                 )
                 (local.get $13)
                )
               )
               (then
                (try
                 (do
                  (if
                   (i32.lt_u
                    (local.tee $38
                     (local.get $0)
                    )
                    (array.len
                     (local.tee $16
                      (local.get $13)
                     )
                    )
                   )
                   (then
                    (array.set $17
                     (local.get $16)
                     (local.get $38)
                     (global.get $global$3)
                    )
                   )
                  )
                 )
                 (catch $tag$0
                  (local.set $27 (select (pop i64) (local.get $27) (i32.const 7)))
                  (nop)
                 )
                )
                (br $label5)
               )
               (else
                (local.set $7
                 (local.get $7)
                )
                (call $fimport$0
                 (i32.const 0)
                )
               )
              )
              (br $label5)
             )
             (unreachable)
            )
            (catch $tag$0
             (local.set $28 (pop i64))
             (tuple.make 6
              (ref.func $1)
              (struct.new_default_desc $10
               (struct.new $11
                (ref.null noextern)
               )
              )
              (struct.new_default_desc $7
               (struct.new_desc $8
                (ref.i31
                 (i32.const 4096)
                )
                (ref.null none)
                (string.const "\e2\82\ac\c2\a340")
                (struct.new_default $11)
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
              (f64.const -0.242)
              (f64.const 1.173)
              (f64.const 13887)
             )
            )
            (catch_all
             (struct.set $8 0
              (struct.new_default_desc $8
               (struct.new_default_desc $9
                (ref.as_non_null
                 (ref.null none)
                )
               )
              )
              (local.get $1)
             )
             (br $label5)
            )
           )
          )
         )
        )
       )
       (drop
        (block (result (ref (exact $10)))
         (local.set $scratch_47
          (tuple.extract 6 1
           (local.get $scratch_43)
          )
         )
         (drop
          (block (result (ref (exact $7)))
           (local.set $scratch_46
            (tuple.extract 6 2
             (local.get $scratch_43)
            )
           )
           (drop
            (block (result f64)
             (local.set $scratch_45
              (tuple.extract 6 3
               (local.get $scratch_43)
              )
             )
             (drop
              (block (result f64)
               (local.set $scratch_44
                (tuple.extract 6 4
                 (local.get $scratch_43)
                )
               )
               (drop
                (tuple.extract 6 5
                 (local.get $scratch_43)
                )
               )
               (local.get $scratch_44)
              )
             )
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
     (block
      (br_if $label5
       (i32.eqz
        (i32.wrap_i64
         (local.tee $19
          (i64.extend_i32_s
           (local.get $0)
          )
         )
        )
       )
      )
      (br $label5)
     )
     (unreachable)
    )
    (unreachable)
   )
  )
  (local.set $3
   (local.set $4
    (local.set $5
     (local.set $29
      (local.set $30
       (local.set $31
        (unreachable)
       )
      )
     )
    )
   )
  )
 )
 (func $20 (type $39) (result (ref $7))
  (local $0 structref)
  (local $1 (ref $7))
  (local $2 (ref $17))
  (local $3 (ref $12))
  (local $4 (ref null $18))
  (local $5 (ref $13))
  (local $6 (ref string))
  (local $7 (ref $15))
  (local $8 i32)
  (local $9 f64)
  (local $10 f64)
  (local $11 i64)
  (local $12 i64)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (struct.new_desc $7
   (f32.const 2872317184)
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   (struct.new_desc $8
    (ref.i31
     (i32.const -26)
    )
    (struct.new_desc $7
     (call $33
      (global.get $global$5)
     )
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (struct.new_default_desc $8
      (struct.new_desc $9
       (f32.const -127)
       (struct.new_desc $10
        (i32.const -127)
        (struct.new $11
         (global.get $gimport$1)
        )
       )
      )
     )
    )
    (global.get $gimport$0)
    (struct.new $11
     (string.const "\e2\82\ac")
    )
    (struct.new_desc $9
     (f32.const 9223372036854775808)
     (struct.new_default_desc $10
      (struct.new $11
       (global.get $gimport$1)
      )
     )
    )
   )
  )
 )
 (func $21 (type $40) (param $0 i32) (result f32 (ref null $18))
  (local $1 f32)
  (local $2 v128)
  (local $3 i64)
  (local $4 (ref null $15))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (memory.copy
   (i64.and
    (i64.const 2147483647)
    (i64.const 15)
   )
   (i64.and
    (i64.const -93)
    (i64.const 15)
   )
   (local.get $3)
  )
  (call $fimport$4
   (i64.atomic.rmw32.or_u acqrel offset=22
    (i64.and
     (global.get $global$23)
     (i64.const 15)
    )
    (local.get $3)
   )
  )
  (return
   (tuple.make 2
    (f32.const 52556)
    (struct.new_default $18)
   )
  )
 )
 (func $22 (type $41) (param $0 (ref null $11)) (result (ref eq))
  (local $1 (ref $18))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (loop $label (result (ref $18))
   (if
    (i32.eqz
     (global.get $global$43)
    )
    (then
     (global.set $global$43
      (i32.const 100)
     )
     (unreachable)
    )
   )
   (global.set $global$43
    (i32.sub
     (global.get $global$43)
     (i32.const 1)
    )
   )
   (local.tee $1
    (try_table (result (ref $18)) (catch_all $label)
     (global.get $global$16)
    )
   )
  )
 )
 (func $23 (type $42) (param $0 (ref $12)) (param $1 eqref) (param $2 structref) (param $3 (ref $13)) (result (ref null $11))
  (local $4 (ref struct))
  (local $5 i64)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (struct.new_default $11)
 )
 (func $24 (type $43) (result (ref string))
  (local $0 (ref null $16))
  (local $1 stringref)
  (local $2 stringref)
  (local $3 eqref)
  (local $4 (ref null $11))
  (local $5 (ref null $18))
  (local $6 (ref null $18))
  (local $7 (ref $15))
  (local $8 (ref null $13))
  (local $9 externref)
  (local $10 (ref null $19))
  (local $11 (ref null $19))
  (local $12 (ref array))
  (local $13 (ref $2))
  (local $14 (ref null $8))
  (local $15 f64)
  (local $16 f64)
  (local $17 f64)
  (local $18 f64)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (local $22 f32)
  (local $23 i64)
  (local $24 i64)
  (local $25 i64)
  (local $26 i64)
  (local $27 i64)
  (local $28 i64)
  (local $29 i32)
  (local $30 i32)
  (local $31 v128)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (string.const "")
 )
 (func $25 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (drop
   (call $24)
  )
 )
 (func $26 (type $4) (param $0 (ref eq)) (param $1 (ref null $1)) (param $2 f32) (param $3 (ref null $1)) (param $4 (ref null $2)) (param $5 exnref) (result exnref)
  (local $6 f32)
  (local $7 f64)
  (local $8 f64)
  (local $9 i32)
  (local $10 i64)
  (local $11 structref)
  (local $12 funcref)
  (local $13 (ref null $9))
  (local $14 arrayref)
  (local.set $2
   (call $33
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (return
   (local.get $5)
  )
 )
 (func $27 (type $44) (param $0 (ref null $18)) (param $1 v128) (result (ref null $5))
  (local $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 f32)
  (local $6 (ref string))
  (local $7 (ref string))
  (local.set $1
   (call $35
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (block
   (drop
    (select
     (local.tee $4
      (call $34
       (global.get $global$19)
      )
     )
     (local.get $4)
     (block (result i32)
      (i32.store offset=4 align=1
       (i64.and
        (i64.rotl
         (i64x2.extract_lane 1
          (local.get $1)
         )
         (i64.load offset=2 align=1
          (i64.and
           (i64.trunc_f32_s
            (try_table (result f32)
             (f32.const 0)
            )
           )
           (i64.const 15)
          )
         )
        )
        (i64.const 15)
       )
       (string.measure_wtf16
        (string.const "369922")
       )
      )
      (stringview_wtf16.get_codeunit
       (string.const "267\ed\bd\88")
       (block (result i32)
        (local.set $3
         (select
          (string.compare
           (local.tee $6
            (local.tee $7
             (string.const "\ed\a0\80")
            )
           )
           (local.get $6)
          )
          (global.get $global$3)
          (try_table (result i32)
           (global.get $global$3)
          )
         )
        )
        (local.get $3)
       )
      )
     )
    )
   )
   (loop
    (if
     (i32.eqz
      (global.get $global$43)
     )
     (then
      (global.set $global$43
       (i32.const 100)
      )
      (unreachable)
     )
    )
    (global.set $global$43
     (i32.sub
      (global.get $global$43)
      (i32.const 1)
     )
    )
    (block
     (block
      (call $fimport$6
       (block (result f64)
        (nop)
        (local.get $4)
       )
      )
      (return
       (ref.null nofunc)
      )
     )
     (unreachable)
    )
    (return
     (ref.func $19)
    )
   )
   (unreachable)
  )
  (unreachable)
 )
 (func $28 (type $12) (param $0 (ref null $1)) (param $1 f64) (param $2 (ref $12)) (param $3 (ref null $12)) (result i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f64)
  (local $8 f64)
  (local $9 structref)
  (local.set $1
   (call $34
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (block (result i32)
   (data.drop $0)
   (i32.const -524287)
  )
 )
 (func $29 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (drop
   (call $28
    (struct.new_default $1)
    (f64.const -36028797018963968)
    (ref.func $13)
    (ref.func $13)
   )
  )
 )
 (func $30 (type $45) (result (ref null $6))
  (local $0 f32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 (ref $17))
  (local $6 (ref null $2))
  (local $7 (ref null $2))
  (local $8 (ref struct))
  (local $9 (ref null $7))
  (local $10 (ref null $13))
  (local $11 i31ref)
  (local $12 (ref $12))
  (local $13 externref)
  (local $14 arrayref)
  (local $15 (ref null $5))
  (local $16 (ref null $19))
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (struct.new $6
   (ref.func $1)
   (struct.new_default $3)
   (f64.const -9223372036854775808)
   (f64.const 8589934591)
   (struct.new_default_desc $9
    (struct.new_default_desc $10
     (struct.new_default $11)
    )
   )
  )
 )
 (func $31 (type $23)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (drop
   (call $30)
  )
  (drop
   (call $30)
  )
  (drop
   (call $30)
  )
 )
 (func $32 (type $13)
  (local $0 (ref $1))
  (local $1 (ref null $4))
  (local $2 (ref null $14))
  (local $3 i64)
  (local $4 f32)
  (local $5 v128)
  (if
   (i32.eqz
    (global.get $global$43)
   )
   (then
    (global.set $global$43
     (i32.const 100)
    )
    (unreachable)
   )
  )
  (global.set $global$43
   (i32.sub
    (global.get $global$43)
    (i32.const 1)
   )
  )
  (call $fimport$7
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
  (call $fimport$8
   (local.tee $0
    (struct.new $18
     (f32.const 1)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (i32.const -2147483648)
    )
   )
  )
 )
 (func $33 (type $46) (param $0 f32) (result f32)
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
 (func $34 (type $47) (param $0 f64) (result f64)
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
 (func $35 (type $48) (param $0 v128) (result v128)
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
 (type $__sinkT_0 (func (param i64) (result i64)))
 (func $__popsink_0 (type $__sinkT_0) (local.get 0))
)
