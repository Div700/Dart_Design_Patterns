// enums fo different task types that can be performed by the AI
enum TaskType
{
  questionAnswering("questionAnswering"),
  summarization("summarization"),
  codeGeneration("codeGeneration");

  final String value;
  const TaskType(this.value);
}