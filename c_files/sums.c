#define LENGTH 10

void integers(int arr[], int length, int start) {
  for (int i = 0; i < length; i++) {
    arr[i] = start + i;
  }
}

int sum(int *arr, int length) {
  int total = 0;

  for (int *p = arr; p < arr + length; p++) {
    total += *p;
  }

  return total;
}

int backwards_sum(int *arr, int length) {
  int total = 0;

  for (int *p = arr + length - 1; p >= arr; p--) {
    total += *p;
  }

  return total;
}

int subtract_sums() {
  int arr[LENGTH];
  integers(arr, LENGTH, 1);
  return sum(arr, LENGTH) - backwards_sum(arr, LENGTH);
}

int main() {
  return subtract_sums();
}
