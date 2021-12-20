import 'package:cozy_mart_0/constants.dart';
import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  late String? label;
  late String? hint;
  late Icon? prefixIcon;
  late Icon? suffixIcon;
  late double? height, width;

  TextField(
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
