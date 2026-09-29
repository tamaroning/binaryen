(module
 (type $a (array (mut i32)))
 (memory 1 10)
 (func (export "f") (result i32)
  (array.get $a
   (array.new_fixed $a 2
    (memory.grow (i32.const 1))
    (memory.grow (i32.const 1)))
   (i32.const 1))))
