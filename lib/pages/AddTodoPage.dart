import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/components/CColor.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  final TodoController todoController = Get.find();
  final controller = Get.put(AddTodoController());

  void showDangerToast(String message) {
    Get.snackbar(
      "Gagal",
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 8,
      icon: const Icon(Icons.error_outline, color: Colors.white),
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Todo"),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
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

            // Pilih Tanggal Dibuat
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
                    horizontal: 60,
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

            // Pilih Tanggal Batas
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
                    horizontal: 60,
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

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.save, color: AppColors.white),
                label: const Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                onPressed: () {
                  final title = controller.titleController.text;
                  final desc = controller.descController.text;
                  final date = controller.selectedDate.value;
                  final dueDate = controller.selectedDueDate.value;

                  if (title.isEmpty || desc.isEmpty || date == null) {
                    showDangerToast(
                      "Task, Deskripsi & Tanggal semua harus diisi!",
                    );
                    return;
                  }

                  if (dueDate != null && dueDate.isBefore(date)) {
                    showDangerToast(
                      "Tanggal batas harus setelah tanggal dibuat!",
                    );
                    return;
                  }

                  final String formattedDate = DateFormat(
                    'dd MMM yyyy',
                    'id_ID',
                  ).format(date);
                  final String formattedDueDate = dueDate != null
                      ? DateFormat('dd MMM yyyy', 'id_ID').format(dueDate)
                      : '';

                  todoController.addTodo(
                    title,
                    desc,
                    controller.selectedCategory.value,
                    formattedDate,
                    formattedDueDate,
                  );

                  Get.back();
                  Get.snackbar(
                    "Sukses",
                    "Task berhasil ditambahkan",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(12),
                    borderRadius: 8,
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
