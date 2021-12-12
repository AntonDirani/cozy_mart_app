// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ourButton extends StatelessWidget {
  const ourButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Log in',
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
      ),
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6C2B95),
          fixedSize: const Size(300.0, 60.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
