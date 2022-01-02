import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:intl/intl.dart';
import 'package:validators/validators.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController full_namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phone_numcontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
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
                          controller: full_namecontroller,
                          hint: 'Full Name',
                          onChanged: (name) {},
                          prefixIcon: const Icon(Icons.account_circle_sharp),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          controller: emailcontroller,
                          onChanged: (email) {},
                          hint: 'Email',
                          prefixIcon: const Icon(Icons.email),
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
                            onChanged: (password) {},
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          controller: phone_numcontroller,
                          keyboardType: TextInputType.number,
                          onChanged: (phone_number) {},
                          hint: 'Phone Number',
                          prefixIcon: const Icon(Icons.call),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: TextField(
                          controller: datecontroller,
                          decoration: InputDecoration(
                              filled: true,
                              labelText: 'Enter Date',
                              prefixIcon: const Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          readOnly: true,
                          onChanged: (date) {},
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                datecontroller.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      DefButton(
                        buttonText: 'Sign up',
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
      ),
    );
  }
}
