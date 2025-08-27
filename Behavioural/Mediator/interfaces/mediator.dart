import 'colleague.dart';

/// Abstract mediator interface
/// Defines how colleagues communicate through the mediator
abstract class Mediator {
  /// Send a message from one colleague to others
  void sendMessage(String message, Colleague sender);
  
  /// Add a colleague to the mediator
  void addColleague(Colleague colleague);
}
