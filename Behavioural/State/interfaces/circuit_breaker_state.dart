import '../circuit_breaker_context.dart';
import '../models/api_response.dart';

abstract class CircuitBreakerState {
  String get stateName;
  Future<ApiResponse> execute(CircuitBreakerContext context, String request);
}