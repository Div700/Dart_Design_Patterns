// Abstract component interface
import '../constants/user_level_enums.dart';

abstract class LearningComponent {
  Duration getTimeTakenToComplete(UserLevel level);
}