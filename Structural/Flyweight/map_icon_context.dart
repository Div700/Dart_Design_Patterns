import 'dart:io';
import 'flyweight_factory.dart';
import 'interfaces/abstract_icon_flyweight.dart';

// Context class - manages extrinsic state + uses flyweight
class IconContext {
  // Extrinsic state (context's responsibility)
  final double latitude;
  final double longitude;
  final String name;
  
  // Reference to shared flyweight
  final IconFlyweight _flyweight;

  IconContext({
    required this.latitude,
    required this.longitude,
    required this.name,
    required String iconType,
  }) : _flyweight = IconFactory.getFlyweight(iconType);

  // Context handles positioning and calls flyweight for icon display
  void render() {
    stdout.write('Location ($latitude, $longitude) "$name": ');
    _flyweight.displayIcon(); // Flyweight only handles icon rendering
  }
  
  // Calculate context's memory footprint
  int getContextMemoryFootprint() {
    return 44; // ~44 bytes per context
  }
  
  // Access flyweight's intrinsic properties
  String get iconSymbol => _flyweight.iconSymbol;
  String get iconColor => _flyweight.iconColor;  
  int get iconSize => _flyweight.iconSize;
}