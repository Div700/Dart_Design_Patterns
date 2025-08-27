import 'content_analyzer.dart';

abstract class LearningContent {
  String get title;
  void accept(ContentAnalyzer analyzer);
}