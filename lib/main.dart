import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: Scaffold(
      appBar: AppBar(
        title: Text("My first app appBar"),
      ),
      body: Container(
        child: Center(
          child: Text("Hello app"),
        ),
      ),
    ),
  ));
}
