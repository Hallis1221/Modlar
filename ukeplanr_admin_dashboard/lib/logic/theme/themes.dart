import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LogsConfig {
  final ThemeData defaultTheme;

  ThemeData get getDefaultTheme => defaultTheme;

  LogsConfig({
    @required this.defaultTheme,
  });
}
