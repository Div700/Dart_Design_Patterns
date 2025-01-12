import 'Factories/LinuxFactory.dart';
import 'Factories/WindowsFactory.dart';
import 'interfaces/AbstractFactory.dart';
import 'interfaces/Button.dart';
import 'interfaces/Window.dart';

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

  abstractfactory = Linuxfactory();
  button = abstractfactory.createButton();
  button.onClick();
  button.onHover();
  window = abstractfactory.createWindow();
  window.background();
}
