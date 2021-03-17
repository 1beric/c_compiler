#ifndef _THREEAC_GEN_H_
#define _THREEAC_GEN_H_

#include "quad.h"
#include "syntax-tree.h"

#define L_VALUE 0
#define R_VALUE 1

Quad *gen3ac(tnode *t, char *name);

int t_width(int type);

symtabnode *newtemp(int type);
Quad *newlabel();
Quad *newinstr(QuadInstr, Operand, Operand, Operand);

void GEN_node(tnode *t);
void GEN_expr(tnode *t, int lr);
void GEN_stmt(tnode *t);

void GEN_const(tnode *t, int lr);
void GEN_var(tnode *t, int lr);
void GEN_arraySubscript(tnode *t, int lr);
void GEN_unaryOp(tnode *t, int lr);
void GEN_binaryOp(tnode *t, int lr);
void GEN_funCall(tnode *t, int lr);
void GEN_assg(tnode *t);
void GEN_return(tnode *t);
void GEN_for(tnode *t);
void GEN_while(tnode *t);
void GEN_if(tnode *t);

// void codeGen_FUNC_DEF(ASTNode *);
// void codeGen_FUNC_CALL(ASTNode *);
// Quad *codeGen_PARAMS(ASTNode *);
// void codeGen_STMT_LIST(ASTNode *, Operand);
// void codeGen_STMT(ASTNode *, Operand);
// void codeGen_EXPR_LIST(ASTNod  *),
// void codeGen_EXPR(ASTNode /);   Gt,
///void/codeGen_BOOL(ASTNode *, Operand, Operand);

#endif /* _THREEAC_GEN_H_ */
