import 'models/question.dart';
import 'question_container.dart';

void main() {
  print('=== QUESTION CONTAINER STRATEGY DEMO ===\n');

  // Create math questions
  final mathQuestions = [
    Question(id: '1', text: 'What is 2 + 2?', difficulty: 1, topic: 'Math'),
    Question(id: '2', text: 'Solve: 3x + 5 = 14', difficulty: 3, topic: 'Math'),
    Question(id: '3', text: 'What is 7 × 8?', difficulty: 2, topic: 'Math'),
    Question(
      id: '4',
      text: 'Find the square root of 16',
      difficulty: 2,
      topic: 'Math',
    ),
  ];

  // Create science questions
  final scienceQuestions = [
    Question(id: '5', text: 'What is H2O?', difficulty: 1, topic: 'Science'),
    Question(
      id: '6',
      text: 'Explain photosynthesis process',
      difficulty: 3,
      topic: 'Science',
    ),
    Question(
      id: '7',
      text: 'Name three states of matter',
      difficulty: 2,
      topic: 'Science',
    ),
  ];

  // Create containers with different strategies
  final bayesContainer = QuestionContainer(
    containerName: 'Math Quiz Container',
    questions: mathQuestions,
    strategyType: 'bayes',
    parameters: {
      'adaptiveLearning': true,
      'confidenceBuilding': true,
      'maxDifficulty': 3,
    },
  );

  final linearContainer = QuestionContainer(
    containerName: 'Science Quiz Container',
    questions: scienceQuestions,
    strategyType: 'linear',
    parameters: {
      'progressiveOrder': true,
      'timeLimit': 300, // 5 minutes
    },
  );

  // Demonstrate Bayes strategy
  print('--- CONTAINER 1: BAYES STRATEGY ---');
  bayesContainer.showContainerInfo();

  final bayesSequence = bayesContainer.generateQuestionSequence();
  print('Question Sequence:');
  for (int i = 0; i < bayesSequence.length; i++) {
    print('  ${i + 1}. ${bayesSequence[i]}');
  }

  print('\n--- CONTAINER 2: LINEAR STRATEGY ---');
  linearContainer.showContainerInfo();

  final linearSequence = linearContainer.generateQuestionSequence();
  print('Question Sequence:');
  for (int i = 0; i < linearSequence.length; i++) {
    print('  ${i + 1}. ${linearSequence[i]}');
  }

  // Show strategy comparison
  print('\n--- STRATEGY COMPARISON ---');
  print('Bayes Strategy: Adaptive learning (medium → easy → hard)');
  print('  - Builds confidence with medium difficulty');
  print('  - Reinforces with easy questions');
  print('  - Challenges with hard questions');

  print('Linear Strategy: Progressive learning (easy → hard)');
  print('  - Systematic difficulty progression');
  print('  - Traditional learning approach');

  // Demonstrate with combined questions
  print('\n--- COMBINED CONTAINER DEMO ---');
  final allQuestions = [...mathQuestions, ...scienceQuestions];

  final combinedContainer = QuestionContainer(
    containerName: 'Combined Quiz Container',
    questions: allQuestions,
    strategyType: 'bayes',
    parameters: {'mixedTopics': true, 'totalQuestions': allQuestions.length},
  );

  combinedContainer.showContainerInfo();
  print('');

  final combinedSequence = combinedContainer.generateQuestionSequence();
  print('Combined Question Sequence:');
  for (int i = 0; i < combinedSequence.length; i++) {
    print('  ${i + 1}. ${combinedSequence[i]}');
  }
}
