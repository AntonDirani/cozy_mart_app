import 'dart:io';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  TextEditingController chnameController = TextEditingController();
  TextEditingController chemailController = TextEditingController();
  TextEditingController chphoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40.0,
                ),
                TextFieldP(
                  labelp: 'Change name',
                  prefixIconp: Icon(Icons.account_circle_sharp),
                  controller: chnameController,
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.emailAddress,
                  labelp: 'Email',
                  prefixIconp: Icon(Icons.email),
                  controller: chemailController,
                ),
                TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: 'Change Phone Number',
                  controller: chphoneController,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 17.0, 0.0),
                  child: DefButton(
                    buttonText: 'save',
                    buttonDestination: EditProfile(),
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
