import '../interfaces/learning_strategy.dart';
import '../models/question.dart';

class BayesStrategy implements LearningStrategy {
  @override
  String get name => 'Bayes Strategy';

  @override
  List<Question> arrangeQuestions(List<Question> questions) {
    print('BAYES: Arranging questions using adaptive algorithm');
    
    final result = <Question>[];
    
    // Start with medium difficulty questions
    result.addAll(questions.where((q) => q.difficulty == 2));
    
    // Add easy questions for confidence building
    result.addAll(questions.where((q) => q.difficulty == 1));
    
    // Add hard questions for challenge
    result.addAll(questions.where((q) => q.difficulty == 3));
    
    print('BAYES: Arranged ${result.length} questions (medium → easy → hard)');
    return result;
  }
}