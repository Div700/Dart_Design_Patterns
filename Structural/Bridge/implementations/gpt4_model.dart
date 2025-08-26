import 'dart:async';
import 'ai_model.dart';

/* This is the concrete implementation of the AIModel interface.
 */
class GPT4Model implements AIModel {
  @override
  Future<String> generateResponse(String prompt) async {
    try {
      await Future.delayed(Duration(milliseconds: 800));
      return 'GPT-4 says: “$prompt” → [response from GPT-4]';
    } catch (e) {
      return 'GPT-4 says: “$prompt” → [error: $e]';
    }
  }
}
