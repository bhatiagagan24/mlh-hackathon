import 'package:flutter/material.dart';
// import 'myhome.dart';
import 'totalexpenditures.dart';
import 'myitems.dart';

class MyData extends StatefulWidget {
  final email;
  final apikey;
  const MyData({Key? key, this.apikey, this.email}) : super(key: key);

  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  var state = true;
  Widget abcd = Text('Select Expense data or Items Packed');
  // Function dispdata = MyBill();
  void displayData(val) {
    setState(() {
      print(widget.apikey);
      if (val == 'items') {
        state = false;
        abcd = MyBill(apikey: widget.apikey, email: widget.email);
      } else {
        state = true;
        abcd = MyBag();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('user data will appear here'),
            Center(
              child: Container(
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        displayData('expenses');
                      },
                      child: Text('Items Packed'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber.shade300),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        displayData('items');
                      },
                      child: Text('My Expenses'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber.shade300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            abcd,
          ],
        ),
      ),
    );
  }
}
