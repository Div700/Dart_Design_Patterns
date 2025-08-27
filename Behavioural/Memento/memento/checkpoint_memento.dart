import '../models/player.dart';

class CheckpointMemento {
  final String name;
  final int level;
  final int health;
  final double x, y;
  final String reason;
  final DateTime time;

  CheckpointMemento({
    required this.name,
    required this.level,
    required this.health,
    required this.x,
    required this.y,
    required this.reason,
  }) : time = DateTime.now();

  Player toPlayer() {
    return Player(
      name: name,
      level: level,
      health: health,
      x: x,
      y: y,
    );
  }

  @override
  String toString() {
    return 'Memento: $reason (Lv.$level, HP:$health) at ${time.toString().substring(11, 16)}';
  }
}