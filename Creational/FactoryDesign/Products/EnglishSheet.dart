import '../Interfaces/Sheet.dart';

class Englishsheet implements Sheet {
  @override
  void checkAnswer() {
    print("Checking answer");
  }

  @override
  void nextQuestion() {
    print("Getting next question from english question bank");
  }

  @override
  void saveProgress() {
    print("Saving progress for english sheet");
  }
}
