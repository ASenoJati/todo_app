import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final categoryList = ["Sekolah", "Pekerjaan", "Pribadi"];
  final selectedCategory = "Sekolah".obs;

  final selectedDate = Rx<DateTime?>(null);

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  final selectedDueDate = Rx<DateTime?>(null);

  Future<void> pickDueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) {
      selectedDueDate.value = picked;
    }
  }

  var title = ''.obs;
  var description = ''.obs;
  var category = ''.obs;
  var dateNow = ''.obs;

  void addNewTodo() {
    if (title.isEmpty || description.isEmpty) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Judul dan Deskripsi tidak boleh kosong!",
      );
      return;
    }

    todoController.addTodo(
      title.value,
      description.value,
      category.value,
      selectedDate.value.toString(),
      selectedDueDate.value.toString(),
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
