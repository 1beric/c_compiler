
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "threeac-gen.h"
#include "symbol-table.h"
#include "quad.h"
#include "global.h"
#include "protos.h"
#include "error.h"

static int name_suffix = 0;
symtabnode *newtemp(int t)
{
    char *name = malloc(sizeof(char) * (64));
    sprintf(name, "_tmp%d", name_suffix++);
    // get_local(symbol_table)->num_temps += 1;
    symtabnode *entry = SymTabInsert(name, t);
    return entry;
}

Quad *newinstr(QuadInstr type, Operand src1, Operand src2, Operand dest)
{
    Quad *instr = malloc(sizeof(Quad));
    instr->type = type;
    instr->src1 = src1;
    instr->src2 = src2;
    instr->dest = dest;
    instr->next = NULL;
    return instr;
}

static int label_prefix = 0;
Quad *newlabel()
{
    return newinstr(QI__Label, OPERAND_NONE, OPERAND_NONE, operand_intconst(label_prefix++));
}

static Operand return_location;

Quad *gen3ac(tnode *t, char *name)
{
    if (t == NULL)
    {
        // printf("-null-\n");
        return NULL;
    }

    symtabnode *func = SymTabLookup(name, Global);

    int nargs = 0;
    symtabnode *formal = NULL;
    for (formal = func->formals; formal != NULL; formal = formal->next)
        nargs++;

    Quad *func_end = newlabel();
    return_location = func_end->dest;
    t->code = newinstr(QI__Enter, OPERAND_NONE, OPERAND_NONE, operand_st(func));
    GEN_node(t);
    t->code = quad_concat(t->code, func_end);
    t->code = quad_concat(t->code, newinstr(QI__Leave, OPERAND_NONE, OPERAND_NONE, operand_st(func)));

    return t->code;
}

void GEN_node(tnode *t)
{
    tnode *tntmp0;

    switch (t->ntype)
    {
    case Error:
        printf("-error-\n");
        break;

    case Intcon:
    case Charcon:
    case Stringcon:
    case Var:
    case ArraySubscript:
    case UnaryMinus:
    case LogicalNot:
    case Plus:
    case BinaryMinus:
    case Mult:
    case Div:
        GEN_expr(t, R_VALUE);
        break;

    case Equals:
    case Neq:
    case Leq:
    case Lt:
    case Geq:
    case Gt:
    case LogicalAnd:
    case LogicalOr:
        // should not arrive here
        errmsg("bool op in node call");
        break;

    case FunCall:
    case Assg:
    case Return:
    case For:
    case While:
    case If:
        GEN_stmt(t);
        break;

    case STnodeList: /* list of syntax tree nodes */
        for (tntmp0 = t; tntmp0 != NULL; tntmp0 = stList_Rest(tntmp0))
        {
            GEN_node(stList_Head(tntmp0));
            t->code = quad_concat(t->code, stList_Head(tntmp0)->code);
        }
        break;

    default:
        errmsg("Unknown syntax tree node type %d\n", t->ntype);
    }
}

void GEN_expr(tnode *t, int lr)
{

    switch (t->ntype)
    {
    case Intcon:
    case Charcon:
    case Stringcon:
        GEN_const(t, lr);
        break;

    case Var:
        GEN_var(t, lr);
        break;

    case ArraySubscript:
        GEN_arraySubscript(t, lr);
        break;

    case UnaryMinus:
    case LogicalNot:
        GEN_unaryOp(t, lr);
        break;

    case Plus:
    case BinaryMinus:
    case Mult:
    case Div:
        GEN_binaryOp(t, lr);
        break;

    case Equals:
    case Neq:
    case Leq:
    case Lt:
    case Geq:
    case Gt:
    case LogicalAnd:
    case LogicalOr:
        // should not arrive here
        errmsg("bool op in expr?");
        break;

    case FunCall:
        GEN_funCall(t, lr);
        break;

    default:
        errmsg("not an expr type: %d\n", t->ntype);
        break;
    }
}

/*
 * 
 */
void GEN_const(tnode *t, int lr)
{

    if (lr == L_VALUE)
        errmsg("cannot be an lvalue: %d\n", t->ntype);

    t->place = newtemp(Local);

    switch (t->ntype)
    {
    case Intcon:
        t->place->type = t_Int;
        t->code = newinstr(QI__Assg, operand_intconst(t->val.iconst), OPERAND_NONE, operand_st(t->place));
        break;
    case Charcon:
        t->place->type = t_Char;
        t->code = newinstr(QI__Assg, operand_intconst(t->val.iconst), OPERAND_NONE, operand_st(t->place));
        break;
    case Stringcon:
        t->place->type = t_Array;
        t->code = newinstr(QI__Assg, operand_strconst(t->val.strconst), OPERAND_NONE, operand_st(t->place));
        break;
    default:
        errmsg("not an const type: %d\n", t->ntype);
    }
}

/*
 * 
 */
void GEN_var(tnode *t, int lr)
{
    // stptr = stVar(t);
    // printf("id(name=%s, scope=%s);\n",
    //        stptr->name,
    //        (stptr->scope == Global ? "G" : "L"));

    symtabnode *stptr = stVar(t);
    t->place = stptr;
    t->code = NULL;
}

/*
 * 
 */
void GEN_arraySubscript(tnode *t, int lr)
{
    // stptr = stArraySubscript_Array(t);
    // printf("arrayRef(id(name=%s, scope=%s),\n",
    //        stptr->name,
    //        (stptr->scope == Global ? "G" : "L"));
    // printSyntaxTree(stArraySubscript_Subscript(t), n + 9, depth + 1);
    // printf("%d:", depth);
    // indent(n + 8);
    // printf(")\n");
}

/*
 * 
 */
void GEN_unaryOp(tnode *t, int lr)
{
    // printUnop(t->ntype);
    // printf("(\n");
    // printSyntaxTree(stUnop_Op(t), n + 2, depth + 1);
    // printf("%d:", depth);
    // indent(n);
    // printf(")\n");
    if (lr == L_VALUE)
        errmsg("not an r value: %d\n", t->ntype);

    GEN_expr(stUnop_Op(t), R_VALUE);
    t->place = newtemp(Local);
    t->place->type = stUnop_Op(t)->place->type;
    t->code = stUnop_Op(t)->code;
    switch (t->ntype)
    {
    case UnaryMinus:
        t->code = quad_concat(t->code, newinstr(QI__Uminus, operand_st(stUnop_Op(t)->place), OPERAND_NONE, operand_st(t->place)));
        break;
    case LogicalNot:
        t->code = quad_concat(t->code, newinstr(QI__Lnot, operand_st(stUnop_Op(t)->place), OPERAND_NONE, operand_st(t->place)));
        break;
    default:
        errmsg("not an unary op type: %d\n", t->ntype);
    }
}

QuadInstr bin_op(SyntaxNodeType type)
{
    switch (type)
    {
    case Equals:
        return QI__If_ee;
    case Neq:
        return QI__If_ne;
    case Leq:
        return QI__If_le;
    case Lt:
        return QI__If_lt;
    case Geq:
        return QI__If_ge;
    case Gt:
        return QI__If_gt;
    case Plus:
        return QI__Add;
    case BinaryMinus:
        return QI__Sub;
    case Mult:
        return QI__Mul;
    case Div:
        return QI__Div;
    case LogicalAnd:
        return QI__Noop;
    case LogicalOr:
        return QI__Noop;
    }
    return -1;
}

/*
 * 
 */
void GEN_binaryOp(tnode *t, int lr)
{
    // printBinop(t->ntype);
    // printf("(\n");
    // printSyntaxTree(stBinop_Op1(t), n + 2, depth + 1);
    // printSyntaxTree(stBinop_Op2(t), n + 2, depth + 1);
    // printf("%d:", depth);
    // indent(n);
    // printf(")\n");

    switch (t->ntype)
    {
    case Plus:
    case BinaryMinus:
    case Mult:
    case Div:;
        QuadInstr instr = bin_op(t->ntype);
        tnode *op1 = stBinop_Op1(t);
        tnode *op2 = stBinop_Op2(t);
        GEN_expr(op1, lr);
        GEN_expr(op2, lr);
        t->place = newtemp(Local);
        t->place->type = (op1->place->type == t_Int || op2->place->type == t_Int) ? t_Int : t_Char;
        t->code = op1->code;
        t->code = quad_concat(t->code, op2->code);
        t->code = quad_concat(t->code, newinstr(instr, operand_st(op1->place), operand_st(op2->place), operand_st(t->place)));
        break;

    default:
        errmsg("this is not a binop node");
    }
}

void GEN_bool(tnode *t, Operand ltrue, Operand lfalse)
{
    QuadInstr instr = bin_op(t->ntype);
    tnode *op1 = stBinop_Op1(t);
    tnode *op2 = stBinop_Op2(t);
    switch (t->ntype)
    {
    case Equals:
    case Neq:
    case Leq:
    case Lt:
    case Geq:
    case Gt:
        GEN_expr(op1, R_VALUE);
        GEN_expr(op2, R_VALUE);
        t->code = op1->code;
        t->code = quad_concat(t->code, op2->code);
        t->code = quad_concat(t->code, newinstr(instr, operand_st(op1->place), operand_st(op2->place), ltrue));
        t->code = quad_concat(t->code, newinstr(QI__Goto, OPERAND_NONE, OPERAND_NONE, lfalse));
        break;
    case LogicalAnd:;
        Quad *land = newlabel();
        GEN_bool(op1, land->dest, lfalse);
        GEN_bool(op2, ltrue, lfalse);
        t->code = op1->code;
        t->code = quad_concat(t->code, land);
        t->code = quad_concat(t->code, op2->code);

        break;
    case LogicalOr:;
        Quad *lor = newlabel();
        GEN_bool(op1, ltrue, lor->dest);
        GEN_bool(op2, ltrue, lfalse);
        t->code = op1->code;
        t->code = quad_concat(t->code, lor);
        t->code = quad_concat(t->code, op2->code);
        break;
    }
}

Quad *GEN_params(tnode *t)
{

    if (t == NULL)
        return NULL;

    Quad *out = NULL;

    if (stList_Rest(t) != NULL)
    {
        out = quad_concat(out, GEN_params(stList_Rest(t)));
    }
    if (stList_Head(t) != NULL)
    {
        out = quad_concat(out, newinstr(QI__Param, OPERAND_NONE, OPERAND_NONE, operand_st(stList_Head(t)->place)));
    }
    return out;
}

/*
 * 
 */
void GEN_funCall(tnode *t, int lr)
{
    // printf("CALL: callee=%s\n", stptr->name);
    // printf("%d:", depth);
    // indent(n);
    // printf("  args:\n");
    // printSyntaxTree(stFunCall_Args(t), n + 4, depth + 1);

    symtabnode *stptr = stFunCall_Fun(t);
    tnode *call_args = stFunCall_Args(t);

    char *name = stptr->name;

    if (stptr->ret_type != t_None)
    {
        t->place = newtemp(Local);
        t->place->type = stptr->ret_type;
    }

    if (call_args != NULL)
    {
        GEN_node(call_args);
        t->code = call_args->code;
        t->code = quad_concat(t->code, GEN_params(call_args));
    }

    int nargs = 0;
    symtabnode *formal = NULL;
    for (formal = stptr->formals; formal != NULL; formal = formal->next)
        nargs++;

    t->code = quad_concat(t->code, newinstr(QI__Call, operand_intconst(nargs), OPERAND_NONE, operand_st(stptr)));
    if (stptr->ret_type != t_None)
        t->code = quad_concat(t->code, newinstr(QI__Retrieve, operand_st(t->place), OPERAND_NONE, OPERAND_NONE));
}

void GEN_stmt(tnode *t)
{
    switch (t->ntype)
    {
    case FunCall:
        GEN_funCall(t, R_VALUE);
        break;

    case Assg:
        GEN_assg(t);
        break;

    case Return:
        GEN_return(t);
        break;

    case For:
        GEN_for(t);
        // printf("FOR\n");
        // printf("%d:", depth);
        // indent(n);
        // printf("  init:\n");
        // printSyntaxTree(stFor_Init(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("  test:\n");
        // printSyntaxTree(stFor_Test(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("  update:\n");
        // printSyntaxTree(stFor_Update(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("  body:\n");
        // printSyntaxTree(stFor_Body(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("ENDFOR\n");
        break;

    case While:
        GEN_while(t);
        // printf("WHILE\n");
        // printSyntaxTree(stWhile_Test(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // printf("  body:\n ");
        // printSyntaxTree(stWhile_Body(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("ENDWHILE\n");
        break;

    case If:
        GEN_if(t);
        // printf("IF\n");
        // printSyntaxTree(stIf_Test(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("  then:\n");
        // printSyntaxTree(stIf_Then(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("  else:\n");
        // printSyntaxTree(stIf_Else(t), n + 4, depth + 1);
        // printf("%d:", depth);
        // indent(n);
        // printf("ENDIF\n");
        break;
    default:
        errmsg("nonstmt node encountered %d\n", t->ntype);
        break;
    }
}

/*
 * 
 */
void GEN_assg(tnode *t)
{
    GEN_expr(stAssg_Lhs(t), L_VALUE);
    GEN_expr(stAssg_Rhs(t), R_VALUE);
    t->code = stAssg_Lhs(t)->code;
    t->code = quad_concat(t->code, stAssg_Rhs(t)->code);
    t->code = quad_concat(t->code, newinstr(QI__Assg, operand_st(stAssg_Rhs(t)->place), OPERAND_NONE, operand_st(stAssg_Lhs(t)->place)));
    t->place = stAssg_Lhs(t)->place;
}

/*
 * 
 */
void GEN_return(tnode *t)
{
    if (stReturn(t) != NULL)
    {
        GEN_expr(stReturn(t), R_VALUE);
        t->code = stReturn(t)->code;
        t->code = quad_concat(t->code, newinstr(QI__Return_val, operand_st(stReturn(t)->place), OPERAND_NONE, OPERAND_NONE));
        t->place = stReturn(t)->place;
    }
    else
        t->code = newinstr(QI__Return_none, OPERAND_NONE, OPERAND_NONE, OPERAND_NONE);
    t->code = quad_concat(t->code, newinstr(QI__Goto, OPERAND_NONE, OPERAND_NONE, return_location));
}

/*
 * 
 */
void GEN_for(tnode *t)
{
}

/*
 * 
 */
void GEN_while(tnode *t)
{
}

/*
 * 
 */
void GEN_if(tnode *t)
{
}
