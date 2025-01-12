import '../Interfaces/Sheet.dart';

class Sciencesheet implements Sheet {
  @override
  void checkAnswer() {
    // TODO: implement checkAnswer
    print("Checking answer");
  }

  @override
  void nextQuestion() {
    print("Getting next question from Science question bank");
  }

  @override
  void saveProgress() {
    print("Saving progress of Science sheet");
  }
}
