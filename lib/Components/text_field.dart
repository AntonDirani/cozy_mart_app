import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final bool ispassword;
  final double? height, width;
  final TextInputType? keyboardType;
  final bool? filled;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const MyTextField({
    this.height,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.keyboardType,
    this.filled = true,
    this.validator,
    this.controller,
    this.onChanged,
    this.suffixPressed,
    this.ispassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: ispassword,
      decoration: InputDecoration(
          filled: filled,
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                  ),
                )
              : null,
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
  final TextEditingController? controller;
  final String? text;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final String? initial;

  const TextFieldP({
    this.initial,
    this.labelp,
    this.hintp,
    this.prefixIconp,
    this.suffixIconp,
    this.keyboardTypep,
    this.controller,
    this.text,
    this.onChanged,
    this.validate,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial,
      validator: validate,
      onChanged: onChanged,
      keyboardType: keyboardTypep,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelp,
        hintText: hintp,
        prefixIcon: prefixIconp,
        suffixIcon: suffixIconp,
      ),
    );
  }
}
