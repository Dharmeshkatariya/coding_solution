import 'dart:io';
import 'dart:math';

void hangmangamemain() {
  final List<String> words = ["apple", "banana", "cherry", "grape", "orange", "strawberry"];
  final Random random = Random();
  String wordToGuess = words[random.nextInt(words.length)];
  List<String> guessedLetters = [];
  int attemptsLeft = 6;

  print("Welcome to Hangman!");
  print("Guess the word:");

  while (attemptsLeft > 0) {
    bool allLettersGuessed = true;

    for (int i = 0; i < wordToGuess.length; i++) {
      String letter = wordToGuess[i];
      if (guessedLetters.contains(letter)) {
        stdout.write("$letter ");
      } else {
        stdout.write("_ ");
        allLettersGuessed = false;
      }
    }

    print("\nAttempts left: $attemptsLeft");
    print("Guessed letters: ${guessedLetters.join(', ')}");

    if (allLettersGuessed) {
      print("Congratulations! You guessed the word: $wordToGuess");
      break;
    }

    stdout.write("Enter a letter: ");
    String guess = stdin.readLineSync()?.toLowerCase() ?? '';
    if (guess.length != 1 || !guess.contains(RegExp(r'[a-z]'))) {
      print("Invalid input. Please enter a single letter.");
      continue;
    }

    if (guessedLetters.contains(guess)) {
      print("You already guessed '$guess'. Try another letter.");
      continue;
    }

    guessedLetters.add(guess);

    if (!wordToGuess.contains(guess)) {
      attemptsLeft--;
      print("Incorrect guess. Try again.");
    }
  }

  if (attemptsLeft == 0) {
    print("Sorry, you've run out of attempts. The word was: $wordToGuess");
  }

  print("Thanks for playing Hangman!");
}
