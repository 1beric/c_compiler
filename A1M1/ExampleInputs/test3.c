/* a chain of function calls + call to println() */

extern void println(int x);

void h(int a)
{
  println(a);
}

void g(int a)
{
  println(a);
  h(1234);
  println(12345);
}

void f(int a)
{
  println(12);
  g(123);
  println(123456);
}

void main(void)
{
  println(1);
  f(0);
  println(1234567);
}