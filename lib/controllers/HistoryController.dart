import 'package:get/get.dart';
import 'package:todo_app/controllers/TodoController.dart';

class HistoryController extends GetxController {
  final todoController = Get.find<TodoController>();

  List get history => todoController.history;
}
