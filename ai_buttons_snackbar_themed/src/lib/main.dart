//Proper use of the Scaffold.of
//https://medium.com/@ksheremet/flutter-showing-snackbar-within-the-widget-that-builds-a-scaffold-3a817635aeb2

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Snackbar Demo',
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
      theme: buildShrineTheme(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
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
                print('You Clicked the Contained Button');
              },
              child: const Text("CONTAINED BUTTON"),
            ),
            const SnackbarButton(),
          ],
        ),
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  const SnackbarButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: const [
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

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: const Text('SHOW SNACKBAR'),
    );
  }
}
