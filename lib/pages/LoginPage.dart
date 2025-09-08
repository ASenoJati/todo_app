import 'package:flutter/material.dart';
import 'package:todo_app/components/CButton.dart';
import 'package:todo_app/components/CTextField.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CTextfield(controller: _usernameController,
                label: 'Username', 
                labelColor: Colors.black,
                pass: false,
                isNumber: false,
                borderRadius: 20.0, 
                borderWidht: 18, 
                bordercolor: Colors.black
                ),
              
              SizedBox(height: 10.0,),

              CTextfield(controller: _passwordController,
                label: 'Password', 
                labelColor: Colors.black, 
                pass: false, 
                isNumber: false, 
                borderRadius: 20.0, 
                borderWidht: 18, 
                bordercolor: Colors.black
                ),
        

              const SizedBox(height: 24.0),

              CButton(myText: 'Login', myTextColor: Colors.blue, onPressed: (){
                 print('username: ${_usernameController.text}');
                  print('password: ${_passwordController.text}');
              },
              ),

              const SizedBox(height: 16.0),

              TextButton(
                onPressed: () {
                  print('Register clicked');
                //  Navigator.pushNamed(context, "/register");
                },
                child: const Text('Belum punya akun? Daftar Sekarang',
                style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
