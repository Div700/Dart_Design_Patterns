import '../circuit_breaker_context.dart';
import '../interfaces/circuit_breaker_state.dart';
import '../models/api_response.dart';
import 'half_open_state.dart';

class OpenState implements CircuitBreakerState {
  @override
  String get stateName => 'OPEN';

  @override
  Future<ApiResponse> execute(CircuitBreakerContext context, String request) async {
    if (context.isTimeoutExpired()) {
      print('OPEN: Timeout expired, switching to HALF-OPEN');
      context.transitionTo(HalfOpenState());
      return context.execute(request);
    }
    
    print('OPEN: Failing fast');
    return ApiResponse(isSuccess: false, data: 'Circuit breaker is OPEN');
  }
}