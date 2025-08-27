import 'elements/video_lecture.dart';
import 'visitors/difficulty_assessor.dart';
import 'visitors/engagement_predictor.dart';
import 'elements/quiz_assignment.dart';
import 'visitors/plaigiarism_detector.dart';

void main() {
  // Create learning content
  final content = [
    VideoLecture(
      title: 'Introduction to Calculus',
      durationMinutes: 45,
      content: 'This comprehensive video covers the fundamentals of calculus including derivatives and integrals...',
    ),
    VideoLecture(
      title: 'Quick Math Tips',
      durationMinutes: 15,
      content: 'Short video with tips.',
    ),
    QuizAssignment(
      title: 'Calculus Quiz',
      questionCount: 12,
      subject: 'Math',
    ),
    QuizAssignment(
      title: 'History Test',
      questionCount: 25,
      subject: 'History',
    ),
  ];

  // Create analyzers
  final difficultyAssessor = DifficultyAssessor();
  final plagiarismDetector = PlagiarismDetector();
  final engagementPredictor = EngagementPredictor();

  // Analyze all content with different behaviors
  print('--- DIFFICULTY ASSESSMENT ---');
  for (final item in content) {
    item.accept(difficultyAssessor);
    print('');
  }

  print('--- PLAGIARISM DETECTION ---');
  for (final item in content) {
    item.accept(plagiarismDetector);
    print('');
  }

  print('--- ENGAGEMENT PREDICTION ---');
  for (final item in content) {
    item.accept(engagementPredictor);
    print('');
  }
}   