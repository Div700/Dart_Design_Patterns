// Product Class - The Mario Level
class MarioLevel {
  final String name;
  final String backgroundTheme;
  final List<String> platforms;
  final List<String> enemies;
  final List<String> powerUps;
  final List<String> coins;
  final String music;
  final String timeLimit;

  // Public constructor - anyone can use it
  MarioLevel({
    required this.name,
    required this.backgroundTheme,
    required this.platforms,
    required this.enemies,
    required this.powerUps,
    required this.coins,
    required this.music,
    required this.timeLimit,
  });

  void displayLevel() {
    print('=== ${name.toUpperCase()} ===');
    print('Background: $backgroundTheme');
    print('Music: $music');
    print('Time Limit: $timeLimit');
    print('Platforms: ${platforms.join(', ')}');
    print('Enemies: ${enemies.join(', ')}');
    print('Power-ups: ${powerUps.join(', ')}');
    print('Coins: ${coins.length} coins placed');
    print('Level ready for gameplay!\n');
  }
}