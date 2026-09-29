(module
 (func $f (export "f") (result externref)
  (if (result nullexternref)
   (i32.const 0)
   (then (ref.null noextern))
   (else (unreachable))
  )
 )
)
