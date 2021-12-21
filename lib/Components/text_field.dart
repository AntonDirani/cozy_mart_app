import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? height, width;
  final TextInputType? keyboardType;

  const MyTextField({
    this.height,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          // keyboardType: keyboardType,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.deepPurple))),
    );
  }
}
