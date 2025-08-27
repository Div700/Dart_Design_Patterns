import '../interfaces/colleague.dart';

/// Bus colleague - represents a city bus
class Bus extends Colleague {
  final String route;

  Bus(String name, this.route) : super(name);

  @override
  void receiveMessage(String message, Colleague sender) {
    print('$name (Route $route): Received message from ${sender.name}');
    print('   Message: $message');
    
    // Bus-specific response logic
    if (message.contains('emergency')) {
      print('   $name: Pulling over to let emergency vehicle pass');
    } else if (message.contains('traffic jam')) {
      print('   $name: Taking alternate route to avoid congestion');
    } else {
      print('   $name: Acknowledged message');
    }
  }

  /// Bus announces its route information
  void announceRoute() {
    sendMessage('Bus $name operating on route $route, requesting traffic updates');
  }

  /// Bus reports passenger capacity
  void reportCapacity(int passengers) {
    sendMessage('Bus $name has $passengers passengers, may need priority at intersections');
  }
}
