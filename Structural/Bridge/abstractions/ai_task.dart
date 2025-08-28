import '../implementations/ai_model.dart';

/// This is the abstraction (high level) class of the Bridge pattern.
abstract class AITask {
  final AIModel model; //composition over inheritance
  AITask(this.model);

  Future<String> run(String input);
}