import 'dart:async';
import '../implementations/ai_model.dart';
import '../abstractions/ai_task.dart';

/* This is the refined abstraction of the Bridge pattern.
 * It is the concrete implementation of the AITask interface.
 */
class CodeGenerationTask extends AITask {
  CodeGenerationTask(AIModel model) : super(model);

  @override
  Future<String> run(String codeStub) async {
    try {
      print('→ [Task] Building code-gen prompt…');
      await Future.delayed(Duration(milliseconds: 300));
      final prompt = 'Complete this code:\n$codeStub';
      print('→ [Model] Thinking…');
      return model.generateResponse(prompt);
    } catch (e) {
      return 'Code Generation Task failed: Currently this service is not available';
    }
  }
}
