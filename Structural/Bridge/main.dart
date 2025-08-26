import 'dart:io';
import 'implementations/ai_model.dart';
import 'implementations/gpt4_model.dart';
import 'implementations/claude4_model.dart';
import 'implementations/llaMa_Model.dart';
import 'abstractions/ai_task.dart';
import 'refined_abstractions/question_answer_task.dart';
import 'refined_abstractions/text_summarization_task.dart';
import 'refined_abstractions/code_generation_task.dart';
import 'constants/model_enums.dart';
import 'constants/ai_task_enums.dart';

Future<void> main() async {
  try {
    String choice = "1";
    while (choice != "0") {
      print('\n============================');
      print(' AI Task Runner ');
      print('============================');

      // 1) Select model
      print('Select AI model:');
      print('  1) GPT-4');
      print('  2) Claude-4');
      print('  3) Local LLaMA');
      print('  0) Exit');
      stdout.write('Choice (0–3): ');
      final modelChoice = stdin.readLineSync();

      if (modelChoice == '0') {
        print('Please enter a valid choice of the model');
        choice = '1';
        continue;
      }

      ModelType modelType;
      switch (modelChoice) {
        case '1':
          modelType = ModelType.gpt4;
          break;
        case '2':
          modelType = ModelType.claude4;
          break;
        case '3':
          modelType = ModelType.localLlama;
          break;
        default:
          print('Invalid — defaulting to GPT-4.');
          modelType = ModelType.gpt4;
      }

      // 2) Select task
      print('\nSelect AI task:');
      print('  1) Question Answering');
      print('  2) Summarization');
      print('  3) Code Generation');
      stdout.write('Choice (1–3): ');
      final taskChoice = stdin.readLineSync();
      TaskType taskType;
      switch (taskChoice) {
        case '1':
          taskType = TaskType.questionAnswering;
          break;
        case '2':
          taskType = TaskType.summarization;
          break;
        case '3':
          taskType = TaskType.codeGeneration;
          break;
        default:
          print('Invalid — defaulting to QA.');
          taskType = TaskType.questionAnswering;
      }

      if (taskChoice == '0') {
        print('Please enter a valid choice of the task');
        choice = '1';
        continue;
      }
      // 3) Wire up the model implementor
      AIModel model;
      switch (modelType) {
        case ModelType.gpt4:
          model = GPT4Model();
          break;
        case ModelType.claude4:
          model = Claude4Model();
          break;
        case ModelType.localLlama:
          model = LocalLlamaModel();
          break;
      }

      // 4) Wire up the task abstraction
      AITask task;
      switch (taskType) {
        case TaskType.questionAnswering:
          task = QuestionAnsweringTask(model);
          break;
        case TaskType.summarization:
          task = SummarizationTask(model);
          break;
        case TaskType.codeGeneration:
          task = CodeGenerationTask(model);
          break;
      }

      // 5) Read user input
      print('\nEnter your input :');
      final input = stdin.readLineSync() ?? '';

      // 6) Run
      print('\n===== Running =====');
      final result = await task.run(input);
      print('\n===== Result =====');
      print(result);
    }
  } catch (e) {
    print("Error in main: $e");
  }
}
