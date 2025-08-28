import 'dart:io';
import 'sheet_factory.dart';

void main() {
  print('Welcome to the Quiz App!');

  bool running = true;

  while (running) {
    // Menu
    final availableSubjects = SheetFactory.getAvailableSubjects();
    print("\nAvailable subjects: ${availableSubjects.join(', ')}");
    stdout.write("Choose a subject or 'exit' to quit: ");

    final input = stdin.readLineSync()?.trim() ?? '';

    if (input.toLowerCase() == 'exit') {
      running = false;
      break;
    }

    // Use simple factory to create sheet
    final sheet = SheetFactory.createSheet(input);
    if (sheet == null) {
      print("Please try again.");
      continue;
    }

    print("\n--- Starting ${sheet.subject} quiz ---\n");

    // Quiz loop
    bool inQuiz = true;
    while (inQuiz && running) {
      final question = sheet.nextQuestion();

      if (question == null) {
        print("You've completed the ${sheet.subject} quiz!");
        sheet.saveProgress();
        inQuiz = false;
        break;
      }

      print("Q: ${question.prompt}");
      stdout.write("Your answer (or 'menu'/'exit'): ");
      final answer = stdin.readLineSync()?.trim() ?? '';

      if (answer.toLowerCase() == 'exit') {
        running = false;
        inQuiz = false;
      } else if (answer.toLowerCase() == 'menu') {
        print("Returning to main menu...");
        inQuiz = false;
      } else {
        sheet.checkAnswer(answer, question);
        sheet.saveProgress();

        if (sheet.isFinished) {
          print("Quiz completed!");
          inQuiz = false;
        }
      }
    }
  }

  print('Goodbye!');
}
