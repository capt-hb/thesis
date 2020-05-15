int product(int a, int b) {
  return a * b;
}

int factorial(int n) {
  int total = 1;

  for (int i = n; i > 1; i--) {
    total = product(total, i);
  }

  return total;
}

int sum(int nums[], int length) {
  int sum = 0;

  for (int i = 0; i < length; i++) {
    sum += nums[i]; 
  }

  return sum;
}

// field of stack allocated struct
// argument spilling
// declaring vars, writing out-of-order
// focus on the above first
// address of argument
// passing buffer space to fn (+ &buf[0], diff cap?)
int sumFactorials() {
  int length = 4;
  int fact[4];
  fact[0] = 1;

  for (int i = 1; i < length; i++) {
    fact[i] = factorial(i);
  }

  return sum(fact, length);
}

int main(void) {
  return sumFactorials();
}
