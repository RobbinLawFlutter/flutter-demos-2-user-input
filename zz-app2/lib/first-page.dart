import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

final formKey = GlobalKey<FormState>();
String firstName;
final TextEditingController textEditingController = TextEditingController();

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
      body: Column(
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
            height: 5,
          ),
          Container(
            //height: 200,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingController,
                      onChanged: (value) {
                        print(value);
                      },
                      onFieldSubmitted: (text) {
                        print('Submitted Name Text = $text');
                        //setState(() {});
                      },
                      validator: (input) =>
                          input.length < 1 ? 'min 1 chars' : null,
                      onSaved: (input) => firstName = input,
                      //cursorColor: Theme.of(context).cursorColor,
                      maxLength: 20,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.hourglass_top_sharp),
                        labelText: 'first name',
                        helperText: 'min 1, max 20',
                        suffixIcon: Icon(
                          Icons.check_circle,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SnackbarButton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackbarButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          textEditingController.clear();
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
          Scaffold.of(context).showSnackBar(snackBar);
        }
      },
      //child: Text('Show SnackBar'),
      child: Text('Submit'),
    );
  }
}
