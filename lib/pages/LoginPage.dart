import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';
import 'package:todo_app/components/CColor.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black,
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
                    color: AppColors.lightblue,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  "Login Untuk Melanjutkan",
                  style: TextStyle(color: AppColors.black),
                ),

                SizedBox(height: 10),

                CTextfield(
                  controller: controller.usernameController,
                  label: 'Username',
                  obscureText: false,
                  labelColor: AppColors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 20.0,
                  borderWidht: 18,
                  bordercolor: AppColors.black,
                ),

                SizedBox(height: 10.0),

                CTextfield(
                  controller: controller.passwordController,
                  label: 'Password',
                  obscureText: true,
                  labelColor: AppColors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 20.0,
                  borderWidht: 18,
                  bordercolor: AppColors.black,
                ),

                const SizedBox(height: 24.0),

                CButton(
                  myText: 'Login',
                  myTextColor: AppColors.white,
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
