// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';
import 'package:robbinlaw/first_page.dart';
import 'package:robbinlaw/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Enable Demo',
      debugShowCheckedModeBanner: false,
      //home: MyFirstPage(),
      home: MySecondPage(),
      theme: buildShrineTheme(),
    );
  }
}
