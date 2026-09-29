(module
  (type $sig (func))
  (func $g)
  (func (export "f") (result (ref null $sig))
    (local $s (ref null $sig))
    (local.set $s
      (tuple.extract 2 1
        (tuple.make 2 (i32.const 0) (ref.null nofunc))))
    (local.get $s)))
