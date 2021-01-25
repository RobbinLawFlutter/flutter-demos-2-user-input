import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';
import 'package:robbinlaw/first_page.dart';
//import 'second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Button Enable Demo',
      debugShowCheckedModeBanner: false,
      home: MyFirstPage(),
      theme: buildShrineTheme(),
    );
  }
}
