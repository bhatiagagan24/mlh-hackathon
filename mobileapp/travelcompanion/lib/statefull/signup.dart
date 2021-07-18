import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign Up'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Your Email"),
              controller: email,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Your Password"),
              controller: password,
              obscureText: true,
            ),
            TextButton(onPressed: () {}, child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
