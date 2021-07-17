import 'package:flutter/material.dart';

class MyBill extends StatefulWidget {
  const MyBill({Key? key}) : super(key: key);

  @override
  _MyBillState createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('My total journey bill here'),
    );
  }
}
