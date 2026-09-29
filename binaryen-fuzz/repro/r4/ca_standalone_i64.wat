(module (func (param $n i64) (local $i i64)
  (if (i64.le_s (local.get $n) (i64.const 9223372036854775806)) (then (return)))
  (loop $l (local.set $i (i64.add (local.get $i) (i64.const 1))) (br_if $l (i64.le_s (local.get $i) (local.get $n))))))