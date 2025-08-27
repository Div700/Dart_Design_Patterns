import '../circuit_breaker_context.dart';
import '../interfaces/circuit_breaker_state.dart';
import '../models/api_response.dart';
import '../service/api_service.dart';
import 'open_state.dart';

class ClosedState implements CircuitBreakerState {
  @override
  String get stateName => 'CLOSED';

  @override
  Future<ApiResponse> execute(CircuitBreakerContext context, String request) async {
    print('CLOSED: Processing $request');
    
    try {
      final response = await ApiService.makeApiCall(request);
      context.resetFailureCount();
      return response;
    } catch (e) {
      context.incrementFailureCount();
      print('CLOSED: Failure count: ${context.failureCount}');
      
      if (context.failureCount >= context.failureThreshold) {
        print('CLOSED: Switching to OPEN');
        context.transitionTo(OpenState());
        context.startTimeout();
      }
      
      return ApiResponse(isSuccess: false, data: e.toString());
    }
  }
}