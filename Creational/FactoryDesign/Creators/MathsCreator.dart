import '../Interfaces/Creator.dart';
import '../Interfaces/Sheet.dart';
import '../Products/MathsSheet.dart';
import '../models/question.dart';

class MathsCreator implements Creator {
  final List<Question> _data;
  MathsCreator(this._data);

  @override
  Sheet getSheet() {
    return MathsSheet(_data);
  }
}
