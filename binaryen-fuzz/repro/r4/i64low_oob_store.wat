(module
 (memory (export "mem") 1 1)
 (func (export "store") (param $p i32)
  (i64.store (local.get $p) (i64.const 0x1122334455667788)))
 (func (export "peek") (result i32)
  (i32.load (i32.const 65532))))
