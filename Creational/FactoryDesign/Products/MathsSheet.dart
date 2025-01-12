import '../Interfaces/Sheet.dart';

class MathsSheet implements Sheet {
  @override
  void checkAnswer() {
    // TODO: implement checkAnswer
    print("Checking answer");
  }

  @override
  void nextQuestion() {
    // TODO: implement nextQuestion
    print("Getting next question from maths question bank");
  }

  @override
  void saveProgress() {
    print("Saving progress for maths sheet");
  }
}
