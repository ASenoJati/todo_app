import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CTextField.dart';
import 'package:todo_app/controllers/LoginController.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CTextfield(
                controller: controller.usernameController,
                label: 'Username',
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
                myTextColor: Colors.blue,
                onPressed: controller.login,
              ),

              const SizedBox(height: 16.0),

              TextButton(
                onPressed: () {
                  print('Register clicked');
                  //  Navigator.pushNamed(context, "/register");
                },
                child: const Text(
                  'Belum punya akun? Daftar Sekarang',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
