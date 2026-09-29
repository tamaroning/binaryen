(module
  (type $s (struct))
  (func $target (param f32 eqref) (result f64)
    (unreachable))
  (func $caller
    ;; two occurrences of the same instruction sequence, whose stack operands
    ;; have different (but both eq-compatible) reference types
    (drop (call $target (f32.const 0) (ref.i31 (i32.const 0))))
    (drop (call $target (f32.const 0) (struct.new_default $s)))
  )
)
