import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/controllers/LoginController.dart';

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('image/photoprofil.png'),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Arkana X Seno",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "arkan@ui.com",
                  style: TextStyle(fontSize: 14, color: AppColors.black),
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
                            size: 24,
                          ),
                          title: Text("School", style: TextStyle(fontSize: 16)),
                          subtitle: Text(
                            "SMK RADEN UMAR SAID",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const Divider(),
                        const ListTile(
                          leading: Icon(
                            Icons.info,
                            color: AppColors.darkblue,
                            size: 24,
                          ),
                          title: Text(
                            "About Me",
                            style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(
                            "Mobile Development Flutter Project",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 16),
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
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
