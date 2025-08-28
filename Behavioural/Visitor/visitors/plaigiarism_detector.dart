import '../elements/video_lecture.dart';
import '../elements/quiz_assignment.dart';
import '../interfaces/content_analyzer.dart';

class PlagiarismDetector implements ContentAnalyzer {
  @override
  void visitVideoLecture(VideoLecture video) {
    try {
      print('PLAGIARISM: Checking video "${video.title}"');

      // Simple check based on content length
      bool suspicious = video.content.length < 50;

      if (suspicious) {
        print('  Result: SUSPICIOUS - Content too short');
      } else {
        print('  Result: CLEAN - Content appears original');
      }
    } catch (e) {
      print('Error checking plagiarism for video: $e');
    }
  }

  @override
  void visitQuizAssignment(QuizAssignment quiz) {
    try {
      print('PLAGIARISM: Checking quiz "${quiz.title}"');

      // Simple check based on question count
      bool suspicious = quiz.questionCount < 5;

      if (suspicious) {
        print('  Result: SUSPICIOUS - Too few questions for ${quiz.subject}');
      } else {
        print('  Result: CLEAN - Question count appropriate');
      }
    } catch (e) {
      print('Error checking plagiarism for quiz: $e');
    }
  }
}
