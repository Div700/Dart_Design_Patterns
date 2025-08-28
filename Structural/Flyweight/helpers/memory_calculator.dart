import '../flyweight_factory.dart';
import '../map_icon_context.dart';

class MemoryCalculator {
  static void printMemoryComparison(List<IconContext> locations) {
    final totalLocations = locations.length;
    final flyweightCount = IconFactory.getFlyweightCount();
    
    // Calculate memory WITH flyweight pattern
    int flyweightMemory = 0;
    final flyweights = IconFactory.getAllFlyweights();
    for (final flyweight in flyweights.values) {
      flyweightMemory += flyweight.getMemoryFootprint();
    }
    
    int contextMemory = 0;
    for (final location in locations) {
      contextMemory += location.getContextMemoryFootprint();
    }
    
    final totalWithFlyweight = flyweightMemory + contextMemory;
    
    // Calculate memory WITHOUT flyweight pattern (hypothetical)
    // Each location would store its own copy of icon data
    final memoryPerLocationWithoutFlyweight = 10240 + 44; // 10KB icon + 44 bytes context
    final totalWithoutFlyweight = totalLocations * memoryPerLocationWithoutFlyweight;
    
    // Print comparison
    print('\nMEMORY USAGE COMPARISON');
    print('=' * 60);
    print('Total Locations: $totalLocations');
    print('Flyweight Types: $flyweightCount');
    print('');
    
    print('WITHOUT Flyweight Pattern:');
    print('  Each location stores full icon data: ${_formatBytes(memoryPerLocationWithoutFlyweight)}');
    print('  Total memory: $totalLocations * ${_formatBytes(memoryPerLocationWithoutFlyweight)} = ${_formatBytes(totalWithoutFlyweight)}');
    print('');
    
    print('WITH Flyweight Pattern:');
    print('  Shared flyweights: $flyweightCount * ${_formatBytes(10240)} = ${_formatBytes(flyweightMemory)}');
    print('  Context instances: $totalLocations * ${_formatBytes(44)} = ${_formatBytes(contextMemory)}');
    print('  Total memory: ${_formatBytes(totalWithFlyweight)}');
    print('');
    
    final savedMemory = totalWithoutFlyweight - totalWithFlyweight;
    final savedPercentage = ((savedMemory / totalWithoutFlyweight) * 100).toStringAsFixed(1);
    
    print('MEMORY SAVED: ${_formatBytes(savedMemory)} ($savedPercentage%)');
    print('EFFICIENCY: ${(totalWithoutFlyweight / totalWithFlyweight).toStringAsFixed(1)}x more memory efficient');
  }
  
  static String _formatBytes(int bytes) {
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';  
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
}