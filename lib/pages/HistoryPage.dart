import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/responsiveController/history_responsive_controller.dart';
import 'package:todo_app/pages/history_page/history_mobile.dart';
import 'package:todo_app/pages/history_page/history_widescreen.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final controller = Get.put(HistoryResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? HistoryMobile()
                : HistoryWidescreen(),
          );
        },
      ),
    );
  }
}
