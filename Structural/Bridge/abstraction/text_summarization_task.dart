import 'dart:async';
import '../implementation/AIModel.dart';
import 'AITask.dart';

/// Refined Abstraction #2
class SummarizationTask extends AITask {
  SummarizationTask(AIModel model) : super(model);

  @override
  Future<String> run(String text) async {
    try {
      print('→ [Task] Building summarization prompt…');
      await Future.delayed(Duration(milliseconds: 300));
      final prompt = 'Summarize:\n$text';
      print('→ [Model] Thinking…');
      return model.generateResponse(prompt);
    } catch (e) {
      return 'Summarization Task failed: Currently this service is not available';
    }
  }
}