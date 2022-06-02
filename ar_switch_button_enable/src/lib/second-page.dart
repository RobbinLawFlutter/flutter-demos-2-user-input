import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = '';

  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
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
                          //Here we DO reset the count.
                          _timesClicked = 0;
                          _msg1 = 'Enabled';
                          print('_enabled is true');
                        } else {
                          //_msg1 = 'Disabled';
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
                //With an MaterialButton whose onPressed = null
                //will make the button disappear.
                //The text may still show but greyed out
                //unless it is "".
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
