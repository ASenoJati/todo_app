import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/responsiveController/login_responsive_controller.dart';
import 'package:todo_app/pages/login_page/login_mobile.dart';
import 'package:todo_app/pages/login_page/login_widescreen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.put(LoginResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value ? LoginMobile() : LoginWidescreen(),
          );
        },
      ),
    );
  }
}
