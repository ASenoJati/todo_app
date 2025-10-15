import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/responsiveController/todo_responsive_controller.dart';
import 'package:todo_app/pages/todo_page/todo_mobile.dart';
import 'package:todo_app/pages/todo_page/todo_widescreen.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final controller = Get.put(TodoResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value ? TodoMobile() : TodoWidescreen(),
          );
        },
      ),
    );
  }
}
