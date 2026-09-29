(module
  (type $s (sub (struct (field (mut i32)))))
  (type $sub (sub $s (struct (field (mut i32))))) (func $mk (result (ref $s)) (struct.new $sub (i32.const 1)))
  (tag $t (param (ref null $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (throw $t (call $mk)))
      (catch $t
        (drop (struct.get $s 0 (pop (ref null $s))))
        (i32.const 0)))))
