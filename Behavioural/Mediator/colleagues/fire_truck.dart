import '../interfaces/colleague.dart';

/// FireTruck colleague - represents a fire emergency vehicle
class FireTruck extends Colleague {
  final String emergencyLocation;

  FireTruck(String name, this.emergencyLocation) : super(name);

  @override
  void receiveMessage(String message, Colleague sender) {
    print('$name (→ $emergencyLocation): Received message from ${sender.name}');
    print('   Message: $message');
    
    // FireTruck-specific response logic
    if (message.contains('emergency')) {
      print('   $name: Coordinating emergency response');
    } else if (message.contains('clearance')) {
      print('   $name: Ensuring fire lane access remains clear');
    } else if (message.contains('route') || message.contains('traffic')) {
      print('   $name: Noted, maintaining emergency protocols');
    } else {
      print('   $name: Acknowledged message');
    }
  }

  /// FireTruck requests emergency response clearance
  void requestEmergencyResponse() {
    sendMessage('FIRE EMERGENCY: Fire truck $name responding to $emergencyLocation, need immediate clearance');
  }

  /// FireTruck reports incident status
  void reportIncidentStatus(String status) {
    sendMessage('Fire truck $name: Incident at $emergencyLocation - $status');
  }
}
