import '../interfaces/colleague.dart';

/// Ambulance colleague - represents an emergency ambulance
class Ambulance extends Colleague {
  final String hospitalDestination;

  Ambulance(String name, this.hospitalDestination) : super(name);

  @override
  void receiveMessage(String message, Colleague sender) {
    print('$name (→ $hospitalDestination): Received message from ${sender.name}');
    print('   Message: $message');
    message = message.toLowerCase();
    // Ambulance-specific response logic
    if (message.contains('route') || message.contains('traffic')) {
      print('   $name: Noted, maintaining emergency priority');
    } else if (message.contains('emergency')) {
      print('   $name: Coordinating with other emergency services');
    } else {
      print('   $name: Acknowledged, continuing to hospital');
    }
  }

  /// Ambulance requests emergency clearance
  void requestEmergencyClearance() {
    sendMessage('EMERGENCY: Ambulance $name needs immediate clearance to $hospitalDestination');
  }

  /// Ambulance reports arrival at destination
  void reportArrival() {
    sendMessage('Ambulance $name arrived at $hospitalDestination, emergency cleared');
  }
}
