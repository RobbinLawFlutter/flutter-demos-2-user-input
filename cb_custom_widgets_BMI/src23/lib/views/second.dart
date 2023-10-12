//This MySecondPage demonstrates the use
//of "custom widgets" to reuse code.
//It displays the same as the MyFirstPage.
//It also shows the diff between const vs final.

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class MySecondPage extends StatefulWidget {
  @override
  MySecondPageState createState() => MySecondPageState();
}

class MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dietary Stats & BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReuseableCard(
              myColor: activeCardColor,
            ),
          ),
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

//This is a custom widget made from other widgets
//but customized for our needs.
class ReuseableCard extends StatelessWidget {
  // constructor that requires a Color parameter,
  // and optionally a reusableCardChild widget
  const ReuseableCard({required this.myColor, this.reusableCardChild});

  //final makes this property called myColor
  //of type Color immutable, cannot change once set.
  //const is a compile time constant
  //final is a run time constant but both can only
  //be set ONCE.
  //Here we cannot use a const because myColor
  //can be set at run time but only once.
  //const Color myConstColor;
  final Color myColor;
  final Widget? reusableCardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: reusableCardChild,
    );
  }
}
