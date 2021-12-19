import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/welcome_page.dart';
import 'Providers/theme_provider.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      Provider<ThemeProvider>(create: (_) => ThemeProvider(isDarkTheme)),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
