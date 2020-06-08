import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent,
    statusBarColor: Colors.pinkAccent,
  ));

  runApp(KeepNoteRootWidget());
}

class KeepNoteRootWidget extends StatelessWidget {
  // Root Widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  HomePageState createState() {
    return HomePageState();
  }
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
      body: Builder(
        builder: (contextBuilder) => Column(
          //Vertical View

          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            Text(
              '${valueCounter}',
              style: TextStyle(
                color: Colors.indigo,
                height: 2,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateCounter();

        },
        tooltip: 'Increment',
        child: Icon(Icons.games),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
      child: scaffold,
    );
  }
}