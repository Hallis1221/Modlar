import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemesService {
  final Map<String?, ThemeData?> themes;
  Map<String?, ThemeData?> get themesList => themes;

  // ignore: close_sinks
  final BehaviorSubject<ThemeData?> currentTheme;

  setCurrentTheme(String themeName) {
    currentTheme.value = this.findTheme(themeName);
  }

  addTheme(ThemeData theme, String themeName) {
    this.themesList[themeName] = theme;
  }

  ThemeData? findTheme(String themeName) {
    return this.themesList[themeName];
  }

  ThemesService({required this.themes, required this.currentTheme});
}
