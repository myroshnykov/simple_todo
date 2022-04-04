class Todo {
  Todo({required this.id, required this.title, required this.description});

  final String id;
  final String title;
  final String description;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map['id'] as String,
        title: map['title'] as String,
        description: map['description'] as String);
  }
}
