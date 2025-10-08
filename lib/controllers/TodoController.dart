import 'package:get/get.dart';
import 'package:todo_app/helper/db_helper.dart';
import 'package:todo_app/models/TodoModel.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  final dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todos.assignAll(data);
  }

  Future<void> addTodo(
    String title,
    String description,
    String category,
    String date,
    String dueDate,
  ) async {
    final todo = Todo(
      title: title,
      description: description,
      category: category,
      date: date,
      dueDate: dueDate,
    );

    await dbHelper.insertTodo(todo);
    await loadTodos();
  }

  Future<void> markAsDone(int index) async {
    final todo = todos[index];
    todo.isDone = true;
    await dbHelper.updateTodoStatus(todo.id!, true);
    await loadTodos();
  }

  Future<void> deleteTodo(int index) async {
    final todo = todos[index];
    await dbHelper.deleteTodo(todo.id!);
    await loadTodos();
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get history => todos.where((t) => t.isDone).toList();
}
