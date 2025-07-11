#include "asmjs/shared-constants.h"
#include "ir/iteration.h"
#include "ir/memory-utils.h"
#include "ir/module-utils.h"
#include "ir/names.h"
#include "ir/utils.h"
#include "wasm.h"
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

static const int32_t ASYNCIFY_METADATA_ADDRESS = 16;
enum class DataOffset { BStackPos = 0, BStackEnd = 4, BStackEnd64 = 8 };
static const int32_t ASYNCIFY_STACK_START = 24;
static const int32_t ASYNCIFY_STACK_END = 1024;

static const Name ASYNCIFY_STATE = "__asyncify_state";
static const Name ASYNCIFY_GET_STATE = "asyncify_get_state";
static const Name ASYNCIFY_DATA = "__asyncify_data";
static const Name ASYNCIFY_START_UNWIND = "asyncify_start_unwind";
static const Name ASYNCIFY_STOP_UNWIND = "asyncify_stop_unwind";
static const Name ASYNCIFY_START_REWIND = "asyncify_start_rewind";
static const Name ASYNCIFY_STOP_REWIND = "asyncify_stop_rewind";
static const Name ASYNCIFY_UNWIND = "__asyncify_unwind";
static const Name ASYNCIFY = "asyncify";
static const Name START_UNWIND = "start_unwind";
static const Name STOP_UNWIND = "stop_unwind";
static const Name START_REWIND = "start_rewind";
static const Name STOP_REWIND = "stop_rewind";

// Extension
static const Name GET_STATE = "get_state";
static const Name SET_STATE = "set_state";

// TODO: having just normal/unwind_or_rewind would decrease code
//       size, but make debugging harder
enum class State { Normal = 0, Unwinding = 1, Rewinding = 2 };

bool isSynthesizedFunction(Name& name) {
  return name == SNAPIFY_MIGRATION_POINT || name == SNAPIFY_START_RESTORE;
}

struct MigrationPointInserter
  : public WalkerPass<PostWalker<MigrationPointInserter>> {
  void visitFunction(Function* curr) {
    // if this is imported, we don't need to do anything
    if (curr->imported()) {
      return;
    }
    // we don't need to insert a migration point in the migration point
    if (isSynthesizedFunction(curr->name)) {
      return;
    }

    // insert a migration point at the begeninng of each function
    Builder builder(*getModule());
    const auto call = builder.makeCall(SNAPIFY_MIGRATION_POINT, {}, Type::none);
    const auto newBody = builder.makeSequence(call, curr->body);

    curr->body = newBody;
  }

  void visitLoop(Loop* curr) {
    // insert a safepoint call at the beginning of each loop
    Builder builder(*getModule());
    const auto call = builder.makeCall(SNAPIFY_MIGRATION_POINT, {}, Type::none);
    const auto newBody = builder.makeSequence(call, curr->body);
    curr->body = newBody;
  }
};

class Snapify : public Pass {
public:
  bool addsEffects() override { return true; }

  void run(Module* module) override {
    AddSnapifyImports(module);
    addAsyncifyImports(module);
    addSnapifyMemory(module, 1);

    addFunctions(module);
    addGlobals(module);

    MigrationPointInserter().walkModule(module);
  }

private:
  Name snapifyMemory;

  void AddSnapifyImports(Module* module) {
    addImportFunction(module, SNAPIFY, SHOULD_CHECKPOINT, {}, Type::i32);
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
    module->addFunction(std::move(import));
  }

  void addFunctions(Module* module) {
    synthesizeSnapifyMigrationPoint(module);
    synthesizeStartRestore(module);
  }

  void synthesizeSnapifyMigrationPoint(Module* module) {
    /*
    Synthesize snapify_migration_point function:
    ```js
    function snapify_migration_point() {
      if (snapify_should_checkpoint()) {
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
      addFunction(module, SNAPIFY_MIGRATION_POINT, Type::none, Type::none);
    Type pointerType =
      module->getMemory(snapifyMemory)->is64() ? Type::i64 : Type::i32;
    auto unwindBlock = builder.makeBlock();
    unwindBlock->list.push_back(
      builder.makeStore(pointerType.getByteSize(),
                        int(DataOffset::BStackPos),
                        pointerType.getByteSize(),
                        builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS)),
                        builder.makeConst(Literal(ASYNCIFY_STACK_START)),
                        pointerType,
                        snapifyMemory));
    unwindBlock->list.push_back(
      builder.makeStore(pointerType.getByteSize(),
                        int(pointerType == Type::i64 ? DataOffset::BStackEnd64
                                                     : DataOffset::BStackEnd),
                        pointerType.getByteSize(),
                        builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS)),
                        builder.makeConst(Literal(ASYNCIFY_STACK_END)),
                        pointerType,
                        snapifyMemory));
    unwindBlock->list.push_back(
      builder.makeCall(START_UNWIND,
                       {builder.makeConst(Literal(ASYNCIFY_METADATA_ADDRESS))},
                       Type::none));
    unwindBlock->finalize(Type::none);

    auto* checkState = builder.makeIf(
      builder.makeBinary(EqInt32,
                         builder.makeCall(SHOULD_CHECKPOINT, {}, Type::i32),
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

  void synthesizeStartRestore(Module* module) {
    /*
    Synthesize snapify_start_restore function:
    ```js
    function snapify_start_restore() {
      asyncify_set_state(ASYNCIFY_STATE_REWINDING);
    }
    ```
    */
    Builder builder(*module);
    auto* f =
      addFunction(module, SNAPIFY_START_RESTORE, Type::none, Type::none);
    auto* block = builder.makeBlock();
    block->list.push_back(
      builder.makeCall(SET_STATE,
                       {builder.makeConst(Literal(int32_t(State::Rewinding)))},
                       Type::none));
    block->finalize(Type::none);
    f->body = block;
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
};

Pass* createSnapifyPass() { return new Snapify(); }

} // namespace wasm