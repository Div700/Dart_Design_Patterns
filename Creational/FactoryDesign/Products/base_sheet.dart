// BaseSheet implements most of the logic
import '../Interfaces/Sheet.dart';
import '../models/question.dart';

class BaseSheet implements Sheet {
  final List<Question> _questions;
  int _currentIndex = 0;
  int _correctCount = 0;

  BaseSheet(this._questions);

  @override
  Question? nextQuestion() {
    if (_currentIndex >= _questions.length) return null;
    return _questions[_currentIndex++];
  }

  @override
  void checkAnswer(String userAnswer, Question question) {
    if (userAnswer.trim().toLowerCase() ==
        question.answer.toLowerCase().trim()) {
      print("Correct!");
      _correctCount++;
    } else {
      print("Incorrect. The right answer was: ${question.answer}");
    }
  }

  @override
  void saveProgress() {
    print("Progress: $_correctCount/${_currentIndex} correct so far.\n");
  }

  @override
  bool get isFinished => _currentIndex >= _questions.length;
}