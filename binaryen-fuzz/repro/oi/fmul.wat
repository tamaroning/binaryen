(module
  (tag $t (param f64))
  (func (export "f") (param $p f64) (result f64)
    (local $x f64)
    (try (result f64)
      (do (throw $t (local.get $p)))
      (catch $t
        (local.set $x (f64.mul (pop f64) (f64.const -1)))
        (local.get $x)))))
