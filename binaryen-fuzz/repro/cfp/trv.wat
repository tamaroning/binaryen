(module
  (type $s (struct (field (mut structref))))
  (tag $t (param (ref null $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (unreachable))
      (catch $t
        (drop (struct.get $s 0 (pop (ref null $s))))
        (i32.const 0)))))
