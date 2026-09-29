(module
 (table $t 1 10 funcref)
 (func (export "f") (result i32)
  ;; table size is 1: the first grow returns 1, the second returns 2
  (select
   (table.grow $t (ref.null func) (i32.const 1))
   (table.grow $t (ref.null func) (i32.const 1))
   (i32.const 1))))
