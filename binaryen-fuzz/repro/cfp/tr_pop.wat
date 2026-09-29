(module
  ;; $o has a field that can be refined (anyref -> nullref), so TypeRefining
  ;; does its rewriting walk over every function
  (type $o (struct (field anyref)))
  (global $g (ref $o) (struct.new $o (ref.null none)))
  ;; $s is never allocated, so its field is "never written"
  (type $s (struct (field (mut i32))))
  (tag $t (param (ref null $s)))
  (func (export "f") (result i32)
    (try (result i32)
      (do (unreachable))
      (catch $t
        (drop (struct.get $s 0 (pop (ref null $s))))
        (i32.const 0)))))
