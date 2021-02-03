import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  bool _enabled = false;
  String _msg1 = '';

  @override
  Widget build(BuildContext context) {
    print('The build is being RUN');
    return Scaffold(
      appBar: AppBar(
        title: Text('Disapearing Button Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Enable Button'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          _msg1 = 'Enabled';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
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
                          print('Button Pressed');
                        }
                      : null,
                  //The text of the button works separately from the button
                  //itself so we must update it when the switch is changed.
                  child: Text(_msg1),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hey This Is Fun'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
