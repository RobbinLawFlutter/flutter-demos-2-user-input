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
                    print('Submitted Email Text = $text');
                    setState(() {});
                  },
                  validator: (input) =>
                      input.contains('@') ? null : 'must include @',
                  onSaved: (input) => _email = input,
                  cursorColor: Theme.of(context).cursorColor,
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
                    print('Submitted Password Text = $text');
                    setState(() {});
                  },
                  validator: (input) => input.length < 8 ? 'min 8 chars' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                  cursorColor: Theme.of(context).cursorColor,
                  maxLength: 20,
                  decoration: InputDecoration(
                    icon: Icon(Icons.emoji_emotions),
                    labelText: 'password',
                    helperText: 'min 8, max 20',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: listItems.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Text(
                        listItems[index],
                      );
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      listItems.add('email = $_email , password = $_password');
      textEditingController.clear();
      textEditingController1.clear();
      setState(() {});
    }
  }
}
