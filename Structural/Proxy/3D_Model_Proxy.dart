import '3D_Model_display.dart';
import 'interfaces/IModel_3d.dart';
import 'dart:math';

class Model3dProxy implements Imodel3d {
  Model3d? _model;
  final String modelName;
  final int xCoordinate;
  final int yCoordinate;
  static int PlayerXCoordinate = 0;
  static int PlayerYCoordinate = 0;
  
  // View distance - models within this distance will be loaded
  static const double VIEW_DISTANCE = 15.0;
  
  Model3dProxy(this.modelName, this.xCoordinate, this.yCoordinate);
  
  @override
  void render() {
    if (_isInPlayerView(xCoordinate, yCoordinate)) {
      _model ??= Model3d(modelName, xCoordinate, yCoordinate);
      _model!.render();
    } else {
      double distance = _calculateDistance(xCoordinate, yCoordinate);
      print('$modelName at ($xCoordinate, $yCoordinate) - distance: ${distance.toStringAsFixed(1)} (too far)');
    }
  }
  
  // Calculate absolute distance using Pythagorean theorem
  double _calculateDistance(int modelX, int modelY) {
    double dx = (modelX - PlayerXCoordinate).toDouble();
    double dy = (modelY - PlayerYCoordinate).toDouble();
    return sqrt(dx * dx + dy * dy);
  }
  
  bool _isInPlayerView(int modelX, int modelY) {
    double distance = _calculateDistance(modelX, modelY);
    return distance <= VIEW_DISTANCE;
  }
  
  // Static method to update player position
  static void updatePlayerPosition(int x, int y) {
    PlayerXCoordinate = x;
    PlayerYCoordinate = y;
    print('🚶 Player moved to ($x, $y)');
  }
  
  // Helper method to check if model is loaded
  bool get isLoaded => _model != null;
}