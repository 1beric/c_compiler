/* function prototypes */

extern void println(int x);

int foo(void);

void bar(int x);

char fgh(char hgf[]);

int q;

int f(int a, char b)
{
  return (2 - 1) * 3;
}

int g(void)
{
  int x;
  x = -10;
  x = x + 1;
  x = -f(x, 1);
  return x;
}

void main(void)
{
  int a;
  a = 5;
  println(1);
  println(a);
  println(f(1, 2));
  println(g());
  a = 2;
}