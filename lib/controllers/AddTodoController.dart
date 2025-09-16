import 'package:get/get.dart';
import 'package:todo_app/controllers/TodoController.dart';

class AddTodoController extends GetxController {
  final todoController = Get.find<TodoController>();

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

    var today = dateNow.value = DateTime.now().toString();

    todoController.addTodo(
      title.value,
      description.value,
      category.value,
      today,
    );

    Get.back();
    Get.snackbar("Sukses", "Todo berhasil ditambahkan");
  }
}
