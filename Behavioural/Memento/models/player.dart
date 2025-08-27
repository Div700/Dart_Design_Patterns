class Player {
  String name;
  int level;
  int health;
  double x, y; // position

  Player({
    required this.name,
    required this.level, 
    required this.health,
    required this.x,
    required this.y,
  });

  @override
  String toString() => '$name (Lv.$level, HP:$health) at ($x, $y)';
}