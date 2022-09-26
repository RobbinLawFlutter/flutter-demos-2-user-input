//Do not change this file in any way.

import 'package:flutter/material.dart';

ThemeData buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    inputDecorationTheme: _inputDecorationTheme(base.inputDecorationTheme),
    textSelectionTheme: _textSelectionThemeData(),
    toggleableActiveColor: shrinePink400,
    primaryColor: shrinePink100,
    scaffoldBackgroundColor: shrineBackgroundWhite,
    cardColor: shrineBackgroundWhite,
    errorColor: shrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: _shrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
    colorScheme: _shrineColorScheme.copyWith(secondary: shrineBrown900),
  );
}

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme original) {
  return original.copyWith(
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    //floatingLabelBehavior: FloatingLabelBehavior.auto,
    //constraints: BoxConstraints(maxWidth: 150),
    // borders
    enabledBorder: _buildBorderStyle(_shrineColorScheme.primary),
    errorBorder: _buildBorderStyle(_shrineColorScheme.error),
    focusedErrorBorder: _buildBorderStyle(_shrineColorScheme.error),
    focusedBorder: _buildBorderStyle(_shrineColorScheme.primary),
    disabledBorder: _buildBorderStyle(Colors.black26),
    // text
    suffixStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    counterStyle: _buildTextStyle(_shrineColorScheme.onPrimary, size: 12.0),
    floatingLabelStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    errorStyle: _buildTextStyle(_shrineColorScheme.error),
    hintStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    helperStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    labelStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    prefixStyle: _buildTextStyle(_shrineColorScheme.onPrimary),
    iconColor: _shrineColorScheme.onPrimary,
  );
}

TextSelectionThemeData _textSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: _shrineColorScheme.onPrimary,
  );
}

OutlineInputBorder _buildBorderStyle(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: color,
      width: 2.0,
    ),
  );
}

TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
}

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: _shrineColorScheme.onPrimary);
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: _shrineColorScheme.onPrimary,
        bodyColor: _shrineColorScheme.onPrimary,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  onPrimary: shrineBrown900,
  secondary: shrinePink50,
  onSecondary: shrineBrown900,
  surface: shrineSurfaceWhite,
  onSurface: shrineBrown900,
  background: shrineBackgroundWhite,
  onBackground: shrineBrown900,
  error: shrineErrorRed,
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
