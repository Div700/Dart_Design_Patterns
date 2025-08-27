import '../interfaces/mediator.dart';
import '../interfaces/colleague.dart';

/// Concrete mediator for traffic control
/// Manages communication between all vehicles
class TrafficControlMediator implements Mediator {
  final List<Colleague> _colleagues = [];

  @override
  void addColleague(Colleague colleague) {
    _colleagues.add(colleague);
    colleague.setMediator(this);
    print('Traffic Control: ${colleague.name} registered in the system');
  }

  @override
  void sendMessage(String message, Colleague sender) {
    print('\nTraffic Control: Received message from ${sender.name}');
    print('Message: $message');
    
    // Forward message to all other colleagues except the sender
    for (final colleague in _colleagues) {
      if (colleague != sender) {
        colleague.receiveMessage(message, sender);
      }
    }
    print('Traffic Control: Message broadcast complete\n');
  }

  /// Get count of registered colleagues
  int get colleagueCount => _colleagues.length;

  /// Send emergency broadcast to all vehicles
  void emergencyBroadcast(String emergencyMessage) {
    print('\nEMERGENCY BROADCAST');
    print('Traffic Control: $emergencyMessage');
    
    for (final colleague in _colleagues) {
      print('→ Notifying ${colleague.name}');
    }
    print('Emergency broadcast complete\n');
  }
}
