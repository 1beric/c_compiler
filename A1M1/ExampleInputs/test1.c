/* functions with multiple local int+char variables and function calls */

extern void println(int x);

void f(int x)
{
    char u;
    int v;
    char w;

    u = '&';
    v = 345;

    println(x);
    w = '7';

    println(u);
    x = 678;

    println(v);

    println(w);

    println(x);
}

void main(void)
{
    f(123);
}