import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';
import 'package:todo_app/components/CColor.dart';
import 'package:todo_app/helper/responsive_utils.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: ResponsiveUtils.getResponsiveCardWidth(context),
            padding: ResponsiveUtils.getResponsivePadding(context),
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.isMobile(context) ? 20 : 40,
            ),
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
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 26),
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightblue,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 3 : 8),
                Text(
                  "Login Untuk Melanjutkan",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                  ),
                ),
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 30),
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
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 16 : 20),
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
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 24 : 32),
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