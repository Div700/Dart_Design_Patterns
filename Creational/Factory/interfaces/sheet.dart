import '../models/question.dart';
// Product interface
abstract class Sheet {
  Question? nextQuestion();
  void checkAnswer(String userAnswer, Question question);
  void saveProgress();
  bool get isFinished;
  String get subject;
}