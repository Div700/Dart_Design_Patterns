// Abstract component interface
import '../user_level_enums.dart';

abstract class LearningComponent {
  Duration getTimeTakenToComplete(UserLevel level);
}