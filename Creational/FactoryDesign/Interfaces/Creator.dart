import 'Sheet.dart';

abstract class Creator {
  void solveSheet() {
    Sheet sheet = getSheet();
    print("Doing some common logic");
  }

  Sheet getSheet(); //delegating creation to subclass
}
