import 'package:flutter/material.dart';
import 'package:flutter_app/contact_page.dart';
import 'package:flutter_app/screens/account.dart';
import 'package:flutter_app/screens/settings.dart';
import 'package:flutter_app/main.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Flutter POC",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.grid_on, "GridView Screen", MyGridViewApp.routeName),

      getNavItem(Icons.local_atm, "Load Local Json ", MyLoadLocalJsonApp.routeName),
      getNavItem(Icons.contacts, "Contact List", ContactPage.routeName),
      getNavItem(Icons.http, "Get Http Data", MyGetHttpData.routeName),
      getNavItem(Icons.gradient, "GradientDemo", MyGradientDemo.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter POC"),
      ),
      body: Container(
          child: Center(
        child: Text("Home Screen"),
      )),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
}
