(module
 (func (export "f") (param $x i32) (result i32)
  (local $i i32)
  ;; count $i up to 0xfffffffe
  (loop $l
   (br_if $l
    (i32.lt_u
     (local.tee $i (i32.add (local.get $i) (i32.const 1)))
     (i32.const -2))))
  ;; $i becomes 0xffffffff, so $x >u $i is always false
  (if (i32.gt_u (local.get $x) (local.tee $i (i32.add (local.get $i) (i32.const 1))))
   (then
    (loop $inf (br $inf))))
  (local.get $i)))
