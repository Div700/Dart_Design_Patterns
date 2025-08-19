// Concrete Builder 2 - Underground Level Builder
import '../builder_interfaces/abstract_mario_builder.dart';

class UndergroundLevelBuilder extends MarioLevelBuilder {
  @override
  void buildBackground() {
    backgroundTheme = 'Dark cave with stone walls and stalactites';
  }

  @override
  void buildPlatforms() {
    platforms.addAll([
      'Stone ground tiles',
      'Floating stone platforms',
      'Narrow ledges over pits',
      'Moving platforms',
      'Exit pipe at end'
    ]);
  }

  @override
  void buildEnemies() {
    enemies.addAll([
      'Buzzy Beetle at position 10',
      'Spiny at position 18',
      'Buzzy Beetle at position 28',
      'Lakitu throwing Spinies'
    ]);
  }

  @override
  void buildPowerUps() {
    powerUps.addAll([
      '1-Up Mushroom in secret area',
      'Star power-up before boss area'
    ]);
  }

  @override
  void buildCoins() {
    for (int i = 0; i < 25; i++) {
      coins.add('Underground coin at position ${i * 2}');
    }
  }

  @override
  void buildAudio() {
    music = 'Mysterious Underground Theme';
  }

  @override
  void buildTimeLimit() {
    timeLimit = '300 seconds';
  }
}
