(module
  (global $g (mut i32) (i32.const 0))
  (func (export "f") (result stringref)
    (loop $l (result stringref)
      (br_if $l (global.get $g))
      (ref.null noextern))))
