import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';

class LoginWidescreen extends GetView<LoginController> {
  const LoginWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Todo List Application",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightblue,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Login Untuk Melanjutkan",
                  style: TextStyle(color: AppColors.black, fontSize: 18),
                ),
                const SizedBox(height: 40),
                CTextfield(
                  controller: controller.usernameController,
                  label: 'Username',
                  obscureText: false,
                  labelColor: AppColors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 24.0,
                  borderWidht: 18,
                  bordercolor: AppColors.black,
                ),
                const SizedBox(height: 20),
                CTextfield(
                  controller: controller.passwordController,
                  label: 'Password',
                  obscureText: true,
                  labelColor: AppColors.black,
                  pass: false,
                  isNumber: false,
                  borderRadius: 24.0,
                  borderWidht: 18,
                  bordercolor: AppColors.black,
                ),
                const SizedBox(height: 32),
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
