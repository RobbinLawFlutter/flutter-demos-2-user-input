//This MyFifthPage demonstrates the use of both custom widgets
//but now they are both modularized into their own
//my-icon.dart and reusable-card.dart files.
//Also shows the use of enums
//Also functionality with GestureDetector and setSate.

// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/widgets/reusable-card.dart';
import 'package:robbinlaw/widgets/my-icon.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
//const inactiveCardColor = Color(0xFF111328);
const inactiveCardColor = Color(0xff424242);
const bottomContainerColor = Color(0xFFEB1555);

enum DietClass {
  notdeterminedyet,
  omnivore,
  vegetarian,
}

class MyFifthPage extends StatefulWidget {
  @override
  MyFifthPageState createState() => MyFifthPageState();
}

class MyFifthPageState extends State<MyFifthPage> {
  //Gender selectedGender = Gender.notdeterminedyet;
  Color omnivoreCardColor = inactiveCardColor;
  Color vegetarianCardColor = inactiveCardColor;

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //First way using a method to
                        //update the card color.
                        updateColor(DietClass.omnivore);
                      });
                      print('Omnivore card was pressed');
                    },
                    child: ReuseableCard(
                      //First way updating color via
                      //variable that was changed in updateColor method.
                      myColor: omnivoreCardColor,
                      reusableCardChild: MyIcon(
                        icon: FontAwesomeIcons.burger,
                        label: 'OMNIVORE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //First way
                        updateColor(DietClass.vegetarian);
                      });
                      print('Vegetarian card was pressed');
                    },
                    child: ReuseableCard(
                      //First way
                      myColor: vegetarianCardColor,
                      reusableCardChild: MyIcon(
                        icon: FontAwesomeIcons.carrot,
                        label: 'VEGETARIAN',
                      ),
                    ),
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

  void updateColor(DietClass selectedDietClass) {
    if (selectedDietClass == DietClass.omnivore) {
      if (omnivoreCardColor == inactiveCardColor) {
        omnivoreCardColor = activeCardColor;
        vegetarianCardColor = inactiveCardColor;
      }
    }
    if (selectedDietClass == DietClass.vegetarian) {
      if (vegetarianCardColor == inactiveCardColor) {
        vegetarianCardColor = activeCardColor;
        omnivoreCardColor = inactiveCardColor;
      }
    }
  }
}
