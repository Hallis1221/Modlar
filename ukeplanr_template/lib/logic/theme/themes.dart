import 'package:flutter/material.dart';

class ThemesService {
  final Map<String?, ThemeData?> themes;

  Map<String?, ThemeData?> get themesList => themes;

  ThemeData? findTheme(String themeName) {
    return this.themesList[themeName];
  }

  ThemesService({required this.themes});
}
