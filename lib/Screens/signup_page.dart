import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';
import 'package:flutter/services.dart';

import '../user_controller.dart';
import 'all_products.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  bool isPassword = true;

  var formKey = GlobalKey<FormState>();
  bool isSingup = true;
  String userName = '';
  String email = '';
  String password = '';
  String phone = '';

  Future<void> Signup() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    } else {
      UserHttpService service = UserHttpService();
      try {
        final result = await service.SignupUser(
            emailcontroller.text,
            passwordcontroller.text,
            numcontroller.text,
            userNamecontroller.text);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AllProducts();
        }));
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void _Signup() {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      formKey.currentState!.save();
      print(email);
      print(password);
      print(userName);
      print(phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      const Text(
                        'Sign up',
                        style:
                            TextStyle(fontSize: 30.0, fontFamily: 'Montserrat'),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          controller: userNamecontroller,
                          hint: 'Full Name',
                          onChanged: (value) => userName = value,
                          prefixIcon: const Icon(Icons.account_circle_sharp),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          controller: emailcontroller,
                          onChanged: (value) => email = value,
                          hint: 'Email',
                          prefixIcon: const Icon(Icons.email),
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
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                          child: MyTextField(
                            controller: passwordcontroller,
                            label: 'Password',
                            prefixIcon: const Icon(Icons.lock),
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
                              } else if (value.length < 5) {
                                return 'The password is too short! ';
                              }
                              return null;
                            },
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          controller: numcontroller,
                          keyboardType: TextInputType.number,
                          onChanged: (value) => phone = value,
                          hint: 'Phone Number',
                          prefixIcon: const Icon(Icons.call),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter phone number ';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
                              fixedSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            Signup();
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
