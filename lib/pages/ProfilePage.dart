import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Profile"),
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.blue,
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('image/photoprofil.png'),
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              "Arkana X Seno",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "arkan@ui.com",
              style: TextStyle(fontSize: 16, color: AppColors.black),
            ),

            const SizedBox(height: 20),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.home,
                        color: AppColors.darkblue,
                      ),
                      title: Text("School"),
                      subtitle: Text("SMK RADEN UMAR SAID"),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(
                        Icons.info,
                        color: AppColors.darkblue,
                      ),
                      title: Text("About Me"),
                      subtitle: Text("Mobile Development Flutter Project"),
                    ),
                    CButton(
                      myText: "Log Out",
                      myTextColor: AppColors.white,
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Konfirmasi",
                          middleText: "Apakah kamu yakin ingin log out?",
                          textCancel: "Tidak",
                          textConfirm: "Ya",
                          confirmTextColor: AppColors.white,
                          onConfirm: () {
                            Get.back();
                            Get.snackbar(
                              "Log Out",
                              "Apakah yakin anda ingin log out",
                            );
                            Get.offAllNamed('/login');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
