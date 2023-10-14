import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

const kBottomContainerHeight = 80.0;
Color kActiveCardColor = colorScheme.primary;
Color kInactiveCardColor = colorScheme.secondary;
Color kBottomContainerColor = colorScheme.onPrimary;
Color kTextColor = colorScheme.onSecondary;


TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: kTextColor,
);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);