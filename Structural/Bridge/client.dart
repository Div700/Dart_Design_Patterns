import 'dart:io';
import 'implementation/AIModel.dart';
import 'implementation/gpt4_model.dart';
import 'implementation/claude4_model.dart';
import 'implementation/LLaMa_Model.dart';
import 'abstraction/AITask.dart';
import 'abstraction/question_answer_task.dart';
import 'abstraction/text_summarization_task.dart';
import 'abstraction/code_generation_task.dart';
import 'utilities/model_enums.dart';
import 'utilities/AITask_enums.dart';

Future<void> main() async {
  while (true) {
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
    final mChoice = stdin.readLineSync();

    if (mChoice == '0') {
      print('Exiting... Goodbye!');
      break;
    }

    ModelType mType;
    switch (mChoice) {
      case '1':
        mType = ModelType.gpt4;
        break;
      case '2':
        mType = ModelType.claude4;
        break;
      case '3':
        mType = ModelType.localLlama;
        break;
      default:
        print('Invalid — defaulting to GPT-4.');
        mType = ModelType.gpt4;
    }

    // 2) Select task
    print('\nSelect AI task:');
    print('  1) Question Answering');
    print('  2) Summarization');
    print('  3) Code Generation');
    stdout.write('Choice (1–3): ');
    final tChoice = stdin.readLineSync();
    TaskType tType;
    switch (tChoice) {
      case '1':
        tType = TaskType.questionAnswering;
        break;
      case '2':
        tType = TaskType.summarization;
        break;
      case '3':
        tType = TaskType.codeGeneration;
        break;
      default:
        print('Invalid — defaulting to QA.');
        tType = TaskType.questionAnswering;
    }

    // 3) Wire up the model implementor
    AIModel model;
    switch (mType) {
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
    switch (tType) {
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
    print('\nEnter your input (or type "back" to reselect model/task):');
    final input = stdin.readLineSync() ?? '';
    if (input.toLowerCase() == 'back') continue;

    // 6) Run
    print('\n===== Running =====');
    final result = await task.run(input);
    print('\n===== Result =====');
    print(result);
  }
}
