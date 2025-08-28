import 'memento/checkpoint_memento.dart';
import 'game_state_originator.dart';

class CheckpointCaretaker {
  final List<CheckpointMemento> _checkpoints = [];
  final GameStateOriginator _originator;

  CheckpointCaretaker(this._originator);

  // Caretaker saves memento from originator
  void saveCheckpoint(String reason) {
    final memento = _originator.createMemento(reason);
    _checkpoints.add(memento);
    print('CARETAKER: Checkpoint saved - $reason');
  }

  // Caretaker restores originator from last memento
  bool restoreLastCheckpoint() {
    if (_checkpoints.isEmpty) {
      print('CARETAKER: No checkpoints available!');
      return false;
    }

    final lastCheckpoint = _checkpoints.last;
    _originator.restoreFromMemento(lastCheckpoint);
    print('CARETAKER: Restored to last checkpoint');
    return true;
  }

  // Caretaker restores from specific checkpoint
  bool restoreCheckpoint(int index) {
    if (index < 0 || index >= _checkpoints.length) {
      print('CARETAKER: Invalid checkpoint index');
      return false;
    }

    final checkpoint = _checkpoints[index];
    _originator.restoreFromMemento(checkpoint);
    print('CARETAKER: Restored checkpoint #${index + 1}');
    return true;
  }

  // Auto-checkpoint triggers (managed by caretaker)
  void autoSaveBeforeBoss() {
    saveCheckpoint('Before Boss Fight');
  }

  void autoSaveAfterLevelUp() {
    saveCheckpoint('After Level Up');
  }

  void autoSaveAreaTransition(String areaName) {
    saveCheckpoint('Entered $areaName');
  }

  void handlePlayerDeath() {
    print('CARETAKER: Player died! Attempting restore...');
    restoreLastCheckpoint();
  }

  void showCheckpoints() {
    if (_checkpoints.isEmpty) {
      print('CARETAKER: No checkpoints saved');
      return;
    }

    print('=== CARETAKER: SAVED CHECKPOINTS ===');
    for (int i = 0; i < _checkpoints.length; i++) {
      print('${i + 1}. ${_checkpoints[i]}');
    }
    print('===================================');
  }

  int get checkpointCount => _checkpoints.length;
}
