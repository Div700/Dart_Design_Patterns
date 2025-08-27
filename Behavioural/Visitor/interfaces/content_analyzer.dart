import '../elements/quiz_assignment.dart';
import '../elements/video_lecture.dart';

abstract class ContentAnalyzer {
  void visitVideoLecture(VideoLecture video);
  void visitQuizAssignment(QuizAssignment quiz);
}