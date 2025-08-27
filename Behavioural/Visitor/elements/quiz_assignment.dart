import '../interfaces/content_analyzer.dart';
import '../interfaces/learning_element.dart';

class QuizAssignment implements LearningContent {
  final String _title;
  final int _questionCount;
  final String _subject;

  QuizAssignment({
    required String title,
    required int questionCount,
    required String subject,
  }) : _title = title,
       _questionCount = questionCount,
       _subject = subject;

  @override
  void accept(ContentAnalyzer analyzer) {
    analyzer.visitQuizAssignment(this);
  }

  String get title => _title;
  int get questionCount => _questionCount;
  String get subject => _subject;
}
