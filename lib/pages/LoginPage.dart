import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Todo List Application",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 23, 101, 164),
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Login Untuk Melanjutkan",
                  style: TextStyle(color: Colors.black54),
                ),

                SizedBox(height: 10),

                CTextfield(
                  controller: controller.usernameController,
                  label: 'Username',
                  obscureText: false,
                  labelColor: Colors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 20.0,
                  borderWidht: 18,
                  bordercolor: Colors.black,
                ),

                SizedBox(height: 10.0),

                CTextfield(
                  controller: controller.passwordController,
                  label: 'Password',
                  obscureText: true,
                  labelColor: Colors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 20.0,
                  borderWidht: 18,
                  bordercolor: Colors.black,
                ),

                const SizedBox(height: 24.0),

                CButton(
                  myText: 'Login',
                  myTextColor: const Color.fromARGB(255, 255, 255, 255),
                  onPressed: controller.login,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
