import '../models/question.dart';

abstract class LearningStrategy {
  List<Question> arrangeQuestions(List<Question> questions);
  String get name;
}