import '../models/question.dart';

final Map<String, List<Question>> bank = {
    'maths': [
      Question("What is 2 + 2?", "4"),
      Question("What is 7 x 6?", "42"),
      Question("What is the square root of 49?", "7"),
    ],
    'english': [
      Question("Synonym of 'happy'?", "joyful"),
      Question("Antonym of 'cold'?", "hot"),
      Question("Fill in the blank: 'I ___ to the store.'", "went"),
    ],
    'science': [
      Question("H2O is the chemical formula for what?", "water"),
      Question("What planet is known as the Red Planet?", "mars"),
      Question("What force keeps us on the ground?", "gravity"),
    ],
  };