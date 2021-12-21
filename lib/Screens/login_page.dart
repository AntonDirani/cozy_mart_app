import 'package:cozy_mart_0/Screens/all_products.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:cozy_mart_0/Components/text_field.dart';

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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                      child: MyTextField(
                        label: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: MyTextField(
                          label: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    DefButton(
                      buttonText: 'Log In',
                      buttonDestination: AllProducts(),
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
