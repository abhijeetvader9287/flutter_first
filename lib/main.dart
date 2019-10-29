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

import 'package:flutter_app/gridview.dart';
import 'package:english_words/english_words.dart';

import 'package:shared_preferences/shared_preferences.dart';


/*
void main() {
  runApp(MaterialApp(
    // Disable the debug flag
      debugShowCheckedModeBanner: false,
      // Home
      home: MySharedPreferenceHome ()));
}

class MySharedPreferenceHome extends StatefulWidget {
  @override
  MySharedPreferenceHomeState createState() {
    return MySharedPreferenceHomeState();
  }
}

class MySharedPreferenceHomeState extends State<MySharedPreferenceHome> {
  var nameOfApp = "Persist Key Value";

  var counter = 0;

  // define a key to use later
  var key = "counter";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0);
    });
  }

  _onIncrementHit() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0) + 1;
    });

    // Save Value
    prefs.setInt(key, counter);
  }

  _onDecrementHit() async {
    // Get shared preference instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      // Get value
      counter = (prefs.getInt(key) ?? 0) - 1;
    });

    // Save Value
    prefs.setInt(key, counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text(nameOfApp),
      ),
      // Body
      body: Container(
        // Center the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$counter',
                textScaleFactor: 10.0,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                  onPressed: _onIncrementHit,
                  child: Text('Increment Counter')),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                  onPressed: _onDecrementHit,
                  child: Text('Decrement Counter')),
            ],
          ),
        ),
      ),
    );
  }
}*/





/*
// infinite List
void main() => runApp(MyInfiniteListApp());

class MyInfiniteListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite List',
      theme: ThemeData(
          primaryColor: Colors.blue, accentColor: Colors.lightBlue),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved lists'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // The itemBuilder callback is called once per suggested word pairing,
        // and places each suggestion into a ListTile row.
        // For even rows, the function adds a ListTile row for the word pairing.
        // For odd rows, the function adds a Divider widget to visually
        // separate the entries. Note that the divider may be difficult
        // to see on smaller devices.
        itemBuilder: (context, i) {
          // Add a one-pixel-high divider widget before each row in theListView.
          if (i.isOdd) return Divider();

          // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView,
          // minus the divider widgets.
          final index = i ~/ 2;
          // If you've reached the end of the available word pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}*/






// image from network
/*void main() => runApp(MyImageFromNetwordApp());*/

class MyImageFromNetworkApp extends StatelessWidget {
  static const String routeName = "/MyImageFromNetworkApp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image from Network"),
        ),
        body: Container(
            child: Column(
              children: <Widget>[
                // Load image from network
                Image.network(
                    'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
                // even loads gifs
                // Gif image from Giphy, all copyrights are owned by Giphy
                Image.network(
                    'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/loop_anim.gif'),
              ],
            )),
      ),
    );
  }
}
/*
// Dropdown list demo
void main() => runApp(MyDropdownListApp());

class MyDropdownListApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyDropdownListAppState();
  }
}

class MyDropdownListAppState extends State<MyDropdownListApp> {
  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example"),
        ),
        body: Container(
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Please choose a fruit: "),
                  DropdownButton(
                    value: _selectedFruit,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  )
                ],
              )),
        ),
      ),
    );
  }
}

*/




/*
//Gridview
void main() => runApp(MyGridViewApp());

class MyGridViewApp extends StatelessWidget {
  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("GridView Demo"),
        ),
        body: myGridView.build(),
      ),
    );
  }
}*/
class MyGridViewApp extends StatelessWidget {

  static const String routeName = "/MyGridViewApp";
  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("GridView Demo"),
        ),
        body: myGridView.build(),
      ),
    );
  }
}
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


/*
//snackbar demo
void main() {
  runApp(MaterialApp(home: SnackbarDemoApp(), debugShowCheckedModeBanner: false,));
}
*/

class SnackbarDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using SnackBar demo"),
      ),
      body: Center(
        child: SnackbarDemoAppButton(),
      ),
    );
  }
}

class SnackbarDemoAppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Show SnackBar'),
      // On pressing the raised button
      onPressed: () {
        // show snackbar
        Scaffold.of(context).showSnackBar(SnackBar(
          // set content of snackbar
          content: Text("Hello! I am SnackBar :)"),
          // set duration
          duration: Duration(seconds: 3),
          // set the action
          action: SnackBarAction(
              label: "Hit Me (Action)",
              onPressed: () {
                // When action button is pressed, show another snackbar
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Hello! I am shown becoz you pressed Action :)"),
                ));
              }),
        ));
      },
    );
  }
}


/*

//list view demo

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: Scaffold(
      appBar: AppBar(
        title: Text("POC  Listview"),
      ),
      body: ContactPage(),
    ),
  ));
} */



//Navigation drawer
void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => AccountScreen(),
      MyGridViewApp.routeName: (BuildContext context) => MyGridViewApp(),
      MyLoadLocalJsonApp.routeName: (BuildContext context) => MyLoadLocalJsonApp(),
      ContactPage.routeName: (BuildContext context) => ContactPage(),
      MyGradientDemo.routeName: (BuildContext context) => MyGradientDemo(),
      MyGetHttpData.routeName: (BuildContext context) => MyGetHttpData(),
    },

    theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.greenAccent,
        backgroundColor: Colors.orange),
  ));
}



class MyGradientDemo extends StatefulWidget
{

  static const String routeName = "/MyGradientDemo";
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
  static const String routeName = "/MyLoadLocalJsonApp";

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

  static const String routeName = "/MyGetHttpData";
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

  static const String routeName = "/MyLocalImageApp";
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
