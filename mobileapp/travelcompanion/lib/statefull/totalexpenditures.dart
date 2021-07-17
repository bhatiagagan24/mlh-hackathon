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
  var newitem = TextEditingController();
  var newitemcost = TextEditingController();
  var persons = TextEditingController();
  var apikey;
  var email;
  var totalbill = 0;

  void initState() {
    setState(() {
      apikey = widget.apikey;
      email = widget.email;
      totalbill = 0;
    });
  }

  var listlen = 0;

  Future<List<Expense>> expensefetch() async {
    var totalbill1 = 0.0;
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
    // print(int.tryParse(respData['cost']));
    for (var i = 0; i < respData['cost'].length; i++) {
      if (respData['cost'][i] == null) {
        Expense temp1 = new Expense(item: respData['items'][i], price: '0');
        expenses.add(temp1);
      } else {
        Expense temp1 =
            new Expense(item: respData['items'][i], price: respData['cost'][i]);
        expenses.add(temp1);

        totalbill1 += double.tryParse(respData['cost'][i])!;
      }
      // setState(() {
      //   totalbill = respData['cost'].reduce((a, b) => a + b);
      // });
      // setState(() {
      //   totalbill = totalbill1;
      // });
    }
    print(totalbill);
    return expenses;
  }

  Future<http.Response> deletingitem(var itemname, var itemprice) async {
    // auth?email=temp1@gmail.com&password=temp1
    var url = 'http://192.168.1.10:5000//api/trip/expenses/delete?email=' +
        email +
        "&key=" +
        apikey +
        "&item=" +
        itemname +
        "&price=" +
        itemprice;
    print(url);
    var deleteresponse = await http.get(Uri.parse(url));
    print(deleteresponse.body);
    if (deleteresponse.body == "1") {
      setState(() {});
    } else {
      AlertDialog(
        content: Text('Unsuccessful request'),
      );
    }
    return deleteresponse;
  }

  Future<http.Response> additem() async {
    // auth?email=temp1@gmail.com&password=temp1
    var url = 'http://192.168.1.10:5000/api/trip/expenses/add?email=' +
        email +
        "&key=" +
        apikey +
        "&item=" +
        newitem.text +
        "&price=" +
        newitemcost.text;
    print(url);
    var addresponse = await http.get(Uri.parse(url));
    print(addresponse.body);
    if (addresponse.body == "1") {
      setState(() {
        newitem.clear();
        newitemcost.clear();
      });
    } else {
      AlertDialog(
        content: Text('Unsuccessful request'),
      );
    }
    return addresponse;
  }

  Future<http.Response> additemaftersplitting() async {
    // auth?email=temp1@gmail.com&password=temp1
    var bill = newitemcost.text;
    var finalpeople = double.tryParse(persons.text);
    var finalbill = double.tryParse(newitemcost.text);
    if (finalbill != null) {
      if (finalpeople != null) {
        bill = ((finalbill / finalpeople)).toString();
      }
    }
    var url = 'http://192.168.1.10:5000/api/trip/expenses/add?email=' +
        email +
        "&key=" +
        apikey +
        "&item=" +
        newitem.text +
        "&price=" +
        bill;
    print(url);
    var addresponse = await http.get(Uri.parse(url));
    print(addresponse.body);
    if (addresponse.body == "1") {
      setState(() {
        newitem.clear();
        newitemcost.clear();
        persons.clear();
      });
    } else {
      AlertDialog(
        content: Text('Unsuccessful request'),
      );
    }
    return addresponse;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text('Add an Item'),
                          TextField(
                            decoration:
                                (InputDecoration(hintText: "Item Name")),
                            controller: newitem,
                          ),
                          TextField(
                            decoration: (InputDecoration(hintText: "Price")),
                            keyboardType: TextInputType.number,
                            controller: newitemcost,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                additem();
                              },
                              child: Text('Add'))
                        ],
                      ),
                    ),
                  ),
                );
              },
              // },
              icon: Icon(Icons.add),
              label: Text('Add an Expense'),
            ),
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text('Add an Item'),
                          TextField(
                            controller: newitem,
                            decoration: InputDecoration(hintText: "Item name"),
                          ),
                          TextField(
                            controller: newitemcost,
                            decoration: InputDecoration(hintText: "Item price"),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            controller: persons,
                            decoration:
                                InputDecoration(hintText: "No of People"),
                            keyboardType: TextInputType.number,
                          ),
                          OutlinedButton(
                              onPressed: () {
                                additemaftersplitting();
                              },
                              child: Text('Split the bill'))
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.biotech),
              label: Text('Split a Bill'),
            ),
          ],
        ),
        SizedBox(
          // height: 200,
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
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, index) => ListTile(
                    title: Text(snapshot.data[index].item),
                    subtitle: new InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(snapshot.data[index].price),
                          TextButton(
                            onPressed: () {
                              deletingitem(snapshot.data[index].item,
                                  snapshot.data[index].price);
                            },
                            child: Text('Delete'),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.red.shade200),
                            ),
                          ),
                        ],
                      ),
                      // onTap: () => launch(snapshot.data[index].link),
                    ),
                  ),
                  // contentPadding: EdgeInsets.only(bottom: 10),
                );
              }
            },
            future: expensefetch(),
          ),
          // ),
        ),
      ],
    );
  }
}
