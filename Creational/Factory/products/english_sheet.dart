import '../interfaces/sheet.dart';
import '../models/question.dart';

class EnglishSheet implements Sheet {
  final List<Question> _questions;
  int _currentIndex = 0;
  int _correctCount = 0;

  EnglishSheet() : _questions = [
    Question('What is the past tense of "run"?', 'ran'),
    Question('What is the plural of "child"?', 'children'),
    Question('What is a synonym for "happy"?', 'joyful'),
    Question('What is the opposite of "hot"?', 'cold'),
    Question('What type of word is "quickly"?', 'adverb'),
    Question('What is the past tense of "go"?', 'went'),
    Question('What is the plural of "mouse"?', 'mice'),
  ];

  @override
  Question? nextQuestion() {
    if (_currentIndex >= _questions.length) return null;
    return _questions[_currentIndex++];
  }

  @override
  void checkAnswer(String userAnswer, Question question) {
    if (userAnswer.trim().toLowerCase() == question.answer.toLowerCase().trim()) {
      print("Excellent! Your English is improving!");
      _correctCount++;
    } else {
      print("Not quite right. The correct answer was: ${question.answer}");
    }
  }

  @override
  void saveProgress() {
    print("English Progress: $_correctCount/${_currentIndex} correct so far.\n");
  }

  @override
  bool get isFinished => _currentIndex >= _questions.length;

  @override
  String get subject => 'English';
}