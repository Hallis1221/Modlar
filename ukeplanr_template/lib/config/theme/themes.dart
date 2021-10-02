import 'package:flutter/material.dart';

// when adding stuff here it will be overwritten by theme changers
// such as the one in UI/screens/testing/theme/newTheme.dart
// to avoid this, carry over the values there.

class ThemeConfig {
  final ThemeData _orangeTheme = ThemeData(
    backgroundColor: Colors.orange,
    fontFamily: "JakartaSans",
    colorScheme: ColorScheme.fromSwatch(
      accentColor: Colors.white,
      cardColor: Colors.blue,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: "JakartaSans",
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  // All the pre made themes and their name
  late final Map<String, ThemeData> themes = <String, ThemeData>{
    "orange": _orangeTheme
  };
  final Color debugColor = Colors.transparent;
  final String customThemePrefix = "customTheme_";
  Map<String, ThemeData> get getAllThemes => themes;
}
