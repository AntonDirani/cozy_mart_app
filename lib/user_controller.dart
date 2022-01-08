import 'dart:convert';
import 'package:cozy_mart_0/Screens/signup_page.dart';
import 'package:cozy_mart_0/main.dart';
import 'package:cozy_mart_0/user_model.dart';
import 'package:http/http.dart' as http;

class UserHttpService {
  Future<dynamic> loginUser(String email, String password) async {
    final url = Uri.parse('http://192.168.1.110:8000/api/user/login');

    try {
      final response = await http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          "Email": email,
          "password": password,
        }),
      )
          .then((value) {
        print(value.body);
      });
      var jsonData = jsonDecode(response.body);
      var token = jsonData["Token"];
      return token;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> SignupUser(
      String email, String password, String userName, String number) async {
    final url = Uri.parse('http://192.168.1.107:8000/api/user');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "User_name": userName,
          "Email": email,
          "Phone_number": '0888888888',
          "password": password,
        },
      ).then((value) {
        print(value.body);
      });

      var jsonData = jsonDecode(response.body);
      var token = jsonData["Token"];
      return token;
    } catch (error) {
      throw (error);
    }
  }
}
