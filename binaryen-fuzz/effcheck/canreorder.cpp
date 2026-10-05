// canreorder MODULE.wat
// Prints "i j 0|1" for every pair of functions named c_* (declaration order): 1 when
// EffectAnalyzer::canReorder says the two bodies may be swapped.  Each such function
// body is a single statement.
#include "ir/effects.h"
#include "pass.h"
#include "support/file.h"
#include "wasm-io.h"
#include "wasm.h"
#include "wasm-traversal.h"
#include <iostream>
#include <string>
#include <vector>

using namespace wasm;

int main(int argc, char** argv) {
  if (argc < 2) {
    std::cerr << "usage: canreorder MODULE.wat\n";
    return 2;
  }
  Module wasm;
  wasm.features = FeatureSet::All;
  ModuleReader reader;
  reader.read(argv[1], wasm);
  PassOptions options;
  if (argc > 2 && std::string(argv[2]) == "ge") {
    // global effects: a call's effects are the callee's
    PassRunner runner(&wasm, options);
    runner.add("generate-global-effects");
    runner.run();
  }
  std::vector<Function*> fs;
  for (auto& f : wasm.functions) {
    if (f->name.toString().rfind("c_", 0) == 0) {
      fs.push_back(f.get());
    }
  }
  // single statements: S name hasSideEffects hasUnremovableSideEffects
  for (auto* f : fs) {
    auto* a = f->body->cast<Block>()->list[0];
    EffectAnalyzer e(options, wasm, a);
    std::cout << "S " << f->name << " " << e.hasSideEffects() << " " << e.hasUnremovableSideEffects() << "\n";
  }
  for (size_t i = 0; i < fs.size(); i++) {
    for (size_t j = i + 1; j < fs.size(); j++) {
      // each body is (block $out STMT): analyze the statement itself, so a branch to $out
      // is a transfer of control out of it
      auto* a = fs[i]->body->cast<Block>()->list[0];
      auto* b = fs[j]->body->cast<Block>()->list[0];
      bool ok = EffectAnalyzer::canReorder(options, wasm, a, b);
      std::cout << fs[i]->name << " " << fs[j]->name << " " << (ok ? 1 : 0) << "\n";
    }
  }
  return 0;
}
