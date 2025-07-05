class Exercise {
  final String id;
  final String title;
  final String description; // What the exercise is about
  final String content; // The actual text/sentences to practice
  final String type; // e.g., 'tongue_twister', 'volume', etc.
  final int duration; // in minutes
  final bool completed;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.type,
    this.duration = 2,
    this.completed = false,
  });
}
