/*
 * File: codegen.c
 * Author: Saumya Debray
 * Purpose: Three-address and final code generation for C--
 */

#include "global.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "protos.h"
#include "syntax-tree.h"
#include "codegen.h"
#include "util.h"

extern symtabnode *symbol_table[];

extern int olocal_flag;
extern int oglobal_flag;

/* 
 * curr_fn_symtbl -- a pointer to the global symbol table entry of the current
 * function being processed.
 */
static symtabnode *curr_fn_symtbl = NULL;

/*******************************************************************************
 *                                                                             *
 *                                   PROTOTYPES                                *
 *                                                                             *
 *******************************************************************************/

/*
 * three address code generation
 */
static void gen_3addr_code(tnode *ast);
static void gen_mips_code(tnode *ast);
static void gen_3addr_code_funcbody(tnode *ast);
static void gen_3addr_code_funcall(tnode *ast);
static void gen_3addr_code_if(tnode *ast);
static void gen_3addr_code_while(tnode *ast);
static void gen_3addr_code_for(tnode *ast);
static void gen_3addr_code_assg(tnode *ast);
static void gen_3addr_code_return(tnode *ast);
static void gen_3addr_code_astlist(tnode *ast);
static void gen_3addr_code_id(tnode *ast);
static void gen_3addr_code_intconst(tnode *ast);
static void gen_3addr_code_stringcon(tnode *ast);
static void gen_3addr_code_arraysub(tnode *ast);
static void gen_3addr_code_arithop(tnode *ast);
static void gen_3addr_code_boolexp(tnode *ast, Quad *true_lbl, Quad *false_lbl);
static Op ast_binop(SyntaxNodeType ntype);

/*
 * code optimization
 */
static void gen_cfg(Quad *qptr);
static BasicBlock *new_block();
static void bb_add_ins(BasicBlock *block, Quad *qptr);
static void bb_add_block(BasicBlock *block, BasicBlock *other);
static void bb_add_pre_block(BasicBlock *block, BasicBlock *other);
static CFGILink *new_cfgi(Quad *qptr, int num);
static void cfgi_add_ins(CFGILink *link, Quad *qptr);
static CFGBLink *new_cfgb(BasicBlock *block);
static void cfgb_add_block(CFGBLink *link, BasicBlock *block);
static void print_cfg();

static int is_def(Op op);

static void gen_optimizations(Quad *qptr);
static void control_flow_optimizations(Quad *qptr);
static void copy_propagation(Quad *qptr);
static void arithmetic_optimizations(Quad *qptr);
static void peephole_optimizations(Quad *qptr);
static void dead_code_elimination(Quad *qptr);
static void compute_defuse(BasicBlock *block, int size);
static void compute_liveness(int numvars);
static int deadcode_rec(CFGILink *link, BitVec *LIVE);

static BitVec *new_bitvec(int size);
static BitVec *bv_copy(BitVec *other);
static void bv_set(BitVec *bv, int index, unsigned char val);
static int bv_get(BitVec *bv, int index);
static BitVec *bv_and_negate(BitVec *a, BitVec *b);
static BitVec *bv_or(BitVec *a, BitVec *b);
static int bv_equal(BitVec *a, BitVec *b);
static void bv_free(BitVec *bv);

/*
 * final code generation
 */
static void gen_mips_move(Quad *qptr);
static void gen_mips_arith(Quad *qptr);
static void gen_mips_goto(Quad *qptr);
static void gen_mips_if(Quad *qptr);
static void gen_mips_label(Quad *qptr);
static void gen_mips_enter(Quad *qptr);
static void gen_mips_leave(Quad *qptr);
static void gen_mips_param(Quad *qptr);
static void gen_mips_call(Quad *qptr);
static void gen_mips_ret(Quad *qptr);
static void gen_mips_retrieve(Quad *qptr);
static void gen_mips_load(Operand *src, char *reg_prefix, int dstreg);
static void gen_mips_store(Operand *dst, char *reg_prefix, int srcreg);
static void print_fixed_MIPS_code();

static void print_3addr_ins_no_nl(Quad *ins);
static void print_string_table();
void printb(BitVec *bv);

/*
 * mk_intcon_op(numval) -- create an operand with optype INTEGER and value numval.
 */
static Operand *mk_intcon_op(int numval);

/*
 * mk_stptr_op(stptr) -- create an operand with optype SYMTBL_PTR and value stptr.
 */
static Operand *mk_stptr_op(symtabnode *stptr);

/*
 * mk_insptr_op(insptr) -- create an operand with optype INS_PTR and value insptr.
 */
static Operand *mk_insptr_op(Quad *insptr);

/*
 * mk_addr_op(insptr) -- create an operand with optype ADDR and value stptr.
 */
static Operand *mk_addr_op(symtabnode *stptr);

/*
 * mk_deref_op(insptr) -- create an operand with optype DEREF and value stptr.
 */
static Operand *mk_deref_op(symtabnode *stptr);

/*
 * mk_expr_op(sptr) -- If sptr has type t_Char or t_Int, creates and returns a 
 * SYMTBL_PTR operand.  If sptr has type t_Addr, creates and returns a DEREF op.
 */
static Operand *mk_expr_op(symtabnode *stptr);

/*
 * If ast is an array expression, gen_3addr_code will generate code to compute
 * its address.  deref_lvalue() adds a dereference instruction at the end.
 */
static void deref_lvalue(tnode *ast);

/*
 * new_instr(op, src1, src2, dst) -- create a new three-address instruction 
 * (i.e., a Quad data structure), set its fields to the arguments given, and 
 * return the result.
 */
static Quad *new_instr(Op op, Operand *src1, Operand *src2, Operand *dst);
static Quad *new_instr_cfg(Op op, Operand *src1, Operand *src2, Operand *dst, bool leader, BasicBlock *block);

static symtabnode *new_temp(int type);

static Quad *new_label();

/*******************************************************************************
 *                                                                             *
 *                                STRING TABLE                                 #
 *                                                                             *
 *******************************************************************************/

typedef struct strtab_node
{
    char *str;
    char *str_lbl; /* the label used to refer to this string */
    struct strtab_node *next;
} StrTabNode;

static int str_lbl_ctr = 0; /* counter for string labels */
static StrTabNode *string_tbl = NULL, *str_tmp;

/*******************************************************************************
 *                                                                             *
 *                           TOP-LEVEL CODE GENERATION                         *
 *                                                                             *
 *******************************************************************************/

/*
 * gen_code(ast, sptr) -- given the AST ast and symbol table pointer sptr for a
 * function definition, generate 3-address code for it, then use the generated 
 * 3-address code to generate MIPS asm code that is written out to stdout.
 */
void gen_code(tnode *ast, symtabnode *sptr)
{
    curr_fn_symtbl = sptr;
    gen_3addr_code_funcbody(ast);
    gen_optimizations(ast->code_hd);
    gen_mips_code(ast);
}

static void gen_optimizations(Quad *qptr)
{
    if (olocal_flag)
        control_flow_optimizations(qptr);
    if (olocal_flag || oglobal_flag)
        gen_cfg(qptr);
    if (olocal_flag)
        copy_propagation(qptr);
    if (oglobal_flag)
        dead_code_elimination(qptr);
    if (olocal_flag)
        arithmetic_optimizations(qptr);
}

/* 
 * gen_code_global() -- generates global code sequences that need to be generated
 * only once.  This consists of:
 *    -- .space declarations for global variables
 *    -- code for the println() function
 *    -- the jump from main to _main
 */
void gen_code_global()
{
    print_globals();
    print_string_table();
    print_fixed_MIPS_code();
}

/*******************************************************************************
 *                                                                             *
 *                         THREE-ADDRESS CODE GENERATION                       *
 *                                                                             *
 *******************************************************************************/

/*
 * gen_3addr_code(ast) -- given a pointer ast to an AST node, traverse the AST
 * and construct a list of three-address instructions at each node of the AST.
 */
static void gen_3addr_code(tnode *ast)
{
    if (ast == NULL)
    {
        return;
    }

    switch (ast->ntype)
    {
    case FunCall: /* function call */
        gen_3addr_code_funcall(ast);
        break;

    case If: /* if statement */
        gen_3addr_code_if(ast);
        break;

    case While: /* while statement */
        gen_3addr_code_while(ast);
        break;

    case For:
        gen_3addr_code_for(ast);
        break;

    case Assg: /* assignment statement */
        gen_3addr_code_assg(ast);
        break;

    case Return: /* return statement */
        gen_3addr_code_return(ast);
        break;

    case STnodeList: /* list of AST nodes */
        gen_3addr_code_astlist(ast);
        break;

    case Var: /* identifier */
        gen_3addr_code_id(ast);
        break;

    case ArraySubscript: /* array subscript */
        gen_3addr_code_arraysub(ast);
        break;

    case Intcon:  /* integer constant */
    case Charcon: /* character constant */
        gen_3addr_code_intconst(ast);
        break;

    case Stringcon:
        gen_3addr_code_stringcon(ast);
        break;

    case Plus:        /* + */
    case BinaryMinus: /* - (binary) */
    case Mult:        /* * */
    case Div:         /* / */
    case UnaryMinus:  /* - (unary) */
        gen_3addr_code_arithop(ast);
        break;

    case Equals:     /* == */
    case Neq:        /* != */
    case Leq:        /* <= */
    case Lt:         /* < */
    case Geq:        /* >= */
    case Gt:         /* > */
    case LogicalAnd: /* && */
    case LogicalOr:  /* || */
    case LogicalNot: /* || */
        /*
     * Relational and Boolean operators should be handled while processing
     * IF and WHILE statements, and so should not be encountered here.
     */
        assert(0);
        break;

    default:
        fprintf(stderr, "Unrecognized/unhandled AST node type: %d\n", ast->ntype);
        exit(1);
    }
}

static void gen_3addr_code_funcbody(tnode *ast)
{
    assert(ast != NULL);
    /*
   * generate code for the body
   */
    gen_3addr_code(ast);
    /*
   * create ENTER, LEAVE, and RETURN instructions and stitch them
   * around the code for the body.
   */
    Operand *stptr_op = mk_stptr_op(curr_fn_symtbl);
    Quad *enter_ins = new_instr(ENTER, stptr_op, NULL, NULL);
    Quad *leave_ins = new_instr(LEAVE, stptr_op, NULL, NULL);
    Quad *ret_ins = new_instr(RET, NULL, NULL, NULL);

    if (ast == NULL)
    {
        enter_ins->next = leave_ins;
    }
    else
    {
        enter_ins->next = ast->code_hd;
        ast->code_tl->next = leave_ins;
    }
    leave_ins->next = ret_ins;
    /*
   * set the code pointer(s) for the function definition
   */
    ast->code_hd = enter_ins;
    ast->code_tl = ret_ins;
}

static void gen_3addr_code_funcall(tnode *ast)
{
    assert(ast != NULL && ast->ntype == FunCall);
    Quad *parms_hd = NULL, *parms_tl = NULL, *parm_instr, *call_instr, *retrieve_instr;
    tnode *atmp;
    symtabnode *retval;
    symtabnode *callee = stFunCall_Fun(ast);
    tnode *args = stFunCall_Args(ast);

    gen_3addr_code(args); /* code to evaluate the arguments */
    /*
   * iterate down the expression list and create the param instructions
   */
    for (atmp = stFunCall_Args(ast); atmp != NULL; atmp = stList_Rest(atmp))
    {
        parm_instr = new_instr(PARAM, mk_expr_op(stList_Head(atmp)->place), NULL, NULL);
        if (parms_hd == NULL)
        {
            parms_hd = parms_tl = parm_instr;
        }
        else
        {
            parm_instr->next = parms_hd;
            parms_hd = parm_instr;
        }
    }

    call_instr = new_instr(CALL,
                           mk_stptr_op(callee),
                           mk_intcon_op(callee->nargs),
                           NULL);

    if (callee->ret_type == t_None)
    { /* void */
        retrieve_instr = new_instr(NOP, NULL, NULL, NULL);
    }
    else
    {
        retval = new_temp(t_Int);
        retrieve_instr = new_instr(RETRIEVE, mk_stptr_op(retval), NULL, NULL);
        ast->place = retval;
    }

    if (args != NULL)
    {
        if (args->code_hd != NULL)
        {
            ast->code_hd = args->code_hd;
            args->code_tl->next = parms_hd;
        }
        else
        {
            ast->code_hd = parms_hd;
        }
        parms_tl->next = call_instr;
    }
    else
    {
        ast->code_hd = call_instr;
    }

    call_instr->next = retrieve_instr;
    ast->code_tl = retrieve_instr;
}

static void gen_3addr_code_if(tnode *ast)
{
    assert(ast != NULL && ast->ntype == If);

    Quad *lbl_then = new_label();
    Quad *lbl_else = new_label();
    Quad *lbl_after = new_label();
    Quad *jmp_over = new_instr(GOTO, NULL, NULL, mk_insptr_op(lbl_after));

    gen_3addr_code_boolexp(Child0(ast), lbl_then, lbl_else);
    ast->code_hd = Child0(ast)->code_hd;

    Child0(ast)->code_tl->next = lbl_then;

    if (Child1(ast))
    {
        gen_3addr_code(Child1(ast));
        lbl_then->next = Child1(ast)->code_hd;
        Child1(ast)->code_tl->next = jmp_over;
    }
    else
    {
        lbl_then->next = jmp_over;
    }

    jmp_over->next = lbl_else;

    if (Child2(ast))
    {
        gen_3addr_code(Child2(ast));
        lbl_else->next = Child2(ast)->code_hd;
        Child2(ast)->code_tl->next = lbl_after;
    }
    else
    {
        lbl_else->next = lbl_after;
    }

    ast->code_tl = lbl_after;
}

static void gen_3addr_code_while(tnode *ast)
{
    assert(ast != NULL && ast->ntype == While);

    Quad *lbl_top, *lbl_body, *lbl_after, *br_back;

    lbl_top = new_label();
    lbl_body = new_label();
    lbl_after = new_label();

    br_back = new_instr(GOTO, NULL, NULL, mk_insptr_op(lbl_top));

    gen_3addr_code_boolexp(Child0(ast), lbl_body, lbl_after);
    gen_3addr_code(Child1(ast));

    ast->code_hd = lbl_top;
    lbl_top->next = Child0(ast)->code_hd;
    Child0(ast)->code_tl->next = lbl_body;
    if (Child1(ast)->code_hd != NULL)
    {
        lbl_body->next = Child1(ast)->code_hd;
        Child1(ast)->code_tl->next = br_back;
    }
    else
    {
        lbl_body->next = br_back;
    }
    br_back->next = lbl_after;
    ast->code_tl = lbl_after;
}

static void gen_3addr_code_for(tnode *ast)
{
    assert(ast != NULL && ast->ntype == For);

    tnode *for_init, *for_test, *for_upd, *for_body;

    Quad *lbl_top, *lbl_body, *lbl_after, *br_back;
    Quad *nop0, *nop1, *nop2, *nop3;
    Quad *ch0hd, *ch0tl, *ch1hd, *ch1tl, *ch2hd, *ch2tl, *ch3hd, *ch3tl;

    for_init = stFor_Init(ast);
    for_test = stFor_Test(ast);
    for_upd = stFor_Update(ast);
    for_body = stFor_Body(ast);

    lbl_top = new_label();
    lbl_body = new_label();
    lbl_after = new_label();

    br_back = new_instr(GOTO, NULL, NULL, mk_insptr_op(lbl_top));

    if (for_init != NULL)
    {
        gen_3addr_code(for_init);
        ch0hd = for_init->code_hd;
        ch0tl = for_init->code_tl;
    }
    else
    {
        nop0 = new_instr(NOP, NULL, NULL, NULL);
        ch0hd = ch0tl = nop0;
    }

    if (for_test != NULL)
    {
        gen_3addr_code_boolexp(for_test, lbl_body, lbl_after);
        ch1hd = for_test->code_hd;
        ch1tl = for_test->code_tl;
    }
    else
    {
        nop1 = new_instr(NOP, NULL, NULL, NULL);
        ch1hd = ch1tl = nop1;
    }

    if (for_upd != NULL)
    {
        gen_3addr_code(for_upd);
        ch2hd = for_upd->code_hd;
        ch2tl = for_upd->code_tl;
    }
    else
    {
        nop2 = new_instr(NOP, NULL, NULL, NULL);
        ch2hd = ch2tl = nop2;
    }

    if (for_body != NULL)
    {
        gen_3addr_code(for_body);
        ch3hd = for_body->code_hd;
        ch3tl = for_body->code_tl;
    }
    else
    {
        nop3 = new_instr(NOP, NULL, NULL, NULL);
        ch3hd = ch3tl = nop3;
    }

    ast->code_hd = ch0hd;
    ch0tl->next = lbl_top;

    lbl_top->next = ch1hd;
    ch1tl->next = lbl_body;

    lbl_body->next = ch3hd;
    ch3tl->next = ch2hd;

    ch2tl->next = br_back;

    br_back->next = lbl_after;
    ast->code_tl = lbl_after;
}

static void gen_3addr_code_assg(tnode *ast)
{
    assert(ast != NULL && ast->ntype == Assg);

    gen_3addr_code(Child0(ast)); /* LHS of the assignment */
    gen_3addr_code(Child1(ast)); /* RHS of the assignment */

    Quad *qptr = new_instr(MOVE,
                           mk_expr_op(Child1(ast)->place), /* src1 */
                           NULL,                           /* src2 */
                           mk_expr_op(Child0(ast)->place)  /* dst */
    );

    if (Child0(ast)->code_hd == NULL)
    {
        ast->code_hd = ast->code_tl = qptr;
    }
    else
    {
        ast->code_hd = Child0(ast)->code_hd;
        Child0(ast)->code_tl->next = Child1(ast)->code_hd;
        Child1(ast)->code_tl->next = qptr;
        ast->code_tl = qptr;
    }
}

static void gen_3addr_code_return(tnode *ast)
{
    assert(ast != NULL && ast->ntype == Return);

    Quad *qptr_leave = new_instr(LEAVE, mk_stptr_op(curr_fn_symtbl), NULL, NULL);
    Quad *qptr_ret = new_instr(RET, NULL, NULL, NULL);
    Quad *cvt_type;
    symtabnode *ret_val;

    qptr_leave->next = qptr_ret;

    if (Child0(ast))
    {
        gen_3addr_code(Child0(ast));
        /*
     * add type conversion code if necessary
     */
        if (curr_fn_symtbl->ret_type != Child0(ast)->place->type)
        {
            ret_val = new_temp(curr_fn_symtbl->ret_type);
            cvt_type = new_instr(MOVE,
                                 mk_stptr_op(Child0(ast)->place), /* src1 */
                                 NULL,                            /* src2 */
                                 mk_stptr_op(ret_val)             /* dst */
            );
            qptr_ret->src1 = mk_stptr_op(ret_val);
            ast->code_hd = Child0(ast)->code_hd;
            Child0(ast)->code_tl->next = cvt_type;
            cvt_type->next = qptr_leave;
        }
        else
        {
            qptr_ret->src1 = mk_stptr_op(Child0(ast)->place);
            ast->code_hd = Child0(ast)->code_hd;
            Child0(ast)->code_tl->next = qptr_leave;
        }
        ast->code_tl = qptr_ret;
    }
    else
    {
        ast->code_hd = qptr_leave;
        ast->code_tl = qptr_ret;
    }
}

static void gen_3addr_code_astlist(tnode *ast)
{
    tnode *ast0, *ast1, *ast2;

    assert(ast != NULL && ast->ntype == STnodeList);

    /*
   * first pass: iterate over the AST list generating 3-address
   * code for each element of the list.
   */
    for (ast0 = ast; ast0 != NULL; ast0 = Child1(ast0))
    {
        gen_3addr_code(Child0(ast0));
    }

    ast->code_hd = Child0(ast)->code_hd;

    /*
   * second pass: iterate over the AST list and chain together
   * their 3-addr code lists.
   */
    for (ast0 = ast; ast0 != NULL; ast0 = Child1(ast0))
    {
        ast1 = Child0(ast0);
        if (Child1(ast0) == NULL)
        { /* last node in the AST list */
            ast->code_tl = ast1->code_tl;
        }
        else
        {
            ast2 = Child0(Child1(ast0));
            ast1->code_tl->next = ast2->code_hd;
        }
    }
}

static void gen_3addr_code_id(tnode *ast)
{
    assert(ast != NULL && ast->ntype == Var);

    ast->code_hd = ast->code_tl = new_instr(NOP, NULL, NULL, NULL);
    ast->place = stVar(ast);
}

static void gen_3addr_code_intconst(tnode *ast)
{
    assert(ast != NULL && (ast->ntype == Intcon || ast->ntype == Charcon));

    symtabnode *lhs = new_temp(t_Int);
    Quad *qptr = new_instr(MOVE,
                           mk_intcon_op(ConstVal(ast)), /* src1 */
                           NULL,                        /* src2 */
                           mk_stptr_op(lhs)             /* dst */
    );
    ast->place = lhs;
    ast->code_hd = ast->code_tl = qptr;
}

static void gen_3addr_code_stringcon(tnode *ast)
{
    char strbuf[60], *strptr;
    symtabnode *sptr;
    Quad *instr;

    /* add the string to the string table */
    str_tmp = zalloc(sizeof(StrTabNode));
    str_tmp->str = stStringcon(ast);
    snprintf(strbuf, 60, "__Str%d", str_lbl_ctr++);
    strptr = strdup(strbuf);
    str_tmp->str_lbl = strptr;
    str_tmp->next = string_tbl;
    string_tbl = str_tmp;
    /*
   * add an entry to the global symbol table for the string with name =
   * the string label (but with the leading underscore removed, since that gets
   * added on when the label is referenced) and type = array of char.  
   * Set the skip_print field of the symbol table entry since the string label 
   * will be printed when the string table is dumped.
   */
    sptr = SymTabInsert(strptr + 1, Global);
    sptr->type = t_Array;
    sptr->elt_type = t_Char;
    sptr->num_elts = strlen(1 + str_tmp->str_lbl); /* add 1 for the trailing NUL */
    sptr->skip_print = 1;

    instr = new_instr(NOP, NULL, NULL, NULL);
    ast->code_hd = ast->code_tl = instr;

    ast->place = sptr;
}

static void gen_3addr_code_arraysub(tnode *ast)
{
    assert(ast != NULL && ast->ntype == ArraySubscript);

    symtabnode *disp_loc, *addr_loc;
    Quad *qptr_addr, *qptr_mul, *qptr_add;

    tnode *idx = stArraySubscript_Subscript(ast);
    symtabnode *sptr = stArraySubscript_Array(ast);
    int width = sptr->elt_type == t_Char ? 1 : 4;

    addr_loc = new_temp(t_Addr);
    addr_loc->elt_type = sptr->elt_type;

    disp_loc = new_temp(t_Int);

    gen_3addr_code(idx);
    if (idx->ntype == ArraySubscript)
    {
        deref_lvalue(idx);
    }
    /*
   * Since arrays are passed by reference, if sptr is a formal parameter then it
   * already contains the address of the array.
   */
    if (sptr->scope == Local && sptr->formal)
    {
        qptr_addr = new_instr(MOVE,
                              mk_stptr_op(sptr),
                              NULL,
                              mk_stptr_op(addr_loc));
    }
    else
    {
        qptr_addr = new_instr(MOVE,
                              mk_addr_op(sptr),
                              NULL,
                              mk_stptr_op(addr_loc));
    }

    qptr_mul = new_instr(MUL_OP,
                         mk_stptr_op(idx->place),
                         mk_intcon_op(width),
                         mk_stptr_op(disp_loc));
    qptr_add = new_instr(ADD_OP,
                         mk_stptr_op(addr_loc),
                         mk_stptr_op(disp_loc),
                         mk_stptr_op(addr_loc));

    /* ast->place: the location where the address of the array element will be computed */
    ast->place = addr_loc;
    ast->code_hd = idx->code_hd;
    idx->code_tl->next = qptr_addr;
    qptr_addr->next = qptr_mul;
    qptr_mul->next = qptr_add;
    ast->code_tl = qptr_add;
}

static void gen_3addr_code_arithop(tnode *ast)
{
    Quad *arith_inst;
    Op op;
    Operand *src1, *src2;

    ast->place = new_temp(t_Int);
    gen_3addr_code(Child0(ast));
    if (Child0(ast)->ntype == ArraySubscript)
    {
        deref_lvalue(Child0(ast));
    }

    src1 = mk_stptr_op(Child0(ast)->place);

    if (ast->ntype == UnaryMinus)
    {
        op = UMINUS_OP;
        src2 = NULL;
    }
    else
    {
        op = ast_binop(ast->ntype);
        gen_3addr_code(Child1(ast));
        if (Child1(ast)->ntype == ArraySubscript)
        {
            deref_lvalue(Child1(ast));
        }

        src2 = mk_stptr_op(Child1(ast)->place);
    }

    arith_inst = new_instr(op, src1, src2, mk_stptr_op(ast->place));

    if (ast->ntype == UnaryMinus)
    {
        Child0(ast)->code_tl->next = arith_inst;
    }
    else
    {
        Child0(ast)->code_tl->next = Child1(ast)->code_hd;
        Child1(ast)->code_tl->next = arith_inst;
    }

    ast->code_hd = Child0(ast)->code_hd;
    ast->code_tl = arith_inst;
}

static void gen_3addr_code_boolexp(tnode *ast, Quad *true_lbl, Quad *false_lbl)
{
    Quad *mid_lbl;
    Op op;

    assert(ast != NULL);

    switch (ast->ntype)
    {
    case Equals:
    case Neq:
    case Leq:
    case Lt:
    case Geq:
    case Gt:
        op = ast_binop(ast->ntype);

        gen_3addr_code(Child0(ast));
        if (Child0(ast)->ntype == ArraySubscript)
        {
            deref_lvalue(Child0(ast));
        }

        gen_3addr_code(Child1(ast));
        if (Child1(ast)->ntype == ArraySubscript)
        {
            deref_lvalue(Child1(ast));
        }

        Quad *ins1 = new_instr(op,
                               mk_stptr_op(Child0(ast)->place), /* src1 */
                               mk_stptr_op(Child1(ast)->place), /* src1 */
                               mk_insptr_op(true_lbl)           /* dst */
        );
        Quad *ins2 = new_instr(GOTO, NULL, NULL, mk_insptr_op(false_lbl));

        if (Child0(ast)->code_hd != NULL)
        {
            ast->code_hd = Child0(ast)->code_hd;
            if (Child1(ast)->code_hd != NULL)
            {
                Child0(ast)->code_tl->next = Child1(ast)->code_hd;
                Child1(ast)->code_tl->next = ins1;
            }
            else
            {
                Child0(ast)->code_tl->next = ins1;
            }
        }
        else
        {
            if (Child1(ast)->code_hd != NULL)
            {
                ast->code_hd = Child1(ast)->code_hd;
                Child1(ast)->code_tl->next = ins1;
            }
            else
            {
                ast->code_hd = ins1;
            }
        }

        ins1->next = ins2;
        ast->code_tl = ins2;
        break;

    case LogicalAnd:
        mid_lbl = new_label();
        gen_3addr_code_boolexp(Child0(ast), mid_lbl, false_lbl);
        gen_3addr_code_boolexp(Child1(ast), true_lbl, false_lbl);
        ast->code_hd = Child0(ast)->code_hd;
        Child0(ast)->code_tl->next = mid_lbl;
        mid_lbl->next = Child1(ast)->code_hd;
        ast->code_tl = Child1(ast)->code_tl;
        break;

    case LogicalOr:
        mid_lbl = new_label();
        gen_3addr_code_boolexp(Child0(ast), true_lbl, mid_lbl);
        gen_3addr_code_boolexp(Child1(ast), true_lbl, false_lbl);
        ast->code_hd = Child0(ast)->code_hd;
        Child0(ast)->code_tl->next = mid_lbl;
        mid_lbl->next = Child1(ast)->code_hd;
        ast->code_tl = Child1(ast)->code_tl;
        break;

    case LogicalNot:
        gen_3addr_code_boolexp(Child0(ast), false_lbl, true_lbl);
        ast->code_hd = Child0(ast)->code_hd;
        ast->code_tl = Child0(ast)->code_tl;
        break;

    default:
        fprintf(stderr, "*** [%s] Unrecognized/unhandled AST nodetype %d\n",
                __func__,
                ast->ntype);
        exit(1);
    }
}

static Op ast_binop(SyntaxNodeType ntype)
{
    switch (ntype)
    {
    case Equals:
        return IF_EQ;
    case Neq:
        return IF_NE;
    case Leq:
        return IF_LE;
    case Lt:
        return IF_LT;
    case Geq:
        return IF_GE;
    case Gt:
        return IF_GT;
    case Plus:
        return ADD_OP;
    case BinaryMinus:
        return SUB_OP;
    case Mult:
        return MUL_OP;
    case Div:
        return DIV_OP;
    case UnaryMinus:
        return UMINUS_OP;
    default:
        fprintf(stderr, "*** [%s] Unrecognized/unhandled AST nodetype %d\n",
                __func__,
                ntype);
        exit(1);
    }
}

/*******************************************************************************
 *                                                                             *
 *                               CFG IMPLEMENTATION                            *
 *                                                                             *
 *******************************************************************************/

static BBList *bblist_hd;
static BBList *bblist_tl;

/*
 * creates the basic block structure of a CFG for a specific function.
 */
static void gen_cfg(Quad *fn_head)
{

    // pass 1: set all of the leaders in the function
    Quad *curr = fn_head;
    while (curr != NULL)
    {
        switch (curr->op)
        {
        case IF_EQ:
        case IF_NE:
        case IF_LE:
        case IF_LT:
        case IF_GE:
        case IF_GT:
        case GOTO:
            curr->dst->val.insptr->leader = 1;
            curr->next->leader = 1;
            break;
        case ENTER:
            curr->leader = 1;
            break;
        }
        curr = curr->next;
    }

    bblist_hd = NULL;
    bblist_tl = NULL;

    // pass 2: assign blocks to each instruction
    BasicBlock *block = NULL;
    curr = fn_head;
    while (curr != NULL)
    {
        if (curr->leader)
        {
            block = new_block();
            if (bblist_hd == NULL)
            {
                bblist_hd = zalloc(sizeof(BBList));
                bblist_tl = bblist_hd;
            }
            else
            {
                bblist_tl->next = zalloc(sizeof(BBList));
                bblist_tl = bblist_tl->next;
            }
            bblist_tl->block = block;
        }
        bb_add_ins(block, curr);
        curr = curr->next;
    }

    // pass 3: construct the graph
    curr = fn_head;
    while (curr != NULL)
    {
        if (curr->next != NULL && curr->next->leader)
        {
            switch (curr->op)
            {
            case IF_EQ:
            case IF_NE:
            case IF_LE:
            case IF_LT:
            case IF_GE:
            case IF_GT:
                bb_add_block(curr->block, curr->next->block);
                bb_add_block(curr->block, curr->dst->val.insptr->block);
                break;
            case GOTO:
                bb_add_block(curr->block, curr->dst->val.insptr->block);
                break;
            default:
                bb_add_block(curr->block, curr->next->block);
                break;
            }
        }
        curr = curr->next;
    }
}

static int bb_num = 0;

static BasicBlock *new_block()
{
    BasicBlock *block = zalloc(sizeof(BasicBlock));
    block->num = bb_num++;
    block->ilinks = NULL;
    block->blinks = NULL;
    block->pre_blinks = NULL;
    block->printed = 0;
    return block;
}

static void bb_add_ins(BasicBlock *block, Quad *qptr)
{
    qptr->block = block;
    if (block->ilinks == NULL)
        block->ilinks = new_cfgi(qptr, 0);
    else
        cfgi_add_ins(block->ilinks, qptr);
}

static void bb_add_block(BasicBlock *block, BasicBlock *other)
{
    bb_add_pre_block(other, block);
    if (block->blinks == NULL)
        block->blinks = new_cfgb(other);
    else
        cfgb_add_block(block->blinks, other);
}

static void bb_add_pre_block(BasicBlock *block, BasicBlock *other)
{
    if (block->pre_blinks == NULL)
        block->pre_blinks = new_cfgb(other);
    else
        cfgb_add_block(block->pre_blinks, other);
}

static CFGILink *new_cfgi(Quad *qptr, int num)
{
    CFGILink *link = zalloc(sizeof(CFGILink));
    link->ins = qptr;
    link->next = NULL;
    link->defnum = num;
    return link;
}

static void cfgi_add_ins(CFGILink *link, Quad *qptr)
{
    if (link->next != NULL)
        cfgi_add_ins(link->next, qptr);
    else
        link->next = new_cfgi(qptr, 0);
}

static CFGBLink *new_cfgb(BasicBlock *block)
{
    CFGBLink *link = zalloc(sizeof(CFGBLink));
    link->block = block;
    link->next = NULL;
    return link;
}

static void cfgb_add_block(CFGBLink *link, BasicBlock *block)
{
    if (link->next != NULL)
        cfgb_add_block(link->next, block);
    else
        link->next = new_cfgb(block);
}

/*******************************************************************************
 *                                                                             *
 *                               CODE OPTIMIZATIONS                            *
 *                                                                             *
 *******************************************************************************/

static int is_def(Op op)
{
    switch (op)
    {
    case MUL_OP:
    case DIV_OP:
    case ADD_OP:
    case SUB_OP:
    case MOVE:
    // case RETRIEVE:
    case UMINUS_OP:
        return 1;
    }
    return 0;
}

static int operands_equal(Operand *a, Operand *b)
{
    if (a == NULL || b == NULL)
        return 0;
    if (a->optype == INTEGER || a->optype == INS_PTR || b->optype == INTEGER || b->optype == INS_PTR)
        return 0;
    return !(strcmp(a->val.stptr->name, b->val.stptr->name));
}

static Op opposite_op(Op op)
{
    switch (op)
    {
    case IF_EQ:
        return IF_NE;
    case IF_NE:
        return IF_EQ;
    case IF_GT:
        return IF_LE;
    case IF_LE:
        return IF_GT;
    case IF_LT:
        return IF_GE;
    case IF_GE:
        return IF_LT;
    case MUL_OP:
        return DIV_OP;
    case DIV_OP:
        return MUL_OP;
    case ADD_OP:
        return SUB_OP;
    case SUB_OP:
        return ADD_OP;
    }
    return NOP;
}

static void copy_propagation(Quad *fn_head)
{
    Quad *curr = fn_head;
    while (curr != NULL)
    {
        switch (curr->op)
        {
        case MOVE:;
            // COPY INS
            Operand *lhs = curr->dst;
            Operand *rhs = curr->src1;

            if (lhs->val.stptr->type == t_Char && (rhs->optype != SYMTBL_PTR || rhs->val.stptr->type != t_Char))
                break;

            Quad *propagating_curr = curr->next;
            while (propagating_curr != NULL && propagating_curr->block->num == curr->block->num)
            {

                // find & replace uses
                if (operands_equal(lhs, propagating_curr->src1) &&
                    !(is_def(propagating_curr->op) && lhs->val.stptr->type == t_Int && propagating_curr->dst->val.stptr->type == t_Char))
                    propagating_curr->src1 = rhs;
                if (operands_equal(lhs, propagating_curr->src2) &&
                    !(is_def(propagating_curr->op) && lhs->val.stptr->type == t_Int && propagating_curr->dst->val.stptr->type == t_Char))
                    propagating_curr->src2 = rhs;

                // check if redefined
                if (lhs->val.stptr->scope == Global && propagating_curr->op == CALL)
                    break;
                if (is_def(propagating_curr->op))
                {
                    Operand *def = propagating_curr->dst;
                    if (operands_equal(lhs, def))
                        break;
                    if (operands_equal(rhs, def))
                        break;
                }
                propagating_curr = propagating_curr->next;
            }

            break;
        default:
            break;
        }
        curr = curr->next;
    }
}

static void control_flow_optimizations(Quad *fn_head)
{
    Quad *curr = fn_head;
    while (curr != NULL)
    {
        switch (curr->op)
        {
        case IF_EQ:
        case IF_NE:
        case IF_LE:
        case IF_LT:
        case IF_GE:
        case IF_GT:
            // control flow improvement
            if (curr->next != NULL && curr->next->op == GOTO)
            {
                Operand *dst = curr->next->dst;
                if (curr->next->next != NULL && curr->next->next->op == LABEL && curr->dst->val.insptr->src1->val.numval == curr->next->next->src1->val.numval)
                {
                    curr->op = opposite_op(curr->op);
                    curr->dst = dst;
                    curr->next = curr->next->next;
                }
            }
            break;
        default:
            break;
        }
        curr = curr->next;
    }
}

static void arithmetic_optimizations(Quad *fn_head)
{
    // peephole optimizations!!

    Quad *curr = fn_head;
    while (curr != NULL)
    {
        switch (curr->op)
        {
        case ADD_OP:
            // arithmetic simplification

            if (curr->src1->optype == INTEGER && curr->src2->optype == INTEGER)
            {
                curr->op = MOVE;
                curr->src1 = mk_intcon_op(curr->src1->val.numval + curr->src2->val.numval);
                curr->src2 = NULL;
            }
            else if (curr->src1->optype == INTEGER && curr->src1->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src1 = curr->src2;
                curr->src2 = NULL;
            }
            else if (curr->src2->optype == INTEGER && curr->src2->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            break;
        case SUB_OP:
            // arithmetic simplification
            if (curr->src1->optype == INTEGER && curr->src2->optype == INTEGER)
            {
                curr->op = MOVE;
                curr->src1 = mk_intcon_op(curr->src1->val.numval - curr->src2->val.numval);
                curr->src2 = NULL;
            }
            else if (curr->src1->optype == INTEGER && curr->src1->val.numval == 0)
            {
                curr->op = UMINUS_OP;
                curr->src1 = curr->src2;
                curr->src2 = NULL;
            }
            else if (curr->src2->optype == INTEGER && curr->src2->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            break;
        case MUL_OP:
            // arithmetic simplification
            if (curr->src1->optype == INTEGER && curr->src2->optype == INTEGER)
            {
                curr->op = MOVE;
                curr->src1 = mk_intcon_op(curr->src1->val.numval * curr->src2->val.numval);
                curr->src2 = NULL;
            }
            else if (curr->src1->optype == INTEGER && curr->src1->val.numval == 1)
            {
                curr->op = MOVE;
                curr->src1 = curr->src2;
                curr->src2 = NULL;
            }
            else if (curr->src2->optype == INTEGER && curr->src2->val.numval == 1)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            else if (curr->src1->optype == INTEGER && curr->src1->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            else if (curr->src2->optype == INTEGER && curr->src2->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src1 = curr->src2;
                curr->src2 = NULL;
            }
            break;
        case DIV_OP:
            // arithmetic simplification
            if (curr->src1->optype == INTEGER && curr->src2->optype == INTEGER && curr->src2->val.numval != 0)
            {
                curr->op = MOVE;
                curr->src1 = mk_intcon_op(curr->src1->val.numval / curr->src2->val.numval);
                curr->src2 = NULL;
            }
            else if (curr->src1->optype == INTEGER && curr->src1->val.numval == 0)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            else if (curr->src2->optype == INTEGER && curr->src2->val.numval == 1)
            {
                curr->op = MOVE;
                curr->src2 = NULL;
            }
            break;
        }
        curr = curr->next;
    }
}

static void dead_code_elimination(Quad *fn_head)
{
    // set variable positions
    int numvars = 0;
    Quad *curr_ins = fn_head;
    while (curr_ins != NULL)
    {
        switch (curr_ins->op)
        {
        case MOVE:
        case UMINUS_OP:
            if (curr_ins->src1->optype != INTEGER && curr_ins->src1->val.stptr->func_pos == -1)
                curr_ins->src1->val.stptr->func_pos = numvars++;
            if (curr_ins->dst->val.stptr->func_pos == -1)
                curr_ins->dst->val.stptr->func_pos = numvars++;
            break;
        case IF_EQ:
        case IF_NE:
        case IF_LE:
        case IF_LT:
        case IF_GE:
        case IF_GT:
            if (curr_ins->src1->optype != INTEGER && curr_ins->src1->val.stptr->func_pos == -1)
                curr_ins->src1->val.stptr->func_pos = numvars++;
            if (curr_ins->src2->optype != INTEGER && curr_ins->src2->val.stptr->func_pos == -1)
                curr_ins->src2->val.stptr->func_pos = numvars++;
            break;
        case PARAM:
        case RET:
            if (curr_ins->src1 != NULL && curr_ins->src1->optype != INTEGER && curr_ins->src1->val.stptr->func_pos == -1)
                curr_ins->src1->val.stptr->func_pos = numvars++;
            break;
        case ADD_OP:
        case SUB_OP:
        case MUL_OP:
        case DIV_OP:
            if (curr_ins->src1->optype != INTEGER && curr_ins->src1->val.stptr->func_pos == -1)
                curr_ins->src1->val.stptr->func_pos = numvars++;
            if (curr_ins->src2->optype != INTEGER && curr_ins->src2->val.stptr->func_pos == -1)
                curr_ins->src2->val.stptr->func_pos = numvars++;
            if (curr_ins->dst->val.stptr->func_pos == -1)
                curr_ins->dst->val.stptr->func_pos = numvars++;
            break;
        }
        curr_ins = curr_ins->next;
    }

    // def use!
    BBList *bblist = bblist_hd;
    while (bblist != NULL)
    {
        compute_defuse(bblist->block, numvars);
        bblist->block->in = new_bitvec(numvars);
        bblist->block->out = new_bitvec(numvars);
        bblist = bblist->next;
    }

    int chg = 1;
    while (chg)
    {
        chg = 0;
        // liveness analysis (in/out)
        compute_liveness(numvars);
        // pt 2
        BBList *bblist = bblist_hd;
        while (bblist != NULL)
        {
            chg = deadcode_rec(bblist->block->ilinks, bv_copy(bblist->block->out));
            bblist = bblist->next;
        }
    }

    // Quad *curr = fn_head;
    // while (curr != NULL && curr->next != NULL)
    // {
    //     if (!curr->next->live)
    //         curr->next = curr->next->next;
    //     else
    //         curr = curr->next;
    // }
    Quad *curr = fn_head;
    while (curr != NULL)
    {
        if (!curr->live)
            curr->op = NOP;
        curr = curr->next;
    }
}

static int deadcode_rec(CFGILink *link, BitVec *LIVE)
{
    if (link == NULL)
        return 0;

    // PROCESS NEXT FIRST
    int out = deadcode_rec(link->next, LIVE);

    // NOW PROCESS THIS INSTR
    Quad *ins = link->ins;
    if (!ins->live)
        return out;

    symtabnode *x = NULL;
    symtabnode *y = NULL;
    symtabnode *z = NULL;

    switch (ins->op)
    {
    case MOVE:
    case UMINUS_OP:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        x = ins->dst->val.stptr;
        break;
    case IF_EQ:
    case IF_NE:
    case IF_LE:
    case IF_LT:
    case IF_GE:
    case IF_GT:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        if (ins->src2->optype != INTEGER)
            z = ins->src2->val.stptr;
        break;
    case PARAM:
    case RET:
        if (ins->src1 != NULL && ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        break;
    case ADD_OP:
    case SUB_OP:
    case MUL_OP:
    case DIV_OP:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        if (ins->src2->optype != INTEGER)
            z = ins->src2->val.stptr;
        x = ins->dst->val.stptr;
        break;
    }
    if (x != NULL && ins->dst->optype == DEREF)
    {
        // printf("# DEREF IS %s\n", ins->dst->val.stptr->name);
        bv_set(LIVE, x->func_pos, 1);
    }
    if (x != NULL && !bv_get(LIVE, x->func_pos))
    {
        ins->live = 0;
        return 1;
    }

    if (x != NULL && ins->dst->optype != DEREF)
        bv_set(LIVE, x->func_pos, 0);
    if (y != NULL)
        bv_set(LIVE, y->func_pos, 1);
    if (z != NULL)
        bv_set(LIVE, z->func_pos, 1);

    return out;
}

static void compute_liveness(int numvars)
{
    BBList *bblist = bblist_hd;
    while (bblist != NULL)
    {
        bv_free(bblist->block->in);
        bblist->block->in = bv_copy(bblist->block->use);
        bblist = bblist->next;
    }

    BitVec *tmp;

    int chg = 1;
    while (chg)
    {
        chg = 0;

        bblist = bblist_hd;
        while (bblist != NULL)
        {
            // out[B] = U { in[X] | X is a successor of B }
            BasicBlock *block = bblist->block;
            BitVec *oldout = block->out;
            block->out = new_bitvec(numvars);
            CFGBLink *cfgb = block->blinks;
            while (cfgb != NULL)
            {
                tmp = bv_or(block->out, cfgb->block->in);
                bv_free(block->out);
                block->out = tmp;
                cfgb = cfgb->next;
            }

            // in[B] = use[B] U (out[B] - def[B])
            bv_free(block->in);
            tmp = bv_and_negate(block->out, block->def);
            block->in = bv_or(block->use, tmp);

            if (!bv_equal(block->out, oldout))
                chg = 1;

            bblist = bblist->next;
        }
    }
}

static void compute_defuse_rec(CFGILink *link, BitVec *D, BitVec *U)
{
    if (link == NULL)
        return;

    // PROCESS NEXT FIRST
    compute_defuse_rec(link->next, D, U);

    // NOW PROCESS THIS INSTR
    Quad *ins = link->ins;

    symtabnode *x = NULL;
    symtabnode *y = NULL;
    symtabnode *z = NULL;

    switch (ins->op)
    {
    case MOVE:
    case UMINUS_OP:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        x = ins->dst->val.stptr;
        break;
    case IF_EQ:
    case IF_NE:
    case IF_LE:
    case IF_LT:
    case IF_GE:
    case IF_GT:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        if (ins->src2->optype != INTEGER)
            z = ins->src2->val.stptr;
        break;
    case PARAM:
    case RET:
        if (ins->src1 != NULL && ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        break;
    case ADD_OP:
    case SUB_OP:
    case MUL_OP:
    case DIV_OP:
        if (ins->src1->optype != INTEGER)
            y = ins->src1->val.stptr;
        if (ins->src2->optype != INTEGER)
            z = ins->src2->val.stptr;
        x = ins->dst->val.stptr;
        break;
    }

    if (x != NULL)
        bv_set(D, x->func_pos, 1);
    if (y != NULL)
        bv_set(D, y->func_pos, 0);
    if (z != NULL)
        bv_set(D, z->func_pos, 0);

    if (x != NULL)
        bv_set(U, x->func_pos, 0);
    if (y != NULL)
        bv_set(U, y->func_pos, 1);
    if (z != NULL)
        bv_set(U, z->func_pos, 1);
}

static void compute_defuse(BasicBlock *block, int size)
{
    BitVec *D = new_bitvec(size);
    BitVec *U = new_bitvec(size);

    compute_defuse_rec(block->ilinks, D, U);

    block->def = D;
    block->use = U;
}

/*******************************************************************************
 *                                                                             *
 *                           BIT VECTOR IMPLEMENTATION                         *
 *                                                                             *
 *******************************************************************************/

static BitVec *new_bitvec(int size)
{
    BitVec *out = zalloc(sizeof(BitVec));
    out->size = size;
    if (out->size > 0)
        out->bits = zalloc(sizeof(unsigned char) * out->size);
    int i;
    for (i = 0; i < out->size; i++)
        out->bits[i] = 0;
    return out;
}

static BitVec *bv_copy(BitVec *other)
{
    BitVec *out = zalloc(sizeof(BitVec));
    out->size = other->size;
    if (out->size > 0)
        out->bits = zalloc(sizeof(unsigned char) * other->size);
    int i;
    for (i = 0; i < other->size; i++)
        out->bits[i] = other->bits[i];
    return out;
}

static void bv_set(BitVec *bv, int index, unsigned char val)
{
    bv->bits[index] = val;
}

static int bv_get(BitVec *bv, int index)
{
    return bv->bits[index];
}

/*
 * 
 */
static BitVec *bv_and_negate(BitVec *a, BitVec *b)
{
    a = bv_copy(a);
    int i;
    for (i = 0; i < a->size; i++)
        a->bits[i] = a->bits[i] & ~b->bits[i];
    return a;
}

/*
 * 
 */
static BitVec *bv_or(BitVec *a, BitVec *b)
{
    a = bv_copy(a);
    int i;
    for (i = 0; i < a->size; i++)
        a->bits[i] = a->bits[i] | b->bits[i];
    return a;
}

static int bv_equal(BitVec *a, BitVec *b)
{
    int i;
    for (i = 0; i < a->size; i++)
        if (a->bits[i] && !b->bits[i] || !a->bits[i] && b->bits[i])
            return 0;
    return 1;
}

static void bv_free(BitVec *bv)
{
    if (bv->size > 0)
        free(bv->bits);
    free(bv);
}

/*******************************************************************************
 *                                                                             *
 *                             FINAL CODE GENERATION                           *
 *                                                                             *
 *******************************************************************************/

#define LABEL_PREFIX "Lbl"

/*
 * LoadIns[] and StoreIns[] are indexed by the type of the location being accessed,
 * and give the MIPS instruction for accessing a location of that type.
 */
static char *LoadIns[3] = {"lb", "lw", "lw"};
static char *StoreIns[3] = {"sb", "sw", "sw"};

/*
 * gen_mips_code() -- takes a pointer to a function definition AST that has been
 * decorated with three-address instructions, and emits MIPS instructions for them.
 */
static void gen_mips_code(tnode *ast)
{
    symtabnode *sptr = curr_fn_symtbl;
    Quad *qptr;

    assert(ast != NULL);

    sptr->offset = allocate_storage(sptr);

    printf(".text\n");
    dump_fn_info(curr_fn_symtbl);
    // if (olocal_flag || oglobal_flag)
    //     print_cfg();
    printf("_%s:\n", sptr->name);

    for (qptr = ast->code_hd; qptr != NULL; qptr = qptr->next)
    {
        if (olocal_flag || oglobal_flag)
        {
            if (qptr->leader)
                printf("    # -LEADER- block (%d)\n", qptr->block->num);
            else
                printf("    # block (%d)\n", qptr->block->num);
            if (!qptr->live)
                printf("    # !! DEAD !! \n");
        }
        printf("    # ");
        print_3addr_ins(qptr);

        switch (qptr->op)
        {
        case NOP:
            /* do nothing -- no code to generate */
            break;

        case MOVE:
            gen_mips_move(qptr);
            break;

        case GOTO:
            gen_mips_goto(qptr);
            break;

        case IF_EQ:
        case IF_NE:
        case IF_LE:
        case IF_LT:
        case IF_GE:
        case IF_GT:
            gen_mips_if(qptr);
            break;

        case ADD_OP:
        case SUB_OP:
        case MUL_OP:
        case DIV_OP:
        case UMINUS_OP:
            gen_mips_arith(qptr);
            break;

        case LABEL:
            gen_mips_label(qptr);
            break;

        case ENTER:
            gen_mips_enter(qptr);
            break;

        case LEAVE:
            gen_mips_leave(qptr);
            break;

        case PARAM:
            gen_mips_param(qptr);
            break;

        case CALL:
            gen_mips_call(qptr);
            break;

        case RET:
            gen_mips_ret(qptr);
            break;

        case RETRIEVE:
            gen_mips_retrieve(qptr);
            break;

        default:
            fprintf(stderr, "*** [%s] Unrecognized op: %d\n", __func__, qptr->op);
            exit(1);
        }
        printf("\n");
    }
    printf("# end function %s\n\n", sptr->name);
}

static void gen_mips_move(Quad *qptr)
{
    assert(qptr->dst->optype == SYMTBL_PTR || qptr->dst->optype == DEREF);
    symtabnode *stptr = (qptr->dst->val).stptr;

    gen_mips_load(qptr->src1, "t", 0);

    switch (qptr->dst->optype)
    {
    case SYMTBL_PTR:
        switch (stptr->scope)
        {
        case Local:
            printf("    %s $t0, %d($fp)\t# %s\n", StoreIns[stptr->type], stptr->offset, stptr->name);
            break;

        case Global:
            printf("    %s $t0, _%s\n", StoreIns[stptr->type], stptr->name);
            break;

        default:
            fprintf(stderr, "*** [%s] Unrecognized symbol table scope: %d\n",
                    __func__,
                    stptr->scope);
            exit(1);
        }
        break;

    case DEREF:
        switch (stptr->scope)
        {
        case Local:
            printf("    lw $t1, %d($fp)\t# %s\n", stptr->offset, stptr->name);
            printf("    %s $t0, 0($t1)\t# deref(%s)\n", StoreIns[stptr->elt_type], stptr->name);
            break;

        case Global:
            printf("    lw $t1, _%s\n", stptr->name);
            printf("    %s $t0, 0($t1)\n", StoreIns[stptr->elt_type]);
            break;

        default:
            fprintf(stderr, "*** [%s] Unrecognized symbol table scope: %d\n",
                    __func__,
                    stptr->scope);
            exit(1);
        }
        break;

    default:
        fprintf(stderr, "*** [%s] Unrecognized dst optype: %d\n",
                __func__,
                qptr->dst->optype);
        exit(1);
    }
}

static void gen_mips_arith(Quad *qptr)
{
    char *mips_op;

    switch (qptr->op)
    {
    case ADD_OP:
        mips_op = "add";
        break;
    case SUB_OP:
        mips_op = "sub";
        break;
    case MUL_OP:
        mips_op = "mul";
        break;
    case DIV_OP:
        mips_op = "div";
        break;
    case UMINUS_OP:
        mips_op = "neg";
        break;
    default:
        mips_op = "???";
    }

    gen_mips_load(qptr->src1, "t", 0);
    if (qptr->op == UMINUS_OP)
    {
        printf("    %s $t2, $t0\n", mips_op);
    }
    else
    {
        gen_mips_load(qptr->src2, "t", 1);
        printf("    %s $t2, $t0, $t1\n", mips_op);
    }

    gen_mips_store(qptr->dst, "t", 2);
}

static void gen_mips_goto(Quad *qptr)
{
    int label_no;
    Quad *dstins = (qptr->dst->val).insptr;

    label_no = (dstins->src1->val).numval;
    printf("    j %s%d\n", LABEL_PREFIX, label_no);
}

static void gen_mips_if(Quad *qptr)
{
    char *mips_op;
    int label_no;

    gen_mips_load(qptr->src1, "t", 0);
    gen_mips_load(qptr->src2, "t", 1);

    switch (qptr->op)
    {
    case IF_EQ:
        mips_op = "eq";
        break;
    case IF_NE:
        mips_op = "ne";
        break;
    case IF_LE:
        mips_op = "le";
        break;
    case IF_LT:
        mips_op = "lt";
        break;
    case IF_GE:
        mips_op = "ge";
        break;
    case IF_GT:
        mips_op = "gt";
        break;
    default:
        mips_op = "???";
    }

    Quad *dstins = (qptr->dst->val).insptr;
    label_no = (dstins->src1->val).numval;

    printf("    b%s $t%d, $t%d, %s%d\n", mips_op, 0, 1, LABEL_PREFIX, label_no);
}

static void gen_mips_label(Quad *qptr)
{
    int label_no = (qptr->src1->val).numval;
    printf("%s%d:\n", LABEL_PREFIX, label_no);
}

static void gen_mips_enter(Quad *qptr)
{
    symtabnode *sptr = qptr->src1->val.stptr;

    printf("    la $sp, -8($sp)    # allocate space for old $fp and $ra\n");
    printf("    sw $fp, 4($sp)     # save old $fp\n");
    printf("    sw $ra, 0($sp)     # save old $ra\n");
    printf("    la $fp, 0($sp)     # $fp := $sp\n");
    printf("    la $sp, -%d($sp)   # allocate stack frame\n", sptr->offset);
}

static void gen_mips_leave(Quad *qptr)
{
    /* restore callee-saved registers -- ignore for CSC 453 */
}

static void gen_mips_param(Quad *qptr)
{
    gen_mips_load(qptr->src1, "t", 0);
    printf("    la $sp, -4($sp)\n");
    printf("    sw $t0, 0($sp)\n");
}

static void gen_mips_call(Quad *qptr)
{
    printf("    jal _%s\n", (qptr->src1->val).stptr->name);
    printf("    la $sp, %d($sp)\n", 4 * (qptr->src2->val).numval);
}

static void gen_mips_ret(Quad *qptr)
{
    if (qptr->src1 != NULL)
    {
        gen_mips_load(qptr->src1, "v", 0);
    }

    printf("    la $sp, 0($fp)     # deallocate locals\n");
    printf("    lw $ra, 0($sp)     # restore return address\n");
    printf("    lw $fp, 4($sp)     # restore frame pointer\n");
    printf("    la $sp, 8($sp)     # restore stack pointer\n");
    printf("    jr $ra\n");
}

static void gen_mips_retrieve(Quad *qptr)
{
    gen_mips_store(qptr->src1, "v", 0);
}

static void gen_mips_load(Operand *src, char *reg_prefix, int dstreg)
{
    symtabnode *sptr;
    int type;

    switch (src->optype)
    {
    case INTEGER:
        printf("    li $%s%d, %d\n", reg_prefix, dstreg, src->val.numval);
        break;

    case SYMTBL_PTR:
        sptr = src->val.stptr;
        type = sptr->type;

        if (sptr->scope == Global)
        {
            printf("    %s $%s%d, _%s\n",
                   LoadIns[type], reg_prefix, dstreg, sptr->name);
        }
        else
        {
            assert(sptr->scope == Local);
            if (type == t_Array && sptr->formal)
            {
                /*
	 * arrays are passed by reference, so the value passed is the address
	 */
                type = t_Addr;
            }

            printf("    %s $%s%d, %d($fp)\t# %s\n",
                   LoadIns[type], reg_prefix, dstreg, sptr->offset, sptr->name);
        }
        break;

    case ADDR:
        sptr = src->val.stptr;
        if (sptr->scope == Global)
        {
            printf("    la $%s%d, _%s\n", reg_prefix, dstreg, sptr->name);
        }
        else
        {
            assert(sptr->scope == Local);
            if (sptr->formal)
            {
                /*
	 * arrays are passed by reference, so the value passed is the address
	 */
                printf("    lw $%s%d, %d($fp)\t# addr(%s)\n",
                       reg_prefix,
                       dstreg,
                       sptr->offset,
                       sptr->name);
            }
            else
            {
                printf("    la $%s%d, %d($fp)\t# addr(%s)\n",
                       reg_prefix,
                       dstreg,
                       sptr->offset,
                       sptr->name);
            }
        }
        break;

    case DEREF:
        sptr = src->val.stptr;
        if (sptr->scope == Global)
        {
            printf("    lw $%s%d, _%s\n", reg_prefix, dstreg, sptr->name);
            printf("    %s $%s%d, 0(%s%d)\t# deref(%s)\n",
                   LoadIns[sptr->elt_type], reg_prefix, dstreg, reg_prefix, dstreg, sptr->name);
        }
        else
        {
            assert(sptr->scope == Local);
            printf("    lw $%s%d, %d($fp)\t# %s\n",
                   reg_prefix, dstreg, sptr->offset, sptr->name);
            printf("    %s $%s%d, 0($%s%d)\t# deref(%s)\n",
                   LoadIns[sptr->elt_type], reg_prefix, dstreg, reg_prefix, dstreg, sptr->name);
        }
        break;

    default:
        fprintf(stderr, "ERROR [%s]: Unrecognized operand type %d\n",
                __func__, src->optype);
        exit(1);
    }
}

static void gen_mips_store(Operand *dst, char *reg_prefix, int srcreg)
{
    symtabnode *sptr;

    switch (dst->optype)
    {
    case SYMTBL_PTR:
        sptr = dst->val.stptr;
        if (sptr->scope == Global)
        {
            printf("    %s $%s%d, _%s\n",
                   StoreIns[sptr->type], reg_prefix, srcreg, sptr->name);
        }
        else
        {
            assert(sptr->scope == Local);
            printf("    %s $%s%d, %d($fp)\t# %s\n",
                   StoreIns[sptr->type], reg_prefix, srcreg, sptr->offset, sptr->name);
        }
        break;

    default:
        fprintf(stderr, "ERROR [%s]: Unrecognized operand type %d\n",
                __func__, dst->optype);
        exit(1);
    }
}

/*******************************************************************************
 *                                                                             *
 *                                  UTILITIES                                  *
 *                                                                             *
 *******************************************************************************/

char *op_names[] = {
    "no_op",
    "move",
    "goto",
    "if_eq",
    "if_ne",
    "if_le",
    "if_lt",
    "if_ge",
    "if_gt",
    "label",
    "enter",
    "leave",
    "param",
    "call",
    "ret",
    "retrieve",
    "add",
    "sub",
    "mul",
    "div",
    "uminus",
};

/*
 * mk_intcon_op(numval) -- create an operand with optype INTEGER and value numval.
 */
static Operand *mk_intcon_op(int numval)
{
    Operand *otmp = zalloc(sizeof(Operand));
    otmp->optype = INTEGER;
    otmp->val.numval = numval;
    return otmp;
}

/*
 * mk_stptr_op(stptr) -- create an operand with optype SYMTBL_PTR and value stptr.
 */
static Operand *mk_stptr_op(symtabnode *stptr)
{
    Operand *otmp = zalloc(sizeof(Operand));
    otmp->optype = SYMTBL_PTR;
    otmp->val.stptr = stptr;
    return otmp;
}

/*
 * mk_insptr_op(insptr) -- create an operand with optype INS_PTR and value insptr.
 */
static Operand *mk_insptr_op(Quad *insptr)
{
    Operand *otmp = zalloc(sizeof(Operand));
    otmp->optype = INS_PTR;
    otmp->val.insptr = insptr;
    return otmp;
}

/*
 * mk_addr_op(insptr) -- create an operand with optype ADDR and value stptr.
 */
static Operand *mk_addr_op(symtabnode *stptr)
{
    Operand *otmp = zalloc(sizeof(Operand));
    otmp->optype = ADDR;
    otmp->val.stptr = stptr;
    return otmp;
}

/*
 * mk_deref_op(insptr) -- create an operand with optype DEREF and value stptr.
 */
static Operand *mk_deref_op(symtabnode *stptr)
{
    Operand *otmp = zalloc(sizeof(Operand));
    otmp->optype = DEREF;
    otmp->val.stptr = stptr;
    return otmp;
}

/*
 * mk_expr_op(sptr) -- If sptr has type t_Char or t_Int, creates and returns a 
 * SYMTBL_PTR operand.  If sptr has type t_Addr, creates and returns a DEREF op.
 */
static Operand *mk_expr_op(symtabnode *stptr)
{
    switch (stptr->type)
    {
    case t_Char:
    case t_Int:
        return mk_stptr_op(stptr);

    case t_Addr:
        return mk_deref_op(stptr);

    case t_Array:
        return mk_addr_op(stptr);

    default:
        fprintf(stderr, "ERROR [%s]: Unrecognized optype %d\n", __func__, stptr->type);
        exit(1);
    }
}

/*
 * new_instr(op, src1, src2, dst) -- create a new three-address instruction 
 * (i.e., a Quad data structure), set its fields to the arguments given, and 
 * return the result.
 */
static Quad *new_instr(Op op, Operand *src1, Operand *src2, Operand *dst)
{
    Quad *qtmp = zalloc(sizeof(Quad));
    qtmp->op = op;
    qtmp->src1 = src1;
    qtmp->src2 = src2;
    qtmp->dst = dst;
    qtmp->leader = 0;
    qtmp->live = 1;
    qtmp->block = NULL;
    return qtmp;
}

/*
 * If ast is an array expression, gen_3addr_code will generate code to compute
 * its address.  deref_lvalue() adds a dereference instruction at the end.
 */
static void deref_lvalue(tnode *ast)
{
    symtabnode *ast_val, *array;
    Quad *deref_ins;

    if (ast->ntype == ArraySubscript)
    {
        array = stArraySubscript_Array(ast);
        ast_val = new_temp(array->elt_type);
        deref_ins = new_instr(MOVE,
                              mk_deref_op(ast->place),
                              NULL,
                              mk_stptr_op(ast_val));

        /* add deref_ins to the end of ast's instruction list */
        ast->code_tl->next = deref_ins;
        ast->code_tl = deref_ins;
        ast->place = ast_val;
    }
}

#define MAX_TMP_NAMELEN 20
static int tmpname_ctr = 0;

static symtabnode *new_temp(int type)
{
    char tmp_name_buf[MAX_TMP_NAMELEN];
    snprintf(tmp_name_buf, MAX_TMP_NAMELEN, "tmp$%d", tmpname_ctr++);
    symtabnode *stptr = SymTabInsert(strdup(tmp_name_buf), Local);
    stptr->type = type;
    return stptr;
}

static int label_ctr = 0;

static Quad *new_label()
{
    return new_instr(LABEL, mk_intcon_op(label_ctr++), NULL, NULL);
}

/*******************************************************************************
 *                                                                             *
 *                                 PRINT ROUTINES                              *
 *                                                                             *
 *******************************************************************************/

// void printb(unsigned int v)
// {
//     unsigned int i, s = 1 << ((sizeof(v) << 3) - 1); // s = only most significant bit at 1
//     for (i = s; i; i >>= 1)
//         printf("%d", v & i || 0);
// }
void printb(BitVec *bv)
{
    int i;
    for (i = 0; i < bv->size; i++)
        printf("%d", bv->bits[i] || 0);
}

static void print_cfg()
{
    BBList *curr = bblist_hd;

    while (curr != NULL)
    {
        BasicBlock *block = curr->block;
        printf("# block %d (def=", block->num);
        printb(block->def);
        printf(", use=");
        printb(block->use);
        printf(", in=");
        printb(block->in);
        printf(", out=");
        printb(block->out);
        printf(") -> ");
        CFGBLink *child = block->blinks;
        while (child != NULL)
        {
            printf("%d ", child->block->num);
            child = child->next;
        }
        printf("\n");
        curr = curr->next;
    }
}

static void print_3addr_op(Operand *operand)
{
    if (operand == NULL)
    {
        return;
    }

    switch (operand->optype)
    {
    case INTEGER:
        printf("%d", operand->val.numval);
        break;

    case SYMTBL_PTR:
        printf("%s", (operand->val.stptr)->name);
        break;

    case INS_PTR:
        print_3addr_ins_no_nl(operand->val.insptr);
        break;

    case ADDR:
        printf("addr(%s)", (operand->val.stptr)->name);
        break;

    case DEREF:
        printf("deref(%s)", (operand->val.stptr)->name);
        break;

    default:
        fprintf(stderr, "*** [%s] Unrecognized operand type: %d\n",
                __func__,
                operand->optype);
    }
}

static void print_3addr_ins_no_nl(Quad *ins)
{
    assert(ins != NULL);

    printf("%s ", op_names[ins->op]);
    print_3addr_op(ins->src1);

    if (ins->src1 != NULL && (ins->src2 != NULL || ins->dst != NULL))
    {
        printf(", ");
    }

    print_3addr_op(ins->src2);

    if (ins->src2 != NULL && ins->dst != NULL)
    {
        printf(", ");
    }

    print_3addr_op(ins->dst);
}

void print_3addr_ins(Quad *ins)
{
    print_3addr_ins_no_nl(ins);
    printf("\n");
}

void print_3addr_inslist(Quad *inslist)
{
    while (inslist != NULL)
    {
        print_3addr_ins(inslist);
        inslist = inslist->next;
    }
}

/*
 * print_fixed_MIPS_code() prints out some necessary fixd MIPS code: the 
 * instructions for the println function, and the initial jump to _main
 */
static void print_fixed_MIPS_code()
{
    printf(".align 2\n");
    printf(".data\n");
    printf("__nl: .asciiz \"\\n\"\n");
    printf(".align 2\n");
    printf(".text\n");
    printf("# println: print out an integer followed by a newline\n");
    printf(" _println:\n");
    printf("    li $v0, 1\n");
    printf("    lw $a0, 0($sp)\n");
    printf("    syscall\n");
    printf("    li $v0, 4\n");
    printf("    la $a0, __nl\n");
    printf("    syscall\n");
    printf("    jr $ra\n");
    printf("\n");
    printf("# jump to _main, where user code starts, at start of execution\n");
    printf("main:\n");
    printf("    j _main\n");
    printf("\n");
}

/*
 * print_string_table() -- print out the string table
 */
static void print_string_table()
{
    for (str_tmp = string_tbl; str_tmp != NULL; str_tmp = str_tmp->next)
    {
        printf("%s: .asciiz \"%s\"\n", str_tmp->str_lbl, str_tmp->str);
    }
}
