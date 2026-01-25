// # Snapify pass
//
// Wasmモジュールをcheckpoint/restore可能にするためのパス。
// 以下のコマンドでWasmモジュールをSnapifyパスで変換した後にAsyncifyを適用することができる。
//
// $(WASM_OPT) $$wasm -O1 --enable-multimemory --snapify
// --pass-arg=policy@always -o $$output
// $(WASM_OPT) $$output -O1 --asyncify --pass-arg=asyncify-memory@snapify_memory
// --enable-multimemory -o $$output
//
// ## 利用方法
//
// ランタイムは、fn snapify.should_checkpoint(i32 reason) -> i32(=bool);をexportする必要がある。
// その関数内で、チェックポイント要求の有無を返す処理を実装する(例えばPOSIXシグナルをトリガーにする)。
// restoreをする場合は、snapify_start_restoreを呼び出してから_startを呼び出す。
// (通常の実行では_startを呼び出すだけでよい。)
//
// ## 制約
//
// 現時点では以下の制約がある
// - メモリは一つのみ
// Todo
// - C/R globals
// - C/R tables
//
// テーブルはtable.set直前にglobal.setを挿入することでC/R可能。(しかしオーバーヘッドが発生する)
//
// ## 仕組み
// -
// Wasmプログラム内の関数の先頭とループの先頭にマイグレーションポイント(migration_point)を挿入する。
// migration_pointではチェックポイント時には、asyncify_start_unwindを呼び出し、リストア時にはasyncify_stop_rewindを呼び出す。
// start_restoreは、内部でasyncify_start_rewindを呼び出す。
//
// ## Migration Policy
// - always (default):
// 先頭にマイグレーションポイント(migration_point(reason=KAFU_FUNC_ENTRY))を挿入する。
// 終了時にはマイグレーションポイント(migration_point(reason=KAFU_FUNC_EXIT))を挿入する。
// - kafu:
// Kafuのdest関数のみについて:
// 先頭にマイグレーションポイント(migration_point(reason=KAFU_FUNC_ENTRY))を挿入する。
// 終了時にはマイグレーションポイント(migration_point(reason=KAFU_FUNC_EXIT))を挿入する。
//
// ## Todo
// - C/R tables
// - C/R tables
//
// ## 仕様
// ### 線形メモリ
// - main_memory: 通常の実行で使われるメモリ
// - snapify_memory: asyncifyのスタックとグローバル変数の保存先
//
// ### Import関数
// - asyncify_start_unwind(int32_t metadataAddress):
// スタックをアンワインドする。
// - asyncify.stop_rewind(): リワインドを停止する。
// - asyncify.start_rewind(int32_t metadataAddress): リワインドを開始する。
// - asyncify.stop_rewind(): リワインドを停止する。
// - asyncify.get_state(): 現在のAsyncify状態を取得する。
// - asyncify.set_state(int32_t state): Asyncify状態を設定する。
// - snapify.should_checkpoint(int32_t reason):
// チェックポイントを要求するかどうかを取得する。(ユーザーが実装する必要あり)
//
// ### 合成される関数
// - snapify_migration_point(int32_t callerIdx):
// マイグレーションポイントに挿入される。
// - snapify_start_restore():
// リストアを開始する。(ユーザーが明示的に呼び出す必要あり)
// - snapify_checkpoint_globals():
// グローバル変数をasyncify_memoryに保存する。(ユーザーが明示的に呼び出す必要あり)
// - snapify_restore_globals():
// グローバル変数をasyncify_memoryから復元する。(ユーザーが明示的に呼び出す必要あり)
//
// ### チェックポイントの手順
// 1. _startを呼び出す (実行開始)
// 2. snapify.should_checkpointが1を返すと、スタックがアンワインドされて実行終了
// 3. snapify.checkpoint_globalsを呼び出す
// 4. ランタイム側でmain_memoryとsnapify_memoryを保存する
//
// ### リストアの手順
// 1.
// ランタイム側でmain_memoryとsnapify_memoryをWasmモジュールのインスタンスに読み込む
// 2. snapify_start_restoreを呼び出す
// 3. snapify_restore_globalsを呼び出す
// 4. _startを呼び出す
//
// Kafu RPC generator
// - kafu_destが付いている関数に対して、import関数kafu_remote.f(i32 callerIdx, ...)を追加する
// - TODO: call f(args...) をすべて call kafu_remote.f(callerIdx, args...) に変換する
// FIXME: funcIdxの計算が何が原因で1ずれるのかわからん, importのせいだと思ったが上を追加しても1のままなので違うっぽい

#include "asmjs/shared-constants.h"
#include "ir/iteration.h"
#include "ir/memory-utils.h"
#include "ir/module-utils.h"
#include "ir/names.h"
#include "ir/utils.h"
#include "wasm.h"
#include <cassert>
#include <memory>
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

// static const Name ASYNCIFY_STATE = "__asyncify_state";
// static const Name ASYNCIFY_GET_STATE = "asyncify_get_state";
// static const Name ASYNCIFY_DATA = "__asyncify_data";
// static const Name ASYNCIFY_START_UNWIND = "asyncify_start_unwind";
// static const Name ASYNCIFY_STOP_UNWIND = "asyncify_stop_unwind";
// static const Name ASYNCIFY_START_REWIND = "asyncify_start_rewind";
// static const Name ASYNCIFY_STOP_REWIND = "asyncify_stop_rewind";
// static const Name ASYNCIFY_UNWIND = "__asyncify_unwind";
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

// Read metadata from data segments attached by the kafu macros and add them as custom sections to the module.
class KafuMetadata {
public:
  KafuMetadata(Module* module) {
    // Clang cannot generate custom sections and can only generate data
    // segments.
    for (const auto& dataSegment : module->dataSegments) {
      if (dataSegment->name.startsWith(KAFU_DEST_PREFIX)) {
        // Parse .kafu_dest.ident.dest format.
        const auto& name = dataSegment->name;
        auto suffix = name.toString().substr(KAFU_DEST_PREFIX.size());
        auto dotPos = suffix.find('.');
        if (dotPos == std::string::npos) {
          Fatal() << "Invalid kafu dest name: " << suffix;
        }
        auto ident = suffix.substr(0, dotPos);
        auto dest = suffix.substr(dotPos + 1);
        kafuDests[ident] = dest;

        CustomSection s;
        s.name = dataSegment->name.toString();
        s.data = dataSegment->data;
        module->customSections.push_back(s);
      } else if (dataSegment->name.startsWith(KAFU_OFFLOAD_PREFIX)) {
        // Parse .kafu_offload.ident.dest format.
        const auto& name = dataSegment->name;
        auto suffix = name.toString().substr(KAFU_OFFLOAD_PREFIX.size());
        auto dotPos = suffix.find('.');
        if (dotPos == std::string::npos) {
          Fatal() << "Invalid kafu offload name: " << suffix;
        }
        auto ident = suffix.substr(0, dotPos);
        auto dest = suffix.substr(dotPos + 1);

        if (kafuOffloads.find(ident) == kafuOffloads.end()) {
          kafuOffloads[ident] = std::vector<std::string>();
        }
        kafuOffloads[ident].push_back(dest);

        CustomSection s;
        s.name = dataSegment->name.toString();
        s.data = dataSegment->data;
        module->customSections.push_back(s);
      }
    }
  }

  std::vector<std::string> getKafuOffloads(const Name& ident) const {
    return kafuOffloads.find(ident) != kafuOffloads.end() ? kafuOffloads.at(ident) : std::vector<std::string>();
  }

  bool isKafuDestFunction(const Function* curr) const {
    return kafuDests.find(curr->name) != kafuDests.end();
  }

  bool isKafuOffloadFunction(const Function* curr) const {
    return kafuOffloads.find(curr->name) != kafuOffloads.end();
  }

private:
  std::map<Name, std::string> kafuDests;
  std::map<Name, std::vector<std::string>> kafuOffloads;
};

// Kafu destがついている関数f(...)に対して、import関数kafu_remote.f(i32 callerIdx, ...)を追加する
/*
class KafuRpcGenerator  : public WalkerPass<PostWalker<KafuRpcGenerator>>{
public:
  KafuRpcGenerator(MigrationPolicy migrationPolicy, Module* module, KafuMetadata kafuMetadata) : migrationPolicy(migrationPolicy), kafuMetadata(kafuMetadata)
  {}

  void visitFunction(Function* curr) {
    if (migrationPolicy != MigrationPolicy::KAFU) {
      return;
    }
    if (curr->imported()) {
      return;
    }
    if (isSynthesizedFunction(curr->name)) {
      return;
    }
    if (!kafuMetadata.isKafuDestFunction(curr)) {
      return;
    }

    Builder builder(*getModule());
    Tuple newParams = {Type::i32};
    for (auto param : curr->getParams()) {
      newParams.push_back(param);
    }
    // TODO: export nameを使うべき? シンボル削除すると壊れる
    auto internalName = std::string("kafu_remote_") + curr->name.toString();
    auto import = builder.makeFunction(internalName, Signature(newParams, Type::none), {});
    import->module = "kafu_remote";
    import->base = curr->name;
    rpcFunctions.push_back(std::move(import));
  }

  std::vector<std::unique_ptr<Function>> getRpcFunctions() {
    return std::move(rpcFunctions);
  }
private:
  const MigrationPolicy migrationPolicy;
  KafuMetadata kafuMetadata;
  std::vector<std::unique_ptr<Function>> rpcFunctions;
};
*/

struct MigrationPointInserter
  : public WalkerPass<PostWalker<MigrationPointInserter>> {
public:
  MigrationPointInserter(MigrationPolicy migrationPolicy,
                         KafuMetadata kafuMetadata)
    : migrationPolicy(migrationPolicy), kafuMetadata(kafuMetadata) {}

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
    Index tmp = Builder::addVar(func, results);
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
      Index tmp = Builder::addVar(curr, results);
      auto* tee = builder.makeLocalTee(tmp, bodyWithEntry, results);
      auto* get = builder.makeLocalGet(tmp, results);
      curr->body = builder.makeBlock({tee, exitCall, get}, results);
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
    //auto generator = KafuRpcGenerator(migrationPolicy, module, kafuMetadata);
    //generator.walkModule(module);
    //auto kafuRpcFunctions = generator.getRpcFunctions();
    //for (auto& func : kafuRpcFunctions) {
    //  module->addFunction(std::move(func));
    //}
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