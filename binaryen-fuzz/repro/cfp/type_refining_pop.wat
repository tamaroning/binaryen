(module
  (type $o (struct (field anyref)))
  (global $g (ref $o) (struct.new $o (ref.null none)))
  (rec
    (type $s (struct (field (mut i32))))
    (type $e (struct (field i64))))
  (global $ge (export "ge") (ref $e) (struct.new $e (i64.const 1)))
  (tag $t (param (ref null $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (unreachable))
      (catch $t
        (drop (struct.get $s 0 (pop (ref null $s))))
        (i32.const 0)))))
