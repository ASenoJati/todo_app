import 'package:get/get.dart';

class Todo {
  String title;
  String description;
  String category;
  bool isDone;
  String? date;
  String? dueDate;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    required this.date,
    required this.dueDate,
  });
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(
    String title,
    String description,
    String category,
    String date,
    String dueDate,
  ) {
    todos.add(
      Todo(
        title: title,
        description: description,
        category: category,
        date: date,
        dueDate: dueDate,
      ),
    );
  }

  void markAsDone(int index) {
    todos[index].isDone = true;
    todos.refresh();
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get history => todos.where((t) => t.isDone).toList();
}
