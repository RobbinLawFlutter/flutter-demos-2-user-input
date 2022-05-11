import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';
import 'package:robbinlaw/first-page.dart';
import 'package:robbinlaw/second-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Enable Demo',
      debugShowCheckedModeBanner: false,
      home: MyFirstPage(),
      //home: MySecondPage(),
      theme: buildShrineTheme(),
    );
  }
}
