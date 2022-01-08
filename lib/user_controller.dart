import 'dart:convert';
import 'package:cozy_mart_0/Screens/signup_page.dart';
import 'package:cozy_mart_0/main.dart';
import 'package:cozy_mart_0/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserHttpService {
  Future<dynamic> loginUser(
      {required String email, required String password}) async {
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
      print('======================' + jsonData);
      var token = jsonData["Token"];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      return token;
    } catch (e) {
      //throw (error.toString());
      print(e);
    }
  }

  Future<dynamic> SignupUser(
      {required String email,
      required String password,
      required String userName,
      required String number}) async {
    final url = Uri.parse('http://192.168.1.110:8000/api/user');
    try {
      final response = await http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          "User_name": userName,
          "Email": email,
          "Phone_number": number,
          "password": password,
        }),
      )
          .then((value) {
        print(value.body);
      });

      var jsonData = jsonDecode(response.body);
      //var token = response.body["Token"];
      var token = jsonData["Token"];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', token);
      return token;
    } catch (e) {
      print(e.toString());
      //throw (error);
    }
  }

  Future<dynamic> logoutUser(String token) async {
    final url = Uri.parse('http://192.168.1.110:8000/api/user');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      var jsonData = jsonDecode(response.body);
      return jsonData;
    } catch (error) {
      print(error.toString());
      //throw (error);
    }
  }
}
