/* simple for loops */

extern void println(int n);

void main(void)
{
  int i, res;

  i = 0;
  res = 0;
  for (; i < 10; i = i + 1)
    res = res + i;

  for (i = 0; i < 10;)
  {
    res = res + i;
    i = i + 1;
  }

  for (i = 0;; i = i + 1)
  {
    res = res + i;
    if (i > 10)
    {
      println(res);
      return;
    }
  }
}