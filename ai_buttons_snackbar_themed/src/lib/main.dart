//Proper use of the Scaffold.of
//https://medium.com/@ksheremet/flutter-showing-snackbar-within-the-widget-that-builds-a-scaffold-3a817635aeb2

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Snackbar Demo',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
      theme: buildShrineTheme(),
    );
  }
}

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Snackbar Demo'),
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
              child: Text(
                'TEXT BUTTON',
                //style: TextStyle(color: Colors.green),
              ),
            ),
            SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Outlined Button');
              },
              child: Text("OUTLINED BUTTON"),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                print('You Clicked the Contained Button');
              },
              child: Text("CONTAINED BUTTON"),
            ),
            SnackbarButton(),
          ],
        ),
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
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

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text('SHOW SNACKBAR'),
    );
  }
}
