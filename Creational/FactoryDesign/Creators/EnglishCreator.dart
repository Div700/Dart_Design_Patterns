import '../Interfaces/Creator.dart';
import '../Interfaces/Sheet.dart';
import '../Products/EnglishSheet.dart';
import '../models/question.dart';

class EnglishCreator implements Creator {
  final List<Question> _data;
  EnglishCreator(this._data);

  @override
  Sheet getSheet() => EnglishSheet(_data);
}
