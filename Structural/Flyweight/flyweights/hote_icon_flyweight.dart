import '../interfaces/abstract_icon_flyweight.dart';

class HotelIcon implements IconFlyweight {
  @override
  String get iconSymbol => 'H';
  
  @override
  String get iconColor => 'purple';
  
  @override
  int get iconSize => 26;
  
  @override
  void displayIcon() {
    print('$iconSymbol [$iconColor, ${iconSize}px]');
  }
  
  @override
  int getMemoryFootprint() {
    return 10240; // ~10KB
  }
}