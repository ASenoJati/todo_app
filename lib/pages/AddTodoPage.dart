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
      appBar: AppBar(
        title: const Text("Tambah Todo"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: "Judul",
                hintText: "Masukkan judul tugas",
                prefixIcon: const Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: controller.descController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Deskripsi",
                hintText: "Tuliskan detail tugas",
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedCategory.value,
                decoration: InputDecoration(
                  labelText: "Kategori",
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: controller.categoryList
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value!;
                },
              ),
            ),
            const SizedBox(height: 16),

            Obx(() {
              final dateText = controller.selectedDate.value == null
                  ? "Pilih Tanggal Dibuat"
                  : DateFormat(
                      "d MMMM yyyy",
                      "id_ID",
                    ).format(controller.selectedDate.value!);
              return OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.event),
                label: Text(dateText),
                onPressed: () => controller.pickDate(context),
              );
            }),
            const SizedBox(height: 12),

            Obx(() {
              final dateText = controller.selectedDueDate.value == null
                  ? "Pilih Tanggal Batas"
                  : DateFormat(
                      "d MMMM yyyy",
                      "id_ID",
                    ).format(controller.selectedDueDate.value!);
              return OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.schedule),
                label: Text(dateText),
                onPressed: () => controller.pickDueDate(context),
              );
            }),
            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text(
                  "Simpan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
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
                    Get.snackbar("Sukses", "Task berhasil ditambahkan");
                  } else {
                    Get.snackbar(
                      "Error",
                      "Task, Deskripsi & Tanggal semua harus diisi",
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
