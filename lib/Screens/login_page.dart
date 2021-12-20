import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'package:cozy_mart_0/Componnets/defButton.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 60.0,
                    ),
                    Image.asset(
                      'images/Login.png',
                      height: 250,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Log in',
                      style:
                          TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                      child: TextField(
                        label: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: TextField(
                          label: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defButton(
                      buttonText: 'Log In',
                      buttonDestination: SignupPage(),
                      bWidth: 200,
                      bHeight: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  late String label;
  late Icon? prefixIcon;
  late Icon? suffixIcon;
  late double? height, width;

  TextField(
      {this.height,
      required this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.width});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}
