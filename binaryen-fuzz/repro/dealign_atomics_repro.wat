(module
  (memory $m 1 1 shared)
  (func (export "f") (result i32)
    (i32.atomic.load (i32.const 0)))
  (func (export "g")
    (i32.atomic.store (i32.const 0) (i32.const 7)))
)
