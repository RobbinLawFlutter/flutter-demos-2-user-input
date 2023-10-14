// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:robbinlaw/views/view1.dart';
import 'package:robbinlaw/views/view2.dart';

class View0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('View 0'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text(
                'Go To View 1',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 48,
                ),
              ),
              onPressed: () {
                //Navigate to View 1
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View1(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text(
                'Go To View 2',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 48,
                ),
              ),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => View2(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
