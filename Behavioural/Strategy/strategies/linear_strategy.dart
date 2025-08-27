import '../interfaces/learning_strategy.dart';
import '../models/question.dart';

class LinearStrategy implements LearningStrategy {
  @override
  String get name => 'Linear Strategy';

  @override
  List<Question> arrangeQuestions(List<Question> questions) {
    print('LINEAR: Arranging questions in linear progression');

    final result = List<Question>.from(questions);

    // Sort by difficulty (easy to hard)
    result.sort((a, b) => a.difficulty.compareTo(b.difficulty));

    print('LINEAR: Arranged ${result.length} questions (easy → hard)');
    return result;
  }
}
