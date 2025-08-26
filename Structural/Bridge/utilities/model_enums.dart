// enums for different model types that can be used by the AI
enum ModelType {
  gpt4("gpt4"),
  claude4("claude4"),
  localLlama("localLlama");

  final String value;
  const ModelType(this.value);
}
