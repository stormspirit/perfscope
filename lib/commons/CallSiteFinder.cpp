#include "llvm/Instruction.h"
#include "llvm/Support/CallSite.h"

#include "commons/CallSiteFinder.h"

using namespace llvm;

CallSiteFinder::CallSiteFinder(Function * func)
{
  if (func == NULL)
    return;
  for (Value::use_iterator i = func->use_begin(), e = func->use_end(); i != e; ++i) {
    if (Instruction* use = dyn_cast<Instruction>(*i)) {
      if (!(isa<CallInst>(use) || isa<InvokeInst>(use)))
        continue;
      CallSite call(use);
      Function *callee = call.getCalledFunction();
      Function *caller = call.getCaller(); 
      if (caller != NULL) {
        if (callee != NULL && callee == func) {
          callsites.push_back(std::make_pair(caller, use));
        }
      }
    }
  }
}
