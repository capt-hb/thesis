int g(int *a, int *b) {
  return (*a) + (*b);
}

int f(int a) {
  int x = 10;
  return g(&a, &x);
}

int tmp(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j) {
  return a + b + c + d + e + f + g + h + i + j;
}

int cap_tmp(int *a, int *b, int *c, int *d, int *e, int *f, int *g, int *h, int *i, int *j) {
  return (*a) + (*b) + (*c) + (*d) + (*e) + (*f) + (*g) + (*h) + (*i) + (*j);
}

int mixed_tmp(int a, int *b, int c, int *d, int e, int *f, int g, int *h, int i, int *j, int k, int *l) {
  return a + (*b) + c + (*d) + e + (*f) + g + (*h) + i + (*j);
}

int main(void) {
  int a = 1;
  int b = 2;
  int c = 3;
  int d = 4;
  int e = 5;
  int x = 6;
  int g = 7;
  int h = 8;
  int i = 9;
  int j = 10;
  tmp(a, b, c, d, e, x, g, h, i, j);
  cap_tmp(&a, &b, &c, &d, &e, &x, &g, &h, &i, &j);
  mixed_tmp(a, &b, c, &d, e, &x, g, &h, i, &j, i, &j);
  return f(10);
}
