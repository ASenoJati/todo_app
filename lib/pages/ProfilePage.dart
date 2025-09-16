import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.brown[800],
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('images/LogoSMK.png'),
              ),
            ),
            const SizedBox(height: 15),

            const Text(
              "Arkana X Seno",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "murty@example.com",
              style: TextStyle(fontSize: 16, color: Colors.black54),
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
                      leading: Icon(Icons.home, color: Colors.brown),
                      title: Text("School"),
                      subtitle: Text("SMK RADEN UMAR SAID"),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.info, color: Colors.brown),
                      title: Text("About Me"),
                      subtitle: Text("Mobile Development Flutter Project"),
                    ),
                    CButton(
                      myText: "Log Out",
                      myTextColor: Colors.white,
                      onPressed: () {
                        Get.snackbar("Log Out", "You have been logged out");
                        Get.offAllNamed('/login');
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
