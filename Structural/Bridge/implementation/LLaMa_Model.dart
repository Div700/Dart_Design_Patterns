import 'dart:async';
import 'AIModel.dart';

/// Concrete Implementor #3
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