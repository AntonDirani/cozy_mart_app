import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? height, width;

  const MyTextField(
      {this.height,
      this.label,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.width});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
  }
}
