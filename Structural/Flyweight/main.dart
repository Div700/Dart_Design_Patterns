import 'map_icon_context.dart';
import 'helpers/map_renderer.dart';
import 'helpers/memory_calculator.dart';

void main() {
  print('🗺️  Flyweight Pattern with Memory Usage Analysis\n');

  final renderer = MapRenderer();
  final locations = <IconContext>[];

  print('Adding locations to simulate a busy city area...\n');

  // Simulate many restaurants (sharing 1 flyweight)
  for (int i = 1; i <= 100; i++) {
    final location = IconContext(
      latitude: 40.7580 + (i * 0.001),
      longitude: -73.9855 + (i * 0.001),
      name: "Restaurant $i",
      iconType: "restaurant",
    );
    renderer.addContext(location);
    locations.add(location);
  }

  // Simulate many gas stations (sharing 1 flyweight)
  for (int i = 1; i <= 50; i++) {
    final location = IconContext(
      latitude: 40.7600 + (i * 0.001),
      longitude: -73.9800 + (i * 0.001),
      name: "Gas Station $i",
      iconType: "gasstation",
    );
    renderer.addContext(location);
    locations.add(location);
  }

  // Simulate many hotels (sharing 1 flyweight)
  for (int i = 1; i <= 30; i++) {
    final location = IconContext(
      latitude: 40.7550 + (i * 0.001),
      longitude: -73.9750 + (i * 0.001),
      name: "Hotel $i",
      iconType: "hotel",
    );
    renderer.addContext(location);
    locations.add(location);
  }

  print('📍 Added ${locations.length} locations');

  // Show memory usage comparison
  MemoryCalculator.printMemoryComparison(locations);

  print('\n🗺️  Sample rendering (first 5 locations):');
  print('=' * 50);
  for (int i = 0; i < 5 && i < locations.length; i++) {
    locations[i].render();
  }

  print('\n💡 All ${locations.length} locations use only 3 flyweight objects!');
}
