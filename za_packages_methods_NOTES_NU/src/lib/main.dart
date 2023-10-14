// This app demonstrates the use of packages
// go to pub.dev/flutter and download
// the "english_words" package
// and the "audioPlayers" package.
// This app also shows some of the sutilties of dart methods.
// The app shows methods with no parameters and that return nothing,
// methods with positional parameters,
// methods with named parameters,
// methods that return something like basic types or objects.
//Also this shows the importance of code REUSE by using methods.

// ignore_for_file: use_key_in_widget_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: buildShrineTheme(),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("Using Packages Widget"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: MyFirstPage(),
      ),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                playSound1();
              },
              child: Text(
                //To see all the nouns view nouns.dart
                //in the dependencies for this project
                nouns[3],
                style: const TextStyle(
                  fontFamily: 'Chilanka-Regular',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                playSound2(4, 'hey man');
              },
              child: Text(
                nouns.last,
                style: const TextStyle(
                  fontFamily: 'Chilanka-Regular',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
            ),
          ),
          makeKey(
            soundToPlay: 3,
            textToShow: 'Click Me 1',
          ),
          makeKey(
              //textToShow: 'Click Me 2',
              //soundToPlay: 4,
              ),
          makeKey(
            textToShow: 'Click Me 3',
            soundToPlay: 5,
          ),
        ],
      ),
    );
  }

  var soundNumber = 1;
  var direction = 1;

  void playSound1() {
    //simplest function that has
    //no input parameters and returns nothing
    final player = AudioCache();
    //player.play('note$soundNumber.wav');
    if (soundNumber >= 1 && soundNumber <= 6 && direction == 1) {
      soundNumber++;
      if (soundNumber == 7) direction = -1;
    } else {
      soundNumber--;
      if (soundNumber == 1) direction = 1;
    }
  }

  void playSound2(int sound, String myString) {
    //medium function that has
    //one positional input parameter and returns nothing
    final player = AudioCache();
    //player.play('note$sound.wav');
    print(myString);
  }

  Expanded makeKey({String textToShow = 'yes man', int soundToPlay = 1}) {
    //most complicated function that has named
    //input parameters {}, and returns
    //an object of type Expanded
    //Note that all named parameters are optional.
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound2(soundToPlay, textToShow);
        },
        child: Text(
          textToShow,
          style: const TextStyle(
            fontFamily: 'Chilanka-Regular',
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
      ),
    );
  }
}
