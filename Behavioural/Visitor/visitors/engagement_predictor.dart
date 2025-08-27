import '../elements/video_lecture.dart';
import '../elements/quiz_assignment.dart';
import '../interfaces/content_analyzer.dart';

class EngagementPredictor implements ContentAnalyzer {
  @override
  void visitVideoLecture(VideoLecture video) {
    try {
      print('ENGAGEMENT: Predicting for video "${video.title}"');

      String engagement;
      if (video.durationMinutes > 45) {
        engagement = 'Low (too long)';
      } else if (video.durationMinutes < 10) {
        engagement = 'Low (too short)';
      } else {
        engagement = 'High';
      }

      print('  Prediction: $engagement engagement');
    } catch (e) {
      print('Error predicting engagement for video: $e');
    }
  }

  @override
  void visitQuizAssignment(QuizAssignment quiz) {
    try {
      print('ENGAGEMENT: Predicting for quiz "${quiz.title}"');

      String engagement;
      if (quiz.subject == 'Math' && quiz.questionCount > 15) {
        engagement = 'Medium (challenging subject)';
      } else if (quiz.questionCount > 25) {
        engagement = 'Low (too many questions)';
      } else {
        engagement = 'High';
      }

      print('  Prediction: $engagement engagement');
    } catch (e) {
      print('Error predicting engagement for quiz: $e');
    }
  }
}
