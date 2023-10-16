// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
// Include the Google Fonts package to provide more text format options
// https://pub.dev/packages/google_fonts
import 'package:google_fonts/google_fonts.dart';
import 'package:robbinlaw/themes/theme.dart';

//https://gallery.flutter.dev/#/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: buildTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Themes Intro'),
      ),
      body: Center(
        child: ElevatedButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Elevated Button');
              },
              child: const Text("ELEVATED BUTTON"),
            ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
    );
  }
}