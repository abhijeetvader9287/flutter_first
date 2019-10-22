import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/Tabs/first.dart';
import 'package:flutter_app/Tabs/second.dart';
import 'package:flutter_app/Tabs/third.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: MyTabDemo(),
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
