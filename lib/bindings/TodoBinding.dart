import 'package:get/get_instance/get_instance.dart';
import 'package:get/utils.dart';
import 'package:todo_app/controllers/TodoController.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<TodoController>(() => TodoController());
  }
}
