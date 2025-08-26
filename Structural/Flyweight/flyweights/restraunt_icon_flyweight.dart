// Concrete flyweights with only intrinsic properties
import '../interfaces/abstract_icon_flyweight.dart';

class RestaurantIcon implements IconFlyweight {
  @override
  String get iconSymbol => '🍽️';
  
  @override  
  String get iconColor => 'orange';
  
  @override
  int get iconSize => 24;
  
  @override
  void displayIcon() {
    print('$iconSymbol [$iconColor, ${iconSize}px]');
  }
  
  @override
  int getMemoryFootprint() {
    // Approximate memory: symbol(4 bytes) + color(6 bytes) + size(4 bytes) + methods(~10KB)
    return 10240; // ~10KB per flyweight
  }
}