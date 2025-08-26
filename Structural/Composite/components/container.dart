// Composite class - Container for questions or other containers
import '../interfaces/IContent.dart';
import '../constants/user_level_enums.dart';

class QuestionContainer implements LearningComponent {
  final String name;
  final List<LearningComponent> components = [];
  
  QuestionContainer(this.name);
  
  void add(LearningComponent component) {
    components.add(component);
  }
  
  void remove(LearningComponent component) {
    components.remove(component);
  }
  
  @override
  Duration getTimeTakenToComplete(UserLevel level) {
    return components.fold(Duration.zero, 
      (total, component) => total + component.getTimeTakenToComplete(level));
  }
  
  // Helper method to get component count
  int getComponentCount() => components.length;
}