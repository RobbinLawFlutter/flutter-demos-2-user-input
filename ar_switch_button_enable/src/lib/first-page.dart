import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  int _timesClicked = 0;
  String _msg1 = 'Disabled';
  //String _msg1 = '';

  @override
  Widget build(BuildContext context) {
    print('The build method is being RUN');
    return Scaffold(
      appBar: AppBar(
        title: Text('Enable Button Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Enable Button'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      setState(() {
                        _enabled = onChangedValue;
                        if (_enabled) {
                          //Here we DO NOT reset the count.
                          _msg1 = 'Enabled';
                          print('_enabled is true');
                        } else {
                          _msg1 = 'Disabled';
                          //_msg1 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //With an ElevatedButton whose onPressed = null
                //will give a greyed out disabled button, but
                //it will NOT disappear.
                //We can only achieve the disappearing nature
                //with a MaterialButton, as second-page shows.
                ElevatedButton(
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
