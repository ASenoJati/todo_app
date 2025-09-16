import 'package:get/get.dart';
import 'package:todo_app/controllers/AddTodoController.dart';
import 'package:todo_app/controllers/HistoryController.dart';
import 'package:todo_app/controllers/HomeController.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<AddTodoController>(() => AddTodoController());
    Get.lazyPut<HistoryController>(() => HistoryController(), fenix: true);
  }
}
