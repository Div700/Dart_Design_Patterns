import 'dart:async';
import 'AIModel.dart';

/// Concrete Implementor #2
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
