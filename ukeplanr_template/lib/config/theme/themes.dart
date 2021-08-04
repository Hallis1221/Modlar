import 'package:flutter/material.dart';

class ThemeConfig {
  final ThemeData _orangeTheme = ThemeData(
    backgroundColor: Colors.orange,
  );
  late final Map<String, ThemeData> themes = {"orange": _orangeTheme};
  final String customThemePrefix = "customTheme_";
  Map<String, ThemeData> get getAllThemes => themes;
}
