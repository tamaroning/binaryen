(module
  (type $s (struct (field i32)))
  (func $mk (result (ref $s)) (struct.new $s (i32.const 42)))
  (tag $t (param (ref $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (throw $t (call $mk)))
      (catch $t
        (drop (struct.get $s 0 (pop (ref $s)))) (i32.const 0)))))
