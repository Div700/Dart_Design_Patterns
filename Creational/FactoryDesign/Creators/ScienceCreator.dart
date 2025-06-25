import '../Interfaces/Creator.dart';
import '../Interfaces/Sheet.dart';
import '../Products/ScienceSheet.dart';
import '../models/question.dart';

class ScienceCreator implements Creator {
  final List<Question> _data;
  ScienceCreator(this._data);

  @override
  Sheet getSheet() => ScienceSheet(_data);
}
