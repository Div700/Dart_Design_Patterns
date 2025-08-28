import 'Factories/linux_factory.dart';
import 'Factories/windows_factory.dart';
import 'interfaces/abstract_factory.dart';
import 'interfaces/button.dart';
import 'interfaces/window.dart';

void main() {
  print("Welcome to the UI emulator");
  Abstractfactory abstractfactory;
  print("Finish creating your button designs...");
  Button button;
  Window window;
  print("Rendering UI for Windows : ");
  abstractfactory = Windowsfactory();
  button = abstractfactory.createButton();
  button.onClick();
  button.onHover();
  window = abstractfactory.createWindow();
  window.background();
  print("Rendering UI for Linux : ");
  abstractfactory = Linuxfactory();
  button = abstractfactory.createButton();
  button.onClick();
  button.onHover();
  window = abstractfactory.createWindow();
  window.background();
}
