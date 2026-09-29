(module
 (type $0 (func (param funcref i32)))
 (type $1 (func (result v128)))
 (type $2 (func))
 (import "fuzzing-support" "call-ref" (func $fimport$0 (type $0) (param funcref i32)))
 (global $global$0 (mut i32) (i32.const 1))
 (elem declare func $0)
 (export "func_30_invoker" (func $1))
 (func $0 (type $1) (result v128)
  (if
   (i32.eqz
    (global.get $global$0)
   )
   (then
    (unreachable)
   )
  )
  (global.set $global$0
   (i32.const 0)
  )
  (call $fimport$0
   (ref.func $0)
   (i32.const 0)
  )
  (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
 )
 (func $1 (type $2)
  (drop
   (call $0)
  )
 )
)
