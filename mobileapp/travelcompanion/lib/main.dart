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
      debugShowCheckedModeBanner: false,
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
          centerTitle: true,
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
    return Container(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Text(
                  'This is the ',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  'TRAVEL COMPANION',
                  style: TextStyle(
                      fontSize: 40, color: Colors.deepPurpleAccent.shade200),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(''),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(25)),
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
            ],
          ),
        ),
      ),
    );
  }
}
