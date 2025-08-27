import 'circuit_breaker_context.dart';
import 'service/api_service.dart';

void main() async {
    final circuitBreaker = CircuitBreakerContext(
    failureThreshold: 3,
    timeoutDuration: Duration(seconds: 5),
  );
  ApiService.reset();

  final requests = [
    'getUserData', // Success
    'getOrders', // Success
    'getPayments', // Fail
    'getProfile', // Fail
    'getSettings', // Fail (opens circuit)
    'getNotifications', // Blocked
    'getPreferences', // Blocked
  ];

  for (int i = 0; i < requests.length; i++) {
    print('Request ${i + 1}: ${requests[i]}');

    final response = await circuitBreaker.execute(requests[i]);
    print('Response: $response');
    print(
      'State: ${circuitBreaker.currentState}, Failures: ${circuitBreaker.failureCount}\n',
    );

    await Future.delayed(Duration(milliseconds: 300));
  }

  print('--- Waiting for timeout ---');
  await Future.delayed(Duration(seconds: 6));

  print('Recovery test:');
  final recoveryResponse = await circuitBreaker.execute('recoveryTest');
  print('Response: $recoveryResponse');
  print('Final State: ${circuitBreaker.currentState}');
}
