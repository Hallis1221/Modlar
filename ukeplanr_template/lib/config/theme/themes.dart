import 'package:flutter/material.dart';

class ThemeConfig {
  final ThemeData _orangeTheme = ThemeData(
    backgroundColor: Colors.orange,
  );

  late final Map<String, ThemeData> themes = {"orange": _orangeTheme};
  Map<String, ThemeData> get getAllThemes => themes;
}
