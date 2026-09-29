(module
  (func (export "f") (result stringref)
    (local $s stringref)
    (local.set $s
      (tuple.extract 2 1
        (tuple.make 2 (i32.const 0) (ref.null noextern))))
    (local.get $s)))
