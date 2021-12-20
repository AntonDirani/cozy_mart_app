import 'package:flutter/material.dart';

class User {
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phoneNumber;
  late final String gender;
  late final DateTime dateOfBirth;
  late final String password;

  User({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}
