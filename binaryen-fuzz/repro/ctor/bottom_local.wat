(module
  (func (export "f") (result stringref)
    (local $s stringref)
    (local $n nullexternref)
    (local.set $s (local.get $n))
    (local.get $s)))
