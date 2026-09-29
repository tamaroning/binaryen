(module
 (tag $tag$0 (param i32))
 (func $0
  (local $0 i32)
  (local $1 i32)
  (try
   (do
    (nop)
   )
   (catch $tag$0
    (local.set $0
     (local.tee $1
      (if (result i32)
       (pop i32)
       (then (i32.const 0))
       (else (local.get $1))
      )
     )
    )
   )
  )
 )
)
