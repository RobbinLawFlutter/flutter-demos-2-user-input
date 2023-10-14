// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:robbinlaw/widgets/reusable-card-simple.dart';
import 'package:robbinlaw/widgets/my-icon.dart';
import 'package:robbinlaw/constants.dart';

// This MySixthPage demonstrates the
// use of a Ternary Operator instead of the
// updateColor() method.

enum DietClass {
  notdeterminedyet('Not Determined'),
  omnivore('Omnivore'),
  vegetarian('Vegetarian');

const DietClass(this.dietClassString);
final String dietClassString;
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
                    child: ReuseableCardSimple(
                      //Second way using terinary operator.
                      myColor: selectedDietClass == DietClass.omnivore
                          ? kActiveCardColor
                          : kInactiveCardColor,

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
                    child: ReuseableCardSimple(
                      //Second way
                      myColor: selectedDietClass == DietClass.vegetarian
                          ? kActiveCardColor
                          : kInactiveCardColor,

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
