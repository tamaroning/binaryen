(module
 (rec
  (type $4 (descriptor $7) (struct (field (mut f32)) (field (mut (ref null $8))) (field f32)))
  (type $21 (func (param i64 i64 i32 f32 (ref null $8) f64 (ref $4) f64) (result i64)))
  (type $7 (describes $4) (struct (field (ref $6)) (field (mut (ref $3))) (field (ref $1))))
  (type $8 (sub (array f64)))
  (type $13 (func (result f32)))
  (type $1 (func (result f32 f64 (ref eq))))
  (type $3 (sub (func (result i32))))
  (type $6 (func (param funcref (ref $6))))
  (type $15 (func (param (ref $4))))
 )
 (elem declare func $5 $6 $7)
 (tag $tag$0 (type $15) (param (ref $4)))
 (func $5 (type $6) (param $0 funcref) (param $1 (ref $6))
  (nop)
 )
 (func $6 (type $3) (result i32)
  (unreachable)
 )
 (func $7 (type $1) (result f32 f64 (ref eq))
  (unreachable)
 )
 (@binaryen.js.called)
 (func $10 (type $13) (result f32)
  (unreachable)
 )
 (func $13 (type $3) (result i32)
  (local $0 (ref $4))
  (local $3 (ref nofunc))
  (loop $label1
   (drop
    (try $label7 (result (ref $4))
     (do
      (try (result (ref $4))
       (do
        (select (result (ref $4))
         (local.tee $0
          (struct.new_default_desc $4
           (struct.new $7
            (ref.func $5)
            (ref.func $6)
            (ref.func $7)
           )
          )
         )
         (block $block1 (result (ref $4))
          (unreachable)
          (if (result (ref (exact $4)))
           (block (result i32)
            (drop
             (try_table (result i32) (catch $tag$0 $block1) (catch $tag$0 $block1) (catch_all $label1)
              (i32.const 0)
             )
            )
            (i32.const 0)
           )
           (then
            (unreachable)
           )
           (else
            (struct.new_desc $4
             (f32.const 0)
             (array.new $8
              (f64.const 0)
              (i32.const 0)
             )
             (f32.const 0)
             (ref.as_non_null
              (ref.null none)
             )
            )
           )
          )
         )
         (ref.eq
          (struct.get $4 1
           (local.tee $0
            (struct.new_default_desc $4
             (struct.new $7
              (local.tee $3
               (ref.as_non_null
                (ref.null nofunc)
               )
              )
              (local.get $3)
              (local.get $3)
             )
            )
           )
          )
          (ref.i31
           (i32.const 0)
          )
         )
        )
       )
       (delegate $label7)
      )
     )
     (catch $tag$0
      (nop)
      (unreachable)
     )
     (catch_all
      (unreachable)
      (unreachable)
     )
    )
   )
  )
  (i32.const 0)
 )
 (func $14 (type $21) (param $0 i64) (param $1 i64) (param $2 i32) (param $3 f32) (param $4 (ref null $8)) (param $5 f64) (param $6 (ref $4)) (param $7 f64) (result i64)
  (unreachable)
 )
)
