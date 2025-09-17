import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/HomeController.dart';
import 'package:todo_app/pages/HistoryPage.dart';
import 'package:todo_app/pages/ProfilePage.dart';
import 'package:todo_app/pages/TodoPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    final List<Widget> pages = [TodoPage(), HistoryPage(), ProfilePage()];

    return Obx(() {
      return Scaffold(
        body: pages[controller.currentIndex.value],

        // Bottom Navigation
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.sports),
              label: "Todo List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      );
    });
  }
}
