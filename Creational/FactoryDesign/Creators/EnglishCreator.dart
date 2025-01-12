import '../Interfaces/Sheet.dart';
import '../Interfaces/Creator.dart';
import '../Products/EnglishSheet.dart';

class Englishcreator extends Creator {
  @override
  Sheet getSheet() {
    return new Englishsheet();
  }
}
