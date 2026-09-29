(module
 (memory $0 1 1 shared)
 (func $f (export "f") (result i32)
  (i32.wrap_i64
   (select
    (i64.atomic.rmw8.add_u (i32.const 0) (i64.const 1))
    (i64.atomic.rmw8.add_u (i32.const 0) (i64.const 1))
    (i32.const 1)
   )
  )
 )
)
