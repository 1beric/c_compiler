/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 13 "parser.y" /* yacc.c:339  */

#include "global.h"
#include "error.h"
#include "syntax-tree.h"
#include "symbol-table.h"
#include "codegen.h"

extern int yylex();
extern void yyerror();

/*
 * struct treenode *currfnbodyTree is set to point to the syntax tree for 
 * the body of the current function at the end of each function.  
 * NOTE: the syntax tree MUST be used before CleanupFnInfo() is called at 
 * the end of the function.  After that the symbol table entries for the 
 * local variables of the function will go away, leaving dangling pointers
 * from the syntax tree.
 */
struct treenode *currfnbodyTree = NULL;

extern char *id_name, *yytext;
 extern int ival;
extern int linenum;
char *fnName;
symtabnode *stptr, *currFun;
int CurrType, EltType, fnRetType;
int CurrScope = Global;
llistptr lptr;
bool is_extern;
int errstate = 0;

#line 98 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    INTCON = 259,
    CHARCON = 260,
    STRINGCON = 261,
    CHAR = 262,
    INT = 263,
    VOID = 264,
    EXTERN = 265,
    IF = 266,
    ELSE = 267,
    WHILE = 268,
    FOR = 269,
    RETURN = 270,
    AND = 271,
    OR = 272,
    EQ = 273,
    NEQ = 274,
    LE = 275,
    GE = 276,
    IFX = 277
  };
#endif
/* Tokens.  */
#define ID 258
#define INTCON 259
#define CHARCON 260
#define STRINGCON 261
#define CHAR 262
#define INT 263
#define VOID 264
#define EXTERN 265
#define IF 266
#define ELSE 267
#define WHILE 268
#define FOR 269
#define RETURN 270
#define AND 271
#define OR 272
#define EQ 273
#define NEQ 274
#define LE 275
#define GE 276
#define IFX 277

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 45 "parser.y" /* yacc.c:355  */

  tnptr tptr;
  llistptr idlistptr;
  char *chptr;
  int nval;

#line 189 "y.tab.c" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 204 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  8
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   309

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  39
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  39
/* YYNRULES -- Number of rules.  */
#define YYNRULES  95
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  186

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   277

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    25,     2,     2,     2,     2,     2,     2,
      31,    32,    28,    26,    30,    27,     2,    29,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    33,
      22,    24,    23,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    36,     2,    37,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    34,     2,    35,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    38
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    81,    81,    83,    85,    88,    90,    87,   104,   107,
     109,   118,   118,   119,   123,   135,   136,   140,   141,   145,
     146,   151,   152,   153,   157,   158,   162,   166,   166,   167,
     167,   168,   172,   183,   197,   201,   202,   206,   212,   218,
     224,   248,   249,   250,   251,   252,   260,   261,   261,   265,
     266,   266,   270,   274,   275,   279,   280,   284,   285,   289,
     290,   294,   316,   317,   318,   319,   320,   321,   322,   323,
     324,   325,   329,   330,   331,   332,   333,   334,   335,   336,
     337,   338,   339,   340,   345,   369,   391,   402,   428,   454,
     465,   475,   502,   517,   518,   521
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "INTCON", "CHARCON", "STRINGCON",
  "CHAR", "INT", "VOID", "EXTERN", "IF", "ELSE", "WHILE", "FOR", "RETURN",
  "AND", "OR", "EQ", "NEQ", "LE", "GE", "'<'", "'>'", "'='", "'!'", "'+'",
  "'-'", "'*'", "'/'", "','", "'('", "')'", "';'", "'{'", "'}'", "'['",
  "']'", "IFX", "$accept", "prog", "$@1", "$@2", "Extern", "SetFnInfo",
  "fprotRest", "$@3", "fprototype", "parm_types",
  "nonempty_parm_type_list", "parm_type_decl", "type", "var_decls",
  "var_decl", "id_list", "$@4", "$@5", "id_decl", "ArraySize", "stmt_list",
  "stmt", "semicolon", "$@6", "comma", "$@7", "compound_stmt",
  "optional_else", "optional_assgt", "optional_expr", "optional_boolexp",
  "assignment", "boolexp", "expr", "fun_call", "proc_call", "variable",
  "expr_list", "Ident", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,    60,    62,    61,    33,    43,    45,    42,    47,
      44,    40,    41,    59,   123,   125,    91,    93,   277
};
# endif

#define YYPACT_NINF -122

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-122)))

#define YYTABLE_NINF -95

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     209,  -122,  -122,  -122,  -122,    22,   122,    65,  -122,    54,
      46,  -122,   -18,  -122,    -1,    -8,  -122,  -122,    85,   209,
    -122,  -122,    86,  -122,    54,  -122,  -122,    54,   129,  -122,
      57,   129,  -122,    70,  -122,   105,    77,    20,  -122,    54,
    -122,    79,    62,   122,    97,    29,  -122,  -122,   209,  -122,
    -122,    76,   209,  -122,  -122,    54,  -122,  -122,   187,  -122,
      90,  -122,   109,   113,   114,   251,  -122,    64,    65,   115,
     111,    64,  -122,   117,   117,   131,     6,    29,   129,   238,
     238,    54,  -122,  -122,  -122,   251,   162,   117,   244,  -122,
    -122,    18,   121,    20,  -122,  -122,  -122,  -122,  -122,   156,
    -122,   251,   202,   222,  -122,   132,   238,   148,    11,   280,
      53,   117,  -122,   133,  -122,   138,   219,  -122,   251,   251,
     251,   251,   208,  -122,   209,  -122,   244,   139,  -122,   232,
     144,   141,    91,  -122,  -122,    56,   265,   238,   238,   101,
     251,   251,   251,   251,   251,   251,   101,   238,  -122,  -122,
      52,    52,  -122,  -122,   154,  -122,   155,  -122,  -122,   251,
    -122,  -122,  -122,  -122,  -122,  -122,   179,   244,   244,   244,
     244,   244,   244,  -122,   117,    84,  -122,  -122,  -122,   101,
    -122,    54,  -122,   160,   101,  -122
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       8,    22,    21,    23,     9,     0,     0,     0,     1,     0,
      50,    95,    50,    31,    32,     0,    49,    29,     0,     8,
      27,    10,     0,    10,     0,    51,     2,     0,     0,    34,
       0,     0,    30,    32,    28,    15,     0,    16,    18,     0,
      33,     0,    50,     0,    19,    50,    13,     5,     8,    11,
      17,     0,     8,    25,     3,     0,    20,     4,     0,    10,
       0,    45,     0,     0,     0,    58,    44,     0,     0,     0,
       0,     0,    43,    47,    47,     0,    90,    50,     0,     0,
       0,    56,    81,    82,    83,     0,     0,    47,    57,    77,
      78,    90,     0,    26,    24,     6,    35,    46,    41,     0,
      42,     0,     0,     0,    12,     0,     0,     0,     0,     0,
       0,    47,    55,    90,    72,     0,     0,    40,     0,     0,
       0,     0,     0,    52,     8,    48,    61,     0,    87,    50,
       0,     0,     0,    14,    68,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    60,    80,    79,
      73,    74,    75,    76,     0,    84,     0,     7,    89,     0,
      88,    92,    91,    71,    69,    70,    54,    62,    63,    64,
      65,    66,    67,    38,    47,    59,    86,    85,    93,     0,
      37,    56,    53,     0,     0,    39
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -122,   -14,  -122,  -122,  -122,   -12,   -32,  -122,  -122,   -23,
    -122,   161,    13,  -122,  -122,   142,  -122,  -122,    12,  -122,
     -38,  -121,   -71,  -122,    -6,  -122,  -122,  -122,    16,  -122,
    -122,   -74,   -54,    40,  -122,  -122,   -57,  -113,    -7
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,    53,   124,     6,    28,    48,    55,    59,    36,
      37,    38,     7,    58,    69,    12,    27,    24,    13,    30,
      70,    71,    98,    99,    49,    18,    72,   180,   111,    87,
     174,    73,   108,   109,    89,    74,    90,   130,    91
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      14,    75,    15,   100,    17,    26,    20,   112,    41,   156,
      75,    31,    16,    52,    75,    19,   117,    33,   166,     9,
      33,   -50,     8,    23,    75,   173,   110,   137,   138,    92,
      21,    43,    44,    96,    54,    22,    32,   102,    57,    34,
     147,    39,   103,   139,    39,   104,   178,    77,    60,   122,
      16,    76,   134,   135,   103,   105,    39,    11,   182,    16,
      76,    33,    46,   185,    76,    61,    10,    11,    11,   137,
     138,    68,   137,   138,   113,    62,    16,    63,    64,    65,
     120,   121,    75,   164,   165,   146,    25,    20,   163,    75,
      29,    39,    16,   175,    40,    46,    47,    66,    67,   -36,
     137,   138,    61,   181,    11,    88,    22,   112,   -23,    42,
     157,    45,    62,    56,    63,    64,    65,   118,   119,   120,
     121,    78,    75,   159,    75,   114,   116,    75,   162,     1,
       2,     3,    76,    51,    66,    67,     1,     2,    35,    76,
      79,   126,   129,   132,    80,    81,    95,   136,    94,   115,
      97,    11,    82,    83,    84,   101,   123,   125,   150,   151,
     152,   153,   129,   115,   133,    11,    82,    83,    84,   103,
     148,   158,    76,   106,   113,    85,   160,    76,   161,   107,
     167,   168,   169,   170,   171,   172,   176,   177,    61,    85,
      11,   179,   184,    86,     1,     2,     3,   183,    62,   129,
      63,    64,    65,   127,    50,    11,    82,    83,    84,   154,
      93,    11,    82,    83,    84,     0,     1,     2,     3,     4,
      66,    67,   -36,   131,     0,    11,    82,    83,    84,    85,
       0,     0,     0,    86,   128,    85,     0,     0,     0,    86,
     155,    11,    82,    83,    84,   118,   119,   120,   121,    85,
       0,   149,     0,    86,    11,    82,    83,    84,   118,   119,
     120,   121,    16,   106,   -94,    85,     0,     0,     0,   107,
     118,   119,   120,   121,     0,     0,     0,     0,    85,     0,
       0,     0,    86,   140,   141,   142,   143,   144,   145,     0,
       0,   118,   119,   120,   121,     0,     0,   149,   140,   141,
     142,   143,   144,   145,     0,     0,   118,   119,   120,   121
};

static const yytype_int16 yycheck[] =
{
       7,    58,     9,    74,    10,    19,    12,    81,    31,   122,
      67,    23,    30,    45,    71,    33,    87,    24,   139,     6,
      27,     1,     0,    31,    81,   146,    80,    16,    17,    67,
      31,    37,    39,    71,    48,    36,    24,    31,    52,    27,
     111,    28,    36,    32,    31,    77,   159,    59,    55,    31,
      30,    58,   106,   107,    36,    78,    43,     3,   179,    30,
      67,    68,    33,   184,    71,     1,     1,     3,     3,    16,
      17,    58,    16,    17,    81,    11,    30,    13,    14,    15,
      28,    29,   139,   137,   138,    32,     1,    93,    32,   146,
       4,    78,    30,   147,    37,    33,    34,    33,    34,    35,
      16,    17,     1,   174,     3,    65,    36,   181,     3,    32,
     124,    32,    11,    37,    13,    14,    15,    26,    27,    28,
      29,    31,   179,   129,   181,    85,    86,   184,    37,     7,
       8,     9,   139,    36,    33,    34,     7,     8,     9,   146,
      31,   101,   102,   103,    31,    31,    35,   107,    33,     1,
      33,     3,     4,     5,     6,    24,    35,     1,   118,   119,
     120,   121,   122,     1,    32,     3,     4,     5,     6,    36,
      32,    32,   179,    25,   181,    27,    32,   184,    37,    31,
     140,   141,   142,   143,   144,   145,    32,    32,     1,    27,
       3,    12,    32,    31,     7,     8,     9,   181,    11,   159,
      13,    14,    15,     1,    43,     3,     4,     5,     6,     1,
      68,     3,     4,     5,     6,    -1,     7,     8,     9,    10,
      33,    34,    35,     1,    -1,     3,     4,     5,     6,    27,
      -1,    -1,    -1,    31,    32,    27,    -1,    -1,    -1,    31,
      32,     3,     4,     5,     6,    26,    27,    28,    29,    27,
      -1,    32,    -1,    31,     3,     4,     5,     6,    26,    27,
      28,    29,    30,    25,    32,    27,    -1,    -1,    -1,    31,
      26,    27,    28,    29,    -1,    -1,    -1,    -1,    27,    -1,
      -1,    -1,    31,    18,    19,    20,    21,    22,    23,    -1,
      -1,    26,    27,    28,    29,    -1,    -1,    32,    18,    19,
      20,    21,    22,    23,    -1,    -1,    26,    27,    28,    29
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,     8,     9,    10,    40,    43,    51,     0,    51,
       1,     3,    54,    57,    77,    77,    30,    63,    64,    33,
      63,    31,    36,    31,    56,     1,    40,    55,    44,     4,
      58,    44,    57,    77,    57,     9,    48,    49,    50,    51,
      37,    48,    32,    63,    77,    32,    33,    34,    45,    63,
      50,    36,    45,    41,    40,    46,    37,    40,    52,    47,
      77,     1,    11,    13,    14,    15,    33,    34,    51,    53,
      59,    60,    65,    70,    74,    75,    77,    44,    31,    31,
      31,    31,     4,     5,     6,    27,    31,    68,    72,    73,
      75,    77,    59,    54,    33,    35,    59,    33,    61,    62,
      61,    24,    31,    36,    45,    48,    25,    31,    71,    72,
      71,    67,    70,    77,    72,     1,    72,    61,    26,    27,
      28,    29,    31,    35,    42,     1,    72,     1,    32,    72,
      76,     1,    72,    32,    71,    71,    72,    16,    17,    32,
      18,    19,    20,    21,    22,    23,    32,    61,    32,    32,
      72,    72,    72,    72,     1,    32,    76,    40,    32,    63,
      32,    37,    37,    32,    71,    71,    60,    72,    72,    72,
      72,    72,    72,    60,    69,    71,    32,    32,    76,    12,
      66,    61,    60,    67,    32,    60
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    39,    40,    40,    40,    41,    42,    40,    40,    43,
      44,    46,    45,    45,    47,    48,    48,    49,    49,    50,
      50,    51,    51,    51,    52,    52,    53,    55,    54,    56,
      54,    54,    57,    57,    58,    59,    59,    60,    60,    60,
      60,    60,    60,    60,    60,    60,    61,    62,    61,    63,
      64,    63,    65,    66,    66,    67,    67,    68,    68,    69,
      69,    70,    71,    71,    71,    71,    71,    71,    71,    71,
      71,    71,    72,    72,    72,    72,    72,    72,    72,    72,
      72,    72,    72,    72,    73,    73,    73,    74,    74,    74,
      75,    75,    75,    76,    76,    77
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     4,     8,     9,     0,     0,    13,     0,     1,
       0,     0,     5,     1,     4,     1,     1,     3,     1,     2,
       4,     1,     1,     1,     3,     0,     2,     0,     4,     0,
       4,     1,     1,     4,     1,     2,     0,     6,     5,     9,
       3,     2,     2,     1,     1,     1,     1,     0,     2,     1,
       0,     2,     3,     2,     0,     1,     0,     1,     0,     1,
       0,     3,     3,     3,     3,     3,     3,     3,     2,     3,
       3,     3,     2,     3,     3,     3,     3,     1,     1,     3,
       3,     1,     1,     1,     3,     4,     4,     3,     4,     4,
       1,     4,     4,     3,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 5:
#line 88 "parser.y" /* yacc.c:1646  */
    { currFun = SymTabRecordFunInfo(false);}
#line 1431 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 90 "parser.y" /* yacc.c:1646  */
    { 
      currfnbodyTree = AppendReturn((yyvsp[-1].tptr));
      /*
       * At this point, currfnbodyTree points to the syntax tree
       * for the body of the current function.  This can then
       * be traversed for code generation etc.
       */
      gen_code(currfnbodyTree, currFun);

      CleanupFnInfo(); 
    }
#line 1447 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 104 "parser.y" /* yacc.c:1646  */
    { gen_code_global(); }
#line 1453 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 107 "parser.y" /* yacc.c:1646  */
    { is_extern = true; }
#line 1459 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 109 "parser.y" /* yacc.c:1646  */
    { 
	CurrScope = Local; 
	fnRetType = CurrType;
	fnName = id_name;
	lptr = NULL;
  }
#line 1470 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 118 "parser.y" /* yacc.c:1646  */
    { SymTabRecordFunInfo(true); }
#line 1476 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 119 "parser.y" /* yacc.c:1646  */
    { SymTabRecordFunInfo(true); CleanupFnInfo(); }
#line 1482 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 123 "parser.y" /* yacc.c:1646  */
    { 
    stptr = SymTabLookupAll((yyvsp[-3].chptr));
    if (stptr != NULL) {
      errmsg("%s multiply declared", (yyvsp[-3].chptr));
    }
    else {
      CurrScope = Local;
    }
 }
#line 1496 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 135 "parser.y" /* yacc.c:1646  */
    { (yyval.idlistptr) = NULL; }
#line 1502 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 136 "parser.y" /* yacc.c:1646  */
    { (yyval.idlistptr) = (yyvsp[0].idlistptr); }
#line 1508 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 140 "parser.y" /* yacc.c:1646  */
    { lptr = Attach((yyvsp[-2].idlistptr), (yyvsp[0].idlistptr)); (yyval.idlistptr) = lptr; }
#line 1514 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 141 "parser.y" /* yacc.c:1646  */
    { (yyval.idlistptr) = (yyvsp[0].idlistptr); }
#line 1520 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 145 "parser.y" /* yacc.c:1646  */
    { lptr = NewListNode((yyvsp[0].chptr), (yyvsp[-1].nval), false); (yyval.idlistptr) = lptr; }
#line 1526 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 146 "parser.y" /* yacc.c:1646  */
    { lptr = NewListNode((yyvsp[-2].chptr), (yyvsp[-3].nval), true); (yyval.idlistptr) = lptr; }
#line 1532 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 151 "parser.y" /* yacc.c:1646  */
    { (yyval.nval) = CurrType = t_Int; }
#line 1538 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 152 "parser.y" /* yacc.c:1646  */
    { (yyval.nval) = CurrType = t_Char; }
#line 1544 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 153 "parser.y" /* yacc.c:1646  */
    { (yyval.nval) = CurrType = t_None; }
#line 1550 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 166 "parser.y" /* yacc.c:1646  */
    {yyerrok;}
#line 1556 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 167 "parser.y" /* yacc.c:1646  */
    {yyerrok;}
#line 1562 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 172 "parser.y" /* yacc.c:1646  */
    { 
    if (CurrType == t_None) {
      errmsg("Illegal type [void] for variable %s", id_name);
    }
    else {
      stptr = SymTabInsert(id_name, CurrScope); 
      stptr->type = CurrType;
      stptr->formal = stptr->is_extern = false;
      stptr->elt_type = t_None;
    }
  }
#line 1578 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 183 "parser.y" /* yacc.c:1646  */
    { 
    if (CurrType == t_None) {
      errmsg("Illegal type [void] for variable %s", id_name);
    }
    else {
      stptr = SymTabInsert(id_name, CurrScope);
      stptr->type = t_Array;
      stptr->formal = false;
      stptr->elt_type = CurrType;
      stptr->num_elts = (yyvsp[-1].nval);
    }
  }
#line 1595 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 197 "parser.y" /* yacc.c:1646  */
    { (yyval.nval) = atoi(yytext); }
#line 1601 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 201 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkListNode((yyvsp[-1].tptr), (yyvsp[0].tptr)); }
#line 1607 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 202 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1613 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 206 "parser.y" /* yacc.c:1646  */
    {
      if ((yyvsp[-3].tptr)->etype != t_Bool && (yyvsp[-3].tptr)->etype != t_Error) {
        errmsg("conditional does not have Boolean type");
      }
      (yyval.tptr) = mkSTNode(If, t_None, (yyvsp[-3].tptr), (yyvsp[-1].tptr), (yyvsp[0].tptr), NULL);
    }
#line 1624 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 212 "parser.y" /* yacc.c:1646  */
    {
      if ((yyvsp[-2].tptr)->etype != t_Bool && (yyvsp[-2].tptr)->etype != t_Error) {
        errmsg("conditional does not have Boolean type");
      }
      (yyval.tptr) = mkSTNode(While, t_None, (yyvsp[-2].tptr), (yyvsp[0].tptr), NULL, NULL);
    }
#line 1635 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 218 "parser.y" /* yacc.c:1646  */
    {
      if ((yyvsp[-4].tptr) != NULL && (yyvsp[-4].tptr)->etype != t_Bool && (yyvsp[-4].tptr)->etype != t_Error) {
        errmsg("conditional does not have Boolean type");
      }
      (yyval.tptr) = mkSTNode(For, t_None, (yyvsp[-6].tptr), (yyvsp[-4].tptr), (yyvsp[-2].tptr), (yyvsp[0].tptr));
    }
#line 1646 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 224 "parser.y" /* yacc.c:1646  */
    {
      if (currFun->ret_type != t_None) {
	if ((yyvsp[-1].tptr) == NULL) {
	  errmsg("return with no return value in non-void function");
          (yyval.tptr) = mkErrorNode();
	}
	else if ( !((yyvsp[-1].tptr)->etype == t_Int || (yyvsp[-1].tptr)->etype == t_Char || (yyvsp[-1].tptr)->etype == t_Error) ) {
	  errmsg("illegal return type");
          (yyval.tptr) = mkErrorNode();
	}
	else {
	  (yyval.tptr) = mkSTNode(Return, (yyvsp[-1].tptr)->etype, (yyvsp[-1].tptr), NULL, NULL, NULL);
	}
      }
      else {
	if ((yyvsp[-1].tptr) != NULL) {    /* there is a return expression  */
	  errmsg("non-void return expression in function with no return value");
          (yyval.tptr) = mkErrorNode();
	}
	else {
	  (yyval.tptr) = mkSTNode(Return, t_None, NULL, NULL, NULL, NULL);
	}
      }
    }
#line 1675 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 248 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[-1].tptr); }
#line 1681 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 249 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[-1].tptr); }
#line 1687 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 250 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1693 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 251 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1699 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 252 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkErrorNode(); }
#line 1705 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 261 "parser.y" /* yacc.c:1646  */
    {errstate = NOSEMICOLON;}
#line 1711 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 266 "parser.y" /* yacc.c:1646  */
    {errstate = NOCOMMA;}
#line 1717 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 270 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[-1].tptr); }
#line 1723 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 274 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1729 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 275 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1735 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 279 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1741 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 280 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1747 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 284 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1753 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 285 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1759 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 289 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1765 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 290 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = NULL; }
#line 1771 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 294 "parser.y" /* yacc.c:1646  */
    {
    if ((yyvsp[-2].tptr)->ntype == Error) {
      (yyval.tptr) = (yyvsp[-2].tptr);
    }
    else if ((yyvsp[0].tptr)->ntype == Error) {
      (yyval.tptr) = (yyvsp[0].tptr);
    }
    else if (!((yyvsp[-2].tptr)->etype == t_Int || (yyvsp[-2].tptr)->etype == t_Char)) {
      errmsg("invalid LHS in assignment");
      (yyval.tptr) = mkErrorNode();
    }
    else if (!((yyvsp[0].tptr)->etype == t_Int || (yyvsp[0].tptr)->etype == t_Char)) {
      errmsg("invalid RHS in assignment");
      (yyval.tptr) = mkErrorNode();
    }
    else {
      (yyval.tptr) = mkExprNode(Assg, t_None, (yyvsp[-2].tptr), (yyvsp[0].tptr));
    }
  }
#line 1795 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 316 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Equals, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1801 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 317 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Neq, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1807 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 318 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Leq, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1813 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 319 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Geq, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1819 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 320 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Lt, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1825 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 321 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Gt, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1831 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 322 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeUnExp(LogicalNot, (yyvsp[0].tptr)); }
#line 1837 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 323 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(LogicalAnd, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1843 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 324 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(LogicalOr, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1849 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 325 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[-1].tptr); }
#line 1855 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 329 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeUnExp(UnaryMinus, (yyvsp[0].tptr)); }
#line 1861 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 330 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Plus, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1867 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 331 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(BinaryMinus, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1873 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 332 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Mult, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1879 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 333 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = SynTreeBinExp(Div, (yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 1885 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 334 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1891 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 335 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[0].tptr); }
#line 1897 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 336 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = (yyvsp[-1].tptr); }
#line 1903 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 337 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkErrorNode(); }
#line 1909 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 338 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkConstNode(Intcon, t_Int, ival); }
#line 1915 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 339 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkConstNode(Charcon, t_Char, ival); }
#line 1921 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 340 "parser.y" /* yacc.c:1646  */
    { yytext[strlen(yytext)-1] = '\0'; /* to remove the trailing " */
               (yyval.tptr) = mkStrNode(strdup(yytext+1)); }
#line 1928 "y.tab.c" /* yacc.c:1646  */
    break;

  case 84:
#line 345 "parser.y" /* yacc.c:1646  */
    {
      bool err_occurred = false;
      stptr = SymTabLookupAll((yyvsp[-2].chptr));
      if (stptr == NULL) {
	err_occurred = true;
        errmsg("%s undeclared", (yyvsp[-2].chptr));
      }
      else {
        if (stptr->type != t_Func) {
	  err_occurred = true;
	  errmsg("%s is not a function", (yyvsp[-2].chptr));
        }
        else {
	  err_occurred = !ActualsMatchFormals(stptr, NULL);
        }
      }

      if (!err_occurred) {
	(yyval.tptr) = mkSymTabRefNode(FunCall, stptr->ret_type, stptr, NULL);
      }
      else {
	(yyval.tptr) = mkErrorNode();
      }
    }
#line 1957 "y.tab.c" /* yacc.c:1646  */
    break;

  case 85:
#line 369 "parser.y" /* yacc.c:1646  */
    {
      bool err_occurred = false;
      stptr = SymTabLookupAll((yyvsp[-3].chptr));
      if (stptr == NULL) {
	err_occurred = true;
        errmsg("%s undeclared", (yyvsp[-3].chptr));
      }
      else if (stptr->type != t_Func) {
	err_occurred = true;
        errmsg("%s is not a function", (yyvsp[-3].chptr));
      }
      else {
	err_occurred = !ActualsMatchFormals(stptr, (yyvsp[-1].tptr));
      }

      if (!err_occurred) {
	(yyval.tptr) = mkSymTabRefNode(FunCall, stptr->ret_type, stptr, (yyvsp[-1].tptr));
      }
      else {
	(yyval.tptr) = mkErrorNode();
      }
    }
#line 1984 "y.tab.c" /* yacc.c:1646  */
    break;

  case 86:
#line 391 "parser.y" /* yacc.c:1646  */
    {
      stptr = SymTabLookupAll((yyvsp[-3].chptr));
      if (stptr == NULL) {
        errmsg("undeclared identifier %s", (yyvsp[-3].chptr));
      }

      (yyval.tptr) = mkErrorNode();
    }
#line 1997 "y.tab.c" /* yacc.c:1646  */
    break;

  case 87:
#line 402 "parser.y" /* yacc.c:1646  */
    {
      bool err_occurred = false;
      stptr = SymTabLookupAll((yyvsp[-2].chptr));
      if (stptr == NULL) {
        errmsg("undeclared identifier %s", (yyvsp[-2].chptr));
        (yyval.tptr) = mkErrorNode();
      }
      else if (stptr->type != t_Func) {
	err_occurred = true;
        errmsg("%s is not a function", (yyvsp[-2].chptr));
      }
      else if (stptr->ret_type != t_None) {
	err_occurred = true;
	errmsg("non-VOID function %s used in a statement", (yyvsp[-2].chptr));
      }
      else {
	err_occurred = !ActualsMatchFormals(stptr, NULL);
      }

      if (!err_occurred) {
	(yyval.tptr) = mkSymTabRefNode(FunCall, stptr->ret_type, stptr, NULL);
      }
      else {
	(yyval.tptr) = mkErrorNode();
      }
    }
#line 2028 "y.tab.c" /* yacc.c:1646  */
    break;

  case 88:
#line 428 "parser.y" /* yacc.c:1646  */
    {
      bool err_occurred = false;
      stptr = SymTabLookupAll((yyvsp[-3].chptr));
      if (stptr == NULL) {
        errmsg("undeclared identifier %s", (yyvsp[-3].chptr));
        (yyval.tptr) = mkErrorNode();
      }
      else if (stptr->type != t_Func) {
	err_occurred = true;
        errmsg("%s is not a function", (yyvsp[-3].chptr));
      }
      else if (stptr->ret_type != t_None) {
	err_occurred = true;
	errmsg("non-VOID function %s used in a statement", (yyvsp[-3].chptr));
      }
      else {
	err_occurred = !ActualsMatchFormals(stptr, (yyvsp[-1].tptr));
      }

      if (!err_occurred) {
	(yyval.tptr) = mkSymTabRefNode(FunCall, stptr->ret_type, stptr, (yyvsp[-1].tptr));
      }
      else {
	(yyval.tptr) = mkErrorNode();
      }
    }
#line 2059 "y.tab.c" /* yacc.c:1646  */
    break;

  case 89:
#line 454 "parser.y" /* yacc.c:1646  */
    {
    stptr = SymTabLookupAll((yyvsp[-3].chptr));
    if (stptr == NULL) {
      errmsg("undeclared identifier %s", (yyvsp[-3].chptr));
    }

    (yyval.tptr) = mkErrorNode();
  }
#line 2072 "y.tab.c" /* yacc.c:1646  */
    break;

  case 90:
#line 465 "parser.y" /* yacc.c:1646  */
    { 
	stptr = SymTabLookupAll((yyvsp[0].chptr));
	if (stptr == NULL) {
	  errmsg("Undeclared variable: %s", (yyvsp[0].chptr));
	  (yyval.tptr) = mkErrorNode();
	}
	else {
	  (yyval.tptr) = mkSymTabRefNode(Var, stptr->type, stptr, NULL);
	}
    }
#line 2087 "y.tab.c" /* yacc.c:1646  */
    break;

  case 91:
#line 475 "parser.y" /* yacc.c:1646  */
    {
	bool err_occurred = false;

	stptr = SymTabLookupAll((yyvsp[-3].chptr));

	if (stptr == NULL) {
	  errmsg("Undeclared variable: %s", (yyvsp[-3].chptr));
	  err_occurred = true;
	}
	else if (stptr->type != t_Array) {
	  errmsg("%s not declared as an array", (yyvsp[-3].chptr));
	  err_occurred = true;
	}
	if ( !((yyvsp[-1].tptr)->etype == t_Int || (yyvsp[-1].tptr)->etype == t_Char) ) {
	  if ((yyvsp[-1].tptr)->etype != t_Error) {
	    errmsg("subscript to array %s must be of type int or char", (yyvsp[-3].chptr));
	    err_occurred = 1;
	  }
	}

	if (err_occurred) {
	  (yyval.tptr) = mkErrorNode();
	}
	else {
	  (yyval.tptr) = mkSymTabRefNode(ArraySubscript, stptr->elt_type, stptr, (yyvsp[-1].tptr));
	}
    }
#line 2119 "y.tab.c" /* yacc.c:1646  */
    break;

  case 92:
#line 502 "parser.y" /* yacc.c:1646  */
    {
	stptr = SymTabLookupAll((yyvsp[-3].chptr));

	if (stptr == NULL) {
	  errmsg("Undeclared variable: %s", (yyvsp[-3].chptr));
	}
	else if (stptr->type != t_Array) {
	  errmsg("%s not declared as an array", (yyvsp[-3].chptr));
	}

	(yyval.tptr) = mkErrorNode();
    }
#line 2136 "y.tab.c" /* yacc.c:1646  */
    break;

  case 93:
#line 517 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkListNode((yyvsp[-2].tptr), (yyvsp[0].tptr)); }
#line 2142 "y.tab.c" /* yacc.c:1646  */
    break;

  case 94:
#line 518 "parser.y" /* yacc.c:1646  */
    { (yyval.tptr) = mkListNode((yyvsp[0].tptr), NULL); }
#line 2148 "y.tab.c" /* yacc.c:1646  */
    break;

  case 95:
#line 521 "parser.y" /* yacc.c:1646  */
    { (yyval.chptr) = id_name; }
#line 2154 "y.tab.c" /* yacc.c:1646  */
    break;


#line 2158 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 523 "parser.y" /* yacc.c:1906  */


