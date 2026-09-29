(module
  (tag $t (param i32))
  (func $a
    (try (do (nop)) (catch $t
      (drop (i32.add (i32.mul (pop i32) (i32.const 3)) (i32.const 7))))))
  (func $b
    (try (do (nop)) (catch $t
      (drop (i32.add (i32.mul (pop i32) (i32.const 3)) (i32.const 7)))))))
