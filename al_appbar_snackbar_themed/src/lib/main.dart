//Proper use of the Scaffold.of
//https://medium.com/@ksheremet/flutter-showing-snackbar-within-the-widget-that-builds-a-scaffold-3a817635aeb2

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Button Demo',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
      theme: buildShrineTheme(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Button Demo'),
        actions: [
          // ElevatedButton(
          //   onPressed: () {
          //     final snackBar = SnackBar(
          //       behavior: SnackBarBehavior.floating,
          //       content: Row(
          //         children: [
          //           Icon(Icons.favorite),
          //           SizedBox(
          //             width: 10,
          //           ),
          //           Text('Hey There'),
          //         ],
          //       ),
          //       action: SnackBarAction(
          //         label: 'Click Me',
          //         onPressed: () {
          //           print('hey you clicked on the snackbar Action');
          //         },
          //       ),
          //     );

          //     // Find the Scaffold in the widget tree and use
          //     // it to show a SnackBar.
          //     Scaffold.of(context).showSnackBar(snackBar);
          //   },
          //   //child: Text('Show SnackBar'),
          //   child: Icon(Icons.favorite),
          // ),
          SnackbarButton(),
        ],
      ),
      body: Center(),
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
      //child: Text('Show SnackBar'),
      child: Icon(Icons.favorite),
    );
  }
}
