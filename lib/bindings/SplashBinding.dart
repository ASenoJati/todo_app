import 'package:get/get.dart';
import 'package:todo_app/controllers/SplashscreenController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Splashscreencontroller>(() => Splashscreencontroller());
  }
}
