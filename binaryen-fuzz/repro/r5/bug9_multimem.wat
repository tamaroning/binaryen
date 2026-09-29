(module
 (memory $m0 i64 0)
 (memory $m1 0)
 (export "m0" (memory $m0))
 (export "m1" (memory $m1))
 (func $f (export "f")
  ;; the address comes from a select over two grows of $m1; $m0 starts empty
  (i32.store8 $m0 offset=8
   (i64.extend_i32_s
    (select (memory.grow $m1 (i32.const 1)) (memory.grow $m1 (i32.const 1)) (i32.const 1)))
   (i32.const -8))))
