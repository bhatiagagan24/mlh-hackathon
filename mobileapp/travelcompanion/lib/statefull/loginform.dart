import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'myhome.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final email = TextEditingController();
  final password = TextEditingController();
  var apikey = "no";

  void debugdetails() {
    print(email.text);
    print(password.text);
  }

  Future<http.Response> checkingcredentials() async {
    // auth?email=temp1@gmail.com&password=temp1
    var url = 'http://192.168.1.10:5000/auth?email=' +
        email.text +
        "&" +
        "password=" +
        password.text;
    print(url);
    var res = await http.get(Uri.parse(url));
    print(res.body);
    setState(() {
      apikey = res.body;
      if (res.body != "-1") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MainUserHome(apikey: apikey, email: email.text)));
      }
    });

    return res;
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
                      checkingcredentials();
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
