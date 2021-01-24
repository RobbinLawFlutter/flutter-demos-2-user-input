import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Themed Demo',
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
        title: Text('Buttons Snackbar Themed Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                'TEXT BUTTON',
              ),
            ),
            SizedBox(height: 8.0),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("OUTLINED BUTTON"),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
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
          content: Text('Text label'),
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              print('hey you clicked on the snackbar Action');
            },
          ),
        );

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Text('Show SnackBar'),
    );
  }
}
