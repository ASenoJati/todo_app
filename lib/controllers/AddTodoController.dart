import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final categoryList = ["Urgent", "High", "Normal", "Low"];
  final selectedCategory = "Urgent".obs;

  final selectedDate = Rx<DateTime?>(null);
  final selectedDueDate = Rx<DateTime?>(null);

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> pickDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) selectedDueDate.value = picked;
  }

  var title = ''.obs;
  var description = ''.obs;
  var category = ''.obs;

  void addNewTodo() async {
    if (titleController.text.isEmpty || descController.text.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Judul dan Deskripsi tidak boleh kosong!",
      );
      return;
    }

    await todoController.addTodo(
      titleController.text,
      descController.text,
      selectedCategory.value,
      selectedDate.value?.toString() ?? DateTime.now().toString(),
      selectedDueDate.value?.toString() ?? '',
    );

    Get.back();
    Get.snackbar("Sukses", "Todo berhasil ditambahkan");
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
