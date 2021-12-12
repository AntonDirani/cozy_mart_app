// ignore_for_file: file_names
import 'package:cozy_mart_0/constants.dart';
import 'package:flutter/material.dart';

class defButton extends StatelessWidget {
  late final String buttonText;
  late final Color buttonColor;
  late final Widget buttonDestination;
  late double bHeight, bWidth;
  defButton(
      {required this.buttonText,
      this.buttonColor = primaryColor,
      required this.buttonDestination,
      this.bWidth = 300,
      this.bHeight = 60});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return buttonDestination;
        }));
      },
      child: Text(
        buttonText,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      ),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: Size(bWidth, bHeight),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
