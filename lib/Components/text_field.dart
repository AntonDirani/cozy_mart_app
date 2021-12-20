import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? height, width;
  // final ? keyboardType;

  const MyTextField({
    this.height,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    //this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          // keyboardType: keyboardType,
          filled: true,
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}
