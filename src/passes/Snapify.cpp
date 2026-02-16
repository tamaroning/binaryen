// Snapify pass
//
// This pass transforms a WebAssembly module so that its execution
// can be checkpointed and later restored.
//
// A typical pipeline is:
//
//   $(WASM_OPT) $wasm -O1 --enable-multimemory --snapify
//     --pass-arg=policy@always -o $output
//   $(WASM_OPT) $output -O1 --asyncify
//     --pass-arg=asyncify-memory@snapify_memory
//     --enable-multimemory -o $output
//
// ## Usage
//
// The runtime must export a function with the following signature:
//
//   (func (export "snapify.should_checkpoint")
//         (param i32)  ;; reason
//         (result i32) ;; 0 = continue, non‑zero = checkpoint
//   )
//
// Inside that function, the embedder decides whether a checkpoint
// should be taken (for example, based on a POSIX signal).
//
// To restore from a previously saved checkpoint, the runtime must:
//
//   1. Load the saved `memory` (main memory) and `snapify_memory`
//      into a fresh instance of the module.
//   2. Call `snapify_start_restore`.
//   3. Call `snapify_restore_globals`.
//   4. Call `_start` to resume execution.
//
// For normal execution without restore, the embedder simply calls `_start`.
//
// ## Limitations
//
// - The input module must contain exactly one memory (the main memory).
//   Snapify will add an additional memory named `snapify_memory` that is
//   used to store Asyncify metadata and global state.
// - Currently only mutable globals are checkpointed and restored.
// - Table checkpoint/restore is not yet implemented (TODO).
//
// In principle, tables could be made checkpointable by inserting a
// `global.set` immediately before each `table.set`, but this would
// introduce additional overhead.
//
// ## How it works
//
// Snapify inserts *migration points* at:
//   - the beginning of each function body, and
//   - the beginning of each loop body (depending on the policy).
//
// At a migration point, if the runtime requests a checkpoint,
// the pass:
//
//   - Initializes the Asyncify metadata in `snapify_memory`,
//   - Calls `asyncify.start_unwind` to unwind the stack and terminate,
//   - Leaves the module in a state where the host can save both
//     `memory` and `snapify_memory`.
//
// When execution is later restored, `snapify_start_restore` calls
// `asyncify.start_rewind`, and the first migration point encountered in
// the rewound control flow calls `asyncify.stop_rewind` to resume
// normal execution.
//
// ## Migration policy
//
// The migration policy is configured via:
//
//   --pass-arg=policy@always   (default)
//   --pass-arg=policy@kafu
//
// - `always`:
//     Insert migration points at the beginning of every function and loop,
//     and insert an additional migration point on every function exit
//     (both explicit `return` and fall‑through).
//
// - `kafu`:
//     Insert migration points only for functions that are marked as Kafu
//     destination functions. Kafu metadata is discovered via custom
//     sections whose names start with `.kafu_dest.`.
//
// In both modes, the runtime receives an `InterruptReason` value at each
// migration point to distinguish between function entry and exit.
//
// ## Linear memories
//
// - `memory` (exported as `"memory"`):
//     The main linear memory used for normal execution.
// - `snapify_memory` (added by this pass and exported under the same name):
//     A secondary memory used to store Asyncify metadata and the
//     checkpointed values of mutable globals (and, in the future, tables).
//
// ## Imported functions
//
// Snapify expects the following imports to exist after the pass runs:
//
// - From module `"asyncify"`:
//     - `start_unwind(i32 metadataAddress)`
//     - `stop_unwind()`
//     - `start_rewind(i32 metadataAddress)`
//     - `stop_rewind()`
//     - `get_state() -> i32`
//     - `set_state(i32 state)`
//
// - From module `"snapify"`:
//     - `should_checkpoint(i32 reason) -> i32`
//       (implemented by the embedder)
//
// ## Synthesized functions
//
// Snapify synthesizes and exports the following helper functions:
//
// - `snapify_migration_point(i32 reason)`:
//     Called at each migration point. If `should_checkpoint` returns non‑zero,
//     it initializes the Asyncify metadata in `snapify_memory` and calls
//     `asyncify.start_unwind`. If Asyncify is in the `Rewinding` state,
//     it calls `asyncify.stop_rewind` instead.
//
// - `snapify_start_restore()`:
//     Starts rewinding by calling `asyncify.start_rewind` with the
//     Asyncify metadata address.
//
// - `snapify_checkpoint_globals()`:
//     Iterates over all mutable globals in the module and stores their
//     values into `snapify_memory` in the reserved global area.
//
// - `snapify_restore_globals()`:
//     Restores the values of all mutable globals from `snapify_memory`.
//
// ## Checkpoint procedure
//
// 1. Call `_start` to begin execution.
// 2. When `snapify.should_checkpoint` returns non‑zero at a migration point,
//    Snapify initializes the Asyncify metadata, calls
//    `asyncify.start_unwind`, and unwinds the stack.
// 3. Call `snapify_checkpoint_globals`.
// 4. The host saves the contents of `memory` and `snapify_memory`.
//
// ## Restore procedure
//
// 1. The host reloads the previously saved contents of `memory` and
//    `snapify_memory` into a new instance of the module.
// 2. Call `snapify_start_restore` to begin rewinding.
// 3. Call `snapify_restore_globals` to restore all mutable globals.
// 4. Call `_start` to resume execution from the last checkpoint.

#include "ir/literal-utils.h"
#include "ir/names.h"
#include "wasm.h"
#include <cassert>
#include <memory>
#include <unordered_map>
#include <pass.h>
#include <wasm-builder.h>
#include <wasm-traversal.h>

namespace wasm {

static const Name SNAPIFY = "snapify";
static const Name SHOULD_CHECKPOINT = "should_checkpoint";
static const Name SNAPIFY_START_RESTORE = "snapify_start_restore";
static const Name SNAPIFY_MIGRATION_POINT = "snapify_migration_point";
// static const Name SNAPIFY_SHOULD_CHECKPOINT = "snapify_should_checkpoint";
// static const Name SNAPIFY_SHOULD_RESTORE = "snapify_should_restore";
static const Name SNAPIFY_CHECKPOINT_GLOBALS = "snapify_checkpoint_globals";
static const Name SNAPIFY_RESTORE_GLOBALS = "snapify_restore_globals";
static const Name SNAPIFY_CHECKPOINT_TABLES = "snapify_checkpoint_tables";
static const Name SNAPIFY_RESTORE_TABLES = "snapify_restore_tables";

static const std::string_view KAFU_DEST_PREFIX = ".kafu_dest.";
static const std::string_view KAFU_OFFLOAD_PREFIX = ".kafu_offload.";

static const int32_t ASYNCIFY_METADATA_ADDRESS = 16;
enum class DataOffset { BStackPos = 0, BStackEnd = 4, BStackEnd64 = 8 };

// Snapify memory layouts
enum class SnapifyMemoryLayout : int32_t {
  STACK_START = 24,
  STACK_END = 8192,
  GLOBAL_START = 16384,
  GLOBAL_END = 20480,
  TABLE_START = 32768,
  TABLE_END = 40960
};

static const int32_t STACK_ALIGN = 4;

// Policy to insert migration points.
enum class MigrationPolicy : int32_t {
  // beginnig of each function and loop body.
  ALWAYS = 0,
  // For integration with Kafu.
  KAFU = 1,
};

static const Name ASYNCIFY = "asyncify";
static const Name START_UNWIND = "start_unwind";
static const Name STOP_UNWIND = "stop_unwind";
static const Name START_REWIND = "start_rewind";
static const Name STOP_REWIND = "stop_rewind";
// Functions newly added to Asyncify.
static const Name GET_STATE = "get_state";
static const Name SET_STATE = "set_state";

// TODO: having just normal/unwind_or_rewind would decrease code
//       size, but make debugging harder
enum class State { Normal = 0, Unwinding = 1, Rewinding = 2 };

enum class InterruptReason: int32_t {
  FUNC_ENTRY = 0,
  FUNC_EXIT = 1,
};

bool isSynthesizedFunction(Name& name) {
  return name == SNAPIFY_MIGRATION_POINT || name == SNAPIFY_START_RESTORE ||
         name == SNAPIFY_CHECKPOINT_GLOBALS ||
         name == SNAPIFY_RESTORE_GLOBALS;
}

// Read metadata from custom sections attached by the kafu macros.
class KafuMetadata {
public:
  KafuMetadata(Module* module) {
    auto startsWith = [](std::string_view s, std::string_view prefix) {
      return s.size() >= prefix.size() &&
             s.substr(0, prefix.size()) == prefix;
    };

    for (const auto& section : module->customSections) {
      std::string_view name = section.name;

      if (startsWith(name, KAFU_DEST_PREFIX)) {
        // Parse .kafu_dest.ident.dest format.
        auto suffix = name.substr(KAFU_DEST_PREFIX.size());
        auto dotPos = suffix.find('.');
        if (dotPos == std::string_view::npos) {
          Fatal() << "Invalid kafu dest name: " << suffix;
        }
        Name ident = suffix.substr(0, dotPos);
        std::string dest(suffix.substr(dotPos + 1));
        kafuDests[ident] = dest;
      } else if (startsWith(name, KAFU_OFFLOAD_PREFIX)) {
        // Parse .kafu_offload.ident.dest format.
        auto suffix = name.substr(KAFU_OFFLOAD_PREFIX.size());
        auto dotPos = suffix.find('.');
        if (dotPos == std::string_view::npos) {
          Fatal() << "Invalid kafu offload name: " << suffix;
        }
        Name ident = suffix.substr(0, dotPos);
        std::string dest(suffix.substr(dotPos + 1));

        kafuOffloads[ident].push_back(dest);
      }
    }

    // Build a mapping from internal function names to their exported names.
    // Note that a single function may be exported under multiple names.
    for (const auto& ex : module->exports) {
      if (ex->kind != ExternalKind::Function) {
        continue;
      }
      if (auto* internal = ex->getInternalName()) {
        functionInternalToExportNames[*internal].push_back(ex->name);
      }
    }
  }

  std::vector<std::string> getKafuOffloads(const Name& ident) const {
    return kafuOffloads.find(ident) != kafuOffloads.end() ? kafuOffloads.at(ident) : std::vector<std::string>();
  }

  std::optional<Name> getExportName(const Function* curr) const {
    auto it = functionInternalToExportNames.find(curr->name);
    if (it != functionInternalToExportNames.end()) {
      return std::optional<Name>(it->second.front());
    }
    return std::nullopt;
  }

  bool isKafuDestFunction(const Function* curr) const {
    // Prefer the exported name, since Kafu metadata identifiers are intended
    // to be stable across internal renaming (e.g. symbol stripping).
    auto it = functionInternalToExportNames.find(curr->name);
    if (it != functionInternalToExportNames.end()) {
      for (auto exportName : it->second) {
        if (kafuDests.find(exportName) != kafuDests.end()) {
          return true;
        }
      }
      return false;
    }

    // Fallback for modules that do not export the function.
    return kafuDests.find(curr->name) != kafuDests.end();
  }

  bool isKafuOffloadFunction(const Function* curr) const {
    return kafuOffloads.find(curr->name) != kafuOffloads.end();
  }

private:
  std::map<Name, std::string> kafuDests;
  std::map<Name, std::vector<std::string>> kafuOffloads;
  std::unordered_map<Name, std::vector<Name>> functionInternalToExportNames;
};

struct MigrationPointInserter
  : public WalkerPass<PostWalker<MigrationPointInserter>> {
public:
  MigrationPointInserter(MigrationPolicy migrationPolicy,
                         KafuMetadata kafuMetadata)
    : migrationPolicy(migrationPolicy), kafuMetadata(kafuMetadata) {}

  Index getOrCreateReturnValueTemp(Function* func, Type results) {
    // Only meaningful for concrete result types.
    assert(func);
    assert(results.isConcrete());
    auto it = returnValueTemps.find(func->name);
    if (it != returnValueTemps.end()) {
      return it->second;
    }
    Index tmp = Builder::addVar(func, results);
    returnValueTemps[func->name] = tmp;
    return tmp;
  }

  bool shouldInstrument(Function* func) {
    switch (migrationPolicy) {
      case MigrationPolicy::ALWAYS:
        return true;
      case MigrationPolicy::KAFU:
        return kafuMetadata.isKafuDestFunction(func);
    }
    WASM_UNREACHABLE("invalid migration policy");
  }

  // Insert calls to snapify_migration_point immediately before every return.
  void visitReturn(Return* curr) {
    auto* func = getFunction();
    if (!func) {
      return;
    }
    // Imported functions have no body, and we don't instrument synthesized
    // functions.
    if (func->imported() || isSynthesizedFunction(func->name)) {
      return;
    }
    if (!shouldInstrument(func)) {
      return;
    }

    Builder builder(*getModule());
    auto* exitCall =
      builder.makeCall(SNAPIFY_MIGRATION_POINT,
                       {builder.makeConst(
                         Literal(int32_t(InterruptReason::FUNC_EXIT)))},
                       Type::none);

    if (!curr->value) {
      // return;
      replaceCurrent(builder.makeSequence(exitCall, curr));
      return;
    }

    // Preserve evaluation order of the return value:
    //   tmp = <value>; migration_point(exit); return tmp;
    // Use the function result type for the local to avoid refined-type
    // mismatches across different returns.
    auto results = func->getResults();
    if (!results.isConcrete()) {
      // Extremely rare in practice. Avoid potentially reordering side effects.
      // (We could still insert, but that would run the exit hook before
      // evaluating the returned value.)
      return;
    }
    Index tmp = getOrCreateReturnValueTemp(func, results);
    auto* set = builder.makeLocalSet(tmp, curr->value);
    auto* ret = builder.makeReturn(builder.makeLocalGet(tmp, results));
    replaceCurrent(builder.makeBlock({set, exitCall, ret}));
  }

  // This inserts a migration point at the beginning of each
  // function.
  void visitFunction(Function* curr) {
    // if this is imported, we don't need to do anything
    if (curr->imported()) {
      return;
    }
    // we don't need to insert a migration point for functions synthesized by
    // Snapify.
    if (isSynthesizedFunction(curr->name)) {
      return;
    }

    if (!shouldInstrument(curr)) {
      return;
    }

    Builder builder(*getModule());
    auto* entryCall =
      builder.makeCall(SNAPIFY_MIGRATION_POINT,
                       {builder.makeConst(
                         Literal(int32_t(InterruptReason::FUNC_ENTRY)))},
                       Type::none);
    auto* bodyWithEntry = builder.makeSequence(entryCall, curr->body);

    // Ensure the exit migration point runs when the function falls through to
    // its end (i.e., no explicit return).
    auto* exitCall =
      builder.makeCall(SNAPIFY_MIGRATION_POINT,
                       {builder.makeConst(
                         Literal(int32_t(InterruptReason::FUNC_EXIT)))},
                       Type::none);

    auto results = curr->getResults();
    if (results == Type::none) {
      curr->body = builder.makeSequence(bodyWithEntry, exitCall);
      return;
    }

    // Preserve the function result while still running exitCall.
    if (results.isConcrete()) {
      Index tmp = getOrCreateReturnValueTemp(curr, results);
      // `local.tee` returns a value, and placing it in a non-final position in
      // a block violates wasm validation ("non-final block elements returning a
      // value must be dropped"). Use `local.set` (type none) + `local.get`
      // instead.
      auto* set = builder.makeLocalSet(tmp, bodyWithEntry);
      auto* get = builder.makeLocalGet(tmp, results);
      curr->body = builder.makeBlock({set, exitCall, get}, results);
      return;
    }

    // If results are not concrete, we cannot safely preserve the value while
    // inserting the end-of-function exit point.
    curr->body = bodyWithEntry;

  }

  // This inserts a migration point at the beginning of each loop.
  void visitLoop(Loop* curr) {
    if (migrationPolicy == MigrationPolicy::ALWAYS) {
      Builder builder(*getModule());
      const auto call =
        builder.makeCall(SNAPIFY_MIGRATION_POINT,
                         {builder.makeConst(Literal(int32_t(InterruptReason::FUNC_ENTRY)))},
                         Type::none);
      const auto newBody = builder.makeSequence(call, curr->body);
      curr->body = newBody;
    }
  }


private:
  const MigrationPolicy migrationPolicy;
  const KafuMetadata kafuMetadata;
  std::unordered_map<Name, Index> returnValueTemps;
};

class Snapify : public Pass {
public:
  bool addsEffects() override { return true; }

  void run(Module* module) override {
    auto migrationPolicyArg = getArgumentOrDefault("policy", "always");
    MigrationPolicy migrationPolicy = MigrationPolicy::ALWAYS;
    if (migrationPolicyArg == "always") {
      migrationPolicy = MigrationPolicy::ALWAYS;
    } else if (migrationPolicyArg == "kafu") {
      migrationPolicy = MigrationPolicy::KAFU;
    } else {
      Fatal() << "Invalid migration policy: " << migrationPolicyArg;
    }

    // Ensure the module contains a single memory.
    if (module->memories.size() != 1) {
      Fatal() << "Snapify requires a single memory in the module";
    }
    if (!module->getExportOrNull("memory")) {
      module->addExport(Builder(*module).makeExport(
        "memory", module->memories[0]->name, ExternalKind::Memory));
    }

    AddSnapifyImports(module);
    addAsyncifyImports(module);
    addSnapifyMemory(module, 1);
    addFunctions(module);
    addGlobals(module);

    KafuMetadata kafuMetadata(module);
    MigrationPointInserter(migrationPolicy, kafuMetadata).walkModule(module);

    renameStartFunction(module);
  }

private:
  Name snapifyMemory;

  void AddSnapifyImports(Module* module) {
    addImportFunction(
      module, SNAPIFY, SHOULD_CHECKPOINT, {Type::i32}, Type::i32);
  }

  void addAsyncifyImports(Module* module) {
    addImportFunction(module, ASYNCIFY, START_UNWIND, {Type::i32}, {});
    addImportFunction(module, ASYNCIFY, STOP_UNWIND, {}, {});
    addImportFunction(module, ASYNCIFY, START_REWIND, {Type::i32}, {});
    addImportFunction(module, ASYNCIFY, STOP_REWIND, {}, {});
    addImportFunction(module, ASYNCIFY, GET_STATE, {}, Type::i32);
    addImportFunction(module, ASYNCIFY, SET_STATE, {Type::i32}, {});
  }

  void addSnapifyMemory(Module* module, Address secondaryMemorySize) {
    Name name = Names::getValidMemoryName(*module, "snapify_memory");
    auto secondaryMemory =
      Builder::makeMemory(name, secondaryMemorySize, secondaryMemorySize);
    module->addMemory(std::move(secondaryMemory));
    snapifyMemory = name;

    // Add an export for the snapify memory.
    module->addExport(Builder(*module).makeExport(
      snapifyMemory, snapifyMemory, ExternalKind::Memory));
  }

  // helper function to add an import function
  void addImportFunction(
    Module* module, Name mod, Name name, Type params, Type results) {
    Builder builder(*module);
    auto import = builder.makeFunction(name, Signature(params, results), {});
    import->module = mod;
    import->base = name;
    // Make sure the function type is inexact for imported functions
    // Recent changes in the upstream for custom descriptors make the function type exact by default, which breaks module validation.
    import->type = import->type.with(Inexact);
    module->addFunction(std::move(import));
  }

  void addFunctions(Module* module) {
    // Add the snapify_migration_point function.
    synthesizeSnapifyMigrationPoint(module);
    // Add the snapify_start_restore function.
    synthesizeSnapifyStartRestore(module);
    // Add the snapify_checkpoint_globals function.
    synthesizeSnapifyCheckpointGlobals(module);
    // Add the snapify_restore_globals function.
    synthesizeSnapifyRestoreGlobals(module);
  }

  void synthesizeSnapifyMigrationPoint(Module* module) {
    /*
    Synthesize snapify_migration_point function:
    ```js
    function snapify_migration_point(int32_t function_index) {
      if (snapify_should_checkpoint(function_index)) {
        // unwind the stack
        store(ASYNCIFY_METADATA_ADDRESS + BStackPos, ASYNCIFY_STACK_START);
        store(ASYNCIFY_METADATA_ADDRESS + BStackEnd, ASYNCIFY_STACK_END);
        asyncify_start_unwind(ASYNCIFY_METADATA_ADDRESS);
      } else if (asyncify_get_state() == ASYNCIFY_STATE_REWINDING) {
        asyncify_stop_rewind();
      }
    }
    ```
    */
    Builder builder(*module);
    Function* f =
      addFunction(module, SNAPIFY_MIGRATION_POINT, {Type::i32}, Type::none);
    Type pointerType =
      module->getMemory(snapifyMemory)->is64() ? Type::i64 : Type::i32;
    auto unwindBlock = builder.makeBlock();
    unwindBlock->list.push_back(builder.makeStore(
      pointerType.getByteSize(),
      int(DataOffset::BStackPos),
      pointerType.getByteSize(),
      builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS)),
      builder.makeConst(Literal(int32_t(SnapifyMemoryLayout::STACK_START))),
      pointerType,
      snapifyMemory));
    unwindBlock->list.push_back(builder.makeStore(
      pointerType.getByteSize(),
      int(pointerType == Type::i64 ? DataOffset::BStackEnd64
                                   : DataOffset::BStackEnd),
      pointerType.getByteSize(),
      builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS)),
      builder.makeConst(Literal(int32_t(SnapifyMemoryLayout::STACK_END))),
      pointerType,
      snapifyMemory));
    unwindBlock->list.push_back(
      builder.makeCall(START_UNWIND,
                       {builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS))},
                       Type::none));
    unwindBlock->finalize(Type::none);

    auto* checkState = builder.makeIf(
      builder.makeBinary(EqInt32,
                         builder.makeCall(SHOULD_CHECKPOINT,
                                          {builder.makeLocalGet(0, Type::i32)},
                                          Type::i32),
                         builder.makeConst(Literal(int32_t(1)))),

      unwindBlock,
      builder.makeIf(builder.makeBinary(
                       EqInt32,
                       builder.makeCall(GET_STATE, {}, Type::i32),
                       builder.makeConst(Literal(int32_t(State::Rewinding)))),
                     builder.makeCall(STOP_REWIND, {}, Type::none)));
    auto* block = builder.makeBlock();
    block->list.push_back(checkState);
    block->finalize(Type::none);
    f->body = block;
  }

  // helper function to add a function
  Function* addFunction(Module* wasm, Name name, Type params, Type results) {
    Builder builder(*wasm);
    auto func = builder.makeFunction(name, Signature(params, results), {});
    Function* f = wasm->addFunction(std::move(func));
    wasm->addExport(builder.makeExport(name, name, ExternalKind::Function));
    return f;
  }

  void synthesizeSnapifyStartRestore(Module* module) {
    // TODO: We have to grow the main memory to make sure that it has the size
    // of checkpointed memory.
    /*
    Synthesize snapify_start_restore function:
    ```js
    function snapify_start_restore() {
      asyncify_start_rewind(ASYNCIFY_METADATA_ADDRESS);
    }
    ```
    */
    Builder builder(*module);
    auto* f =
      addFunction(module, SNAPIFY_START_RESTORE, Type::none, Type::none);
    auto* block = builder.makeBlock();
    block->list.push_back(builder.makeCall(
      START_REWIND,
      {builder.makeConst(Literal(int32_t(ASYNCIFY_METADATA_ADDRESS)))},
      Type::none));
    block->finalize(Type::none);
    f->body = block;
  }

  void synthesizeSnapifyCheckpointGlobals(Module* module) {
    /*
    Synthesize snapify_checkpoint_globals function:
    ```js
    function snapify_checkpoint_globals() {
      // Store the globals in the snapify memory.
      let pos = GLOBAL_START;
      for (let i = 0; i < global_count; i++) {
        if (global.isNotMutable(i)) {
          continue;
        }
        store(pos, get_global(i));
        pos += global_size;
      }
    }
    ```
    */
    Builder builder(*module);
    auto* f =
      addFunction(module, SNAPIFY_CHECKPOINT_GLOBALS, Type::none, Type::none);
    auto* block = builder.makeBlock();

    // Iterate over all globals and store them in the snapify memory.
    int32_t pos = int32_t(SnapifyMemoryLayout::GLOBAL_START);
    for (auto& global : module->globals) {
      assert(pos % STACK_ALIGN == 0);
      if (pos > int32_t(SnapifyMemoryLayout::GLOBAL_END)) {
        Fatal() << "Snapify: too many globals to fit in snapify memory";
      }

      if (global->mutable_) {
        // Store the global in the snapify memory.
        block->list.push_back(
          builder.makeStore(global->type.getByteSize(),
                            0,
                            STACK_ALIGN,
                            builder.makeConst(Literal(pos)),
                            builder.makeGlobalGet(global->name, global->type),
                            global->type,
                            snapifyMemory));
      }
      pos += global->type.getByteSize();
    }
    block->finalize(Type::none);
    f->body = block;
    f->setName(SNAPIFY_CHECKPOINT_GLOBALS, false);
  }

  void synthesizeSnapifyRestoreGlobals(Module* module) {
    /*
    Synthesize snapify_restore_globals function:
    ```js
    function snapify_restore_globals() {
      // Restore the globals from the snapify memory.
      let pos = GLOBAL_START;
      for (let i = 0; i < global_count; i++) {
        if (global.isNotMutable(i)) {
          continue;
        }
        set_global(i, load(pos, global_size));
        pos += global_size;
      }
    }
    ```
    */
    Builder builder(*module);
    auto* f =
      addFunction(module, SNAPIFY_RESTORE_GLOBALS, Type::none, Type::none);
    auto* block = builder.makeBlock();

    // Iterate over all globals and restore them from the snapify memory.
    int32_t pos = int32_t(SnapifyMemoryLayout::GLOBAL_START);
    for (auto& global : module->globals) {
      assert(pos % STACK_ALIGN == 0);
      if (pos > int32_t(SnapifyMemoryLayout::GLOBAL_END)) {
        Fatal() << "Snapify: too many globals to fit in snapify memory";
      }

      if (global->mutable_) {
        // Restore the global from the snapify memory.
        block->list.push_back(builder.makeGlobalSet(
          global->name,
          builder.makeLoad(global->type.getByteSize(),
                           false,
                           0,
                           STACK_ALIGN,
                           builder.makeConst(Literal(pos)),
                           global->type,
                           snapifyMemory)));
      }
      pos += global->type.getByteSize();
    }
    block->finalize(Type::none);
    f->body = block;
    f->setName(SNAPIFY_RESTORE_GLOBALS, false);
  }

  void addGlobals(Module* module) {
    // addImportGlobal(module, ASYNCIFY, ASYNCIFY_STATE, Type::i32);
  }

  void addImportGlobal(Module* module, Name mod, Name name, Type type) {
    Builder builder(*module);
    auto global = builder.makeGlobal(
      name, type, LiteralUtils::makeZero(type, *module), Builder::Mutable);
    global->module = mod;
    global->base = name;
    module->addGlobal(std::move(global));
  }

  void renameStartFunction(Module* module) {
    // start functionがある場合は"_start"にrenameして削除
    if (module->start.is()) {
      auto* startFunc = module->getFunction(module->start);
      if (!startFunc->imported() && startFunc->body->is<Nop>()) {
        // Do nothing if there is no the start function.
      } else {
        // if there is a start function, rename it to "_start" and export it
        startFunc->setName(Name("_start"), true);
        module->addExport(Builder(*module).makeExport(
          "_start", startFunc->name, ExternalKind::Function));
      }
      module->removeStart();
    }
  }
};

Pass* createSnapifyPass() { return new Snapify(); }

} // namespace wasm