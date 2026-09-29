(module
  (type $p (struct (field (mut i32))))
  (type $o (struct (field anyref)))
  ;; $p is public (imported global of that type) and never created inside
  (import "env" "p" (global $ip (ref $p)))
  ;; something refinable so the pass does its rewrite walk
  (global $g (ref $o) (struct.new $o (ref.null none)))
  (func (export "f") (result i32)
    (struct.get $p 0 (global.get $ip))))
