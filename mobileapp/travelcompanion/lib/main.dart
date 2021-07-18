import 'package:flutter/material.dart';
import 'package:travelcompanion/statefull/signup.dart';
import './statefull/loginform.dart';
import './statefull/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
      // darkTheme: ,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Travel Companion'),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: HomeMain(),
        ));
  }
}

class HomeMain extends StatelessWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Hey, Welcome to the Travel Companion'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginForm()));
                },
                child: Text('Click here to login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text('Click here to signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
