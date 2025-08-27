# Circuit Breaker State Pattern - Dart Implementation

A robust implementation of the Circuit Breaker pattern using the State design pattern to handle API failures gracefully in microservices architecture.

## Overview

This project demonstrates how the Circuit Breaker pattern can be implemented using the State design pattern to prevent cascading failures in distributed systems. The circuit breaker monitors API calls and automatically opens when failures exceed a threshold, preventing further calls to a failing service.

## Circuit Breaker States

### Closed State (Normal Operation)
- **Behavior**: Allows all API calls to pass through
- **Monitoring**: Tracks failure count for each request
- **Transition**: Switches to OPEN when failure threshold is reached

### Open State (Failing Fast)
- **Behavior**: Blocks all API calls immediately
- **Protection**: Prevents further load on failing service
- **Transition**: Switches to HALF-OPEN after timeout period expires

### Half-Open State (Testing Recovery)
- **Behavior**: Allows limited test calls to check service recovery
- **Success**: Returns to CLOSED state if test call succeeds
- **Failure**: Returns to OPEN state if test call fails

## Project Structure

```
lib/
├── context/
│   └── circuit_breaker_context.dart  # State management and transitions
├── models/
│   └── api_response.dart              # API response data model
├── services/
│   └── api_service.dart               # Simulated API service
└── states/
    ├── circuit_breaker_state.dart     # State interface
    ├── closed_state.dart              # Normal operation state
    ├── open_state.dart                # Circuit open state
    └── half_open_state.dart           # Recovery testing state

example/
└── main.dart                          # Demo application
```

## Key Features

- **Automatic Failure Detection**: Monitors API call success/failure rates
- **Configurable Thresholds**: Customizable failure limits and timeout durations
- **State-Based Behavior**: Different handling for each circuit breaker state
- **Recovery Testing**: Automatic attempts to restore service connectivity
- **Fail-Fast Mechanism**: Immediate rejection during service outages

## Configuration Parameters

- **Failure Threshold**: Number of failures before opening circuit (default: 3)
- **Timeout Duration**: Time to wait before testing recovery (default: 5 seconds)

## State Transitions

```
CLOSED --[failures ≥ threshold]--> OPEN
OPEN --[timeout expired]--> HALF-OPEN
HALF-OPEN --[test success]--> CLOSED
HALF-OPEN --[test failure]--> OPEN
```

## Usage Example

```dart
// Create circuit breaker
final circuitBreaker = CircuitBreakerContext(
  failureThreshold: 3,
  timeoutDuration: Duration(seconds: 5),
);

// Make API calls
final response = await circuitBreaker.call('getUserData');
print('Response: $response');
print('State: ${circuitBreaker.currentState}');
```

## Running the Demo

```bash
dart run example/main.dart
```

## Sample Output

```
=== CIRCUIT BREAKER STATE PATTERN ===

Request 1: getUserData
CLOSED: Processing getUserData
Response: SUCCESS: Data for getUserData
State: CLOSED, Failures: 0

Request 3: getPayments
CLOSED: Processing getPayments
CLOSED: Failure count: 1
Response: FAILED: Exception: API failure
State: CLOSED, Failures: 1

Request 5: getSettings
CLOSED: Processing getSettings
CLOSED: Failure count: 3
CLOSED: Failure threshold reached
CONTEXT: Transitioning to OPEN state
Response: FAILED: Exception: API failure
State: OPEN, Failures: 3

Request 6: getNotifications
OPEN: Failing fast
Response: FAILED: Circuit breaker is OPEN
State: OPEN, Failures: 3
```

## Benefits of State Pattern Implementation

### Clean Separation of Concerns
- Each state handles only its specific behavior
- Context manages state transitions and shared data
- No complex conditional logic scattered throughout code

### Maintainability
- Adding new states requires minimal changes
- State-specific logic is isolated and testable
- Clear transition rules and responsibilities

### Flexibility
- Easy to modify state behavior independently
- Configurable thresholds and timeouts
- Extensible for additional circuit breaker features

## Real-World Applications

This pattern is essential in:
- **Microservices Architecture**: Preventing cascade failures between services
- **API Gateways**: Protecting backend services from overload
- **Database Connections**: Handling database outages gracefully
- **External Service Calls**: Managing third-party API reliability
- **Cloud Applications**: Dealing with network partition scenarios

## Design Principles

### State Pattern Benefits
- **Open/Closed Principle**: Open for extension, closed for modification
- **Single Responsibility**: Each state has one clear purpose
- **State Encapsulation**: State-specific behavior is contained

### Circuit Breaker Benefits
- **Fail-Fast**: Immediate feedback during outages
- **Resource Protection**: Prevents resource exhaustion
- **Automatic Recovery**: Self-healing capability
- **System Stability**: Maintains overall system health

## Testing Strategy

Each component can be tested independently:
- **States**: Test behavior in isolation with mock contexts
- **Context**: Test state transitions and threshold logic
- **Integration**: Test complete failure and recovery scenarios

## Performance Considerations

- **Low Overhead**: Minimal performance impact during normal operation
- **Fast Failure**: Immediate response during circuit open state
- **Memory Efficient**: Lightweight state objects with shared context

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Run the demo:
   ```bash
   dart run example/main.dart
   ```

## Requirements

- Dart SDK 2.17.0 or higher

## Design Pattern Category

**Behavioral + Structural Pattern Combination**
- **State Pattern**: Manages behavior changes based on internal state
- **Circuit Breaker Pattern**: Provides fault tolerance and system resilience

## License

This project is for educational purposes demonstrating the State design pattern in circuit breaker implementation.