import '../Products/LinuxButton.dart';
import '../Products/LinuxWindow.dart';
import '../interfaces/AbstractFactory.dart';
import '../interfaces/Button.dart';
import '../interfaces/Window.dart';

class Linuxfactory implements Abstractfactory {
  @override
  Button createButton() {
    return new Linuxbutton();
  }

  @override
  Window createWindow() {
    return new Linuxwindow();
  }
}
