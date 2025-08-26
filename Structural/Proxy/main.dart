import '3d_Model_proxy.dart';

void main() {
  print('🎮 3D Game World Virtual Proxy Demo\n');
  print('View Distance: 15 units\n');

  // Creating models - some close together, some far apart
  var car = Model3dProxy('Sports Car', 5, 8);
  var building = Model3dProxy('Skyscraper', 50, 50);
  var tree1 = Model3dProxy('Oak Tree', 10, 12);
  var tree2 = Model3dProxy('Pine Tree', 8, 5);
  var house = Model3dProxy('Small House', 12, 10);
  var fountain = Model3dProxy('Fountain', 25, 30);

  var allModels = [car, building, tree1, tree2, house, fountain];

  print('Creating models...\n');
  print('Models created as lightweight proxies!\n');

  // Scenario 1: Player at origin - see nearby cluster
  print("=" * 50);
  print("SCENARIO 1: Player at starting position (0,0)");
  print("Models near spawn point should be visible");
  print("=" * 50);

  print("\nRendering models...");
  for (var model in allModels) {
    model.render();
  }

  // Scenario 2: Player moves to center of nearby cluster
  print("\n" + "=" * 50);
  print("SCENARIO 2: Player explores nearby area");
  Model3dProxy.updatePlayerPosition(8, 8);
  print("Now in the middle of car, trees, and house cluster!");
  print("=" * 50);

  print("\nRendering models...");
  for (var model in allModels) {
    model.render();
  }

  // Scenario 3: Player on edge - some visible, some not
  print("\n" + "=" * 50);
  print("SCENARIO 3: Player at edge of cluster");
  Model3dProxy.updatePlayerPosition(15, 15);
  print("Some models should be at the edge of view distance");
  print("=" * 50);

  print("\nRendering models...");
  for (var model in allModels) {
    model.render();
  }

  // Scenario 4: Player moves toward fountain and building
  print("\n" + "=" * 50);
  print("SCENARIO 4: Player travels toward distant area");
  Model3dProxy.updatePlayerPosition(30, 35);
  print("Should see fountain, building getting closer");
  print("=" * 50);

  print("\nRendering models...");
  for (var model in allModels) {
    model.render();
  }

  // Scenario 5: Player at distant location - different models visible
  print("\n" + "=" * 50);
  print("SCENARIO 5: Player reaches distant city area");
  Model3dProxy.updatePlayerPosition(45, 45);
  print("Now near the skyscraper - different models loaded!");
  print("=" * 50);

  print("\nRendering models...");
  for (var model in allModels) {
    model.render();
  }
}
