

#ifndef _QUAD_H_
#define _QUAD_H_

#include "symbol-table.h"

typedef enum QuadInstr
{
    QI__Error,       // not sure if this is necessary
    QI__Noop,        // noop
    QI__Global,      // global id type (id is int, char, array[n] of int, array[n] of char)
    QI__Add,         // x := y + z
    QI__Sub,         // x := y - z
    QI__Mul,         // x := y * z
    QI__Div,         // x := y / z
    QI__Uminus,      // x := -y
    QI__Assg,        // x := y
    QI__DerefL,      // x := y
    QI__DerefR,      // x := y
    QI__Goto,        // goto label
    QI__If_gt,       // if x >  val, goto label
    QI__If_ge,       // if x >= val, goto label
    QI__If_lt,       // if x <  val, goto label
    QI__If_le,       // if x <= val, goto label
    QI__If_ee,       // if x == val, goto label
    QI__If_ne,       // if x != val, goto label
    QI__Label,       // label L
    QI__Enter,       // enter f
    QI__Leave,       // leave f
    QI__Param,       // param x
    QI__Call,        // call p, n
    QI__Return_none, // return
    QI__Return_val,  // return x
    QI__Retrieve     // retrieve x
} QuadInstr;

typedef enum OperandType
{
    OT__none,
    OT__st_entry,
    OT__intconst,
    OT__string
} OperandType;

typedef struct Operand
{
    OperandType type;
    union {
        int intconst;
        symtabnode *entry;
        char *str;
    } val;
} Operand;

typedef struct Quad
{
    QuadInstr type;
    Operand src1;
    Operand src2;
    Operand dest;
    struct Quad *next;
} Quad;

extern Operand OPERAND_NONE;

Quad *quad_get_last(Quad *);
Quad *quad_concat(Quad *, Quad *);
void free_quad(Quad *);

Operand operand_st(symtabnode *);
Operand operand_intconst(int);
Operand operand_strconst(char *);

#endif