

#include "quad.h"
#include <stdlib.h>
#include <stdarg.h>

Operand OPERAND_NONE = {.type = OT__none, .val = 0};

void free_quad(Quad *quad)
{
    if (quad == NULL)
        return;
    free_quad(quad->next);
    free(quad);
}

Quad *quad_get_last(Quad *quad)
{
    if (quad == NULL)
        return NULL;
    while (quad->next != NULL)
        quad = quad->next;
    return quad;
}

Quad *quad_concat(Quad *first, Quad *second)
{
    if (first == NULL)
        return second;
    Quad *last = quad_get_last(first);
    last->next = second;
    return first;
}

Operand operand_st(symtabnode *entry)
{
    Operand op = {.type = OT__st_entry, .val.entry = entry};
    return op;
}

Operand operand_intconst(int value)
{
    Operand op = {.type = OT__intconst, .val.intconst = value};
    return op;
}

Operand operand_strconst(char *str)
{
    Operand op = {.type = OT__string, .val.str = str};
    return op;
}