import 'Interfaces/Creator.dart';
import 'Interfaces/Sheet.dart';
import 'constants/enums.dart';
import 'dart:io';

class QuizApp {
  final Map<String, Creator> creators;

  // Mutable state:
  bool running = true;
  AppState state = AppState.menu;
  late Sheet currentSheet;
  late String currentSubject;

  QuizApp(this.creators);

  void run() {
    print('Welcome to the Quiz App!');

    while (running) {
      switch (state) {
        case AppState.menu:
          _handleMenu();
          break;
        case AppState.inQuiz:
          _handleQuiz();
          break;
      }
    }

    print('Goodbye!');
  }

  void _handleMenu() {
    stdout.write("\nChoose a subject "
        "(maths / english / science) or 'exit' to quit: ");
    final input = stdin.readLineSync()?.trim().toLowerCase() ?? '';

    if (input == 'exit') {
      running = false;
      return;
    }

    if (!creators.containsKey(input)) {
      print("Unknown subject. Try again.");
      return;
    }

    // Valid subject chosen → get a fresh sheet
    currentSubject = input;
    currentSheet = creators[input]!.getSheet();
    print("\n--- Starting $currentSubject quiz ---\n");
    state = AppState.inQuiz;
  }

  void _handleQuiz() {
    final q = currentSheet.nextQuestion();

    // finished this sheet?
    if (q == null) {
      print("You've finished all questions in $currentSubject!");
      currentSheet.saveProgress();
      state = AppState.menu;
      return;
    }

    // ask the question
    print("Q: ${q.prompt}");
    stdout.write(
        "Your answer (or 'menu' to change subject, 'exit' to quit): ");
    final answer = stdin.readLineSync()?.trim().toLowerCase() ?? '';

    if (answer == 'exit') {
      running = false;        // that'll break the outer loop
      return;
    }
    if (answer == 'menu') {
      print("Returning to subject menu...");
      state = AppState.menu;
      return;
    }

    // normal answer flow
    currentSheet.checkAnswer(answer, q);
    currentSheet.saveProgress();

    // if after checking the sheet is done, go back to menu
    if (currentSheet.isFinished) {
      print("You've reached the end of this sheet.");
      state = AppState.menu;
    }
  }
}
