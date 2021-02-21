//This MySixthPage demonstrates the use of both custom widgets
//but now they are both modularized into their own
//my-icon.dart and reusable-card.dart files.
//Also shows the use of enums
//and the Ternary Operator.
//Also functionality with GestureDetector and setSate.

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
  male,
  female,
}

class MySixthPage extends StatefulWidget {
  @override
  _MySixthPageState createState() => _MySixthPageState();
}

class _MySixthPageState extends State<MySixthPage> {
  Gender selectedGender;
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
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
          Expanded(
            child: ReuseableCard(
              myColor: activeCardColor,
            ),
          ),
          Expanded(
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
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
