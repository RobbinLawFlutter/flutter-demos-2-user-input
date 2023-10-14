// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/themes/colorScheme.dart';
import 'package:robbinlaw/themes/textTheme.dart';

// https://api.flutter.dev/flutter/material/Switch-class.html

// https://api.flutter.dev/flutter/material/SwitchThemeData-class.html

SwitchThemeData buildSwitchTheme(SwitchThemeData original) {
  return SwitchThemeData(
    trackColor: trackColor,
    thumbColor: thumbColor,
    thumbIcon: thumbIcon,
    overlayColor: overlayColor,
  );
}

final MaterialStateProperty<Color?> trackColor =
    MaterialStateProperty.resolveWith<Color?>(
  (Set<MaterialState> states) {
    // Track color when the switch is selected.
    if (states.contains(MaterialState.selected)) {
      return colorScheme.primary;
      //return Colors.amber;
    }
    return null;
  },
);

final MaterialStateProperty<Color?> thumbColor =
    MaterialStateProperty.resolveWith<Color?>(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return colorScheme.onPrimary;
      //return Colors.green;
    }
    return null;
  },
);

final MaterialStateProperty<Icon?> thumbIcon =
    MaterialStateProperty.resolveWith<Icon?>(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  },
);

final MaterialStateProperty<Color?> overlayColor =
    MaterialStateProperty.resolveWith<Color?>(
  (Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.amber.withOpacity(0.54);
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey.shade400;
    }
    // Otherwise return null to set default color
    // for remaining states such as when the
    // switch is hovered, focused, or disabled.
    return null;
  },
);
