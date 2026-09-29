(module
 (rec
  (type $0 (sub (struct (field (ref $1)) (field (ref $1)) (field (ref null $2)))))
  (type $1 (struct (field v128) (field (ref null $2)) (field (mut (ref null $1))) (field v128)))
  (type $2 (struct (field nullfuncref) (field (mut f32)) (field (mut i32)) (field (mut f64))))
 )
 (rec
  (type $3 (sub (descriptor $4) (struct (field (ref $1)) (field (mut i8)) (field (ref null $8)))))
  (type $4 (sub (describes $3) (descriptor $5) (struct (field externref) (field (ref null $11)))))
  (type $5 (sub (describes $4) (struct (field (mut i8)) (field i16) (field (ref $9)) (field exnref))))
  (type $6 (sub (func (result externref (ref $12) i32 (ref null $12) anyref v128))))
  (type $7 (sub (struct (field i8) (field (ref $0)) (field (ref $9)) (field externref) (field (mut f64)) (field (mut (ref $12))))))
  (type $8 (sub (struct (field (ref $7)) (field (ref null $8)))))
  (type $9 (sub (array f32)))
  (type $10 (sub (array (mut v128))))
  (type $11 (sub final $3 (descriptor $12) (struct (field (ref $1)) (field (mut i8)) (field (ref null $8)) (field f64) (field (mut (ref $3))) (field (mut f32)))))
  (type $12 (sub final $4 (describes $11) (descriptor $13) (struct (field nullexternref) (field nullref) (field (mut v128)) (field v128))))
  (type $13 (sub $5 (describes $12) (struct (field (mut i8)) (field i16) (field (ref $9)) (field exnref) (field f64) (field (mut (ref $4))))))
 )
 (type $14 (sub final $10 (array (mut v128))))
 (rec
  (type $15 (sub (struct (field i64) (field f32) (field (mut f32)) (field (mut (ref null $16))))))
  (type $16 (sub (func (param v128 v128) (result i32))))
  (type $17 (sub (array (mut f64))))
  (type $18 (sub (func (param (ref extern)) (result f64))))
  (type $19 (sub $8 (struct (field (ref $7)) (field (ref $8)) (field (mut i32)))))
 )
 (type $20 (func))
 (type $21 (func (result (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128)))
 (type $22 (func (result (ref extern) (ref $12) i32 (ref $12) nullref v128)))
 (type $23 (array i8))
 (type $24 (func (param i32)))
 (type $25 (array (mut i16)))
 (type $26 (func (param externref)))
 (type $27 (func (param i64)))
 (type $28 (func (param f32)))
 (type $29 (struct))
 (type $30 (func (result i32 (ref null $7))))
 (type $31 (func (param i32) (result funcref)))
 (type $32 (func (param i32 funcref)))
 (type $33 (func (param f64)))
 (type $34 (func (param v128)))
 (type $35 (func (param anyref)))
 (type $36 (func (param funcref)))
 (type $37 (func (result externref)))
 (type $38 (func (param (ref $2) eqref f32 i32)))
 (type $39 (func (param (ref struct) i32)))
 (type $40 (func (result (ref null $19))))
 (type $41 (func (param funcref (ref string)) (result (ref null $3))))
 (type $42 (func (param f32 eqref) (result f32 anyref i32 i32)))
 (type $43 (func (param i32) (result i32 (ref null $15) v128)))
 (type $44 (func (param i32) (result v128)))
 (type $45 (func (param (ref $14)) (result (ref array))))
 (type $46 (func (param f32) (result f32)))
 (type $47 (func (param f64) (result f64)))
 (type $48 (func (param v128) (result v128)))
 (type $49 (func (result f32 anyref i32 i32)))
 (type $50 (func (result i32 (ref null $15) v128)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$_9" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $24) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $31) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $32) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $24) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $27) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $28) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $33) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $34) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $35) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $36) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $26) (param externref)))
 (import "fuzzing-support" "wasmtag" (tag $eimport$0 (type $24) (param i32)))
 (import "fuzzing-support" "jstag" (tag $eimport$1 (type $26) (param externref)))
 (global $global$0 i64 (i64.const -75))
 (global $global$1 i64 (i64.const 16777216))
 (global $global$2 (mut i64) (i64.const 65487))
 (global $global$3 (ref null $19) (struct.new $19
  (struct.new $7
   (i32.const -256)
   (struct.new $0
    (struct.new $1
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     (struct.new_default $2)
     (struct.new_default $1)
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (struct.new $1
     (v128.const i32x4 0xbe1a015a 0x012000fc 0x01301900 0x09a60000)
     (struct.new $2
      (ref.null nofunc)
      (f32.const -17592186044416)
      (i32.const 1073741824)
      (f64.const 4289340673)
     )
     (struct.new_default $1)
     (v128.const i32x4 0x477f8900 0x5f000000 0xc5c52800 0xc2820000)
    )
    (struct.new_default $2)
   )
   (array.new_default $9
    (i32.const 86)
   )
   (global.get $gimport$0)
   (f64.const -1048577.833)
   (struct.new_desc $12
    (ref.null noextern)
    (ref.null none)
    (v128.const i32x4 0x42ee0000 0x477fdc00 0x4f800000 0x57800000)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (struct.new $13
     (i32.const -111)
     (i32.const -31)
     (array.new $9
      (f32.const 1)
      (i32.const 97)
     )
     (ref.null noexn)
     (f64.const 18446744073709551615)
     (struct.new_desc $4
      (global.get $gimport$0)
      (struct.new_desc $11
       (struct.new $1
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (ref.null none)
        (struct.new_default $1)
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       )
       (i32.const -17828)
       (struct.new $8
        (struct.new $7
         (i32.const 134217728)
         (struct.new $0
          (struct.new $1
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           (ref.null none)
           (ref.null none)
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (struct.new_default $1)
          (ref.null none)
         )
         (array.new_default $9
          (i32.const 93)
         )
         (global.get $gimport$0)
         (f64.const 1797693134862315708145274e284)
         (struct.new_default_desc $12
          (struct.new $13
           (i32.const -72)
           (i32.const -255)
           (array.new_default $9
            (i32.const 63)
           )
           (ref.null noexn)
           (f64.const -32)
           (struct.new_desc $4
            (global.get $gimport$0)
            (ref.null none)
            (struct.new $5
             (i32.const -46)
             (i32.const 65470)
             (array.new_default $9
              (i32.const 14)
             )
             (ref.null noexn)
            )
           )
          )
         )
        )
        (ref.null none)
       )
       (f64.const 65461)
       (struct.new_desc $3
        (struct.new_default $1)
        (i32.const 2147483646)
        (ref.null none)
        (struct.new_desc $4
         (global.get $gimport$0)
         (ref.null none)
         (struct.new $5
          (i32.const -127)
          (i32.const -124)
          (array.new_default $9
           (i32.const 41)
          )
          (ref.null noexn)
         )
        )
       )
       (f32.const -2199023255552)
       (struct.new_desc $12
        (ref.null noextern)
        (ref.null none)
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (struct.new $13
         (i32.const 65526)
         (i32.const -29112)
         (array.new_default $9
          (i32.const 92)
         )
         (ref.null noexn)
         (f64.const -4194305)
         (struct.new_default_desc $4
          (struct.new $5
           (i32.const 33)
           (i32.const -11756)
           (array.new $9
            (f32.const -113)
            (i32.const 94)
           )
           (ref.null noexn)
          )
         )
        )
       )
      )
      (struct.new $5
       (i32.const 65513)
       (i32.const -128)
       (array.new $9
        (f32.const 62561)
        (i32.const 20)
       )
       (ref.null noexn)
      )
     )
    )
   )
  )
  (struct.new $8
   (struct.new $7
    (i32.const -8191)
    (struct.new $0
     (struct.new_default $1)
     (struct.new_default $1)
     (ref.null none)
    )
    (array.new_default $9
     (i32.const 4)
    )
    (global.get $gimport$0)
    (f64.const 1)
    (struct.new_default_desc $12
     (ref.null none)
    )
   )
   (ref.null none)
  )
  (i32.const -2489)
 ))
 (global $global$4 (ref null $4) (struct.new_default_desc $4
  (struct.new $5
   (i32.const -2147483648)
   (i32.const 0)
   (array.new $9
    (f32.const -7591696787562498596431765e13)
    (i32.const 36)
   )
   (ref.null noexn)
  )
 ))
 (global $global$5 (mut f64) (f64.const 68719476734.598))
 (global $global$6 (mut f64) (f64.const -0.211))
 (global $global$7 (ref null $1) (struct.new_default $1))
 (global $global$8 (mut f32) (f32.const 2147483648))
 (global $global$9 (ref null $14) (ref.null none))
 (global $global$10 (mut i32) (i32.const 100))
 (memory $0 i64 16 16 shared)
 (data $0 (i64.const 0) "g\06\b6\f9*$")
 (table $0 10 10 funcref (ref.null nofunc))
 (table $1 7 exnref)
 (elem $0 (table $0) (i32.const 0) func $6 $6 $10 $10 $12 $12 $16 $24 $26 $26)
 (elem declare func $0 $13 $5 $fimport$5)
 (tag $tag$0 (type $27) (param i64))
 (tag $tag$1 (type $20))
 (export "global$_1" (global $global$2))
 (export "global$_2" (global $global$3))
 (export "global$_7" (global $global$8))
 (export "jstag" (tag $eimport$1))
 (export "table" (table $0))
 (export "func" (func $1))
 (export "func_invoker" (func $2))
 (export "func_14_invoker" (func $4))
 (export "func_16" (func $6))
 (export "func_16_invoker" (func $7))
 (export "func_19_invoker" (func $9))
 (export "func_21_invoker" (func $11))
 (export "func_24_invoker" (func $14))
 (export "func_26" (func $15))
 (export "func_29" (func $18))
 (export "func_29_invoker" (func $19))
 (export "func_32" (func $21))
 (export "func_33" (func $22))
 (export "func_33_invoker" (func $23))
 (export "func_35_invoker" (func $25))
 (export "func_38" (func $27))
 (func $0 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (unreachable)
 )
 (func $1 (type $37) (result externref)
  (local $0 v128)
  (local $1 v128)
  (local $2 v128)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 (ref null $11))
  (local $8 (ref extern))
  (local $9 (ref null $2))
  (local $10 (ref (exact $13)))
  (local $11 (ref string))
  (local $scratch i64)
  (local $scratch_13 f32)
  (local $scratch_14 f64)
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
    (call $fimport$9
     (try $__t_3 (result (ref (exact $16))) (do (try (result (ref (exact $16))) (do 
       (call $fimport$10
        (local.tee $8
         (string.const "\e2\82\ac918\c2\a3")
        )
       )
       (ref.func $0)
      ) (delegate $__t_3))) (catch_all
       (ref.func $0)
      ))
    )
    (nop)
    (br_if $label
     (stringview_wtf16.get_codeunit
      (string.const "122")
      (block (result i32)
       (local.set $5
        (i32.const -2147483646)
       )
       (local.get $5)
      )
     )
    )
   )
   (call $fimport$4
    (local.get $6)
   )
   (call $fimport$3
    (block (result i32)
     (call $fimport$6
      (call $29
       (block (result f64)
        (local.set $scratch_14
         (f64.const 0.214)
        )
        (drop
         (block (result f32)
          (local.set $scratch_13
           (f32.const -4503599627370496)
          )
          (drop
           (block (result i64)
            (local.set $scratch
             (i64.const -1)
            )
            (drop
             (i32.const -50)
            )
            (local.get $scratch)
           )
          )
          (local.get $scratch_13)
         )
        )
        (local.get $scratch_14)
       )
      )
     )
     (i64.eq
      (i64.const 14943)
      (local.tee $6
       (local.get $6)
      )
     )
    )
   )
   (br_if $label1
    (i32.const 127)
   )
  )
  (call $fimport$9
   (ref.null nofunc)
  )
  (return
   (ref.null noextern)
  )
 )
 (func $2 (type $20)
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
   (call $1)
  )
 )
 (func $3 (type $38) (param $0 (ref $2)) (param $1 eqref) (param $2 f32) (param $3 i32)
  (local $4 (ref $7))
  (local $5 (ref $2))
  (local $6 (ref $2))
  (local $7 (ref null $13))
  (local $8 (ref $8))
  (local $9 (ref $8))
  (local $10 (ref string))
  (local $11 f64)
  (local $12 f64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i32)
  (local.set $2
   (call $28
    (local.get $2)
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
 )
 (func $4 (type $20)
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
   (call $fimport$9
    (ref.func $0)
   )
   (nop)
   (br $label)
  )
  (unreachable)
 )
 (func $5 (type $6) (result externref (ref $12) i32 (ref null $12) anyref v128)
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
  (unreachable)
 )
 (func $6 (type $16) (param $0 v128) (param $1 v128) (result i32)
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
  (local $14 f64)
  (local $15 f64)
  (local $16 (ref string))
  (local $17 (ref null $19))
  (local $18 (ref $1))
  (local $19 (ref null $1))
  (local $20 (ref null $9))
  (local $21 (ref null $12))
  (local $22 (ref $12))
  (local $23 (ref $14))
  (local $24 (ref $14))
  (local $25 (ref $14))
  (local $26 (ref $14))
  (local $27 (ref $14))
  (local $28 (ref $14))
  (local $29 (ref i31))
  (local $30 (ref null $7))
  (local $31 (ref struct))
  (local $32 (ref $4))
  (local $33 (ref null $6))
  (local $scratch (tuple i32 (ref null $7)))
  (local $scratch_35 i32)
  (local $scratch_36 i64)
  (local $scratch_37 v128)
  (local $scratch_38 v128)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (local.set $22
   (struct.new_desc $12
    (ref.null noextern)
    (ref.null none)
    (local.get $1)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (struct.new $13
     (i32.const -719608)
     (i32.const 0)
     (array.new $9
      (f32.const -45)
      (i32.and
       (i32.const 17)
       (i32.const 1023)
      )
     )
     (ref.null noexn)
     (f64.const 0)
     (struct.new_desc $4
      (string.const "\c2\a3")
      (struct.new_desc $11
       (ref.as_non_null
        (local.get $19)
       )
       (i32.const -4096)
       (struct.new $19
        (struct.new $7
         (local.get $5)
         (struct.new $0
          (struct.new $1
           (local.get $0)
           (ref.null none)
           (ref.as_non_null
            (local.get $19)
           )
           (local.get $1)
          )
          (struct.new $1
           (local.get $1)
           (ref.as_non_null
            (ref.null none)
           )
           (ref.as_non_null
            (local.get $19)
           )
           (local.get $0)
          )
          (ref.null none)
         )
         (array.new $9
          (f32.const 65505)
          (i32.and
           (i32.const 81)
           (i32.const 1023)
          )
         )
         (string.const "\ed\bd\88\e2\82\ac\f0\90\8d\88")
         (f64.const 0)
         (struct.new_desc $12
          (ref.null noextern)
          (ref.null none)
          (local.get $0)
          (local.get $1)
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
        (struct.new $19
         (struct.new $7
          (local.get $5)
          (struct.new $0
           (ref.as_non_null
            (local.get $19)
           )
           (ref.as_non_null
            (local.get $19)
           )
           (ref.null none)
          )
          (array.new_default $9
           (i32.and
            (i32.const 33)
            (i32.const 1023)
           )
          )
          (global.get $gimport$0)
          (local.get $14)
          (struct.new_desc $12
           (ref.null noextern)
           (ref.null none)
           (v128.const i32x4 0xff0102ff 0x002fffff 0x2001ed66 0x011aff15)
           (local.get $0)
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
         (struct.new $19
          (struct.new $7
           (local.get $5)
           (ref.as_non_null
            (ref.null none)
           )
           (ref.as_non_null
            (local.get $20)
           )
           (string.const "\ed\a0\80")
           (f64.const -8589934590.688)
           (ref.as_non_null
            (local.get $21)
           )
          )
          (struct.new $8
           (ref.as_non_null
            (ref.null none)
           )
           (ref.as_non_null
            (local.get $17)
           )
          )
          (local.get $5)
         )
         (i32.const 58)
        )
        (local.get $5)
       )
       (f64.const 0)
       (struct.new_desc $3
        (struct.new $1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (ref.null none)
         (struct.new $1
          (v128.const i32x4 0xf4600000 0x41efffff 0xe978d4fe 0xc05ff126)
          (struct.new $2
           (ref.null nofunc)
           (f32.const 0)
           (local.get $5)
           (local.get $14)
          )
          (struct.new_default $1)
          (local.get $0)
         )
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
        (local.get $5)
        (ref.null none)
        (struct.new_desc $4
         (global.get $gimport$0)
         (ref.as_non_null
          (ref.null none)
         )
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
       (f32.const 4294967296)
       (ref.as_non_null
        (ref.null none)
       )
      )
      (struct.new $5
       (local.get $5)
       (local.get $5)
       (array.new_default $9
        (i32.and
         (i32.const 63)
         (i32.const 1023)
        )
       )
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$1)
        )
        (unreachable)
       )
      )
     )
    )
   )
  )
  (local.set $21
   (struct.new_default_desc $12
    (struct.new $13
     (local.get $5)
     (local.get $5)
     (array.new_default $9
      (i32.and
       (i32.const 82)
       (i32.const 1023)
      )
     )
     (ref.null noexn)
     (local.get $14)
     (struct.new_desc $12
      (ref.null noextern)
      (ref.null none)
      (local.get $0)
      (local.get $0)
      (struct.new $13
       (i32.const -1620743926)
       (local.get $5)
       (array.new $9
        (f32.const 1)
        (i32.and
         (i32.const 74)
         (i32.const 1023)
        )
       )
       (block $block1 (result (ref exn))
        (try_table (catch_all_ref $block1)
         (throw $tag$1)
        )
        (unreachable)
       )
       (local.get $14)
       (struct.new_default_desc $12
        (struct.new $13
         (i32.const -33554433)
         (local.get $5)
         (array.new_default $9
          (i32.and
           (i32.const 70)
           (i32.const 1023)
          )
         )
         (block $block2 (result (ref exn))
          (try_table (catch_all_ref $block2)
           (throw $tag$1)
          )
          (unreachable)
         )
         (local.get $14)
         (struct.new_default_desc $4
          (struct.new $5
           (local.get $5)
           (local.get $5)
           (ref.as_non_null
            (local.get $20)
           )
           (block $block3 (result (ref exn))
            (try_table (catch_all_ref $block3)
             (throw $tag$1)
            )
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
  (if
   (i32.lt_u
    (local.tee $13
     (block (result i32)
      (if
       (i32.lt_u
        (local.tee $10
         (try_table (result i32)
          (ref.eq
           (array.new_default $17
            (i32.and
             (i32.const 97)
             (i32.const 1023)
            )
           )
           (array.new_default $17
            (i32.and
             (i32.const 63)
             (i32.const 1023)
            )
           )
          )
         )
        )
        (array.len
         (local.tee $25
          (array.new $14
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           (i32.and
            (i32.const 81)
            (i32.const 1023)
           )
          )
         )
        )
       )
       (then
        (drop
         (local.get $25)
        )
        (drop
         (local.get $10)
        )
        (block
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
          (br_if $label
           (i32.atomic.rmw16.or_u offset=22
            (i64.and
             (i64.atomic.load8_u offset=4
              (i64.and
               (local.tee $2
                (i64.const -70368744177664)
               )
               (i64.const 15)
              )
             )
             (i64.const 15)
            )
            (ref.test (ref string)
             (local.tee $16
              (string.const "\e2\82\ac957\e2\82\ac")
             )
            )
           )
          )
         )
         (nop)
         (drop
          (i32.const 65120)
         )
         (drop
          (i32.const -127)
         )
         (block
          (nop)
          (return
           (i32.const -6142)
          )
         )
         (unreachable)
        )
        (unreachable)
       )
      )
      (local.get $5)
     )
    )
    (array.len
     (local.tee $28
      (select (result (ref $14))
       (array.new $14
        (local.get $1)
        (i32.and
         (i32.const 19)
         (i32.const 1023)
        )
       )
       (local.tee $27
        (array.new_default $14
         (i32.and
          (i32.const 92)
          (i32.const 1023)
         )
        )
       )
       (block $block6 (result i32)
        (block $block4
         (if
          (i32.eqz
           (br_if $block6
            (ref.is_null
             (ref.func $5)
            )
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
             (drop
              (br_on_null $label1
               (try_table (result (ref i31)) (catch_all $block4)
                (local.tee $29
                 (ref.i31
                  (i32.const -8)
                 )
                )
               )
              )
             )
             (local.set $14
              (local.tee $14
               (call $29
                (f64.load offset=4 align=4
                 (i64.and
                  (local.get $2)
                  (i64.const 15)
                 )
                )
               )
              )
             )
             (try $__t_2  (do (try  (do 
               (v128.store offset=4 align=2
                (i64.and
                 (local.get $2)
                 (i64.const 15)
                )
                (select
                 (local.get $0)
                 (local.get $0)
                 (i64.gt_u
                  (i64.const 1024)
                  (local.get $2)
                 )
                )
               )
              ) (delegate $__t_2))) (catch $tag$0
(global.set $global$2 (pop i64))
(if (global.get $__rt) (then (rethrow $__t_2)))
(loop $label2
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
                (try_table (catch_all $block4)
                 (br_if $label2
                  (i32.trunc_f32_s
                   (call $28
                    (f32.load offset=4 align=1
                     (i64.and
                      (local.get $2)
                      (i64.const 15)
                     )
                    )
                   )
                  )
                 )
                )
               )))
             (br_if $label1
              (i32.const 1546741270)
             )
             (drop
              (br_on_null $block4
               (ref.null none)
              )
             )
             (i32.clz
              (select
               (local.get $5)
               (i64.ge_u
                (local.get $2)
                (block $block5 (result i64)
                 (local.set $5
                  (try_table (result i32) (catch $tag$0 $block5) (catch $tag$0 $block5) (catch_all $block4)
                   (i32.const -32768)
                  )
                 )
                 (local.get $2)
                )
               )
               (i32.const 127)
              )
             )
            )
           )
          )
          (then
           (call $fimport$4
            (local.get $2)
           )
           (call $fimport$2
            (ref.eq
             (local.tee $22
              (select (result (ref $12))
               (local.get $22)
               (ref.as_non_null
                (local.get $21)
               )
               (i31.get_s
                (ref.i31
                 (i32.const 65427)
                )
               )
              )
             )
             (array.new_fixed $23 0)
            )
            (call $fimport$1
             (block (result i32)
              (local.set $scratch_35
               (tuple.extract 2 0
                (local.tee $scratch
                 (loop $label3 (type $30) (result i32 (ref null $7))
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
                  (br_if $label3
                   (br_if $block6
                    (local.get $5)
                    (local.get $5)
                   )
                  )
                  (br_if $label3
                   (local.get $5)
                  )
                  (tuple.make 2
                   (local.get $11)
                   (local.get $30)
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
              (local.get $scratch_35)
             )
            )
           )
           (call $fimport$0
            (i32.const 0)
           )
          )
          (else
           (block $block7
            (call $fimport$0
             (i32.const 0)
            )
            (if
             (i32.lt_u
              (local.tee $12
               (ref.eq
                (struct.new $2
                 (ref.null nofunc)
                 (f32.const 4294958336)
                 (local.get $5)
                 (if (result f64)
                  (local.get $5)
                  (then
                   (call_ref $28
                    (if (result f32)
                     (i32.eqz
                      (i32.const -1624725)
                     )
                     (then
                      (f32.const 0)
                     )
                     (else
                      (call $28
                       (global.get $global$8)
                      )
                     )
                    )
                    (ref.func $fimport$5)
                   )
                   (if (result f64)
                    (i32.eqz
                     (local.get $5)
                    )
                    (then
                     (local.get $14)
                    )
                    (else
                     (local.get $14)
                    )
                   )
                  )
                  (else
                   (if
                    (i32.eqz
                     (i32.const -18658)
                    )
                    (then
                     (nop)
                    )
                    (else
                     (return
                      (i32.const 490235989)
                     )
                    )
                   )
                   (nop)
                   (br $block7)
                  )
                 )
                )
                (struct.new_default $29)
               )
              )
              (array.len
               (local.tee $26
                (array.new $14
                 (call $30
                  (i32x4.extend_high_i16x8_u
                   (local.tee $0
                    (v128.const i32x4 0x00800000 0x4f800000 0xd7800000 0x4f800000)
                   )
                  )
                 )
                 (i32.and
                  (i32.const 15)
                  (i32.const 1023)
                 )
                )
               )
              )
             )
             (then
              (array.set $14
               (local.get $26)
               (local.get $12)
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              )
             )
            )
           )
          )
         )
         (drop
          (br_on_null $block4
           (local.tee $33
            (ref.cast (ref nofunc)
             (loop (result (ref nofunc))
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
               (ref.null nofunc)
              )
             )
            )
           )
          )
         )
         (drop
          (br_on_null $block4
           (ref.cast (ref nofunc)
            (ref.null nofunc)
           )
          )
         )
         (drop
          (block (result v128)
           (local.set $scratch_38
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
           (drop
            (block (result v128)
             (local.set $scratch_37
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
             (drop
              (block (result i64)
               (local.set $scratch_36
                (i64.const -32768)
               )
               (local.set $15
                (f64.const 2147483649.139)
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
         (local.set $14
          (local.tee $14
           (call $29
            (local.get $15)
           )
          )
         )
        )
        (return
         (i32.const -32767)
        )
       )
      )
     )
    )
   )
   (then
    (array.set $14
     (local.get $28)
     (local.get $13)
     (local.tee $0
      (call $30
       (i32x4.extmul_low_i16x8_u
        (local.get $1)
        (v128.const i32x4 0xfb6c2f00 0xc0af1f45 0x00ff0025 0x005f0080)
       )
      )
     )
    )
   )
  )
  (return
   (i32.const -64)
  )
 )
 (func $7 (type $20)
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
   (call $6
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (v128.const i32x4 0x00ef5322 0xe000ffff 0x00005d23 0x000000df)
   )
  )
 )
 (func $8 (type $6) (result externref (ref $12) i32 (ref null $12) anyref v128)
  (local $0 f64)
  (local $1 f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 v128)
  (local $6 v128)
  (local $7 v128)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 (ref null $3))
  (local $14 (ref string))
  (local $15 (ref extern))
  (local $16 (ref $12))
  (local $17 (ref $12))
  (local $18 nullref)
  (local $19 nullref)
  (local $20 externref)
  (local $21 (ref null $12))
  (local $22 (ref null $12))
  (local $23 (ref i31))
  (local $scratch (tuple (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128))
  (local $scratch_25 nullref)
  (local $scratch_26 (ref (exact $12)))
  (local $scratch_27 i32)
  (local $scratch_28 (ref (exact $12)))
  (local $scratch_29 (ref extern))
  (local $scratch_30 nullref)
  (local $scratch_31 (ref $12))
  (local $scratch_32 i32)
  (local $scratch_33 (ref $12))
  (local $scratch_34 (ref extern))
  (local $scratch_35 (tuple (ref extern) (ref $12) i32 (ref $12) nullref v128))
  (local $scratch_36 nullref)
  (local $scratch_37 (ref $12))
  (local $scratch_38 i32)
  (local $scratch_39 (ref $12))
  (local $scratch_40 (ref extern))
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
  (if (type $22) (result (ref extern) (ref $12) i32 (ref $12) nullref v128)
   (i32.eqz
    (i32.popcnt
     (string.measure_wtf16
      (local.tee $14
       (try $__t_1 (result (ref string)) (do (try (result (ref string)) (do 
         (string.const "\c2\a3\ed\a0\80\c2\a3")
        ) (delegate $__t_1))) (catch $tag$0
(local.set $3 (i64.mul (pop i64) (i64.const -1)))
(if (global.get $__rt) (then (rethrow $__t_1)))
(loop (result (ref string))
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
          (block (result (ref string))
           (nop)
           (string.const "\e2\82\ac\ed\a0\80")
          )
         )))
      )
     )
    )
   )
   (then
    (local.set $20
     (block (result (ref extern))
      (local.set $scratch_29
       (tuple.extract 6 0
        (local.tee $scratch
         (loop (type $21) (result (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128)
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
          (block (type $21) (result (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128)
           (drop
            (struct.new_default $15)
           )
           (loop (type $21) (result (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128)
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
            (block (type $21) (result (ref extern) (ref (exact $12)) i32 (ref (exact $12)) nullref v128)
             (nop)
             (tuple.make 6
              (global.get $gimport$1)
              (struct.new_default_desc $12
               (select (result (ref (exact $13)))
                (struct.new $13
                 (i32.const -120)
                 (local.get $12)
                 (array.new_default $9
                  (i32.and
                   (i32.const 99)
                   (i32.const 1023)
                  )
                 )
                 (block $block (result (ref exn))
                  (try_table (catch_all_ref $block)
                   (throw $tag$1)
                  )
                  (unreachable)
                 )
                 (f64.const -1)
                 (struct.new_default_desc $4
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
                (struct.new $13
                 (i32.const 33554433)
                 (local.get $12)
                 (array.new $9
                  (call $28
                   (global.get $global$8)
                  )
                  (i32.and
                   (i32.const 18)
                   (i32.const 1023)
                  )
                 )
                 (block $block1 (result (ref exn))
                  (try_table (catch_all_ref $block1)
                   (throw $tag$1)
                  )
                  (unreachable)
                 )
                 (f64.const 0)
                 (struct.new_desc $4
                  (string.const "")
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
                (i32.const 124)
               )
              )
              (i32.const -48)
              (struct.new_default_desc $12
               (struct.new $13
                (i32.const -2147483647)
                (local.get $12)
                (array.new_default $9
                 (i32.and
                  (i32.const 7)
                  (i32.const 1023)
                 )
                )
                (block $block2 (result (ref exn))
                 (try_table (catch_all_ref $block2)
                  (throw $tag$1)
                 )
                 (unreachable)
                )
                (f64.const 0)
                (struct.new_default_desc $12
                 (struct.new $13
                  (i32.const -313111293)
                  (i32.const -48)
                  (ref.as_non_null
                   (ref.null none)
                  )
                  (block $block3 (result (ref exn))
                   (try_table (catch_all_ref $block3)
                    (throw $tag$1)
                   )
                   (unreachable)
                  )
                  (f64.const 131072.839)
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
               )
              )
              (ref.null none)
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
            )
           )
          )
         )
        )
       )
      )
      (local.set $21
       (block (result (ref (exact $12)))
        (local.set $scratch_28
         (tuple.extract 6 1
          (local.get $scratch)
         )
        )
        (local.set $11
         (block (result i32)
          (local.set $scratch_27
           (tuple.extract 6 2
            (local.get $scratch)
           )
          )
          (local.set $22
           (block (result (ref (exact $12)))
            (local.set $scratch_26
             (tuple.extract 6 3
              (local.get $scratch)
             )
            )
            (local.set $19
             (block (result nullref)
              (local.set $scratch_25
               (tuple.extract 6 4
                (local.get $scratch)
               )
              )
              (local.set $7
               (tuple.extract 6 5
                (local.get $scratch)
               )
              )
              (local.get $scratch_25)
             )
            )
            (local.get $scratch_26)
           )
          )
          (local.get $scratch_27)
         )
        )
        (local.get $scratch_28)
       )
      )
      (local.get $scratch_29)
     )
    )
    (tuple.make 6
     (local.tee $15
      (block (result (ref extern))
       (local.set $scratch_34
        (ref.as_non_null
         (local.get $20)
        )
       )
       (local.set $16
        (block (result (ref $12))
         (local.set $scratch_33
          (ref.as_non_null
           (local.get $21)
          )
         )
         (local.set $10
          (block (result i32)
           (local.set $scratch_32
            (local.get $11)
           )
           (local.set $17
            (block (result (ref $12))
             (local.set $scratch_31
              (ref.as_non_null
               (local.get $22)
              )
             )
             (local.set $18
              (block (result nullref)
               (local.set $scratch_30
                (local.get $19)
               )
               (local.set $6
                (call $30
                 (local.get $7)
                )
               )
               (local.get $scratch_30)
              )
             )
             (local.get $scratch_31)
            )
           )
           (local.get $scratch_32)
          )
         )
         (local.get $scratch_33)
        )
       )
       (local.get $scratch_34)
      )
     )
     (local.get $16)
     (local.get $10)
     (local.get $17)
     (local.get $18)
     (local.get $6)
    )
   )
   (else
    (nop)
    (tuple.make 6
     (local.tee $15
      (block (result (ref extern))
       (local.set $scratch_40
        (tuple.extract 6 0
         (local.tee $scratch_35
          (loop (type $22) (result (ref extern) (ref $12) i32 (ref $12) nullref v128)
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
           (tuple.make 6
            (ref.as_non_null
             (local.get $20)
            )
            (ref.as_non_null
             (local.get $21)
            )
            (local.get $11)
            (ref.as_non_null
             (local.get $22)
            )
            (local.get $19)
            (call $30
             (local.get $7)
            )
           )
          )
         )
        )
       )
       (local.set $16
        (block (result (ref $12))
         (local.set $scratch_39
          (tuple.extract 6 1
           (local.get $scratch_35)
          )
         )
         (local.set $10
          (block (result i32)
           (local.set $scratch_38
            (tuple.extract 6 2
             (local.get $scratch_35)
            )
           )
           (local.set $17
            (block (result (ref $12))
             (local.set $scratch_37
              (tuple.extract 6 3
               (local.get $scratch_35)
              )
             )
             (local.set $18
              (block (result nullref)
               (local.set $scratch_36
                (tuple.extract 6 4
                 (local.get $scratch_35)
                )
               )
               (local.set $6
                (tuple.extract 6 5
                 (local.get $scratch_35)
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
       (local.get $scratch_40)
      )
     )
     (local.get $16)
     (local.get $10)
     (local.get $17)
     (local.get $18)
     (local.get $6)
    )
   )
  )
 )
 (func $9 (type $20)
  (local $scratch (tuple externref (ref $12) i32 (ref null $12) anyref v128))
  (local $scratch_1 anyref)
  (local $scratch_2 (ref null $12))
  (local $scratch_3 i32)
  (local $scratch_4 (ref $12))
  (local $scratch_5 externref)
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
   (block (result externref)
    (local.set $scratch_5
     (tuple.extract 6 0
      (local.tee $scratch
       (call $8)
      )
     )
    )
    (drop
     (block (result (ref $12))
      (local.set $scratch_4
       (tuple.extract 6 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result i32)
        (local.set $scratch_3
         (tuple.extract 6 2
          (local.get $scratch)
         )
        )
        (drop
         (block (result (ref null $12))
          (local.set $scratch_2
           (tuple.extract 6 3
            (local.get $scratch)
           )
          )
          (drop
           (block (result anyref)
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
 )
 (func $10 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local $2 i32)
  (local $3 (ref null $10))
  (local $4 (ref null $16))
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (throw $tag$0
   (i64.const -14)
  )
 )
 (func $11 (type $20)
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
   (call $10
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (drop
   (call $10
    (v128.const i32x4 0x0167ff7c 0x5a010001 0xfe17db00 0xf019f445)
    (v128.const i32x4 0x80000000 0x00000000 0x00000002 0x80000000)
   )
  )
 )
 (func $12 (type $39) (param $0 (ref struct)) (param $1 i32)
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
 )
 (@binaryen.js.called)
 (func $13 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local $2 (ref $17))
  (local $3 (ref eq))
  (local $4 (ref null $11))
  (local $5 (ref $19))
  (local $6 (ref null $0))
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 v128)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (f64.store offset=22 align=1
   (i64.and
    (i64.const 2147483648)
    (i64.const 15)
   )
   (f64.const 9064)
  )
  (return
   (i32.const -134217727)
  )
 )
 (func $14 (type $20)
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
   (call $13
    (v128.const i32x4 0x00000001 0x00000000 0x003fffff 0x00000000)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $15 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (block (result i32)
   (call $fimport$7
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
   (i32.const -96)
  )
 )
 (func $16 (type $40) (result (ref null $19))
  (local $0 v128)
  (local $1 i64)
  (local $2 f64)
  (local $3 f32)
  (local $4 (ref $25))
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
  (block (result (ref (exact $19)))
   (call $fimport$3
    (i32.const 0)
   )
   (struct.new $19
    (struct.new $7
     (i32.const 0)
     (struct.new $0
      (struct.new $1
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (struct.new $2
        (ref.null nofunc)
        (local.get $3)
        (i32.const -2048)
        (f64.const -268435455.507)
       )
       (struct.new_default $1)
       (local.get $0)
      )
      (struct.new $1
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (struct.new $2
        (ref.null nofunc)
        (f32.const -2147483648)
        (i32.const -59)
        (local.get $2)
       )
       (global.get $global$7)
       (local.get $0)
      )
      (struct.new_default $2)
     )
     (array.new_default $9
      (i32.and
       (i32.const 29)
       (i32.const 1023)
      )
     )
     (string.const "\e2\82\ac\e2\82\ac374")
     (f64.const 0)
     (struct.new_desc $12
      (ref.null noextern)
      (ref.null none)
      (local.get $0)
      (local.get $0)
      (struct.new $13
       (i32.const 0)
       (i32.const -67108864)
       (array.new $9
        (local.get $3)
        (i32.and
         (i32.const 91)
         (i32.const 1023)
        )
       )
       (block $block (result (ref exn))
        (try_table (catch_all_ref $block)
         (throw $tag$1)
        )
        (unreachable)
       )
       (local.get $2)
       (struct.new_desc $4
        (string.const "\ed\a0\80\e2\82\ac\e2\82\ac")
        (struct.new_desc $11
         (struct.new_default $1)
         (i32.const -15)
         (struct.new $19
          (ref.as_non_null
           (ref.null none)
          )
          (ref.as_non_null
           (ref.null none)
          )
          (i32.const -12)
         )
         (f64.const -2147483648.119)
         (struct.new_desc $11
          (ref.as_non_null
           (ref.null none)
          )
          (i32.const -31)
          (ref.as_non_null
           (ref.null none)
          )
          (local.get $2)
          (ref.as_non_null
           (ref.null none)
          )
          (f32.const 4294967296)
          (ref.as_non_null
           (ref.null none)
          )
         )
         (f32.const 8190.791015625)
         (ref.as_non_null
          (ref.null none)
         )
        )
        (struct.new $5
         (i32.const -65535)
         (i32.const -5879530)
         (ref.as_non_null
          (ref.null none)
         )
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
    )
    (struct.new $19
     (struct.new $7
      (i32.const -32769)
      (struct.new $0
       (struct.new_default $1)
       (struct.new_default $1)
       (struct.new_default $2)
      )
      (array.new_default $9
       (i32.and
        (i32.const 45)
        (i32.const 1023)
       )
      )
      (string.const "\ed\bd\88\ed\a0\80\c2\a3")
      (local.get $2)
      (struct.new_default_desc $12
       (struct.new $13
        (i32.const -1447)
        (i32.const -104)
        (array.new $9
         (local.get $3)
         (i32.and
          (i32.const 84)
          (i32.const 1023)
         )
        )
        (block $block2 (result (ref exn))
         (try_table (catch_all_ref $block2)
          (throw $tag$1)
         )
         (unreachable)
        )
        (local.get $2)
        (struct.new_default_desc $4
         (struct.new $5
          (i32.const -4096)
          (i32.const -50)
          (array.new $9
           (local.get $3)
           (i32.and
            (i32.const 73)
            (i32.const 1023)
           )
          )
          (block $block3 (result (ref exn))
           (try_table (catch_all_ref $block3)
            (throw $tag$1)
           )
           (unreachable)
          )
         )
        )
       )
      )
     )
     (struct.new $19
      (struct.new $7
       (i32.const 128)
       (struct.new $0
        (struct.new $1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (struct.new_default $2)
         (ref.null none)
         (local.get $0)
        )
        (struct.new_default $1)
        (struct.new $2
         (ref.null nofunc)
         (f32.const 4294954240)
         (i32.const 214)
         (local.get $2)
        )
       )
       (array.new_default $9
        (i32.and
         (i32.const 94)
         (i32.const 1023)
        )
       )
       (global.get $gimport$0)
       (local.get $2)
       (struct.new_default_desc $12
        (struct.new $13
         (i32.const 16777217)
         (i32.const 129)
         (array.new $9
          (call $28
           (global.get $global$8)
          )
          (i32.and
           (i32.const 26)
           (i32.const 1023)
          )
         )
         (block $block4 (result (ref exn))
          (try_table (catch_all_ref $block4)
           (throw $tag$1)
          )
          (unreachable)
         )
         (local.get $2)
         (struct.new_desc $12
          (ref.null noextern)
          (ref.null none)
          (local.get $0)
          (local.get $0)
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
       )
      )
      (struct.new $19
       (struct.new $7
        (i32.const -254)
        (struct.new $0
         (struct.new $1
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          (struct.new $2
           (ref.null nofunc)
           (local.get $3)
           (i32.const -20)
           (f64.const -524287)
          )
          (struct.new_default $1)
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (struct.new $1
          (local.get $0)
          (struct.new $2
           (ref.null nofunc)
           (call $28
            (global.get $global$8)
           )
           (i32.const -1842778282)
           (local.get $2)
          )
          (struct.new_default $1)
          (local.get $0)
         )
         (struct.new $2
          (ref.null nofunc)
          (local.get $3)
          (i32.const 52843)
          (f64.const 0)
         )
        )
        (array.new_default $9
         (i32.and
          (i32.const 7)
          (i32.const 1023)
         )
        )
        (global.get $gimport$1)
        (f64.const -1797693134862315708145274e284)
        (struct.new_desc $12
         (ref.null noextern)
         (ref.null none)
         (v128.const i32x4 0xedaef8ee 0x21c2ff00 0x0092c05a 0x0078616e)
         (local.get $0)
         (struct.new $13
          (i32.const -33554431)
          (i32.const -14563)
          (ref.as_non_null
           (ref.null none)
          )
          (ref.null noexn)
          (local.get $2)
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
       )
       (struct.new $8
        (struct.new $7
         (i32.const 5223)
         (struct.new $0
          (struct.new_default $1)
          (struct.new_default $1)
          (struct.new $2
           (ref.null nofunc)
           (local.get $3)
           (i32.const 67108864)
           (f64.const -6717615)
          )
         )
         (array.new $9
          (local.get $3)
          (i32.and
           (i32.const 55)
           (i32.const 1023)
          )
         )
         (string.const "\ed\a0\80")
         (f64.const 0)
         (struct.new_default_desc $12
          (struct.new $13
           (i32.const -32768)
           (i32.const -34)
           (array.new_default $9
            (i32.and
             (i32.const 41)
             (i32.const 1023)
            )
           )
           (ref.null noexn)
           (f64.const 1152921504606846976)
           (struct.new_default_desc $4
            (struct.new $5
             (i32.const -64)
             (i32.const 129)
             (ref.as_non_null
              (ref.null none)
             )
             (block $block5 (result (ref exn))
              (try_table (catch_all_ref $block5)
               (throw $tag$1)
              )
              (unreachable)
             )
            )
           )
          )
         )
        )
        (struct.new $19
         (struct.new $7
          (i32.const -2482382)
          (struct.new $0
           (struct.new $1
            (local.get $0)
            (struct.new $2
             (ref.null nofunc)
             (f32.const -0)
             (i32.const -33554433)
             (local.get $2)
            )
            (global.get $global$7)
            (local.get $0)
           )
           (struct.new_default $1)
           (struct.new $2
            (ref.null nofunc)
            (local.get $3)
            (i32.const -26608)
            (local.get $2)
           )
          )
          (array.new_default $9
           (i32.and
            (i32.const 55)
            (i32.const 1023)
           )
          )
          (global.get $gimport$1)
          (local.get $2)
          (struct.new_default_desc $12
           (struct.new $13
            (i32.const -4)
            (i32.const 2097152)
            (array.new_default $9
             (i32.and
              (i32.const 92)
              (i32.const 1023)
             )
            )
            (block $block6 (result (ref exn))
             (try_table (catch_all_ref $block6)
              (throw $tag$1)
             )
             (unreachable)
            )
            (f64.const -10414)
            (struct.new_desc $12
             (ref.null noextern)
             (ref.null none)
             (local.get $0)
             (v128.const i32x4 0x00000000 0x40701000 0x00000000 0x4064c000)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
         )
         (struct.new $19
          (struct.new $7
           (i32.const -2048)
           (struct.new $0
            (struct.new $1
             (local.get $0)
             (ref.as_non_null
              (ref.null none)
             )
             (ref.as_non_null
              (ref.null none)
             )
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            )
            (struct.new $1
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (ref.null none)
             (ref.as_non_null
              (ref.null none)
             )
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            )
            (struct.new $2
             (ref.null nofunc)
             (call $28
              (global.get $global$8)
             )
             (i32.const -2147483648)
             (f64.const 0)
            )
           )
           (array.new $9
            (local.get $3)
            (i32.and
             (i32.const 99)
             (i32.const 1023)
            )
           )
           (ref.null noextern)
           (f64.const -2147483646.772)
           (struct.new_default_desc $12
            (struct.new $13
             (i32.const -268435457)
             (i32.const 65318)
             (ref.as_non_null
              (ref.null none)
             )
             (block $block7 (result (ref exn))
              (try_table (catch_all_ref $block7)
               (throw $tag$1)
              )
              (unreachable)
             )
             (f64.const -11262)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
          (struct.new $8
           (struct.new $7
            (i32.const -35)
            (struct.new $0
             (ref.as_non_null
              (ref.null none)
             )
             (ref.as_non_null
              (ref.null none)
             )
             (ref.null none)
            )
            (array.new_default $9
             (i32.and
              (i32.const 5)
              (i32.const 1023)
             )
            )
            (string.const "")
            (f64.const -3402823466385288598117041e14)
            (struct.new_default_desc $12
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
           (struct.new $19
            (struct.new $7
             (i32.const 65531)
             (ref.as_non_null
              (ref.null none)
             )
             (ref.as_non_null
              (ref.null none)
             )
             (ref.null noextern)
             (f64.const -15)
             (ref.as_non_null
              (ref.null none)
             )
            )
            (struct.new $19
             (ref.as_non_null
              (ref.null none)
             )
             (ref.as_non_null
              (ref.null none)
             )
             (i32.const -2147483648)
            )
            (i32.const -23)
           )
          )
          (i32.const -268435456)
         )
         (i32.const 47189)
        )
       )
       (i32.const -7)
      )
      (i32.const 1048576)
     )
     (i32.const -18900)
    )
    (i32.const 425333795)
   )
  )
 )
 (func $17 (type $41) (param $0 funcref) (param $1 (ref string)) (result (ref null $3))
  (local $2 f64)
  (local $3 (ref null $0))
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
  (return
   (ref.null none)
  )
 )
 (func $18 (type $42) (param $0 f32) (param $1 eqref) (result f32 anyref i32 i32)
  (local.set $0
   (call $28
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
   (tuple.make 4
    (f32.const 65482)
    (array.new_fixed $23 0)
    (i32.const -17)
    (i32.const -8354)
   )
  )
 )
 (func $19 (type $20)
  (local $scratch (tuple f32 anyref i32 i32))
  (local $scratch_1 i32)
  (local $scratch_2 anyref)
  (local $scratch_3 f32)
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
   (block (result f32)
    (local.set $scratch_3
     (tuple.extract 4 0
      (local.tee $scratch
       (call $18
        (f32.const 4294967296)
        (struct.new_default $29)
       )
      )
     )
    )
    (drop
     (block (result anyref)
      (local.set $scratch_2
       (tuple.extract 4 1
        (local.get $scratch)
       )
      )
      (drop
       (block (result i32)
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
 (func $20 (type $43) (param $0 i32) (result i32 (ref null $15) v128)
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
  (tuple.make 3
   (i32.const -16777216)
   (ref.null none)
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
 )
 (func $21 (type $44) (param $0 i32) (result v128)
  (local $1 (ref i31))
  (local $2 (ref i31))
  (local $3 v128)
  (local $scratch v128)
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
   (select
    (local.get $3)
    (call $30
     (f64x2.promote_low_f32x4
      (call $30
       (f32x4.neg
        (call $30
         (i16x8.le_s
          (local.tee $3
           (loop (result v128)
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
            (call $30
             (struct.get $1 0
              (struct.new_default $1)
             )
            )
           )
          )
          (local.tee $3
           (local.get $3)
          )
         )
        )
       )
      )
     )
    )
    (local.tee $0
     (call_indirect $0 (type $16)
      (if (result v128)
       (string.measure_wtf16
        (string.const "\ed\bd\88\ed\a0\80")
       )
       (then
        (call $30
         (block (result v128)
          (local.set $scratch
           (v128.const i32x4 0x00000000 0xc3f00000 0x0d8d4fdf 0x41700000)
          )
          (drop
           (f64.const 133)
          )
          (local.get $scratch)
         )
        )
       )
       (else
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
         (br $label)
        )
        (unreachable)
       )
      )
      (local.get $3)
      (i32.const 3)
     )
    )
   )
  )
 )
 (func $22 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 f64)
  (local $9 (ref null $1))
  (local $10 (ref i31))
  (local $11 (ref i31))
  (local $12 (ref i31))
  (local $13 i31ref)
  (local $14 (ref null $19))
  (local $15 (ref null $19))
  (local $16 (ref string))
  (local $17 (ref null $11))
  (local $18 (ref null $7))
  (local $19 structref)
  (local $20 (ref $14))
  (local $21 (ref null $12))
  (local $22 (ref $3))
  (local $23 (ref $13))
  (local $24 (ref $13))
  (local $25 (ref none))
  (local $scratch (ref (exact $13)))
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (local.set $17
   (struct.new_desc $11
    (struct.new $1
     (local.get $0)
     (struct.new_default $2)
     (struct.new $1
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
      (struct.new_default $2)
      (ref.null none)
      (local.get $0)
     )
     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    )
    (local.get $2)
    (struct.new $8
     (struct.new $7
      (local.get $2)
      (struct.new $0
       (ref.as_non_null
        (local.get $9)
       )
       (struct.new $1
        (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        (struct.new $2
         (ref.as_non_null
          (ref.null nofunc)
         )
         (f32.const -18014398509481984)
         (local.get $2)
         (local.get $8)
        )
        (struct.new $1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (struct.new $2
          (ref.null nofunc)
          (f32.const -65536)
          (local.get $2)
          (local.get $8)
         )
         (struct.new_default $1)
         (local.get $0)
        )
        (local.get $1)
       )
       (struct.new_default $2)
      )
      (array.new_default $9
       (i32.and
        (i32.const 98)
        (i32.const 1023)
       )
      )
      (string.const "623\ed\a0\80")
      (f64.const 28948)
      (struct.new_desc $12
       (ref.null noextern)
       (ref.null none)
       (local.get $0)
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (struct.new $13
        (local.get $2)
        (i32.const -1073741824)
        (array.new $9
         (call $28
          (global.get $global$8)
         )
         (i32.and
          (i32.const 77)
          (i32.const 1023)
         )
        )
        (block $block (result (ref exn))
         (try_table (catch_all_ref $block)
          (throw $tag$1)
         )
         (unreachable)
        )
        (local.get $8)
        (struct.new_default_desc $12
         (struct.new $13
          (i32.const 808806769)
          (local.get $2)
          (array.new $9
           (f32.const 18014398509481984)
           (i32.and
            (i32.const 23)
            (i32.const 1023)
           )
          )
          (block $block1 (result (ref exn))
           (try_table (catch_all_ref $block1)
            (throw $tag$1)
           )
           (unreachable)
          )
          (f64.const 103)
          (struct.new_desc $4
           (string.const "\e2\82\ac\ed\bd\88\f0\90\8d\88")
           (ref.as_non_null
            (local.get $17)
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
     (struct.new $19
      (struct.new $7
       (i32.const 127)
       (struct.new $0
        (struct.new_default $1)
        (struct.new $1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (struct.new $2
          (ref.null nofunc)
          (f32.const -8193)
          (i32.const 37700)
          (f64.const 0)
         )
         (struct.new_default $1)
         (local.get $1)
        )
        (struct.new $2
         (ref.null nofunc)
         (call $28
          (global.get $global$8)
         )
         (i32.const -33554432)
         (f64.const 1.123)
        )
       )
       (array.new $9
        (f32.const 35184372088832)
        (i32.and
         (i32.const 9)
         (i32.const 1023)
        )
       )
       (global.get $gimport$0)
       (f64.const 85)
       (struct.new_desc $12
        (ref.null noextern)
        (ref.as_non_null
         (ref.null none)
        )
        (local.get $1)
        (local.get $1)
        (struct.new $13
         (i32.const -44)
         (i32.const -2147483647)
         (array.new $9
          (f32.const 0)
          (i32.and
           (i32.const 59)
           (i32.const 1023)
          )
         )
         (ref.null noexn)
         (f64.const -4294967294.792)
         (struct.new_default_desc $4
          (struct.new $5
           (i32.const 33554432)
           (local.get $2)
           (ref.as_non_null
            (ref.null none)
           )
           (block $block2 (result (ref exn))
            (try_table (catch_all_ref $block2)
             (throw $tag$1)
            )
            (unreachable)
           )
          )
         )
        )
       )
      )
      (struct.new $19
       (struct.new $7
        (local.get $2)
        (struct.new $0
         (struct.new_default $1)
         (struct.new_default $1)
         (struct.new $2
          (ref.null nofunc)
          (f32.const 536870912)
          (i32.const 847018034)
          (local.get $8)
         )
        )
        (array.new $9
         (f32.const -9223372036854775808)
         (i32.and
          (i32.const 6)
          (i32.const 1023)
         )
        )
        (global.get $gimport$0)
        (f64.const 47891)
        (struct.new_desc $12
         (ref.null noextern)
         (ref.null none)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (struct.new $13
          (i32.const -25)
          (i32.const -127)
          (array.new $9
           (f32.const 0)
           (i32.and
            (i32.const 83)
            (i32.const 1023)
           )
          )
          (block $block3 (result (ref exn))
           (try_table (catch_all_ref $block3)
            (throw $tag$1)
           )
           (unreachable)
          )
          (f64.const 1.1754943508222875e-38)
          (ref.as_non_null
           (local.get $21)
          )
         )
        )
       )
       (struct.new $19
        (struct.new $7
         (i32.const 29444)
         (struct.new $0
          (struct.new_default $1)
          (struct.new $1
           (local.get $0)
           (struct.new $2
            (ref.as_non_null
             (ref.null nofunc)
            )
            (f32.const -2046.7650146484375)
            (local.get $2)
            (local.get $8)
           )
           (struct.new $1
            (local.get $1)
            (ref.null none)
            (struct.new_default $1)
            (local.get $0)
           )
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (struct.new_default $2)
         )
         (array.new $9
          (f32.const -4294967296)
          (i32.and
           (i32.const 68)
           (i32.const 1023)
          )
         )
         (global.get $gimport$0)
         (local.get $8)
         (struct.new_desc $12
          (ref.null noextern)
          (ref.null none)
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          (v128.const i32x4 0x2c4d000a 0xfb81ff75 0x00f6b7a0 0x52fff1ff)
          (struct.new $13
           (local.get $2)
           (local.get $2)
           (ref.as_non_null
            (ref.null none)
           )
           (block $block4 (result (ref exn))
            (try_table (catch_all_ref $block4)
             (throw $tag$1)
            )
            (unreachable)
           )
           (f64.const 4294967285)
           (ref.as_non_null
            (ref.null none)
           )
          )
         )
        )
        (struct.new $19
         (struct.new $7
          (local.get $2)
          (struct.new $0
           (struct.new $1
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            (ref.null none)
            (ref.null none)
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
           (ref.as_non_null
            (local.get $9)
           )
           (ref.null none)
          )
          (array.new_default $9
           (i32.and
            (i32.const 98)
            (i32.const 1023)
           )
          )
          (global.get $gimport$0)
          (f64.const -2147483647.369)
          (struct.new_default_desc $12
           (ref.null none)
          )
         )
         (struct.new $19
          (struct.new $7
           (local.get $2)
           (struct.new $0
            (struct.new_default $1)
            (struct.new_default $1)
            (struct.new_default $2)
           )
           (array.new_default $9
            (i32.and
             (i32.const 60)
             (i32.const 1023)
            )
           )
           (string.const "\e2\82\ac\c2\a3\f0\90\8d\88")
           (f64.const -9223372036854775808)
           (struct.new_desc $12
            (ref.null noextern)
            (ref.null none)
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            (local.get $1)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (struct.new $19
           (struct.new $7
            (local.get $2)
            (struct.new $0
             (struct.new $1
              (local.get $1)
              (ref.null none)
              (ref.null none)
              (local.get $1)
             )
             (struct.new $1
              (local.get $0)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
             (ref.null none)
            )
            (array.new $9
             (call $28
              (global.get $global$8)
             )
             (i32.and
              (i32.const 94)
              (i32.const 1023)
             )
            )
            (global.get $gimport$1)
            (f64.const 0)
            (struct.new_default_desc $12
             (struct.new $13
              (i32.const -8388608)
              (i32.const -116)
              (ref.as_non_null
               (ref.null none)
              )
              (block $block5 (result (ref exn))
               (try_table (catch_all_ref $block5)
                (throw $tag$1)
               )
               (unreachable)
              )
              (f64.const 4294967296)
              (ref.as_non_null
               (local.get $21)
              )
             )
            )
           )
           (struct.new $19
            (struct.new $7
             (local.get $2)
             (struct.new $0
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
             (array.new_default $9
              (i32.and
               (i32.const 65)
               (i32.const 1023)
              )
             )
             (ref.as_non_null
              (ref.null noextern)
             )
             (local.get $8)
             (struct.new_desc $12
              (ref.null noextern)
              (ref.null none)
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (struct.new $19
             (struct.new $7
              (local.get $2)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (ref.null none)
              )
              (global.get $gimport$0)
              (local.get $8)
              (ref.as_non_null
               (local.get $21)
              )
             )
             (struct.new $8
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $14)
              )
             )
             (local.get $2)
            )
            (local.get $2)
           )
           (local.get $2)
          )
          (i32.const 17)
         )
         (i32.const -511)
        )
        (local.get $2)
       )
       (local.get $2)
      )
      (i32.const 134217729)
     )
    )
    (local.get $8)
    (struct.new_desc $11
     (struct.new_default $1)
     (local.get $2)
     (struct.new $19
      (ref.as_non_null
       (local.get $18)
      )
      (struct.new $19
       (struct.new $7
        (i32.const -8)
        (struct.new $0
         (struct.new $1
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          (struct.new $2
           (ref.null nofunc)
           (call $28
            (global.get $global$8)
           )
           (local.get $2)
           (local.get $8)
          )
          (ref.null none)
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (struct.new $1
          (v128.const i32x4 0x0001fbff 0x9366ffe6 0xb10f0000 0xff800000)
          (struct.new_default $2)
          (struct.new $1
           (v128.const i32x4 0x018df51f 0x00fe00fd 0x01deb9e3 0xa001de81)
           (struct.new $2
            (ref.null nofunc)
            (f32.const 68719476736)
            (local.get $2)
            (local.get $8)
           )
           (struct.new_default $1)
           (local.get $1)
          )
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (struct.new_default $2)
        )
        (array.new $9
         (f32.const 4294967296)
         (i32.and
          (i32.const 94)
          (i32.const 1023)
         )
        )
        (global.get $gimport$0)
        (f64.const 4294967294.777)
        (struct.new_desc $12
         (ref.null noextern)
         (ref.null none)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (local.get $0)
         (struct.new $13
          (local.get $2)
          (local.get $2)
          (array.new_default $9
           (i32.and
            (i32.const 38)
            (i32.const 1023)
           )
          )
          (block $block6 (result (ref exn))
           (try_table (catch_all_ref $block6)
            (throw $tag$1)
           )
           (unreachable)
          )
          (f64.const -3.91)
          (struct.new_desc $4
           (global.get $gimport$0)
           (ref.null none)
           (ref.null none)
          )
         )
        )
       )
       (struct.new $8
        (struct.new $7
         (local.get $2)
         (struct.new $0
          (struct.new $1
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           (struct.new $2
            (ref.null nofunc)
            (f32.const 2)
            (i32.const -18)
            (local.get $8)
           )
           (struct.new_default $1)
           (local.get $0)
          )
          (struct.new $1
           (local.get $1)
           (struct.new $2
            (ref.null nofunc)
            (call $28
             (global.get $global$8)
            )
            (local.get $2)
            (local.get $8)
           )
           (ref.null none)
           (local.get $1)
          )
          (struct.new_default $2)
         )
         (array.new $9
          (f32.const -116)
          (i32.and
           (i32.const 12)
           (i32.const 1023)
          )
         )
         (global.get $gimport$1)
         (local.get $8)
         (ref.as_non_null
          (local.get $21)
         )
        )
        (struct.new $8
         (struct.new $7
          (i32.const -16311)
          (struct.new $0
           (struct.new_default $1)
           (struct.new $1
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            (struct.new_default $2)
            (ref.as_non_null
             (local.get $9)
            )
            (local.get $0)
           )
           (struct.new_default $2)
          )
          (array.new_default $9
           (i32.and
            (i32.const 46)
            (i32.const 1023)
           )
          )
          (global.get $gimport$0)
          (f64.const -144115188075855872)
          (struct.new_default_desc $12
           (struct.new $13
            (local.get $2)
            (local.get $2)
            (array.new $9
             (call $28
              (global.get $global$8)
             )
             (i32.and
              (i32.const 94)
              (i32.const 1023)
             )
            )
            (block $block7 (result (ref exn))
             (try_table (catch_all_ref $block7)
              (throw $tag$1)
             )
             (unreachable)
            )
            (local.get $8)
            (struct.new_desc $12
             (ref.null noextern)
             (ref.null none)
             (local.get $0)
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
         )
         (struct.new $19
          (ref.as_non_null
           (local.get $18)
          )
          (struct.new $19
           (struct.new $7
            (i32.const 128)
            (struct.new $0
             (struct.new_default $1)
             (struct.new $1
              (local.get $1)
              (ref.null none)
              (ref.as_non_null
               (local.get $9)
              )
              (local.get $0)
             )
             (struct.new_default $2)
            )
            (array.new_default $9
             (i32.and
              (i32.const 21)
              (i32.const 1023)
             )
            )
            (global.get $gimport$1)
            (f64.const -9223372036854775808)
            (ref.as_non_null
             (local.get $21)
            )
           )
           (struct.new $19
            (struct.new $7
             (i32.const 81)
             (struct.new $0
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (ref.null none)
             )
             (array.new $9
              (f32.const -9223372036854775808)
              (i32.and
               (i32.const 23)
               (i32.const 1023)
              )
             )
             (string.const "\c2\a3\ed\a0\80\ed\a0\80")
             (f64.const -72057594037927936)
             (struct.new_default_desc $12
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (struct.new $19
             (struct.new $7
              (i32.const -1)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (ref.null none)
              )
              (global.get $gimport$1)
              (f64.const 1797693134862315708145274e284)
              (ref.as_non_null
               (local.get $21)
              )
             )
             (struct.new $19
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $14)
              )
              (i32.const -32768)
             )
             (i32.const -21985)
            )
            (local.get $2)
           )
           (local.get $2)
          )
          (local.get $2)
         )
        )
       )
       (i32.const 65486)
      )
      (local.get $2)
     )
     (f64.const 0)
     (struct.new_desc $11
      (struct.new_default $1)
      (local.get $2)
      (struct.new $19
       (struct.new $7
        (i32.const 524289)
        (struct.new $0
         (struct.new_default $1)
         (ref.as_non_null
          (local.get $9)
         )
         (ref.null none)
        )
        (array.new_default $9
         (i32.and
          (i32.const 78)
          (i32.const 1023)
         )
        )
        (global.get $gimport$0)
        (local.get $8)
        (struct.new_default_desc $12
         (struct.new $13
          (local.get $2)
          (i32.const -32769)
          (array.new $9
           (f32.const -2147483648)
           (i32.and
            (i32.const 16)
            (i32.const 1023)
           )
          )
          (block $block8 (result (ref exn))
           (try_table (catch_all_ref $block8)
            (throw $tag$1)
           )
           (unreachable)
          )
          (f64.const 114)
          (struct.new_default_desc $4
           (struct.new $5
            (local.get $2)
            (i32.const -268435456)
            (array.new $9
             (f32.const 0)
             (i32.and
              (i32.const 53)
              (i32.const 1023)
             )
            )
            (ref.null noexn)
           )
          )
         )
        )
       )
       (struct.new $19
        (struct.new $7
         (i32.const -512)
         (struct.new $0
          (struct.new $1
           (local.get $0)
           (struct.new_default $2)
           (struct.new_default $1)
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (struct.new_default $1)
          (ref.null none)
         )
         (array.new $9
          (f32.const -2471)
          (i32.and
           (i32.const 21)
           (i32.const 1023)
          )
         )
         (global.get $gimport$0)
         (local.get $8)
         (struct.new_default_desc $12
          (struct.new $13
           (i32.const 524288)
           (local.get $2)
           (array.new_default $9
            (i32.and
             (i32.const 72)
             (i32.const 1023)
            )
           )
           (block $block9 (result (ref exn))
            (try_table (catch_all_ref $block9)
             (throw $tag$1)
            )
            (unreachable)
           )
           (local.get $8)
           (struct.new_desc $4
            (string.const "895")
            (struct.new_desc $11
             (struct.new $1
              (local.get $1)
              (ref.null none)
              (ref.as_non_null
               (local.get $9)
              )
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
             (local.get $2)
             (struct.new $8
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $15)
              )
             )
             (local.get $8)
             (struct.new_desc $11
              (ref.as_non_null
               (local.get $9)
              )
              (i32.const -56)
              (ref.null none)
              (local.get $8)
              (ref.as_non_null
               (local.get $17)
              )
              (f32.const -4398046511104)
              (ref.as_non_null
               (ref.null none)
              )
             )
             (f32.const -18446744073709551615)
             (ref.as_non_null
              (ref.null none)
             )
            )
            (struct.new $5
             (i32.const 2147483647)
             (local.get $2)
             (ref.as_non_null
              (ref.null none)
             )
             (ref.null noexn)
            )
           )
          )
         )
        )
        (struct.new $19
         (struct.new $7
          (local.get $2)
          (struct.new $0
           (struct.new $1
            (local.get $0)
            (struct.new $2
             (ref.null nofunc)
             (f32.const -262144.40625)
             (i32.const -21200)
             (local.get $8)
            )
            (ref.null none)
            (local.get $0)
           )
           (struct.new $1
            (local.get $1)
            (struct.new_default $2)
            (global.get $global$7)
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
           (ref.null none)
          )
          (array.new $9
           (f32.const -18446744073709551615)
           (i32.and
            (i32.const 48)
            (i32.const 1023)
           )
          )
          (ref.null noextern)
          (f64.const 65505)
          (struct.new_default_desc $12
           (struct.new $13
            (local.get $2)
            (local.get $2)
            (array.new_default $9
             (i32.and
              (i32.const 12)
              (i32.const 1023)
             )
            )
            (block $block10 (result (ref exn))
             (try_table (catch_all_ref $block10)
              (throw $tag$1)
             )
             (unreachable)
            )
            (f64.const 0)
            (struct.new_desc $12
             (ref.null noextern)
             (ref.null none)
             (local.get $1)
             (local.get $1)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
         )
         (struct.new $19
          (struct.new $7
           (local.get $2)
           (struct.new $0
            (struct.new_default $1)
            (struct.new_default $1)
            (struct.new_default $2)
           )
           (array.new $9
            (f32.const 229)
            (i32.and
             (i32.const 89)
             (i32.const 1023)
            )
           )
           (string.const "\f0\90\8d\88")
           (f64.const -9223372036854775808)
           (struct.new_default_desc $12
            (struct.new $13
             (i32.const -65537)
             (i32.const -24756)
             (array.new $9
              (call $28
               (global.get $global$8)
              )
              (i32.and
               (i32.const 77)
               (i32.const 1023)
              )
             )
             (block $block11 (result (ref exn))
              (try_table (catch_all_ref $block11)
               (throw $tag$1)
              )
              (unreachable)
             )
             (f64.const 0)
             (struct.new_default_desc $12
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
          (struct.new $8
           (struct.new $7
            (local.get $2)
            (struct.new $0
             (ref.as_non_null
              (local.get $9)
             )
             (struct.new_default $1)
             (struct.new $2
              (ref.null nofunc)
              (f32.const 2.8340001106262207)
              (local.get $2)
              (f64.const 0)
             )
            )
            (array.new $9
             (f32.const 184)
             (i32.and
              (i32.const 37)
              (i32.const 1023)
             )
            )
            (string.const "\f0\90\8d\88\ed\bd\88\f0\90\8d\88")
            (local.get $8)
            (struct.new_default_desc $12
             (struct.new $13
              (i32.const -2147483647)
              (local.get $2)
              (ref.as_non_null
               (ref.null none)
              )
              (block $block12 (result (ref exn))
               (try_table (catch_all_ref $block12)
                (throw $tag$1)
               )
               (unreachable)
              )
              (f64.const 33819)
              (ref.as_non_null
               (local.get $21)
              )
             )
            )
           )
           (ref.null none)
          )
          (i32.const -127)
         )
         (local.get $2)
        )
        (i32.const -112)
       )
       (local.get $2)
      )
      (local.get $8)
      (struct.new_desc $11
       (struct.new $1
        (v128.const i32x4 0x00000000 0xc3e00000 0x00000000 0xc3b00000)
        (struct.new $2
         (ref.null nofunc)
         (call $28
          (global.get $global$8)
         )
         (i32.const -8112356)
         (f64.const -32768)
        )
        (struct.new_default $1)
        (v128.const i32x4 0x00d1851f 0xff6b7fb0 0x015d017f 0x84fcff01)
       )
       (local.get $2)
       (struct.new $19
        (struct.new $7
         (local.get $2)
         (struct.new $0
          (struct.new_default $1)
          (ref.as_non_null
           (local.get $9)
          )
          (ref.null none)
         )
         (array.new $9
          (f32.const 0)
          (i32.and
           (i32.const 7)
           (i32.const 1023)
          )
         )
         (global.get $gimport$1)
         (local.get $8)
         (struct.new_default_desc $12
          (struct.new $13
           (local.get $2)
           (local.get $2)
           (array.new_default $9
            (i32.and
             (i32.const 98)
             (i32.const 1023)
            )
           )
           (block $block13 (result (ref exn))
            (try_table (catch_all_ref $block13)
             (throw $tag$1)
            )
            (unreachable)
           )
           (local.get $8)
           (struct.new_desc $4
            (ref.null noextern)
            (struct.new_desc $11
             (struct.new_default $1)
             (i32.const 131072)
             (struct.new $19
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $15)
              )
              (local.get $2)
             )
             (local.get $8)
             (struct.new_desc $3
              (ref.as_non_null
               (local.get $9)
              )
              (local.get $2)
              (ref.as_non_null
               (local.get $15)
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
             (call $28
              (global.get $global$8)
             )
             (ref.as_non_null
              (ref.null none)
             )
            )
            (struct.new $5
             (i32.const -262145)
             (local.get $2)
             (ref.as_non_null
              (ref.null none)
             )
             (block $block14 (result (ref exn))
              (try_table (catch_all_ref $block14)
               (throw $tag$1)
              )
              (unreachable)
             )
            )
           )
          )
         )
        )
        (struct.new $8
         (struct.new $7
          (i32.const -131072)
          (struct.new $0
           (ref.as_non_null
            (local.get $9)
           )
           (struct.new_default $1)
           (struct.new_default $2)
          )
          (array.new $9
           (call $28
            (global.get $global$8)
           )
           (i32.and
            (i32.const 45)
            (i32.const 1023)
           )
          )
          (string.const "\ed\a0\80")
          (local.get $8)
          (struct.new_default_desc $12
           (struct.new $13
            (i32.const -2147483647)
            (local.get $2)
            (array.new_default $9
             (i32.and
              (i32.const 21)
              (i32.const 1023)
             )
            )
            (block $block15 (result (ref exn))
             (try_table (catch_all_ref $block15)
              (throw $tag$1)
             )
             (unreachable)
            )
            (local.get $8)
            (struct.new_default_desc $12
             (ref.null none)
            )
           )
          )
         )
         (struct.new $19
          (ref.as_non_null
           (local.get $18)
          )
          (struct.new $8
           (ref.as_non_null
            (local.get $18)
           )
           (struct.new $19
            (struct.new $7
             (local.get $2)
             (struct.new $0
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (ref.null none)
              )
             )
             (array.new $9
              (f32.const -67108864)
              (i32.and
               (i32.const 3)
               (i32.const 1023)
              )
             )
             (global.get $gimport$0)
             (local.get $8)
             (struct.new_default_desc $12
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (struct.new $19
             (struct.new $7
              (i32.const -33554433)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (ref.null none)
              )
              (global.get $gimport$1)
              (local.get $8)
              (ref.as_non_null
               (local.get $21)
              )
             )
             (struct.new $8
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $15)
              )
             )
             (i32.const 256)
            )
            (i32.const -128)
           )
          )
          (local.get $2)
         )
        )
        (i32.const -31618)
       )
       (f64.const 4398046511104)
       (struct.new_desc $3
        (struct.new $1
         (local.get $1)
         (ref.null none)
         (struct.new_default $1)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
        (local.get $2)
        (struct.new $19
         (struct.new $7
          (i32.const 1)
          (struct.new $0
           (struct.new_default $1)
           (struct.new_default $1)
           (struct.new_default $2)
          )
          (array.new_default $9
           (i32.and
            (i32.const 21)
            (i32.const 1023)
           )
          )
          (global.get $gimport$0)
          (f64.const 63)
          (ref.as_non_null
           (local.get $21)
          )
         )
         (struct.new $8
          (struct.new $7
           (i32.const 221)
           (struct.new $0
            (struct.new_default $1)
            (struct.new $1
             (v128.const i32x4 0x3f4e147b 0x4f7fffa5 0xc0800000 0x41f80000)
             (ref.null none)
             (ref.null none)
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            )
            (ref.null none)
           )
           (array.new_default $9
            (i32.and
             (i32.const 93)
             (i32.const 1023)
            )
           )
           (global.get $gimport$0)
           (f64.const -4294967294.196)
           (struct.new_desc $12
            (ref.null noextern)
            (ref.null none)
            (local.get $0)
            (local.get $0)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (struct.new $8
           (struct.new $7
            (i32.const -2147483648)
            (struct.new $0
             (struct.new $1
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
             )
             (struct.new_default $1)
             (ref.null none)
            )
            (array.new_default $9
             (i32.and
              (i32.const 64)
              (i32.const 1023)
             )
            )
            (ref.null noextern)
            (f64.const 268435455)
            (struct.new_default_desc $12
             (struct.new $13
              (i32.const 1)
              (i32.const -81)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.null noexn)
              (f64.const 0)
              (ref.as_non_null
               (local.get $21)
              )
             )
            )
           )
           (struct.new $8
            (struct.new $7
             (local.get $2)
             (struct.new $0
              (ref.as_non_null
               (local.get $9)
              )
              (ref.as_non_null
               (local.get $9)
              )
              (ref.null none)
             )
             (array.new_default $9
              (i32.and
               (i32.const 42)
               (i32.const 1023)
              )
             )
             (string.const "\ed\a0\80\e2\82\ac")
             (local.get $8)
             (struct.new_default_desc $12
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
            (struct.new $19
             (struct.new $7
              (local.get $2)
              (ref.as_non_null
               (ref.null none)
              )
              (ref.as_non_null
               (ref.null none)
              )
              (string.const "")
              (f64.const -16)
              (ref.as_non_null
               (local.get $21)
              )
             )
             (struct.new $19
              (ref.as_non_null
               (local.get $18)
              )
              (ref.as_non_null
               (local.get $15)
              )
              (local.get $2)
             )
             (local.get $2)
            )
           )
          )
         )
         (i32.const 1048575)
        )
        (struct.new_default_desc $4
         (struct.new $5
          (i32.const 4194303)
          (local.get $2)
          (array.new $9
           (f32.const -106)
           (i32.and
            (i32.const 83)
            (i32.const 1023)
           )
          )
          (block $block16 (result (ref exn))
           (try_table (catch_all_ref $block16)
            (throw $tag$1)
           )
           (unreachable)
          )
         )
        )
       )
       (f32.const 0)
       (struct.new_default_desc $12
        (struct.new $13
         (i32.const -102)
         (i32.const -31946)
         (ref.as_non_null
          (ref.null none)
         )
         (ref.null noexn)
         (local.get $8)
         (ref.as_non_null
          (local.get $21)
         )
        )
       )
      )
      (f32.const 2147483648)
      (struct.new_default_desc $12
       (struct.new $13
        (local.get $2)
        (i32.const 32767)
        (array.new $9
         (f32.const -17179869184)
         (i32.and
          (i32.const 4)
          (i32.const 1023)
         )
        )
        (block $block17 (result (ref exn))
         (try_table (catch_all_ref $block17)
          (throw $tag$1)
         )
         (unreachable)
        )
        (local.get $8)
        (struct.new_default_desc $12
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
      )
     )
     (call $28
      (global.get $global$8)
     )
     (struct.new_default_desc $12
      (struct.new $13
       (i32.const -16)
       (local.get $2)
       (array.new_default $9
        (i32.and
         (i32.const 34)
         (i32.const 1023)
        )
       )
       (block $block18 (result (ref exn))
        (try_table (catch_all_ref $block18)
         (throw $tag$1)
        )
        (unreachable)
       )
       (f64.const 0)
       (struct.new_default_desc $12
        (struct.new $13
         (local.get $2)
         (local.get $2)
         (ref.as_non_null
          (ref.null none)
         )
         (ref.null noexn)
         (local.get $8)
         (ref.as_non_null
          (ref.null none)
         )
        )
       )
      )
     )
    )
    (call $28
     (global.get $global$8)
    )
    (struct.new_default_desc $12
     (struct.new $13
      (i32.const -32766)
      (i32.const 32767)
      (array.new $9
       (f32.const -2147483648)
       (i32.and
        (i32.const 51)
        (i32.const 1023)
       )
      )
      (block $block19 (result (ref exn))
       (try_table (catch_all_ref $block19)
        (throw $tag$1)
       )
       (unreachable)
      )
      (f64.const 1125899906842623.1)
      (struct.new_default_desc $12
       (struct.new $13
        (i32.const -1654955007)
        (local.get $2)
        (array.new $9
         (f32.const 1845966867051193936379422e11)
         (i32.and
          (i32.const 95)
          (i32.const 1023)
         )
        )
        (ref.null noexn)
        (local.get $8)
        (ref.as_non_null
         (local.get $21)
        )
       )
      )
     )
    )
   )
  )
  (local.set $9
   (struct.new $1
    (v128.const i32x4 0x7f570022 0xe67f1b68 0x80ff0b08 0xfb330901)
    (struct.new_default $2)
    (struct.new_default $1)
    (v128.const i32x4 0xa0000010 0x0000fffa 0x00004000 0x01ff0080)
   )
  )
  (drop
   (memory.atomic.notify offset=3
    (i64.and
     (loop $label (result i64)
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
       (br_on_null $label
        (ref.func $5)
       )
      )
      (drop
       (br_on_null $label
        (block (result (ref (exact $13)))
         (local.set $scratch
          (struct.new $13
           (i32.const -785430736)
           (i32.const 21556)
           (array.new $9
            (f32.const 281474976710656)
            (i32.and
             (i32.const 66)
             (i32.const 1023)
            )
           )
           (ref.null noexn)
           (f64.const -576460752303423488)
           (struct.new_desc $12
            (ref.as_non_null
             (ref.null noextern)
            )
            (ref.null none)
            (v128.const i32x4 0xf5800000 0x41efffff 0x00000000 0x40ef8000)
            (local.get $1)
            (ref.null none)
           )
          )
         )
         (drop
          (f64.const -2147483648)
         )
         (local.get $scratch)
        )
       )
      )
      (drop
       (array.new_fixed $23 0)
      )
      (block
       (call $fimport$6
        (f64.const -17592186044415.428)
       )
       (br $label)
      )
      (local.set $10
       (local.set $11
        (local.set $12
         (unreachable)
        )
       )
      )
     )
     (i64.const 15)
    )
    (stringview_wtf16.get_codeunit
     (local.tee $16
      (string.const "\ed\a0\80\f0\90\8d\88")
     )
     (block (result i32)
      (local.set $4
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
        (nop)
        (call $fimport$0
         (i32.const -81)
        )
        (br_if $label1
         (try_table (result i32) (catch_all $label1)
          (i31.get_s
           (ref.as_non_null
            (local.get $13)
           )
          )
         )
        )
        (local.get $2)
       )
      )
      (local.get $4)
     )
    )
   )
  )
  (block
   (call $fimport$8
    (struct.new $8
     (struct.new $7
      (local.get $2)
      (struct.new $0
       (ref.as_non_null
        (local.get $9)
       )
       (struct.new_default $1)
       (struct.new $2
        (ref.null nofunc)
        (f32.const 9223372036854775808)
        (i32.const 33554433)
        (f64.const -18446744073709551615)
       )
      )
      (array.new $9
       (f32.const 0)
       (i32.and
        (i32.const 20)
        (i32.const 1023)
       )
      )
      (string.const "")
      (f64.const 0)
      (struct.new_desc $12
       (ref.null noextern)
       (ref.null none)
       (local.get $0)
       (local.get $0)
       (ref.as_non_null
        (ref.null none)
       )
      )
     )
     (ref.null none)
    )
   )
   (return
    (local.get $2)
   )
  )
  (local.set $25
   (local.set $23
    (local.set $24
     (local.set $22
      (local.set $20
       (unreachable)
      )
     )
    )
   )
  )
 )
 (func $23 (type $20)
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
   (call $22
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (drop
   (call $22
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (v128.const i32x4 0x00000000 0x40800000 0x7ae147ae 0xbfc7ae14)
   )
  )
 )
 (func $24 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 v128)
  (local $14 f64)
  (local $15 f64)
  (local $16 (ref null $5))
  (local $17 arrayref)
  (local $18 (ref array))
  (local $19 externref)
  (local $20 (ref null $4))
  (local $21 (ref null $15))
  (local $22 i31ref)
  (local $23 stringref)
  (local $24 (ref $25))
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (string.encode_wtf16_array
   (ref.cast (ref string)
    (string.const "\f0\90\8d\88\ed\bd\88")
   )
   (local.tee $24
    (array.new_default $25
     (i32.and
      (i32.const 81)
      (i32.const 1023)
     )
    )
   )
   (local.get $10)
  )
 )
 (func $25 (type $20)
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
   (call $24
    (v128.const i32x4 0xff000100 0x00000201 0x69599c7f 0x02ea00fd)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (drop
   (call $24
    (v128.const i32x4 0x0100000d 0x01410081 0x10f001ff 0xf2fc52c9)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $26 (type $45) (param $0 (ref $14)) (result (ref array))
  (local $1 (ref $8))
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
  (array.new_fixed $23 0)
 )
 (func $27 (type $16) (param $0 v128) (param $1 v128) (result i32)
  (local $2 stringref)
  (local $3 (ref $1))
  (local $4 (ref i31))
  (local $5 (ref eq))
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 f64)
  (local $14 f32)
  (local.set $0
   (call $30
    (local.get $0)
   )
  )
  (local.set $1
   (call $30
    (local.get $1)
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
  (block $block (result i32)
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
   (if (result i32)
    (i32.eqz
     (i32.const 536870912)
    )
    (then
     (struct.get_u $11 1
      (struct.new_desc $11
       (local.tee $3
        (struct.new $1
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         (struct.new $2
          (ref.null nofunc)
          (call $28
           (global.get $global$8)
          )
          (i32.const -23)
          (f64.const 4294967295)
         )
         (ref.null none)
         (local.get $1)
        )
       )
       (br_if $block
        (local.get $6)
        (call_ref $16
         (v128.const i32x4 0xf83126e9 0x415fffff 0x00247ae1 0x41e00000)
         (try $__t_0 (result v128) (do (try (result v128) (do 
           (call $30
            (array.get $10
             (array.new $10
              (loop $label (result v128)
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
               (br_if $label
                (i32.eqz
                 (local.tee $6
                  (i31.get_s
                   (local.tee $4
                    (ref.i31
                     (i32.const 33)
                    )
                   )
                  )
                 )
                )
               )
               (local.get $1)
              )
              (i32.and
               (i32.const 68)
               (i32.const 1023)
              )
             )
             (local.tee $6
              (i32.const -51)
             )
            )
           )
          ) (delegate $__t_0))) (catch $tag$0
           (drop (pop i64))
           (call $30
            (i64x2.splat
             (i64.atomic.load16_u offset=22
              (i64.and
               (local.tee $11
                (global.get $global$2)
               )
               (i64.const 15)
              )
             )
            )
           )
          ) (catch_all
           (call $30
            (f64x2.splat
             (local.tee $13
              (select
               (f64.const -682399985)
               (f64.const 0)
               (br_if $block
                (i32.const -4)
                (i32.eqz
                 (i32.const 37)
                )
               )
              )
             )
            )
           )
          ))
         (ref.func $13)
        )
       )
       (struct.new $19
        (struct.new $7
         (i32.const 0)
         (struct.new $0
          (struct.new_default $1)
          (struct.new_default $1)
          (struct.new_default $2)
         )
         (ref.as_non_null
          (ref.null none)
         )
         (global.get $gimport$1)
         (f64.const 83)
         (ref.as_non_null
          (ref.null none)
         )
        )
        (ref.as_non_null
         (ref.null none)
        )
        (local.get $6)
       )
       (local.get $13)
       (ref.as_non_null
        (ref.null none)
       )
       (local.tee $14
        (f32.const -2147483648)
       )
       (ref.as_non_null
        (ref.null none)
       )
      )
     )
    )
    (else
     (local.get $6)
    )
   )
  )
 )
 (func $28 (type $46) (param $0 f32) (result f32)
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
 (func $29 (type $47) (param $0 f64) (result f64)
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
 (func $30 (type $48) (param $0 v128) (result v128)
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
 (global $__rt (mut i32) (i32.const 0))
)
