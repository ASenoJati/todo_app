import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/routes/routes.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (todoController.activeTodos.isEmpty) {
          return const Center(child: Text("Belum ada Tugas"));
        }
        return ListView.builder(
          itemCount: todoController.activeTodos.length,
          itemBuilder: (context, index) {
            final todo = todoController.activeTodos[index];
            return CTodoCard(
              title: todo.title,
              description: todo.description,
              category: todo.category,
              isDone: todo.isDone,
              date: todo.date,
              onDone: () {
                todoController.markAsDone(todoController.todos.indexOf(todo));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodoPage),
        child: const Icon(Icons.add),
      ),
    );
  }
}
