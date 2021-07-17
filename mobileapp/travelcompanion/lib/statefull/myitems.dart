import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Items {
  var items;
  Items({this.items});
}

class MyBag extends StatefulWidget {
  final apikeys;
  final email;
  const MyBag({Key? key, required this.apikeys, required this.email})
      : super(key: key);

  @override
  _MyBagState createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  var apikeys;
  var email;
  var newitemname = TextEditingController();

  @override
  void initState() {
    setState(() {
      apikeys = widget.apikeys;
      email = widget.email;
    });
  }

  Future<List<Items>> itemsfetch() async {
    List<Items> itemlist = [];
    var uri = "http://192.168.1.10:5000/api/trip/items/fetch?key=" +
        apikeys +
        "&email=" +
        email;
    final resp = await http.get(Uri.parse(uri));
    print(resp.body);
    var respData = json.decode(resp.body);
    print("Resp data in json is: - ");
    print(respData);
    print("resp1 len");
    print(respData['items']);
    // print(int.tryParse(respData['cost']));
    for (var i = 0; i < respData['items'].length; i++) {
      Items temp1 = new Items(items: respData['items'][i]);
      itemlist.add(temp1);
    }
    return itemlist;
  }

  Future<http.Response> itemsdelete(var itemname) async {
    var uri = "http://192.168.1.10:5000/api/trip/items/delete?key=" +
        apikeys +
        "&email=" +
        email +
        "&item=" +
        itemname;
    print(uri);
    var deleteresponse = await http.get(Uri.parse(uri));
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

  Future<http.Response> itemsadd() async {
    var uri = "http://192.168.1.10:5000/api/trip/items/add?key=" +
        apikeys +
        "&email=" +
        email +
        "&item=" +
        newitemname.text;
    print(uri);
    var insertresponse = await http.get(Uri.parse(uri));
    print(insertresponse.body);
    if (insertresponse.body == "1") {
      setState(() {
        newitemname.clear();
      });
    } else {
      AlertDialog(
        content: Text('Unsuccessful request'),
      );
    }
    return insertresponse;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('Add an Item'),
                      TextField(
                        decoration: (InputDecoration(hintText: "Item Name")),
                        controller: newitemname,
                      ),
                      TextButton(
                          onPressed: () {
                            itemsadd();
                          },
                          child: Text('Add Item')),
                    ],
                  ),
                ),
              ),
            );
          },
          label: Text('Add an Item'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.green.shade100,
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
                  itemBuilder: (ctx, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(snapshot.data[index].items)),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              itemsdelete(snapshot.data[index].items);
                            },
                            icon: Icon(Icons.done),
                            color: Colors.red,
                          ),
                        ),
                      ]),
                  // contentPadding: EdgeInsets.only(bottom: 10),
                );
              }
            },
            future: itemsfetch(),
          ),
        ),
      ],
    );
  }
}
