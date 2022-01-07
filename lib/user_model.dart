import 'dart:convert';

import 'package:cozy_mart_0/user_controller.dart';

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.password,
  });

  String userName;
  String email;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["User_name"],
        email: json["Email"],
        phoneNumber: json["Phone_number"],
        gender: json["Gender"],
        dateOfBirth: json["Date_of_birth"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "User_name": userName,
        "Email": email,
        "Phone_number": phoneNumber,
        "Gender": gender,
        "Date_of_birth": dateOfBirth,
        "password": password,
      };
}
