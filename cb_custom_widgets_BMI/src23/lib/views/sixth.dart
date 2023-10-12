//This MySixthPage demonstrates the
//use of a Ternary Operator instead of the
//updateColor() method.

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

class MySixthPage extends StatefulWidget {
  @override
  MySixthPageState createState() => MySixthPageState();
}

class MySixthPageState extends State<MySixthPage> {
  DietClass selectedDietClass = DietClass.notdeterminedyet;

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
                        //Second way directly selecting gender.
                        selectedDietClass = DietClass.omnivore;
                      });
                      print('Omnivore card was pressed');
                    },
                    child: ReuseableCard(
                      //Second way using terinary operator.
                      myColor: selectedDietClass == DietClass.omnivore
                          ? activeCardColor
                          : inactiveCardColor,

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
                        //Second way
                        selectedDietClass = DietClass.vegetarian;
                      });
                      print('Vegetarian card was pressed');
                    },
                    child: ReuseableCard(
                      //Second way
                      myColor: selectedDietClass == DietClass.vegetarian
                          ? activeCardColor
                          : inactiveCardColor,

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
}
