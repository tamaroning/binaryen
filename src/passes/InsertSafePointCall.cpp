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

Name safepoint("safepoint");

struct InsertSafePointCall
  : public WalkerPass<PostWalker<InsertSafePointCall>> {
  // Adds calls to new imports.
  bool addsEffects() override { return true; }

  void visitModule(Module* curr) { addImport(curr, safepoint, {}, Type::none); }

  void visitFunction(Function* curr) {
    Builder builder(*getModule());

    // if this is imported, we don't need to do anything
    if (curr->imported()) {
      return;
    }

    // insert a safepoint call at the begeninng of each function
    const auto call = builder.makeCall(safepoint, {}, Type::none);
    const auto newBody = builder.makeSequence(call, curr->body);

    curr->body = newBody;
  }

  void visitLoop(Loop* curr) {
    // insert a safepoint call at the beginning of each loop
    Builder builder(*getModule());
    const auto call = builder.makeCall(safepoint, {}, Type::none);
    const auto newBody = builder.makeSequence(call, curr->body);
    curr->body = newBody;
  }

private:
  void addImport(Module* wasm, Name name, Type params, Type results) {
    auto import = Builder::makeFunction(name, Signature(params, results), {});
    import->module = ENV;
    import->base = name;
    wasm->addFunction(std::move(import));
  }
};

Pass* createInsertSafePointCallPass() { return new InsertSafePointCall(); }

} // namespace wasm