(module
  (memory $0 16 16 shared)
  (func (export "f") (result f64)
    ;; address 1 is not 8-byte aligned, so the atomic load must trap
    (f64.reinterpret_i64 (i64.atomic.load (i32.const 1)))))
