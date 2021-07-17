import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Expense {
  var item;
  var price;
  Expense({this.item, this.price});
}

class MyBill extends StatefulWidget {
  final email;
  final apikey;
  const MyBill({Key? key, required this.email, required this.apikey})
      : super(key: key);

  @override
  _MyBillState createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  var apikey;
  var email;
  void initState() {
    setState(() {
      apikey = widget.apikey;
      email = widget.email;
    });
  }

  var listlen = 0;

  Future<List<Expense>> expensefetch() async {
    List<Expense> expenses = [];
    var uri = "http://192.168.1.10:5000/api/trip/expenses/fetch?key=" +
        apikey +
        "&email=" +
        email;
    final resp = await http.get(Uri.parse(uri));
    print(resp.body);
    var respData = json.decode(resp.body);
    print("Resp data in json is: - ");
    print(respData);
    print("resp1 len");
    print(respData['cost']);
    Expense exp1 =
        new Expense(item: respData['items'], price: respData['cost']);
    // expenses.add(exp);
    print(exp1.price);
    for (var i = 0; i < respData['cost'].length; i++) {
      Expense temp1 =
          new Expense(item: respData['items'][i], price: respData['cost'][i]);
      expenses.add(temp1);
    }
    return expenses;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // ButtonBar(
      //   // alignment: MainAxisAlignment.start,
      //   TextButton.icon(onPressed: onPressed, icon: icon, label: label)
      // ),
      SizedBox(
        height: 200,
        child: FutureBuilder(
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.hasData != true) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              // return Card(child: Text('data found'));
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(snapshot.data[index].item),
                  subtitle: new InkWell(
                    child: Text('Click here'),
                    // onTap: () => launch(snapshot.data[index].link),
                  ),
                ),
                // contentPadding: EdgeInsets.only(bottom: 10),
              );
              // );
            }
          },
          future: expensefetch(),
        ),
        // ),
      ),
    ]);
  }
}
