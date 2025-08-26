// Flyweight interface - only handles intrinsic properties and operations
abstract class IconFlyweight {
  // Intrinsic state (shared properties)  
  String get iconSymbol;
  String get iconColor;
  int get iconSize;
  
  // Operation using only intrinsic data
  void displayIcon();
  
  // Method to calculate flyweight's memory footprint
  int getMemoryFootprint();
}