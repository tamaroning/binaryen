(module
  (type $o (struct (field anyref)))
  (global $g (ref $o) (struct.new $o (ref.null none)))
  (type $s (struct (field (mut f64)) (field i8) (field (mut i8)) (field (mut v128)) (field (mut (ref null $s)))))
  (tag $t (param (ref null $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (unreachable))
      (catch $t
        (drop (struct.get $s 0 (pop (ref null $s))))
        (i32.const 0)))))
