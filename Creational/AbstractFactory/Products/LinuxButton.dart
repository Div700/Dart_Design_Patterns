import '../interfaces/Button.dart';

class Linuxbutton implements Button {
  @override
  void onClick() {
    print("On click feature effect of linux");
  }

  @override
  void onHover() {
    print("Hovering feature in Linux");
  }
}
