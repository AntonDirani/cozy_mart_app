import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? height, width;
  final TextInputType? keyboardType;

  const MyTextField({
    this.keyboardType,
    this.height,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: true,
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.deepPurple))),
    );
  }
}
