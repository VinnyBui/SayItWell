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

  // Convert Exercise to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'type': type,
      'duration': duration,
      'completed': completed,
    };
  }

  // Create Exercise from Firestore Map
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      type: map['type'] ?? '',
      duration: map['duration'] ?? 2,
      completed: map['completed'] ?? false,
    );
  }
}
