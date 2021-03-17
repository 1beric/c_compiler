#ifndef _MIPS_GEN_H_
#define _MIPS_GEN_H_

#include "syntax-tree.h"

void genCode(tnode *t, char *name);
void print3ac(Quad *instr);
void printMips(Quad *instr);

#endif /* _MIPS_GEN_H_ */
