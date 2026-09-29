(module
 (memory $m0 0)
 (export "m0" (memory $m0))
 (func $f (export "f") (param $c i32) (result i32)
  ;; traps while the memory is empty, so a fresh instance never reaches the select
  (i32.store8 (i32.const 33) (i32.const 0))
  (select
   (memory.grow (i32.const 1))
   (memory.grow (i32.const 1))
   (local.get $c))))
