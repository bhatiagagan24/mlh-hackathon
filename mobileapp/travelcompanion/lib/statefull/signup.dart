import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'loginform.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var email = TextEditingController();
  var password = TextEditingController();

  Future<http.Response> signupapirequest() async {
    // auth?email=temp1@gmail.com&password=temp1
    var url = 'http://192.168.1.10:5000/signup?email=' +
        email.text +
        "&" +
        "password=" +
        password.text;
    print(url);
    var res = await http.get(Uri.parse(url));
    print(res.body);
    if (res.body == '1') {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginForm()));
      });
    } else {
      setState(() {
        AlertDialog(
          title: Text('Login Unsuccessful, Please try again'),
        );
      });
    }
    return res;
  }

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
            TextButton(
                onPressed: () {
                  signupapirequest();
                },
                child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
