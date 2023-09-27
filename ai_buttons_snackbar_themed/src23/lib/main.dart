
// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/theme.dart';

// SnackBar
//https://api.flutter.dev/flutter/material/SnackBar-class.html

// ScaffoldMessenger Widget of the Week
//https://youtu.be/lytQi-slT5Y

//Proper use of the ScaffoldMessenger.of
//https://docs.flutter.dev/release/breaking-changes/scaffold-messenger

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Snackbar Demo',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
      theme: buildTheme(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Snackbar Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Text Button');
              },
              child: const Text(
                'TEXT BUTTON',
                //style: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Outlined Button');
              },
              child: const Text("OUTLINED BUTTON"),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Elevated Button');
              },
              child: const Text("ELEVATED BUTTON"),
            ),
            SnackbarButton(),
          ],
        ),
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // building the snackBar
        dynamic snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          //behavior: SnackBarBehavior.fixed,
          //duration: const Duration(seconds: 10),
          content: const Row(
            children: [
              Icon(Icons.favorite),
              SizedBox(
                width: 10,
              ),
              Text('Hey There'),
            ],
          ),
          action: SnackBarAction(
            label: 'Click Me',
            onPressed: () {
              print('hey you clicked on the snackbar Action');
            },
          ),
        );
        // Displaying the snackBar.
        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('SHOW SNACKBAR'),
    );
  }
}
