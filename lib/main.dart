import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My first app",
    home: MyLocalImageApp(),
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
        MyCard(title: Text("First Text- Favourite",
          style: myTextStyle,
        ),
            //setup icon
            icon: Icon(Icons.favorite, size: myIconSize, color: Colors.brown)),
        MyCard(title: Text("Second Text- Alarm",
            style: myTextStyle),
icon:Icon(Icons.alarm,size: myIconSize,color: Colors.lightGreen,) ,
        ),
        MyCard(
          title: Text("Third Text airport",
            style: myTextStyle,),
          icon: Icon(Icons.airport_shuttle,
          size: myIconSize,color: Colors.lime,),

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
          child: SingleChildScrollView(child: column,),
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
            color: Theme
                .of(context)
                .accentColor,
            child: Text(
              'Hello world',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
        ),
      ),
      floatingActionButton: Theme(
        //override theme
        data: Theme.of(context).copyWith(
            colorScheme: Theme
                .of(context)
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


/*************************/
class MyStateFullWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStateFullWidgetState();
  }
}

class MyStateFullWidgetState extends State<MyStateFullWidget>
{
  String texts="click here";
  int counter=0;
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

          )
        ),
      ),
    );
  }


  void onButtonPressed() {
    setState(() {
      counter++;
      texts="you clicked "+counter.toString();
    });
  }
}
/*************************/

/************************************/
class MyEditText extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyEditTextState();
  }

}
class MyEditTextState extends State<MyEditText>{
  String results="";
  final TextEditingController controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Using editText"),
        backgroundColor: Colors.red,
      ),
      body:Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: (InputDecoration(
                  hintText: "Enter text"
                )),
                onSubmitted: (String strText){
                  setState(() {
                    results=results+"\n"+strText;
                    controller.text="";
                  });
                },
                controller: controller,
              ),
              Text(results)
            ],
          ),
        ),

      )
    );
  }

}
/**************************************/


















class MyButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyButtonState();;
  }

}

class MyButtonState extends State<MyButton>
{
  int counter= 0;
  List<String> strings=['aa','ab','ac','ad','ae','af'];
  String displayString="Hello world!";
  void onPressOfButton()
  {
    setState(() {
      displayString=strings[counter];
      counter=counter<4?counter+1:0;
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
              Text(displayString,style: TextStyle(fontSize: 40.0),),
              Padding(padding: EdgeInsets.all(10.0),),
              RaisedButton(
                child: Text("Press me",
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

class MyLocalImageApp extends StatelessWidget{
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
            style: TextStyle(color:Colors.black
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('data_repo/img/bg1.jpg'),
            fit: BoxFit.cover
          )
        ),
      ),



    );
  }

}