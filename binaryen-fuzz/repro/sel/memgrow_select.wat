(module
 (memory $0 1 10)
 (func $f (export "f") (result i32)
  (select
   (memory.grow (i32.const 1))
   (memory.grow (i32.const 1))
   (i32.const 1)
  )
 )
)
