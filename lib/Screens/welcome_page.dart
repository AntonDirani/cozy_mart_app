import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'package:cozy_mart_0/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
            icon: const Icon(Icons.brightness_6),
            //color: Colors.white,
          )
        ],
      ),
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
                        // color: Colors.black,
                        fontSize: 55.0,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  DefButton(
                      buttonText: 'Log In', buttonDestination: LoginPage()),
                  const SizedBox(
                    height: 25.0,
                  ),
                  DefButton(
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
