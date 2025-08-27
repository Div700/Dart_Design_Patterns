import '../interfaces/observer.dart';

class User implements Observer {
  final String name;

  User({required this.name});

  @override
  void update(String channelName, String videoTitle) {
    print('$name received notification: New video "$videoTitle" uploaded on $channelName');
  }
}