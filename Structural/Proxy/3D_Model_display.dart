import 'interfaces/IModel_3d.dart';

class Model3d implements Imodel3d {

  final String modelName;
  final int xCoordinate;
  final int yCoordinate;

  Model3d(this.modelName, this.xCoordinate, this.yCoordinate) {
    print("Loading model $modelName...");
    print('- Loading 50,000 vertices...');
    print('- Loading textures...');
    print('- Loading animations...');
  }

  @override
  void render() {
    print("Rendering model on screen : $modelName...");
  }
}
