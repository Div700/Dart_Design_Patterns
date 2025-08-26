import '../subsystems/audio_systems.dart';
import '../subsystems/graphic_systems.dart';
import '../subsystems/input_systems.dart';
import '../constants/game_state_enums.dart';

class GameFacade {
  final GraphicsSystem _graphics = GraphicsSystem();
  final AudioSystem _audio = AudioSystem();
  final InputSystem _input = InputSystem();

  GameState _state = GameState.stopped;
  GameState get state => _state;

  /// Start the entire game system
  Future<void> startGame() async {
    try {
      if (_state == GameState.running) {
        print('Game already running!');
      } else {
        print('\nStarting Game...');
        _graphics.initialize();
        _audio.initialize();
        _input.initialize();
        _state = GameState.running;
        print('Game Started!\n');
      }
    } catch (e) {
      print('Error starting game: $e');
    }
  }

  /// Stop the entire game system
  Future<void> stopGame() async {
    try {
      if (_state == GameState.stopped) {
        print('Game already stopped!');
      } else {
        print('\nStopping Game...');
        _input.shutdown();
        _audio.shutdown();
        _graphics.shutdown();
        _state = GameState.stopped;
        print('Game Stopped!\n');
      }
    } catch (e) {
      print('Error stopping game: $e');
    }
  }
}
