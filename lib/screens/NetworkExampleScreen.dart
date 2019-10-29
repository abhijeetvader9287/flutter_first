import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkExampleScreen extends StatefulWidget {
  static const String routeName = "/NetworkExampleScreen";

  @override
  _NetworkExampleScreenState createState() => _NetworkExampleScreenState();
}

class _NetworkExampleScreenState extends State<NetworkExampleScreen> {
  final String url = "https://jsonplaceholder.typicode.com/photos/1";

  Future<Item> getItem() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);
    return Item.fromJson(responseJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Network Example")),
      body: Center(
        child: new Container(
          child: FutureBuilder<Item>(
            future: getItem(),
            builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
                  SizedBox(height: 16.0),
                  Text("Flutter logo"),
                ],
              )
                  : InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("ERROR OCCURRED, Tap to retry !"),
                  ),
                  onTap: () => setState(() {}))
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  final String title, image;

  Item(this.title, this.image);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['title'], json['thumbnailUrl']);
  }
}