import 'dart:async';
import '../implementations/ai_model.dart';
import '../abstractions/ai_task.dart';

/* This is the refined abstraction of the Bridge pattern.
 * It is the concrete implementation of the AITask interface.
 */
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