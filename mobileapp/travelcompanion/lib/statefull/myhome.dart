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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(
                'Hey, Welcome ${this.email.toString()}',
                style: TextStyle(color: Colors.green.shade200),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       printapikey();
            //     },
            //     child: Text('Print Api Key')),
            MyData(apikey: this.apikey, email: this.email),
          ],
        ),
      ),
    );
  }
}
