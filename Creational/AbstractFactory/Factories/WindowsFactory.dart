import '../Products/WindowsButton.dart';
import '../Products/WindowsWindow.dart';
import '../interfaces/AbstractFactory.dart';
import '../interfaces/Button.dart';
import '../interfaces/Window.dart';

class Windowsfactory implements Abstractfactory {
  @override
  Button createButton() {
    return new Windowsbutton();
  }

  @override
  Window createWindow() {
    return new Windowswindow();
  }
}
