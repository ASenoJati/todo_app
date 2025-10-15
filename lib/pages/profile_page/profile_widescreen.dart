import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/controllers/LoginController.dart';

class ProfileWidescreen extends StatelessWidget {
  const ProfileWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 600,
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('image/photoprofil.png'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Arkana X Seno",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "arkan@ui.com",
                  style: TextStyle(fontSize: 18, color: AppColors.black),
                ),
                const SizedBox(height: 30),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      children: [
                        const ListTile(
                          leading: Icon(
                            Icons.home,
                            color: AppColors.darkblue,
                            size: 32,
                          ),
                          title: Text("School", style: TextStyle(fontSize: 20)),
                          subtitle: Text(
                            "SMK RADEN UMAR SAID",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const Divider(),
                        const ListTile(
                          leading: Icon(
                            Icons.info,
                            color: AppColors.darkblue,
                            size: 32,
                          ),
                          title: Text(
                            "About Me",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            "Mobile Development Flutter Project",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                  "Berhasil!",
                                  "Anda telah berhasil keluar",
                                );
                                loginController.logout();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
