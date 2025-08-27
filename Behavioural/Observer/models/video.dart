class Video {
  final String title;
  final String description;

  Video({required this.title, required this.description});

  @override
  String toString() => 'Video: $title';
}