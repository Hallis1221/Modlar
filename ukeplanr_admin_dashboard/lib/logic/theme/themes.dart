import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ThemeConfig {
  final ThemeData defaultTheme;

  ThemeData get getDefaultTheme => defaultTheme;
  ThemeData get getTheme => _findTheme();

  ThemeData _findTheme() {
    return this.getDefaultTheme;
  }

  ThemeConfig({
    @required this.defaultTheme,
  });
}
