import '../interfaces/content_analyzer.dart';
import '../interfaces/learning_element.dart';

class VideoLecture implements LearningContent {
  final String _title;
  final int _durationMinutes;
  final String _content;

  VideoLecture({
    required String title,
    required int durationMinutes,
    required String content,
  }) : _title = title,
       _durationMinutes = durationMinutes,
       _content = content;

  @override
  void accept(ContentAnalyzer analyzer) {
    analyzer.visitVideoLecture(this);
  }

  String get title => _title;
  int get durationMinutes => _durationMinutes;
  String get content => _content;
}
