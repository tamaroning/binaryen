(module
  (type $o (struct (field anyref)))
  (global $g (ref $o) (struct.new $o (ref.null none)))
  (rec
    (type $s (struct (field (mut i32))))
    (type $e (struct (field i64))))
  (global $ge (export "ge") (ref $e) (struct.new $e (i64.const 1)))
  (func (export "f") (param $x (ref null $s)) (result i32)
    (struct.get $s 0 (local.get $x))))
