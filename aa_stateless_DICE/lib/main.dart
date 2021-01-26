import 'package:flutter/material.dart';

//Dart is a Statically Typed Language
//int myInt = 123;
//string myString = 'Hello'; notice single quotes in dart
//double myDouble = 12.3;
//bool myBool = true;
//These all produce static types with initialization
//int myInt2;
//This produces a static int type even with no init.
//A variable can be made dynaically typed with the keyword dynamic
//dynamic myDynamic;
//myDynamic = 123;
//myDynamic = 'Hello';
//var myDynamic2;
//This produces a dynamic type as no initiaizaiton has occured.
//This would not be possible in C#.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Statefull Widgets"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatelessWidget {
  //We cannot put fields here (unless we mark them final)
  //because a stateless widget is imutable (can't change)
  //int myLeftDiceNumber = 1;

  void reactToButtonPress() {
    print('Our left button was pressed');
  }

  @override
  Widget build(BuildContext context) {
    //We can put local variables inside the build method but
    //their scope is only inside the method.
    //If we change these numbers and hotreload the images will update
    int leftDiceNumber = 2;
    var rightDiceNumber = 4;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              //This will not work as it is trying to call and run
              //the named method when flutter is building the UI.
              //onPressed: reactToButtonPress(),

              //This will work as it is a pointer to the named method.
              //This method has to return void and cannot take args.
              // onPressed: reactToButtonPress,

              //The structure below is the signature
              //for a voidcallback also called in some
              //languages an anonymous function (no name).
              //A function with no name and in this case no parms.
              //When flutter builds the UI it does not run
              //the function but attaches the pointer
              //to the function to the onPressed property.
              //The code inside the anonymous function is run
              //only when the onPressed event is triggered.
              onPressed: () {
                print('Left button got pressed');
                print('leftDiceNumber = $leftDiceNumber');
              },

              //string interpolation with $
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                print('Right button got pressed');
                print('rightDiceNumber = $rightDiceNumber');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
