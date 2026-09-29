(module
 (rec
  (type $0 (sub (func (param (ref null $1) i64) (result (ref $0)))))
  (type $1 (struct (field (ref null $2)) (field i32) (field (ref $0))))
  (type $2 (sub (struct (field v128) (field (mut f32)) (field i16) (field v128) (field (mut f32)) (field i16))))
 )
 (rec
  (type $3 (sub (struct (field (mut (ref eq))) (field (mut i64)) (field (mut (ref null $0))) (field v128))))
  (type $4 (sub (func (result v128))))
 )
 (type $5 (array (mut i16)))
 (type $6 (func))
 (type $7 (array i8))
 (type $8 (func (result i64)))
 (type $9 (struct))
 (type $10 (func (param i32 i32) (result i32)))
 (type $11 (func (param externref i64) (result (ref $0))))
 (type $12 (func (param i32)))
 (type $13 (func (result i32)))
 (type $14 (func (param (ref null $3) i64 funcref f32) (result (ref $2))))
 (type $15 (func (result i64 i32)))
 (type $16 (func (param i64)))
 (type $17 (func (param i64 (ref null $4) (ref null $0) f32 (ref $4) f64)))
 (type $18 (func (result externref)))
 (type $19 (func (result nullexternref f32 i64)))
 (type $20 (func (result f64 i64)))
 (type $21 (func (param i32) (result funcref)))
 (type $22 (func (param i32 funcref)))
 (type $23 (func (param f32)))
 (type $24 (func (param f64)))
 (type $25 (func (param v128)))
 (type $26 (func (param anyref)))
 (type $27 (func (param funcref)))
 (type $28 (func (param externref)))
 (type $29 (func (param funcref) (result i32)))
 (type $30 (func (param i32 (ref null $4) f64 i64 f64) (result i32)))
 (type $31 (func (param exnref structref f64)))
 (type $32 (func (param i64 f32) (result stringref)))
 (type $33 (func (param (ref null $3) (ref struct)) (result v128)))
 (type $34 (func (param i31ref) (result (ref $0))))
 (type $35 (func (result i31ref)))
 (type $36 (func (param (ref $4) (ref null $3)) (result i64 i32)))
 (type $37 (func (param f32 f64 (ref $2) f32 (ref null $1) structref) (result (ref null $2) (ref null $4) f64 v128 exnref externref)))
 (type $38 (func (param (ref string) f64 f64) (result i64 i32)))
 (type $39 (func (param structref (ref $2) stringref) (result i32)))
 (type $40 (func (result (ref $2))))
 (type $41 (func (param externref) (result (ref $0))))
 (type $42 (func (param externref i64 funcref f32) (result externref)))
 (type $43 (func (param f32) (result f32)))
 (type $44 (func (param f64) (result f64)))
 (type $45 (func (param v128) (result v128)))
 (type $46 (func (result (ref $4) f32)))
 (type $47 (func (result (ref (exact $2)) (ref (exact $4)) f64 v128 nullexnref (ref string))))
 (type $48 (func (result (ref null $2) (ref null $4) f64 v128 exnref externref)))
 (import "__fuzz_import" "extern$" (global $gimport$0 externref))
 (import "fuzzing-support" "throw" (func $fimport$0 (type $12) (param i32)))
 (import "fuzzing-support" "table-get" (func $fimport$1 (type $21) (param i32) (result funcref)))
 (import "fuzzing-support" "table-set" (func $fimport$2 (type $22) (param i32 funcref)))
 (import "fuzzing-support" "log-i32" (func $fimport$3 (type $12) (param i32)))
 (import "fuzzing-support" "log-i64" (func $fimport$4 (type $16) (param i64)))
 (import "fuzzing-support" "log-f32" (func $fimport$5 (type $23) (param f32)))
 (import "fuzzing-support" "log-f64" (func $fimport$6 (type $24) (param f64)))
 (import "fuzzing-support" "log-v128" (func $fimport$7 (type $25) (param v128)))
 (import "fuzzing-support" "log-anyref" (func $fimport$8 (type $26) (param anyref)))
 (import "fuzzing-support" "log-funcref" (func $fimport$9 (type $27) (param funcref)))
 (import "fuzzing-support" "log-externref" (func $fimport$10 (type $28) (param externref)))
 (import "fuzzing-support" "call-ref-catch" (func $fimport$11 (type $29) (param funcref) (result i32)))
 (import "fuzzing-support" "sleep" (func $fimport$12 (type $10) (param i32 i32) (result i32)))
 (global $global$0 stringref (string.const ""))
 (global $global$1 (mut i32) (i32.const 35))
 (memory $0 i64 16 17 shared)
 (data $0 ")\9be\8a~f\f4\f9\d5\84AA\cc\06\90@\95\18\ec\99!L\19*\c7")
 (data $1 (i64.const 0) "7\0c\b0m\b1\1d\13\db")
 (data $2 (i64.const 8) "\02-\175@\nn\e7\95\8e\84p\df5\c5\fd\95")
 (table $0 12 funcref)
 (table $1 1 1 exnref)
 (elem $0 (table $0) (i32.const 0) func $3 $3 $6 $13 $16 $17 $17 $20 $26 $28 $31 $31)
 (elem declare func $0 $1 $12 $19 $23 $27 $33 $5 $fimport$10 $fimport$12 $fimport$3)
 (tag $tag$0 (type $16) (param i64))
 (tag $tag$1 (type $6))
 (export "table" (table $0))
 (export "func" (func $1))
 (export "func_invoker" (func $2))
 (export "func_16" (func $3))
 (export "func_16_invoker" (func $4))
 (export "func_18" (func $35))
 (export "func_20" (func $7))
 (export "func_20_invoker" (func $8))
 (export "func_22_invoker" (func $10))
 (export "func_25" (func $36))
 (export "func_27" (func $37))
 (export "func_27_invoker" (func $15))
 (export "func_30" (func $38))
 (export "func_30_invoker" (func $18))
 (export "func_32" (func $39))
 (export "func_33_invoker" (func $21))
 (export "func_36" (func $23))
 (export "func_36_invoker" (func $24))
 (export "func_39" (func $40))
 (export "func_40" (func $27))
 (export "func_41_invoker" (func $29))
 (export "func_44" (func $41))
 (export "func_44_invoker" (func $32))
 (export "func_46" (func $42))
 (export "func_46_invoker" (func $34))
 (func $0 (type $4) (result v128)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $1 (type $30) (param $0 i32) (param $1 (ref null $4)) (param $2 f64) (param $3 i64) (param $4 f64) (result i32)
  (local $5 arrayref)
  (local $6 (ref $0))
  (local $7 (ref $3))
  (local $8 (ref null $0))
  (local $9 (ref $1))
  (local $10 v128)
  (local $11 i32)
  (local.set $2
   (call $44
    (local.get $2)
   )
  )
  (local.set $4
   (call $44
    (local.get $4)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (f32.eq
   (block $block (result f32)
    (i64.store32 offset=22
     (i64.and
      (local.get $3)
      (i64.const 15)
     )
     (i64.extend_i32_s
      (call $1
       (i32.const 230)
       (ref.func $0)
       (f64.const 0)
       (if (result i64)
        (f32.le
         (if (result f32)
          (struct.get $1 1
           (try_table (result (ref $1))
            (ref.cast (ref $1)
             (local.tee $9
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
          )
          (then
           (memory.init $1
            (local.tee $3
             (if (result i64)
              (local.get $0)
              (then
               (i64.const 65431)
              )
              (else
               (return
                (local.get $0)
               )
              )
             )
            )
            (i32.const 4)
            (i32.const 1)
           )
           (f32.const 236)
          )
          (else
           (nop)
           (return
            (i32.const -1048575)
           )
          )
         )
         (br_if $block
          (f32.const 24941)
          (ref.eq
           (ref.i31
            (i32.const 42)
           )
           (array.new_fixed $7 0)
          )
         )
        )
        (then
         (table.set $1
          (i32.const 0)
          (block $block1 (result (ref exn))
           (try_table (catch_all_ref $block1)
            (throw $tag$1)
           )
           (unreachable)
          )
         )
         (return
          (local.get $0)
         )
        )
        (else
         (if
          (i32.eqz
           (i16x8.extract_lane_s 0
            (call $45
             (v128.load offset=22
              (i64.const -97)
             )
            )
           )
          )
          (then
           (call $fimport$7
            (block (result v128)
             (if
              (i32.eqz
               (global.get $global$1)
              )
              (then
               (global.set $global$1
                (i32.const 35)
               )
               (unreachable)
              )
             )
             (global.set $global$1
              (i32.sub
               (global.get $global$1)
               (i32.const 1)
              )
             )
             (nop)
             (if (result v128)
              (i32.eqz
               (i32.const -16385)
              )
              (then
               (local.get $10)
              )
              (else
               (local.get $10)
              )
             )
            )
           )
          )
         )
         (block $block2
          (block
           (call $fimport$3
            (local.get $0)
           )
           (br $block2)
          )
          (unreachable)
         )
         (loop (result i64)
          (if
           (i32.eqz
            (global.get $global$1)
           )
           (then
            (global.set $global$1
             (i32.const 35)
            )
            (unreachable)
           )
          )
          (global.set $global$1
           (i32.sub
            (global.get $global$1)
            (i32.const 1)
           )
          )
          (block (result i64)
           (nop)
           (i64x2.extract_lane 0
            (v128.const i32x4 0x0000ffff 0x76747d00 0x40000080 0x8000be6c)
           )
          )
         )
        )
       )
       (loop $label2 (result f64)
        (if
         (i32.eqz
          (global.get $global$1)
         )
         (then
          (global.set $global$1
           (i32.const 35)
          )
          (unreachable)
         )
        )
        (global.set $global$1
         (i32.sub
          (global.get $global$1)
          (i32.const 1)
         )
        )
        (drop
         (ref.func $1)
        )
        (block $block3
         (memory.fill
          (i64.and
           (i64.const -48)
           (i64.const 15)
          )
          (call $fimport$11
           (ref.func $16)
          )
          (if (result i64)
           (stringview_wtf16.get_codeunit
            (string.const "983\ed\a0\80")
            (block (result i32)
             (local.set $11
              (i31.get_s
               (loop (result (ref i31))
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 35)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (ref.i31
                 (i32.const 127)
                )
               )
              )
             )
             (local.get $11)
            )
           )
           (then
            (drop
             (br_on_null $block3
              (ref.i31
               (i32.const -23)
              )
             )
            )
            (throw $tag$0
             (i64.div_u
              (i64.const -132941495451103)
              (i64.atomic.rmw8.cmpxchg_u acqrel offset=22
               (i64.and
                (i64.const 194)
                (i64.const 15)
               )
               (local.get $3)
               (i64.extend32_s
                (i64.const 1)
               )
              )
             )
            )
           )
           (else
            (loop $label1
             (if
              (i32.eqz
               (global.get $global$1)
              )
              (then
               (global.set $global$1
                (i32.const 35)
               )
               (unreachable)
              )
             )
             (global.set $global$1
              (i32.sub
               (global.get $global$1)
               (i32.const 1)
              )
             )
             (call $fimport$4
              (loop $label (result i64)
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 35)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (local.set $10
                (local.get $10)
               )
               (br_if $label
                (i32.eqz
                 (i32.const 216)
                )
               )
               (local.get $3)
              )
             )
             (br_if $label1
              (i32.eqz
               (i32.const 131072)
              )
             )
            )
            (nop)
            (i64.atomic.load32_u acqrel offset=22
             (i64.and
              (if (result i64)
               (loop (result i32)
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 35)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (local.get $0)
               )
               (then
                (call $fimport$4
                 (i64.extend_i32_s
                  (i32.const -24235)
                 )
                )
                (br $block3)
               )
               (else
                (if (result i64)
                 (i32.eqz
                  (local.get $0)
                 )
                 (then
                  (i64.const -28)
                 )
                 (else
                  (i64.const -26)
                 )
                )
               )
              )
              (i64.const 15)
             )
            )
           )
          )
         )
         (block
          (drop
           (br_on_null $block3
            (ref.i31
             (i32.const -93)
            )
           )
          )
          (br $label2)
         )
         (unreachable)
        )
        (br_if $label2
         (local.get $0)
        )
        (f64.const 0)
       )
      )
     )
    )
    (return
     (i32.const 0)
    )
   )
   (f32.const -2147483648)
  )
 )
 (func $2 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $1
    (i32.const -98)
    (ref.func $0)
    (f64.const 0)
    (i64.const -36028797018963968)
    (f64.const 129)
   )
  )
 )
 (func $3 (type $8) (result i64)
  (local $0 anyref)
  (local $1 (ref null $3))
  (local $2 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result i64)
   (loop
    (if
     (i32.eqz
      (global.get $global$1)
     )
     (then
      (global.set $global$1
       (i32.const 35)
      )
      (unreachable)
     )
    )
    (global.set $global$1
     (i32.sub
      (global.get $global$1)
      (i32.const 1)
     )
    )
    (call $fimport$10
     (loop (result (ref string))
      (if
       (i32.eqz
        (global.get $global$1)
       )
       (then
        (global.set $global$1
         (i32.const 35)
        )
        (unreachable)
       )
      )
      (global.set $global$1
       (i32.sub
        (global.get $global$1)
        (i32.const 1)
       )
      )
      (string.const "\ed\a0\80\c2\a3")
     )
    )
    (return
     (i64.const -255)
    )
   )
   (unreachable)
  )
 )
 (func $4 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $3)
  )
  (drop
   (call $3)
  )
 )
 (func $5 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (unreachable)
 )
 (func $6 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (local $2 (ref $3))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (ref.func $5)
 )
 (func $7 (type $6)
  (local $0 (ref string))
  (local $1 (ref $0))
  (local $2 funcref)
  (local $3 (ref $5))
  (local $4 (ref $2))
  (local $5 (ref i31))
  (local $6 (ref i31))
  (local $7 exnref)
  (local $8 (ref null $1))
  (local $9 (ref null $1))
  (local $10 arrayref)
  (local $11 (ref exn))
  (local $12 i32)
  (local $13 i32)
  (local $14 f64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
  (local $21 i64)
  (local $22 i64)
  (local $scratch f32)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $9
   (ref.as_non_null
    (local.get $9)
   )
  )
  (local.set $2
   (ref.as_non_null
    (local.get $2)
   )
  )
  (local.set $1
   (ref.func $5)
  )
  (local.set $0
   (string.const "\e2\82\ac\c2\a3")
  )
  (call $fimport$3
   (block (result i32)
    (call $fimport$7
     (v128.const i32x4 0xc50ba000 0xc2640000 0xcf800000 0x9d425f26)
    )
    (ref.is_null
     (struct.new $1
      (ref.null none)
      (i32.const -126)
      (ref.func $5)
     )
    )
   )
  )
  (block $block2
   (block
    (if
     (i32.const 32768)
     (then
      (block $block
       (br_if $block
        (i32.rotr
         (memory.atomic.notify offset=22
          (i64.and
           (i64x2.extract_lane 1
            (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           )
           (i64.const 15)
          )
          (i32.wrap_i64
           (i64.const -88)
          )
         )
         (i32.const -65535)
        )
       )
       (if
        (i32.eqz
         (i32.const -5285060)
        )
        (then
         (loop $label
          (if
           (i32.eqz
            (global.get $global$1)
           )
           (then
            (global.set $global$1
             (i32.const 35)
            )
            (unreachable)
           )
          )
          (global.set $global$1
           (i32.sub
            (global.get $global$1)
            (i32.const 1)
           )
          )
          (call $fimport$7
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
          (block $block1
           (try_table (catch_all $block1)
            (memory.fill
             (i64.const 128)
             (try_table (result i32) (catch_all $block)
              (i32.const 2147483647)
             )
             (block (result i64)
              (nop)
              (i64.const 65498)
             )
            )
           )
          )
          (br_if $label
           (i32.eqz
            (string.measure_wtf16
             (local.tee $0
              (string.const "")
             )
            )
           )
          )
         )
         (nop)
         (throw_ref
          (ref.null noexn)
         )
        )
        (else
         (drop
          (local.get $16)
         )
         (drop
          (i64.const 128)
         )
         (drop
          (i32.const -65535)
         )
         (block
          (nop)
          (br $block2)
         )
         (local.set $3
          (local.set $1
           (unreachable)
          )
         )
        )
       )
       (unreachable)
      )
     )
    )
   )
   (try $__t_20  (do (try  (do 
     (local.set $16
      (try $__t_19 (result i64) (do (try (result i64) (do 
        (select
         (i64.trunc_sat_f32_s
          (call $43
           (struct.get $2 4
            (local.tee $4
             (struct.new $2
              (call $45
               (i64x2.splat
                (if (result i64)
                 (local.get $13)
                 (then
                  (drop
                   (ref.null none)
                  )
                  (drop
                   (local.tee $5
                    (local.tee $6
                     (ref.i31
                      (i32.const -2147483648)
                     )
                    )
                   )
                  )
                  (unreachable)
                  (br $block2)
                 )
                 (else
                  (call $fimport$4
                   (i64.const 203)
                  )
                  (i64.const -32768)
                 )
                )
               )
              )
              (call $43
               (f32.load offset=22
                (loop (result i64)
                 (if
                  (i32.eqz
                   (global.get $global$1)
                  )
                  (then
                   (global.set $global$1
                    (i32.const 35)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$1
                  (i32.sub
                   (global.get $global$1)
                   (i32.const 1)
                  )
                 )
                 (local.get $16)
                )
               )
              )
              (i32.load offset=4
               (i64.and
                (i64.const -1)
                (i64.const 15)
               )
              )
              (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
              (call $43
               (block (result f32)
                (local.set $scratch
                 (f32.const 29790)
                )
                (drop
                 (i64.const -21657)
                )
                (local.get $scratch)
               )
              )
              (i32.const 2)
             )
            )
           )
          )
         )
         (local.get $16)
         (string.measure_wtf16
          (loop $label2 (result (ref string))
           (if
            (i32.eqz
             (global.get $global$1)
            )
            (then
             (global.set $global$1
              (i32.const 35)
             )
             (unreachable)
            )
           )
           (global.set $global$1
            (i32.sub
             (global.get $global$1)
             (i32.const 1)
            )
           )
           (block (result (ref string))
            (nop)
            (if (result (ref string))
             (try $__t_18 (result i32) (do
               (loop $label1 (result i32)
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 35)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (drop
                 (br_on_null $block2
                  (ref.as_non_null
                   (ref.null none)
                  )
                 )
                )
                (br_if $label1
                 (i32.eqz
                  (local.get $12)
                 )
                )
                (drop
                 (loop (result (ref $0))
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 35)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (local.get $1)
                 )
                )
                (call $fimport$11
                 (ref.func $16)
                )
               )
              ) (catch $tag$0
(local.set $17 (select (pop i64) (local.get $17) (i32.const 0)))
(if (global.get $__rt) (then (rethrow $__t_18)))
(if (result i32)
                (i32.eqz
                 (i32.const -2147483647)
                )
                (then
                 (i32.load16_u offset=4 align=1
                  (i64.and
                   (if (result i64)
                    (local.get $13)
                    (then
                     (i64.xor
                      (i64.const -58)
                      (local.get $16)
                     )
                    )
                    (else
                     (local.get $16)
                    )
                   )
                   (i64.const 15)
                  )
                 )
                )
                (else
                 (i32.const -101)
                )
               )) (catch_all
               (struct.get $1 1
                (struct.new $1
                 (ref.null none)
                 (string.measure_wtf16
                  (local.get $0)
                 )
                 (local.get $1)
                )
               )
              ))
             (then
              (try $__t_17 (result (ref string)) (do (try (result (ref string)) (do 
                (local.tee $0
                 (local.tee $0
                  (if (result (ref string))
                   (i32.eqz
                    (i32.atomic.load16_u acqrel offset=22
                     (i64.and
                      (i64.const -5089456)
                      (i64.const 15)
                     )
                    )
                   )
                   (then
                    (try $__t_16 (result (ref string)) (do (try (result (ref string)) (do 
                      (string.const "327")
                     ) (delegate $__t_16))) (catch $tag$0
(local.set $18 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $18))))
(if (global.get $__rt) (then (rethrow $__t_16)))
(local.get $0)) (catch_all
                      (local.tee $0
                       (string.const "")
                      )
                     ))
                   )
                   (else
                    (local.get $0)
                   )
                  )
                 )
                )
               ) (delegate $__t_17))) (catch $tag$0
(drop (pop i64))
(if (global.get $__rt) (then (rethrow $__t_17)))
(string.const "")) (catch_all (if (global.get $__rt) (then (rethrow $__t_17)))
(if (result (ref string))
                 (local.get $13)
                 (then
                  (nop)
                  (br $label2)
                 )
                 (else
                  (memory.init $2
                   (i64.and
                    (i64.const -39)
                    (i64.const 15)
                   )
                   (i32.const 13)
                   (i32.const 0)
                  )
                  (string.const "\ed\a0\80\ed\a0\80")
                 )
                )))
             )
             (else
              (i64.store16 offset=22
               (i64.and
                (local.tee $16
                 (i64.const -64)
                )
                (i64.const 15)
               )
               (i64.const 94)
              )
              (return)
             )
            )
           )
          )
         )
        )
       ) (delegate $__t_19))) (catch $tag$0
(local.set $20 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $20))))
(if (global.get $__rt) (then (rethrow $__t_19)))
(i64.load8_u offset=22
         (i64.and
          (local.tee $16
           (try $__t_15 (result i64) (do (try (result i64) (do 
             (local.get $16)
            ) (delegate $__t_15))) (catch $tag$0
             (throw $tag$0 (pop i64))
             (nop)
             (br $block2)
            ))
          )
          (i64.const 15)
         )
        )) (catch_all
        (if (result i64)
         (i32.eqz
          (local.get $12)
         )
         (then
          (table.set $1
           (i32.const 0)
           (local.get $7)
          )
          (br $block2)
         )
         (else
          (if (result i64)
           (i32.eqz
            (ref.eq
             (local.get $8)
             (if (result (ref struct))
              (i32.eqz
               (ref.eq
                (try $__t_14 (result arrayref) (do
                  (loop (result (ref none))
                   (if
                    (i32.eqz
                     (global.get $global$1)
                    )
                    (then
                     (global.set $global$1
                      (i32.const 35)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$1
                    (i32.sub
                     (global.get $global$1)
                     (i32.const 1)
                    )
                   )
                   (br_on_null $block2
                    (ref.as_non_null
                     (ref.null none)
                    )
                   )
                  )
                 ) (catch_all
                  (local.tee $10
                   (loop $label3 (result (ref none))
                    (if
                     (i32.eqz
                      (global.get $global$1)
                     )
                     (then
                      (global.set $global$1
                       (i32.const 35)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$1
                     (i32.sub
                      (global.get $global$1)
                      (i32.const 1)
                     )
                    )
                    (br_on_null $label3
                     (ref.as_non_null
                      (ref.null none)
                     )
                    )
                   )
                  )
                 ))
                (block $block3 (result (ref $1))
                 (nop)
                 (select (result (ref $1))
                  (loop (result (ref $1))
                   (if
                    (i32.eqz
                     (global.get $global$1)
                    )
                    (then
                     (global.set $global$1
                      (i32.const 35)
                     )
                     (unreachable)
                    )
                   )
                   (global.set $global$1
                    (i32.sub
                     (global.get $global$1)
                     (i32.const 1)
                    )
                   )
                   (br_if $block3
                    (ref.as_non_null
                     (local.tee $9
                      (select (result (ref none))
                       (ref.as_non_null
                        (ref.null none)
                       )
                       (ref.as_non_null
                        (ref.null none)
                       )
                       (local.get $12)
                      )
                     )
                    )
                    (i32.const -79)
                   )
                  )
                  (ref.as_non_null
                   (local.get $9)
                  )
                  (local.get $12)
                 )
                )
               )
              )
              (then
               (block $block4 (result (ref (exact $9)))
                (drop
                 (br_on_cast_fail $block4 (ref (exact $9)) (ref none)
                  (struct.new_default $9)
                 )
                )
                (br $block2)
               )
              )
              (else
               (struct.new_default $2)
              )
             )
            )
           )
           (then
            (table.set $1
             (i32.const 0)
             (local.tee $11
              (block $block5 (result (ref exn))
               (try_table (catch_all_ref $block5)
                (throw $tag$0
                 (i64.rem_u
                  (local.tee $16
                   (local.tee $16
                    (i64.const 7)
                   )
                  )
                  (block (result i64)
                   (table.set $1
                    (i32.const 0)
                    (block $block6 (result (ref exn))
                     (try_table (catch_all_ref $block6)
                      (throw $tag$0
                       (i64.atomic.load32_u acqrel offset=22
                        (i64.and
                         (local.get $16)
                         (i64.const 15)
                        )
                       )
                      )
                     )
                     (unreachable)
                    )
                   )
                   (if (result i64)
                    (local.get $13)
                    (then
                     (i64.atomic.load32_u acqrel offset=2
                      (i64.const -127)
                     )
                    )
                    (else
                     (return)
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
            (i64.const -9223372036854775808)
           )
           (else
            (nop)
            (br $block2)
           )
          )
         )
        )
       ))
     )
    ) (delegate $__t_20))) (catch $tag$0
(local.set $22 (call $__popsink_0 (pop i64)))
(if (global.get $__rt) (then (rethrow $__t_20)))
(nop)))
  )
 )
 (func $8 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $7)
  (call $7)
 )
 (func $9 (type $31) (param $0 exnref) (param $1 structref) (param $2 f64)
  (local $3 (ref null $3))
  (local $4 (ref string))
  (local $5 (ref string))
  (local $6 (ref $2))
  (local $7 (ref $2))
  (local $8 (ref $2))
  (local $9 f32)
  (local $10 f32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  (local $scratch (tuple nullexternref f32 i64))
  (local $scratch_18 f32)
  (local $scratch_19 nullexternref)
  (local.set $2
   (call $44
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $7
   (struct.new $2
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (f32.const 22586)
    (i32.const -15790)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (f32.const 0)
    (local.get $16)
   )
  )
  (v128.store offset=4 align=1
   (i64.and
    (local.get $11)
    (i64.const 15)
   )
   (call $45
    (v128.load offset=22 align=2
     (i64.and
      (try $__t_13 (result i64) (do (try (result i64) (do 
        (struct.get $3 1
         (struct.new $3
          (struct.new_default $9)
          (local.get $11)
          (ref.func $5)
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
        )
       ) (delegate $__t_13))) (catch $tag$0
        (local.set $12 (select (pop i64) (local.get $12) (i32.const 0)))
        (call_indirect $0 (type $8)
         (i32.const 1)
        )
       ) (catch_all (if (global.get $__rt) (then (rethrow $__t_13)))
(loop $label1 (result i64)
         (if
          (i32.eqz
           (global.get $global$1)
          )
          (then
           (global.set $global$1
            (i32.const 35)
           )
           (unreachable)
          )
         )
         (global.set $global$1
          (i32.sub
           (global.get $global$1)
           (i32.const 1)
          )
         )
         (try $__t_12 (result i64) (do
           (try $__t_11 (result i64) (do
             (if (result i64)
              (memory.atomic.notify offset=22
               (i64.and
                (if (result i64)
                 (i32.eqz
                  (string.measure_wtf16
                   (string.const "\ed\bd\88\c2\a3")
                  )
                 )
                 (then
                  (i64.atomic.rmw8.cmpxchg_u offset=4
                   (i64.and
                    (call_indirect $0 (type $8)
                     (i32.const 1)
                    )
                    (i64.const 15)
                   )
                   (loop $label (result i64)
                    (if
                     (i32.eqz
                      (global.get $global$1)
                     )
                     (then
                      (global.set $global$1
                       (i32.const 35)
                      )
                      (unreachable)
                     )
                    )
                    (global.set $global$1
                     (i32.sub
                      (global.get $global$1)
                      (i32.const 1)
                     )
                    )
                    (nop)
                    (br_if $label
                     (local.get $16)
                    )
                    (local.get $11)
                   )
                   (if (result i64)
                    (stringview_wtf16.get_codeunit
                     (local.tee $4
                      (local.tee $5
                       (string.const "")
                      )
                     )
                     (local.get $16)
                    )
                    (then
                     (local.get $11)
                    )
                    (else
                     (local.get $11)
                    )
                   )
                  )
                 )
                 (else
                  (call_indirect $0 (type $8)
                   (i32.const 0)
                  )
                 )
                )
                (i64.const 15)
               )
               (i32.const -2097152)
              )
              (then
               (drop
                (block (result nullexternref)
                 (local.set $scratch_19
                  (tuple.extract 3 0
                   (local.tee $scratch
                    (if (type $19) (result nullexternref f32 i64)
                     (struct.get_u $2 5
                      (local.tee $6
                       (try $__t_10 (result (ref $2)) (do (try (result (ref $2)) (do 
                         (try_table (result (ref $2)) (catch_all $label1)
                          (local.tee $7
                           (local.tee $8
                            (ref.as_non_null
                             (ref.null none)
                            )
                           )
                          )
                         )
                        ) (delegate $__t_10))) (catch $tag$0
(local.set $13 (local.tee $13 (pop i64)))
(if (global.get $__rt) (then (rethrow $__t_10)))
(local.get $7)) (catch_all (if (global.get $__rt) (then (rethrow $__t_10)))
(local.get $7)))
                      )
                     )
                     (then
                      (call $fimport$8
                       (ref.null none)
                      )
                      (br $label1)
                     )
                     (else
                      (tuple.make 3
                       (ref.null noextern)
                       (f32.const -9223372036854775808)
                       (i64.const 194)
                      )
                     )
                    )
                   )
                  )
                 )
                 (drop
                  (block (result f32)
                   (local.set $scratch_18
                    (tuple.extract 3 1
                     (local.get $scratch)
                    )
                   )
                   (local.set $15
                    (tuple.extract 3 2
                     (local.get $scratch)
                    )
                   )
                   (local.get $scratch_18)
                  )
                 )
                 (local.get $scratch_19)
                )
               )
               (local.get $15)
              )
              (else
               (local.tee $11
                (i64.const 65467)
               )
              )
             )
            ) (catch_all (if (global.get $__rt) (then (rethrow $__t_11)))
(block $block (result i64)
              (call $fimport$5
               (block (result f32)
                (call $fimport$0
                 (i32.const 0)
                )
                (call $43
                 (struct.get $2 4
                  (try_table (result (ref $2)) (catch $tag$0 $block) (catch $tag$0 $block) (catch $tag$0 $block) (catch_all $label1)
                   (local.get $7)
                  )
                 )
                )
               )
              )
              (br $label1)
             )))
          ) (catch $tag$0
           (throw $tag$0 (pop i64))
           (i64.const 30264)
          ))
        )))
      (i64.const 15)
     )
    )
   )
  )
 )
 (func $10 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $9
   (ref.null noexn)
   (struct.new_default $9)
   (f64.const 5)
  )
 )
 (func $11 (type $32) (param $0 i64) (param $1 f32) (result stringref)
  (local $2 (ref $2))
  (local.set $1
   (call $43
    (local.get $1)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (global.get $global$0)
 )
 (@binaryen.js.called)
 (func $12 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (local $2 f64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 v128)
  (local $11 (ref $4))
  (local $12 (ref i31))
  (local $13 (ref i31))
  (local $14 (ref $1))
  (local $15 (ref array))
  (local $16 (ref string))
  (local $scratch (ref (exact $4)))
  (local $scratch_18 (tuple (ref $4) f32))
  (local $scratch_19 (ref $4))
  (local $scratch_20 v128)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $11
   (block (result (ref (exact $4)))
    (local.set $scratch
     (ref.func $0)
    )
    (local.set $7
     (f32.const -53)
    )
    (local.get $scratch)
   )
  )
  (if
   (i32.atomic.load8_u offset=4
    (i64.and
     (i64x2.extract_lane 0
      (block (result v128)
       (try $__t_9  (do
         (local.set $1
          (local.get $1)
         )
        ) (catch $tag$0
(local.set $3 (call_ref $__sinkT_0 (pop i64) (ref.func $__popsink_0)))
(if (global.get $__rt) (then (rethrow $__t_9)))
(local.set $0
          (struct.new $1
           (struct.new $2
            (call $45
             (v128.load offset=22 align=1
              (i64.and
               (i64.const -73)
               (i64.const 15)
              )
             )
            )
            (local.tee $6
             (f32.const 4294967296)
            )
            (local.get $8)
            (call $45
             (i64x2.splat
              (loop $label (result i64)
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 35)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (i32.store8 offset=22
                (local.get $1)
                (local.tee $8
                 (i32.const -536870912)
                )
               )
               (br_if $label
                (local.get $8)
               )
               (i64.const -127)
              )
             )
            )
            (call $43
             (f32.div
              (f32.const 26162)
              (f32.const -2305843009213693952)
             )
            )
            (local.get $8)
           )
           (local.tee $8
            (local.get $8)
           )
           (ref.func $5)
          )
         )) (catch_all
         (drop
          (block (result (ref $4))
           (local.set $scratch_19
            (tuple.extract 2 0
             (local.tee $scratch_18
              (if (type $46) (result (ref $4) f32)
               (local.get $8)
               (then
                (tuple.make 2
                 (ref.as_non_null
                  (ref.null nofunc)
                 )
                 (f32.const 4294967296)
                )
               )
               (else
                (tuple.make 2
                 (local.get $11)
                 (local.get $7)
                )
               )
              )
             )
            )
           )
           (drop
            (tuple.extract 2 1
             (local.get $scratch_18)
            )
           )
           (local.get $scratch_19)
          )
         )
         (f32.store offset=4 align=1
          (i64.and
           (i64x2.extract_lane 1
            (if (result v128)
             (i32.eqz
              (call_ref $10
               (call $fimport$11
                (ref.func $12)
               )
               (i31.get_s
                (local.tee $12
                 (loop (result (ref i31))
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 35)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (local.tee $13
                   (ref.i31
                    (i32.const 1)
                   )
                  )
                 )
                )
               )
               (ref.func $fimport$12)
              )
             )
             (then
              (drop
               (f32.const 0)
              )
              (call $45
               (i32x4.ge_s
                (block (result v128)
                 (if
                  (i32.eqz
                   (global.get $global$1)
                  )
                  (then
                   (global.set $global$1
                    (i32.const 35)
                   )
                   (unreachable)
                  )
                 )
                 (global.set $global$1
                  (i32.sub
                   (global.get $global$1)
                   (i32.const 1)
                  )
                 )
                 (nop)
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
                (select
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                 (local.get $10)
                 (local.get $8)
                )
               )
              )
             )
             (else
              (if
               (i32.eqz
                (i16x8.extract_lane_s 5
                 (loop $label1 (result v128)
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 35)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label1
                   (i32.eqz
                    (local.get $8)
                   )
                  )
                  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                 )
                )
               )
               (then
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 35)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (nop)
                (nop)
               )
               (else
                (try $__t_8  (do
                  (call $fimport$2
                   (i32.const -1048575)
                   (ref.func $fimport$10)
                  )
                 ) (catch $tag$0
                  (local.set $4 (i64.mul (pop i64) (i64.const 4)))
                  (data.drop $2)
                 ) (catch_all (if (global.get $__rt) (then (rethrow $__t_8)))
(call $fimport$2
                   (local.get $8)
                   (call $fimport$1
                    (local.get $8)
                   )
                  )))
               )
              )
              (call $45
               (block (result v128)
                (local.set $scratch_20
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
                (drop
                 (f64.const -1152921504606846976)
                )
                (local.get $scratch_20)
               )
              )
             )
            )
           )
           (i64.const 15)
          )
          (f32.const 0)
         )
        ))
       (try_table (result v128)
        (v128.const i32x4 0x1d013f3b 0x000b81ff 0x014480ff 0x017e4400)
       )
      )
     )
     (i64.const 15)
    )
   )
   (then
    (block $block
     (drop
      (loop $label2 (result (ref (exact $2)))
       (if
        (i32.eqz
         (global.get $global$1)
        )
        (then
         (global.set $global$1
          (i32.const 35)
         )
         (unreachable)
        )
       )
       (global.set $global$1
        (i32.sub
         (global.get $global$1)
         (i32.const 1)
        )
       )
       (try_table (catch_all $label2)
        (struct.set $3 1
         (struct.new $3
          (struct.new $3
           (ref.i31
            (i32.const 70)
           )
           (local.get $1)
           (ref.func $5)
           (local.get $10)
          )
          (i64.const -65)
          (ref.func $5)
          (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
         )
         (local.tee $1
          (local.get $1)
         )
        )
       )
       (local.set $2
        (local.tee $2
         (local.tee $2
          (local.get $2)
         )
        )
       )
       (nop)
       (br_if $label2
        (if (result i32)
         (i32.eqz
          (call_ref $10
           (local.get $8)
           (stringview_wtf16.get_codeunit
            (string.const "\c2\a3\ed\bd\88\ed\a0\80")
            (block (result i32)
             (local.set $9
              (struct.get $1 1
               (local.tee $14
                (struct.new $1
                 (struct.new $2
                  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                  (local.get $6)
                  (local.get $8)
                  (local.get $10)
                  (local.get $6)
                  (i32.const 1)
                 )
                 (local.get $8)
                 (ref.func $5)
                )
               )
              )
             )
             (local.get $9)
            )
           )
           (ref.func $fimport$12)
          )
         )
         (then
          (local.get $8)
         )
         (else
          (local.set $14
           (ref.cast (ref (exact $1))
            (struct.new $1
             (ref.null none)
             (loop (result i32)
              (if
               (i32.eqz
                (global.get $global$1)
               )
               (then
                (global.set $global$1
                 (i32.const 35)
                )
                (unreachable)
               )
              )
              (global.set $global$1
               (i32.sub
                (global.get $global$1)
                (i32.const 1)
               )
              )
              (ref.eq
               (array.new_fixed $7 0)
               (array.new_fixed $7 0)
              )
             )
             (ref.func $5)
            )
           )
          )
          (br $block)
         )
        )
       )
       (struct.new_default $2)
      )
     )
     (if
      (stringview_wtf16.get_codeunit
       (local.tee $16
        (string.const "\ed\bd\88282")
       )
       (block (result i32)
        (local.set $9
         (ref.eq
          (ref.null none)
          (struct.new_default $9)
         )
        )
        (local.get $9)
       )
      )
      (then
       (call $fimport$0
        (i32.const 0)
       )
       (br $block)
      )
      (else
       (nop)
       (br $block)
      )
     )
     (local.set $15
      (unreachable)
     )
    )
   )
  )
  (nop)
  (return
   (ref.func $5)
  )
 )
 (func $13 (type $33) (param $0 (ref null $3)) (param $1 (ref struct)) (result v128)
  (local $2 (ref null $1))
  (local $3 (ref $3))
  (local $4 (ref $4))
  (local $5 (ref $2))
  (local $6 (ref string))
  (local $7 (ref $5))
  (local $8 v128)
  (local $9 i64)
  (local $10 i64)
  (local $11 f32)
  (local $12 i32)
  (local $13 i32)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $6
   (string.const "1011\ed\bd\88\ed\a0\80")
  )
  (call $45
   (f64x2.lt
    (call $45
     (struct.get $2 0
      (local.tee $5
       (try $__t_7 (result (ref (exact $2))) (do (try (result (ref (exact $2))) (do 
         (loop $label (result (ref (exact $2)))
          (if
           (i32.eqz
            (global.get $global$1)
           )
           (then
            (global.set $global$1
             (i32.const 35)
            )
            (unreachable)
           )
          )
          (global.set $global$1
           (i32.sub
            (global.get $global$1)
            (i32.const 1)
           )
          )
          (f64.store offset=4
           (i64.const -4294967296)
           (call $44
            (f64x2.extract_lane 0
             (local.get $8)
            )
           )
          )
          (nop)
          (br_if $label
           (string.compare
            (local.tee $6
             (try $__t_6 (result (ref string)) (do (try (result (ref string)) (do 
               (string.const "")
              ) (delegate $__t_6))) (catch $tag$0
               (throw $tag$0 (pop i64))
               (string.const "924622")
              ))
            )
            (string.const "\c2\a3\ed\bd\88\e2\82\ac")
           )
          )
          (struct.new $2
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
           (f32.const 1)
           (i32.const -68)
           (local.get $8)
           (f32.const 0)
           (i32.const 256)
          )
         )
        ) (delegate $__t_7))) (catch $tag$0
         (local.set $10 (select (pop i64) (local.get $10) (i32.const 1)))
         (struct.new_default $2)
        ))
      )
     )
    )
    (block $block (result v128)
     (call $fimport$5
      (f32.const 0)
     )
     (drop
      (ref.func $13)
     )
     (if
      (call $fimport$11
       (ref.func $12)
      )
      (then
       (nop)
      )
      (else
       (try_table
        (if
         (i32.eqz
          (i8x16.extract_lane_u 9
           (try_table (result v128)
            (local.get $8)
           )
          )
         )
         (then
          (return
           (local.get $8)
          )
         )
         (else
          (return
           (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
          )
         )
        )
        (unreachable)
       )
       (unreachable)
      )
     )
     (br_if $block
      (call $45
       (struct.get $2 3
        (local.get $5)
       )
      )
      (f32.le
       (loop (result f32)
        (if
         (i32.eqz
          (global.get $global$1)
         )
         (then
          (global.set $global$1
           (i32.const 35)
          )
          (unreachable)
         )
        )
        (global.set $global$1
         (i32.sub
          (global.get $global$1)
          (i32.const 1)
         )
        )
        (local.tee $11
         (f32.const 0)
        )
       )
       (loop $label1 (result f32)
        (if
         (i32.eqz
          (global.get $global$1)
         )
         (then
          (global.set $global$1
           (i32.const 35)
          )
          (unreachable)
         )
        )
        (global.set $global$1
         (i32.sub
          (global.get $global$1)
          (i32.const 1)
         )
        )
        (call $fimport$4
         (i64.const -102)
        )
        (br_if $label1
         (i32.eqz
          (i32.load8_s offset=22
           (i64.and
            (loop $label2 (result i64)
             (if
              (i32.eqz
               (global.get $global$1)
              )
              (then
               (global.set $global$1
                (i32.const 35)
               )
               (unreachable)
              )
             )
             (global.set $global$1
              (i32.sub
               (global.get $global$1)
               (i32.const 1)
              )
             )
             (call_ref $12
              (i32.const -7135169)
              (ref.func $fimport$3)
             )
             (nop)
             (br_if $label2
              (if (result i32)
               (stringview_wtf16.get_codeunit
                (local.get $6)
                (block (result i32)
                 (local.set $13
                  (i31.get_s
                   (ref.i31
                    (i32.const 8293)
                   )
                  )
                 )
                 (local.get $13)
                )
               )
               (then
                (struct.set $3 1
                 (local.get $0)
                 (i64.const -78)
                )
                (br $label1)
               )
               (else
                (i32.const -30)
               )
              )
             )
             (i64.const -8589934592)
            )
            (i64.const 15)
           )
          )
         )
        )
        (loop (result f32)
         (if
          (i32.eqz
           (global.get $global$1)
          )
          (then
           (global.set $global$1
            (i32.const 35)
           )
           (unreachable)
          )
         )
         (global.set $global$1
          (i32.sub
           (global.get $global$1)
           (i32.const 1)
          )
         )
         (local.get $11)
        )
       )
      )
     )
    )
   )
  )
 )
 (func $14 (type $34) (param $0 i31ref) (result (ref $0))
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 v128)
  (local $5 f32)
  (local $6 i32)
  (local $7 (ref null $1))
  (local $8 eqref)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result (ref (exact $0)))
   (try_table
    (call $fimport$0
     (i32.const -2147483648)
    )
   )
   (ref.func $5)
  )
 )
 (func $15 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $14
    (ref.null none)
   )
  )
 )
 (@binaryen.js.called)
 (func $16 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (local $2 (ref $0))
  (local $3 f32)
  (local $4 f64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (nop)
  (return
   (ref.func $12)
  )
 )
 (func $17 (type $35) (result i31ref)
  (local $0 eqref)
  (local $1 eqref)
  (local $2 (ref null $3))
  (local $3 (ref null $1))
  (local $4 (ref null $2))
  (local $5 (ref null $4))
  (local $6 (ref $3))
  (local $7 (ref $1))
  (local $8 anyref)
  (local $9 (ref $5))
  (local $10 v128)
  (local $11 f32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $6
   (struct.new $3
    (array.new_fixed $7 0)
    (i64.const -1073741824)
    (ref.func $5)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
  (block (result nullref)
   (block $block2
    (if
     (call $fimport$12
      (string.encode_wtf16_array
       (string.const "891\ed\a0\80")
       (local.tee $9
        (array.new $5
         (i64.le_u
          (i64.rem_u
           (i64.const 117)
           (i64.const -2147483647)
          )
          (i64.const 127)
         )
         (i32.and
          (i32.const 10)
          (i32.const 1023)
         )
        )
       )
       (i32.const 2097152)
      )
      (local.tee $12
       (string.encode_wtf16_array
        (string.const "\c2\a3\ed\a0\80\c2\a3")
        (loop (result (ref $5))
         (if
          (i32.eqz
           (global.get $global$1)
          )
          (then
           (global.set $global$1
            (i32.const 35)
           )
           (unreachable)
          )
         )
         (global.set $global$1
          (i32.sub
           (global.get $global$1)
           (i32.const 1)
          )
         )
         (block $block1 (result (ref $5))
          (memory.init $2
           (i64.and
            (i64.atomic.rmw8.xchg_u acqrel offset=22
             (i64.and
              (i64.const 0)
              (i64.const 15)
             )
             (if (result i64)
              (i32.const -10)
              (then
               (block $block (result i64)
                (call $fimport$5
                 (call $43
                  (f32.load offset=22 align=1
                   (i64.and
                    (i64.const 32767)
                    (i64.const 15)
                   )
                  )
                 )
                )
                (i64.atomic.load8_u acqrel offset=22
                 (i64.and
                  (br_if $block
                   (local.tee $14
                    (i64.const -48)
                   )
                   (local.get $12)
                  )
                  (i64.const 15)
                 )
                )
               )
              )
              (else
               (br_on_non_null $block1
                (ref.null none)
               )
               (i64.shr_u
                (local.get $14)
                (local.get $14)
               )
              )
             )
            )
            (i64.const 15)
           )
           (i32.const 12)
           (i32.const 1)
          )
          (local.get $9)
         )
        )
        (i64.ge_s
         (i64.const -81)
         (local.get $14)
        )
       )
      )
     )
     (then
      (drop
       (br_on_null $block2
        (struct.new_default $2)
       )
      )
      (i32.store16 offset=3 align=1
       (i64.and
        (struct.get $3 1
         (local.get $6)
        )
        (i64.const 15)
       )
       (local.tee $12
        (local.get $12)
       )
      )
     )
     (else
      (nop)
     )
    )
    (try_table (catch_all $block2)
     (nop)
    )
   )
   (ref.null none)
  )
 )
 (func $18 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $17)
  )
  (drop
   (call $17)
  )
  (drop
   (call $17)
  )
 )
 (func $19 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (ref.func $6)
 )
 (func $20 (type $17) (param $0 i64) (param $1 (ref null $4)) (param $2 (ref null $0)) (param $3 f32) (param $4 (ref $4)) (param $5 f64)
  (local $6 (ref null $3))
  (local $7 structref)
  (local $8 anyref)
  (local $9 (ref null $2))
  (local $10 i64)
  (local.set $3
   (call $43
    (local.get $3)
   )
  )
  (local.set $5
   (call $44
    (local.get $5)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $fimport$10
   (global.get $gimport$0)
  )
  (call $fimport$7
   (block (result v128)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
   )
  )
 )
 (func $21 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (call $20
   (i64.const -96)
   (ref.func $0)
   (ref.null nofunc)
   (f32.const 2147483648)
   (ref.func $0)
   (f64.const -1025)
  )
  (call $20
   (i64.const -16777215)
   (ref.func $0)
   (ref.null nofunc)
   (f32.const -124)
   (ref.func $0)
   (f64.const -36028797018963968)
  )
 )
 (func $22 (type $36) (param $0 (ref $4)) (param $1 (ref null $3)) (result i64 i32)
  (local $2 externref)
  (local $3 exnref)
  (local $4 (ref $1))
  (local $5 (ref array))
  (local $6 (ref array))
  (local $7 v128)
  (local $8 f32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $scratch i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (tuple.make 2
   (local.tee $11
    (block (result i64)
     (local.set $scratch
      (i64.const -116)
     )
     (local.set $12
      (i32.const -91)
     )
     (local.get $scratch)
    )
   )
   (local.get $12)
  )
 )
 (func $23 (type $13) (result i32)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 (ref $1))
  (local $7 i31ref)
  (local $8 (ref i31))
  (local $9 (ref $5))
  (local $10 (ref $5))
  (local $11 (ref $5))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result i32)
   (try_table
    (nop)
   )
   (stringview_wtf16.get_codeunit
    (try_table (result (ref string))
     (string.const "\ed\a0\80\e2\82\ac")
    )
    (block (result i32)
     (local.set $5
      (i32.atomic.rmw.xor acqrel offset=22
       (i64.and
        (try_table (result i64)
         (local.tee $1
          (local.tee $2
           (i64.trunc_f32_s
            (call $43
             (struct.get $2 4
              (struct.new $2
               (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
               (f32.const -9223372036854775808)
               (local.get $4)
               (v128.const i32x4 0xbaa96102 0x01a1fee0 0x0082f0ff 0x01f98057)
               (f32.const 18446744073709551615)
               (i32.const -31930)
              )
             )
            )
           )
          )
         )
        )
        (i64.const 15)
       )
       (i32.ctz
        (ref.test (ref (exact $2))
         (struct.new_default $2)
        )
       )
      )
     )
     (local.get $5)
    )
   )
  )
 )
 (func $24 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $23)
  )
 )
 (func $25 (type $37) (param $0 f32) (param $1 f64) (param $2 (ref $2)) (param $3 f32) (param $4 (ref null $1)) (param $5 structref) (result (ref null $2) (ref null $4) f64 v128 exnref externref)
  (local.set $0
   (call $43
    (local.get $0)
   )
  )
  (local.set $1
   (call $44
    (local.get $1)
   )
  )
  (local.set $3
   (call $43
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (type $47) (result (ref (exact $2)) (ref (exact $4)) f64 v128 nullexnref (ref string))
   (nop)
   (tuple.make 6
    (struct.new_default $2)
    (ref.func $0)
    (f64.const 2147483647.867)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (ref.null noexn)
    (string.const "\c2\a3\e2\82\ac\ed\bd\88")
   )
  )
 )
 (func $26 (type $14) (param $0 (ref null $3)) (param $1 i64) (param $2 funcref) (param $3 f32) (result (ref $2))
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 v128)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 f64)
  (local $14 (ref eq))
  (local $15 (ref null $3))
  (local $16 (ref null $1))
  (local $17 (ref null $0))
  (local $18 (ref null $2))
  (local $19 (ref $4))
  (local $20 stringref)
  (local $21 (ref $2))
  (local $22 (ref $3))
  (local $23 (ref func))
  (local.set $3
   (call $43
    (local.get $3)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (select (result (ref $2))
   (local.tee $21
    (struct.new_default $2)
   )
   (local.tee $21
    (loop $label (result (ref $2))
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 35)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (call $fimport$5
      (local.get $3)
     )
     (call $fimport$3
      (try_table (result i32) (catch_all $label)
       (i32.atomic.load acqrel offset=4
        (i64.and
         (local.get $12)
         (i64.const 15)
        )
       )
      )
     )
     (block $block
      (try_table (catch_all $block)
       (drop
        (struct.new_default $2)
       )
      )
     )
     (br_if $label
      (i32.eqz
       (i31.get_s
        (ref.i31
         (i32.const -1048576)
        )
       )
      )
     )
     (local.tee $21
      (local.tee $21
       (try $__t_5 (result (ref (exact $2))) (do (try (result (ref (exact $2))) (do 
         (struct.new_default $2)
        ) (delegate $__t_5))) (catch_all (if (global.get $__rt) (then (rethrow $__t_5)))
(struct.new_default $2)))
      )
     )
    )
   )
   (local.tee $10
    (i32.const -2147483648)
   )
  )
 )
 (@binaryen.js.called)
 (func $27 (type $4) (result v128)
  (local $0 f32)
  (local $1 i64)
  (local $2 arrayref)
  (local $3 (ref $3))
  (local $4 (ref $3))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (result v128)
   (nop)
   (select
    (call $45
     (struct.get $3 3
      (local.tee $3
       (local.tee $4
        (struct.new $3
         (array.new_fixed $7 0)
         (local.get $1)
         (ref.func $16)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
       )
      )
     )
    )
    (call $45
     (f32x4.add
      (select
       (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
       (v128.const i32x4 0xcf000000 0xbe26e979 0x5b800000 0x00000000)
       (i32.const -23682)
      )
      (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
     )
    )
    (string.measure_wtf16
     (string.const "\f0\90\8d\88\c2\a3")
    )
   )
  )
 )
 (func $28 (type $38) (param $0 (ref string)) (param $1 f64) (param $2 f64) (result i64 i32)
  (local $3 i32)
  (local $4 f32)
  (local $5 i64)
  (local $6 stringref)
  (local $7 (ref null $1))
  (local $8 exnref)
  (local $9 (ref null $2))
  (local.set $1
   (call $44
    (local.get $1)
   )
  )
  (local.set $2
   (call $44
    (local.get $2)
   )
  )
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block (type $15) (result i64 i32)
   (nop)
   (tuple.make 2
    (i64.const 9223372036854775807)
    (i32.const 65483)
   )
  )
 )
 (func $29 (type $6)
  (local $scratch (tuple i64 i32))
  (local $scratch_1 i64)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (block (result i64)
    (local.set $scratch_1
     (tuple.extract 2 0
      (local.tee $scratch
       (call $28
        (string.const "\ed\a0\80897")
        (f64.const 4294967238)
        (f64.const -9223372036854775808)
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
 )
 (func $30 (type $39) (param $0 structref) (param $1 (ref $2)) (param $2 stringref) (result i32)
  (local $3 (ref null $2))
  (local $4 i31ref)
  (local $5 (ref $1))
  (local $6 nullfuncref)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  (local $11 i64)
  (local $12 i32)
  (local $13 i32)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (block
   (loop $label
    (if
     (i32.eqz
      (global.get $global$1)
     )
     (then
      (global.set $global$1
       (i32.const 35)
      )
      (unreachable)
     )
    )
    (global.set $global$1
     (i32.sub
      (global.get $global$1)
      (i32.const 1)
     )
    )
    (block $block1
     (br_if $block1
      (local.tee $12
       (ref.eq
        (select (result (ref i31))
         (ref.i31
          (i32.const -26575)
         )
         (ref.i31
          (i32.const 65535)
         )
         (if (result i32)
          (i32.eqz
           (string.measure_wtf16
            (string.const "")
           )
          )
          (then
           (table.set $1
            (i32.const 0)
            (block $block (result (ref exn))
             (try_table (catch_all_ref $block)
              (throw $tag$0
               (i64.extend_i32_u
                (local.tee $13
                 (i32.const -255)
                )
               )
              )
             )
             (unreachable)
            )
           )
           (block
            (nop)
            (br $block1)
           )
           (unreachable)
          )
          (else
           (local.get $13)
          )
         )
        )
        (struct.new $3
         (ref.i31
          (i32.const -10)
         )
         (local.get $11)
         (ref.func $16)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
       )
      )
     )
     (nop)
    )
    (br_if $label
     (i32x4.extract_lane 1
      (call $45
       (f64x2.splat
        (f64.const -18446744073709551615)
       )
      )
     )
    )
    (loop $label1
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 35)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (drop
      (br_on_null $label
       (array.new_fixed $7 0)
      )
     )
     (br_if $label1
      (i32.eqz
       (local.tee $13
        (call_ref $10
         (loop $label2 (result i32)
          (if
           (i32.eqz
            (global.get $global$1)
           )
           (then
            (global.set $global$1
             (i32.const 35)
            )
            (unreachable)
           )
          )
          (global.set $global$1
           (i32.sub
            (global.get $global$1)
            (i32.const 1)
           )
          )
          (try_table (catch_all $label)
           (br_if $label1
            (i32x4.extract_lane 3
             (call $45
              (v128.load offset=2
               (i64.and
                (i64.const -512)
                (i64.const 15)
               )
              )
             )
            )
           )
          )
          (drop
           (string.const "")
          )
          (br_if $label2
           (i32.eqz
            (local.get $12)
           )
          )
          (loop $label3 (result i32)
           (if
            (i32.eqz
             (global.get $global$1)
            )
            (then
             (global.set $global$1
              (i32.const 35)
             )
             (unreachable)
            )
           )
           (global.set $global$1
            (i32.sub
             (global.get $global$1)
             (i32.const 1)
            )
           )
           (nop)
           (local.set $4
            (ref.null none)
           )
           (br_if $label3
            (i32.eqz
             (ref.is_null
              (local.tee $1
               (local.tee $1
                (local.get $1)
               )
              )
             )
            )
           )
           (i64.ge_u
            (try_table (result i64) (catch_all $label)
             (i64.const 128)
            )
            (block (result i64)
             (nop)
             (i64.const 4294967294)
            )
           )
          )
         )
         (try_table (result i32) (catch_all $label)
          (if (result i32)
           (i32.eqz
            (ref.eq
             (ref.i31
              (i32.const 16383)
             )
             (array.new_fixed $7 0)
            )
           )
           (then
            (local.set $11
             (loop (result i64)
              (if
               (i32.eqz
                (global.get $global$1)
               )
               (then
                (global.set $global$1
                 (i32.const 35)
                )
                (unreachable)
               )
              )
              (global.set $global$1
               (i32.sub
                (global.get $global$1)
                (i32.const 1)
               )
              )
              (local.get $11)
             )
            )
            (br $label)
           )
           (else
            (local.set $1
             (struct.new_default $2)
            )
            (i32.const -58)
           )
          )
         )
         (ref.func $fimport$12)
        )
       )
      )
     )
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 35)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (nop)
     (block
      (local.set $11
       (struct.get $3 1
        (struct.new $3
         (array.new_fixed $7 0)
         (i64.const -14521)
         (ref.func $5)
         (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
        )
       )
      )
      (br $label1)
     )
     (unreachable)
    )
    (unreachable)
   )
   (unreachable)
  )
  (unreachable)
 )
 (@binaryen.js.called)
 (func $31 (type $40) (result (ref $2))
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 f32)
  (local $15 f32)
  (local $16 f64)
  (local $17 f64)
  (local $18 i32)
  (local $19 i32)
  (local $20 v128)
  (local $21 v128)
  (local $22 structref)
  (local $23 (ref $2))
  (local $24 (ref func))
  (local $25 (ref null $3))
  (local $26 (ref $4))
  (local $27 (ref $0))
  (local $28 (ref $0))
  (local $29 (ref $0))
  (local $30 (ref eq))
  (local $31 (ref struct))
  (local $32 (ref struct))
  (local $33 (ref $5))
  (local $34 (ref string))
  (local $35 (ref string))
  (local $36 (ref string))
  (local $37 (ref null $0))
  (local $38 (ref $1))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $34
   (string.const "\ed\a0\801017")
  )
  (local.set $30
   (array.new_fixed $7 0)
  )
  (local.set $26
   (ref.func $0)
  )
  (local.set $23
   (struct.new $2
    (local.get $20)
    (f32.const 0)
    (local.get $18)
    (local.get $20)
    (local.get $14)
    (local.get $18)
   )
  )
  (block $block (result (ref $2))
   (br_on_non_null $block
    (ref.cast (ref (exact $2))
     (br_if $block
      (struct.new_default $2)
      (i32.const -7848187)
     )
    )
   )
   (drop
    (local.get $0)
   )
   (drop
    (ref.func $27)
   )
   (drop
    (loop (result (ref (exact $0)))
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 35)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (ref.func $19)
    )
   )
   (drop
    (br_on_cast_fail $block (ref $2) (ref $2)
     (local.get $23)
    )
   )
   (drop
    (f32.const 68)
   )
   (drop
    (local.get $26)
   )
   (drop
    (call $44
     (f64.load offset=22 align=1
      (local.tee $0
       (block $block2 (result i64)
        (call $fimport$2
         (string.encode_wtf16_array
          (block $block1 (result (ref string))
           (block
            (drop
             (loop (result i64)
              (if
               (i32.eqz
                (global.get $global$1)
               )
               (then
                (global.set $global$1
                 (i32.const 35)
                )
                (unreachable)
               )
              )
              (global.set $global$1
               (i32.sub
                (global.get $global$1)
                (i32.const 1)
               )
              )
              (i64.const -2147483647)
             )
            )
            (block
             (drop
              (br_on_cast $block1 (ref string) (ref string)
               (string.const "346")
              )
             )
             (return
              (local.get $23)
             )
            )
            (unreachable)
           )
           (unreachable)
          )
          (try $__t_4 (result (ref $5)) (do
            (array.new $5
             (local.tee $18
              (i32.atomic.load8_u acqrel offset=22
               (i64.and
                (i64.atomic.load offset=22
                 (i64.and
                  (i64.const -20)
                  (i64.const 15)
                 )
                )
                (i64.const 15)
               )
              )
             )
             (i32.and
              (i32.const 18)
              (i32.const 1023)
             )
            )
           ) (catch $tag$0
(local.set $7 (local.tee $7 (pop i64)))
(if (global.get $__rt) (then (rethrow $__t_4)))
(local.tee $33
             (array.new_default $5
              (i32.and
               (i32.const 6)
               (i32.const 1023)
              )
             )
            )))
          (loop $label (result i32)
           (if
            (i32.eqz
             (global.get $global$1)
            )
            (then
             (global.set $global$1
              (i32.const 35)
             )
             (unreachable)
            )
           )
           (global.set $global$1
            (i32.sub
             (global.get $global$1)
             (i32.const 1)
            )
           )
           (nop)
           (br_if $label
            (select
             (i32.load offset=4 align=1
              (i64.and
               (i64.const -1)
               (i64.const 15)
              )
             )
             (local.get $18)
             (select
              (ref.eq
               (array.new_fixed $7 0)
               (ref.i31
                (i32.const 32767)
               )
              )
              (i32.load offset=22
               (select
                (i64.const 89)
                (local.get $0)
                (i32.const 17)
               )
              )
              (try_table (result i32) (catch $tag$0 $block2) (catch $tag$0 $block2) (catch $tag$0 $block2) (catch_all $label)
               (call_ref $13
                (ref.func $23)
               )
              )
             )
            )
           )
           (i32.const -92)
          )
         )
         (block (result funcref)
          (drop
           (br_on_cast_fail $block (ref $2) (ref $2)
            (call_indirect $0 (type $14)
             (struct.new $3
              (local.get $30)
              (local.get $0)
              (ref.func $12)
              (local.tee $20
               (call $45
                (v128.load offset=4
                 (i64.and
                  (i64.const -79)
                  (i64.const 15)
                 )
                )
               )
              )
             )
             (select
              (local.tee $0
               (call_indirect $0 (type $8)
                (i32.const 0)
               )
              )
              (local.tee $0
               (i64.const 32769)
              )
              (i16x8.extract_lane_u 3
               (if (result v128)
                (local.get $18)
                (then
                 (nop)
                 (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                )
                (else
                 (try_table (catch $tag$0 $block2)
                  (nop)
                 )
                 (call $45
                  (v128.load offset=4 align=1
                   (i64.and
                    (try_table (result i64) (catch $tag$0 $block2)
                     (local.get $0)
                    )
                    (i64.const 15)
                   )
                  )
                 )
                )
               )
              )
             )
             (call $fimport$1
              (local.get $18)
             )
             (f32.const 65467)
             (i32.const 8)
            )
           )
          )
          (drop
           (br_on_cast_fail $block (ref $2) (ref $2)
            (if (result (ref $2))
             (i32.eqz
              (local.tee $18
               (local.get $18)
              )
             )
             (then
              (nop)
              (loop $label1 (result (ref $2))
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 35)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (nop)
               (nop)
               (if
                (local.get $18)
                (then
                 (loop
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 35)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (call $fimport$2
                   (local.get $18)
                   (call $fimport$1
                    (string.compare
                     (local.get $34)
                     (local.get $34)
                    )
                   )
                  )
                 )
                )
               )
               (br_if $label1
                (local.get $18)
               )
               (local.get $23)
              )
             )
             (else
              (block $block3 (result (ref $2))
               (nop)
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 35)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (nop)
               (drop
                (br_on_cast $block3 (ref $2) (ref $2)
                 (loop $label2 (result (ref $2))
                  (if
                   (i32.eqz
                    (global.get $global$1)
                   )
                   (then
                    (global.set $global$1
                     (i32.const 35)
                    )
                    (unreachable)
                   )
                  )
                  (global.set $global$1
                   (i32.sub
                    (global.get $global$1)
                    (i32.const 1)
                   )
                  )
                  (nop)
                  (br_if $label2
                   (i32.const -30)
                  )
                  (local.get $23)
                 )
                )
               )
               (call_indirect $0 (type $14)
                (ref.null none)
                (local.get $0)
                (local.get $26)
                (f32.const -23)
                (i32.const 8)
               )
              )
             )
            )
           )
          )
          (drop
           (br_on_cast $block (ref $2) (ref $2)
            (if (result (ref $2))
             (i32.eqz
              (i32.const -262144)
             )
             (then
              (local.get $23)
             )
             (else
              (drop
               (ref.as_non_null
                (ref.null none)
               )
              )
              (unreachable)
             )
            )
           )
          )
          (call $fimport$1
           (local.tee $18
            (ref.eq
             (array.new_fixed $7 0)
             (loop $label3 (result nullref)
              (if
               (i32.eqz
                (global.get $global$1)
               )
               (then
                (global.set $global$1
                 (i32.const 35)
                )
                (unreachable)
               )
              )
              (global.set $global$1
               (i32.sub
                (global.get $global$1)
                (i32.const 1)
               )
              )
              (atomic.fence acqrel)
              (data.drop $2)
              (br_if $label3
               (i32.eqz
                (block (result i32)
                 (nop)
                 (local.get $18)
                )
               )
              )
              (block (result nullref)
               (i64.store8 offset=4
                (i64.and
                 (i64.const 4292217131)
                 (i64.const 15)
                )
                (i64.load8_u offset=22
                 (i64.and
                  (br_if $block2
                   (local.get $0)
                   (i32.eqz
                    (local.get $18)
                   )
                  )
                  (i64.const 15)
                 )
                )
               )
               (ref.null none)
              )
             )
            )
           )
          )
         )
        )
        (try_table (result i64) (catch $tag$0 $block2) (catch $tag$0 $block2) (catch $tag$0 $block2)
         (local.get $0)
        )
       )
      )
     )
    )
   )
   (if
    (try $__t_3 (result i32) (do
      (i32.atomic.load16_u acqrel offset=4
       (i64.and
        (call_indirect $0 (type $8)
         (i32.const 0)
        )
        (i64.const 15)
       )
      )
     ) (catch $tag$0
      (local.set $1 (if (result i64) (i64.eqz (pop i64)) (then (i64.const 1)) (else (local.get $1))))
      (loop $label5
       (if
        (i32.eqz
         (global.get $global$1)
        )
        (then
         (global.set $global$1
          (i32.const 35)
         )
         (unreachable)
        )
       )
       (global.set $global$1
        (i32.sub
         (global.get $global$1)
         (i32.const 1)
        )
       )
       (nop)
       (br_if $label5
        (memory.atomic.notify offset=4
         (if (result i64)
          (i31.get_u
           (block (result (ref i31))
            (nop)
            (ref.i31
             (i32.const 0)
            )
           )
          )
          (then
           (block $block4 (result i64)
            (try_table (catch $tag$0 $block4) (catch $tag$0 $block4)
             (drop
              (loop $label4 (result (ref string))
               (if
                (i32.eqz
                 (global.get $global$1)
                )
                (then
                 (global.set $global$1
                  (i32.const 35)
                 )
                 (unreachable)
                )
               )
               (global.set $global$1
                (i32.sub
                 (global.get $global$1)
                 (i32.const 1)
                )
               )
               (atomic.fence)
               (br_if $label4
                (i32.const 170)
               )
               (string.const "")
              )
             )
            )
            (br $label5)
           )
          )
          (else
           (if
            (i32.eqz
             (global.get $global$1)
            )
            (then
             (global.set $global$1
              (i32.const 35)
             )
             (unreachable)
            )
           )
           (global.set $global$1
            (i32.sub
             (global.get $global$1)
             (i32.const 1)
            )
           )
           (atomic.fence)
           (call $9
            (block $block5 (result (ref exn))
             (try_table (catch_all_ref $block5)
              (throw $tag$0
               (local.get $0)
              )
             )
             (unreachable)
            )
            (local.tee $23
             (ref.as_non_null
              (ref.null none)
             )
            )
            (local.get $16)
           )
           (table.set $0
            (i32.const 5)
            (try $__t_2 (result (ref func)) (do
              (local.tee $24
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
             ) (catch $tag$0
              (local.set $2 (i64.mul (pop i64) (i64.const -1)))
              (ref.func $23)
             ) (catch_all (if (global.get $__rt) (then (rethrow $__t_2)))
(ref.as_non_null
               (ref.null nofunc)
              )))
           )
           (return
            (loop $label6 (result (ref $2))
             (if
              (i32.eqz
               (global.get $global$1)
              )
              (then
               (global.set $global$1
                (i32.const 35)
               )
               (unreachable)
              )
             )
             (global.set $global$1
              (i32.sub
               (global.get $global$1)
               (i32.const 1)
              )
             )
             (nop)
             (nop)
             (drop
              (br_on_null $label6
               (ref.as_non_null
                (ref.null none)
               )
              )
             )
             (br_if $label6
              (i32.eqz
               (i32.const -8388608)
              )
             )
             (if (result (ref $2))
              (i32.eqz
               (local.get $18)
              )
              (then
               (loop $label7 (result (ref $2))
                (if
                 (i32.eqz
                  (global.get $global$1)
                 )
                 (then
                  (global.set $global$1
                   (i32.const 35)
                  )
                  (unreachable)
                 )
                )
                (global.set $global$1
                 (i32.sub
                  (global.get $global$1)
                  (i32.const 1)
                 )
                )
                (nop)
                (br_if $label7
                 (i32.eqz
                  (i32.const -5)
                 )
                )
                (local.get $23)
               )
              )
              (else
               (return
                (local.get $23)
               )
              )
             )
            )
           )
          )
         )
         (local.tee $18
          (call_ref $13
           (ref.func $23)
          )
         )
        )
       )
       (drop
        (br_on_null $label5
         (ref.func $19)
        )
       )
       (drop
        (i64.and
         (i64.const 2147483646)
         (i64.const 15)
        )
       )
       (if
        (i32.eqz
         (ref.test (ref $3)
          (if (result (ref $3))
           (i32.eqz
            (local.get $18)
           )
           (then
            (ref.as_non_null
             (local.tee $25
              (ref.as_non_null
               (ref.null none)
              )
             )
            )
           )
           (else
            (ref.as_non_null
             (local.get $25)
            )
           )
          )
         )
        )
        (then
         (drop
          (local.tee $26
           (ref.as_non_null
            (ref.null nofunc)
           )
          )
         )
         (if
          (i32.eqz
           (call $fimport$11
            (ref.func $31)
           )
          )
          (then
           (v128.store offset=22 align=4
            (i64.and
             (i64.const -2097152)
             (i64.const 15)
            )
            (local.tee $20
             (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
            )
           )
          )
         )
         (br $label5)
        )
        (else
         (drop
          (ref.as_non_null
           (local.get $25)
          )
         )
         (drop
          (local.tee $27
           (try $__t_1 (result (ref $0)) (do (try (result (ref $0)) (do 
             (ref.as_non_null
              (ref.null nofunc)
             )
            ) (delegate $__t_1))) (catch_all (if (global.get $__rt) (then (rethrow $__t_1)))
(local.tee $28
              (local.tee $29
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
             )))
          )
         )
         (br $label5)
        )
       )
       (unreachable)
      )
      (unreachable)
     ))
    (then
     (loop
      (if
       (i32.eqz
        (global.get $global$1)
       )
       (then
        (global.set $global$1
         (i32.const 35)
        )
        (unreachable)
       )
      )
      (global.set $global$1
       (i32.sub
        (global.get $global$1)
        (i32.const 1)
       )
      )
      (local.set $16
       (call $44
        (f64.nearest
         (call $44
          (f64.abs
           (local.get $16)
          )
         )
        )
       )
      )
      (drop
       (call $45
        (i8x16.splat
         (local.tee $18
          (i32.atomic.load offset=4
           (i64.and
            (local.tee $0
             (local.tee $0
              (i64.atomic.load32_u offset=3
               (i64.and
                (local.get $0)
                (i64.const 15)
               )
              )
             )
            )
            (i64.const 15)
           )
          )
         )
        )
       )
      )
      (drop
       (call $43
        (f32x4.extract_lane 3
         (v128.const i32x4 0x60f7b221 0x00fd0001 0x015e02ff 0xbc008500)
        )
       )
      )
      (drop
       (struct.new $3
        (struct.new_default $9)
        (local.get $0)
        (ref.func $12)
        (local.get $20)
       )
      )
      (if
       (i32.eqz
        (i8x16.extract_lane_s 0
         (local.get $20)
        )
       )
       (then
        (memory.copy
         (i64.sub
          (i64.const 65478)
          (local.get $0)
         )
         (struct.get $3 1
          (ref.as_non_null
           (local.get $25)
          )
         )
         (i64.atomic.load16_u offset=1
          (i64.and
           (local.get $0)
           (i64.const 15)
          )
         )
        )
        (return
         (struct.new $2
          (local.get $20)
          (f32.const -9223372036854775808)
          (i32.const -15311)
          (local.get $20)
          (f32.const -0.18299999833106995)
          (local.get $18)
         )
        )
       )
       (else
        (call $fimport$0
         (i32.const 0)
        )
        (return
         (struct.new_default $2)
        )
       )
      )
      (unreachable)
     )
     (unreachable)
    )
    (else
     (return
      (struct.new_default $2)
     )
    )
   )
   (call_indirect $0 (type $17)
    (local.set $33
     (local.set $31
      (local.set $32
       (local.set $30
        (local.set $23
         (unreachable)
        )
       )
      )
     )
    )
    (unreachable)
    (unreachable)
    (unreachable)
    (unreachable)
    (unreachable)
    (unreachable)
   )
   (drop
    (ref.as_non_null
     (local.get $25)
    )
   )
   (loop $label8
    (if
     (i32.eqz
      (global.get $global$1)
     )
     (then
      (global.set $global$1
       (i32.const 35)
      )
      (unreachable)
     )
    )
    (global.set $global$1
     (i32.sub
      (global.get $global$1)
      (i32.const 1)
     )
    )
    (nop)
    (br $label8)
   )
   (local.set $24
    (local.set $23
     (local.set $23
      (local.set $38
       (unreachable)
      )
     )
    )
   )
  )
 )
 (func $32 (type $6)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (drop
   (call $31)
  )
  (drop
   (call $31)
  )
 )
 (func $33 (type $0) (param $0 (ref null $1)) (param $1 i64) (result (ref $0))
  (local $2 i32)
  (local $3 eqref)
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (ref.func $5)
 )
 (func $34 (type $6)
  (local $0 i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 f64)
  (local $5 v128)
  (local $6 f32)
  (local $7 i32)
  (local $8 arrayref)
  (local $9 (ref i31))
  (local $10 funcref)
  (local $11 (ref string))
  (local $scratch f64)
  (local $scratch_13 (tuple f64 i64))
  (local $scratch_14 f64)
  (local $scratch_15 (ref (exact $0)))
  (local $scratch_16 (ref (exact $2)))
  (local $scratch_17 (ref (exact $4)))
  (if
   (i32.eqz
    (global.get $global$1)
   )
   (then
    (global.set $global$1
     (i32.const 35)
    )
    (unreachable)
   )
  )
  (global.set $global$1
   (i32.sub
    (global.get $global$1)
    (i32.const 1)
   )
  )
  (local.set $9
   (ref.i31
    (i32.const 3)
   )
  )
  (drop
   (struct.new $2
    (block (result v128)
     (v128.const i32x4 0x912c0010 0x01e00800 0x5f39ff1e 0xad00bdff)
    )
    (try $__t_0 (result f32) (do (try (result f32) (do 
      (f32.const -0.8450000286102295)
     ) (delegate $__t_0))) (catch $tag$0
      (drop (pop i64))
      (f32.const -8192)
     ))
    (i32.const 123)
    (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
    (select
     (f32.const 0)
     (f32.const 0)
     (select
      (try_table (result i32)
       (i32.const 127)
      )
      (i32.const -2147483647)
      (select
       (stringview_wtf16.get_codeunit
        (string.const "\ed\a0\80")
        (block (result i32)
         (local.set $7
          (i32.const 3)
         )
         (local.get $7)
        )
       )
       (i32.load16_u offset=22
        (i64.and
         (i64.atomic.load16_u offset=22
          (i64.and
           (i64.const -2147483648)
           (i64.const 15)
          )
         )
         (i64.const 15)
        )
       )
       (i32.const 255)
      )
     )
    )
    (loop $label (result i32)
     (if
      (i32.eqz
       (global.get $global$1)
      )
      (then
       (global.set $global$1
        (i32.const 35)
       )
       (unreachable)
      )
     )
     (global.set $global$1
      (i32.sub
       (global.get $global$1)
       (i32.const 1)
      )
     )
     (call $fimport$4
      (i64.trunc_sat_f32_s
       (call $43
        (f32x4.extract_lane 0
         (call $45
          (v128.load offset=2 align=4
           (i64.and
            (i64.ctz
             (call_indirect $0 (type $8)
              (i32.const 0)
             )
            )
            (i64.const 15)
           )
          )
         )
        )
       )
      )
     )
     (br_if $label
      (i32.trunc_sat_f64_s
       (call $44
        (block (result f64)
         (local.set $scratch_14
          (tuple.extract 2 0
           (local.tee $scratch_13
            (if (type $20) (result f64 i64)
             (string.compare
              (string.const "\ed\a0\80")
              (string.const "")
             )
             (then
              (tuple.make 2
               (local.tee $4
                (block (result f64)
                 (local.set $scratch
                  (f64.const 47)
                 )
                 (local.set $1
                  (i64.const 2147483647)
                 )
                 (local.get $scratch)
                )
               )
               (local.get $1)
              )
             )
             (else
              (nop)
              (br $label)
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
     )
     (ref.test (ref i31)
      (select (result (ref i31))
       (ref.i31
        (i32.const -40)
       )
       (local.tee $9
        (ref.i31
         (i32.const -17400)
        )
       )
       (i32.const -4628963)
      )
     )
    )
   )
  )
  (drop
   (local.tee $10
    (ref.null nofunc)
   )
  )
  (drop
   (block (result (ref (exact $4)))
    (local.set $scratch_17
     (ref.func $0)
    )
    (drop
     (block (result (ref (exact $2)))
      (local.set $scratch_16
       (struct.new_default $2)
      )
      (drop
       (block (result (ref (exact $0)))
        (local.set $scratch_15
         (ref.func $33)
        )
        (local.set $7
         (i32.const 67108865)
        )
        (local.get $scratch_15)
       )
      )
      (local.get $scratch_16)
     )
    )
    (local.get $scratch_17)
   )
  )
  (drop
   (i32.add
    (local.get $7)
    (call $fimport$11
     (ref.func $31)
    )
   )
  )
  (block
   (nop)
   (return)
  )
  (local.set $11
   (local.set $11
    (unreachable)
   )
  )
 )
 (func $35 (type $11) (param $0 externref) (param $1 i64) (result (ref $0))
  (call $6
   (ref.cast (ref null $1)
    (any.convert_extern
     (local.get $0)
    )
   )
   (local.get $1)
  )
 )
 (func $36 (type $11) (param $0 externref) (param $1 i64) (result (ref $0))
  (call $12
   (ref.cast (ref null $1)
    (any.convert_extern
     (local.get $0)
    )
   )
   (local.get $1)
  )
 )
 (func $37 (type $41) (param $0 externref) (result (ref $0))
  (call $14
   (ref.cast i31ref
    (any.convert_extern
     (local.get $0)
    )
   )
  )
 )
 (func $38 (type $18) (result externref)
  (extern.convert_any
   (call $17)
  )
 )
 (func $39 (type $11) (param $0 externref) (param $1 i64) (result (ref $0))
  (call $19
   (ref.cast (ref null $1)
    (any.convert_extern
     (local.get $0)
    )
   )
   (local.get $1)
  )
 )
 (func $40 (type $42) (param $0 externref) (param $1 i64) (param $2 funcref) (param $3 f32) (result externref)
  (local.set $3
   (call $43
    (local.get $3)
   )
  )
  (extern.convert_any
   (call $26
    (ref.cast (ref null $3)
     (any.convert_extern
      (local.get $0)
     )
    )
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
  )
 )
 (func $41 (type $18) (result externref)
  (extern.convert_any
   (call $31)
  )
 )
 (func $42 (type $11) (param $0 externref) (param $1 i64) (result (ref $0))
  (call $33
   (ref.cast (ref null $1)
    (any.convert_extern
     (local.get $0)
    )
   )
   (local.get $1)
  )
 )
 (func $43 (type $43) (param $0 f32) (result f32)
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
 (func $44 (type $44) (param $0 f64) (result f64)
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
 (func $45 (type $45) (param $0 v128) (result v128)
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
 (global $__rt (mut i32) (i32.const 0))
)
