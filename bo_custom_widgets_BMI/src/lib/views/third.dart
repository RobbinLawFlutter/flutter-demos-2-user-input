//This MyThirdPage demonstrates the use of Icons from pub.dev.
//Go to pub.dev and search for font_awesome_flutter
//package and download and configure pubspec.yaml.

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class MyThirdPage extends StatefulWidget {
  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
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
                  child: ReuseableCard(
                    myColor: activeCardColor,
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    myColor: activeCardColor,
                    reusableCardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                      ],
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
          Expanded(
            child: Row(
              children: const <Widget>[
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
