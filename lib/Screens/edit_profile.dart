import 'dart:io';
import 'package:cozy_mart_0/Components/text_field.dart';
import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  var chnameController = TextEditingController()..text = ' ';
  var chemailController = TextEditingController()..text = ' ';
  var chphoneController = TextEditingController()..text = ' ';
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
                const TextFieldP(
                  keyboardTypep: TextInputType.name,
                  labelp: 'Change name',
                  prefixIconp: Icon(Icons.account_circle_sharp),
                ),
                const TextFieldP(
                  keyboardTypep: TextInputType.emailAddress,
                  labelp: 'Email',
                  prefixIconp: Icon(Icons.email),
                ),
                const TextFieldP(
                  keyboardTypep: TextInputType.number,
                  labelp: 'Change Phone Number',
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
