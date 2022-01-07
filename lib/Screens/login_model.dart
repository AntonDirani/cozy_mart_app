import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["Email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "password": password,
      };
}
