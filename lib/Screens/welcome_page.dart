import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  Image.asset(
                    'images/Logo.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // ignore: prefer_const_constructors
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF6C2B95),
                        fixedSize: const Size(300.0, 60.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // ignore: prefer_const_constructors
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupPage();
                      }));
                    },
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF6C2B95),
                        fixedSize: const Size(300.0, 60.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
