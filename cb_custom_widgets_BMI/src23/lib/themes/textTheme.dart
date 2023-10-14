// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';

// https://api.flutter.dev/flutter/material/TextTheme-class.html

// https://api.flutter.dev/flutter/painting/TextStyle-class.html

TextTheme buildTextTheme(TextTheme original) {
  return original
      .copyWith(
        displayLarge: buildTextStyle(Colors.green),
        displayMedium: buildTextStyle(Colors.green),
        displaySmall: buildTextStyle(Colors.green),
        headlineMedium: buildTextStyle(Colors.green),
        //Used for large text in dialogs
        //(e.g., the month and year in the dialog shown by showDatePicker)
        headlineSmall: buildTextStyle(Colors.green),
        //Used for the primary text in app bars and dialogs
        //(e.g., AppBar.title and AlertDialog.title).
        titleLarge: buildTextStyle(Colors.purple),
        //Used for the primary text in lists (e.g., ListTile.title)
        //and the TextField edited text.
        titleMedium: buildTextStyle(Colors.amber),
        //For medium emphasis text that's a little smaller than subtitle1
        titleSmall: buildTextStyle(Colors.cyan),
        //Used for emphasizing text that would otherwise be bodyText2.
        bodyLarge: buildTextStyle(Colors.blue),
        //The default text style for material.
        //Color for ListTile.trailing
        bodyMedium: buildTextStyle(Colors.green),
        //Used for auxiliary text with images.
        //Used for ListTile.subtile
        bodySmall: buildTextStyle(Colors.green),
        //Used for text on ElevatedButton, TextButton, and OutlinedButton
        //if no others
        labelLarge: buildTextStyle(Colors.green),
      )
      .apply(
        fontFamily: 'Rubik',
        //The displayColor is applied to [headline4], [headline3],
        //[headline2], [headline1], and [caption]
        displayColor: colorScheme.onPrimary,
        //The bodyColor is applied to the remaining text styles.
        bodyColor: colorScheme.onPrimary,
      );
}

TextStyle buildTextStyle(Color color,
    {double size = 16.0, FontWeight weight = FontWeight.w500}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: weight,
    letterSpacing: defaultLetterSpacing,
  );
}

const defaultLetterSpacing = 0.09;
