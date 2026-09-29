(module
  (tag $t (param i32))
  (func (export "f") (param $p i32) (result i32)
    (local $x i32)
    (try (result i32)
      (do (throw $t (local.get $p)))
      (catch $t
        (local.set $x (i32.mul (pop i32) (i32.const -1)))
        (local.get $x)))))
