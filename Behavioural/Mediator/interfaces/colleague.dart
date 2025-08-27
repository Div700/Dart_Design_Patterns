import 'mediator.dart';

/// Abstract colleague class
/// All colleagues must communicate through the mediator
abstract class Colleague {
  final String name;
  Mediator? _mediator;

  Colleague(this.name);

  /// Set the mediator for this colleague
  void setMediator(Mediator mediator) {
    _mediator = mediator;
  }

  /// Send a message through the mediator
  void sendMessage(String message) {
    if (_mediator != null) {
      _mediator!.sendMessage(message, this);
    } else {
      print('$name: No mediator set, cannot send message');
    }
  }

  /// Receive a message from the mediator
  void receiveMessage(String message, Colleague sender);
}
