import 'interfaces/learning_strategy.dart';
import 'strategies/bayes_strategy.dart';
import 'strategies/linear_strategy.dart';

class StrategyRegistry {
  static LearningStrategy getStrategy(String strategyType) {
    switch (strategyType.toLowerCase()) {
      case 'bayes':
        return BayesStrategy();
      case 'linear':
        return LinearStrategy();
      default:
        print('Unknown strategy: $strategyType, using linear as default');
        return LinearStrategy();
    }
  }
}