import 'dart:convert';

import 'package:cozy_mart_0/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Auth with ChangeNotifier {
  Future<void> _user(String email, String password, String urlSegment) async {
    final url = 'url1/user  ';

    try {
      // final res = await http.post(url, body: json.encoder({}));
    } catch (e) {
      throw e;
    }
  }
}
