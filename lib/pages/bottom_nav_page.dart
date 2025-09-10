import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'HistoryPage.dart';
import 'ProfilePage.dart';


class BottomNavPage extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold (
      body: pages[navController.selectedIndex.value],
      bottomNavigationBar: BottomAppBar(
        currentIndex: navController.selectedIndex.value,
        onTap: navController.changeTabIndex,
        selectedItemColor: Colors.deepPurple,
        items: const[
          BottomNavigationBarItem( 
          icon: Icon(Icons.home) ,
          label: 'Home', ),
          BottomNavigationBarItem( 
          icon: Icon(Icons.history) ,
          label: 'History', ),
          BottomNavigationBarItem( 
          icon: Icon(Icons.verified_user) ,
          label: 'Profile', ),
        ]
      ),

    ));
  }
}
