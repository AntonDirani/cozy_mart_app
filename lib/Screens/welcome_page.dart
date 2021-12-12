import 'package:cozy_mart_0/Componnets/defButton.dart';
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
                    height: 50.0,
                  ),
                  const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 55.0,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  defButton(
                      buttonText: 'Log In', buttonDestination: LoginPage()),
                  const SizedBox(
                    height: 25.0,
                  ),
                  defButton(
                    buttonText: 'Sign Up',
                    buttonDestination: SignupPage(),
                  ),
                  // const SizedBox(
                  //  height: 30.0,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
