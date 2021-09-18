import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ukeplanr_template/logic/theme/custom/custom_text_theme.dart';

// !! Each time a new property is added to custom theme it also have to be added to
// !! the toMap extension in extensions/themeData/asMap.dart. and extensios/map/asTheme.dart
class CustomTheme {
  ThemeData theme;
  String themeName;
  late BehaviorSubject<Color> backgroundColor =
      BehaviorSubject<Color>.seeded(theme.backgroundColor);
  late BehaviorSubject<Color> buttonColor =
      BehaviorSubject<Color>.seeded(theme.buttonColor);
  late BehaviorSubject<Color> primaryColor =
      BehaviorSubject<Color>.seeded(theme.primaryColor);

  @Deprecated("This feature is not fully implemented fully")
  late BehaviorSubject<CustomTextTheme> textdTheme =
      BehaviorSubject<CustomTextTheme>.seeded(
    CustomTextTheme(
      textTheme: theme.textTheme,
    ),
  );

  CustomTheme({
    required this.theme,
    required this.themeName,
  });
}
