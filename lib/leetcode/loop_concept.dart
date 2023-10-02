class LoopComplexCodeSolution{

  outerinnnerloop(){

    ///1 * 1 = 1
    // 1 * 2 = 2
    // 1 * 3 = 3
    // 1 * 4 = 4
    // 1 * 5 = 5
    // 2 * 1 = 2
    // 2 * 2 = 4
    // 2 * 3 = 6
    // 2 * 4 = 8
    // 2 * 5 = 10
    // 3 * 1 = 3
    // 3 * 2 = 6
    // 3 * 3 = 9
    // 3 * 4 = 12
    // 3 * 5 = 15
    // 4 * 1 = 4
    // 4 * 2 = 8
    // 4 * 3 = 12
    // 4 * 4 = 16
    // 4 * 5 = 20
    // 5 * 1 = 5
    // 5 * 2 = 10
    // 5 * 3 = 15
    // 5 * 4 = 20
    // 5 * 5 = 25
    for (int i = 1; i <= 5; i++) {
      for (int j = 1; j <= 5; j++) {
        int result = i * j;
        print('$i * $j = $result');
      }
    }
  }

  startprint(){

    for (int i = 1; i <= 5; i++) {
      for (int j = 1; j <= i; j++) {
        print('*');
      }
      print(''); // Move to the next line after each row of asterisks
    }
  }

  fibonacci() {
    ///Fibonacci Sequence:
    // 0
    // 1
    // 1
    // 2
    // 3
    // 5
    // 8
    // 13
    // 21
    int n = 10; // Number of Fibonacci numbers to generate
    int first = 0;
    int second = 1;

    print('Fibonacci Sequence:');
    for (int i = 0; i < n; i++) {
      print(first);

      int next = first + second;
      first = second;
      second = next;
    }
  }

  void rowgenarted() {
    int rows = 5; // Number of rows in the pattern

    for (int i = 1; i <= rows; i++) {
      for (int j = 1; j <= i; j++) {
        print(j);
      }
      print(''); // Move to the next line after each row
    }
  }

  void numberofrowintringle() {
    int n = 5; // Number of rows in the triangle

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        print('*');
      }
      print(''); // Move to the next line after each row
    }
  }
  void pyramid() {
    ///    1
    //    121
    //   12321
    //  1234321
    // 123454321
    int rows = 5; // Number of rows in the pyramid
    int spaces = rows - 1; // Number of spaces before the numbers

    for (int i = 1; i <= rows; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= spaces; j++) {
        print(' ');
      }

      // Print numbers in an ascending order
      for (int k = 1; k <= i; k++) {
        print(k);
      }

      // Print numbers in a descending order
      for (int l = i - 1; l >= 1; l--) {
        print(l);
      }

      print(''); // Move to the next line after each row
      spaces--; // Decrease the number of spaces for the next row
    }
  }

  void upperlowerpartinmethod() {
    ///    *
    //    ***
    //   *****
    //  *******
    // *********
    //  *******
    //   *****
    //    ***
    //     *
    int n = 5; // Number of rows in the diamond

    // Upper part of the diamond
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }
      for (int k = 1; k <= 2 * i - 1; k++) {
        print('*');
      }
      print('');
    }

    // Lower part of the diamond
    for (int i = n - 1; i >= 1; i--) {
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }
      for (int k = 1; k <= 2 * i - 1; k++) {
        print('*');
      }
      print('');
    }
  }


  void alphabetpattern() {
    ///A
    // AB
    // ABC
    // ABCD
    // ABCDE
    int n = 5; // Number of rows in the pattern
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    for (int i = 0; i < n; i++) {
      for (int j = 0; j <= i; j++) {
        print(alphabet[j]);
      }
      print(''); // Move to the next line after each row
    }
  }
  void alternatecharacters() {
    ///ABCD
    // BCDA
    // CDAB
    // DABC
    // ABCD
    int n = 5; // Number of rows in the pattern
    String characters = 'ABCD'; // Characters to alternate

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        // Use modulo operator to alternate between characters
        print(characters[(i + j) % characters.length]);
      }
      print(''); // Move to the next line after each row
    }
  }
  void linemove() {
    ////5
    // 543
    // 54321
    // 543210
    // 54321
    int n = 5; // Number of rows in the triangle

    for (int i = n; i >= 1; i--) {
      for (int j = i; j >= 1; j--) {
        print(j);
      }
      print(''); // Move to the next line after each row
    }
  }


  void upperlowerbanddiamond() {

    ///    1
    //    123
    //   12345
    //  1234567
    // 123456789
    //  1234567
    //   12345
    //    123
    //     1
    int n = 5; // Number of rows in the diamond

    // Upper part of the diamond
    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }
      for (int k = 1; k <= 2 * i - 1; k++) {
        print(k);
      }
      print('');
    }

    // Lower part of the diamond
    for (int i = n - 1; i >= 1; i--) {
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }
      for (int k = 1; k <= 2 * i - 1; k++) {
        print(k);
      }
      print('');
    }
  }
  void trianglerows() {
    /// * *
    // **  **
    // ***   ***
    // ****    ****
    // *****     *****
    int n = 5; // Number of rows in each triangle

    for (int i = 1; i <= n; i++) {
      // Loop to print the left triangle
      for (int j = 1; j <= i; j++) {
        print('*');
      }

      // Add space between the two triangles
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }

      // Loop to print the right triangle
      for (int j = 1; j <= i; j++) {
        print('*');
      }

      print(''); // Move to the next line after each row
    }
  }

  void trianglerowprintnumbrr() {
    ///1
    // 12
    // 123
    // 1234
    // 12345
    int n = 5; // Number of rows in the triangle

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        print(j);
      }
      print(''); // Move to the next line after each row
    }
  }

  void rowcolninsqr() {
    ///*****
    // *   *
    // *   *
    // *   *
    // *****
    int n = 5; // Number of rows and columns in the square

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= n; j++) {
        if (i == 1 || i == n || j == 1 || j == n) {
          print('*');
        } else {
          print(' ');
        }
      }
      print(''); // Move to the next line after each row
    }
  }

  void eachrow() {
    ///1
    // 01
    // 101
    // 0101
    // 10101
    int n = 5; // Number of rows in the triangle

    for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
        print((j % 2 == 0) ? '0' : '1');
      }
      print(''); // Move to the next line after each row
    }
  }

  void pyramidrowcoln() {
    ///    1
    //    123
    //   12345
    //  1234567
    // 123456789
    int n = 5; // Number of rows in the pyramid

    for (int i = 1; i <= n; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }

      // Print numbers in ascending order
      for (int k = 1; k <= 2 * i - 1; k++) {
        print(k);
      }

      // Print spaces after the numbers
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }

      print(''); // Move to the next line after each row
    }
  }
  void trianglemain() {
    ///    1
    //    21 12
    //   321   123
    //  4321     1234
    // 54321       12345
    int n = 5; // Number of rows in each triangle

    for (int i = 1; i <= n; i++) {
      // Loop to print the left triangle
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }
      for (int j = i; j >= 1; j--) {
        print(j);
      }

      // Add space between the two triangles
      for (int j = 1; j <= i - 1; j++) {
        print(' ');
      }

      // Loop to print the right triangle
      for (int j = 1; j <= i; j++) {
        print(j);
      }

      print(''); // Move to the next line after each row
    }
  }
  void numstepforloop() {
    ///        1
    //       1 2
    //     1 2 3
    //   1 2 3 4
    // 1 2 3 4 5
    int n = 5; // Number of steps in the staircase

    for (int i = 1; i <= n; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      // Print numbers in ascending order
      for (int k = 1; k <= i; k++) {
        print(k);
        // Add a space after each number except the last one
        if (k < i) {
          print(' ');
        }
      }

      print(''); // Move to the next line after each step
    }
  }
  void leadingzerorowtringle() {
    ////        01
    //       01 02
    //     01 02 03
    //   01 02 03 04
    // 01 02 03 04 05

    int n = 5; // Number of rows in the pyramid

    for (int i = 1; i <= n; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      // Print numbers in ascending order with leading zeros
      for (int k = 1; k <= i; k++) {
        print(k.toString().padLeft(2, '0'));
        // Add a space after each number except the last one
        if (k < i) {
          print(' ');
        }
      }

      print(''); // Move to the next line after each row
    }
  }
  void alphabetchatcetrspace() {
    ///        A
    //       A B A
    //     A B C B A
    //   A B C D C B A
    // A B C D E D C B A
    int n = 5; // Number of rows in the pyramid
    String alphabet = 'ABCDE'; // Alphabets to use

    for (int i = 1; i <= n; i++) {
      // Print spaces before the alphabets
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      // Print alphabets in ascending order
      for (int k = 1; k <= i; k++) {
        print(alphabet[k - 1]);
        // Add a space after each alphabet except the last one
        if (k < i) {
          print(' ');
        }
      }

      // Print spaces after the alphabets
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      print(''); // Move to the next line after each row
    }
  }
  void descendingordrrpint() {
    ////5 4 3 2 1
    //   4 3 2 1
    //     3 2 1
    //       2 1
    //         1
    int n = 5; // Number of rows in the pyramid

    for (int i = n; i >= 1; i--) {
      // Print spaces before the numbers
      for (int j = n; j > i; j--) {
        print('  ');
      }

      // Print numbers in descending order
      for (int k = i; k >= 1; k--) {
        print(k);
        // Add a space after each number except the last one
        if (k > 1) {
          print(' ');
        }
      }

      print(''); // Move to the next line after each row
    }
  }

  void pyramidmaiNumbern() {
    // 1
    // 1 0 1
    // 1 0 1 0 1
    // 1 0 1 0 1 0 1
    // 1 0 1 0 1 0 1 0 1

    int n = 5; // Number of rows in the pyramid

    for (int i = 1; i <= n; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      // Print numbers in alternating order (1, 0, 1, 0, ...)
      for (int k = 1; k <= i; k++) {
        print(k % 2);
        // Add a space after each number except the last one
        if (k < i) {
          print(' ');
        }
      }

      // Print spaces after the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      print(''); // Move to the next line after each row
    }
  }
  void mainStarting() {
    ///        1
    //       2 3 4
    //     5 6 7 8 9
    //   10 11 12 13 14
    // 15 16 17 18 19 20
    int n = 5; // Number of rows in the pyramid
    int num = 1; // Starting number

    for (int i = 1; i <= n; i++) {
      // Print spaces before the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      // Print numbers in ascending order
      for (int k = 1; k <= i; k++) {
        print(num);
        num++;
        // Add a space after each number except the last one
        if (k < i) {
          print(' ');
        }
      }

      // Print spaces after the numbers
      for (int j = 1; j <= n - i; j++) {
        print('  ');
      }

      print(''); // Move to the next line after each row
    }
  }

  void filledmatrixcodeadvance() {
    /// 1  2  3  4  5
    // 16 17 18 19  6
    // 15 24 25 20  7
    // 14 23 22 21  8
    // 13 12 11 10  9
    int n = 5; // Size of the square
    int currentValue = 1; // Starting value

    // Create an empty square matrix filled with zeros
    List<List<int>> matrix = List.generate(n, (_) => List<int>.filled(n, 0));

    int top = 0, bottom = n - 1, left = 0, right = n - 1;

    while (top <= bottom && left <= right) {
      // Move from left to right along the top row
      for (int i = left; i <= right; i++) {
        matrix[top][i] = currentValue++;
      }
      top++;

      // Move from top to bottom along the rightmost column
      for (int i = top; i <= bottom; i++) {
        matrix[i][right] = currentValue++;
      }
      right--;

      // Move from right to left along the bottom row
      for (int i = right; i >= left; i--) {
        matrix[bottom][i] = currentValue++;
      }
      bottom--;

      // Move from bottom to top along the leftmost column
      for (int i = bottom; i >= top; i--) {
        matrix[i][left] = currentValue++;
      }
      left++;
    }

    // Print the spiral square
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        print(matrix[i][j].toString().padLeft(2, ' '));
      }
      print(''); // Move to the next line after each row
    }
  }

  void mainPascaltringle() {

    // 1
    // 1   1
    // 1   2   1
    // 1   3   3   1
    // 1   4   6   4   1
    // 1   5  10  10   5   1

    int n = 6; // Number of rows in Pascal's Triangle

    // Create a 2D list to represent Pascal's Triangle
    List<List<int>> triangle = List.generate(n, (_) => List<int>.filled(n, 0));

    // Fill in Pascal's Triangle
    for (int line = 0; line < n; line++) {
      for (int i = 0; i <= line; i++) {
        if (i == 0 || i == line) {
          triangle[line][i] = 1;
        } else {
          triangle[line][i] = triangle[line - 1][i - 1] + triangle[line - 1][i];
        }
      }
    }

    // Print Pascal's Triangle
    for (int line = 0; line < n; line++) {
      // Print spaces to center-align the numbers
      for (int space = 0; space < n - line; space++) {
        print('   ');
      }

      for (int i = 0; i <= line; i++) {
        print(triangle[line][i].toString().padLeft(3, ' '));
        print('   '); // Add spacing between numbers
      }

      print(''); // Move to the next line after each row
    }
  }


  void Sierpinskitranglemain() {
    ////    *
    //    * *
    //   *   *
    //  * * * *
    // *       *
    int n = 5; // Number of levels in the Sierpinski Triangle

    for (int i = 0; i < n; i++) {
      String spaces = ' ' * (n - i - 1);
      String stars = '* ' * (i * 2 + 1);
      print(spaces + stars);
    }
  }


  void drawTree(int n, int maxLength) {
    if (n == 0) return;

    for (int i = 0; i < maxLength; i++) {
      if (i == maxLength ~/ 2) {
        print('*');
      } else {
        print(' ');
      }
    }

    drawTree(n - 1, maxLength ~/ 2);

    for (int i = 0; i < maxLength; i++) {
      print(' ');
    }

    drawTree(n - 1, maxLength ~/ 2);
  }


  void spiralmatrixmain() {

    /// 1  2  3  4
    // 12 13 14  5
    // 11  0 15  6
    // 10  9  8  7
    int n = 4; // Size of the square spiral matrix
    List<List<int>> matrix = List.generate(n, (_) => List<int>.filled(n, 0));

    int value = 1;
    int minRow = 0, maxRow = n - 1, minCol = 0, maxCol = n - 1;

    while (value <= n * n) {
      // Move right
      for (int i = minCol; i <= maxCol; i++) {
        matrix[minRow][i] = value++;
      }
      minRow++;

      // Move down
      for (int i = minRow; i <= maxRow; i++) {
        matrix[i][maxCol] = value++;
      }
      maxCol--;

      // Move left
      for (int i = maxCol; i >= minCol; i--) {
        matrix[maxRow][i] = value++;
      }
      maxRow--;

      // Move up
      for (int i = maxRow; i >= minRow; i--) {
        matrix[i][minCol] = value++;
      }
      minCol++;
    }

    // Print the spiral matrix
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        print(matrix[i][j].toString().padLeft(2, ' '));
      }
      print(''); // Move to the next line after each row
    }
  }
  void concentricsqrmain() {
    ////  1   2   3   4   5
    //  20               6
    //  19               7
    //  18               8
    //  17  16  15  14   9
    int n = 5; // Number of concentric squares
    int value = 1; // Starting value

    for (int i = 0; i < n; i++) {
      int sideLength = (2 * i + 1);
      int offset = i;

      // Print the top side of the square
      for (int j = 0; j < sideLength; j++) {
        print((value++).toString().padLeft(3, ' '));
      }

      // Print the right side of the square
      for (int j = 1; j < sideLength; j++) {
        print((value++).toString().padLeft(3, ' '));
      }

      // Print the bottom side of the square
      for (int j = 1; j < sideLength; j++) {
        print((value++).toString().padLeft(3, ' '));
      }

      // Print the left side of the square
      for (int j = 1; j < sideLength - 1; j++) {
        print((value++).toString().padLeft(3, ' '));
      }

      // Move to the next row
      print('');

      // Decrease the offset to create the next concentric square
      value += offset * 3;
    }
  }
  void mainspiralpatterncode() {
    /// 1  2  3  4  5
    // 16 17 18 19  6
    // 15 24 25 20  7
    // 14 23 22 21  8
    // 13 12 11 10  9
    int n = 5; // Size of the spiral pattern
    int maxNum = n * n; // Maximum number to reach
    int currentNum = 1; // Starting number

    List<List<int>> spiral = List.generate(n, (_) => List<int>.filled(n, 0));

    int rowStart = 0, rowEnd = n - 1, colStart = 0, colEnd = n - 1;

    while (currentNum <= maxNum) {
      // Move right
      for (int i = colStart; i <= colEnd; i++) {
        spiral[rowStart][i] = currentNum++;
      }
      rowStart++;

      // Move down
      for (int i = rowStart; i <= rowEnd; i++) {
        spiral[i][colEnd] = currentNum++;
      }
      colEnd--;

      // Move left
      for (int i = colEnd; i >= colStart; i--) {
        spiral[rowEnd][i] = currentNum++;
      }
      rowEnd--;

      // Move up
      for (int i = rowEnd; i >= rowStart; i--) {
        spiral[i][colStart] = currentNum++;
      }
      colStart++;
    }

    // Print the spiral pattern
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        print(spiral[i][j].toString().padLeft(2, ' '));
      }
      print(''); // Move to the next line after each row
    }
  }

  void triangpadLeftlemain() {
    ///1
    // * *
    // 1 2
    // * * *
    // 1 2 3
    // * * * *
    // 1 2 3 4
    // * * * * *
    // 1 2 3 4 5
    int n = 5; // Number of rows in the triangle

    for (int i = 1; i <= n; i++) {
      // Print numbers and asterisks in each row
      for (int j = 1; j <= i; j++) {
        // Print numbers for odd rows and asterisks for even rows
        if (i % 2 == 1) {
          print(j.toString().padLeft(2, ' '));
        } else {
          print('* ');
        }
      }
      print(''); // Move to the next line after each row
    }
  }


  void codeUnitAt() {
    ////    A
    //    ABA
    //   ABCBA
    //  ABCDCBA
    // ABCDEDCBA
    //  ABCDCBA
    //   ABCBA
    //    ABA
    //     A
    int n = 5; // Number of rows in the diamond

    int startChar = 'A'.codeUnitAt(0); // ASCII code of 'A'

    for (int i = 1; i <= n; i++) {
      // Print spaces before the letters
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }

      // Print letters in ascending order
      for (int k = 1; k <= 2 * i - 1; k++) {
        int currentChar = startChar + k - 1;
        print(String.fromCharCode(currentChar));
      }

      print(''); // Move to the next line after each row
    }

    for (int i = n - 1; i >= 1; i--) {
      // Print spaces before the letters
      for (int j = 1; j <= n - i; j++) {
        print(' ');
      }

      // Print letters in ascending order
      for (int k = 1; k <= 2 * i - 1; k++) {
        int currentChar = startChar + k - 1;
        print(String.fromCharCode(currentChar));
      }

      print(''); // Move to the next line after each row
    }
  }
  void spiralsquare() {
    ////A B C D E
    // Z         F
    // Y         G
    // X         H
    // W V U T S R
    int n = 5; // Size of the square spiral
    String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int currentIndex = 0; // Index to track the current letter

    List<List<String>> spiral = List.generate(n, (_) => List<String>.filled(n, ' '));

    int rowStart = 0, rowEnd = n - 1, colStart = 0, colEnd = n - 1;

    while (currentIndex < alphabet.length) {
      // Move right
      for (int i = colStart; i <= colEnd; i++) {
        spiral[rowStart][i] = alphabet[currentIndex++];
      }
      rowStart++;

      // Move down
      for (int i = rowStart; i <= rowEnd; i++) {
        spiral[i][colEnd] = alphabet[currentIndex++];
      }
      colEnd--;

      // Move left
      for (int i = colEnd; i >= colStart; i--) {
        spiral[rowEnd][i] = alphabet[currentIndex++];
      }
      rowEnd--;

      // Move up
      for (int i = rowEnd; i >= rowStart; i--) {
        spiral[i][colStart] = alphabet[currentIndex++];
      }
      colStart++;
    }

    // Print the spiral square with letters
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        print(spiral[i][j].padRight(2, ' '));
      }
      print(''); // Move to the next line after each row
    }
  }

  void pyramidrowdata() {
    ////         1
    //       1  2  1
    //    1  2  3  2  1
    // 1  2  3  4  3  2  1
    //    1  2  3  2  1
    //       1  2  1
    //          1
    int n = 5; // Number of rows in the pyramid

    for (int i = 1; i <= n; i++) {
      // Print spaces to center-align the numbers
      for (int j = n; j > i; j--) {
        print('   ');
      }

      // Print numbers in ascending order
      for (int k = 1; k <= i; k++) {
        print(k.toString().padLeft(3, ' '));
      }

      // Print numbers in descending order
      for (int l = i - 1; l >= 1; l--) {
        print(l.toString().padLeft(3, ' '));
      }

      print(''); // Move to the next line after each row
    }
  }

  void hollowdiamondrow() {
    ///    *
    //    * *
    //   *   *
    //  *     *
    // *       *
    //  *     *
    //   *   *
    //    * *
    //     *
    int n = 5; // Number of rows in the hollow diamond

    // Print top half
    for (int i = 1; i <= n; i++) {
      // Print spaces to center-align the pattern
      for (int j = n; j > i; j--) {
        print(' ');
      }

      // Print the first '*' for each row
      print('*');

      // Print spaces in the middle of the diamond
      if (i > 1) {
        for (int k = 1; k <= 2 * i - 3; k++) {
          print(' ');
        }
        // Print the last '*' for each row
        print('*');
      }

      print(''); // Move to the next line after each row
    }

    // Print bottom half
    for (int i = n - 1; i >= 1; i--) {
      // Print spaces to center-align the pattern
      for (int j = n; j > i; j--) {
        print(' ');
      }

      // Print the first '*' for each row
      print('*');

      // Print spaces in the middle of the diamond
      if (i > 1) {
        for (int k = 1; k <= 2 * i - 3; k++) {
          print(' ');
        }
        // Print the last '*' for each row
        print('*');
      }

      print(''); // Move to the next line after each row
    }
  }

  void generateSierpinski(int n) {
    // *
    // * *
    // *   *
    // * * * *
    // *       *
    // * *     * *
    // *   *   *   *
    // * * * * * * * *

    for (int i = 0; i < n; i++) {
      // Print spaces to center-align the triangle
      for (int j = 0; j < n - i - 1; j++) {
        print(' ');
      }

      // Print '*' or ' ' based on whether it's part of the Sierpinski Triangle
      for (int j = 0; j < 2 * i + 1; j++) {
        if (isSierpinski(n, i, j)) {
          print('*');
        } else {
          print(' ');
        }
      }

      print(''); // Move to the next line after each row
    }
  }

  bool isSierpinski(int n, int row, int col) {
    if (n == 1) {
      return true;
    }

    int halfHeight = (n / 2).toInt();
    if (row < halfHeight) {
      return isSierpinski(halfHeight, row, col);
    } else {
      return isSierpinski(halfHeight, row - halfHeight, col - halfHeight);
    }
  }
  void hourglassmain() {
    ////*********
    //  *******
    //   *****
    //    ***
    //     *
    //    ***
    //   *****
    //  *******
    // *********
    int n = 5; // Number of rows in the hourglass

    for (int i = n; i >= 1; i--) {
      // Print spaces to create the top part of the hourglass
      for (int j = n - i; j > 0; j--) {
        print(' ');
      }

      // Print stars in ascending order for the top part
      for (int k = 1; k <= 2 * i - 1; k++) {
        print('*');
      }

      print(''); // Move to the next line after each row
    }

    for (int i = 2; i <= n; i++) {
      // Print spaces to create the bottom part of the hourglass
      for (int j = n - i; j > 0; j--) {
        print(' ');
      }

      // Print stars in ascending order for the bottom part
      for (int k = 1; k <= 2 * i - 1; k++) {
        print('*');
      }

      print(''); // Move to the next line after each row
    }
  }

}