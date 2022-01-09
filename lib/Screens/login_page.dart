import 'dart:core';
import 'package:cozy_mart_0/Screens/all_products.dart';
import 'package:cozy_mart_0/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'signup_page.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:cozy_mart_0/Components/text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isPassword = false;
  var formKey = GlobalKey<FormState>();
  bool islogin = true;
  String email = '';
  String password = '';

  Future<void> login() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    } else {
      UserHttpService service = UserHttpService();
      try {
        final result = await service.loginUser(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => AllProducts(),
          ),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static Future init() async {
    var localStorage = await SharedPreferences.getInstance();
  }

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
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                            emailcontroller..text = email;
                            emailcontroller
                              ..selection = TextSelection.collapsed(
                                  offset: emailcontroller.text.length);
                          },
                          label: 'Email',
                          prefixIcon: Icon(Icons.email),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('com')) {
                              return 'Enter email ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                          child: MyTextField(
                            controller: passwordcontroller,
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
                            onChanged: (value) {
                              password = value;
                              passwordcontroller..text = password;
                              passwordcontroller
                                ..selection = TextSelection.collapsed(
                                    offset: passwordcontroller.text.length);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password ';
                              } else if (value.length < 6) {
                                return 'The password is too short ';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ElevatedButton(
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              fixedSize: const Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            login();
                          }),
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
