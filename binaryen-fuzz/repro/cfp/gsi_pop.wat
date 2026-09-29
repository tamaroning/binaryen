(module
  (type $s (struct (field i32)))
  (global $a (ref $s) (struct.new $s (i32.const 1)))
  (global $b (ref $s) (struct.new $s (i32.const 2)))
  (tag $t (param (ref $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (throw $t (global.get $a)))
      (catch $t
        (drop (struct.get $s 0 (pop (ref $s))))
        (i32.const 0)))))
