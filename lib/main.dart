import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent,
    statusBarColor: Colors.pinkAccent,
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

    final wordPair = WordPair.random();

    Scaffold scaffold = Scaffold(

      appBar: AppBar(

        title: Text(widget.appTitle/*Value from Home Widget*/),

      ),

      body: Builder(builder: (context) =>
          Center(//Align All Child UI Element To Center

            child: Column(//Vertical View

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                Text(
                  '${wordPair.asPascalCase}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

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

                      onPressed: calculateCounter,

                      enableFeedback: true,

                      color: Colors.blue,
                      splashColor: Colors.purple,

                      child: Text("Increase Counter"),

                    ),

                    MaterialButton(

                      onPressed: () {
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

                )

              ],

            ),

          ),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: calculateCounter,

        tooltip: 'Increment',

        child: Icon(Icons.add),

      ),

    );

    return scaffold;
  }

}
