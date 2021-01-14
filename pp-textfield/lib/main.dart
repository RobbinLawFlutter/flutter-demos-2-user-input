//ListView Widget of the Week
//https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

//TextEditingController Widget
//https://api.flutter.dev/flutter/widgets/TextEditingController-class.html

//TextField Widget
//https://api.flutter.dev/flutter/material/TextField-class.html

import 'package:flutter/material.dart';

// This app does
void main() => runApp(App());

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter Your Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<String> listItems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("TextField and ListView.builder Demo"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: eCtrl,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    print(value);
                  },
                  onSubmitted: (text) {
                    listItems.add(text);
                    eCtrl.clear();
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: listItems.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Text(
                          listItems[index],
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
