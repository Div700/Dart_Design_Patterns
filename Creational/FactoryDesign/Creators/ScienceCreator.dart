import '../Interfaces/Creator.dart';
import '../Interfaces/Sheet.dart';
import '../Products/ScienceSheet.dart';

class Sciencecreator extends Creator {
  @override
  Sheet getSheet() {
    return new Sciencesheet();
  }
}
