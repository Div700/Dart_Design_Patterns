import 'interfaces/circuit_breaker_state.dart';
import 'models/api_response.dart';
import 'states/closed_state.dart';

class CircuitBreakerContext {
  CircuitBreakerState _currentState;
  int _failureCount = 0;
  DateTime? _timeoutStart;
  
  final int failureThreshold;
  final Duration timeoutDuration;

  CircuitBreakerContext({
    this.failureThreshold = 3,
    this.timeoutDuration = const Duration(seconds: 5),
  }) : _currentState = ClosedState();

  void transitionTo(CircuitBreakerState newState) {
    _currentState = newState;
  }

  void incrementFailureCount() => _failureCount++;
  void resetFailureCount() => _failureCount = 0;
  void startTimeout() => _timeoutStart = DateTime.now();
  
  bool isTimeoutExpired() {
    if (_timeoutStart == null) return false;
    return DateTime.now().difference(_timeoutStart!).inSeconds >= timeoutDuration.inSeconds;
  }

  // Getters for monitoring
  int get failureCount => _failureCount;
  String get currentState => _currentState.stateName;
  
  // For backward compatibility, keeping execute method
  Future<ApiResponse> execute(String request) async {
    return await _currentState.execute(this, request);
  }
}