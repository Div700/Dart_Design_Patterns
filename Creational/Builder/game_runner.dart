// Client Code
import 'builder_interfaces/abstract_mario_builder.dart';
import 'builders/castle_level_builder.dart';
import 'builders/ground_level_builder.dart';
import 'builders/underground_level_builder.dart';
import 'product/mario_level.dart';

void main() {
  print('Mario Level Builder Demo\n');

  // Create different level builders
  MarioLevelBuilder groundBuilder = GroundLevelBuilder();
  MarioLevelBuilder undergroundBuilder = UndergroundLevelBuilder();
  MarioLevelBuilder castleBuilder = CastleLevelBuilder();

  // Build World 1-1 (Ground Level)
  MarioLevel world11 = groundBuilder
      .setName('World 1-1')
      .build();
  world11.displayLevel();

  // Build World 1-2 (Underground Level)
  MarioLevel world12 = undergroundBuilder
      .setName('World 1-2')
      .build();
  world12.displayLevel();

  // Build World 1-4 (Castle Level)
  MarioLevel world14 = castleBuilder
      .setName('World 1-4')
      .build();
  world14.displayLevel();

  // Show that you can reuse builders
  print('Reusing Ground Level Builder for another level:\n');
  MarioLevel world51 = groundBuilder
      .setName('World 5-1')
      .build();
  world51.displayLevel();
}