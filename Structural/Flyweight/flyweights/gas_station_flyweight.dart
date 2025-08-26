import '../interfaces/abstract_icon_flyweight.dart';

class GasStationIcon implements IconFlyweight {
  @override
  String get iconSymbol => '⛽';
  
  @override
  String get iconColor => 'blue';
  
  @override
  int get iconSize => 22;
  
  @override
  void displayIcon() {
    print('$iconSymbol [$iconColor, ${iconSize}px]');
  }
  
  @override
  int getMemoryFootprint() {
    return 10240; // ~10KB
  }
}