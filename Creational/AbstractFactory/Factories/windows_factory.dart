import '../Products/windows_button.dart';
import '../Products/windows_window.dart';
import '../interfaces/abstract_factory.dart';
import '../interfaces/button.dart';
import '../interfaces/window.dart';

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
