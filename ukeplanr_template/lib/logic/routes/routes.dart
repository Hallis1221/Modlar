import 'package:flutter/material.dart';

class ThemesService {
  final Map<String, Widget>? defaultTheme;

  Map<String, Widget>? get getDefaultTheme => defaultTheme;
  Map<String, Widget>? get getTheme => _findTheme();

  Map<String, Widget>? _findTheme() {
    return this.getDefaultTheme;
  }

  ThemesService({
    @required this.defaultTheme,
  });
}
