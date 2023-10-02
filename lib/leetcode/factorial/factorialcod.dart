
int factorialIterative(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

int factorialRecursive(int n) {
  if (n == 0) {
    return 1;
  }
  return n * factorialRecursive(n - 1);
}

void main() {
  int number = 5; // Change this to the number for which you want to calculate the factorial.

  // Calculate factorial using the iterative approach
  int factorialIter = factorialIterative(number);
  print("Factorial of $number (Iterative): $factorialIter");

  // Calculate factorial using the recursive approach
  int factorialRec = factorialRecursive(number);
  print("Factorial of $number (Recursive): $factorialRec");
}
