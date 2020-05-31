import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent,
    statusBarColor: Colors.pinkAccent, //or set color with: Color(0xFF0000FF)
  ));

  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  // Root Widget
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColorDark: Colors.blue,

        backgroundColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,

        visualDensity: VisualDensity.adaptivePlatformDensity,

        appBarTheme: AppBarTheme(
          color: Colors.pinkAccent,
          brightness: Brightness.light,
        )

      ),

      home: HomePage(appTitle: 'Flutter Demo Home Page'),

    );
  }
}

class HomePage extends StatefulWidget {
  //Home Widget
  //Parent Value Holder
  HomePage({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int valueCounter = 0;

  void calculateCounter() {

    setState(() {
      //Change State With New Value
      valueCounter++;

    });

  }

  @override
  Widget build(BuildContext context) {
    //Update UI Every Time setState Called
    //(For UI Elements That Changed)

    Scaffold scaffold = Scaffold(

      appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.appTitle),

      ),

      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$valueCounter',
              style: Theme.of(context).textTheme.headline4,
            ),

          ],

        ),

      ),

      floatingActionButton: FloatingActionButton(

        onPressed: calculateCounter,

        tooltip: 'Increment',

        child: Icon(Icons.add),

      ), // This trailing comma makes auto-formatting nicer for build methods.

    );

    return scaffold;
  }
}
