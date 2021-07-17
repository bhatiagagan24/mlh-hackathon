import 'package:flutter/material.dart';

class ItemsPacked extends StatefulWidget {
  const ItemsPacked({Key? key}) : super(key: key);

  @override
  _ItemsPackedState createState() => _ItemsPackedState();
}

class _ItemsPackedState extends State<ItemsPacked> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Items I have packed here'));
  }
}
