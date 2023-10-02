import 'dart:io';
import 'dart:math';

class ForloopCodingSolver{

  void evenoddchecknumbersummiion() {
    // Define the range of numbers
    int start = 1;
    int end = 10;

    // Initialize variables to store the sum of even and odd numbers
    int sumEven = 0;
    int sumOdd = 0;

    // Iterate through the numbers in the range
    for (int i = start; i <= end; i++) {
      // Check if the current number is even or odd
      if (i % 2 == 0) {
        print('$i is even');
        sumEven += i; // Add even number to the sumEven
      } else {
        print('$i is odd');
        sumOdd += i; // Add odd number to the sumOdd
      }
    }

    // Print the sum of even and odd numbers
    print('Sum of even numbers: $sumEven');
    print('Sum of odd numbers: $sumOdd');
  }

  void Fibonaccidatacode() {
    // Define the number of terms in the Fibonacci sequence
    int numTerms = 10; // Change this to the desired number of terms

    // Initialize variables for the first two terms
    int firstTerm = 0;
    int secondTerm = 1;

    // Print the first two terms
    print('Fibonacci Sequence:');
    print(firstTerm);
    print(secondTerm);

    // Calculate and print the rest of the sequence
    for (int i = 2; i < numTerms; i++) {
      int nextTerm = firstTerm + secondTerm;
      print(nextTerm);

      // Update the first and second terms for the next iteration
      firstTerm = secondTerm;
      secondTerm = nextTerm;
    }
  }

  void main() {
    // Define the range of numbers for the guessing game
    int minNumber = 1;
    int maxNumber = 100;

    // Generate a random number for the user to guess
    Random random = Random();
    int targetNumber = minNumber + random.nextInt(maxNumber - minNumber + 1);

    // Initialize variables
    int attempts = 0;
    bool hasGuessedCorrectly = false;

    print('Welcome to the Guessing Game!');
    print('I have selected a number between $minNumber and $maxNumber.');

    while (!hasGuessedCorrectly) {
      // Prompt the user for a guess
      int userGuess = getUserGuess(minNumber, maxNumber);

      // Increment the number of attempts
      attempts++;

      // Check if the guess is correct
      if (userGuess == targetNumber) {
        hasGuessedCorrectly = true;
        print('Congratulations! You guessed the correct number, which was $targetNumber.');
        print('It took you $attempts attempts.');
      } else {
        // Provide feedback and continue the game
        if (userGuess < targetNumber) {
          print('Try a higher number.');
        } else {
          print('Try a lower number.');
        }
      }
    }
  }

  int getUserGuess(int min, int max) {
   late int userGuess;
    bool validGuess = false;

    while (!validGuess) {
      try {
        print('Enter your guess ($min - $max): ');
        userGuess = int.parse(stdin.readLineSync()!);

        if (userGuess >= min && userGuess <= max) {
          validGuess = true;
        } else {
          print('Please enter a valid number within the specified range.');
        }
        return userGuess ;
      } catch (e) {
        print('Invalid input. Please enter a valid number.');
      }
    }

    return userGuess;
  }


}