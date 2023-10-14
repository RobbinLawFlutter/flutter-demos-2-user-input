// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/constants.dart';

// This MySecondPage demonstrates the use
// of a "custom widget" to reuse code.
// It displays the same as the MyFirstPage.
// It also shows the diff between const vs final.

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
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCardSimple(
              myColor: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCardSimple(
                    myColor: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

// This is a custom widget made from other widgets
// but customized for our needs.
class ReuseableCardSimple extends StatelessWidget {
  // constructor that requires a Color parameter,
  // and optionally a reusableCardChild widget
  const ReuseableCardSimple({required this.myColor, this.reusableCardChild});

  // final makes this property called myColor
  // of type Color immutable, cannot change once set.
  // const is a compile time constant
  // final is a run time constant but both can only
  // be set ONCE.
  // Here we cannot use a const because myColor
  // can be set at run time but only once.
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
