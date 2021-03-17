#include "global.h"
#include "symbol-table.h"

extern int yydebug;
extern int yyparse();

int status = 0;

int olocal_flag = 0;
int oglobal_flag = 0;

int main(int argc, char *argv[])
{

  int i;
  for (i = 0; i < argc; i++)
  {
    if (argv[i][0] == '-')
    {
      if (strcmp(argv[i], "-Olocal") == 0)
        olocal_flag = 1;
      else if (strcmp(argv[i], "-Oglobal") == 0)
        oglobal_flag = 1;
    }
  }

  SymTabInit(Global);
  SymTabInit(Local);

  if (yyparse() < 0)
  {
    printf("main: syntax error\n");
    status = 1;
  }

  return status;
}
