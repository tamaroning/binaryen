# ufuzz

The module-mode fuzzing campaign behind the paper *Specification-Derived Translation Validation for WebAssembly*. It builds random WebAssembly modules, runs Binaryen's `wasm-opt` on them with random pass configurations, and asks the translation validator (`exwasm tv`, from the `exwasm` repository) whether each function that `wasm-opt` changed still refines its original. A counterexample is a miscompilation candidate.

ufuzz replaces only the oracle of ordinary differential fuzzing. Its inputs are the same kind as Binaryen's own fuzzer's (random modules, random pass lists); what decides a verdict is a refinement check against the specification, not a comparison of concrete runs.

## One iteration

A worker repeats the following until it is stopped (`drive.py`, `Worker.module_once`).

1. **Build a module** from one of four sources, drawn by `source_weights`:
   - `gen`: the typed generator (`gen.py`, `table.py`, `rows_*.py`, `decls.py`), then one to four mutations (`mutations`).
   - `mix`: a generated module with one to three subtrees spliced in from the subtree pool (seeds and recently generated modules), then mutated.
   - `seed`: a harvested seed module (`seeds.py`), mutated.
   - `raw`: a module that is not parsed at all (`wasm-opt -ttf`, wasm-smith, or compiler output), checked only by oracle B.
2. **Emit and self-validate.** The module is validated against itself with `exwasm tv`. Only functions that `exwasm` proves equivalent to themselves (`equivalent`, or `bounded` within its unrolling bound) are compared after optimization; the others stay in the module, because the compared functions may call them, and go through oracle B in their module.
3. **Optimize.** Two or three configurations (`configs_per_module`) are drawn (see [Pass configurations](#pass-configurations)) and `wasm-opt` is run once per configuration. A crash or an invalid output is recorded.
4. **Compare (oracle A).** If the output differs from the input, every changed function is validated with `exwasm tv input output`. Identical outputs of one module are validated once.
5. **Classify and save.** A counterexample is classified, checked on V8 and with `wasm-opt --fuzz-exec`, and copied to `bad/` at once.

The result of every function and configuration is one line of `results.jsonl`.

## Module generation

**Type-directed generator** (`gen.py`). A function is built top-down from a table of instruction templates (`table.py`; more rows in `rows_more.py`, `rows_simd.py`, `rows_shapes.py` and `rows_cov.py`). A row is `Row(name, feat, weight, out, gen)`: a pattern name, a feature tag, a weight, the type it produces, and a function that builds the node given the wanted type. Operands are always built through `g.expr(type, depth)`, so a module is type-correct by construction and the mutators can rely on the type of every node. The generator covers integers, floats, memory (32 and 64 bit, several memories, `memory.grow`), globals, control flow, calls, GC (structs, arrays, `i31`, casts), bulk memory, tables, exceptions, SIMD and relaxed SIMD, and optionally atomics.

**Row families.**
- `table.py`, the base table: integer and float operators, loads and stores, control flow, calls, GC and casts, bulk memory, tables, data segments, exceptions.
- `rows_more.py`: calls between generated functions, `call_ref` and tail calls, control flow in value position, loops with results, multi-value, more GC, atomics.
- `rows_simd.py`: one row per lane-wise or relaxed instruction, `v128` loads and stores. A `v128` never crosses a function boundary, so functions show vectors through scalar results, memory and globals.
- `rows_shapes.py`: shapes of the Binaryen bugs found so far (one expression with a write effect used twice, a loop that may not return next to a trapping operation or a call, allocations inside a loop, `struct.new` in table initializers, NaN chains observed through `reinterpret`, unaligned accesses and bulk operations near the end of memory).
- `rows_cov.py`: idioms and layouts that Binaryen's passes match but that the other rows rarely produce. They were chosen from line coverage of `src/passes/*.cpp`.

**Per-module choices** (`gen.pick_flags`, `config`): a module may be *wide* (it may contain rows that `exwasm` rejects at module level, so it only goes through oracle B), *noeh* (no exception handling), and *focused* on one row family (`focus_rate`, default 0.35), whose rows are then boosted. A focus also biases the pass configuration towards the passes that rewrite that family (`SHAPE_CFG`).

**Declarations** (`decls.py`, `decl_rate`). Besides what functions do, the module varies what it declares: table initializers and element segments that mix functions and nulls, active and passive data segments with runs of zeros, a larger first memory, and guard-shaped helper functions called from several places.

**Adaptive weights.** Row weights are scaled by how often a row's functions are unsupported by `exwasm` (down to 0.3) and how often passes change them (up to 1.5). Mutator weights are scaled by how often a mutator's functions are changed by a pass and how often the mutation makes the module invalid. Both are computed from the worker's own statistics.

## Seeds

`seeds.py` harvests seed functions into `seeds/mods/<source>/*.wat` and `seeds/pool/<source>.jsonl`. Sources: Binaryen's `test/lit` and `test/passes`, the official spec tests, compiler output (Rosetta, JetStream-style benchmarks and others), `wasm-smith`, and `wasm-opt -ttf`. Every module is printed with Binaryen, parsed, restricted to the subset `exwasm` handles, normalized (every function, memory and global exported, calls to defined functions turned into calls to imports of the same signature), and kept only if `exwasm` proves it equivalent to itself. The subtree pool (`pool.py`) holds closed, typed subtrees with the locals, globals, memories, callees and types they need, so a subtree can be renamed into another module. A worker also keeps a rolling pool of up to 3,000 subtrees from the modules it generated.

The campaigns that produced the paper's last data (`config.decl.json` and its descendants) set the weight of `seed` and `raw` to 0, so those runs used only `gen` and `mix`.

## Mutators

`mut.py`. `mutate(r, m, pool, n, weights)` applies `n` mutators to random functions. Every mutator works on typed nodes and replaces an expression by one of the same type or inserts a statement where the enclosing list allows it; a mutated module that no longer validates is discarded. The first group aims at the assumptions an optimizer's rewrite makes:

| Mutator | Effect |
|---|---|
| `dup_arms` | copy an expression into both operands of a binary operator, a `select` or an `if` (sometimes with a constant changed by one), so two equal-looking operands may have effects |
| `boundary` | replace constants by boundary values |
| `trap_arm` | make one arm trap (`unreachable`), insert a conditional trap, a division, or `ref.as_non_null` |
| `dead_code` | insert code after a branch or a return, or under an `if 0` |
| `move_stmt` | swap two neighboring statements |
| `wrap_block` | wrap a value or a statement in a `block`, `loop`, `if` or `br_if` frame |
| `op_swap` | replace an operator by another with the same signature |
| `swap_operands` | swap the two operands of a binary operator, `select`, `ref.eq` or a store |
| `splice`, `splice_pool` | replace a closed subtree by one of the same type from another function of the module (`splice`) or from the subtree pool (`splice_pool`) |
| `gen_stmt`, `dup_stmt` | insert a freshly generated statement, or a copy of an existing one |
| `lift_local` | move an expression into a fresh local (`block (local.set v e) (local.get v)`) |
| `memarg` | change an offset or alignment of a load or store to an edge value |
| `sign_variant` | swap a signed operator for its unsigned counterpart, or the reverse |
| `float_const`, `br_insert`, `cond_flip`, `select_if`, `shrink`, `roundtrip` | change a float or vector constant; insert a `br_if` to an enclosing block; swap the arms of an `if` and negate its condition; turn a `select` into an `if` or the reverse; replace a subtree by a leaf or delete a statement; pass a value through a no-op conversion chain (wrap/extend, reinterpret, `x & -1`, `x + 0`) |
| `tee_other`, `alias`, `wrap_cast`, `interleave`, `alloc_branch` | GC and local flows: tee a local into another of the same type, copy one reference local to another, wrap a reference in a cast or a branch on a cast, store a struct field to memory next to a `struct.set`, branch between two allocations |
| `cov_sext`, `cov_const_chain`, `cov_cmp_edge`, `cov_alloc_flow`, `cov_fold`, `cov_br_run`, `cov_set_chain` | rewrite towards idioms that passes look for: sign extension spelled with shifts, chains of constant operations, combined comparisons against 0, -1, min and max, references passed through blocks and casts, a shared tail in both arms of an `if`, a run of `br_if`s on one local, `local.set` chains |

## Pass configurations

`drive.pick_config` draws a `wasm-opt` command line per optimization run:

| Kind | Share | What |
|---|---|---|
| `single` | 40% | one pass out of about 80, including passes that no `-O` level runs (`SINGLE`) |
| `seq` | 28% | two to five passes from `SEQ_POOL`, sometimes with `--generate-global-effects` |
| `closed` | 11% | `--closed-world` with passes that need it, or an `-O` level |
| `olevel` | 21% | `-O1` to `-O4`, `-Os`, `-Oz`, `--converge`, repeated or combined levels |

In 35% of the single and sequence draws, `--optimize-level` and `--shrink-level` are drawn as well. Passes that need a flag or a preceding pass get it (`PREREQ`, `NEEDS_CLOSED`). `extra_args` in the config adds options with a given probability (for example `--partial-inlining-ifs`, `--traps-never-happen`). With probability `shape_bias` a focused module draws from the configurations that suit its focus (`SHAPE_CFG`).

Passes are not drawn uniformly. Passes that the rule-level work found fruitful (`FRUITFUL`) get weight `fruitful_weight` (2.5); every pass is scaled between 0.6 and 1.8 by how often it has changed functions so far, so passes that do nothing on these modules are sampled less but never dropped; `pass_boost` multiplies selected passes.

## Oracles and findings

**Oracle A** is `exwasm tv`. Its verdicts are `equivalent`, `bounded`, `counterexample`, `unsupported` and `unknown`; a crash or timeout of the validator is recorded as `error` (and a panic is saved as `tverr`, for the validator's side). A counterexample is classified:

| Kind | Meaning |
|---|---|
| `cex` | a bug candidate |
| `cexsus` (suspect) | the configuration uses a flag that lets a pass assume something about the program (`--closed-world`, `--traps-never-happen`, `--low-memory-unused`, ...), runs a lowering or module-level pass that changes what is compared (`LOWERING`), or a pass that uses facts about the whole module (`MODULE_FACTS`); a per-function comparison cannot see those facts |
| `cexknown` | the documented behavior of a pass (`KNOWN_CEX`), e.g. `alignment-lowering` writing part of a trapping store |

Every counterexample is also run on V8 (`v8diff.js`) and on Binaryen's interpreter (`wasm-opt --fuzz-exec`, on a copy whose imports are replaced by fixed functions; `fuzz_exec_check`: `detects`, `misses`, `timeout`, `oom`, `unrunnable`, `error`). The counterexamples that `--fuzz-exec` misses are the ones the paper is about.

**Oracle B** is the ordinary one: a `wasm-opt` crash (assertion, signal, timeout), an invalid output (`wasm-tools validate`), and a differential on V8. It runs on `raw` modules, on the whole module whenever the self-validation dropped functions, and (with probability `v8_rate`) on the modules oracle A covered, as a cross-check of the validator. `v8diff.js` instantiates both modules with the same deterministic import stubs, calls every exported function that JavaScript can call with the same argument vectors, and compares results, traps, exceptions, the import-call trace, and exported memories and globals; every NaN equals every other NaN.

**Output** (`WORKDIR/`):
- `results.jsonl`: one line per function and configuration (oracle A: module id, function, source, mutators applied, rows used, features, configuration, verdict, time), and one per module and configuration for oracle B.
- `bad/<kind>-<worker>-<n>/`: `m.wat`, `m.wasm`, `o.wasm`, `out.txt` and `meta.json` (configuration, expanded pass list, suspect or known reason, counterexample functions and their rows, V8 and `--fuzz-exec` results, focus).
- `stats.json`: counters, rewritten at least every four minutes (verdicts, per-pass and per-configuration change rates, per-mutator and per-row counts, reasons for unsupported functions).

## Running

```sh
./run.sh 4          # four workers, in the background: runs/w1 .. runs/w4
./status.sh         # who runs, and the campaign summary
python3 aggregate.py [--runs runs] [--json OUT]
./stop.sh           # touches STOP and terminates the workers and their children
python3 drive.py WORKDIR WORKER_ID SEED0 [SECONDS]     # one worker, in the foreground
```

A worker needs `wasm-opt` (Binaryen), `wasm-tools`, `node` (a version with the WebAssembly flags that `v8diff.js` uses), a built `exwasm` and an IL dump from the `exwasm` repository. They are set in a JSON config; `UFUZZ_CONFIG` names it (default `config.json`), and it is re-read before every module, so a change of binary or timeout takes effect without a restart. `cfg.py` lists every key with its default. The important ones:

| Key | Meaning |
|---|---|
| `exwasm`, `il`, `wasm_opt`, `node` | the tools; `il` is e.g. `exwasm/il/wasm-3.0-ext.sexp` |
| `smt_timeout_ms`, `tv_timeout_s`, `mem_gb` | limits of one `exwasm tv` call |
| `configs_per_module`, `mutations` | `[low, high]` ranges |
| `source_weights` | shares of `gen`, `mix`, `seed`, `raw` |
| `decl_rate`, `wide_rate`, `noeh_rate`, `focus_rate`, `focus_tags` | generator choices |
| `features_add`, `features_remove` | row tags to switch on or off (e.g. `["atomic"]`) |
| `fruitful_weight`, `shape_bias`, `pass_boost`, `only_passes`, `extra_args` | the pass sampler (`only_passes`: draw only from the listed passes) |
| `v8_rate`, `fe_check`, `fe_timeout_s`, `save_crashes` | cross-checks and what to save |

The configs in this directory are the ones the campaigns used: `config.decl.json` (the later campaigns; it varies module declarations and adds `extra_args`), `config.np.json` (a list of about 50 passes in `only_passes`, so that a run draws a single pass or a sequence of two to four of them from that list only, with `wide_rate` 0.4 and `focus_rate` 0.95 on the newer GC, table and exception features) and `config.w3.json` (the same module settings, with `pass_boost` raising the weight of selected passes instead). The first campaigns ran with a `config.json` that is not kept; their settings are the defaults in `cfg.py`.

## Files

| File | Role |
|---|---|
| `drive.py` | the worker: module sources, self-validation, pass configurations, both oracles, classification, statistics |
| `gen.py`, `table.py`, `rows_more.py`, `rows_simd.py`, `rows_shapes.py`, `rows_cov.py`, `decls.py` | the generator and its instruction table |
| `mut.py` | the mutators |
| `wmod.py` | the module model: s-expression reader, `.wat` parser and emitter, and a typer for the subset `exwasm` handles |
| `pool.py`, `seeds.py` | the subtree pool and the harvesting of seeds |
| `cfg.py` | configuration keys, defaults, and the `wasm-opt` feature flags a module needs |
| `v8diff.js` | the V8 differential |
| `aggregate.py`, `status.sh` | merge `stats.json` of all workers and print the summary |
| `run.sh`, `stop.sh` | start and stop workers |
| `test_gen.py`, `test_mut.py`, `test_classify.py` | smoke tests of the generator, the mutators, and the classification and sampler |

## Notes

- `cfg.py`, `drive.load_seeds` and `seeds.py` contain absolute paths of the machine the campaigns ran on (scratch directories, benchmark and test checkouts). Set the keys of the config, and adapt the source directories in `seeds.py`, before running elsewhere.
- Runs are not reproducible bit for bit: the mutators and the pass sampler also depend on the statistics a worker has gathered so far.
