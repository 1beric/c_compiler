

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mips-gen.h"
#include "global.h"
#include "threeac-gen.h"
#include "quad.h"

static int printfunc_flag = 0;
char *to_link = ".align 2\n.data\n__nl :.asciiz \"\\n\"\n.align 2\n.text\n#println : print out an integer followed by a newline\n_println :\nli $v0, 1\nlw $a0, 0($sp)\nsyscall\nli $v0, 4\nla $a0, __nl\nsyscall\njr $ra\n";

symtabnode *function_st;
int data_flag = 0;

int param_align = 0;

void print_gs(symtabnode *t)
{
    if (t->global_printed)
        return;
    if (!data_flag)
    {
        printf("\n.data\n");
        data_flag = 1;
    }
    printf(".align 2\n\n");

    if (t->type == t_Int)
        printf("_%s: .space 4\n", t->name);
    if (t->type == t_Char)
        printf("_%s: .space 1\n", t->name);
    t->global_printed = 1;
}

void gen_printfunc()
{
    printf("%s\n\n", to_link);
    printfunc_flag = 1;
    data_flag = 0;
}

void genCode(tnode *t, char *name)
{
    if (!printfunc_flag)
        gen_printfunc();

    PrintGlobals(print_gs);

    if (data_flag)
    {
        printf(".text\n.align 2\n\n");
        data_flag = 0;
    }

    function_st = SymTabLookup(name, Global);

    Quad *instr_arr = gen3ac(t, name);

    if (!strcmp("main", name))
        printf("\nmain:\nj _main\n");

    while (instr_arr != NULL)
    {
        // printf("quad.h:%d\n", instr_arr->type + 10);

        print3ac(instr_arr);
        printMips(instr_arr);
        printf("\n");
        instr_arr = instr_arr->next;
    }
    printf("\n");
}

char *op(QuadInstr type)
{
    switch (type)
    {
    case QI__Add:
        return "+";
    case QI__Sub:
    case QI__Uminus:
        return "-";
    case QI__Mul:
        return "*";
    case QI__Div:
        return "/";
    case QI__If_ge:
        return ">=";
    case QI__If_gt:
        return ">";
    case QI__If_le:
        return "<=";
    case QI__If_lt:
        return "<";
    case QI__If_ee:
        return "==";
    case QI__If_ne:
        return "!=";
    }
}

void print3ac(Quad *instr)
{
    switch (instr->type)
    {
    case QI__Error:
        printf("# error!!\n");
        break;
    case QI__Noop:
        printf("# noop\n");
        break;
    case QI__Add:
    case QI__Sub:
    case QI__Mul:
    case QI__Div:
        printf("# _%s = _%s", instr->dest.val.entry->name, instr->src1.val.entry->name);
        printf(" %s _%s\n", op(instr->type), instr->src2.val.entry->name);
        break;
    case QI__Uminus:
        printf("# _%s =  %s(_%s)\n", instr->dest.val.entry->name, op(instr->type), instr->src1.val.entry->name);
        break;
    case QI__Assg:
        if (instr->src1.type == OT__intconst)
            printf("# _%s = %d\n", instr->dest.val.entry->name, instr->src1.val.intconst);
        else
            printf("# _%s = _%s\n", instr->dest.val.entry->name, instr->src1.val.entry->name);
    case QI__DerefL:
        if (instr->src1.type == OT__intconst)
            printf("# *_%s = %d\n", instr->dest.val.entry->name, instr->src1.val.intconst);
        else
            printf("# *_%s = _%s\n", instr->dest.val.entry->name, instr->src1.val.entry->name);
    case QI__DerefR:
        if (instr->src1.type == OT__intconst)
            printf("# _%s = *%d\n", instr->dest.val.entry->name, instr->src1.val.intconst);
        else
            printf("# _%s = *_%s\n", instr->dest.val.entry->name, instr->src1.val.entry->name);
        break;
    case QI__If_gt:
        printf("# if (_%s > _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__If_ge:
        printf("# if (_%s >= _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__If_lt:
        printf("# if (_%s < _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__If_le:
        printf("# if (_%s <= _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__If_ee:
        printf("# if (_%s == _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__If_ne:
        printf("# if (_%s != _%s) goto _L%d\n", instr->src1.val.entry->name, instr->src2.val.entry->name, instr->dest.val.intconst);
        break;
    case QI__Goto:
        printf("# goto __L%d\n", instr->dest.val.intconst);
        break;
    case QI__Label:
        printf("# __L%d:\n", instr->dest.val.intconst);
        break;
    case QI__Enter:
        printf("# enter _%s\n", instr->dest.val.entry->name);
        break;
    case QI__Leave:
        printf("# leave _%s\n", instr->dest.val.entry->name);
        break;
    case QI__Param:
        if (instr->dest.type == OT__intconst)
            printf("# param %d\n", instr->dest.val.intconst);
        else
            printf("# param _%s\n", instr->dest.val.entry->name);
        break;
    case QI__Call:
        printf("# call _%s %d\n", instr->dest.val.entry->name, instr->src1.val.intconst);
        break;
    case QI__Return_none:
        printf("# return\n");
        break;
    case QI__Return_val:
        printf("# return _%s\n", instr->src1.val.entry->name);
        break;
    case QI__Retrieve:
        printf("# retrieve _%s\n", instr->src1.val.entry->name);
        break;
    }
}

int frame_offset(symtabnode *t)
{
    return GetFrameOffset(t, function_st);
}

char *mips_op(QuadInstr type)
{
    switch (type)
    {
    case QI__Add:
        return "add";
    case QI__Sub:
        return "sub";
    case QI__Mul:
        return "mul";
    case QI__Div:
        return "div";
    case QI__If_ge:
        return "ge";
    case QI__If_gt:
        return "gt";
    case QI__If_le:
        return "le";
    case QI__If_lt:
        return "lt";
    case QI__If_ee:
        return "eq";
    case QI__If_ne:
        return "ne";
    }
}

void ls_symtabnode(symtabnode *t, char *reg, char ls)
{
    if (t->scope == Global)
    {
        if (t->type == t_Char)
            printf("%cb %s, _%s\n", ls, reg, t->name);
        else if (t->type == t_Int)
            printf("%cw %s, _%s\n", ls, reg, t->name);
    }
    else
    {
        if (t->type == t_Char)
            printf("%cb %s, %d($fp)\n", ls, reg, frame_offset(t));
        else if (t->type == t_Int)
            printf("%cw %s, %d($fp)\n", ls, reg, frame_offset(t));
    }
}

int get_local_stack_bytes(symtabnode *t)
{
    return GetTotalLocalBytes();
}

int get_formal_bytes(symtabnode *t)
{
    int bytes = 0;
    symtabnode *formal = NULL;
    for (formal = t->formals; formal != NULL; formal = formal->next)
    {
        if (formal->type == t_Char)
            bytes += 1;
        else if (formal->type == t_Int)
        {
            while (bytes % 4 != 0)
                bytes++;
            bytes += 4;
        }
    }
    while (bytes % 4 != 0)
        bytes++;
    return bytes;
}

void printMips(Quad *instr)
{
    switch (instr->type)
    {
    case QI__Error:
        break;
    case QI__Noop:
        break;
    case QI__Assg:
        if (instr->src1.type == OT__intconst)
            printf("li $t1, %d\n", instr->src1.val.intconst);
        else
            ls_symtabnode(instr->src1.val.entry, "$t1", 'l');
        ls_symtabnode(instr->dest.val.entry, "$t1", 's');
        break;
    case QI__Add:
    case QI__Sub:
    case QI__Mul:
    case QI__Div:
        ls_symtabnode(instr->src1.val.entry, "$t1", 'l');
        ls_symtabnode(instr->src2.val.entry, "$t2", 'l');
        printf("%s $t3, $t1, $t2\n", mips_op(instr->type));
        ls_symtabnode(instr->dest.val.entry, "$t3", 's');
        break;
    case QI__Uminus:
        ls_symtabnode(instr->src1.val.entry, "$t1", 'l');
        printf("neg $t2, $t1\n");
        ls_symtabnode(instr->dest.val.entry, "$t2", 's');
        break;
    case QI__If_gt:
    case QI__If_ge:
    case QI__If_lt:
    case QI__If_le:
    case QI__If_ee:
    case QI__If_ne:
        ls_symtabnode(instr->src1.val.entry, "$t0", 'l');
        ls_symtabnode(instr->src2.val.entry, "$t1", 'l');
        printf("b%s $t0, $t1, __L%d\n", mips_op(instr->type), instr->dest.val.intconst);
        break;
    case QI__Goto:
        printf("j __L%d\n", instr->dest.val.intconst);
        printf("nop\n");
        break;
    case QI__Label:
        printf("__L%d:\n", instr->dest.val.intconst);
        break;
    case QI__Enter:
        // printf("# enter _%s\n", instr->dest.val.entry->name);

        printf("_%s:\n", instr->dest.val.entry->name);
        printf("la $sp, -8($sp)     # allocate space for old $fp and $ra\n");
        printf("sw $fp, 4($sp)      # save old $fp\n");
        printf("sw $ra, 0($sp)      # save return address\n");
        printf("la $fp, 0($sp)      # set up frame pointer\n");
        int bytes = get_local_stack_bytes(instr->dest.val.entry);
        if (bytes != 0)
            printf("la $sp, -%d($sp)    # allocate stack frame\n", bytes);
        break;
    case QI__Leave:
        printf("la $sp, 0($fp)      # (deallocate locals)\n");
        printf("lw $ra, 0($sp)      # (restore return address)\n");
        printf("lw $fp, 4($sp)      # (restore frame pointer)\n");
        printf("la $sp, 8($sp)      # (restore stack pointer)\n");
        printf("jr $ra              # (return)\n");
        break;
    case QI__Param:
        ls_symtabnode(instr->dest.val.entry, "$t1", 'l');
        // if (instr->dest.type == OT__intconst || instr->dest.val.entry->type == t_Int)
        // {
        //     printf("la $sp, %d($sp)\n", -4 - ((4 - param_align) % 4));
        //     printf("sw $t1, 0($sp)\n");
        //     param_align = 0;
        // }
        // else if (instr->dest.val.entry->type == t_Char)
        // {
        //     printf("la $sp, -1($sp)\n");
        //     printf("sb $t1, 0($sp)\n");
        //     param_align++;
        // }
        printf("la $sp, -4($sp)\n");
        printf("sw $t1, 0($sp)\n");
        break;
    case QI__Call:
        // printf("# call _%s %d\n", instr->dest.val.entry->name, instr->src1.val.intconst);
        // if (param_align % 4 != 0)
        //     printf("la $sp, -%d($sp)\n", 4 - (param_align % 4));
        // param_align = 0;
        printf("jal _%s\n", instr->dest.val.entry->name);
        // printf("la $sp, %d($sp)\n", get_formal_bytes(instr->dest.val.entry));
        printf("la $sp, %d($sp)\n", instr->src1.val.intconst * 4);
        break;
    case QI__Return_none:
        // nothing!
        break;
    case QI__Return_val:
        ls_symtabnode(instr->src1.val.entry, "$v0", 'l');
        break;
    case QI__Retrieve:
        ls_symtabnode(instr->src1.val.entry, "$v0", 's');
        break;
    }
}