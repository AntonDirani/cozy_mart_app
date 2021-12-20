import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/material.dart';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
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
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                      child: Row(
                        children: const [
                          Expanded(
                            child: MyTextField(
                              hint: 'First name',
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: MyTextField(
                              hint: 'Last name',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                      child: MyTextField(
                        hint: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                      child: MyTextField(
                        hint: 'Phone Number',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                      child: TextField(
                        controller: dateinput,
                        decoration: InputDecoration(
                            filled: true,
                            labelText: 'Enter Date',
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                        child: MyTextField(
                          label: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        )),
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
    );
  }
}
