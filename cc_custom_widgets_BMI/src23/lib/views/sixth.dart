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

enum Gender {
  notdeterminedyet,
  male,
  female,
}

class MySixthPage extends StatefulWidget {
  @override
  MySixthPageState createState() => MySixthPageState();
}

class MySixthPageState extends State<MySixthPage> {
  Gender selectedGender = Gender.notdeterminedyet;
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
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
                        selectedGender = Gender.male;
                      });
                      print('Male card was pressed');
                    },
                    child: ReuseableCard(
                      //Second way using terinary operator.
                      myColor: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,

                      reusableCardChild: MyIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //Second way
                        selectedGender = Gender.female;
                      });
                      print('Female card was pressed');
                    },
                    child: ReuseableCard(
                      //Second way
                      myColor: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,

                      reusableCardChild: MyIcon(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
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
