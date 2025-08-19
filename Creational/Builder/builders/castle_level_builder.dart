// Concrete Builder 3 - Castle Level Builder
import '../builder_interfaces/abstract_mario_builder.dart';

class CastleLevelBuilder extends MarioLevelBuilder {
  @override
  void buildBackground() {
    backgroundTheme = 'Dark castle interior with torches and stone blocks';
  }

  @override
  void buildPlatforms() {
    platforms.addAll([
      'Stone castle floor',
      'Rotating fire bars platforms',
      'Narrow bridge over lava',
      'Collapsing bridge sections',
      'Boss platform area',
    ]);
  }

  @override
  void buildEnemies() {
    enemies.addAll([
      'Fire bar obstacle',
      'Podoboo (lava bubble)',
      'Bowser boss at end',
      'Fake Bowser (Goomba in disguise)',
    ]);
  }

  @override
  void buildPowerUps() {
    powerUps.addAll([
      'Fire Flower before boss',
      'Super Mushroom in secret block',
    ]);
  }

  @override
  void buildCoins() {
    for (int i = 0; i < 8; i++) {
      coins.add('Risky coin near fire bar ${i + 1}');
    }
  }

  @override
  void buildAudio() {
    music = 'Intense Castle/Boss Theme';
  }

  @override
  void buildTimeLimit() {
    timeLimit = '500 seconds';
  }
}
