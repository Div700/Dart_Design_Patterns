import '../Products/linux_button.dart';
import '../Products/linux_window.dart';
import '../interfaces/abstract_factory.dart';
import '../interfaces/button.dart';
import '../interfaces/window.dart';

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
