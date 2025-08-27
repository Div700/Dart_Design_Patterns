import '../circuit_breaker_context.dart';
import '../interfaces/circuit_breaker_state.dart';
import '../models/api_response.dart';
import '../service/api_service.dart';
import 'closed_state.dart';
import 'open_state.dart';

class HalfOpenState implements CircuitBreakerState {
  @override
  String get stateName => 'HALF-OPEN';

  @override
  Future<ApiResponse> execute(CircuitBreakerContext context, String request) async {
    print('HALF-OPEN: Testing $request');
    
    try {
      final response = await ApiService.makeApiCall(request);
      print('HALF-OPEN: Success, switching to CLOSED');
      context.transitionTo(ClosedState());
      context.resetFailureCount();
      return response;
    } catch (e) {
      print('HALF-OPEN: Failed, switching back to OPEN');
      context.transitionTo(OpenState());
      context.startTimeout();
      return ApiResponse(isSuccess: false, data: e.toString());
    }
  }
}