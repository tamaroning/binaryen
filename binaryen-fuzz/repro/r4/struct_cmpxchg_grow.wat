(module
 (type $s (struct (field (mut i32))))
 (memory 1 10)
 (func (export "f") (result i32)
  (local $r (ref $s))
  (local.set $r (struct.new $s (i32.const 1)))
  ;; expected = 1 (first grow), replacement = 2 (second grow): field becomes 2
  (drop (struct.atomic.rmw.cmpxchg $s 0 (local.get $r)
    (memory.grow (i32.const 1))
    (memory.grow (i32.const 1))))
  (struct.get $s 0 (local.get $r))))
