(module
  (type $s (struct (field i32)))
  (import "env" "side" (func $side (result i32)))
  (import "env" "side2" (func $side2 (param i32) (result i32)))
  (global $a (ref $s) (struct.new $s (i32.const 1))) (global $b (ref $s) (struct.new $s (i32.const 2)))
  (tag $t (param (ref $s)))
  (func (export "f") (result i32)
    (local $x i32)
    (try (result i32)
      (do (throw $t (global.get $a)))
      (catch $t
        (call $side2 (struct.get $s 0 (pop (ref $s))))))))
