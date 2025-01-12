import 'Creators/MathsCreator.dart';
import 'Creators/EnglishCreator.dart';
import 'Creators/ScienceCreator.dart';
import 'Interfaces/Creator.dart';
import 'Interfaces/Sheet.dart';

void main() {
  print(
      "Welcome to the home page : We have Maths, Science and English subjects");
  Creator c;
  print("Solving Maths...");
  c = Mathscreator();
  Sheet sheet = c.getSheet();
  sheet.nextQuestion();
  sheet.saveProgress();
  print("Changing to english sheet");
  c = Englishcreator();
  sheet = c.getSheet();
  sheet.nextQuestion();
  sheet.saveProgress();

  print("Changing to Science sheet");
  c = Sciencecreator();
  sheet = c.getSheet();
  sheet.nextQuestion();
  sheet.saveProgress();
}
