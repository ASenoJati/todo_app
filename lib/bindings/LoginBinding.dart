import 'package:get/get.dart';
import 'package:todo_app/controllers/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<LoginController>(() => LoginController());
  }
}
