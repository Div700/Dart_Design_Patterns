import 'dart:async';
import '../implementations/ai_model.dart';
import '../abstractions/ai_task.dart';

/* This is the refined abstraction of the Bridge pattern.
 * It is the concrete implementation of the AITask interface.
 */
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