import 'dart:async';
import '../implementation/AIModel.dart';
import 'AITask.dart';

/// Refined Abstraction #3
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
