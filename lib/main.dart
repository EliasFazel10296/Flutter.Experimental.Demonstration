import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(

      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.pinkAccent,
        statusBarColor: Colors.pinkAccent,
      )
  );

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
        scaffoldBackgroundColor: Colors.black,

        visualDensity: VisualDensity.adaptivePlatformDensity,

        appBarTheme: AppBarTheme(
          color: Colors.pinkAccent,
          brightness: Brightness.dark,
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

    final wordPair = WordPair.random();

    RandomWords randomWordsView = RandomWords();

    Scaffold scaffold = Scaffold(

      body: Builder(builder: (context) =>

          Column(//Vertical View

            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[

              Text(
                '${valueCounter}',
                style: TextStyle(
                  color: Colors.white,
                  height: 2,
                  fontSize: 30,
                ),
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[

                  MaterialButton(

                    onPressed: () {

                      //randomWordsView.initialText = "XYZ";

                      Scaffold.of(context).showSnackBar(

                        SnackBar(

                          content: Text('${WordPair.random().asPascalCase}'),

                        ),

                      );
                    },

                    color: Colors.blue,
                    splashColor: Colors.purple,

                    child: Text("Show An English Word"),

                  )

                ],

              ),

              Padding(

                padding: EdgeInsets.all(13),

                child: randomWordsView,

              ),

            ],

          ),

      ),

      floatingActionButton: FloatingActionButton(

        onPressed: calculateCounter,

        tooltip: 'Increment',

        child: Icon(Icons.add),

      ),

    );

    return Padding(

      padding: EdgeInsets.all(13),

      child: scaffold,

    );
  }

}

/* Custom Stateful Widget */
class RandomWords extends StatefulWidget {

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  Text aTextView;

  Text createTextView(String initialText) {

    return Text(
      initialText,

      style: TextStyle(
        color: Colors.lightGreenAccent,
      ),
    );

  }

  Text returnTextView() {

    return this.aTextView;
  }

  @override
  Widget build(BuildContext context) {

    final wordPair = WordPair.random();

    this.aTextView = createTextView(wordPair.asPascalCase);

    return this.aTextView;
  }
}