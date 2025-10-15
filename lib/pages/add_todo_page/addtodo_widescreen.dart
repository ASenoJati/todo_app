import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CToast.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/helper/responsive_utils.dart';

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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
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
                _buildDateButton(context, controller, true),
                const SizedBox(height: 12),
                _buildDateButton(context, controller, false),
                const SizedBox(height: 24),
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
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
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
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveUtils.isMobile(context) ? 14 : 18,
              horizontal: ResponsiveUtils.isMobile(context) ? 20 : 40,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: Icon(isStartDate ? Icons.event : Icons.schedule),
          label: Text(
            dateText,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
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
