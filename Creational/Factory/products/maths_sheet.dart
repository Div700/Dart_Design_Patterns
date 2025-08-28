import '../interfaces/sheet.dart';
import '../models/question.dart';

class MathsSheet implements Sheet {
  final List<Question> _questions;
  int _currentIndex = 0;
  int _correctCount = 0;

  MathsSheet() : _questions = [
    Question('What is 2 + 2?', '4'),
    Question('What is 5 * 3?', '15'),
    Question('What is 10 - 7?', '3'),
    Question('What is 8 / 2?', '4'),
    Question('What is 3^2?', '9'),
    Question('What is 12 / 4?', '3'),
    Question('What is 7 + 8?', '15'),
  ];

  @override
  Question? nextQuestion() {
    if (_currentIndex >= _questions.length) return null;
    return _questions[_currentIndex++];
  }

  @override
  void checkAnswer(String userAnswer, Question question) {
    if (userAnswer.trim().toLowerCase() == question.answer.toLowerCase().trim()) {
      print("Correct! Great math skills!");
      _correctCount++;
    } else {
      print("Incorrect. The right answer was: ${question.answer}");
    }
  }

  @override
  void saveProgress() {
    print("Math Progress: $_correctCount/${_currentIndex} correct so far.\n");
  }

  @override
  bool get isFinished => _currentIndex >= _questions.length;

  @override
  String get subject => 'Mathematics';
}