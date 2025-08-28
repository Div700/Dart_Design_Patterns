import 'models/player.dart';
import 'memento/checkpoint_memento.dart';

class GameStateOriginator {
  Player player; //this is the object that we are going to save the state of

  GameStateOriginator({required this.player});

  // Originator creates memento of its current state
  CheckpointMemento createMemento(String reason) {
    print('ORIGINATOR: Creating memento - $reason');
    return CheckpointMemento(
      name: player.name,
      level: player.level,
      health: player.health,
      x: player.x,
      y: player.y,
      reason: reason,
    );
  }

  // Originator restores its state from memento
  void restoreFromMemento(CheckpointMemento memento) {
    print('ORIGINATOR: Restoring from memento - ${memento.reason}');
    player = memento.toPlayer();
  }

  // Game actions that change state
  void moveTo(double newX, double newY) {
    player.x = newX;
    player.y = newY;
    print('Moved to ($newX, $newY)');
  }

  void levelUp() {
    player.level++;
    print('Leveled up to ${player.level}');
  }

  void takeDamage(int damage) {
    player.health -= damage;
    print('Took $damage damage. Health: ${player.health}');
  }

  bool isPlayerDead() {
    return player.health <= 0;
  }

  void showStatus() {
    print('Current: $player');
  }
}