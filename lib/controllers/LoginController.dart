import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/routes/routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoggedIn = false.obs;

  void login() {
    if (usernameController.text == "admin" &&
        passwordController.text == "admin") {
      isLoggedIn.value = true;
      Get.snackbar("Success", "Login berhasil");
      Get.offNamed(AppRoutes.homePage);
    } else {
      Get.snackbar("Error", "Username / Password salah");
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
