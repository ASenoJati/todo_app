class Todo {
  int? id;
  String title;
  String description;
  String category;
  String date;
  String dueDate;
  bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.dueDate,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'date': date,
      'dueDate': dueDate,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      date: map['date'],
      dueDate: map['dueDate'],
      isDone: map['isDone'] == 1,
    );
  }
}
