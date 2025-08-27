import 'models/player.dart';
import 'game_state_originator.dart';
import 'checkpoint_caretaker.dart';

void main() {
  print('=== MEMENTO PATTERN: AUTO CHECKPOINT DEMO ===\n');

  // Create originator with initial state
  final player = Player(name: 'Hero', level: 1, health: 100, x: 0.0, y: 0.0);

  final gameOriginator = GameStateOriginator(player: player);
  final checkpointManager = CheckpointCaretaker(gameOriginator);

  print('--- STARTING GAME ---');
  gameOriginator.showStatus();

  print('\n--- EXPLORING WORLD ---');
  gameOriginator.moveTo(10.0, 15.0);
  checkpointManager.autoSaveAreaTransition('Forest');

  gameOriginator.moveTo(25.0, 30.0);
  gameOriginator.levelUp();
  checkpointManager.autoSaveAfterLevelUp();

  gameOriginator.showStatus();
  checkpointManager.showCheckpoints();

  print('\n--- APPROACHING BOSS ---');
  gameOriginator.moveTo(50.0, 50.0);
  checkpointManager.autoSaveBeforeBoss();

  print('\n--- BOSS FIGHT ---');
  gameOriginator.takeDamage(30);
  gameOriginator.takeDamage(25);
  gameOriginator.showStatus();

  gameOriginator.takeDamage(50);

  if (gameOriginator.isPlayerDead()) {
    checkpointManager.handlePlayerDeath();
  }

  print('\n--- AFTER RESTORATION ---');
  gameOriginator.showStatus();

  print('\n--- SECOND ATTEMPT ---');
  gameOriginator.takeDamage(20);
  gameOriginator.takeDamage(15);
  print(
    'Boss defeated! Player survived with ${gameOriginator.player.health} HP',
  );

  print('\n--- FINAL CHECKPOINTS ---');
  checkpointManager.showCheckpoints();
}
