import 'package:flutter/material.dart';

import 'item.dart';
import 'itemView.dart';
import 'const.dart';


import 'package:http/http.dart' as http;

import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  List<Item> items = List();
  String url = 'https://www.europeana.eu/api/v2/search.json?&wskey=qkWZLDp2Y&theme=nature&f%5BREUSABILITY%5D%5B%5D=open&query=bird&view=grid';
  bool hasLoaded = true;

  @override
  void initState() {
    super.initState();
    searchItems(url);
    
  }

  void searchItems(url) async {
    
    var response = await http.get(url);
    Map data  = json.decode(response.body);
    List itemsList = data["items"] as List;
    items =  itemsList.map<Item>((item) => Item.fromJson(item)).toList();
    
  
  }

  void onError(dynamic d) {
    setState(() {
      hasLoaded = true;
    });
  }

  void addMovie(item) {
    setState(() {
      items.add(Item.fromJson(item));
    });
    print('${items.map((m) => m.title)}');
  }

  void resetMovies() {
    setState(() => items.clear());
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          TextField(
           // onChanged: (String string) => (subject.add(string)),
            keyboardType: TextInputType.url,
          ),
          hasLoaded ? Container() : CircularProgressIndicator(),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return new ItemView(items[index]);
            },
          ))
        ],
      ),
    );
  }
}