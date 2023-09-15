//This app shows themes in this main file.
//By default flutter uses a light blue theme.

//Themes documentation from flutter
//https://flutter.dev/docs/cookbook/design/themes

import 'package:flutter/material.dart';

//This MyFirstPage demonstrates the tree
//without any "custom widgets".
import 'package:robbinlaw/views/first.dart';

//This MySecondPage demonstrates the use
//of "custom widgets" to reuse code.
//It displays the same as the MyFirstPage.
//It also shows the diff between const vs final.
import 'package:robbinlaw/views/second.dart';

//This MyThirdPage demonstrates the use of Icons from pub.dev.
import 'package:robbinlaw/views/third.dart';

//This MyFourthPage demonstrates the use of the icons
//but as another "custom widget"
//inside the ReuseableCard custom widget.
//No functionality yet.
import 'package:robbinlaw/views/fourth.dart';

//This MyFifthPage demonstrates the use of both custom widgets
//but now they are both modularized into their own
//my-icon.dart and reusable-card.dart files.
//Also shows the use of enums
//and the Ternary Operator.
//Also functionality with GestureDetector and setSate.
import 'package:robbinlaw/views/fifth.dart';

//This MySixthPage demonstrates the use of both custom widgets
//but now they are both modularized into their own
//my-icon.dart and reusable-card.dart files.
//Also shows the use of enums
//and the Ternary Operator.
//Also functionality with GestureDetector and setSate.
import 'package:robbinlaw/views/sixth.dart';

//This MySeventhPage demonstrates passing functions as args
//as the ReuseableCard class has been enhanced to include
//the GestureDetector and its onpressed property as a parm.
//Also the use of a slider.
//Also all constants are modularized into their own file.
import 'package:robbinlaw/views/seventh.dart';

//This MyEighthPage demonstrates yet another custom
//widget called RoundIconButton which makes use
//of RawMaterialButton to compose a new widget from
//basic components.
import 'package:robbinlaw/views/eighth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //.dark() gives the material app dark theme
      //.copyWith() allows us to change only certain
      //dark theme defaults.
      theme: ThemeData.dark().copyWith(
        //the 0xFF is the transparency (opaqe),
        //then 0B Red, 10 Green, 34 Blue
        primaryColor: Color(0xFF0B1034),
        scaffoldBackgroundColor: Colors.blueGrey[800],
      ),
      //home: MyFirstPage(),
      //home: MySecondPage(),
      //home: MyThirdPage(),
      //home: MyFourthPage(),
      //home: MyFifthPage(),
      //home: MySixthPage(),
      //home: MySeventhPage(),
      home: MyEighthPage(),
    );
  }
}
