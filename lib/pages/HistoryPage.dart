import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,        

      ),

       body: Obx(    
      () {
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
            onDelete: () {
              todoController.deleteTodo(index);
            },
          );
        },
      );
    })
    );
   
  }
}
