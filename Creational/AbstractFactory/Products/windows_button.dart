import '../interfaces/button.dart';

class Windowsbutton implements Button {
  @override
  void onClick() {
    print("On click feature in windows");
  }

  @override
  void onHover() {
    print("On hover feature in windows");
  }
}
