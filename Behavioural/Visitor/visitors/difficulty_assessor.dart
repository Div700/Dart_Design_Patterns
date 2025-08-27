import '../elements/video_lecture.dart';
import '../elements/quiz_assignment.dart';
import '../interfaces/content_analyzer.dart';

class DifficultyAssessor implements ContentAnalyzer {
  @override
  void visitVideoLecture(VideoLecture video) {
    try {
      print('DIFFICULTY: Analyzing video "${video.title}"');

      String difficulty;
      if (video.durationMinutes > 60) {
        difficulty = 'Hard';
      } else if (video.durationMinutes > 30) {
        difficulty = 'Medium';
      } else {
        difficulty = 'Easy';
      }

      print('  Result: $difficulty (${video.durationMinutes} minutes)');
    } catch (e) {
      print('Error analyzing difficulty for video: $e');
    }
  }

  @override
  void visitQuizAssignment(QuizAssignment quiz) {
    try {
      print('DIFFICULTY: Analyzing quiz "${quiz.title}"');

      String difficulty;
      if (quiz.questionCount > 20) {
        difficulty = 'Hard';
      } else if (quiz.questionCount > 10) {
        difficulty = 'Medium';
      } else {
        difficulty = 'Easy';
      }

      print('  Result: $difficulty (${quiz.questionCount} questions)');
    } catch (e) {
      print('Error analyzing difficulty for quiz: $e');
    }
  }
}
