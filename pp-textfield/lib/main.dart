//ListView Widget of the Week
//https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

//TextEditingController Widget
//https://api.flutter.dev/flutter/widgets/TextEditingController-class.html

//TextFormField Widget
//https://api.flutter.dev/flutter/material/TextFormField-class.html

import 'package:flutter/material.dart';

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
      theme: _buildShrineTheme(),
      home: Scaffold(
        //backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("TextFormField and ListView.builder Demo"),
          //backgroundColor: Colors.blueGrey[900],
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
                      !input.contains('@') ? 'must include @' : null,
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
                  maxLength: 10,
                  decoration: InputDecoration(
                    icon: Icon(Icons.emoji_emotions),
                    labelText: 'password',
                    helperText: 'min 8 characters',
                    //errorText: 'Error message',
                    suffixIcon: Icon(
                      Icons.handyman_sharp,
                    ),
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
                      child: RaisedButton(
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

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: shrineBrown900);
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    accentColor: shrineBrown900,
    primaryColor: shrinePink100,
    buttonColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    textSelectionColor: shrinePink100,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: defaultLetterSpacing,
        ),
        title: base.title.copyWith(
          fontSize: 18,
          letterSpacing: defaultLetterSpacing,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: defaultLetterSpacing,
        ),
        body1: base.body1.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        subhead: base.subhead.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        display1: base.display1.copyWith(
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
