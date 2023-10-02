import 'dart:io';

void main() {
  print('Welcome to the Quiz Game!');
  int score = 0;

  // Define a list of questions and answers
  List<Question> questions = [
    Question(
      'What is the capital of France?',
      ['London', 'Berlin', 'Paris', 'Madrid'],
      2,
    ),
    Question(
      'Which planet is known as the Red Planet?',
      ['Earth', 'Mars', 'Venus', 'Jupiter'],
      1,
    ),
    Question(
      'What is the largest mammal in the world?',
      ['Elephant', 'Giraffe', 'Blue Whale', 'Hippopotamus'],
      2,
    ),
  ];

  for (var i = 0; i < questions.length; i++) {
    Question currentQuestion = questions[i];

    print('\nQuestion ${i + 1}: ${currentQuestion.question}');
    for (var j = 0; j < currentQuestion.options.length; j++) {
      print('${j + 1}. ${currentQuestion.options[j]}');
    }

    int userChoice = getUserChoice(currentQuestion.options.length);
    if (userChoice == currentQuestion.correctAnswer) {
      print('Correct!');
      score++;
    } else {
      print('Incorrect. The correct answer is: ${currentQuestion.options[currentQuestion.correctAnswer - 1]}');
    }
  }

  print('\nQuiz completed! Your score: $score out of ${questions.length}');
}

class Question {
  String question;
  List<String> options;
  int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}

int getUserChoice(int maxChoice) {
  int userChoice;
  while (true) {
    try {
      stdout.write('Enter your choice (1-$maxChoice): ');
      userChoice = int.parse(stdin.readLineSync() ?? '');
      if (userChoice >= 1 && userChoice <= maxChoice) {
        break;
      } else {
        print('Invalid choice. Please enter a valid option.');
      }
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
  return userChoice;
}



