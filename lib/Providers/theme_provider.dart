import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cozy_mart_0/constants.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData dark = ThemeData(
      primaryColor: Colors.deepPurple,
      primarySwatch: Colors.deepPurple,
      brightness: Brightness.dark,
      textTheme:
          TextTheme().apply(bodyColor: Colors.pink, displayColor: Colors.pink));

  ThemeData light = ThemeData(
    primaryColor: Colors.black,
    primarySwatch: Colors.deepPurple,
  );

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
