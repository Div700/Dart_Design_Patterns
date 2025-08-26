import 'container.dart';
import 'question.dart';
import 'user_level_enums.dart';

void main() {
  // Create individual questions
  var mathQuestion = Question(
    "What is 2+2?",
    {
      UserLevel.Beginner: Duration(minutes: 3),
      UserLevel.Intermediate: Duration(minutes: 1),
      UserLevel.Advanced: Duration(seconds: 30),
    }
  );
  
  var algebraQuestion = Question(
    "Solve: 2x + 5 = 13",
    {
      UserLevel.Beginner: Duration(minutes: 8),
      UserLevel.Intermediate: Duration(minutes: 4),
      UserLevel.Advanced: Duration(minutes: 2),
    }
  );
  
  var calculusQuestion = Question(
    "Find derivative of x²",
    {
      UserLevel.Beginner: Duration(minutes: 15),
      UserLevel.Intermediate: Duration(minutes: 8),
      UserLevel.Advanced: Duration(minutes: 3),
    }
  );
  
  // Create containers
  var basicMath = QuestionContainer("Basic Math");
  var advancedMath = QuestionContainer("Advanced Math");
  var fullCourse = QuestionContainer("Complete Math Course");
  
  // Build hierarchy
  basicMath.add(mathQuestion);
  basicMath.add(algebraQuestion);
  
  advancedMath.add(calculusQuestion);
  
  fullCourse.add(basicMath);
  fullCourse.add(advancedMath);
  
  // Test the implementation
  print("Time estimates for different user levels:\n");
  
  for (UserLevel level in UserLevel.values) {
    Duration totalTime = fullCourse.getTimeTakenToComplete(level);
    print("${level.toString().split('.').last}: ${_formatDuration(totalTime)}");
  }
  
  print("\nBreakdown by section:");
  print("Basic Math (Beginner): ${_formatDuration(basicMath.getTimeTakenToComplete(UserLevel.Beginner))}");
  print("Advanced Math (Beginner): ${_formatDuration(advancedMath.getTimeTakenToComplete(UserLevel.Beginner))}");
  
  print("\nIndividual question times (Intermediate level):");
  print("Math Question: ${_formatDuration(mathQuestion.getTimeTakenToComplete(UserLevel.Intermediate))}");
  print("Algebra Question: ${_formatDuration(algebraQuestion.getTimeTakenToComplete(UserLevel.Intermediate))}");
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  
  if (duration.inHours > 0) {
    return "${duration.inHours}:${twoDigitMinutes}:${twoDigitSeconds}";
  } else {
    return "${twoDigitMinutes}:${twoDigitSeconds}";
  }
}