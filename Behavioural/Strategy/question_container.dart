import 'models/question.dart';
import 'strategy_registry.dart';

class QuestionContainer {
  final String containerName;
  final List<Question> questions;
  final String strategyType;
  final Map<String, dynamic> parameters;

  QuestionContainer({
    required this.containerName,
    required this.questions,
    required this.strategyType,
    this.parameters = const {},
  });

  List<Question> generateQuestionSequence() {
    print('CONTAINER: $containerName starting question arrangement');
    print('CONTAINER: Using $strategyType strategy with ${questions.length} questions');
    
    if (parameters.isNotEmpty) {
      print('CONTAINER: Parameters: $parameters');
    }
    
    final strategy = StrategyRegistry.getStrategy(strategyType);
    final arrangedQuestions = strategy.arrangeQuestions(questions);
    
    print('CONTAINER: Question sequence generated successfully');
    return arrangedQuestions;
  }

  void showContainerInfo() {
    print('Container Name: $containerName');
    print('Strategy: $strategyType');
    print('Total Questions: ${questions.length}');
    print('Parameters: $parameters');
    
    // Show topic distribution
    final topicCount = <String, int>{};
    for (final question in questions) {
      topicCount[question.topic] = (topicCount[question.topic] ?? 0) + 1;
    }
    print('Topics: $topicCount');
  }

  @override
  String toString() => 'QuestionContainer($containerName, ${questions.length} questions, $strategyType)';
}