/* boolean expressions */

extern void println(int a);

int x, y;

char foo(char z)
{
  if (z > 0)
    x = 1;
  if (z == 0)
    y = 1;
  if (!(x > y))
    z = 0;
  return z;
}

void main(void)
{
  println(foo('a'));
}