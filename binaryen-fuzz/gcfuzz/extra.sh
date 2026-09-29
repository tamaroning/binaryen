#!/bin/bash
# extra single-pass configs over gen_gc/gen_ca modules: extra.sh WORKDIR SEED0 N
S=/tmp/claude-1000/-home-tamaron-work-superwasm/b48ceb52-e309-4a7f-abe4-cfa7367635d8/scratchpad; X=$S/bin/exwasm-gc2; W=$S/binaryen-tip/build/bin/wasm-opt
D=$1; mkdir -p $D/bad; cd $D
for s in $(seq $2 $(($2+$3-1))); do
  if [ $((s%2)) = 0 ]; then python3 ../gen_gc.py $s > m.wat; else python3 ../gen_ca.py $s > m.wat; fi
  wasm-tools parse m.wat -o m.wasm || continue
  for c in --gufa --gufa-optimizing --local-subtyping --ssa --merge-locals --reorder-locals --simplify-globals --tuple-optimization --optimize-added-constants --untee --flatten "--flatten --local-cse" "--flatten --rereloop" --licm --dfo --avoid-reinterprets --remove-unused-names --once-reduction --redundant-set-elimination "--precompute-propagate --converge" "-O3 --converge" "--flatten -O3" "--generate-stack-ir --optimize-stack-ir"; do
    $W -all $c m.wasm -o o.wasm 2>/dev/null || { echo "optfail $s $c"; continue; }
    out=$($X tv m.wasm o.wasm 2>&1); echo "$out" | grep -P '^\S+\t' | awk -v c="$c" -F'\t' '{print c"\t"$2}' >> verdicts.tsv
    if echo "$out" | grep -q counterexample; then n=$(ls bad | wc -l); mkdir bad/$n; cp m.wat m.wasm o.wasm bad/$n/; echo "$c" > bad/$n/cfg; echo "$out" > bad/$n/tv.txt; fi
  done
done
