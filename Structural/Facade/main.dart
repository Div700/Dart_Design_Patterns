import 'dart:io';
import 'facade/game_facade.dart';
import 'constants/game_state_enums.dart';

Future<void> main() async {
  final game = GameFacade();

  print('Simple Game Engine Demo');
  print('Demonstrates Facade Design Pattern\n');
  String choice = '';
  while (choice != '3') {
    _showMenu(game);

    stdout.write('Choice: ');
    final choice = stdin.readLineSync()?.trim() ?? '';

    await _handleChoice(game, choice);

    print('Press Enter...');
    stdin.readLineSync();
  }

  print('Goodbye!');
}

void _showMenu(GameFacade game) {
  print('=' * 30);
  print('GAME CONTROL');
  print('State: ${game.state.name.toUpperCase()}');
  print('=' * 30);
  print('1) Start Game');
  print('2) Stop Game');
  print('3) Exit');
  print('=' * 30);
}

Future<void> _handleChoice(GameFacade game, String choice) async {
  switch (choice) {
    case '1':
      await game.startGame();
      break;
    case '2':
      await game.stopGame();
      break;
    case '3':
      if (game.state == GameState.running) {
        await game.stopGame();
      }
      break;
    default:
      print('Invalid choice!');
  }
}
