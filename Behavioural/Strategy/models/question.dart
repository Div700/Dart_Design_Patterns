class Question {
  final String id;
  final String text;
  final int difficulty;
  final String topic;

  Question({
    required this.id,
    required this.text,
    required this.difficulty,
    required this.topic,
  });

  @override
  String toString() => 'Q$id: $text [$topic, diff: $difficulty]';
}