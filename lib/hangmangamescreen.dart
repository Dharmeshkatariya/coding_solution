import 'package:flutter/material.dart';
import 'dart:math';



class HangmanScreen extends StatefulWidget {
  @override
  _HangmanScreenState createState() => _HangmanScreenState();
}

class _HangmanScreenState extends State<HangmanScreen> {
  final List<String> words = ["apple", "banana", "cherry", "grape", "orange", "strawberry"];
  Random random = Random();
  String wordToGuess = '';
  String displayWord = '';
  List<String> guessedLetters = [];
  int attemptsLeft = 6;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    wordToGuess = words[random.nextInt(words.length)];
    displayWord = List.filled(wordToGuess.length, '_').join();
    guessedLetters = [];
    attemptsLeft = 6;
  }

  void guessLetter(String letter) {
    setState(() {
      if (!guessedLetters.contains(letter)) {
        guessedLetters.add(letter);
        if (!wordToGuess.contains(letter)) {
          attemptsLeft--;
        }
        updateDisplayWord();
      }
    });
  }

  void updateDisplayWord() {
    List<String> newDisplayWord = List.from(displayWord as Iterable);
    for (int i = 0; i < wordToGuess.length; i++) {
      if (guessedLetters.contains(wordToGuess[i])) {
        newDisplayWord[i] = wordToGuess[i];
      }
    }
    setState(() {
      displayWord = newDisplayWord.join();
    });
    checkWin();
  }

  void checkWin() {
    if (displayWord == wordToGuess) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('You guessed the word: $wordToGuess'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  startGame();
                },
                child: Text('Play Again'),
              ),
            ],
          );
        },
      );
    } else if (attemptsLeft == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('The word was: $wordToGuess'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  startGame();
                },
                child: Text('Play Again'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hangman Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Attempts Left: $attemptsLeft',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Word to Guess:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              displayWord,
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
            Text(
              'Guessed Letters: ${guessedLetters.join(', ')}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(26, (index) {
                final letter = String.fromCharCode('a'.codeUnitAt(0) + index);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      guessLetter(letter);
                    },
                    child: Text(letter),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
