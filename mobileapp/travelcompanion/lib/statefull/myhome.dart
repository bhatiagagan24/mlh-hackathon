import 'package:flutter/material.dart';
import 'mydata.dart';

class MainUserHome extends StatelessWidget {
  final apikey;
  final email;
  const MainUserHome({Key? key, this.apikey, this.email}) : super(key: key);

  void printapikey() {
    print(apikey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Travel Companion'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Hey, Welcome ${this.email.toString()}'),
            ),
            ElevatedButton(
                onPressed: () {
                  printapikey();
                },
                child: Text('Print Api Key')),
            MyData(apikey: this.apikey, email: this.email),
          ],
        ),
      ),
    );
  }
}
