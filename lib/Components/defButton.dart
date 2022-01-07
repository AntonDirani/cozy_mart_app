// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class DefButton extends StatelessWidget {
  late final String buttonText;
  late final Color buttonColor;
  late final Widget buttonDestination;
  late double bHeight, bWidth;
  late double bFontSize;
  late String bFontFamily;

  DefButton({
    required this.buttonText,
    this.buttonColor = Colors.deepPurple,
    required this.buttonDestination,
    this.bWidth = 300,
    this.bHeight = 60,
    this.bFontSize = 20,
    this.bFontFamily = 'Montserrat',
  });

  void bDestination({required Widget bDest, required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return bDest;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bDestination(bDest: buttonDestination, context: context);
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: bFontFamily,
          fontSize: bFontSize,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: buttonColor,
          fixedSize: Size(bWidth, bHeight),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
