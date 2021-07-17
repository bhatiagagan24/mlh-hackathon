import 'package:flutter/material.dart';
// import 'myhome.dart';
import 'itemspacked.dart';
import 'totalexpenses.dart';

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  var state = true;
  // Function dispdata = ItemsPacked();
  void displayData(val) {
    setState(() {
      if (val == 'items') {
        state = false;
      } else {
        state = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('user data will appear here'),
          ButtonBar(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  displayData('expenses');
                },
                child: Text('My Expenses'),
              ),
              ElevatedButton(
                onPressed: () {
                  displayData('items');
                },
                child: Text('My Items packed'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
