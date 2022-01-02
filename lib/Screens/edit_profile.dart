import 'dart:io';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/material.dart';
import 'my_account.dart';

class EditProfile extends StatelessWidget {
  TextEditingController chnameController = TextEditingController();
  TextEditingController chemailController = TextEditingController();
  TextEditingController chphoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                TextFieldP(
                  labelp: 'Change name',
                  prefixIconp: const Icon(Icons.account_circle_sharp),
                  text: user.name,
                  onChanged: (name) {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter name ';
                    }
                    return null;
                  },
                  //controller: chnameController,
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.emailAddress,
                  labelp: 'Email',
                  prefixIconp: Icon(Icons.email),
                  text: user.email,
                  onChanged: (email) {},
                  controller: chemailController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email ';
                    }
                    return null;
                  },
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: ' Phone Number',
                  text: user.number,
                  onChanged: (number) {},
                  controller: chphoneController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter phone number ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                  child: DefButton(
                    buttonText: 'save',
                    buttonDestination: MyAccount(),
                    bWidth: 200,
                    bHeight: 50,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
