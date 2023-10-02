import 'dart:math';

int factorial(int n) {
  if (n == 0) {
    return 1; // Factorial of 0 is 1 by convention.
  } else {
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}

void main() {
  print("Factorial Calculator & Trigonometry");

  // Calculate the factorial of a number
  int input = 5; // Change this to the number for which you want to calculate the factorial.
  int factResult = factorial(input);

  print("Factorial of $input is $factResult");

  // Calculate sine and cosine of the factorial result
  double sineResult = sin(factResult.toDouble());
  double cosineResult = cos(factResult.toDouble());

  print("Sine of factorial result: $sineResult");
  print("Cosine of factorial result: $cosineResult");
}
