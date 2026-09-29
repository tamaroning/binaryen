(module
 (rec
  (type $0 (func (param (ref null $6))))
  (type $1 (sub (func (param (ref null $3) (ref null $4) f32) (result (ref null $17) f64))))
  (type $2 (struct (field (mut i8)) (field (mut arrayref)) (field (ref $1)) (field (mut (ref null $8))) (field (mut i16)) (field (ref $13))))
  (type $3 (sub (descriptor $5) (struct (field i64) (field (mut (ref $11))))))
  (type $4 (sub (descriptor $11) (struct (field (mut i8)))))
  (type $5 (sub (describes $3) (descriptor $6) (struct (field externref))))
  (type $6 (describes $5) (descriptor $13) (struct (field externref) (field (mut (ref func))) (field (mut i8))))
  (type $7 (struct (field (mut i32)) (field (ref null $7)) (field i16) (field i64) (field f64)))
  (type $8 (sub $1 (func (param structref (ref null $4) f32) (result (ref null $17) f64))))
  (type $9 (func (param (ref $6)) (result v128)))
  (type $10 (sub (array i32)))
  (type $11 (sub (describes $4) (descriptor $14) (struct (field v128) (field (mut (ref null $0))) (field (mut i32)) (field (mut i64)) (field i32) (field (mut (ref null $8))))))
  (type $12 (sub $10 (array i32)))
  (type $13 (sub (describes $6) (descriptor $15) (struct (field (mut i8)))))
  (type $14 (sub (describes $11) (descriptor $16) (struct)))
  (type $15 (sub (describes $13) (struct (field externref) (field i32) (field (mut i64)) (field v128) (field (mut v128)) (field i64))))
  (type $16 (describes $14) (descriptor $17) (struct (field externref) (field (mut structref))))
  (type $17 (describes $16) (struct (field externref) (field (ref null $12)) (field (ref null $2)) (field externref) (field i8)))
 )
 (type $18 (array (mut i16)))
 (type $19 (func))
 (type $20 (func (param i32)))
 (type $21 (array i8))
 (type $22 (func (result (ref null $17) f64)))
 (type $23 (func (param (ref $2))))
 (type $24 (func (param (ref eq))))
 (type $25 (func (param i32) (result funcref)))
 (type $26 (func (param i32 funcref)))
 (type $27 (func (param i64)))
 (type $28 (func (param f32)))
 (type $29 (func (param f64)))
 (type $30 (func (param v128)))
 (type $31 (func (param anyref)))
 (type $32 (func (param funcref)))
 (type $33 (func (param externref)))
 (type $34 (func (param (ref $10) v128 (ref null $6) (ref $2) structref) (result i31ref (ref null $1) f64)))
 (type $35 (func (param f32) (result f32)))
 (type $36 (func (param f64) (result f64)))
 (type $37 (func (param v128) (result v128)))
 (type $38 (func (result i31ref (ref null $1) f64)))
 (import "__fuzz_import" "global$_6" (global $gimport$0 externref))
 (import "__fuzz_import" "extern$" (global $gimport$1 (ref extern)))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $20) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $25) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $26) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $20) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $27) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $28) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $29) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $30) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $31) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $32) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $33) (param externref)))
 (global $global$0 (mut i64) (i64.const -65536))
 (global $global$1 f32 (f32.const 3354635265112014848))
 (global $global$2 i64 (i64.const -70))
 (global $global$3 i64 (i64.const 128))
 (global $global$4 (ref null $8) (ref.null nofunc))
 (global $global$5 (mut (ref $1)) (ref.func $0))
 (global $global$6 v128 (v128.const i32x4 0x0000fffe 0x0000927b 0x04000001 0x0000000d))
 (global $global$7 (mut f64) (f64.const -1223045))
 (global $global$8 f64 (f64.const 1.375))
 (global $global$9 (mut (ref $12)) (array.new $12
  (i32.const -524287)
  (i32.const 41)
 ))
 (global $global$10 (mut f64) (f64.const 0))
 (global $global$11 (mut (ref null $5)) (struct.new_desc $5
  (global.get $gimport$0)
  (struct.new_desc $6
   (global.get $gimport$0)
   (ref.func $0)
   (i32.const -35)
   (struct.new_desc $13
    (i32.const 181)
    (ref.null none)
   )
  )
 ))
 (global $global$12 (mut i64) (i64.const -9223372036854775808))
 (global $global$13 (mut f32) (f32.const 0.8220000267028809))
 (global $global$14 (mut funcref) (ref.null nofunc))
 (global $global$15 i64 (i64.const 218))
 (global $global$16 f32 (f32.const 0.7770000100135803))
 (global $global$17 (ref null $16) (ref.null none))
 (global $global$18 (ref null $16) (global.get $global$17))
 (global $global$19 (mut i32) (i32.const 13))
 (memory $0 16 16 shared)
 (data $0 ",\b4\83\ed_|o\10r\ab\eb\00=\1f")
 (data $1 (i32.const 0) "\13\d4\e2\86 \e4dj\95i\84;-Z\ccj\92\0e\fc\7f")
 (data $2 (i32.const 20) "\f9c$R\14?\96\1a\f7\91\f3\8e\80\b9f9d#\0e\aeJK\9c")
 (data $3 (i32.const 43) ":\c7\fc\95p{\a3\91b\f1RX\99\b6\dd\89\86\07W\c9\e0\03r\adl7\d5\eb")
 (data $4 "\d7\a6\a0\ee\cdZ/\d6a\9a\8c\18C:p_4\df\d7H\d8\18Be")
 (data $5 "\12\1a\d3>")
 (table $0 6 funcref)
 (table $1 8 8 exnref)
 (elem $0 (table $0) (i32.const 0) func)
 (elem declare func $0 $1 $3 $4)
 (tag $tag$0 (type $23) (param (ref $2)))
 (tag $tag$1 (type $24) (param (ref eq)))
 (tag $tag$2 (type $19))
 (export "global$" (global $global$0))
 (export "global$_1" (global $global$1))
 (export "global$_3" (global $global$4))
 (export "global$_5" (global $global$6))
 (export "global$_13" (global $global$16))
 (export "global$_15" (global $global$18))
 (export "table" (table $0))
 (export "func_invoker" (func $5))
 (export "func_17" (func $6))
 (export "func_17_invoker" (func $7))
 (func $0 (type $1) (param $0 (ref null $3)) (param $1 (ref null $4)) (param $2 f32) (result (ref null $17) f64)
  (local.set $2
   (call $8
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $1 (type $8) (param $0 structref) (param $1 (ref null $4)) (param $2 f32) (result (ref null $17) f64)
  (local.set $2
   (call $8
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $2 (type $34) (param $0 (ref $10)) (param $1 v128) (param $2 (ref null $6)) (param $3 (ref $2)) (param $4 structref) (result i31ref (ref null $1) f64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 v128)
  (local $9 f32)
  (local $10 f32)
  (local $11 i32)
  (local $12 f64)
  (local $13 (ref null $7))
  (local $14 (ref array))
  (local $15 structref)
  (local.set $1
   (call $10
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (throw $tag$0
   (local.tee $3
    (ref.cast (ref (exact $2))
     (struct.new $2
      (i32.const -42)
      (array.new_fixed $21 0)
      (ref.func $0)
      (ref.func $1)
      (i32.const 0)
      (struct.new_default_desc $13
       (struct.new_default $15)
      )
     )
    )
   )
  )
 )
 (func $3 (type $9) (param $0 (ref $6)) (result v128)
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $4 (type $0) (param $0 (ref null $6))
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (nop)
 )
 (func $5 (type $19)
  (local $0 (ref $18))
  (local $1 i31ref)
  (local $2 i31ref)
  (local $3 i31ref)
  (local $4 (ref $12))
  (local $5 (ref $12))
  (local $6 (ref $2))
  (local $7 (ref $2))
  (local $8 (ref $2))
  (local $9 (ref $2))
  (local $10 (ref $2))
  (local $11 stringref)
  (local $12 stringref)
  (local $13 (ref eq))
  (local $14 (ref eq))
  (local $15 (ref eq))
  (local $16 (ref string))
  (local $17 (ref string))
  (local $18 (ref $7))
  (local $19 (ref null $7))
  (local $20 (ref (exact $15)))
  (local $21 (ref null (exact $15)))
  (local $22 (ref null (exact $15)))
  (local $23 (ref $15))
  (local $24 nullref)
  (local $25 i32)
  (local $26 i32)
  (local $27 i32)
  (local $28 i32)
  (local $29 i32)
  (local $30 i64)
  (local $31 i64)
  (local $32 f64)
  (local $33 f64)
  (local $34 v128)
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (local.set $17
   (string.const "")
  )
  (local.set $4
   (global.get $global$9)
  )
  (drop
   (array.new_default $10
    (i32.and
     (i32.const 4)
     (i32.const 1023)
    )
   )
  )
  (drop
   (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
  )
  (drop
   (try_table (result (ref string))
    (string.const "\c2\a3\ed\bd\88")
   )
  )
  (drop
   (if (result (ref (exact $9)))
    (i32.eqz
     (i32.const -65536)
    )
    (then
     (call $fimport$3
      (i32.const -8193)
     )
     (ref.as_non_null
      (ref.null nofunc)
     )
    )
    (else
     (try_table (result (ref (exact $9)))
      (ref.func $3)
     )
    )
   )
  )
  (drop
   (if (result (ref string))
    (i32.const 255)
    (then
     (call $fimport$10
      (string.const "")
     )
     (string.from_code_point
      (i32.const 129)
     )
    )
    (else
     (call $fimport$10
      (global.get $gimport$0)
     )
     (return)
    )
   )
  )
  (drop
   (local.tee $0
    (array.new_default $18
     (i32.and
      (i32.const 11)
      (i32.const 1023)
     )
    )
   )
  )
  (loop $label
   (if
    (i32.eqz
     (global.get $global$19)
    )
    (then
     (global.set $global$19
      (i32.const 13)
     )
     (unreachable)
    )
   )
   (global.set $global$19
    (i32.sub
     (global.get $global$19)
     (i32.const 1)
    )
   )
   (call $fimport$7
    (call $10
     (v128.load offset=22 align=4
      (i32.and
       (i31.get_s
        (ref.as_non_null
         (local.tee $1
          (ref.i31
           (i32.const -1)
          )
         )
        )
       )
       (i32.const 15)
      )
     )
    )
   )
   (table.set $1
    (i32.const 2)
    (block $block (result (ref exn))
     (try_table (catch_all_ref $block)
      (throw $tag$2)
     )
     (unreachable)
    )
   )
   (br_if $label
    (i32.lt_s
     (i32.const -32768)
     (string.encode_wtf16_array
      (string.const "841\e2\82\ac")
      (array.new $18
       (i32.const 191)
       (i32.and
        (i32.const 52)
        (i32.const 1023)
       )
      )
      (i32.const -119)
     )
    )
   )
   (drop
    (string.const "\f0\90\8d\88\ed\bd\88")
   )
   (drop
    (local.tee $16
     (try_table (result (ref string)) (catch_all $label)
      (ref.as_non_null
       (local.tee $12
        (local.tee $17
         (string.const "\ed\a0\80")
        )
       )
      )
     )
    )
   )
   (block
    (f32.store offset=4 align=1
     (i32.and
      (local.get $25)
      (i32.const 15)
     )
     (try (result f32)
      (do
       (f32.const 3402823466385288598117041e14)
      )
      (catch $tag$1
       (drop (pop (ref eq)))
       (call $8
        (f32.load offset=4 align=1
         (local.get $25)
        )
       )
      )
      (catch $tag$0
       (drop (struct.get_u $2 0 (pop (ref $2))))
       (f32.const 0)
      )
     )
    )
    (return)
   )
   (local.set $5
    (local.set $4
     (unreachable)
    )
   )
  )
  (local.set $17
   (local.set $15
    (local.set $10
     (local.set $23
      (local.set $9
       (local.set $14
        (local.set $8
         (local.set $20
          (local.set $18
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
 (func $6 (type $0) (param $0 (ref null $6))
  (local $1 funcref)
  (local $2 (ref eq))
  (local $3 (ref eq))
  (local $4 (ref eq))
  (local $5 (ref string))
  (local $6 (ref null $18))
  (local $7 (ref $2))
  (local $8 (ref $2))
  (local $9 f32)
  (local $10 f32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 f64)
  (local $15 i64)
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (block
   (block
    (drop
     (i32.and
      (i32.load8_u offset=3
       (i32.and
        (ref.eq
         (ref.i31
          (i32.const -12979)
         )
         (array.new_fixed $21 0)
        )
        (i32.const 15)
       )
      )
      (i32.const 15)
     )
    )
    (loop $label
     (if
      (i32.eqz
       (global.get $global$19)
      )
      (then
       (global.set $global$19
        (i32.const 13)
       )
       (unreachable)
      )
     )
     (global.set $global$19
      (i32.sub
       (global.get $global$19)
       (i32.const 1)
      )
     )
     (table.set $0
      (i32.const 4)
      (ref.null nofunc)
     )
     (br $label)
    )
    (unreachable)
   )
   (unreachable)
  )
 )
 (func $7 (type $19)
  (local $0 (ref string))
  (local $1 i31ref)
  (local $2 (ref i31))
  (local $3 (ref null $6))
  (local $4 (ref null $6))
  (local $5 (ref $11))
  (local $6 (ref (exact $5)))
  (local $7 (ref $10))
  (local $8 (ref eq))
  (local $9 (ref $2))
  (local $10 i32)
  (local $11 f64)
  (local $12 f32)
  (local $13 v128)
  (if
   (i32.eqz
    (global.get $global$19)
   )
   (then
    (global.set $global$19
     (i32.const 13)
    )
    (unreachable)
   )
  )
  (global.set $global$19
   (i32.sub
    (global.get $global$19)
    (i32.const 1)
   )
  )
  (local.set $4
   (ref.as_non_null
    (local.get $4)
   )
  )
  (local.set $0
   (string.const "876\f0\90\8d\88")
  )
  (call $6
   (struct.new_desc $6
    (global.get $gimport$0)
    (loop $label5 (result (ref (exact $8)))
     (if
      (i32.eqz
       (global.get $global$19)
      )
      (then
       (global.set $global$19
        (i32.const 13)
       )
       (unreachable)
      )
     )
     (global.set $global$19
      (i32.sub
       (global.get $global$19)
       (i32.const 1)
      )
     )
     (if
      (i32.eqz
       (select
        (ref.is_null
         (string.concat
          (string.const "\e2\82\ac")
          (string.const "\ed\bd\88")
         )
        )
        (f64.ge
         (local.get $11)
         (f64.const 79)
        )
        (block (result i32)
         (atomic.fence acqrel)
         (i32.atomic.load acqrel offset=22
          (i32.and
           (i32.gt_u
            (string.eq
             (string.new_wtf16_array
              (array.new $18
               (i32.const 102)
               (i32.and
                (i32.const 73)
                (i32.const 1023)
               )
              )
              (ref.eq
               (select (result (ref i31))
                (select (result (ref i31))
                 (if (result (ref i31))
                  (i32.eqz
                   (local.get $10)
                  )
                  (then
                   (return)
                  )
                  (else
                   (ref.as_non_null
                    (local.tee $1
                     (local.tee $2
                      (ref.i31
                       (i32.const -415612120)
                      )
                     )
                    )
                   )
                  )
                 )
                 (ref.i31
                  (i32.const -3)
                 )
                 (string.measure_wtf16
                  (local.tee $0
                   (string.const "\c2\a3\f0\90\8d\88")
                  )
                 )
                )
                (ref.as_non_null
                 (local.get $1)
                )
                (i32.const 7)
               )
               (ref.as_non_null
                (ref.null none)
               )
              )
              (local.tee $10
               (block (result i32)
                (if
                 (i32.eqz
                  (global.get $global$19)
                 )
                 (then
                  (global.set $global$19
                   (i32.const 13)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$19
                 (i32.sub
                  (global.get $global$19)
                  (i32.const 1)
                 )
                )
                (nop)
                (if (result i32)
                 (i32.eqz
                  (i32.const 2048)
                 )
                 (then
                  (i32.const -25808)
                 )
                 (else
                  (local.get $10)
                 )
                )
               )
              )
             )
             (string.const "\ed\a0\80994")
            )
            (i32.const 79)
           )
           (i32.const 15)
          )
         )
        )
       )
      )
      (then
       (block $block1
        (loop $label1
         (if
          (i32.eqz
           (global.get $global$19)
          )
          (then
           (global.set $global$19
            (i32.const 13)
           )
           (unreachable)
          )
         )
         (global.set $global$19
          (i32.sub
           (global.get $global$19)
           (i32.const 1)
          )
         )
         (nop)
         (br_if $label1
          (i32.eqz
           (block (result i32)
            (nop)
            (try (result i32)
             (do
              (i32.const 32768)
             )
             (catch_all
              (f32.le
               (loop $label (result f32)
                (if
                 (i32.eqz
                  (global.get $global$19)
                 )
                 (then
                  (global.set $global$19
                   (i32.const 13)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$19
                 (i32.sub
                  (global.get $global$19)
                  (i32.const 1)
                 )
                )
                (call $fimport$5
                 (f32.const 274877906944)
                )
                (local.set $10
                 (local.get $10)
                )
                (nop)
                (br_if $label
                 (i32.const -1234633)
                )
                (f32.const -18446744073709551615)
               )
               (f32.const -2147483648)
              )
             )
            )
           )
          )
         )
        )
        (call $fimport$3
         (loop $label2 (result i32)
          (if
           (i32.eqz
            (global.get $global$19)
           )
           (then
            (global.set $global$19
             (i32.const 13)
            )
            (unreachable)
           )
          )
          (global.set $global$19
           (i32.sub
            (global.get $global$19)
            (i32.const 1)
           )
          )
          (nop)
          (if
           (i32.eqz
            (global.get $global$19)
           )
           (then
            (global.set $global$19
             (i32.const 13)
            )
            (unreachable)
           )
          )
          (global.set $global$19
           (i32.sub
            (global.get $global$19)
            (i32.const 1)
           )
          )
          (call $fimport$5
           (local.tee $12
            (f32.const -32768)
           )
          )
          (call $4
           (local.tee $3
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
          (nop)
          (br_if $label2
           (i32.eqz
            (local.tee $10
             (i32.wrap_i64
              (i64.trunc_f32_u
               (block (result f32)
                (nop)
                (f32.const 2147483648)
               )
              )
             )
            )
           )
          )
          (local.get $10)
         )
        )
        (call $fimport$6
         (call $9
          (f64.load offset=22 align=1
           (i32.and
            (i32.const -31)
            (i32.const 15)
           )
          )
         )
        )
        (drop
         (br_on_null $block1
          (if (result (ref i31))
           (loop $label3 (result i32)
            (if
             (i32.eqz
              (global.get $global$19)
             )
             (then
              (global.set $global$19
               (i32.const 13)
              )
              (unreachable)
             )
            )
            (global.set $global$19
             (i32.sub
              (global.get $global$19)
              (i32.const 1)
             )
            )
            (block $block
             (drop
              (br_on_null $block
               (string.const "")
              )
             )
             (nop)
            )
            (br_if $label3
             (i32.eqz
              (i32.le_u
               (local.get $10)
               (i32.atomic.rmw.cmpxchg acqrel offset=22
                (i32.and
                 (i32.const 2)
                 (i32.const 15)
                )
                (i32.const -134217728)
                (local.get $10)
               )
              )
             )
            )
            (local.get $10)
           )
           (then
            (nop)
            (br $block1)
           )
           (else
            (ref.i31
             (i32.const 1246386208)
            )
           )
          )
         )
        )
        (struct.set $3 1
         (struct.new_desc $3
          (i64.rem_u
           (i64.const 1)
           (i64.load8_u offset=4
            (i32.and
             (select
              (local.get $10)
              (local.get $10)
              (local.get $10)
             )
             (i32.const 15)
            )
           )
          )
          (local.tee $5
           (loop $label4 (result (ref (exact $11)))
            (if
             (i32.eqz
              (global.get $global$19)
             )
             (then
              (global.set $global$19
               (i32.const 13)
              )
              (unreachable)
             )
            )
            (global.set $global$19
             (i32.sub
              (global.get $global$19)
              (i32.const 1)
             )
            )
            (nop)
            (br_if $label4
             (local.get $10)
            )
            (struct.new_default_desc $11
             (struct.new_default_desc $14
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
          (local.tee $6
           (struct.new_desc $5
            (global.get $gimport$1)
            (ref.as_non_null
             (ref.null none)
            )
           )
          )
         )
         (struct.new_desc $11
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          (ref.func $4)
          (i32.const -2182)
          (global.get $global$15)
          (local.get $10)
          (ref.func $1)
          (ref.as_non_null
           (ref.null none)
          )
         )
        )
       )
      )
     )
     (drop
      (struct.get_u $4 0
       (struct.new_desc $4
        (string.eq
         (ref.null noextern)
         (string.const "\ed\bd\88")
        )
        (struct.new_default_desc $11
         (struct.new_default_desc $14
          (struct.new_default_desc $16
           (struct.new_default $17)
          )
         )
        )
       )
      )
     )
     (drop
      (i32.load8_s offset=4
       (i32.and
        (local.tee $10
         (local.get $10)
        )
        (i32.const 15)
       )
      )
     )
     (block
      (br_if $label5
       (i8x16.extract_lane_s 9
        (local.get $13)
       )
      )
      (return)
     )
     (unreachable)
    )
    (i32.load8_u offset=4
     (i32.and
      (string.compare
       (local.get $0)
       (local.get $0)
      )
      (i32.const 15)
     )
    )
    (block (result (ref (exact $13)))
     (nop)
     (nop)
     (call $fimport$6
      (call $9
       (global.get $global$8)
      )
     )
     (if (result (ref (exact $13)))
      (i32.eqz
       (array.get $10
        (local.tee $7
         (array.new_default $10
          (i32.and
           (i32.const 94)
           (i32.const 1023)
          )
         )
        )
        (try_table (result i32)
         (i32.const -33554432)
        )
       )
      )
      (then
       (loop $label6 (result (ref (exact $13)))
        (if
         (i32.eqz
          (global.get $global$19)
         )
         (then
          (global.set $global$19
           (i32.const 13)
          )
          (unreachable)
         )
        )
        (global.set $global$19
         (i32.sub
          (global.get $global$19)
          (i32.const 1)
         )
        )
        (block (result (ref (exact $13)))
         (try_table (catch_all $label6)
          (call $fimport$10
           (local.get $0)
          )
         )
         (struct.new_desc $13
          (local.get $10)
          (struct.new_default $15)
         )
        )
       )
      )
      (else
       (try_table
        (block
         (v128.store offset=4 align=4
          (i32.and
           (local.get $10)
           (i32.const 15)
          )
          (local.get $13)
         )
         (return)
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
 (func $8 (type $35) (param $0 f32) (result f32)
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
 (func $9 (type $36) (param $0 f64) (result f64)
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
 (func $10 (type $37) (param $0 v128) (result v128)
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
)
