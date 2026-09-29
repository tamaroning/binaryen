(module
  (tag $t (param i64))
  (func $f
    (local $a i64)
    (local $b i64)
    (try
      (do (nop))
      (catch $t
        ;; the catch body's dangling pop, consumed by a tee
        (local.set $a (local.tee $b (pop i64)))))))
