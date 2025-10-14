import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CTodoCard.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/helper/responsive_utils.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 28),
            fontWeight: FontWeight.bold,
          ),
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
            if (todoController.activeTodos.isEmpty) {
              return Center(
                child: Text(
                  "Belum Ada Task",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                  ),
                ),
              );
            }

            // Tablet: Grid Layout 2 kolom
            if (ResponsiveUtils.isTablet(context)) {
              return GridView.builder(
                padding: ResponsiveUtils.getResponsivePadding(context),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: ResponsiveUtils.getGridAspectRatio(context),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
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
                      todoController.markAsDone(
                        todoController.todos.indexOf(todo),
                      );
                    },
                    onDelete: () {
                      _showDeleteDialog(context, todo, index);
                    },
                  );
                },
              );
            }

            // Mobile: ListView
            return ListView.builder(
              padding: ResponsiveUtils.getResponsivePadding(context),
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
                    todoController.markAsDone(
                      todoController.todos.indexOf(todo),
                    );
                  },
                  onDelete: () {
                    _showDeleteDialog(context, todo, index);
                  },
                );
              },
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodoPage),
        child: const Icon(Icons.add, color: AppColors.mediumblue),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, todo, int index) {
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
  }
}