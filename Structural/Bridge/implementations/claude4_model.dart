import 'dart:async';
import 'ai_model.dart';

/* This is the concrete implementation of the AIModel interface.
 */
class Claude4Model implements AIModel {
  @override
  Future<String> generateResponse(String prompt) async {
    try {
      await Future.delayed(Duration(milliseconds: 1000));
      return 'Claude-4 says: “$prompt” → [response from Claude-4]';
    } catch (e) {
      return 'Claude-4 says: “$prompt” → [error: $e]';
    }
  }
}
