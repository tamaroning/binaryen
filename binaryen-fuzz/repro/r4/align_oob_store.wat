(module
 (memory (export "mem") 1 1)
 (func (export "store") (param $p i32)
  (i32.store align=1 (local.get $p) (i32.const 0x01020304)))
 (func (export "peek") (result i32)
  (i32.load (i32.const 65532))))
