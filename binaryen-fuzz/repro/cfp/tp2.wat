(module
 (type $0 (func (param i32 i64)))
 (type $1 (func (result i32)))
 (tag $tag$0 (type $0) (param i32 i64))
 (export "f" (func $0))
 (func $0 (type $1) (result i32)
  (local $0 i32)
  (local $1 i64)
  (local $scratch (tuple i32 i64))
  (local $scratch_3 i32)
  (local $4 (tuple i32 i64))
  (try (result i32)
   (do
    (throw $tag$0
     (i32.const 1)
     (i64.const 2)
    )
   )
   (catch $tag$0
    (local.set $4
     (pop (tuple i32 i64))
    )
    (block (result i32)
     (local.set $0
      (block (result i32)
       (local.set $scratch_3
        (tuple.extract 2 0
         (local.tee $scratch
          (local.get $4)
         )
        )
       )
       (local.set $1
        (tuple.extract 2 1
         (local.get $scratch)
        )
       )
       (local.get $scratch_3)
      )
     )
     (local.get $0)
    )
   )
  )
 )
)
