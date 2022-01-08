import 'dart:core';
import 'package:cozy_mart_0/Screens/all_products.dart';
import 'package:cozy_mart_0/user_controller.dart';
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
  bool isPassword = false;
  var formKey = GlobalKey<FormState>();
  bool islogin = true;
  String email = '';
  String password = '';

  Future<void> login() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AllProducts();
    }));
    /*final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    } else {
      UserHttpService service = UserHttpService();
      try {
        final result = await service.loginUser(
            emailController.text, passwordController.text);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllProducts();
        }));
      } catch (e) {
        print(e.toString());
      }
    }*/
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
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
                            onChanged: (value) => password = value,
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
