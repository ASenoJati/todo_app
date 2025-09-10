import 'package:get/get.dart';

class Todo {
  String title;
  String description;
  String category;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  // Dummy data awal
  @override
  void onInit() {
    super.onInit();
  }

  // Tambah todo
  void addTodo(String title, String description, String category) {
    todos.add(Todo(title: title, description: description, category: category));
  }

  // Tandai selesai
  void markAsDone(int index) {
    todos[index].isDone = true;
    todos.refresh();
  }

  // Getter untuk filter data
  List<Todo> get activeTodos => todos.where((todo) => !todo.isDone).toList();
  List<Todo> get history => todos.where((todo) => todo.isDone).toList();
}
