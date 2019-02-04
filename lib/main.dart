import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ItemsView.dart';
import 'item.dart';


void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {
  List<Item> items = List();
  final http.Client client;
  HomePageState({this.client});
  bool hasLoaded = true;
 
  Future<List<Item>>  getItems() async {
    String url="https://www.europeana.eu/api/v2/search.json?&wskey=qkWZLDp2Y&query=picasso";
    
    final response = await http.get(url);
    if (response.statusCode == 200){
          var res = json.decode(response.body);
          List items = res["items"];
          return items.map((item)=> Item.fromJson(item)).toList();
    }
    else {
      throw Exception('Failed to load items');
      }
    
  }

  void addItem(item) {
      setState(() {
        items.add(Item.fromJson(item));
      });
      print('${items.map((m) => m.title)}');
    }

  void resetItems() {
    setState(() => items.clear());
    }

  void onError(dynamic d) {
    setState(() {
      hasLoaded = true;
    });
  }


  @override
  void initState() {
    super.initState();
    this.getItems();
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Advanced',
      theme: ThemeData(primarySwatch: Colors.teal),
        home: Scaffold(
        appBar: AppBar(
          title: new Text("Listviews"),
          ),
        
          body: Center (
            child: FutureBuilder<List<Item>> (
              future: getItems(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                List<Item> items = snapshot.data;
                return new ListView(children: items.map((item) => Text('Title: '+item.title[0])).toList(),);
        }
              }
          ),
          
      )
      )
    );
    }
}






