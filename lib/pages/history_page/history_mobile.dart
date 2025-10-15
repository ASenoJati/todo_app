import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HistoryMobile extends StatelessWidget {
  const HistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
          Obx(() {
            if (todoController.history.isEmpty) {
              return const Center(
                child: Text(
                  "Belum Ada Task Selesai",
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
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
        ],
      ),
    );
  }
}
