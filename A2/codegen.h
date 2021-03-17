/*
 * File: codegen.h
 * Author: Saumya Debray
 * Purpose: typedefs and prototypes for three-address code
 */

#ifndef __CODEGEN_H__
#define __CODEGEN_H__

#include "symbol-table.h"
#include "syntax-tree.h"

/*
 * The enum Op defines the various operations supported in three-address code
 */
typedef enum
{
  NOP,
  MOVE,
  GOTO,
  IF_EQ,
  IF_NE,
  IF_LE,
  IF_LT,
  IF_GE,
  IF_GT,
  LABEL,
  ENTER,
  LEAVE,
  PARAM,
  CALL,
  RET,
  RETRIEVE,
  ADD_OP,
  SUB_OP,
  MUL_OP,
  DIV_OP,
  UMINUS_OP,
} Op;

/*
 * The enum OperandType defines the different kinds of operands a quad can have
 */
typedef enum
{
  INTEGER,    /* the value of an integer constant */
  SYMTBL_PTR, /* symbol table pointer: for locations */
  INS_PTR,    /* pointer to an instruction: for branches */
  ADDR,       /* address-of */
  DEREF       /* dereference */
} OperandType;

typedef struct operand
{
  OperandType optype;
  union
  {
    int numval;
    symtabnode *stptr;
    struct quad *insptr;
  } val;
} Operand;

typedef struct quad
{
  Op op;
  Operand *src1, *src2, *dst;
  bool leader;
  bool live;
  struct block *block;
  struct quad *next;
} Quad;

typedef struct cfgblink
{
  struct block *block;
  struct cfgblink *next;
} CFGBLink;

typedef struct cfgilink
{
  struct quad *ins;
  int defnum; // the def number
  struct cfgilink *next;
} CFGILink;

typedef struct block
{
  int num;
  struct bitvec *def;
  struct bitvec *use;
  struct bitvec *in;
  struct bitvec *out;
  struct cfgilink *ilinks;
  struct cfgblink *blinks;
  struct cfgblink *pre_blinks;
  bool printed;
} BasicBlock;

typedef struct blocklist
{
  struct block *block;
  struct blocklist *next;
} BBList;

typedef struct bitvec
{
  int size;
  unsigned char *bits;
} BitVec;

/********************************* PROTOTYPES *********************************/

void gen_code(tnode *ast, symtabnode *sptr);
void gen_code_global();

void print_3addr_ins(Quad *ins);
void print_3addr_inslist(Quad *inslist);

#endif /* __CODEGEN_H__ */
