//This MyFourthPage demonstrates the use of the icons
//but as another "custom widget"
//inside the ReuseableCard custom widget.
//No functionality yet.

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class MyFourthPage extends StatefulWidget {
  @override
  MyFourthPageState createState() => MyFourthPageState();
}

class MyFourthPageState extends State<MyFourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                    reusableCardChild: MyIcon(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                    reusableCardChild: MyIcon(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
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

class MyIcon extends StatelessWidget {
  const MyIcon({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({required this.myColor, this.reusableCardChild});

  final Color myColor;

  final Widget? reusableCardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: reusableCardChild,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: myColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
