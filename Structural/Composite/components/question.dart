// Leaf class - Individual Question
import '../interfaces/IContent.dart';
import '../constants/user_level_enums.dart';

class Question implements LearningComponent {
  final String questionText;
  final Map<UserLevel, Duration> timeEstimates;
  
  Question(this.questionText, this.timeEstimates);
  
  @override
  Duration getTimeTakenToComplete(UserLevel level) {
    return timeEstimates[level] ?? Duration(minutes: 2); // Default 2 minutes
  }
}