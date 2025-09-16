import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  final TodoController todoController = Get.find();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categoryList = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString selectedCategory = "Sekolah".obs;
  final String dateNow = DateFormat(
    'dd MMM yyyy, HH:mm',
  ).format(DateTime.now());

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
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Judul",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DropdownButtonFormField<String>(
                value: selectedCategory.value,
                decoration: const InputDecoration(
                  labelText: "Kategori",
                  border: OutlineInputBorder(),
                ),
                items: categoryList
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) {
                  selectedCategory.value = value!;
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descController.text.isNotEmpty) {
                    final String dateNow = DateFormat(
                      'dd MMM yyyy, HH:mm',
                    ).format(DateTime.now());

                    todoController.addTodo(
                      titleController.text,
                      descController.text,
                      selectedCategory.value,
                      dateNow,
                    );

                    Get.back();
                    Get.snackbar("Sukses", "Tugas berhasil ditambahkan");
                  } else {
                    Get.snackbar("Error", "Judul & Deskripsi harus diisi");
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
