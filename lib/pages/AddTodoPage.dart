import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/responsiveController/addtodo_responsive_controller.dart';
import 'package:todo_app/pages/add_todo_page/addtodo_mobile.dart';
import 'package:todo_app/pages/add_todo_page/addtodo_widescreen.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});
  final controller = Get.put(AddtodoResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? AddtodoMobile()
                : AddtodoWidescreen(),
          );
        },
      ),
    );
  }
}
