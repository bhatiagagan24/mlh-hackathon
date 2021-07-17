import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final email = TextEditingController();
  final password = TextEditingController();

  void debugdetails() {
    print(email.text);
    print(password.text);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Login With your Email'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Your Email"),
              controller: email,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Your Password"),
              obscureText: true,
              controller: password,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      debugdetails();
                      // redirect to MainUserHome() if login successful else alert box and back to home page
                    },
                    child: Text('Login')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
