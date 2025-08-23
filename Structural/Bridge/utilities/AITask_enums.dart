enum TaskType
{
  questionAnswering("questionAnswering"),
  summarization("summarization"),
  codeGeneration("codeGeneration");

  final String value;
  const TaskType(this.value);
}