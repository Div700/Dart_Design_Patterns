import '../models/question.dart';

final Map<String, List<Question>> questionBank = {
  'maths': [
    Question('What is 2 + 2?', '4'),
    Question('What is 5 * 3?', '15'),
    Question('What is 10 - 7?', '3'),
    Question('What is 8 / 2?', '4'),
    Question('What is 3^2?', '9'),
  ],
  'english': [
    Question('What is the past tense of "run"?', 'ran'),
    Question('What is the plural of "child"?', 'children'),
    Question('What is a synonym for "happy"?', 'joyful'),
    Question('What is the opposite of "hot"?', 'cold'),
    Question('What type of word is "quickly"?', 'adverb'),
  ],
  'science': [
    Question('What gas do plants absorb from the atmosphere?', 'carbon dioxide'),
    Question('What is the chemical symbol for water?', 'h2o'),
    Question('How many bones are in the adult human body?', '206'),
    Question('What planet is known as the Red Planet?', 'mars'),
    Question('What is the speed of light?', '299792458'),
  ],
};