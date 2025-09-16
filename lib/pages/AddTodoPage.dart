import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  final TodoController todoController = Get.find();
  final controller = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller.descController,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedCategory.value,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                items: controller.categoryList
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value!;
                },
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final dateText = controller.selectedDate.value == null
                  ? "Pilih tanggal"
                  : DateFormat(
                      "d MMMM yyyy",
                      "id_ID",
                    ).format(controller.selectedDate.value!);
              return OutlinedButton.icon(
                icon: const Icon(Icons.date_range),
                label: Text(dateText),
                onPressed: () => controller.pickDate(context),
              );
            }),

            Obx(() {
              final dateText = controller.selectedDueDate.value == null
                  ? "Pilih tanggal"
                  : DateFormat(
                      "d MMMM yyyy",
                      "id_ID",
                    ).format(controller.selectedDueDate.value!);
              return OutlinedButton.icon(
                icon: const Icon(Icons.date_range),
                label: Text(dateText),
                onPressed: () => controller.pickDueDate(context),
              );
            }),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.titleController.text.isNotEmpty &&
                      controller.descController.text.isNotEmpty &&
                      controller.selectedDate.value != null) {
                    final String formattedDate = DateFormat(
                      'dd MMM yyyy',
                      'id_ID',
                    ).format(controller.selectedDate.value!);

                    final String formattedDueDate = DateFormat(
                      'dd MMM yyyy',
                      'id_ID',
                    ).format(controller.selectedDueDate.value!);

                    todoController.addTodo(
                      controller.titleController.text,
                      controller.descController.text,
                      controller.selectedCategory.value,
                      formattedDate,
                      formattedDueDate,
                    );

                    Get.back();
                    Get.snackbar("Sukses", "Tugas berhasil ditambahkan");
                  } else {
                    Get.snackbar(
                      "Error",
                      "Judul, Deskripsi & Tanggal harus diisi",
                    );
                  }
                },
                child: const Text("Simpan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
