import 'Creators/EnglishCreator.dart';
import 'Creators/MathsCreator.dart';
import 'Creators/ScienceCreator.dart';
import 'Interfaces/Creator.dart';
import 'constants/questions.dart';
import 'quiz_app.dart';

void main() {
  final creators = <String, Creator>{
    'maths': MathsCreator(bank['maths']!),
    'english': EnglishCreator(bank['english']!),
    'science': ScienceCreator(bank['science']!),
  };

  QuizApp app = QuizApp(creators);
  app.run();
}
