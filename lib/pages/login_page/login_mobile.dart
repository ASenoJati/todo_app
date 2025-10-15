import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';

class LoginMobile extends GetView<LoginController> {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
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
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightblue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Login Untuk Melanjutkan",
                  style: TextStyle(color: AppColors.black, fontSize: 14),
                ),
                const SizedBox(height: 24),
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 24),
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
