import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/responsiveController/profile_responsive_controller.dart';
import 'package:todo_app/pages/profile_page/profile_mobile.dart';
import 'package:todo_app/pages/profile_page/profile_widescreen.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfileResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? ProfileMobile()
                : ProfileWidescreen(),
          );
        },
      ),
    );
  }
}
