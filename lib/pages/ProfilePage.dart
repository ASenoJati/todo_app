import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/controllers/LoginController.dart';
import 'package:todo_app/helper/responsive_utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 28),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightblue,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: ResponsiveUtils.getResponsiveCardWidth(context),
            padding: ResponsiveUtils.getResponsivePadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: ResponsiveUtils.isMobile(context) ? 60 : 80,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    radius: ResponsiveUtils.isMobile(context) ? 55 : 75,
                    backgroundImage: const AssetImage('image/photoprofil.png'),
                  ),
                ),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 15 : 20),
                Text(
                  "Arkana X Seno",
                  style: TextStyle(
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 22),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "arkan@ui.com",
                  style: TextStyle(
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 16),
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 30),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: ResponsiveUtils.getResponsivePadding(context),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: AppColors.darkblue,
                            size: ResponsiveUtils.isMobile(context) ? 24 : 32,
                          ),
                          title: Text(
                            "School",
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                16,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "SMK RADEN UMAR SAID",
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                14,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            color: AppColors.darkblue,
                            size: ResponsiveUtils.isMobile(context) ? 24 : 32,
                          ),
                          title: Text(
                            "About Me",
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                16,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Mobile Development Flutter Project",
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveUtils.isMobile(context) ? 16 : 20),
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