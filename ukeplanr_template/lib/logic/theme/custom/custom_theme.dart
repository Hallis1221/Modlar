import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_color_scheme.dart';

// !! Each time a new property is added to custom theme it also have to be added to
// !! the toMap extension in extensions/themeData/asMap.dart. and extensios/map/asTheme.dart
class CustomTheme {
  ThemeData theme;
  String themeName;
  late BehaviorSubject<Color> backgroundColor =
      BehaviorSubject<Color>.seeded(theme.backgroundColor);

  late BehaviorSubject<Color> primaryColor =
      BehaviorSubject<Color>.seeded(theme.primaryColor);

  late BehaviorSubject<CustomColorScheme> colorScheme =
      BehaviorSubject<CustomColorScheme>.seeded(
    CustomColorScheme(
      colorScheme: theme.colorScheme,
    ),
  );

  CustomTheme({
    required this.theme,
    required this.themeName,
  });
}
