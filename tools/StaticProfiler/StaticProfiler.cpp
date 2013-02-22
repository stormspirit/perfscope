#include <iostream>
#include <memory>
#include <limits.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <sys/time.h>
#include <vector>
#include <list>

#include "llvm/LLVMContext.h"
#include "llvm/IntrinsicInst.h"
#include "llvm/Module.h"
#include "llvm/PassManager.h"
#include "llvm/Type.h"

#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/Triple.h"

#include "llvm/Target/TargetData.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Target/TargetLowering.h"
#include "llvm/Target/TargetSubtargetInfo.h"
#include "llvm/Target/TargetLowering.h"

#include "llvm/Support/Host.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/IRReader.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Support/InstVisitor.h"
#include "llvm/Support/InstIterator.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/TargetRegistry.h"

#include "commons/handy.h"
#include "commons/CallSiteFinder.h"
#include "analyzer/Evaluator.h"
#include "analyzer/X86CostModel.h"


using namespace std;
using namespace llvm;

static char * program_name;

#define TOPKCOSTFUNCS 50
#define TOPKHOTFUNCS 50 

static int topk_cost = TOPKCOSTFUNCS;
static int topk_hot = TOPKHOTFUNCS;

FILE * fout = stdout;


#define PROFILE_DEBUG

gen_dbg(profile)

#ifdef PROFILE_DEBUG
gen_dbg_impl(profile)
#else
gen_dbg_nop(profile)
#endif

static LLVMContext & Context = getGlobalContext();

typedef struct FuncCost {
  string name;
  unsigned cost;
  FuncCost() : cost(0) {}
  FuncCost(const char *name, unsigned cost) : name(name), cost(cost) {}
} FuncCost;

typedef struct FuncHot {
  string name;
  unsigned hotness;
  FuncHot() : hotness(0) {}
  FuncHot(const char *name, unsigned hot) : name(name), hotness(hot) {}
} FuncHot;

int compareFuncCost(const void *a, const void *b)
{
  FuncCost * fa = (FuncCost *) a;
  FuncCost * fb = (FuncCost *) b;
  return (fb->cost - fa->cost); // reverse order
}

int compareFuncHot(const void *a, const void *b)
{
  FuncHot * fa = (FuncHot *) a;
  FuncHot * fb = (FuncHot *) b;
  return (fb->hotness- fa->hotness); // reverse order
}

void static_profile(Module * module, CostModel * model)
{
  size_t size = module->size();
  if (size == 0) {
    profile_debug("Module has no functions\n");
    return;
  }
  FuncCost * func_cost = new FuncCost[size];
  FuncHot * func_hot = new FuncHot[size];
  if (func_cost == NULL || func_hot == NULL) {
    fprintf(stderr, "Cannot allocate memory for function cost and hot\n");
    return;
  }
  unsigned i = 0;
  for (Module::iterator MI = module->begin(), ME = module->end(); 
      MI != ME; ++MI, ++i) {
    Function * F = MI;
    if (F->getName().startswith("llvm.")) // Skip llvm functions
      continue;
    const char * name = cpp_demangle(F->getName().data());
    // Calculate cost
    unsigned cost = model->getFunctionCost(F);
    if (cost == (unsigned) -1)
      cost = 0;
    func_cost[i] = FuncCost(name, cost);

    // Calculate hot
    CallSiteFinder finder(F);
    func_hot[i] = FuncHot(name, finder.size());
  } 
  // Print cost
  printf("====\n");
  printf("EXPCALL\n");
  printf("====\n");
  qsort(func_cost, size, sizeof(FuncCost), compareFuncCost);
  size_t k = (topk_cost > 0) ? topk_cost : size;
  for (i = 0; i < k ; i++) {
    printf("%s\n", func_cost[i].name.c_str());
  }
  // Print hot
  fprintf(fout, "====\n");
  fprintf(fout, "FREQCALL\n");
  fprintf(fout, "====\n");
  qsort(func_hot, size, sizeof(FuncHot), compareFuncHot);
  k = (topk_hot > 0) ? topk_hot: size;
  for (i = 0; i < k; i++) {
    fprintf(fout, "%s\n", func_hot[i].name.c_str());
    //fprintf(fout, "%s: %u\n", func_hot[i].name.c_str(), func_hot[i].hotness);
  }
  delete [] func_cost;
  delete [] func_hot;
}

static char const * option_help[] = {
  " -o FILE\n\tOutput the generated profile to FILE file.",
  " -n NUM\n\tThe top NUM expensive functions to be printed.\n\tNegative NUM means print all.",
  " -m NUM\n\tThe top NUM hot functions to be printed.\n\tNegative NUM means print all.",
  " -h\n\tPrint this message.",
  0
};

void usage(FILE *fp = stderr)
{
  const char **p = option_help;
  fprintf(fp, "Usage: %s [OPTIONS] MODULE", program_name);
  fprintf(fp, "\n");
  while (*p) {
    fprintf(fp, "%s\n\n", *p);
    p++;
  }
}

int main(int argc, char *argv[])
{
  program_name = argv[0];

  if (argc <= 1) {
    usage();
    exit(1);
  }
  int opt;
  char *endptr;
  while((opt = getopt(argc, argv, "n:m:o:h")) != -1) {
    switch(opt) {
      case 'n':
        topk_cost = strtol(optarg, &endptr, 10);
        if (endptr == optarg) {
          fprintf(stderr, "Option %s is not a valid number\n", optarg);
          exit(1);
        }
        break;
      case 'm':
        topk_hot = strtol(optarg, &endptr, 10);
        if (endptr == optarg) {
          fprintf(stderr, "Option %s is not a valid number\n", optarg);
          exit(1);
        }
        break;
      case 'o':
        fout = fopen(optarg, "w");
        if (fout == NULL) {
          perror("Output must be a file");
          exit(1);
        }
        break;
      case 'h':
        usage();
        exit(0);
      case '?':
      default:
        usage();
        exit(1);
    }
  }

  LLVMContext & Context = getGlobalContext();

  Module * module = ReadModule(Context, argv[1]);
  if (module == NULL)  {
    cout << "cannot load module " << argv[1] << endl;
    return false;
  }

  llvm_shutdown_obj Y;  // Call llvm_shutdown() on exit.
  PassRegistry &Registry = *PassRegistry::getPassRegistry();
  initPassRegistry(Registry);

  X86CostModel * XCM = new X86CostModel(getTargetMachine());
  static_profile(module, XCM);
  return 0;
}
