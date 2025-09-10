import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (todoController.history.isEmpty) {
        return Center(child: Text("Belum ada todo selesai"));
      }
      return ListView.builder(
        itemCount: todoController.history.length,
        itemBuilder: (context, index) {
          final todo = todoController.history[index];
          return CTodoCard(
            title: todo.title,
            description: todo.description,
            category: todo.category,
            isDone: true,
          );
        },
      );
    });
  }
}
