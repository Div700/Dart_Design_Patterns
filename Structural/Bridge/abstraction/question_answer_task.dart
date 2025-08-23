import 'dart:async';
import '../implementation/AIModel.dart';
import 'AITask.dart';

/// Refined Abstraction #1
class QuestionAnsweringTask extends AITask {
  QuestionAnsweringTask(AIModel model) : super(model);

  @override
  Future<String> run(String question) async {
    try {
      print('→ [Task] Building QA prompt…');
      await Future.delayed(Duration(milliseconds: 300));
      final prompt = 'Q: $question\nA:';
      print('→ [Model] Thinking…');
      return model.generateResponse(prompt);
    } catch (e) {
      return 'Question Answering Task failed: Currently this service is not available';
    }
  }
}