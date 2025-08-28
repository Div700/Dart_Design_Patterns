import '../interfaces/sheet.dart';
import '../models/question.dart';

class ScienceSheet implements Sheet {
  final List<Question> _questions;
  int _currentIndex = 0;
  int _correctCount = 0;

  ScienceSheet() : _questions = [
    Question('What gas do plants absorb from the atmosphere?', 'carbon dioxide'),
    Question('What is the chemical symbol for water?', 'h2o'),
    Question('How many bones are in the adult human body?', '206'),
    Question('What planet is known as the Red Planet?', 'mars'),
    Question('What is the speed of light in m/s?', '299792458'),
    Question('What is the largest organ in the human body?', 'skin'),
    Question('What gas makes up most of Earth\'s atmosphere?', 'nitrogen'),
  ];

  @override
  Question? nextQuestion() {
    if (_currentIndex >= _questions.length) return null;
    return _questions[_currentIndex++];
  }

  @override
  void checkAnswer(String userAnswer, Question question) {
    if (userAnswer.trim().toLowerCase() == question.answer.toLowerCase().trim()) {
      print("Fantastic! You're a science star!");
      _correctCount++;
    } else {
      print("That's not correct. The answer was: ${question.answer}");
    }
  }

  @override
  void saveProgress() {
    print("Science Progress: $_correctCount/${_currentIndex} correct so far.\n");
  }

  @override
  bool get isFinished => _currentIndex >= _questions.length;

  @override
  String get subject => 'Science';
}