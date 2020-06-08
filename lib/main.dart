import 'dart:ui';

import 'package:FlutterAdvanceDemonstration/keepnote.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.pinkAccent,
    statusBarColor: Colors.pinkAccent,
  ));

  runApp(MainRootWidget());
}

class MainRootWidget extends StatelessWidget {
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

    RandomWords randomWords = RandomWords();

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
            Expanded(
              child: randomWords,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          calculateCounter();

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KeepNoteRootWidget()),
          );
        },
        tooltip: 'Increment',
//        child: Icon(Icons.games),
        child: GestureDetector(
          child: Icon(Icons.games),
          onLongPress: () {
            RandomWordsState.pushSaved(context);
          },
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
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
  final suggestions = <WordPair>[];
  static final Set<WordPair> savedWordPair = Set<WordPair>();

  Text createTextView(String initialText) {
    return Text(
      initialText,
      style: TextStyle(
        fontSize: 19.0,
        color: Colors.blueAccent,
      ),
    );
  }

  Icon createFavoriteIcon(WordPair wordPair) {
    return Icon(
      savedWordPair.contains(wordPair) ? Icons.favorite : Icons.favorite_border,
      color: savedWordPair.contains(wordPair)
          ? Colors.pinkAccent
          : Colors.lightGreenAccent,
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(13, 7, 13, 3),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }

          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair wordPair) {
    return ListTile(
      title: createTextView(wordPair.asPascalCase),
      trailing: createFavoriteIcon(wordPair),
      onTap: () {
        setState(() {
          if (savedWordPair.contains(wordPair)) {
            savedWordPair.remove(wordPair);
          } else {
            savedWordPair.add(wordPair);
          }
        });
      },
    );
  }

  static void pushSaved(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = savedWordPair.map(
            (WordPair wordPair) {
              return ListTile(
                title: Text(
                  wordPair.asPascalCase,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            },
          );

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSuggestions();
  }
}
