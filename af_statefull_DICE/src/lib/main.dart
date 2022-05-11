import 'package:flutter/material.dart';
import 'dart:math';

//Flutter 101: Statefull Widgets
//https://www.youtube.com/watch?v=AqCMFXEmf3w

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

//The inheritance of this StatefulWidget is immutable.
//Unlike a stateless widget it does allow for the call to the
//createState method which instantiates a class that inherits from the
//State<> widget which is the mutable part.
class Dice extends StatefulWidget {
  final int myInt = 2;
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  //Here we can declare mutable class instance fields that can
  //be changed. With a stateless widget we could
  //only declare changeable fields (not marked final or const)
  //inside of the build method and then their scope would only be
  //inside of the build method.
  //These class instance fields are available only to any method
  //inside this class if they are private as here. The _ means that they are private.
  //They would be accessible outside of this class if they were public with
  //no _ as the first letter of name.
  int _leftDiceNumber = 1;
  int _rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                //When a field changes it is marked DIRTY.
                _leftDiceNumber = Random().nextInt(6) + 1;
                var returnValue = reactToButtonPress2(_leftDiceNumber);
                print('ReturnValue = $returnValue');
                //We can only use the setState method if the parent class
                //is inherited from a STATE<> widget.
                //setState takes as a parm an anonymous function.
                setState(() {
                  //You can run statements inside this anonymous
                  //function as we have seen before, but in this case we have not.
                  //At the end of the setState anonymous function
                  //setState automatically triggers the nearest build method
                  //to rerun which in turn updates or rerenders the screen
                  //to reflect changes from any field labeled DIRTY.
                });
              },
              child: Image.asset('assets/images/dice$_leftDiceNumber.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                print('Right button got pressed');
                print('rightDiceNumber = $_rightDiceNumber');
                changeBothDiceFace();
              },
              child: Image.asset('assets/images/dice$_rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  bool reactToButtonPress2(int dice) {
    print('Left button got pressed');
    print('leftDiceNumber = $dice');
    return true;
  }

  void changeBothDiceFace() {
    //_leftDiceNumber = Random().nextInt(6) + 1;
    //_rightDiceNumber = Random().nextInt(6) + 1;
    setState(() {
      //Here we are changing the class fields inside
      //of the setState anonymous function.
      //We could have done this outside of setState but
      //inside the method before the call to setState as we have seen before.
      _leftDiceNumber = Random().nextInt(6) + 1;
      _rightDiceNumber = Random().nextInt(6) + 1;
      print('rightDiceNumber = $_rightDiceNumber');
    });
  }
}
