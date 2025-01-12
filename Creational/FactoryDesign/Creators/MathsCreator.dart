import '../Interfaces/Sheet.dart';
import '../Interfaces/Creator.dart';
import '../Products/MathsSheet.dart';

class Mathscreator extends Creator {
  @override
  Sheet getSheet() {
    return new MathsSheet();
  }
}
