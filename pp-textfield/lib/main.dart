//ListView Widget of the Week
//https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

//TextEditingController Widget
//https://api.flutter.dev/flutter/widgets/TextEditingController-class.html

//TextFormField Widget
//https://api.flutter.dev/flutter/material/TextFormField-class.html

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/shrinetheme.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  List<String> listItems = [];
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController1 = TextEditingController();
  @override
  Widget build(BuildContext ctxt) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildShrineTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextFormField and ListView.builder Demo"),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: textEditingController,
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (text) {
                    listItems.add(text);
                    //textEditingController.clear();
                    setState(() {});
                  },
                  validator: (input) =>
                      input.contains('@') ? null : 'must include @',
                  onSaved: (input) => _email = input,
                  cursorColor: Theme.of(context).cursorColor,
                  //initialValue: 'Input text',
                  maxLength: 20,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                    labelText: 'email',
                    helperText: 'must include @',
                    suffixIcon: Icon(
                      Icons.check_circle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: textEditingController1,
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (text) {
                    listItems.add(text);
                    //textEditingController1.clear();
                    setState(() {});
                  },
                  validator: (input) =>
                      input.length < 8 ? 'min 8 characters' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                  cursorColor: Theme.of(context).cursorColor,
                  //initialValue: 'Input text',
                  maxLength: 20,
                  decoration: InputDecoration(
                    icon: Icon(Icons.emoji_emotions),
                    labelText: 'password',
                    helperText: 'min 8 characters',
                    //errorText: 'Error message',
                    // suffixIcon: Icon(
                    //   Icons.handyman_sharp,
                    // ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          //color: Color(0xFF6200EE),
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text('Sign in'),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),

        // Column(
        //   children: <Widget>[
        //     Container(
        //       padding: EdgeInsets.all(20.0),
        //       child: TextField(
        //         controller: textEditingController,
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30,
        //         ),
        //         decoration: kTextFieldInputDecoration,
        //         onChanged: (value) {
        //           print(value);
        //         },
        //         onSubmitted: (text) {
        //           listItems.add(text);
        //           textEditingController.clear();
        //           setState(() {});
        //         },
        //       ),
        //     ),
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: listItems.length,
        //         itemBuilder: (BuildContext ctxt, int index) {
        //           return Text(
        //             listItems[index],
        //             style: TextStyle(
        //               fontSize: 30,
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print(_email);
      print(_password);
      textEditingController.clear();
      textEditingController1.clear();
    }
  }
}

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.thumb_up,
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
