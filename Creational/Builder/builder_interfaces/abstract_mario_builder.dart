import '../product/mario_level.dart';

abstract class MarioLevelBuilder { 
  String name = '';
  String backgroundTheme = '';
  List<String> platforms = [];
  List<String> enemies = [];
  List<String> powerUps = [];
  List<String> coins = [];
  String music = '';
  String timeLimit = '';

  // Abstract methods that concrete builders must implement
  void buildBackground();
  void buildPlatforms();
  void buildEnemies();
  void buildPowerUps();
  void buildCoins();
  void buildAudio();
  void buildTimeLimit();

  // Common methods
  MarioLevelBuilder setName(String name) {
    this.name = name;
    return this;
  }

  MarioLevel build() {
    buildBackground();
    buildPlatforms();
    buildEnemies();
    buildPowerUps();
    buildCoins();
    buildAudio();
    buildTimeLimit();
    
    return MarioLevel(
      name: name,
      backgroundTheme: backgroundTheme,
      platforms: List.from(platforms),
      enemies: List.from(enemies),
      powerUps: List.from(powerUps),
      coins: List.from(coins),
      music: music,
      timeLimit: timeLimit,
    );
  }
}