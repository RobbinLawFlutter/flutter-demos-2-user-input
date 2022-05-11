//This app as well as the next shows why
//it is good to modularize, abstract, and
//encapsulate code.
//The four pillars of OOP:
//Abstraction by using classes and instantiating
//objects from the class template.
//Encapsulation "_" make members private and therefore only
//accessable to the members of the class.
//Inheritance "extends" the base class template.
//Polymorphism "@override" changes methods of the base class.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: buildShrineTheme(),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyFirstPage(),
          ),
        ),
      ),
    );
  }
}

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  List<Icon> scoreKeeper = [];

  List<String> questions = [
    'the earth is flat',
    'the earth is round',
    'this is fun'
  ];

  List<bool> answers = [false, true, true];

  int questionNumber = 0;
  int loopNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              //textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              }, // onPressed
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.amber,
              child: Text(
                'Start Over',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                startOver();
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (loopNumber < questions.length) {
        bool correctAnswer = answers[questionNumber];
        if (userAnswer == correctAnswer) {
          print('got it right');
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          print('got it wrong');
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        if (questionNumber < questions.length - 1) {
          questionNumber++;
        }
        loopNumber++;
        print('questionnumber is $questionNumber');
        print('loopnumber is $loopNumber');
      }
    });
  }

  void startOver() {
    setState(() {
      questionNumber = 0;
      loopNumber = 0;
      print('questionnumber is $questionNumber');
      print('loopnumber is $loopNumber');
      scoreKeeper = [];
    });
  }
}
