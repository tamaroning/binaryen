;; RUN: wasm-opt %s --enable-multimemory --snapify --pass-arg=policy@always -all -o %t.wasm

;; Regression test: Snapify instruments non-void functions that fall through to
;; the end. The inserted exit hook must not introduce a non-final value-typed
;; expression in a block (e.g. via `local.tee`).

(module
  (memory 1)
  (func $f (export "f") (result i32)
    (i32.const 42)
  )
)

