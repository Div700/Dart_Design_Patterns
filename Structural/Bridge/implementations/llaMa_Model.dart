import 'dart:async';

import 'ai_model.dart';

/* This is the concrete implementation of the AIModel interface.
 */
class LocalLlamaModel implements AIModel {
  @override
  Future<String> generateResponse(String prompt) async {
    try {
      await Future.delayed(Duration(milliseconds: 1200));
      return 'Local LLaMA says: “$prompt” → [response from Local LLaMA]';
    } catch (e) {
      return 'Local LLaMA says: “$prompt” → [error: $e]';
    }
  }
}