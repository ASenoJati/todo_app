import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HistoryWidescreen extends StatelessWidget {
  HistoryWidescreen({super.key});
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'image/background2.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Obx(() {
              if (todoController.history.isEmpty) {
                return const Center(
                  child: Text(
                    "Belum Ada Task Selesai",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                );
              }

              // ✅ Gunakan GridView dengan SafeArea dan padding bawah agar tidak overflow
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 80),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: todoController.history.length,
                itemBuilder: (context, index) {
                  final todo = todoController.history[index];
                  return CTodoCard(
                    title: todo.title,
                    description: todo.description,
                    category: todo.category,
                    isDone: true,
                    date: todo.date,
                    dueDate: todo.dueDate,
                    onDelete: () {
                      final realIndex = todoController.todos.indexOf(todo);
                      todoController.deleteTodo(realIndex);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
