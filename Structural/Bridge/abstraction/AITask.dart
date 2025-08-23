import '../implementation/AIModel.dart';

/// The Abstraction in the Bridge.
abstract class AITask {
  final AIModel model;  // ← the Bridge pointer
  AITask(this.model);

  /// Perform the task by delegating to [model].
  Future<String> run(String input);
}