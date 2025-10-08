import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/components/CColor.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
              return Center(
                child: Text(
                  "Belum Ada Task Selesai",
                  style: TextStyle(color: AppColors.white),
                ),
              );
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
                  date: todo.date,
                  dueDate: todo.dueDate,
                  onDelete: () {
                    todoController.deleteTodo(index);
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
