import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = '';
  String _msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App2'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Enable Buttons'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          if (_timesClicked == 0) {
                            _msg1 = 'Click Me';
                          } else {
                            _msg1 = 'Clicked $_timesClicked';
                          }
                          _msg2 = 'Reset';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 8,
                  color: shrinePink100,
                  padding: EdgeInsets.all(15.0),
                  onPressed: _enabled
                      ? () {
                          setState(() {
                            _timesClicked++;
                            _msg1 = 'Clicked $_timesClicked';
                            print('clicked $_timesClicked');
                          });
                        }
                      : null,
                  child: Text(_msg1),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 8,
                  color: shrinePink100,
                  padding: EdgeInsets.all(15.0),
                  onPressed: _enabled
                      ? () {
                          setState(() {
                            _timesClicked = 0;
                            _msg1 = 'Click Me';
                            print('Reset Pressed');
                          });
                        }
                      : null,
                  child: Text(_msg2),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hey This Is Fun'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
