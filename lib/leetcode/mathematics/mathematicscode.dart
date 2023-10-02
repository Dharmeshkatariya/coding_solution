import 'dart:math';



import 'dart:math';


class MethematicsCodeComplex{

  // // Greatest Common Divisor (GCD)
  // int number1 = 36;
  // int number2 = 48;
  // int gcd = findGCD(number1, number2);
  // print("GCD of $number1 and $number2 = $gcd");
  //
  // // Exponentiation with integers (without the `pow` function)
  // int base = 2;
  // int exponent = 4;
  // int result = integerExponentiation(base, exponent);
  // print("$base^$exponent = $result");

  int findGCD(int a, int b) {
    while (b != 0) {
      int remainder = a % b;
      a = b;
      b = remainder;
    }
    return a;
  }

  int integerExponentiation(int base, int exponent) {
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= base;
    }
    return result;
  }

  double calculateSinCos(double angleInRadians) {
    double sine = sin(angleInRadians);
    double cosine = cos(angleInRadians);

    return sine + cosine; // You can return any combination of sine and cosine you want.
  }

  void mathsoperation() {
    // Exponentiation (Power)
    double base = 2;
    double exponent = 3;
    num result = pow(base, exponent);
    print("2^3 = $result");

    // Square Root
    double number = 9;
    double sqrtResult = sqrt(number);
    print("Square root of $number = $sqrtResult");

    // Absolute Value
    double value = -5;
    double absValue = value.abs();
    print("Absolute value of $value = $absValue");

    // Rounding
    double floatingNumber = 3.14159;
    double roundedNumber = floatingNumber.roundToDouble();
    print("Rounded value of $floatingNumber = $roundedNumber");

    // Trigonometric Functions
    double angleInRadians = pi / 6;
    double sine = sin(angleInRadians);
    double cosine = cos(angleInRadians);
    print("Sine of $angleInRadians radians = $sine");
    print("Cosine of $angleInRadians radians = $cosine");


    // Logarithms (Natural Logarithm)
    double number2 = 10;
    double naturalLog = log(number);
    print("Natural logarithm of $number = $naturalLog");

    // Floor and Ceiling Functions
    double decimalNumber = 7.8;
    int floorValue = decimalNumber.floor();
    int ceilValue = decimalNumber.ceil();
    print("Floor of $decimalNumber = $floorValue");
    print("Ceiling of $decimalNumber = $ceilValue");

    // Generating Random Numbers
    Random random = Random();
    int randomInt = random.nextInt(100); // Generates a random integer between 0 and 99.
    double randomDouble = random.nextDouble(); // Generates a random double between 0.0 and 1.0.
    print("Random Integer: $randomInt");
    print("Random Double: $randomDouble");
  }
  }
