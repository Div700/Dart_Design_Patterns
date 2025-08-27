import 'mediator/traffic_control_mediator.dart';
import 'colleagues/bus.dart';
import 'colleagues/ambulance.dart';
import 'colleagues/fire_truck.dart';

/// Demonstration of the Mediator Design Pattern
/// Shows how vehicles communicate through a traffic control mediator
void main() {
  print('=== Mediator Design Pattern - Traffic Control System ===\n');

  // Create the mediator
  final trafficControl = TrafficControlMediator();

  // Create colleagues (vehicles)
  final bus1 = Bus('City Bus 42', '5A');
  final bus2 = Bus('Express Bus 15', '12B');
  final ambulance = Ambulance('Ambulance Alpha', 'General Hospital');
  final fireTruck = FireTruck('Fire Engine 7', '123 Main Street');

  print('>>> Registering vehicles with traffic control...\n');

  // Register all vehicles with the mediator
  trafficControl.addColleague(bus1);
  trafficControl.addColleague(bus2);
  trafficControl.addColleague(ambulance);
  trafficControl.addColleague(fireTruck);

  print('\n>>> Normal traffic communication...\n');

  // Normal traffic operations
  bus1.announceRoute();
  
  print('\n' + '=' * 60 + '\n');
  
  bus2.reportCapacity(45);

  print('\n' + '=' * 60 + '\n');

  print('>>> Emergency situations...\n');

  // Emergency situations
  ambulance.requestEmergencyClearance();

  print('\n' + '=' * 60 + '\n');

  fireTruck.requestEmergencyResponse();

  print('\n' + '=' * 60 + '\n');

  print('>>> Emergency resolution...\n');

  // Emergency resolution
  fireTruck.reportIncidentStatus('Fire under control, returning to station');

  print('\n' + '=' * 60 + '\n');

  ambulance.reportArrival();

  print('\n' + '=' * 60 + '\n');

  print('>>> Traffic control emergency broadcast...\n');

  // Mediator-initiated emergency broadcast
  trafficControl.emergencyBroadcast('Severe weather alert: All vehicles exercise caution');
  print('\nTotal vehicles registered: ${trafficControl.colleagueCount}');
}
