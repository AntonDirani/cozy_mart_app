import 'package:cozy_mart_0/Screens/all_products.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:cozy_mart_0/Components/text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey();

  bool isPassword = false;

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
                child: Form(
                  key: formKey,
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                        child: MyTextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (email) {},
                          label: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                          child: MyTextField(
                            controller: passwordController,
                            label: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            ispassword: isPassword,
                            suffixPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            onChanged: (password) {},
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
      ),
    );
  }
}
