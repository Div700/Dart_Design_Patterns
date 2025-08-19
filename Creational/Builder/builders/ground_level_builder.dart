// Concrete Builder 1 - Ground Level Builder
import '../builder_interfaces/abstract_mario_builder.dart';

class GroundLevelBuilder extends MarioLevelBuilder {
  @override
  void buildBackground() {
    backgroundTheme = 'Green hills with blue sky and white clouds';
  }

  @override
  void buildPlatforms() {
    platforms.addAll([
      'Ground tiles (full width)',
      'Brick platform at height 3',
      'Pipe entrance at position 20',
      'Staircase blocks (ascending)',
      'Flag pole platform',
    ]);
  }

  @override
  void buildEnemies() {
    enemies.addAll([
      'Goomba at position 15',
      'Koopa Troopa at position 25',
      'Goomba at position 35',
      'Piranha Plant in pipe',
    ]);
  }

  @override
  void buildPowerUps() {
    powerUps.addAll([
      'Super Mushroom in question block',
      'Fire Flower in hidden block',
    ]);
  }

  @override
  void buildCoins() {
    for (int i = 0; i < 15; i++) {
      coins.add('Coin at position ${i * 3}');
    }
  }

  @override
  void buildAudio() {
    music = 'Classic Overworld Theme';
  }

  @override
  void buildTimeLimit() {
    timeLimit = '400 seconds';
  }
}
