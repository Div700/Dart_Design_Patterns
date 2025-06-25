// Sheet interface
import '../models/question.dart';

abstract class Sheet {
  Question? nextQuestion();
  void checkAnswer(String userAnswer, Question question);
  void saveProgress();
  bool get isFinished;
}
