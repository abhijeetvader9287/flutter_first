import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/Tabs/first.dart';
import 'package:flutter_app/Tabs/second.dart';
import 'package:flutter_app/Tabs/third.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/contact_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_app/screens/account.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:flutter_app/screens/settings.dart';

import './utils.dart' as utils;

/*
import 'package:splashscreen/splashscreen.dart';
//splash screen demo
void main(){
  runApp(new MaterialApp(
    home: new MySplashScreenApp(),
  ));
}


class MySplashScreenApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MySplashScreenApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('Welcome In SplashScreen',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Welcome In SplashScreen Package"),
          automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Done!",
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),),

      ),
    );
  }
}*/





void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Using Listview"),
      ),
      body: ContactPage(),
    ),
  ));
}



/*
//Navigation drawer
void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
    },

    theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.greenAccent,
        backgroundColor: Colors.orange),
  ));
}*/



class MyGradientDemo extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyGradientDemoState();
  }

}


class MyGradientDemoState extends State<MyGradientDemo>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Appbar
        appBar: AppBar(
          // Title
          title: Text("Using Gradient"),
        ),
        // Body
        body: Container(
          // Center the content
            child: Center(
              // Add Text
              child: Text(
                "Hello World!",
                style: TextStyle(color: Colors.white),
              ),
            ),
            // Set background
            decoration: BoxDecoration(
              // Add Gradient
                gradient: utils.getCustomGradient())));
  }

}


class MyCustomFontDemo extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomFontState();
  }


}
class MyCustomFontState extends State<MyCustomFontDemo>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Using Custom Fonts"),
      ),
      // Body
      body: Container(
        // Center the content
        child: Center(
          // Add Text
          child: Text("Hi this is custom font, this needs stateful widget and will not work with stateless widget",
              // Center align text
              textAlign: TextAlign.center,
              // set a text style which defines a custom font
              style: utils.getCustomFontTextStyle()),
        ),
      ),
    ) ;
  }

}

class MyBottomNavTabBar extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyBottomNavTabBarState();
  }

}
class MyBottomNavTabBarState extends State<MyBottomNavTabBar> with SingleTickerProviderStateMixin
{
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text("Bottom Navigation Bar Demo"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[First(), Second(), Third()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.adb),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );;
  }

}


class MyTabDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTabDemoState();
  }

}
// SingleTickerProviderStateMixin is used for animation
class MyTabDemoState extends State<MyTabDemo> with SingleTickerProviderStateMixin
{
  
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=TabController(length: 3,vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
    
  }
  TabBar getTabBar()
  {
    return TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.airport_shuttle),
        ),
        Tab(
          icon: Icon(Icons.access_time),
        ),
        Tab(
          icon: Icon(Icons.ac_unit),
        )
      ],
      controller: controller,
    );
  }
  TabBarView getTabBarView(var tabs)
  {
    return TabBarView(
      children: tabs,
      controller: controller,
    );
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabs demo"),
        backgroundColor: Colors.greenAccent,
        bottom: getTabBar()
      ),
      body: getTabBarView(<Widget>[First(), Second(), Third()]),
    );
  }

}






class MyStepperDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStepperDemoState();
  }
}

class MyStepperDemoState extends State<MyStepperDemo> {
  int currentStep = 0;
  List<Step> mySteps = [
    Step(title: Text("Step 1"), content: Text("Content 1"), isActive: true),
    Step(
        title: Text("Step 2"),
        content: Text("Content 2"),
        isActive: true,
        state: StepState.editing),
    Step(
        title: Text("Step 3"),
        content: Text("Content 3"),
        isActive: true,
        state: StepState.error)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper example"),
      ),
      body: Container(
        child: Stepper(
          currentStep: currentStep,
          steps: mySteps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep--;
              } else {
                currentStep = 0;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < mySteps.length - 1) {
                currentStep++;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}

class MyDialogDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDialogDemoState();
  }
}

class MyDialogDemoState extends State<MyDialogDemo> {
  AlertDialog dialog = AlertDialog(
    content: Text(
      "Hello",
      style: TextStyle(fontSize: 15.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert dialog demo"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Press me"),
            onPressed: () {
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double myTextSize = 30.0;
    final double myIconSize = 40.0;
    final TextStyle myTextStyle =
        TextStyle(color: Colors.blue, fontSize: myTextSize);
    var column = Column(
      // makes the cards strech in horizontal axis
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //setup the cards
        MyCard(
            title: Text(
              "First Text- Favourite",
              style: myTextStyle,
            ),
            //setup icon
            icon: Icon(Icons.favorite, size: myIconSize, color: Colors.brown)),
        MyCard(
          title: Text("Second Text- Alarm", style: myTextStyle),
          icon: Icon(
            Icons.alarm,
            size: myIconSize,
            color: Colors.lightGreen,
          ),
        ),
        MyCard(
          title: Text(
            "Third Text airport",
            style: myTextStyle,
          ),
          icon: Icon(
            Icons.airport_shuttle,
            size: myIconSize,
            color: Colors.lime,
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless widget"),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Center(
          child: SingleChildScrollView(
            child: column,
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget icon;
  final Widget title;

  //{} denotes optional values
  MyCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[this.title, this.icon],
          ),
        ),
      ),
    );
  }
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

class MyStateFullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStateFullWidgetState();
  }
}

class MyStateFullWidgetState extends State<MyStateFullWidget> {
  String texts = "click here";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("My stateful widget"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text(texts),
          onPressed: onButtonPressed,
        )),
      ),
    );
  }

  void onButtonPressed() {
    setState(() {
      counter++;
      texts = "you clicked " + counter.toString();
    });
  }
}

class MyEditText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyEditTextState();
  }
}

class MyEditTextState extends State<MyEditText> {
  String results = "";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Using editText"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  decoration: (InputDecoration(hintText: "Enter text")),
                  onSubmitted: (String strText) {
                    setState(() {
                      results = results + "\n" + strText;
                      controller.text = "";
                    });
                  },
                  controller: controller,
                ),
                Text(results)
              ],
            ),
          ),
        ));
  }
}

class MyLoadLocalJsonApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyLoadLocalJsonAppState();
  }
}

class MyLoadLocalJsonAppState extends State<MyLoadLocalJsonApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Load local JSON file"),
        ),
        body: Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('data_repo/starwars_data.json'),
              builder: (context, snapshot) {
                //Decode the JSON
                var new_data = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("Name: " + new_data[index]['name']),
                          Text("Height: " + new_data[index]['height']),
                        ],
                      ),
                    );
                  },
                  itemCount: new_data == null ? 0 : new_data.length,
                );
              },
            ),
          ),
        ));
  }
}

class MyGetHttpData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyGetHttpDataState();
  }
}

class MyGetHttpDataState extends State<MyGetHttpData> {
  final String url = "https://swapi.co/api/people";
  List data;

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['results'];
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve JSON Data via HTTP GET"),
      ),
      // Create a Listview and load the data when available
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                // Stretch the cards in horizontal axis
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      child: Text(
                        // Read the name field value and set it in the Text widget
                        data[index]['name'],
                        // set some style to text
                        style: TextStyle(
                            fontSize: 20.0, color: Colors.lightBlueAccent),
                      ),
                      // added padding
                      padding: const EdgeInsets.all(15.0),
                    ),
                  )
                ],
              )),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}

class MyButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyButtonState();
    ;
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> strings = ['aa', 'ab', 'ac', 'ad', 'ae', 'af'];
  String displayString = "Hello world!";

  void onPressOfButton() {
    setState(() {
      displayString = strings[counter];
      counter = counter < 4 ? counter + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful widget"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                displayString,
                style: TextStyle(fontSize: 40.0),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                child: Text(
                  "Press me",
                  style: TextStyle(color: Colors.lightBlueAccent),
                ),
                color: Colors.red,
                onPressed: onPressOfButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLocalImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Load local image"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hi",
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('data_repo/img/bg1.jpg'), fit: BoxFit.cover)),
      ),
    );
  }
}
