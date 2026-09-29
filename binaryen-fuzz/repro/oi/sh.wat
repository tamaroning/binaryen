(module
  (tag $t (param i32))
  (func (export "f") (param $p i32) (result i32)
    (local $x i32)
    (try (result i32)
      (do (unreachable))
      (catch $t
        (local.set $x (i32.and (i32.or (pop i32) (local.get $p)) (i32.const 0)))
        (i32.const 0)))))
