import 'package:cozy_mart_0/Components/defButton.dart';
import 'package:cozy_mart_0/Screens/edit_profile.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.deepPurple,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditProfile();
                }));
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // imageeeeeeeeeeee
            const SizedBox(height: 250),
            Text(
              '-Name',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Montserrat'),
            ),
            const SizedBox(height: 10),
            Text(
              user.name,
              style: TextStyle(fontSize: 20, height: 1.4),
            ),
            const SizedBox(height: 30),
            Text(
              '-Email',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Montserrat'),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: TextStyle(fontSize: 20, height: 1.4),
            ),

            const SizedBox(height: 30),
            Text(
              '-Phone Number',
              style: TextStyle(fontSize: 20.0, fontFamily: 'Montserrat'),
            ),
            const SizedBox(height: 10),
            Text(
              user.number,
              style: TextStyle(fontSize: 20, height: 1.4),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          elevation: 1,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditProfile();
            }));
          }),
    );
  }
}

class User {
  final String name;
  final String email;
  final String number;

  const User({
    required this.name,
    required this.email,
    required this.number,
  });
}

class UserPreferences {
  static const myUser = User(
    name: 'maya nakdali',
    email: 'mayanakdali@gmail.com',
    number: '0956466708',
  );
}
