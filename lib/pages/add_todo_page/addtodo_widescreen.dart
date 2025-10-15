import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CToast.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddtodoWidescreen extends StatelessWidget {
  AddtodoWidescreen({super.key});

  final TodoController todoController = Get.find();
  final controller = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Todo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(40),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
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
                const SizedBox(height: 20),
                TextField(
                  controller: controller.descController,
                  maxLines: 4,
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                _buildDateButton(context, controller, true),
                const SizedBox(height: 12),
                _buildDateButton(context, controller, false),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.save, color: AppColors.white),
                    label: const Text(
                      "Simpan",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () => _handleSave(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton(
    BuildContext context,
    AddTodoController controller,
    bool isStartDate,
  ) {
    return Obx(() {
      final date = isStartDate
          ? controller.selectedDate.value
          : controller.selectedDueDate.value;

      final dateText = date == null
          ? (isStartDate ? "Pilih Tanggal Dibuat" : "Pilih Tanggal Batas")
          : DateFormat("d MMMM yyyy", "id_ID").format(date);

      return SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          icon: Icon(isStartDate ? Icons.event : Icons.schedule),
          label: Text(dateText),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => isStartDate
              ? controller.pickDate(context)
              : controller.pickDueDate(context),
        ),
      );
    });
  }

  void _handleSave(BuildContext context) {
    final title = controller.titleController.text;
    final desc = controller.descController.text;
    final date = controller.selectedDate.value;
    final dueDate = controller.selectedDueDate.value;

    if (title.isEmpty || desc.isEmpty || date == null) {
      CToast.showDanger("Task, Deskripsi & Tanggal semua harus diisi!");
      return;
    }

    if (dueDate != null && dueDate.isBefore(date)) {
      CToast.showDanger("Tanggal batas harus setelah tanggal dibuat!");
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
    CToast.showSuccess("Task berhasil ditambahkan");
  }
}
