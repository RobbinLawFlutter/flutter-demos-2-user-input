import 'package:flutter/material.dart';
import 'dart:math';

//Dart is a Statically Typed Language but can also be Dynamically Typed .
//int myInt = 123;
//string myString = 'Hello'; notice single quotes in dart
//double myDouble = 12.3;
//bool myBool = true;
//These all produce static types with initialization
//int myInt2;
//This produces a static int type even with no init.
//A variable can be made dynamically typed with the keyword dynamic
//dynamic myDynamic;
//myDynamic = 123;
//myDynamic = 'Hello';
//var myDynamic2;
//This produces a dynamic type as no initialization has occurred.
//This would not be possible in C#.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Stateless Widgets"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Dice(),
      ),
    );
  }
}

//With a StatelessWidget we do not have a mechanism to
//update the UI after the one initial build, unless we hot
//restart the program with new variable values.
class Dice extends StatelessWidget {
  //We cannot put class instance fields here (unless we mark them final)
  //because a stateless widget is immutable (can't change).
  //int myInt1 = 1;
  //If we do mark a class instance field as final it must be initialized.
  //final int myInt2;
  final int myInt3 = 1;

  //We also cannot mark a class field as const unless
  //we also mark it as static and then it will become
  //a field that all objects instantiated from this class
  //will share and not get their own copy of it.
  //const int myInt4 = 2;
  //The key word static must go in front of the key word const.
  static const int myInt5 = 2;

  @override
  Widget build(BuildContext context) {
    //We can put local variables inside the build method but
    //their scope is only inside the method.
    //If we change these numbers and hot restart the images on the phone will update.
    //We can hot restart by pressing ctrl+s
    //It will NOT work if we hot reload.
    int leftDiceNumber = 3;
    var rightDiceNumber = 4;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              //This will not work as expected because flutter will call and run
              //the named method as it is building the UI.
              //The result is that the method will only happen
              //once when the build is called at program restart.
              //Pressing the TextButton will NOT cause the method
              //to run.
              onPressed: reactToButtonPress1(),

              //This will work as expected because it is a pointer
              //to the named method.
              //This method must return type dynamic (nothing) and cannot take args.
              //onPressed: reactToButtonPress1,

              //The structure below is the signature
              //for a void-callback also called in some
              //languages an anonymous function (no name).
              //A function with no name and in this case no parms.
              //It is the only way to call a function that may
              //return something and that has parms.
              //When flutter builds the UI it does not run
              //the anonymous function but attaches the pointer
              //to the function to the onPressed property.
              //The code inside the anonymous function is run
              //only when the onPressed event is triggered.

              // onPressed: () {
              //   //Random number between 0 and 5 then add 1
              //   leftDiceNumber = Random().nextInt(6) + 1;
              //   var returnValue = reactToButtonPress2(leftDiceNumber);
              //   print('ReturnValue = $returnValue');
              // },

              //string interpolation with $
              child: Image.asset('assets/images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                print('Right button got pressed');
                print('rightDiceNumber = $rightDiceNumber');
              },
              child: Image.asset('assets/images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  dynamic reactToButtonPress1() {
    print('Our left button was pressed');
  }

  bool reactToButtonPress2(int dice) {
    print('Left button got pressed');
    print('leftDiceNumber = $dice');
    return true;
  }
}
