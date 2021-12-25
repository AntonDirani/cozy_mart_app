import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final double? height, width;
  final TextInputType? keyboardType;
  final bool? filled;

  const MyTextField({
    this.height,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.keyboardType,
    this.filled = true,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: filled,
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

class TextFieldP extends StatelessWidget {
  final String? labelp;
  final String? hintp;
  final Icon? prefixIconp;
  final Icon? suffixIconp;
  final TextInputType? keyboardTypep;

  const TextFieldP({
    this.labelp,
    this.hintp,
    this.prefixIconp,
    this.suffixIconp,
    this.keyboardTypep,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardTypep,
      decoration: InputDecoration(
        labelText: labelp,
        hintText: hintp,
        prefixIcon: prefixIconp,
        suffixIcon: suffixIconp,
      ),
    );
  }
}
