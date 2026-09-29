(module
  (tag $t (param i32 i64))
  (func (export "f") (result i32)
    (local $x (tuple i32 i64))
    (try (result i32)
      (do (throw $t (i32.const 1) (i64.const 2)))
      (catch $t
        (local.set $x (pop (tuple i32 i64)))
        (tuple.extract 2 0 (local.get $x))))))
