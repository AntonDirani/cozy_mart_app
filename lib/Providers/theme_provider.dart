import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cozy_mart_0/Components/constants.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late Typography defaultTypography;
  late SharedPreferences prefs;

  ThemeData dark = ThemeData(
    // primaryColor: Colors.white,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(elevation: 0),
    primarySwatch: white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
  // .apply(bodyColor: Colors.white, displayColor: Colors.white));

  ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Colors.black, fontFamily: 'Montserrat', fontSize: 20)),
      primarySwatch: Colors.deepPurple,
      hintColor: Colors.deepPurple,
      iconTheme: IconThemeData(color: Colors.deepPurple));

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
