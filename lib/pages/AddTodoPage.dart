import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/TodoController.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/helper/responsive_utils.dart';

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
        title: Text(
          "Tambah Todo",
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: ResponsiveUtils.getResponsiveCardWidth(context),
            padding: ResponsiveUtils.getResponsivePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: controller.titleController,
                  style: TextStyle(
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                  ),
                  decoration: InputDecoration(
                    labelText: "Judul",
                    hintText: "Masukkan judul tugas",
                    prefixIcon: const Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 16 : 20),
                TextField(
                  controller: controller.descController,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                  ),
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
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 16 : 20),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedCategory.value,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                      color: Colors.black,
                    ),
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
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 16 : 20),
                _buildDateButton(context, controller, true),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 12 : 16),
                _buildDateButton(context, controller, false),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 28 : 36),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveUtils.isMobile(context) ? 16 : 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.save, color: AppColors.white),
                    label: Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
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
      showDangerToast("Task, Deskripsi & Tanggal semua harus diisi!");
      return;
    }

    if (dueDate != null && dueDate.isBefore(date)) {
      showDangerToast("Tanggal batas harus setelah tanggal dibuat!");
      return;
    }

    final String formattedDate = DateFormat('dd MMM yyyy', 'id_ID').format(date);
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
  }
}