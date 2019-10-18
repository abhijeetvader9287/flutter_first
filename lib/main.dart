import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: MyStartHome(),
    /* Scaffold(
      appBar: AppBar(
        title: Text("My first app appBar"),
      ),
      body: Container(
        child: Center(
          child: Text("Hello app"),
        ),
      ),
    ),*/
    theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.greenAccent,
        backgroundColor: Colors.orange),
  ));
}

class MyStartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Using theme"),
      ),
      body: Container(
        // set background color
        decoration: BoxDecoration(color: Colors.yellow),
        child: Center(
          child: Container(
            color: Theme.of(context).accentColor,
            child: Text(
              'Hello world',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        //override theme
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(secondary: Colors.lightBlueAccent)),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
