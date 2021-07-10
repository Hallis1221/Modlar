import 'package:flutter/material.dart';

class ThemesService {
  final ThemeData? defaultTheme;

  ThemeData? get getDefaultTheme => defaultTheme;
  ThemeData? get getTheme => _findTheme();

  ThemeData? _findTheme() {
    return this.getDefaultTheme;
  }

  ThemesService({
    @required this.defaultTheme,
  });
}
