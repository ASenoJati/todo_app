import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/components/CColor.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),

      body: Obx(() {
        if (todoController.activeTodos.isEmpty) {
          return const Center(child: Text("Belum Ada Task"));
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
              dueDate: todo.dueDate,
              onDone: () {
                todoController.markAsDone(todoController.todos.indexOf(todo));
              },
              onDelete: () {
                final todo = todoController.activeTodos[index];
                final realIndex = todoController.todos.indexOf(todo);

                Get.defaultDialog(
                  title: "Konfirmasi",
                  middleText: "Apakah kamu yakin ingin menghapus data ini?",
                  textCancel: "Tidak",
                  textConfirm: "Ya",
                  confirmTextColor: AppColors.white,
                  onConfirm: () {
                    todoController.deleteTodo(realIndex);
                    Get.back();
                    Get.snackbar("Berhasil", "Task berhasil dihapus");
                  },
                );
              },
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodoPage),
        child: const Icon(Icons.add, color: AppColors.mediumblue),
      ),
    );
  }
}
